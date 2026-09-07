---
title: "Butlletí U15 — Avançat"
description: "Exercicis de dificultat progressiva per a dominar JSON, formularis POST i HttpClient"
---

# 📝 Butlletí U15 — Avançat

> Dificultat progressiva. ⭐ per a escalfar, ⭐⭐ per a pensar, ⭐⭐⭐ per a concursar. Cada exercici inclou una pista (resisteix-te a mirar-la).

---

## ⭐ Exercici 1: API de frases motivacionals

Crea un endpoint `GET /api/frase` que torne un JSON amb una frase aleatòria d'un array precarregat i el seu autor.

```json
{"frase": "El código limpio es como un buen chiste: si tienes que explicarlo, es malo", "autor": "Alguien que sabe"}
```

El frontend és un HTML amb un botó "Nova frase" que al fer clic fa `fetch('/api/frase')` i mostra la frase en pantalla.

**Pista:** usa `Math.random()` per a triar un índex aleatori de l'array, o `Random.nextInt(longitud)`.

---

## ⭐ Exercici 2: Formulari de contacte amb POST

Crea una ruta `/contacto` que servisca un formulari HTML (GET) amb camps `nombre` i `mensaje`, i una ruta `/enviar` que reba les dades per POST i les mostre en una pàgina de confirmació.

**Pista:** en el handler de `/enviar` comprova `"POST".equals(e.getRequestMethod())` i llig el cos amb `e.getRequestBody().readAllBytes()`. El format del cos és `nombre=Ana&mensaje=Hola`.

---

## ⭐ Exercici 3: Pedra, paper, tisora online

Endpoint `POST /api/jugar` que rep:

```json
{"jugada": "piedra"}
```

I torna:

```json
{"jugadaPC": "tijera", "resultado": "ganaste"}
```

Regles clàssiques: pedra > tisora, tisora > paper, paper > pedra.

Frontend: tres botons amb emojis 🪨📄✂️. Al fer clic, envia la jugada i mostra el resultat.

**Pista:** la jugada del PC es tria amb `Random`. Les regles es poden implementar amb un `Map<String, String>` on la clau venç el valor: `{"piedra": "tijera", "tijera": "papel", "papel": "piedra"}`.

---

## ⭐⭐ Exercici 4: El temps que NO fa

Crea `GET /api/clima?ciudad=Madrid` que torne un JSON amb dades meteorològiques **aleatòries** (generades cada vegada):

```json
{"ciudad": "Madrid", "temperatura": 28, "humedad": 45, "estado": "soleado"}
```

Estats possibles: `"soleado"`, `"nublado"`, `"lluvia"`, `"tormenta"`. Frontend amb emojis i temperatures de colors.

**Pista:** usa `String[] estados = {...}` i tria aleatòriament. La temperatura pot ser `random.nextInt(40) - 5`.

---

## ⭐⭐ Exercici 5: Traductor xungo (però funcional)

Implementa un endpoint `POST /api/traducir` que reba:

```json
{"texto": "hola", "idioma": "en"}
```

I torne:

```json
{"traduccion": "hello"}
```

Usa un `HashMap<String, HashMap<String, String>>` com a diccionari. Fica almenys 10 paraules en espanyol traduïdes a anglés i francés.

**Pista:** inicialitza el diccionari amb blocs `static`. `diccionario.get("hola").get("en")` et dona `"hello"`. Els mapes els vas vore a la U11.

---

## ⭐⭐ Exercici 6: API REST de tasques amb prioritat

Implementa un CRUD complet de tasques on cada tasca té: `id`, `titol`, `prioritat` (`"ALTA"`, `"MITJA"`, `"BAIXA"`).

| Mètode | Ruta | Descripció |
|--------|------|-------------|
| GET | `/api/tareas` | Llista totes |
| POST | `/api/tareas` | Crea una (JSON: `{"titulo": "...", "prioridad": "ALTA"}`) |
| PUT | `/api/tareas/{id}` | Canvia prioritat (JSON: `{"prioridad": "BAJA"}`) |
| DELETE | `/api/tareas/{id}` | Borra una |

Frontend: taula amb colors de fons segons prioritat (roig ALTA, groc MITJA, verd BAIXA). Botons per a crear, canviar prioritat i borrar.

**Pista:** guarda les tasques en un `ConcurrentHashMap<Integer, Tarea>` amb un `AtomicInteger` per als IDs. Per al path param, parseja la ruta amb `substring`.

---

## ⭐⭐ Exercici 7: Client GET — els repos de GitHub

Usa `HttpClient` per a consultar l'API de GitHub (`https://api.github.com/users/{usuario}/repos`) i mostrar només el **nom** i el **llenguatge** de cada repositori d'un usuari (que es demana pel teclat). Després guarda els resultats en un fitxer `repos.txt`.

