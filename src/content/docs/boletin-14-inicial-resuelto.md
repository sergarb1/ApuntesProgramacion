---
title: "Boletín 14 - Inicial Resuelto: Servir y Consumir APIs con Web"
nav_order: 14
---
Los mismos ejercicios con soluciones paso a paso.

## Ejercicio 1: Hola Mundo Web

```java
import com.sun.net.httpserver.HttpServer;
import java.io.OutputStream;
import java.net.InetSocketAddress;

public class HolaMundoWeb {
    public static void main(String[] args) throws Exception {
        HttpServer server = HttpServer.create(new InetSocketAddress(8080), 0);
        server.createContext("/", e -> {
            String resp = "Hola Mundo";
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

## Ejercicio 2: Hora del servidor

```java
server.createContext("/hora", e -> {
    String resp = java.time.LocalDateTime.now().toString();
    e.sendResponseHeaders(200, resp.getBytes().length);
    e.getResponseBody().write(resp.getBytes());
    e.getResponseBody().close();
});
```

## Ejercicio 3: HTML bonito

```java
server.createContext("/", e -> {
    String html = """
        <html><head><meta charset="UTF-8"><title>Mi Web</title>
        <style>body{background:#e0f7e0;font-family:sans-serif;padding:2em}</style>
        </head><body><h1>Bienvenido</h1><p>Esto es HTML servido desde Java.</p>
        </body></html>
        """;
    e.getResponseHeaders().set("Content-Type", "text/html; charset=UTF-8");
    e.sendResponseHeaders(200, html.getBytes().length);
    e.getResponseBody().write(html.getBytes());
    e.getResponseBody().close();
});
```

## Ejercicio 4: Saludo personalizado

```java
server.createContext("/saludo", e -> {
    String query = e.getRequestURI().getQuery();
    String nombre = "Mundo";
    if (query != null && query.startsWith("nombre="))
        nombre = java.net.URLDecoder.decode(query.split("=")[1], "UTF-8");
    String html = "<h1>Hola, " + nombre + "!</h1>";
    e.getResponseHeaders().set("Content-Type", "text/html; charset=UTF-8");
    e.sendResponseHeaders(200, html.getBytes().length);
    e.getResponseBody().write(html.getBytes());
    e.getResponseBody().close();
});
```

## Ejercicio 5: Contador de visitas

```java
public class ContadorVisitas {
    static int visitas = 0;
    public static void main(String[] args) throws Exception {
        HttpServer server = HttpServer.create(new InetSocketAddress(8080), 0);
        server.createContext("/", e -> {
            visitas++;
            String resp = "Visita #" + visitas;
            e.sendResponseHeaders(200, resp.getBytes().length);
            e.getResponseBody().write(resp.getBytes());
            e.getResponseBody().close();
        });
        server.start();
        System.out.println("http://localhost:8080");
    }
}
```

## Ejercicio 6: Tabla HTML

```java
server.createContext("/tabla", e -> {
    StringBuilder sb = new StringBuilder("<table border=1>");
    sb.append("<tr><th>N</th><th>N²</th></tr>");
    for (int i = 1; i <= 10; i++)
        sb.append("<tr><td>").append(i).append("</td><td>").append(i*i).append("</td></tr>");
    sb.append("</table>");
    String html = "<html><body>" + sb + "</body></html>";
    e.getResponseHeaders().set("Content-Type", "text/html; charset=UTF-8");
    e.sendResponseHeaders(200, html.getBytes().length);
    e.getResponseBody().write(html.getBytes());
    e.getResponseBody().close();
});
```
