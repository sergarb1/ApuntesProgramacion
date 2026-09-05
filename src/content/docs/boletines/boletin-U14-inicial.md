---
title: "Boletín U14 — Inicial"
description: "Ejercicios básicos de APIs web: HttpServer, servir HTML, parámetros GET y primeros JSON"
---

# 📝 Boletín U14 — Inicial

> Sin soluciones. Sin prisas. Abre el IDE, crea tu primer `HttpServer` y haz que el navegador te hable de tú a tú. Prometo que ningún bit saldrá herido. Empieza suave, que la web muerde poco a poco.

---

## Ejercicio 1: Escribe este programa — Hola, mundo web

Crea un servidor HTTP en el puerto 8080 con una ruta `/` que devuelva el texto `Hola, mundo web!`. Abre `http://localhost:8080` en tu navegador y comprueba que lo ves.

Pista: `HttpServer.create(new InetSocketAddress(8080), 0)`, después `createContext("/", ...)` y `sendResponseHeaders(200, ...)`. No olvides cerrar el cuerpo de la respuesta.

---

## Ejercicio 2: Escribe este programa — servidor de la hora

Añade a tu servidor una ruta `/hora` que devuelva la hora actual en texto plano con formato `HH:mm:ss`.

Cada vez que recargues el navegador, la hora cambia. Magia negra con `LocalTime.now()`.

```java
// Pista:
String hora = java.time.LocalTime.now().format(
    java.time.format.DateTimeFormatter.ofPattern("HH:mm:ss")
);
```

---

## Ejercicio 3: Escribe este programa — página que dice tu nombre

Añade una ruta `/saludo?nombre=Pepe` que devuelva una página HTML con `<h1>¡Hola, Pepe!</h1>`.

Si no se pasa nombre, que diga `¡Hola, desconocido!`.

Pista: `e.getRequestURI().getQuery()` te da `nombre=Pepe`. Divide por `=` y listo.

---

## Ejercicio 4: Escribe este programa — contador de visitas global

Usa una variable `static int visitas = 0`. Cada vez que alguien visita `/`, incrementa el contador y devuelve:

```
Eres el visitante número 47
```

¿Qué pasa si dos personas recargan a la vez? (spoiler: problemas — pero de momento no te preocupes).

---

## Ejercicio 5: Escribe este programa — generador de excusas para entregas tarde

Crea una ruta `/excusa` que devuelva una excusa generada aleatoriamente combinando elementos de tres arrays:

```java
String[] sujetos = {"Mi perro", "GitHub", "El plugin de IntelliJ", "La conexión"};
String[] verbos  = {"se comió", "borró", "corrompió", "perdió"};
String[] objetos = {"el examen", "la práctica", "los apuntes", "mi paciencia"};
```

Ejemplo: *"GitHub borró la práctica"*. Devuélvelo en HTML con buena letra.

---

## Ejercicio 6: Escribe este programa — tabla de multiplicar personalizada

Ruta `/tabla?num=7` que genere una tabla HTML completa con la tabla de multiplicar del 7 (del 7×1 al 7×10).

Si no se pasa número, usa el 5 por defecto. Formatea la tabla con `border=1` y colores alternos en las filas.

---

## Ejercicio 7: Escribe este programa — conversor de euros a pesetas (sí, pesetas)

Ruta `/conversor?euros=50` que devuelva HTML con el resultado: "50 euros son 8319.3 pesetas".

1 € = 166.386 pts. Muestra dos decimales.

Pista: `String.format("%.2f", valor)` para los decimales. Sí, pesetas. Si eres joven, pregúntale a un viejo qué era eso.

---

## Ejercicio 8: Escribe este programa — página de estado del servidor

Ruta `/estado` que devuelva un JSON con esta pinta:

```json
{
    "servidor": "ok",
    "hora": "14:30:01",
    "visitas": 47,
    "version": "1.0",
    "autor": "Tu nombre aquí"
}
```

No olvides el `Content-Type: application/json` o el navegador se pondrá tonto.

---

## Ejercicio 9: Encuentra el error — el Content-Type olvidado

Un compañero te enseña este handler y jura que devuelve JSON:

```java
server.createContext("/api/frase", intercambio -> {
    String json = """
        {"frase": "El código limpio es como un buen chiste"}
        """;
    intercambio.sendResponseHeaders(200, json.getBytes().length);
    intercambio.getResponseBody().write(json.getBytes());
    intercambio.getResponseBody().close();
});
```

El navegador muestra el texto, pero el `fetch` que lo consume se queja: `r.json()` peta. ¿Qué falta y por qué es tan importante?