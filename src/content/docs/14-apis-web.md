---
title: "🌐 Unidad 14: Servir y Consumir APIs con Web"
---
> 🗺️ **El mapa del paquete:** 🚪 Bienvenida → ☕ U01 → 🔤 U02 → 🔀 U03 → 🅿️ U04 → 🧩 U05 → ⚡ U06 → 🏗️ U07 → 🔒 U08 → 🧬 U09 → 📚 U10 → 🗺️ U11 → 📁 U12 → 🗄️ U13 → **🌐 AQUÍ ESTÁS (U14)**

🎯 **Objetivos de aprendizaje**
- Entender el modelo petición-respuesta HTTP
- Crear un servidor web mínimo con `HttpServer`
- Servir páginas HTML desde Java
- Procesar formularios y parámetros GET/POST
- Devolver JSON y consumirlo con JavaScript
- Consumir APIs externas con `java.net.http.HttpClient`
- Parsear JSON y manejar errores HTTP
- Conocer frameworks modernos (Javalin, Spring Boot)

## Hola, mundo web

> "Hasta ahora tus programas vivían en la terminal. Es hora de que salgan a Internet. Sin JavaScript frameworks. Sin servidores de aplicaciones. Solo Java y HTTP."

Hemos visto consola, ficheros y hasta bases de datos. Ahora toca lo que hoy en día hace casi cualquier aplicación: **hablar por HTTP**. Y sí, Java puede ser servidor web sin instalar Tomcat ni Spring. Pero además, también puede **consumir** APIs externas como un cliente más.

## 1. El protocolo HTTP en 30 segundos

Cuando escribes `https://google.com` en tu navegador, ocurre esto:

```
Tú (cliente)                  Google (servidor)
    ── GET / HTTP/1.1 ──────────►
    │                              │
    ◄── HTTP/1.1 200 OK ──────────
         Content-Type: text/html
         (el HTML de Google)
```

HTTP es un protocolo de **petición-respuesta**. Tú pides una URL y el servidor te devuelve un recurso (HTML, JSON, imagen, etc.). Eso es todo. El resto (cookies, sesiones, APIs) son capas que se construyen encima.

## 2. Servidor web mínimo con `HttpServer`

Java incluye desde la versión 6 un servidor HTTP básico en el paquete `com.sun.net.httpserver`. No necesitas nada más:

```java
import com.sun.net.httpserver.HttpServer;
import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;

public class ServidorMinimo {
    public static void main(String[] args) throws IOException {
        HttpServer server = HttpServer.create(
            new InetSocketAddress(8080), 0
        );
        server.createContext("/", intercambio -> {
            String resp = "Hola, mundo web!";
            intercambio.sendResponseHeaders(200, resp.length());
            OutputStream os = intercambio.getResponseBody();
            os.write(resp.getBytes());
            os.close();
        });
        server.setExecutor(null);
        server.start();
        System.out.println("Servidor en http://localhost:8080");
    }
}
```

Compila y ejecuta. Abre `http://localhost:8080` en tu navegador. Acabas de crear tu primer servidor web en Java.

## 3. Sirviendo HTML

Devolver texto plano está bien para probar, pero queremos HTML. Vamos a servir una página completa:

```java
server.createContext("/", intercambio -> {
    String html = """
        <!DOCTYPE html>
        <html>
        <head><title>Mi App Java</title>
        <meta charset="UTF-8">
        </head>
        <body>
            <h1>Bienvenido a mi App</h1>
            <p>Esto se sirve desde Java.</p>
        </body>
        </html>
        """;
    intercambio.getResponseHeaders()
        .set("Content-Type", "text/html; charset=UTF-8");
    intercambio.sendResponseHeaders(200, html.getBytes().length);
    intercambio.getResponseBody().write(html.getBytes());
    intercambio.getResponseBody().close();
});
```

También puedes leer HTML desde un fichero con `Files.readString()` y servirlo igual. Así tienes el HTML separado del código Java.

## 4. Parámetros GET: el cliente pregunta

Cuando un formulario se envía por GET, los datos van en la URL: `http://localhost:8080/saludo?nombre=Ana`. Así se leen:

