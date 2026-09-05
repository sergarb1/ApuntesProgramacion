---
title: "Boletín U14 — Inicial Resuelto"
description: "Los mismos ejercicios que el boletín inicial, con soluciones"
---

# 📝 Boletín U14 — Inicial (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## Ejercicio 1: Escribe este programa — Hola, mundo web

<details>
<summary>🔄 Solución</summary>

```java
import com.sun.net.httpserver.HttpServer;
import java.io.OutputStream;
import java.net.InetSocketAddress;

public class HolaMundoWeb {
    public static void main(String[] args) throws Exception {
        HttpServer server = HttpServer.create(new InetSocketAddress(8080), 0);
        server.createContext("/", e -> {
            String resp = "Hola, mundo web!";
            e.sendResponseHeaders(200, resp.getBytes().length);
            OutputStream os = e.getResponseBody();
            os.write(resp.getBytes());
            os.close();
        });
        server.setExecutor(null);
        server.start();
        System.out.println("Servidor en http://localhost:8080");
    }
}
```

`createContext` registra la ruta `/` con su handler; `sendResponseHeaders(200, tamaño)` envía el código y el tamaño del cuerpo (en bytes); `getResponseBody()` escribe el texto y se cierra. El servidor se queda escuchando hasta que lo detengas.

</details>

---

## Ejercicio 2: Escribe este programa — servidor de la hora

<details>
<summary>🔄 Solución</summary>

```java
server.createContext("/hora", e -> {
    String hora = java.time.LocalTime.now().format(
        java.time.format.DateTimeFormatter.ofPattern("HH:mm:ss")
    );
    String resp = "Hora actual: " + hora;
    e.getResponseHeaders().set("Content-Type", "text/plain; charset=UTF-8");
    e.sendResponseHeaders(200, resp.getBytes().length);
    e.getResponseBody().write(resp.getBytes());
    e.getResponseBody().close();
});
```

`LocalTime.now()` se evalúa en cada petición, por eso la hora cambia al recargar. Un servidor sin estado: no recuerda nada entre peticiones.

</details>

---

## Ejercicio 3: Escribe este programa — página que dice tu nombre

<details>
<summary>🔄 Solución</summary>

```java
server.createContext("/saludo", e -> {
    String query = e.getRequestURI().getQuery();
    String nombre = "desconocido";
    if (query != null && query.startsWith("nombre=")) {
        nombre = java.net.URLDecoder.decode(query.split("=")[1], "UTF-8");
    }
    String html = "<h1>¡Hola, " + nombre + "!</h1>";
    e.getResponseHeaders().set("Content-Type", "text/html; charset=UTF-8");
    e.sendResponseHeaders(200, html.getBytes().length);
    e.getResponseBody().write(html.getBytes());
    e.getResponseBody().close();
});
```

La query string llega como `nombre=Pepe` y se divide por `=`. El `URLDecoder` convierte cosas como `%20` en espacios (si el nombre fuera "Ana M."). Si no hay query, el valor por defecto es `desconocido`.

</details>

---

## Ejercicio 4: Escribe este programa — contador de visitas global

<details>
<summary>🔄 Solución</summary>

```java
import com.sun.net.httpserver.HttpServer;
import java.net.InetSocketAddress;

public class ContadorVisitas {
    static int visitas = 0;

    public static void main(String[] args) throws Exception {
        HttpServer server = HttpServer.create(new InetSocketAddress(8080), 0);
        server.createContext("/", e -> {
            visitas++;
            String resp = "Eres el visitante número " + visitas;
            e.sendResponseHeaders(200, resp.getBytes().length);
            e.getResponseBody().write(resp.getBytes());
            e.getResponseBody().close();
        });
        server.setExecutor(null);
        server.start();
        System.out.println("Servidor en http://localhost:8080");
    }
}
```

`static int visitas` vive en la clase, no en ninguna petición, así que sobrevive entre visitas. Si dos personas recargan a la vez, ambas podrían leer el mismo valor antes de incrementar (problema de concurrencia). Para aprender, vale; para producción, `AtomicInteger`.

</details>

---

## Ejercicio 5: Escribe este programa — generador de excusas para entregas tarde

<details>
<summary>🔄 Solución</summary>

```java
server.createContext("/excusa", e -> {
    String[] sujetos = {"Mi perro", "GitHub", "El plugin de IntelliJ", "La conexión"};
    String[] verbos  = {"se comió", "borró", "corrompió", "perdió"};
    String[] objetos = {"el examen", "la práctica", "los apuntes", "mi paciencia"};

    java.util.Random r = new java.util.Random();
    String excusa = sujetos[r.nextInt(sujetos.length)] + " "
        + verbos[r.nextInt(verbos.length)] + " "
        + objetos[r.nextInt(objetos.length)];

    String html = "<h1>Tu excusa para hoy</h1><p><em>" + excusa + "</em></p>";
    e.getResponseHeaders().set("Content-Type", "text/html; charset=UTF-8");
    e.sendResponseHeaders(200, html.getBytes().length);
    e.getResponseBody().write(html.getBytes());
    e.getResponseBody().close();
});
```

