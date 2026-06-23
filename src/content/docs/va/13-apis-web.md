---
title: "🌐 Unitat 13: Servir i Consumir APIs amb Web"
---
🎯 **Objectius d'aprenentatge**
- Entendre el model petició-resposta HTTP
- Crear un servidor web mínim amb `HttpServer`
- Servir pàgines HTML des de Java
- Processar formularis i paràmetres GET/POST
- Tornar JSON i consumir-lo amb JavaScript
- Consumir APIs externes amb `java.net.http.HttpClient`
- Parsejar JSON i gestionar errors HTTP
- Conéixer frameworks moderns (Javalin, Spring Boot)

## Hola, Món Web

> "Fins ara els teus programes vivien en la terminal. És hora que isquen a Internet. Sense JavaScript frameworks. Sense servidors d'aplicacions. Només Java i HTTP."

Hem vist consola, fitxers i fins bases de dades. Ara toca allò que hui en dia fa quasi qualsevol aplicació: **parlar per HTTP**. I sí, Java pot ser servidor web sense instal·lar Tomcat ni Spring. Però a més, també pot **consumir** APIs externes com un client més.

## 1. El Protocol HTTP en 30 Segons

Quan escrius `https://google.com` en el teu navegador, ocorre això:

```
Tu (client)                  Google (servidor)
    ── GET / HTTP/1.1 ──────────►
    │                              │
    ◄── HTTP/1.1 200 OK ──────────
         Content-Type: text/html
         (el HTML de Google)
```

HTTP és un protocol de **petició-resposta**. Tu demanes una URL i el servidor et torna un recurs (HTML, JSON, imatge, etc.). Això és tot. La resta (cookies, sessions, APIs) són capes que es construïxen damunt.

## 2. Servidor Web Mínim amb `HttpServer`

Java inclou des de la versió 6 un servidor HTTP bàsic en el paquet `com.sun.net.httpserver`. No necessites res més:

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
            String resp = "Hola, Mundo Web!";
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

Compila i executa. Obri `http://localhost:8080` en el teu navegador. Acabes de crear el teu primer servidor web en Java.

## 3. Servint HTML

Tornar text pla està bé per a provar, però volem HTML. Anem a servir una pàgina completa:

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

També pots llegir HTML des d'un fitxer amb `Files.readString()` i servir-lo igual. Així tens l'HTML separat del codi Java.

## 4. Paràmetres GET: El Client Pregunta

Quan un formulari s'envia per GET, les dades van en la URL: `http://localhost:8080/saludo?nombre=Ana`. Així es llig:

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

> ⚠️ **WARNING**: Això és fràgil. Si el nom conté `&` o `%20`, petarà. En producció usa `URLDecoder.decode()` i un parser de query params de veritat. Això és un exemple didàctic, no codi de producció.

## 5. Formularis POST: El Client Envia Dades

Per a rebre dades d'un formulari POST necessites llegir el cos de la petició:

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

I l'HTML del formulari:

```html
<form action="/procesar" method="POST">
  <input name="nombre" placeholder="Tu nombre">
  <button>Enviar</button>
</form>
```

> **💡 Consell:** Per què `"POST".equals(intercambio.getRequestMethod())` i no `intercambio.getRequestMethod().equals("POST")`? Perquè si `getRequestMethod()` torna `null`, la segona forma petà amb `NullPointerException`. La primera forma és **null-safe**. És una mania que t'estalviarà maldecaps.

## 6. Tornant JSON (Com una API de Veritat)

Les aplicacions modernes no tornen HTML directament. El frontend (JavaScript) demana dades i el backend li les dona en JSON. Ací un exemple:

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

I des del HTML pots cridar-ho amb JavaScript:

```html
<script>
fetch('/api/usuarios')
  .then(r => r.json())
  .then(data => console.log(data));
</script>
```

## 7. Mini Projecte: Gestor de Tasques (API REST)

Combinant-ho tot, pots construir una API REST completa. El patró és:

| Método | Ruta | Acción |
|--------|------|--------|
| GET | `/api/tasques` | Llistar totes |
| POST | `/api/tasques` | Crear una |
| PUT | `/api/tasques/1` | Actualitzar |
| DELETE | `/api/tasques/1` | Esborrar |

Cada ruta s'implementa com un context en el servidor, i les dades es guarden en un `ArrayList` en memòria (més avant, en base de dades).

## 8. Consumir APIs Externes amb `HttpClient`

Fins ara has sigut el **servidor**. Però en el món real, els teus programes també seran **clients** que criden a APIs de tercers: GitHub, OpenAI, el temps, la teua xarxa social preferida...

Java 11 portà `java.net.http.HttpClient` — un client HTTP modern, sense dependències externes, que suporta HTTP/2, peticions síncrones i asíncrones, i gestió de capçaleres.