```java
server.createContext("/saludo", intercambio -> {
    String query = intercambio.getRequestURI().getQuery();
    String nombre = "Mundo";
    if (query != null && query.startsWith("nombre=")) {
        nombre = query.split("=")[1];
    }
    String html = "<h1>Hola, " + nombre + "!</h1>";
    intercambio.getResponseHeaders()
        .set("Content-Type", "text/html");
    intercambio.sendResponseHeaders(200, html.getBytes().length);
    intercambio.getResponseBody().write(html.getBytes());
    intercambio.getResponseBody().close();
});
```

> ⚠️ **WARNING**: Esto es frágil. Si el nombre contiene `&` o `%20`, petará. En producción usa `URLDecoder.decode()` y un parser de query params de verdad. Esto es un ejemplo didáctico, no código de producción.

## 5. Formularios POST: el cliente envía datos

Para recibir datos de un formulario POST necesitas leer el cuerpo de la petición:

```java
server.createContext("/procesar", intercambio -> {
    if ("POST".equals(intercambio.getRequestMethod())) {
        byte[] body = intercambio.getRequestBody().readAllBytes();
        String datos = new String(body);
        // datos = "nombre=Ana&edad=25"
        String nombre = extraerParametro(datos, "nombre");
        String respuesta = "<h1>Recibido: " + nombre + "</h1>";
        intercambio.getResponseHeaders()
            .set("Content-Type", "text/html");
        intercambio.sendResponseHeaders(200,
            respuesta.getBytes().length);
        intercambio.getResponseBody()
            .write(respuesta.getBytes());
        intercambio.getResponseBody().close();
    }
});
```

Y el HTML del formulario:

```html
<form action="/procesar" method="POST">
  <input name="nombre" placeholder="Tu nombre">
  <button>Enviar</button>
</form>
```

> **💡 Consejo:** ¿Por qué `"POST".equals(intercambio.getRequestMethod())` y no `intercambio.getRequestMethod().equals("POST")`? Porque si `getRequestMethod()` devuelve `null`, la segunda forma casca con `NullPointerException`. La primera forma es **null-safe**. Es una manía que te ahorrará dolores de cabeza.

## 6. Devolviendo JSON (como una API de verdad)

Las aplicaciones modernas no devuelven HTML directamente. El frontend (JavaScript) pide datos y el backend se los da en JSON. Aquí un ejemplo:

```java
server.createContext("/api/usuarios", intercambio -> {
    String json = """
        [
            {"id":1,"nombre":"Ana","edad":25},
            {"id":2,"nombre":"Luis","edad":30}
        ]
        """;
    intercambio.getResponseHeaders()
        .set("Content-Type", "application/json");
    intercambio.sendResponseHeaders(200, json.getBytes().length);
    intercambio.getResponseBody().write(json.getBytes());
    intercambio.getResponseBody().close();
});
```

Y desde el HTML puedes llamarlo con JavaScript:

```html
<script>
fetch('/api/usuarios')
  .then(r => r.json())
  .then(data => console.log(data));
</script>
```

## 7. Mini proyecto: gestor de tareas (API REST)

Combinando todo, puedes construir una API REST completa. El patrón es:

| Método | Ruta | Acción |
|--------|------|--------|
| GET | `/api/tareas` | Listar todas |
| POST | `/api/tareas` | Crear una |
| PUT | `/api/tareas/1` | Actualizar |
| DELETE | `/api/tareas/1` | Borrar |

Cada ruta se implementa como un contexto en el servidor, y los datos se guardan en un `ArrayList` en memoria (más adelante, en base de datos).

## 8. Consumir APIs externas con `HttpClient`

Hasta ahora has sido el **servidor**. Pero en el mundo real, tus programas también serán **clientes** que llaman a APIs de terceros: GitHub, OpenAI, el tiempo, tu red social favorita...

Java 11 trae `java.net.http.HttpClient` — un cliente HTTP moderno, sin dependencias externas, que soporta HTTP/2, peticiones síncronas y asíncronas, y manejo de cabeceras.

> **📝 Nota:** Antes de Java 11 tenías que usar `HttpURLConnection` (feo, verboso, un castigo) o librerías externas como Apache HttpClient u OkHttp. `java.net.http.HttpClient` llegó para salvar la humanidad.

### 8.1 GET: pedir datos a una API

Empecemos por lo básico: hacer una petición GET a una API pública y leer la respuesta como texto.

