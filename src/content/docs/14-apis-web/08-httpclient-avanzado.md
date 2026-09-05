---
title: "08 · HttpClient avanzado"
description: "POST con BodyPublishers, cabeceras y timeouts, sendAsync sin bloquear y PUT/DELETE como un cliente profesional 🚀🧠"
---

<p><small>POST con BodyPublishers, cabeceras y timeouts, sendAsync sin bloquear y PUT/DELETE como un cliente profesional 🚀🧠</small></p>

> 🗺️ **Estás en:** 🌐 **U14 · Servir y Consumir APIs con Web** → 08 · HttpClient avanzado

---

## 📬 La idea en una frase

> **El GET es el saludo. Hoy aprendes el resto de la conversación: enviar datos con POST, afinar la petición con cabeceras y timeouts, no bloquear el programa con `sendAsync` y hasta borrar con DELETE.**

El punto 7 era leer. Este es escribir: mandar datos a una API, controlar el tiempo de espera, interpretar cabeceras, lanzar peticiones sin congelar el programa y completar el repertorio de métodos HTTP. Al terminar, ya eres un cliente completo.

---

## 📤 POST: enviar datos a una API

Para crear un recurso, hacer login o registrar algo, usas POST con un cuerpo JSON:

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

Dos novedades:

- **`BodyPublishers.ofString(json)`** — el espejo del `BodyHandler`: convierte tu `String` en el cuerpo de la petición. Hay `ofByteArray()`, `ofFile()`... y `ofInputStream()` para casos raros.
- **`.header("Content-Type", "application/json")`** — sin esta cabecera, el servidor puede rechazar tu petición o interpretar mal el cuerpo. JSON sin `Content-Type` es como mandar una carta sin remitente.

> 💡 **Consejo:** `HttpRequest.BodyPublishers` tiene métodos para enviar String, byte[], archivos, etc. El más común es `ofString()` para JSON. Y si el servidor responde `415`, ese código significa "Unsupported Media Type": casi siempre es que olvidaste el `Content-Type`.

---

## 🛡️ Cabeceras, timeouts y manejo de errores

Las APIs no siempre se portan bien: a veces tardan, a veces se caen, a veces te devuelven 401, 403, 404 o 500. Tu código debe estar preparado.

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

> ⚠️ **Advertencia:** muchas APIs públicas (GitHub, Twitter, etc.) exigen un **token de autenticación** en la cabecera `Authorization`. Sin él, tienes cuotas muy bajas (rate limiting) o acceso denegado. Si ves un `403`, probablemente necesitas registrar una aplicación y obtener un token.

Las cabeceras más comunes que enviarás:

| Cabecera | Propósito |
|----------|-----------|
| `Content-Type` | Tipo de datos que envías (`application/json`) |
| `Accept` | Tipo de datos que esperas recibir |
| `Authorization` | Token Bearer, Basic Auth, etc. |
| `User-Agent` | Identifica tu aplicación (muchas APIs lo exigen) |
| `Cache-Control` | Control de caché |

---

## ⚡ Llamadas asíncronas con `sendAsync`

Si necesitas varias peticiones sin bloquear el programa, `HttpClient` también tiene modo asíncrono:

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

> 💡 **Consejo:** `sendAsync` devuelve un `CompletableFuture`, la forma elegante de Java para el código asíncrono sin liarte con hilos manuales. Puedes encadenar llamadas con `thenApply`, `thenCompose`, etc. La diferencia con `send()`: el primero no espera (sigue el `main`) y el segundo congela el programa hasta tener la respuesta.

---

## 🗑️ PUT, DELETE y otros métodos

`HttpClient` soporta todos los métodos HTTP. La diferencia es solo la llamada al builder:

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

Fíjate: `PUT` lleva cuerpo (reemplaza con contenido nuevo), `DELETE` no. Y si necesitas algo que no tiene método propio (como `PATCH`), `method(...)` te lo da.

---

## 🏗️ Frameworks modernos (una ojeada)

El `HttpServer` nativo es perfecto para aprender, pero en el mundo real se usan frameworks:

- **Javalin** — minimalista, moderno, ideal para APIs. En 3 líneas tienes un servidor.
- **Spring Boot** — el estándar industrial. Lo tiene todo, pero es más pesado.
- **Spark** — similar a Javalin, muy ligero.

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

> 💡 **Consejo:** en este curso usamos `HttpServer` nativo como servidor y `HttpClient` para consumir APIs: no necesitas instalar nada más que Gson. Los frameworks los verás en el módulo de "Desarrollo de Interfaces" y, si te lanzas, en tu proyecto final. Ahora entiendes el terreno que pisan: todos hablan HTTP.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué método de `BodyPublishers` usas para mandar un `String` en el cuerpo de un POST?
2. ¿Qué cabecera es imprescindible al enviar JSON?
3. ¿Qué diferencia hay entre `send()` y `sendAsync()`?
4. ¿Cómo haces un DELETE con `HttpClient`?

<details>
<summary>🔄 Respuestas</summary>

1. `HttpRequest.BodyPublishers.ofString(json)`.
2. `Content-Type: application/json`. Sin ella, el servidor puede rechazar la petición (o devolver `415`).
3. `send()` es **síncrono** (bloquea el programa) y `sendAsync()` es **asíncrono** (devuelve un `CompletableFuture` y sigue el programa).
4. Con `.DELETE()` en el builder; no lleva cuerpo, solo la URI.

</details>

---

## ✅ Resumen en 3 frases

1. Para **enviar datos** usas `POST` con `BodyPublishers.ofString(json)` y la cabecera `Content-Type: application/json`.
2. Las APIs se caen: usa **timeouts** (`connectTimeout`, `timeout`), comprueba el código de estado y captura las excepciones de red con elegancia.
3. **`sendAsync()`** devuelve un `CompletableFuture` y no bloquea el programa; `PUT`, `DELETE` y `PATCH` se hacen cambiando solo la llamada al builder.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `BodyPublishers` | Convierte tu `String`/`byte[]` en el cuerpo de la petición |
> | `Authorization` | Cabecera para tokens y credenciales |
> | Timeout | Tiempo máximo de espera antes de rendirse |
> | `CompletableFuture` | La promesa de Java: "llegará, pero no ahora" |
> | `415` | Unsupported Media Type: olvidaste el `Content-Type` |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/14-apis-web) · **Anterior:** [07 · Consumir APIs externas con HttpClient](/ApuntesProgramacion/14-apis-web/07-httpclient) · **Siguiente:** [09 · Repaso interactivo](/ApuntesProgramacion/14-apis-web/09-repaso-interactivo)