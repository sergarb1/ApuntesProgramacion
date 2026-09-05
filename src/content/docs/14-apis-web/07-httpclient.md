---
title: "07 · Consumir APIs externas con HttpClient"
description: "Tu programa se convierte en cliente: HttpClient, GET, BodyHandlers y parsear JSON con Gson 📡🔍"
---

<p><small>Tu programa se convierte en cliente: HttpClient, GET, BodyHandlers y parsear JSON con Gson 📡🔍</small></p>

> 🗺️ **Estás en:** 🌐 **U14 · Servir y Consumir APIs con Web** → 07 · Consumir APIs externas con HttpClient

---

## 📬 La idea en una frase

> **Hasta ahora has sido el servidor. Con `java.net.http.HttpClient`, tu programa se convierte en cliente y le pregunta a las APIs de todo el mundo: GitHub, el tiempo, tu red social favorita...**

Los puntos anteriores eran sobre recibir. Ahora toca pedir: en el mundo real, tus programas llaman a APIs de terceros constantemente. Java 11 trae `HttpClient`, un cliente HTTP moderno y sin dependencias externas, con soporte de HTTP/2, peticiones síncronas y asíncronas, y gestión de cabeceras.

> 📝 **Nota:** antes de Java 11 tenías que usar `HttpURLConnection` (feo, verboso, un castigo) o librerías externas como Apache HttpClient u OkHttp. `java.net.http.HttpClient` llegó para salvar a la humanidad.

---

## 📡 El trío sagrado del cliente

Consumir una API son siempre tres piezas:

1. **`HttpClient`** — el que hace la llamada. Un objeto, reutilizable para todas tus peticiones.
2. **`HttpRequest`** — la petición: URL, método, cabeceras. Se construye con *builder*.
3. **`HttpResponse`** — la respuesta: código de estado, cabeceras y cuerpo.

El GET más básico que existe:

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

Dos métodos clave:

- **`client.send(...)`** — hace la petición de forma **síncrona**: el programa se queda esperando hasta que llega la respuesta (o falla). Es el que usarás el 90 % del tiempo.
- **`HttpResponse.BodyHandlers.ofString()`** — le dice a Java "conviérteme el cuerpo en un `String`". Hay más: `ofByteArray()`, `ofInputStream()`, `ofFile(Path)`... según lo que necesites.

> 💡 **Consejo:** para probar, jsonplaceholder (`https://jsonplaceholder.typicode.com`) es la API de juguete perfecta: devuelve JSON de ejemplo para practicar sin registro ni tokens.

---

## 🧩 Parsear JSON con Gson

El cuerpo que devuelve GitHub es JSON. Y aquí viene la noticia triste: **Java no trae parser JSON nativo**. Necesitas una librería. Las más usadas:

| Librería | Grupo Maven | Ideal para |
|----------|-------------|-----------|
| **Gson** (Google) | `com.google.code.gson:gson` | Sencilla, mapeo a clases |
| **Jackson** | `com.fasterxml.jackson.core:jackson-databind` | Potente, rápida, estándar industrial |
| **org.json** | `org.json:json` | La más simple, sin mapeo |

Usaremos **Gson**, la más intuitiva. Dos formas de usarla:

**Forma 1 — a lo bruto, con `JsonObject`:**

```java
import com.google.gson.Gson;
import com.google.gson.JsonObject;

Gson gson = new Gson();
JsonObject json = gson.fromJson(response.body(), JsonObject.class);

String login = json.get("login").getAsString();
String nombre = json.get("name").getAsString();
System.out.println("Usuario: " + login + " — " + nombre);
```

**Forma 2 — mapeando a un `record` (los de la U11):**

```java
record UsuarioGitHub(String login, String name, int public_repos) {}

UsuarioGitHub usuario = gson.fromJson(response.body(), UsuarioGitHub.class);
System.out.println(usuario.name() + " tiene " + usuario.public_repos() + " repos públicos");
```

> ⚠️ **Advertencia:** si la API devuelve campos que no existen en tu `record`, Gson los ignora por defecto. Si tu `record` tiene campos que no están en el JSON, se quedan en `null`. Con Jackson puedes configurarlo con `@JsonIgnoreProperties(ignoreUnknown = true)`.

---

## 🌟 El ejemplo completo: los repos de GitHub

Juntémoslo todo: consumir la API de GitHub para listar los repositorios de un usuario.

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

> 📝 **Nota:** fíjate en `repo.has("language") && !repo.get("language").isJsonNull()`. En JSON un campo puede existir pero valer `null`. Si intentas `getAsString()` sobre un `null`, Gson lanza una excepción. Este patrón es muy común al parsear APIs reales.

Salida de ejemplo:

```
Repositorios de octocat:
────────────────────────────────
⭐ Hello-World (Java) ★ 2727
⭐ Spoon-Knife (HTML) ★ 13291
⭐ Octocat (?) ★ 5
```

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Cuáles son las tres clases del trío sagrado del cliente HTTP?
2. ¿Qué hace `client.send(...)`: síncrono o asíncrono?
3. ¿Cómo le dices a `HttpClient` que el cuerpo de la respuesta sea un `String`?
4. ¿Qué librería usamos para parsear JSON y cuál es la forma de mapearlo a una clase?

<details>
<summary>🔄 Respuestas</summary>

1. `HttpClient` (quien llama), `HttpRequest` (la petición) y `HttpResponse` (la respuesta).
2. **Síncrono**: el programa espera hasta que llega la respuesta (o falla). El asíncrono es `sendAsync`, en el punto 8.
3. Con el `BodyHandler`: `HttpResponse.BodyHandlers.ofString()`.
4. **Gson**, y la forma elegante es mapearlo a un `record` con `gson.fromJson(cuerpo, MiRecord.class)`.

</details>

---

## ✅ Resumen en 3 frases

1. **`HttpClient` + `HttpRequest` + `HttpResponse`** son el trío para consumir APIs: `client.send(...)` hace la petición síncrona y `BodyHandlers.ofString()` te da el cuerpo como texto.
2. **Gson** parsea ese texto JSON: a lo bruto con `JsonObject` o mapeando a un `record` con `fromJson`.
3. En JSON un campo puede existir pero ser `null`: comprueba con `has(...)` y `isJsonNull()` antes de `getAsString()`, o Gson te peta.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `HttpClient` | El cliente HTTP moderno de Java 11+ |
> | `BodyHandler` | Le dice a Java cómo convertir el cuerpo (`ofString`, `ofByteArray`...) |
> | Gson | Librería para convertir JSON en objetos Java (y al revés) |
> | `JsonObject` / `JsonArray` | El JSON sin mapear, accesible a lo bruto |
> | Rate limit | Límite de peticiones por minuto que imponen las APIs |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/14-apis-web) · **Anterior:** [06 · Mini proyecto: gestor de tareas (API REST)](/ApuntesProgramacion/14-apis-web/06-proyecto-rest) · **Siguiente:** [08 · HttpClient avanzado](/ApuntesProgramacion/14-apis-web/08-httpclient-avanzado)