```java
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class ClienteGET {
    public static void main(String[] args) throws Exception {
        HttpClient client = HttpClient.newHttpClient();

        HttpRequest request = HttpRequest.newBuilder()
            .uri(URI.create("https://api.github.com/users/octocat"))
            .GET()
            .build();

        HttpResponse<String> response = client.send(
            request, HttpResponse.BodyHandlers.ofString()
        );

        System.out.println("Código: " + response.statusCode());
        System.out.println("Cuerpo: " + response.body());
    }
}
```

> **📝 Nota:** `HttpResponse.BodyHandlers.ofString()` le dice a Java "conviérteme el cuerpo de la respuesta en un String". Hay otros handlers: `ofByteArray()`, `ofInputStream()`, `ofFile(Path)`… según lo que necesites.

### 8.2 Parsear JSON con la librería que toque

El cuerpo que devuelve GitHub es JSON. En Java no hay un parser JSON nativo (sí, es triste, pero es así). Necesitas una librería. Las más usadas:

| Librería | Grupo Maven | Ideal para |
|----------|-------------|-----------|
| **Gson** (Google) | `com.google.code.gson:gson` | Sencilla, mapeo a clases |
| **Jackson** | `com.fasterxml.jackson.core:jackson-databind` | Potente, rápida, estándar industrial |
| **org.json** | `org.json:json` | La más simple, sin mapeo |

En los ejemplos usaremos **Gson**, que es la más intuitiva:

```java
import com.google.gson.Gson;
import com.google.gson.JsonObject;

// ... después de obtener response.body()
Gson gson = new Gson();
JsonObject json = gson.fromJson(response.body(), JsonObject.class);

String login = json.get("login").getAsString();
String nombre = json.get("name").getAsString();
System.out.println("Usuario: " + login + " — " + nombre);
```

O si prefieres mapear a una clase:

```java
record UsuarioGitHub(String login, String name, int public_repos) {}

UsuarioGitHub usuario = gson.fromJson(response.body(), UsuarioGitHub.class);
System.out.println(usuario.name() + " tiene " + usuario.public_repos() + " repos públicos");
```

> ⚠️ **WARNING**: Si la API devuelve campos que no existen en tu `record`, Gson por defecto los ignora. Si tu `record` tiene campos que no están en el JSON, se quedan con valor `null`. Con Jackson puedes configurarlo con `@JsonIgnoreProperties(ignoreUnknown = true)`.

### 8.3 POST: enviar datos a una API

Para enviar datos (crear un recurso, hacer login, etc.) usamos POST con un cuerpo JSON:

```java
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class ClientePOST {
    public static void main(String[] args) throws Exception {
        HttpClient client = HttpClient.newHttpClient();

        String json = """
            {"title": "Aprender HttpClient",
             "body": "Ya casi lo tengo",
             "userId": 1}
            """;

        HttpRequest request = HttpRequest.newBuilder()
            .uri(URI.create("https://jsonplaceholder.typicode.com/posts"))
            .header("Content-Type", "application/json")
            .POST(HttpRequest.BodyPublishers.ofString(json))
            .build();

        HttpResponse<String> response = client.send(
            request, HttpResponse.BodyHandlers.ofString()
        );

        System.out.println("Código: " + response.statusCode());
        System.out.println("Creado: " + response.body());
    }
}
```

> **💡 Consejo:** `HttpRequest.BodyPublishers` tiene métodos para enviar String, byte[], archivos, etc. El más común es `ofString()` para JSON. Si no pones el header `Content-Type: application/json`, el servidor puede rechazar tu petición o interpretar mal el cuerpo.

### 8.4 Cabeceras, timeouts y manejo de errores

Las APIs no siempre se portan bien. A veces tardan, a veces se caen, a veces te devuelven 401, 403, 404 o 500. Tu código debe estar preparado.

