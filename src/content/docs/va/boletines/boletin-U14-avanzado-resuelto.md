---
title: "Butlletí U14 — Avançat Resolt"
description: "Els mateixos exercicis que el butlletí avançat, amb solucions"
---

# 📝 Butlletí U14 — Avançat (Resolt)

> Les solucions estan amagades en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## ⭐ Exercici 1: API de frases motivacionals

<details>
<summary>🔄 Solució</summary>

```java
import com.sun.net.httpserver.HttpServer;
import java.net.InetSocketAddress;
import java.util.Random;

public class ApiFrases {

    static String[] frases = {
        "El código limpio es como un buen chiste: si tienes que explicarlo, es malo",
        "La mejor forma de predecir el futuro es implementarlo",
        "Primero resuelve el problema, luego escribe el código"
    };
    static String[] autores = {"Alguien que sabe", "Alan Kay", "John Johnson"};

    public static void main(String[] args) throws Exception {
        HttpServer server = HttpServer.create(new InetSocketAddress(8080), 0);
        Random r = new Random();

        server.createContext("/api/frase", e -> {
            int i = r.nextInt(frases.length);
            String json = "{\"frase\":\"" + frases[i] + "\",\"autor\":\"" + autores[i] + "\"}";
            e.getResponseHeaders().set("Content-Type", "application/json");
            e.sendResponseHeaders(200, json.getBytes().length);
            e.getResponseBody().write(json.getBytes());
            e.getResponseBody().close();
        });

        server.setExecutor(null);
        server.start();
        System.out.println("Servidor en http://localhost:8080");
    }
}
```

`Random.nextInt(longitud)` tria un índex aleatori de l'array de frases. El `Content-Type: application/json` convertix la resposta en una API que el `fetch` del frontend pot llegir amb `r.json()`.

</details>

---

## ⭐ Exercici 2: Formulari de contacte amb POST

<details>
<summary>🔄 Solució</summary>

```java
server.createContext("/contacto", e -> {
    String html = """
        <form action="/enviar" method="POST">
          <input name="nombre" placeholder="Tu nombre"><br>
          <textarea name="mensaje" placeholder="Tu mensaje"></textarea><br>
          <button>Enviar</button>
        </form>
        """;
    e.getResponseHeaders().set("Content-Type", "text/html; charset=UTF-8");
    e.sendResponseHeaders(200, html.getBytes().length);
    e.getResponseBody().write(html.getBytes());
    e.getResponseBody().close();
});

server.createContext("/enviar", e -> {
    if ("POST".equals(e.getRequestMethod())) {
        String datos = new String(e.getRequestBody().readAllBytes());
        // datos = "nombre=Ana&mensaje=Hola"
        String nombre = extraer(datos, "nombre");
        String mensaje = extraer(datos, "mensaje");
        String html = "<h1>Gràcies, " + nombre + "!</h1><p>" + mensaje + "</p>";
        e.getResponseHeaders().set("Content-Type", "text/html; charset=UTF-8");
        e.sendResponseHeaders(200, html.getBytes().length);
        e.getResponseBody().write(html.getBytes());
        e.getResponseBody().close();
    } else {
        e.sendResponseHeaders(405, -1);  // Method Not Allowed
        e.close();
    }
});

static String extraer(String datos, String clave) {
    for (String par : datos.split("&")) {
        String[] t = par.split("=");
        if (t.length == 2 && t[0].equals(clave)) return t[1];
    }
    return "?";
}
```

GET servix el formulari, POST rep les dades del cos i les torna en una pàgina de confirmació. El `405` per a mètodes que no siguen POST és la guinda professional: l'API no es calla, respon "mètode no permés".

</details>

---

## ⭐ Exercici 3: Pedra, paper, tisora online

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Map;
import java.util.Random;

static Map<String, String> regles = Map.of(
    "piedra", "tijera", "tijera", "papel", "papel", "piedra"
);

