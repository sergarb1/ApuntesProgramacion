---
title: "08 · HttpClient avançat"
description: "POST amb BodyPublishers, capçaleres i timeouts, sendAsync sense bloquejar i PUT/DELETE com un client professional 🚀🧠"
---

<p><small>POST amb BodyPublishers, capçaleres i timeouts, sendAsync sense bloquejar i PUT/DELETE com un client professional 🚀🧠</small></p>

> 🗺️ **Estàs en:** 🌐 **U14 · Servir i Consumir APIs amb Web** → 08 · HttpClient avançat

---

## 📬 La idea en una frase

> **El GET és el saludet. Hui aprens la resta de la conversa: enviar dades amb POST, afinar la petició amb capçaleres i timeouts, no bloquejar el programa amb `sendAsync` i fins i tot esborrar amb DELETE.**

El punt 7 era llegir. Este és escriure: enviar dades a una API, controlar el temps d'espera, interpretar capçaleres, llançar peticions sense congelar el programa i completar el repertori de mètodes HTTP. En acabar, ja eres un client complet.

---

## 📤 POST: enviar dades a una API

Per a crear un recurs, fer login o registrar alguna cosa, uses POST amb un cos JSON:

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

Dues novetats:

- **`BodyPublishers.ofString(json)`** — el mirall del `BodyHandler`: convertix el teu `String` en el cos de la petició. N'hi ha `ofByteArray()`, `ofFile()`... i `ofInputStream()` per a casos rars.
- **`.header("Content-Type", "application/json")`** — sense esta capçalera, el servidor pot rebutjar la teua petició o interpretar mal el cos. JSON sense `Content-Type` és com enviar una carta sense remitent.

> 💡 **Consell:** `HttpRequest.BodyPublishers` té mètodes per a enviar String, byte[], fitxers, etc. El més comú és `ofString()` per a JSON. I si el servidor respon `415`, eixe codi significa "Unsupported Media Type": quasi sempre és que has oblidat el `Content-Type`.

---

## 🛡️ Capçaleres, timeouts i gestió d'errors

Les APIs no sempre es comporten bé: de vegades tarden, de vegades cauen, de vegades et tornen 401, 403, 404 o 500. El teu codi ha d'estar preparat.

```java
import java.net.http.HttpConnectTimeoutException;
import java.time.Duration;

HttpClient client = HttpClient.newBuilder()
    .connectTimeout(Duration.ofSeconds(10))   // temps màxim per a connectar
    .build();

HttpRequest request = HttpRequest.newBuilder()
    .uri(URI.create("https://api.github.com/users/someone"))
    .header("Accept", "application/vnd.github+json")
    .header("User-Agent", "MiAppJava/1.0")
    .timeout(Duration.ofSeconds(15))          // temps màxim per a rebre resposta
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

> ⚠️ **Advertència:** moltes APIs públiques (GitHub, Twitter, etc.) exigixen un **token d'autenticació** en la capçalera `Authorization`. Sense ell, tens quotes molt baixes (rate limiting) o accés denegat. Si veus un `403`, probablement necessites registrar una aplicació i obtindre un token.

Les capçaleres més comunes que enviaràs:

| Capçalera | Propòsit |
|----------|-----------|
| `Content-Type` | Tipus de dades que envies (`application/json`) |
| `Accept` | Tipus de dades que esperes rebre |
| `Authorization` | Token Bearer, Basic Auth, etc. |
| `User-Agent` | Identifica la teua aplicació (moltes APIs ho exigixen) |
| `Cache-Control` | Control de memòria cau |

---

## ⚡ Crides asíncrones amb `sendAsync`

Si necessites diverses peticions sense bloquejar el programa, `HttpClient` també té mode asíncron:

```java
CompletableFuture<HttpResponse<String>> futuro = client.sendAsync(
    request, HttpResponse.BodyHandlers.ofString()
);

// Mentrestant, pots fer altres coses...
System.out.println("Esperando respuesta...");

