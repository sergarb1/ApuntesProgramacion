---
title: "07 · Consumir APIs externes amb HttpClient"
description: "El teu programa es convertix en client: HttpClient, GET, BodyHandlers i parsejar JSON amb Gson 📡🔍"
---

<p><small>El teu programa es convertix en client: HttpClient, GET, BodyHandlers i parsejar JSON amb Gson 📡🔍</small></p>

> 🗺️ **Estàs en:** 🌐 **U14 · Servir i Consumir APIs amb Web** → 07 · Consumir APIs externes amb HttpClient

---

## 📬 La idea en una frase

> **Fins ara has sigut el servidor. Amb `java.net.http.HttpClient`, el teu programa es convertix en client i li pregunta a les APIs de tot el món: GitHub, el temps, la teua xarxa social preferida...**

Els punts anteriors eren sobre rebre. Ara toca demanar: en el món real, els teus programes criden a APIs de tercers constantment. Java 11 porta `HttpClient`, un client HTTP modern i sense dependències externes, amb suport d'HTTP/2, peticions síncrones i asíncrones, i gestió de capçaleres.

> 📝 **Nota:** abans de Java 11 havies d'usar `HttpURLConnection` (lleig, verbós, un càstig) o llibreries externes com Apache HttpClient o OkHttp. `java.net.http.HttpClient` va arribar per a salvar la humanitat.

---

## 📡 El trio sagrat del client

Consumir una API són sempre tres peces:

1. **`HttpClient`** — el que fa la crida. Un objecte, reutilitzable per a totes les teues peticions.
2. **`HttpRequest`** — la petició: URL, mètode, capçaleres. Es construïx amb *builder*.
3. **`HttpResponse`** — la resposta: codi d'estat, capçaleres i cos.

El GET més bàsic que existix:

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

Dos mètodes clau:

- **`client.send(...)`** — fa la petició de forma **síncrona**: el programa es queda esperant fins que arriba la resposta (o falla). És el que usaràs el 90 % del temps.
- **`HttpResponse.BodyHandlers.ofString()`** — li diu a Java "convertix-me el cos en un `String`". N'hi ha més: `ofByteArray()`, `ofInputStream()`, `ofFile(Path)`... segons el que necessites.

> 💡 **Consell:** per a provar, jsonplaceholder (`https://jsonplaceholder.typicode.com`) és l'API de joguina perfecta: torna JSON d'exemple per a practicar sense registre ni tokens.

---

## 🧩 Parsejar JSON amb Gson

El cos que torna GitHub és JSON. I ací ve la notícia trista: **Java no porta parser JSON natiu**. Necessites una llibreria. Les més usades:

| Llibreria | Grup Maven | Ideal per a |
|----------|-------------|-----------|
| **Gson** (Google) | `com.google.code.gson:gson` | Senzilla, mapeig a classes |
| **Jackson** | `com.fasterxml.jackson.core:jackson-databind` | Potent, ràpida, estàndard industrial |
| **org.json** | `org.json:json` | La més simple, sense mapeig |

Usarem **Gson**, la més intuïtiva. Dues formes d'usar-la:

**Forma 1 — a lo bruto, amb `JsonObject`:**

```java
import com.google.gson.Gson;
import com.google.gson.JsonObject;

Gson gson = new Gson();
JsonObject json = gson.fromJson(response.body(), JsonObject.class);

String login = json.get("login").getAsString();
String nombre = json.get("name").getAsString();
System.out.println("Usuario: " + login + " — " + nombre);
```

**Forma 2 — mapejant a un `record` (els de la U11):**

```java
record UsuarioGitHub(String login, String name, int public_repos) {}

UsuarioGitHub usuario = gson.fromJson(response.body(), UsuarioGitHub.class);
System.out.println(usuario.name() + " tiene " + usuario.public_repos() + " repos públicos");
```

> ⚠️ **Advertència:** si l'API torna camps que no existixen en el teu `record`, Gson els ignora per defecte. Si el teu `record` té camps que no estan en el JSON, es queden en `null`. Amb Jackson pots configurar-ho amb `@JsonIgnoreProperties(ignoreUnknown = true)`.

---

## 🌟 L'exemple complet: els repos de GitHub

Ajuntem-ho tot: consumir l'API de GitHub per a llistar els repositoris d'un usuari.

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

> 📝 **Nota:** fixa't en `repo.has("language") && !repo.get("language").isJsonNull()`. En JSON un camp pot existir però valdre `null`. Si intentes `getAsString()` sobre un `null`, Gson llança una excepció. Este patró és molt comú al parsejar APIs reals.

Eixida d'exemple:

```
Repositoris de octocat:
────────────────────────────────
⭐ Hello-World (Java) ★ 2727
⭐ Spoon-Knife (HTML) ★ 13291
⭐ Octocat (?) ★ 5
```

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quines són les tres classes del trio sagrat del client HTTP?
2. Què fa `client.send(...)`: síncron o asíncron?
3. Com li dius a `HttpClient` que el cos de la resposta siga un `String`?
4. Quina llibreria usem per a parsejar JSON i quina és la forma de mapejar-lo a una classe?

<details>
<summary>🔄 Respostes</summary>

1. `HttpClient` (qui crida), `HttpRequest` (la petició) i `HttpResponse` (la resposta).
2. **Síncron**: el programa espera fins que arriba la resposta (o falla). L'asíncron és `sendAsync`, al punt 8.
3. Amb el `BodyHandler`: `HttpResponse.BodyHandlers.ofString()`.
4. **Gson**, i la forma elegant és mapejar-lo a un `record` amb `gson.fromJson(cos, MiRecord.class)`.

</details>

---

## ✅ Resum en 3 frases

1. **`HttpClient` + `HttpRequest` + `HttpResponse`** són el trio per a consumir APIs: `client.send(...)` fa la petició síncrona i `BodyHandlers.ofString()` et dona el cos com a text.
2. **Gson** parseja eixe text JSON: a lo bruto amb `JsonObject` o mapejant a un `record` amb `fromJson`.
3. En JSON un camp pot existir però ser `null`: comprova amb `has(...)` i `isJsonNull()` abans de `getAsString()`, o Gson et petarà.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `HttpClient` | El client HTTP modern de Java 11+ |
> | `BodyHandler` | Li diu a Java com convertir el cos (`ofString`, `ofByteArray`...) |
> | Gson | Llibreria per a convertir JSON en objectes Java (i al revés) |
> | `JsonObject` / `JsonArray` | El JSON sense mapejar, accessible a lo bruto |
> | Rate limit | Límit de peticions per minut que imposen les APIs |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/14-apis-web) · **Anterior:** [06 · Mini projecte: gestor de tasques (API REST)](/ApuntesProgramacion/va/14-apis-web/06-proyecto-rest) · **Següent:** [08 · HttpClient avançat](/ApuntesProgramacion/va/14-apis-web/08-httpclient-avanzado)