```java
import java.net.http.HttpConnectTimeoutException;
import java.time.Duration;

HttpClient client = HttpClient.newBuilder()
    .connectTimeout(Duration.ofSeconds(10))   // tiempo máximo para conectar
    .build();

HttpRequest request = HttpRequest.newBuilder()
    .uri(URI.create("https://api.github.com/users/someone"))
    .header("Accept", "application/vnd.github+json")
    .header("User-Agent", "MiAppJava/1.0")
    .timeout(Duration.ofSeconds(15))          // tiempo máximo para recibir respuesta
    .GET()
    .build();

try {
    HttpResponse<String> response = client.send(request,
        HttpResponse.BodyHandlers.ofString());

    int codigo = response.statusCode();
    if (codigo >= 200 && codigo < 300) {
        System.out.println("Éxito: " + response.body());
    } else if (codigo == 404) {
        System.out.println("El recurso no existe.");
    } else if (codigo == 403) {
        System.out.println("Prohibido. ¿Token necesario?");
    } else if (codigo >= 500) {
        System.out.println("Error del servidor. Vuelve a intentarlo.");
    }
} catch (HttpConnectTimeoutException e) {
    System.out.println("El servidor no responde (timeout de conexión).");
} catch (java.net.http.HttpTimeoutException e) {
    System.out.println("La respuesta tardó demasiado.");
} catch (java.io.IOException e) {
    System.out.println("Error de red: " + e.getMessage());
} catch (InterruptedException e) {
    System.out.println("La petición fue interrumpida.");
}
```

> ⚠️ **WARNING**: Muchas APIs públicas (GitHub, Twitter, etc.) requieren un **token de autenticación** en la cabecera `Authorization`. Sin él, tienes cuotas muy bajas (rate limiting) o acceso denegado. Si ves un 403, probablemente necesitas registrar una aplicación y obtener un token.

Aquí tienes las cabeceras más comunes que enviarás:

| Cabecera | Propósito |
|----------|-----------|
| `Content-Type` | Tipo de datos que envías (`application/json`) |
| `Accept` | Tipo de datos que esperas recibir |
| `Authorization` | Token Bearer, Basic Auth, etc. |
| `User-Agent` | Identifica tu aplicación (muchas APIs lo exigen) |
| `Cache-Control` | Control de caché |

### 8.5 Ejemplo completo: consultar repos de GitHub

Vamos a juntarlo todo: consumir la API de GitHub para listar los repositorios de un usuario.

```java
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;

public class GitHubRepos {
    public static void main(String[] args) throws Exception {
        String usuario = args.length > 0 ? args[0] : "octocat";

        HttpClient client = HttpClient.newBuilder()
            .connectTimeout(Duration.ofSeconds(10))
            .build();

        HttpRequest request = HttpRequest.newBuilder()
            .uri(URI.create("https://api.github.com/users/" + usuario + "/repos"))
            .header("Accept", "application/vnd.github+json")
            .header("User-Agent", "JavaCliente/1.0")
            .timeout(Duration.ofSeconds(15))
            .GET()
            .build();

        HttpResponse<String> response = client.send(request,
            HttpResponse.BodyHandlers.ofString());

        if (response.statusCode() == 200) {
            Gson gson = new Gson();
            JsonArray repos = gson.fromJson(response.body(), JsonArray.class);

            System.out.println("Repositorios de " + usuario + ":");
            System.out.println("────────────────────────────────");
            for (int i = 0; i < repos.size(); i++) {
                JsonObject repo = repos.get(i).getAsJsonObject();
                String nombre = repo.get("name").getAsString();
                String lenguaje = repo.has("language")
                    && !repo.get("language").isJsonNull()
                    ? repo.get("language").getAsString()
                    : "?";
                int estrellas = repo.get("stargazers_count").getAsInt();
                System.out.printf("⭐ %s (%s) ★ %d%n", nombre, lenguaje, estrellas);
            }
        } else if (response.statusCode() == 403) {
            System.out.println("Rate limit alcanzado. Espera un minuto.");
        } else {
            System.out.println("Error " + response.statusCode()
                + " — ¿existe el usuario " + usuario + "?");
        }
    }
}
```

> **📝 Nota:** Fíjate en `repo.has("language") && !repo.get("language").isJsonNull()`. En JSON un campo puede existir pero valer `null`. Si intentas `getAsString()` sobre un `null`, Gson te lanza una excepción. Este patrón es muy común al parsear APIs reales.

Ejemplo de salida:

```
Repositorios de octocat:
────────────────────────────────
⭐ Hello-World (Java) ★ 2727
⭐ Spoon-Knife (HTML) ★ 13291
⭐ Octocat (?) ★ 5
```

### 8.6 Llamadas Asíncronas con `sendAsync`

Si necesitas hacer varias peticiones sin bloquear el programa, `HttpClient` también soporta modo asíncrono:

```java
CompletableFuture<HttpResponse<String>> futuro = client.sendAsync(
    request, HttpResponse.BodyHandlers.ofString()
);

// Mientras tanto, puedes hacer otras cosas...
System.out.println("Esperando respuesta...");

// Cuando llegue:
futuro.thenAccept(response -> {
    System.out.println("Código: " + response.statusCode());
    System.out.println(response.body());
});

// O bloquear hasta que llegue (no recomendado si vas justo de tiempo):
HttpResponse<String> resp = futuro.get();
```

> **💡 Consejo:** `sendAsync` devuelve un `CompletableFuture`, que es la forma elegante de Java para trabajar con código asíncrono sin liarte con hilos manuales. Puedes encadenar varias llamadas con `thenApply`, `thenCompose`, etc.

### 8.7 PUT, DELETE y Otros Métodos

`HttpClient` soporta todos los métodos HTTP. La diferencia es la llamada al builder:

```java
// PUT
HttpRequest putRequest = HttpRequest.newBuilder()
    .uri(URI.create("https://api.ejemplo.com/recursos/1"))
    .header("Content-Type", "application/json")
    .PUT(HttpRequest.BodyPublishers.ofString(
        "{\"nombre\": \"Actualizado\"}"))
    .build();

// DELETE
HttpRequest deleteRequest = HttpRequest.newBuilder()
    .uri(URI.create("https://api.ejemplo.com/recursos/1"))
    .DELETE()
    .build();

// Con método personalizado (PATCH, etc.)
HttpRequest patchRequest = HttpRequest.newBuilder()
    .uri(URI.create("https://api.ejemplo.com/recursos/1"))
    .method("PATCH", HttpRequest.BodyPublishers.ofString(
        "{\"nombre\": \"Parcial\"}"))
    .build();
```

## 9. Frameworks modernos

El `HttpServer` básico está bien para aprender, pero en el mundo real se usan frameworks:

- **Javalin**: Minimalista, moderno, ideal para APIs. Con 3 líneas tienes un servidor.
- **Spring Boot**: El estándar industrial. Tiene todo, pero es más pesado.
- **Spark**: Similar a Javalin, muy ligero.

Ejemplo con Javalin:

```java
import io.javalin.Javalin;

public class App {
    public static void main(String[] args) {
        Javalin app = Javalin.create().start(8080);
        app.get("/", ctx -> ctx.result("Hola desde Javalin"));
        app.get("/api/usuarios", ctx ->
            ctx.json(List.of(new Usuario(1, "Ana"))));
    }
}
```

> **💡 Consejo:** Para los boletines de esta unidad usaremos el `HttpServer` nativo de Java como servidor y `HttpClient` para consumir APIs. No necesitas instalar nada más que Gson (o la librería JSON que prefieras). Los frameworks los verás en el módulo de "Desarrollo de Interfaces" y en el proyecto final.

---

### ⭐ BE THE CODE, MY FRIEND: Sigue la pista de una petición HTTP

> 🕶️ **Don Tip:** El método HTTP lo determina el cliente. GET para obtener, POST para enviar. El `exchange.getRequestMethod()` te dice cuál es.

Abre el `HttpServer` que creaste en la sección 2. Añade esto justo antes de `server.start()`:

```java
server.createContext("/track", exchange -> {
    System.out.println("Método: " + exchange.getRequestMethod());
    System.out.println("URI: " + exchange.getRequestURI());
    System.out.println("Cabeceras: " + exchange.getRequestHeaders().entrySet());
    exchange.getResponseHeaders().add("Content-Type", "text/plain");
    exchange.sendResponseHeaders(200, 0);
    try (var os = exchange.getResponseBody()) {
        os.write("Todo ok, gracias por preguntar.".getBytes());
    }
});
```

**Preguntas:**
1. Abre `http://localhost:8080/track?nombre=Ana&edad=25` — ¿Qué ves en la consola del servidor?
2. ¿Qué método HTTP has usado sin especificarlo? (Pista: el navegador hace GET por defecto)
3. ¿Qué pasa si envías una petición POST desde `curl` o desde JavaScript? Pruébalo con:

```bash
curl -X POST http://localhost:8080/track -d "clave=valor"
```

4. **Reto:** Modifica el `System.out` para que escriba en un archivo `access.log` en lugar de la consola. Cada petición debe aparecer en una línea nueva con formato: `[MÉTODO] URI → 200 OK`

---