server.createContext("/api/jugar", e -> {
    if ("POST".equals(e.getRequestMethod())) {
        String body = new String(e.getRequestBody().readAllBytes());
        // body = {"jugada": "piedra"}
        String jugada = body.split("\"jugada\":\"")[1].split("\"")[0];
        String pc = new String[]{"piedra", "papel", "tijera"}[new Random().nextInt(3)];

        String resultado;
        if (jugada.equals(pc)) {
            resultado = "empate";
        } else if (regles.get(jugada) != null && regles.get(jugada).equals(pc)) {
            resultado = "ganaste";
        } else {
            resultado = "perdiste";
        }

        String json = "{\"jugadaPC\":\"" + pc + "\",\"resultado\":\"" + resultado + "\"}";
        e.getResponseHeaders().set("Content-Type", "application/json");
        e.sendResponseHeaders(200, json.getBytes().length);
        e.getResponseBody().write(json.getBytes());
        e.getResponseBody().close();
    }
});
```

El `Map` `regles` codifica "qui venç a qui": si `regles.get(jugada).equals(pc)`, guanyes. El `Random` tria la jugada del PC entre tres opcions. L'extracció de la jugada del JSON es fa amb `split` (didàctic); en producció, Gson.

</details>

---

## ⭐⭐ Exercici 4: El temps que NO fa

<details>
<summary>🔄 Solució</summary>

```java
server.createContext("/api/clima", e -> {
    String query = e.getRequestURI().getQuery();
    String ciudad = "Madrid";
    if (query != null && query.startsWith("ciudad=")) {
        ciudad = query.split("=")[1];
    }

    Random r = new Random();
    String[] estados = {"soleado", "nublado", "lluvia", "tormenta"};
    int temperatura = r.nextInt(40) - 5;   // de -5 a 34
    int humedad = r.nextInt(101);          // de 0 a 100
    String estado = estados[r.nextInt(estados.length)];

    String json = "{\"ciudad\":\"" + ciudad + "\",\"temperatura\":" + temperatura
        + ",\"humedad\":" + humedad + ",\"estado\":\"" + estado + "\"}";
    e.getResponseHeaders().set("Content-Type", "application/json");
    e.sendResponseHeaders(200, json.getBytes().length);
    e.getResponseBody().write(json.getBytes());
    e.getResponseBody().close();
});
```

El rang de temperatura ix de `nextInt(40) - 5` (desplaçar el rang de 0-39 a -5 a 34). Cada recàrrega genera dades diferents: un "clima" fals, però el patró d'una API amb query param i resposta JSON és exactament el de les de veritat.

</details>

---

## ⭐⭐ Exercici 5: Traductor xungo (però funcional)

<details>
<summary>🔄 Solució</summary>

```java
import java.util.HashMap;
import java.util.Map;

static Map<String, Map<String, String>> diccionario = new HashMap<>();
static {
    Map<String, String> hola = new HashMap<>();
    hola.put("en", "hello");
    hola.put("fr", "bonjour");
    diccionario.put("hola", hola);

    Map<String, String> adios = new HashMap<>();
    adios.put("en", "goodbye");
    adios.put("fr", "au revoir");
    diccionario.put("adios", adios);

    Map<String, String> gracias = new HashMap<>();
    gracias.put("en", "thank you");
    gracias.put("fr", "merci");
    diccionario.put("gracias", gracias);
    // ... afig almenys 7 més
}