> **📝 Nota:** Abans de Java 11 havies d'usar `HttpURLConnection` (lleig, verbós, un càstig) o llibreries externes com Apache HttpClient o OkHttp. `java.net.http.HttpClient` arribà per a salvar la humanitat.

### 8.1 GET: Demanar Dades a una API

Començem per lo bàsic: fer una petició GET a una API pública i llegir la resposta com a text.

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

> **📝 Nota:** `HttpResponse.BodyHandlers.ofString()` li diu a Java "convertix-me el cos de la resposta en un String". Hi ha altres handlers: `ofByteArray()`, `ofInputStream()`, `ofFile(Path)`… segons el que necessites.

### 8.2 Parsejar JSON amb la Llibreria que Calga

El cos que torna GitHub és JSON. En Java no hi ha un parser JSON natiu (sí, és trist, però és així). Necessites una llibreria. Les més usades:

| Llibreria | Grup Maven | Ideal per a |
|----------|-------------|-----------|
| **Gson** (Google) | `com.google.code.gson:gson` | Senzilla, mapeig a classes |
| **Jackson** | `com.fasterxml.jackson.core:jackson-databind` | Potent, ràpida, estàndard industrial |
| **org.json** | `org.json:json` | La més simple, sense mapeig |

En els exemples usarem **Gson**, que és la més intuitiva:

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

O si prefereixes mapejar a una classe:

```java
record UsuarioGitHub(String login, String name, int public_repos) {}

UsuarioGitHub usuario = gson.fromJson(response.body(), UsuarioGitHub.class);
System.out.println(usuario.name() + " tiene " + usuario.public_repos() + " repos públicos");
```

> ⚠️ **WARNING**: Si l'API torna camps que no existixen en el teu `record`, Gson per defecte els ignora. Si el teu `record` té camps que no estan en el JSON, es queden amb valor `null`. Amb Jackson pots configurar-ho amb `@JsonIgnoreProperties(ignoreUnknown = true)`.

### 8.3 POST: Enviar Dades a una API

Per a enviar dades (crear un recurs, fer login, etc.) usem POST amb un cos JSON:

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

> **💡 Consell:** `HttpRequest.BodyPublishers` té mètodes per a enviar String, byte[], fitxers, etc. El més comú és `ofString()` per a JSON. Si no poses la capçalera `Content-Type: application/json`, el servidor pot rebutjar la teua petició o interpretar mal el cos.

### 8.4 Capçaleres, Timeouts i Gestió d'Errors

Les APIs no sempre es comporten bé. De vegades tarden, de vegades cauen, de vegades et tornen 401, 403, 404 o 500. El teu codi ha d'estar preparat.

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

> ⚠️ **WARNING**: Moltes APIs públiques (GitHub, Twitter, etc.) requerixen un **token d'autenticació** en la capçalera `Authorization`. Sense ell, tens quotes molt baixes (rate limiting) o accés denegat. Si veus un 403, probablement necessites registrar una aplicació i obtindre un token.

Ací tens les capçaleres més comunes que enviaràs:

| Capçalera | Propòsit |
|----------|-----------|
| `Content-Type` | Tipus de dades que envies (`application/json`) |
| `Accept` | Tipus de dades que esperes rebre |
| `Authorization` | Token Bearer, Basic Auth, etc. |
| `User-Agent` | Identifica la teua aplicació (moltes APIs ho exigixen) |
| `Cache-Control` | Control de memòria cau |

### 8.5 Exemple Complet: Consultar Repos de GitHub

Anem a juntar-ho tot: consumir l'API de GitHub per a llistar els repositoris d'un usuari.

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

> **📝 Nota:** Fixa't en `repo.has("language") && !repo.get("language").isJsonNull()`. En JSON un camp pot existir però valdre `null`. Si intentes `getAsString()` sobre un `null`, Gson et llança una excepció. Este patró és molt comú al parsejar APIs reals.

Exemple d'eixida:

```
Repositoris de octocat:
────────────────────────────────
⭐ Hello-World (Java) ★ 2727
⭐ Spoon-Knife (HTML) ★ 13291
⭐ Octocat (?) ★ 5
```

### 8.6 Crides Asíncrones amb `sendAsync`

Si necessites fer diverses peticions sense bloquejar el programa, `HttpClient` també suporta mode asíncron:

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

> **💡 Consell:** `sendAsync` torna un `CompletableFuture`, que és la forma elegant de Java per a treballar amb codi asíncron sense liar-te amb fils manuals. Pots encadenar diverses crides amb `thenApply`, `thenCompose`, etc.

### 8.7 PUT, DELETE i Altres Mètodes

`HttpClient` suporta tots els mètodes HTTP. La diferència és la crida al builder:

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

## 9. Frameworks Moderns

El `HttpServer` bàsic està bé per a aprendre, però en el món real s'usen frameworks:

- **Javalin**: Minimalista, modern, ideal per a APIs. Amb 3 línies tens un servidor.
- **Spring Boot**: L'estàndard industrial. Té de tot, però és més pesat.
- **Spark**: Semblant a Javalin, molt lleuger.