**Pista:** parseja la resposta amb Gson (`JsonArray`), recórre-la, i escriu amb `Files.writeString` (els fitxers els vas vore a la U13). Recorda la capçalera `User-Agent`, que GitHub exigix.

---

## ⭐⭐ Exercici 8: Client POST — crear una publicació a jsonplaceholder

Usa `HttpClient` per a fer un `POST` a `https://jsonplaceholder.typicode.com/posts` amb un cos JSON:

```json
{"title": "Mi primera API", "body": "Consumida desde Java", "userId": 1}
```

Mostra el codi d'estat i el cos de la resposta. Comprova que la capçalera `Content-Type: application/json` està posada.

**Pista:** `HttpRequest.newBuilder().uri(...).header("Content-Type", "application/json").POST(HttpRequest.BodyPublishers.ofString(json)).build()`.

---

## ⭐⭐⭐ Exercici 9: Middleware de logging

Crea una classe `LoggerMiddleware` que embolique qualsevol `HttpHandler` i registre en consola:

```
[2026-06-21 14:30:01] GET /api/peliculas → 200 (15ms)
[2026-06-21 14:30:05] POST /api/tareas → 201 (3ms)
```

Ha de poder aplicar-se a qualsevol handler així:

```java
server.createContext("/api", new LoggerMiddleware(new TareasHandler()));
```

**Pista:** guarda `System.currentTimeMillis()` abans i després de cridar el handler original. Usa `e.getRequestMethod()`, `e.getRequestURI()` i `e.getResponseCode()` (després d'enviar capçaleres)

---

## ⭐⭐⭐ Exercici 10: la petició asíncrona amb sendAsync

Usa `HttpClient` per a demanar dades a l'API pública de GitHub **sense bloquejar el fil principal** amb `sendAsync()`. Descarrega els repos d'un usuari i, quan arribe la resposta, imprimeix el nombre de repos i el codi d'estat.

```java
// Esquelet per a completar
HttpClient client = HttpClient.newHttpClient();
HttpRequest peticio = HttpRequest.newBuilder()
        .uri(URI.create("https://api.github.com/users/google/repos"))
        .GET()
        .build();
```

Completa el programa perquè:
- Use `sendAsync(peticio, HttpResponse.BodyHandlers.ofString())`.
- Encadene `.thenAccept(...)` per a processar la resposta quan arribe (imprimeix `statusCode()` i, si és 200, compta les aparicions de `"full_name"` en el JSON amb `split`).
- Afig un `System.out.println("Petició llançada, seguim treballant...");` ABANS que arribe la resposta, per a demostrar que el fil no es va bloquejar.

**Pista:** `sendAsync` torna un `CompletableFuture<HttpResponse<String>>`. El `thenAccept` rep la resposta quan estiga llesta, però el `main` continua corrent mentrestant. Perquè el programa no acabe abans que arribe la resposta, espera al final amb `.join()` sobre el `CompletableFuture`. Sense el `join()`, el `main` s'acaba i la petició es perd.

<details>
<summary>🔄 Solució</summary>

```java
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class ReposAsync {
    public static void main(String[] args) {
        HttpClient client = HttpClient.newHttpClient();

        HttpRequest peticio = HttpRequest.newBuilder()
                .uri(URI.create("https://api.github.com/users/google/repos"))
                .GET()
                .build();

        System.out.println("Petició llançada, seguim treballant...");

        client.sendAsync(peticio, HttpResponse.BodyHandlers.ofString())
                .thenAccept(resposta -> {
                    System.out.println("Resposta rebuda: codi " + resposta.statusCode());
                    if (resposta.statusCode() == 200) {
                        int repos = resposta.body().split("\"full_name\"").length - 1;
                        System.out.println("Repos de google: " + repos);
                    } else {
                        System.out.println("Alguna cosa ha fallat (límit de l'API?): " + resposta.body().substring(0, 80));
                    }
                })
                .join();  // espera que acabe abans de finalitzar el main
    }
}
```

La màgia està en l'ordre de les eixides: "Petició llançada" s'imprimeix **abans** de "Resposta rebuda", encara que la petició es va llançar abans. Això és `sendAsync`: el fil principal no es deté esperant la xarxa; el `thenAccept` s'executa quan arribe la resposta. El `join()` al final és imprescindible: sense ell, el `main` acabaria i la JVM es tancaria abans que arribara la resposta. El comptatge de repos amb `split("\"full_name\"")` és un truc ràpid de JSON sense llibreria: cada repo apareix com un `"full_name"` en la llista.

</details>.