server.createContext("/api/traducir", e -> {
    if ("POST".equals(e.getRequestMethod())) {
        String body = new String(e.getRequestBody().readAllBytes());
        // body = {"texto": "hola", "idioma": "en"}
        String texto = body.split("\"texto\":\"")[1].split("\"")[0];
        String idioma = body.split("\"idioma\":\"")[1].split("\"")[0];

        String traduccion = diccionario.getOrDefault(texto, Map.of())
            .getOrDefault(idioma, "¿?");
        String json = "{\"traduccion\":\"" + traduccion + "\"}";
        e.getResponseHeaders().set("Content-Type", "application/json");
        e.sendResponseHeaders(200, json.getBytes().length);
        e.getResponseBody().write(json.getBytes());
        e.getResponseBody().close();
    }
});
```

Un mapa dins d'un altre: la paraula en espanyol és la clau de l'exterior, i el mapa interior associa idioma amb traducció. `getOrDefault` evita el `NullPointerException` quan la paraula o l'idioma no existixen. Els mapes, com a la U11.

</details>

---

## ⭐⭐ Exercici 6: API REST de tasques amb prioritat

<details>
<summary>🔄 Solució</summary>

```java
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

record Tarea(int id, String titulo, String prioridad) {}

static ConcurrentHashMap<Integer, Tarea> tareas = new ConcurrentHashMap<>();
static AtomicInteger contador = new AtomicInteger(1);

// Llistar
server.createContext("/api/tareas", e -> {
    if ("GET".equals(e.getRequestMethod())) {
        StringBuilder sb = new StringBuilder("[");
        boolean primero = true;
        for (Tarea t : tareas.values()) {
            if (!primero) sb.append(",");
            sb.append("{\"id\":").append(t.id())
              .append(",\"titulo\":\"").append(t.titulo())
              .append("\",\"prioridad\":\"").append(t.prioridad()).append("\"}");
            primero = false;
        }
        sb.append("]");
        e.getResponseHeaders().set("Content-Type", "application/json");
        e.sendResponseHeaders(200, sb.toString().getBytes().length);
        e.getResponseBody().write(sb.toString().getBytes());
        e.getResponseBody().close();
    } else if ("POST".equals(e.getRequestMethod())) {
        String body = new String(e.getRequestBody().readAllBytes());
        String titulo = body.split("\"titulo\":\"")[1].split("\"")[0];
        String prioridad = body.split("\"prioridad\":\"")[1].split("\"")[0];
        Tarea nueva = new Tarea(contador.getAndIncrement(), titulo, prioridad);
        tareas.put(nueva.id(), nueva);
        String json = "{\"id\":" + nueva.id() + "}";
        e.getResponseHeaders().set("Content-Type", "application/json");
        e.sendResponseHeaders(201, json.getBytes().length);
        e.getResponseBody().write(json.getBytes());
        e.getResponseBody().close();
    }
});

// Actualitzar i esborrar per ID
server.createContext("/api/tareas/", e -> {
    String ruta = e.getRequestURI().getPath();
    int id = Integer.parseInt(ruta.substring("/api/tareas/".length()));
    Tarea t = tareas.get(id);
    if (t == null) {
        e.getResponseHeaders().set("Content-Type", "application/json");
        String err = "{\"error\":\"no encontrada\"}";
        e.sendResponseHeaders(404, err.getBytes().length);
        e.getResponseBody().write(err.getBytes());
        e.getResponseBody().close();
        return;
    }
    if ("PUT".equals(e.getRequestMethod())) {
        String body = new String(e.getRequestBody().readAllBytes());
        String prioridad = body.split("\"prioridad\":\"")[1].split("\"")[0];
        tareas.put(id, new Tarea(id, t.titulo(), prioridad));
        e.sendResponseHeaders(200, -1);
        e.close();
    } else if ("DELETE".equals(e.getRequestMethod())) {
        tareas.remove(id);
        e.sendResponseHeaders(204, -1);
        e.close();
    }
});
```

`ConcurrentHashMap` + `AtomicInteger` aguanten peticions simultànies sense corrompre's. El `404` quan l'ID no existix és el comportament correcte d'una API REST que es respecta. El `201` en crear i el `204` en esborrar arredonixen la bona conducta.

</details>

---

## ⭐⭐ Exercici 7: Client GET — els repos de GitHub

<details>
<summary>🔄 Solució</summary>

```java
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Scanner;