// Quan arribe:
futuro.thenAccept(response -> {
    System.out.println("Código: " + response.statusCode());
    System.out.println(response.body());
});

// O bloquejar fins que arribe (no recomanat si vas just de temps):
HttpResponse<String> resp = futuro.get();
```

> 💡 **Consell:** `sendAsync` torna un `CompletableFuture`, la forma elegant de Java per al codi asíncron sense liar-te amb fils manuals. Pots encadenar crides amb `thenApply`, `thenCompose`, etc. La diferència amb `send()`: el primer no espera (el `main` seguix) i el segon congela el programa fins a tindre la resposta.

---

## 🗑️ PUT, DELETE i altres mètodes

`HttpClient` suporta tots els mètodes HTTP. La diferència és només la crida al builder:

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

// Amb mètode personalitzat (PATCH, etc.)
HttpRequest patchRequest = HttpRequest.newBuilder()
    .uri(URI.create("https://api.ejemplo.com/recursos/1"))
    .method("PATCH", HttpRequest.BodyPublishers.ofString(
        "{\"nombre\": \"Parcial\"}"))
    .build();
```

Fixa't: `PUT` porta cos (reemplaça amb contingut nou), `DELETE` no. I si necessites alguna cosa que no té mètode propi (com `PATCH`), `method(...)` t'ho dona.

---

## 🏗️ Frameworks moderns (una ullada)

El `HttpServer` natiu és perfecte per a aprendre, però en el món real s'usen frameworks:

- **Javalin** — minimalista, modern, ideal per a APIs. En 3 línies tens un servidor.
- **Spring Boot** — l'estàndard industrial. Ho té tot, però és més pesat.
- **Spark** — semblant a Javalin, molt lleuger.

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

> 💡 **Consell:** en este curs usem `HttpServer` natiu com a servidor i `HttpClient` per a consumir APIs: no necessites instal·lar res més que Gson. Els frameworks els veuràs en el mòdul de "Desenrotllament d'Interfícies" i, si t'hi llançes, en el teu projecte final. Ara entens el terreny que trepitgen: tots parlen HTTP.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quin mètode de `BodyPublishers` uses per a enviar un `String` en el cos d'un POST?
2. Quina capçalera és imprescindible en enviar JSON?
3. Quina diferència hi ha entre `send()` i `sendAsync()`?
4. Com fas un DELETE amb `HttpClient`?

<details>
<summary>🔄 Respostes</summary>

1. `HttpRequest.BodyPublishers.ofString(json)`.
2. `Content-Type: application/json`. Sense ella, el servidor pot rebutjar la petició (o tornar `415`).
3. `send()` és **síncron** (bloqueja el programa) i `sendAsync()` és **asíncron** (torna un `CompletableFuture` i el programa seguix).
4. Amb `.DELETE()` en el builder; no porta cos, només la URI.

</details>

---

## ✅ Resum en 3 frases

1. Per a **enviar dades** uses `POST` amb `BodyPublishers.ofString(json)` i la capçalera `Content-Type: application/json`.
2. Les APIs cauen: usa **timeouts** (`connectTimeout`, `timeout`), comprova el codi d'estat i captura les excepcions de xarxa amb elegància.
3. **`sendAsync()`** torna un `CompletableFuture` i no bloqueja el programa; `PUT`, `DELETE` i `PATCH` es fan canviant només la crida al builder.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `BodyPublishers` | Convertix el teu `String`/`byte[]` en el cos de la petició |
> | `Authorization` | Capçalera per a tokens i credencials |
> | Timeout | Temps màxim d'espera abans de rendir-se |
> | `CompletableFuture` | La promesa de Java: "arribarà, però no ara" |
> | `415` | Unsupported Media Type: has oblidat el `Content-Type` |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/14-apis-web) · **Anterior:** [07 · Consumir APIs externes amb HttpClient](/ApuntesProgramacion/va/14-apis-web/07-httpclient) · **Següent:** [09 · Repàs interactiu](/ApuntesProgramacion/va/14-apis-web/09-repaso-interactivo)