`Random.nextInt(longitud)` elige un índice aleatorio de cada array sin pasarse. Tres decisiones aleatorias = una excusa nueva en cada recarga. Recuerda: `nextInt(n)` va de 0 a `n-1`.

</details>

---

## Ejercicio 6: Escribe este programa — tabla de multiplicar personalizada

<details>
<summary>🔄 Solución</summary>

```java
server.createContext("/tabla", e -> {
    String query = e.getRequestURI().getQuery();
    int num = 5;
    if (query != null && query.startsWith("num=")) {
        num = Integer.parseInt(query.split("=")[1]);
    }

    StringBuilder sb = new StringBuilder("<table border=1>");
    sb.append("<tr><th>").append(num).append(" × n</th><th>Resultado</th></tr>");
    for (int i = 1; i <= 10; i++) {
        String color = (i % 2 == 0) ? "#e0f7e0" : "#ffffff";
        sb.append("<tr style=\"background:").append(color).append("\">")
          .append("<td>").append(num).append(" × ").append(i).append("</td>")
          .append("<td>").append(num * i).append("</td></tr>");
    }
    sb.append("</table>");

    String html = "<html><body>" + sb + "</body></html>";
    e.getResponseHeaders().set("Content-Type", "text/html; charset=UTF-8");
    e.sendResponseHeaders(200, html.getBytes().length);
    e.getResponseBody().write(html.getBytes());
    e.getResponseBody().close();
});
```

El `StringBuilder` monta el HTML de la tabla fila a fila (es más eficiente que concatenar con `+` en un bucle). Las filas pares llevan un fondo verde claro para alternar colores. Si no hay `num=`, se usa el 5.

</details>

---

## Ejercicio 7: Escribe este programa — conversor de euros a pesetas

<details>
<summary>🔄 Solución</summary>

```java
server.createContext("/conversor", e -> {
    String query = e.getRequestURI().getQuery();
    double euros = 50;
    if (query != null && query.startsWith("euros=")) {
        euros = Double.parseDouble(query.split("=")[1]);
    }
    double pesetas = euros * 166.386;
    String html = "<h1>" + String.format("%.2f", euros) + " euros son "
        + String.format("%.2f", pesetas) + " pesetas</h1>";
    e.getResponseHeaders().set("Content-Type", "text/html; charset=UTF-8");
    e.sendResponseHeaders(200, html.getBytes().length);
    e.getResponseBody().write(html.getBytes());
    e.getResponseBody().close();
});
```

`String.format("%.2f", valor)` redondea a dos decimales. Se multiplica por 166.386 (el cambio oficial). Un ejercicio clásico de GET: la entrada viaja en la URL y la salida es HTML.

</details>

---

## Ejercicio 8: Escribe este programa — página de estado del servidor

<details>
<summary>🔄 Solución</summary>

```java
server.createContext("/estado", e -> {
    String json = "{\"servidor\":\"ok\","
        + "\"hora\":\"" + java.time.LocalTime.now().format(
            java.time.format.DateTimeFormatter.ofPattern("HH:mm:ss")) + "\","
        + "\"visitas\":" + visitas + ","
        + "\"version\":\"1.0\","
        + "\"autor\":\"Tu nombre aquí\"}";
    e.getResponseHeaders().set("Content-Type", "application/json");
    e.sendResponseHeaders(200, json.getBytes().length);
    e.getResponseBody().write(json.getBytes());
    e.getResponseBody().close();
});
```

La cabecera `Content-Type: application/json` es lo que convierte esto en una API: sin ella, el navegador y `fetch` tratarían el texto como HTML o texto plano. Fíjate en cómo se escapan las comillas del JSON dentro del código Java.

</details>

---

## Ejercicio 9: Encuentra el error — el Content-Type olvidado

<details>
<summary>🔄 Solución</summary>

Falta **`Content-Type: application/json`**. Sin esa cabecera, `fetch` no sabe que la respuesta es JSON y `r.json()` falla (o devuelve basura). El texto llega, pero el navegador lo interpreta como texto plano.

La solución es añadir una línea antes de enviar las cabeceras:

```java
intercambio.getResponseHeaders().set("Content-Type", "application/json");
```

Esta es la lección que se repite en toda la unidad: **la cabecera correcta es la diferencia entre "funciona" y "funciona en mi máquina pero el frontend se queja"**.

</details>