public class GitHubCliente {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        System.out.print("Usuari de GitHub: ");
        String usuario = sc.nextLine();
        sc.close();

        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
            .uri(URI.create("https://api.github.com/users/" + usuario + "/repos"))
            .header("User-Agent", "ClienteJava/1.0")
            .GET()
            .build();

        HttpResponse<String> response = client.send(request,
            HttpResponse.BodyHandlers.ofString());

        if (response.statusCode() == 200) {
            JsonArray repos = new Gson().fromJson(response.body(), JsonArray.class);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < repos.size(); i++) {
                JsonObject repo = repos.get(i).getAsJsonObject();
                String nombre = repo.get("name").getAsString();
                String lenguaje = repo.has("language") && !repo.get("language").isJsonNull()
                    ? repo.get("language").getAsString() : "?";
                sb.append(nombre).append(" (").append(lenguaje).append(")\n");
                System.out.println("⭐ " + nombre + " (" + lenguaje + ")");
            }
            Files.writeString(Path.of("repos.txt"), sb.toString());
            System.out.println("Guardado en repos.txt");
        } else {
            System.out.println("Error " + response.statusCode() + " — existeix l'usuari?");
        }
    }
}
```

`HttpClient` demana, Gson parseja i `Files.writeString` guarda: el trio complet del costat client. La capçalera `User-Agent` és obligatòria a GitHub (sense ella, rebutja la petició). El `has(...)` evita el drama quan el camp `language` no existix o és `null`.

</details>

---

## ⭐⭐ Exercici 8: Client POST — crear una publicació a jsonplaceholder

<details>
<summary>🔄 Solució</summary>

```java
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class ClientePOST {
    public static void main(String[] args) throws Exception {
        HttpClient client = HttpClient.newHttpClient();

        String json = """
            {"title": "Mi primera API",
             "body": "Consumida desde Java",
             "userId": 1}
            """;

        HttpRequest request = HttpRequest.newBuilder()
            .uri(URI.create("https://jsonplaceholder.typicode.com/posts"))
            .header("Content-Type", "application/json")
            .POST(HttpRequest.BodyPublishers.ofString(json))
            .build();

        HttpResponse<String> response = client.send(request,
            HttpResponse.BodyHandlers.ofString());

        System.out.println("Código: " + response.statusCode());
        System.out.println("Respuesta: " + response.body());
    }
}
```

jsonplaceholder et torna el recurs creat amb el seu nou ID: `201` (Created). El `Content-Type: application/json` és el que li diu al servidor que el cos és JSON. Sense ell, jsonplaceholder respon `415` (Unsupported Media Type).

</details>

---

## ⭐⭐⭐ Exercici 9: Middleware de logging

<details>
<summary>🔄 Solució</summary>

```java
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class LoggerMiddleware implements HttpHandler {

    private final HttpHandler original;

    public LoggerMiddleware(HttpHandler original) {
        this.original = original;
    }

    @Override
    public void handle(HttpExchange e) throws IOException {
        long inicio = System.currentTimeMillis();
        try {
            original.handle(e);
        } finally {
            long duracion = System.currentTimeMillis() - inicio;
            String fecha = LocalDateTime.now().format(
                DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            System.out.printf("[%s] %s %s → %d (%dms)%n",
                fecha, e.getRequestMethod(), e.getRequestURI(),
                e.getResponseCode(), duracion);
        }
    }
}
```

I s'usa així, embolicant qualsevol handler:

```java
server.createContext("/api", new LoggerMiddleware(new TareasHandler()));
```

El truc: `LoggerMiddleware` **implementa el mateix contracte** (`HttpHandler`) i embolica l'original. El `try/finally` garantix que el log s'imprimeix encara que el handler falle. `getResponseCode()` només val després d'enviar capçaleres, per això es llig al final. A això se li diu *decorator* o middleware: emboliques un handler amb un altre que afig comportament.

</details>