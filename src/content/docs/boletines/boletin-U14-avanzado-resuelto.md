---
title: "Boletín U14 — Avanzado Resuelto"
description: "Los mismos ejercicios que el boletín avanzado, con soluciones"
---

# 📝 Boletín U14 — Avanzado (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## ⭐ Ejercicio 1: API de frases motivacionales

<details>
<summary>🔄 Solución</summary>

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

`Random.nextInt(longitud)` elige un índice aleatorio del array de frases. El `Content-Type: application/json` convierte la respuesta en una API que el `fetch` del frontend puede leer con `r.json()`.

</details>

---

## ⭐ Ejercicio 2: Formulario de contacto con POST

<details>
<summary>🔄 Solución</summary>

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
        String html = "<h1>Gracias, " + nombre + "!</h1><p>" + mensaje + "</p>";
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

GET sirve el formulario, POST recibe los datos del cuerpo y los devuelve en una página de confirmación. El `405` para métodos que no sean POST es la guinda profesional: la API no se calla, responde "método no permitido".

</details>

---

## ⭐ Ejercicio 3: Piedra, papel, tijera online

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Map;
import java.util.Random;

static Map<String, String> reglas = Map.of(
    "piedra", "tijera", "tijera", "papel", "papel", "piedra"
);

server.createContext("/api/jugar", e -> {
    if ("POST".equals(e.getRequestMethod())) {
        String body = new String(e.getRequestBody().readAllBytes());
        // body = {"jugada": "piedra"}
        String jugada = body.replaceAll("[^a-záéíóúñ]", "").replace("jugada", "").isEmpty()
            ? body.split("\"jugada\":\"")[1].split("\"")[0] : "?";
        String pc = new String[]{"piedra", "papel", "tijera"}[new Random().nextInt(3)];

        String resultado;
        if (jugada.equals(pc)) {
            resultado = "empate";
        } else if (reglas.get(jugada) != null && reglas.get(jugada).equals(pc)) {
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

El `Map` `reglas` codifica "quién vence a quién": si `reglas.get(jugada).equals(pc)`, ganaste. El `Random` elige la jugada del PC entre tres opciones. La extracción de la jugada del JSON se hace con `split` (didáctico); en producción, Gson.

</details>

---

## ⭐⭐ Ejercicio 4: El tiempo que NO hace

<details>
<summary>🔄 Solución</summary>

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

El rango de temperatura sale de `nextInt(40) - 5` (desplazar el rango de 0-39 a -5 a 34). Cada recarga genera datos distintos: un "clima" falso, pero el patrón de una API con query param y respuesta JSON es exactamente el de las de verdad.

</details>

---

## ⭐⭐ Ejercicio 5: Traductor chungo (pero funcional)

<details>
<summary>🔄 Solución</summary>

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
    // ... añade al menos 7 más
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

Un mapa dentro de otro: la palabra en español es la clave del exterior, y el mapa interior asocia idioma con traducción. `getOrDefault` evita el `NullPointerException` cuando la palabra o el idioma no existen. Los mapas, como en la U11.

</details>

---

## ⭐⭐ Ejercicio 6: API REST de tareas con prioridad

<details>
<summary>🔄 Solución</summary>

```java
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

record Tarea(int id, String titulo, String prioridad) {}

static ConcurrentHashMap<Integer, Tarea> tareas = new ConcurrentHashMap<>();
static AtomicInteger contador = new AtomicInteger(1);

// Listar
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

// Actualizar y borrar por ID
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

`ConcurrentHashMap` + `AtomicInteger` aguantan peticiones simultáneas sin corromperse. El `404` cuando el ID no existe es el comportamiento correcto de una API REST que se respeta. El `201` al crear y el `204` al borrar redondean la buena conducta.

</details>

---

## ⭐⭐ Ejercicio 7: Cliente GET — los repos de GitHub

<details>
<summary>🔄 Solución</summary>

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
        System.out.print("Usuario de GitHub: ");
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
            System.out.println("Error " + response.statusCode() + " — ¿existe el usuario?");
        }
    }
}
```

`HttpClient` pide, Gson parsea y `Files.writeString` guarda: el trío completo del lado cliente. La cabecera `User-Agent` es obligatoria en GitHub (sin ella, rechaza la petición). El `has(...)` evita el drama cuando el campo `language` no existe o es `null`.

</details>

---

## ⭐⭐ Ejercicio 8: Cliente POST — crear una publicación en jsonplaceholder

<details>
<summary>🔄 Solución</summary>

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

jsonplaceholder te devuelve el recurso creado con su nuevo ID: `201` (Created). El `Content-Type: application/json` es lo que le dice al servidor que el cuerpo es JSON. Sin él, jsonplaceholder responde `415` (Unsupported Media Type).

</details>

---

## ⭐⭐⭐ Ejercicio 9: Middleware de logging

<details>
<summary>🔄 Solución</summary>

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

Y se usa así, envolviendo cualquier handler:

```java
server.createContext("/api", new LoggerMiddleware(new TareasHandler()));
```

El truco: `LoggerMiddleware` **implementa el mismo contrato** (`HttpHandler`) y envuelve al original. El `try/finally` garantiza que el log se imprime aunque el handler falle. `getResponseCode()` solo vale después de enviar las cabeceras, por eso se lee al final. A esto se le llama *decorator* o middleware: envuelves un handler con otro que añade comportamiento.

</details>