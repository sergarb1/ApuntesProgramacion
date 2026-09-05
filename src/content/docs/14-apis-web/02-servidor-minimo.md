---
title: "02 · Servidor web mínimo con HttpServer"
description: "Tu primer servidor Java: HttpServer, createContext y HttpExchange en menos de 20 líneas 🖥️🚀"
---

<p><small>Tu primer servidor Java: HttpServer, createContext y HttpExchange en menos de 20 líneas 🖥️🚀</small></p>

> 🗺️ **Estás en:** 🌐 **U14 · Servir y Consumir APIs con Web** → 02 · Servidor web mínimo con HttpServer

---

## 📬 La idea en una frase

> **Java trae un servidor HTTP de serie en `com.sun.net.httpserver.HttpServer`: sin Tomcat, sin Spring, sin instalar nada. En menos de 20 líneas tienes un servidor respondiendo en `http://localhost:8080`.**

En el punto anterior viste el protocolo. Ahora toca ponerlo en marcha: no con Tomcat ni con un framework, sino con lo que Java ya lleva dentro desde la versión 6. Es mínimo, es didáctico y, para aprender cómo funciona una petición por dentro, es perfecto.

---

## 🖥️ El servidor mínimo

Copia esto, compila y ejecuta:

```java
import com.sun.net.httpserver.HttpServer;
import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;

public class ServidorMinimo {
    public static void main(String[] args) throws IOException {
        HttpServer server = HttpServer.create(
            new InetSocketAddress(8080), 0
        );
        server.createContext("/", intercambio -> {
            String resp = "Hola, mundo web!";
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

Abre `http://localhost:8080` en tu navegador. **Acabas de crear tu primer servidor web en Java.** Ahora desmontemos las piezas:

- **`HttpServer.create(new InetSocketAddress(8080), 0)`** — crea el servidor en el puerto 8080. El `0` es el número de conexiones en espera (el backlog); con 0 vale.
- **`server.createContext("/", lambda)`** — registra una ruta y le asocia un *handler*: una lambda que recibe un `HttpExchange`, el objeto que representa "una petición que está entrando".
- **`intercambio.sendResponseHeaders(200, longitud)`** — envía el código de estado y el tamaño del cuerpo. Si pasas `0` o `-1`, Java usa *chunked* y no necesitas el tamaño exacto.
- **`getResponseBody().write(...)` y `.close()`** — escribe el cuerpo y cierra el canal. Cerrar es obligatorio: si no, el navegador se queda esperando.
- **`server.setExecutor(null)`** — usa el ejecutor por defecto; cada petición se atiende en un hilo propio.
- **`server.start()`** — arranca. A partir de aquí el `main` no se "acaba": el servidor se queda escuchando.

> 💡 **Consejo:** el `try-with-resources` de la U12 no vale aquí: el servidor debe estar vivo mientras el `main` sigue corriendo. Por eso `start()` no está dentro de un `try`.

---

## 🕶️ Sé el Código, my friend...

> **Don Tip:** el método HTTP lo decide el cliente. `intercambio.getRequestMethod()` te dice cuál ha sido.

Añade justo antes de `server.start()`:

```java
server.createContext("/track", intercambio -> {
    System.out.println("Método: " + intercambio.getRequestMethod());
    System.out.println("URI: " + intercambio.getRequestURI());
    System.out.println("Cabeceras: " + intercambio.getRequestHeaders().entrySet());
    intercambio.getResponseHeaders().add("Content-Type", "text/plain");
    intercambio.sendResponseHeaders(200, 0);
    try (var os = intercambio.getResponseBody()) {
        os.write("Todo ok, gracias por preguntar.".getBytes());
    }
});
```

Abre `http://localhost:8080/track?nombre=Ana&edad=25` y mira la consola del servidor: verás el método, la URI con la query string y todas las cabeceras que te manda el navegador. Es el mejor "espía" que vas a tener en toda la unidad.

<details>
<summary>🔄 ¿Qué esperas ver?</summary>

Algo parecido a esto (simplificado):

```
Método: GET
URI: /track?nombre=Ana&edad=25
Cabeceras: [Host=[localhost:8080], User-Agent=[Mozilla/5.0 ...], Accept=[text/html,...]]
```

Es la petición HTTP del punto 1, destripada y en vivo.

</details>

---

## 🚨 "Address already in use"

El error más típico al arrancar el servidor. Significa que el puerto 8080 ya lo está usando otro proceso (una instancia anterior del tuyo, u otra aplicación). Dos soluciones:

- Cambia el puerto en `new InetSocketAddress(8081, 0)`.
- O encuentra y mata al culpable. En Windows: `netstat -ano | findstr 8080` y luego `taskkill /PID <numero> /F`.

> ⚠️ **Advertencia:** los puertos por debajo de 1024 (como el 80) requieren permisos de administrador. Quédate con el 8080 para desarrollo.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué clase de Java te da un servidor HTTP sin dependencias externas?
2. ¿Qué método de `HttpServer` asocias a una ruta con su handler?
3. ¿Qué objeto recibe tu lambda y qué representa?
4. ¿Qué pasa si olvidas cerrar el `getResponseBody()`?

<details>
<summary>🔄 Respuestas</summary>

1. `com.sun.net.httpserver.HttpServer` (paquete `jdk.httpserver`, incluido en el JDK).
2. `server.createContext("/ruta", handler)`.
3. Un `HttpExchange`, que representa una petición entrante y te da acceso a la petición y a la respuesta.
4. El navegador se queda esperando la respuesta para siempre: el cuerpo no se considera enviado hasta que cierras el canal.

</details>

---

## ✅ Resumen en 3 frases

1. **`HttpServer`** es el servidor HTTP que Java trae de serie: lo creas en un puerto, registras rutas con `createContext` y lo arrancas con `start()`.
2. El **handler** recibe un `HttpExchange` con el que lees la petición, envías el código de estado con `sendResponseHeaders` y escribes el cuerpo con `getResponseBody()`.
3. **Cierra siempre el cuerpo** de la respuesta y recuerda que el servidor no se detiene hasta que tú lo quieras: es tu primera aplicación "que no se acaba".

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `HttpServer` | El servidor HTTP del JDK |
> | `createContext` | Asocia una ruta con su handler |
> | `HttpExchange` | Objeto que representa una petición entrante |
> | Handler | La lambda que procesa cada petición de una ruta |
> | `sendResponseHeaders` | Envía el código de estado (y el tamaño del cuerpo) |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/14-apis-web) · **Anterior:** [01 · El protocolo HTTP en 30 segundos](/ApuntesProgramacion/14-apis-web/01-protocolo-http) · **Siguiente:** [03 · Sirviendo HTML](/ApuntesProgramacion/14-apis-web/03-sirviendo-html)