Exemple amb Javalin:

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

> **💡 Consell:** Per als butlletins d'esta unitat usarem el `HttpServer` natiu de Java com a servidor i `HttpClient` per a consumir APIs. No necessites instal·lar res més que Gson (o la llibreria JSON que preferisques). Els frameworks els veuràs en el mòdul de "Desenrotllament d'Interfícies" i en el projecte final.

### ⭐ BE THE CODE, MY FRIEND: Seguix la Pista d'una Petició HTTP

> 🕶️ **Don Tip:** El mètode HTTP el determina el client. GET per a obtindre, POST per a enviar. El `exchange.getRequestMethod()` et diu quin és.

Abre el `HttpServer` que has creat. Afig això just abans de `server.start()`:

```java
server.createContext("/track", exchange -> {
    System.out.println("Mètode: " + exchange.getRequestMethod());
    System.out.println("URI: " + exchange.getRequestURI());
    System.out.println("Capçaleres: " + exchange.getRequestHeaders().entrySet());
    exchange.getResponseHeaders().add("Content-Type", "text/plain");
    exchange.sendResponseHeaders(200, 0);
    try (var os = exchange.getResponseBody()) {
        os.write("Tot bé, gràcies per preguntar.".getBytes());
    }
});
```

**Preguntes:**
1. Obri `http://localhost:8080/track?nombre=Ana&edad=25` — Què veus en la consola del servidor?
2. Quin mètode HTTP has usat sense especificar-lo? (Pista: el navegador fa GET per defecte)
3. Què passa si envies una petició POST des de `curl` o des de JavaScript?
4. **Repte:** Modifica el `System.out` per a que escriga en un fitxer `access.log`. Cada petició en una línia: `[MÈTODE] URI → 200 OK`

## ❓ No Hi Ha Preguntes Tontes!

**HTTP i HTTPS són el mateix?** — Quasi. HTTPS és HTTP amb xifrat (SSL/TLS). Per a producció sempre HTTPS; per a desenvolupament local, HTTP val.

**Quin port usar?** — 8080 és l'estàndard per a desenvolupament. 80 és el port HTTP per defecte (requerix permisos d'administrador). 443 és per a HTTPS.

**Què és CORS i per què em dona error?** — Cross-Origin Resource Sharing. El navegador bloqueja peticions d'un domini a un altre per seguretat. Per a desenvolupament, afig: `exchange.getResponseHeaders().add("Access-Control-Allow-Origin", "*")`.

**Gson o Jackson?** — Gson és més senzill per a començar. Jackson és més ràpid i potent. Per a este curs, Gson és suficient.

**El servidor no arranca: "Address already in use"** — Un altre procés té el port ocupat. Canvia el port o mata el procés: `netstat -ano | findstr 8080` i `taskkill /PID <numero> /F`.

**Puc servir pàgines web normals (HTML+CSS+JS)?** — Sí. Posant els fitxers en una carpeta `web/` dins de `resources/` i servint-los amb `Files.readString()`.

**Cal una base de dades per a l'API?** — No. Pots tindre una llista en memòria (`ArrayList`). Al reiniciar el servidor les dades es perden, però és perfecte per a aprendre.

## Resum

| Concepte | Analogia |
|----------|----------|
| HTTP | L'idioma que parlen client i servidor |
| GET | Demanar informació |
| POST | Enviar informació |
| PUT | Reemplaçar informació |
| DELETE | Esborrar informació |
| Status 200 | Tot bé |
| Status 404 | No trobat |
| Status 500 | Error intern |
| JSON | Format de dades universal |
| HttpServer | La teua porta al món web |
| HttpClient | La teua finestra a altres APIs |

**Flux bàsic d'una API REST:**
1. Client fa una petició HTTP
2. Servidor processa la petició
3. Servidor torna JSON (o HTML, o text)
4. Client parseja la resposta i fa alguna cosa

## Exercicis Proposats

1. **API de frases cèlebres** — Crea un servidor amb un endpoint `/frase` que torne una frase aleatòria d'una llista en memòria.

2. **Comptador de visites** — Cada visita a `/comptador` incrementa un comptador i torna JSON: `{"visites": 42}`.

3. **API de tasques (CRUD complet)** — Implementa GET/POST/PUT/DELETE per a una llista de tasques.

4. **Consumir i transformar** — Usa `HttpClient` per a consultar l'API de GitHub i mostra els noms dels repositoris. Guarda'ls en `repos.txt`.

5. **Proxy simple** — Crea `/proxy?url=...` que faça una petició GET a eixa URL i torne el contingut.

6. **Mini xat en temps real (simulat)** — Usa `/enviar` (POST) i `/missatges` (GET) per a simular un xat en memòria.

**RAs treballats en esta unitat:**
- **RA5** — Desenrotlla interfícies gràfiques (ara web) seguint el model vista-controlador.

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