## ❓ ¡No hay preguntas tontas!

**¿HTTP y HTTPS son lo mismo?** — Casi. HTTPS es HTTP con una capa de cifrado (SSL/TLS). Los datos viajan encriptados. Para producción siempre HTTPS; para desarrollo local, HTTP basta.

**¿Qué puerto usar?** — 8080 es el estándar para desarrollo. 80 es el puerto HTTP por defecto (requiere permisos de administrador). 443 es para HTTPS. Evita puertos < 1024 en desarrollo.

**¿Qué es CORS y por qué me da error?** — Cross-Origin Resource Sharing. El navegador bloquea peticiones de un dominio a otro por seguridad. Para desarrollo, añade esta cabecera en tu servidor: `exchange.getResponseHeaders().add("Access-Control-Allow-Origin", "*")`.

**¿Gson o Jackson?** — Gson es más sencillo para empezar. Jackson es más rápido y potente. Para este curso, Gson es suficiente. Si usas Jackson, la sintaxis es muy parecida.

**Mi servidor no arranca: "Address already in use"** — Otro proceso tiene el puerto ocupado. Cambia el puerto o mata el proceso anterior. En terminal: `netstat -ano \| findstr 8080` y luego `taskkill /PID <numero> /F`.

**¿Puedo servir páginas web normales (HTML+CSS+JS)?** — Sí. Pon los archivos en una carpeta `web/` dentro de `resources/` y sírvelos con `Files.readString()` desde el contexto. O usa `exchange.sendResponseHeaders(200, file.length())` para archivos binarios.

**¿El `HttpServer` es como Tomcat?** — No, `HttpServer` es mínimo y didáctico. Tomcat es un servidor de aplicaciones completo que soporta Servlets, JSP, etc. Aquí usamos lo justo para entender el protocolo.

**¿Necesito una base de datos para la API?** — No. Puedes tener una lista en memoria (`ArrayList`). Al reiniciar el servidor los datos se pierden, pero es perfecto para aprender. Luego añades SQLite si quieres persistencia.

---

## Resumen

| Concepto | Analogía |
|----------|----------|
| HTTP | El idioma que hablan cliente y servidor |
| GET | Pedir información |
| POST | Enviar información |
| PUT | Reemplazar información |
| DELETE | Borrar información |
| Status 200 | Todo bien |
| Status 404 | No encontrado |
| Status 500 | Error interno |
| JSON | Formato de datos universal |
| HttpServer | Tu puerta al mundo web |
| HttpClient | Tu ventana a otras APIs |

**Flujo básico de una API REST:**
1. Cliente hace una petición HTTP (GET, POST, PUT, DELETE)
2. Servidor procesa la petición
3. Servidor devuelve JSON (o HTML, o texto)
4. Cliente parsea la respuesta y hace algo con ella

---

## Ejercicios propuestos

1. **API de frases célebres** — Crea un servidor con un endpoint `/frase` que devuelva una frase aleatoria de una lista en memoria. Añade `/frases` que devuelva todas.

2. **Contador de visitas** — Cada vez que alguien visita `/contador`, el servidor incrementa un contador y devuelve el número actual como JSON: `{"visitas": 42}`.

3. **API de tareas (CRUD completo)** — Implementa los 4 endpoints para una lista de tareas:
   - `GET /tareas` — lista todas
   - `POST /tareas` — crea una (recibe JSON con `{ "titulo": "..." }`)
   - `PUT /tareas/{id}` — actualiza una
   - `DELETE /tareas/{id}` — borra una

4. **Consumir y transformar** — Usa `HttpClient` para consultar la API de GitHub y mostrar solo los nombres de los repositorios de un usuario. Luego guarda los resultados en un archivo `repos.txt`.

5. **Proxy simple** — Crea un endpoint `/proxy?url=...` que reciba una URL, haga una petición GET a esa URL y devuelva el contenido. ¡Como un proxy inverso casero!

6. **Mini chat en tiempo real (simulado)** — Usa `/enviar` (POST) y `/mensajes` (GET) para simular un chat. Los mensajes se guardan en una lista en memoria. El frontend pregunta cada 2 segundos si hay mensajes nuevos (polling).

---

**RAs trabajados en esta unidad:**
- **RA5** — Desarrolla interfaces gráficas (ahora web) siguiendo el modelo vista-controlador y el estilo de código abierto.

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
