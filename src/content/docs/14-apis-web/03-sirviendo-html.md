---
title: "03 · Sirviendo HTML"
description: "Tu servidor pasa de hablar en texto plano a servir páginas completas: Content-Type, cadenas bien formadas y ficheros 📄🎨"
---

<p><small>Tu servidor pasa de hablar en texto plano a servir páginas completas: Content-Type, cadenas bien formadas y ficheros 📄🎨</small></p>

> 🗺️ **Estás en:** 🌐 **U14 · Servir y Consumir APIs con Web** → 03 · Sirviendo HTML

---

## 📬 La idea en una frase

> **Devolver texto plano es como hablarle al navegador en susurros: se entera, pero no muestra nada bonito. Con `Content-Type: text/html` y una cadena bien formada, tu servidor se convierte en una web de verdad.**

En el punto 2 el servidor contestaba con una frase suelta. Hoy le enseñamos a vestirse: páginas HTML completas. Dos caminos, ambos legítimos: escribirlo directamente en una cadena Java o leerlo desde un fichero (mucho más cómodo cuando la página crece).

---

## 📄 HTML desde una cadena

El paso natural: en lugar de `"Hola, mundo web!"`, devuelves una página completa. Fíjate en el bloque de texto (Java 15+):

```java
server.createContext("/", intercambio -> {
    String html = """
        <!DOCTYPE html>
        <html>
        <head><title>Mi App Java</title>
        <meta charset="UTF-8">
        </head>
        <body>
            <h1>Bienvenido a mi App</h1>
            <p>Esto se sirve desde Java.</p>
        </body>
        </html>
        """;
    intercambio.getResponseHeaders()
        .set("Content-Type", "text/html; charset=UTF-8");
    intercambio.sendResponseHeaders(200, html.getBytes().length);
    intercambio.getResponseBody().write(html.getBytes());
    intercambio.getResponseBody().close();
});
```

Dos detalles importantes:

- **`Content-Type: text/html; charset=UTF-8`** — sin esta cabecera, el navegador puede tratar tu HTML como texto plano o interpretar mal las tildes. El `charset=UTF-8` es obligatorio si tu página lleva caracteres como `á`, `ñ` o `€`.
- **`html.getBytes().length`** — el tamaño del cuerpo en **bytes**, no en caracteres. Una `ñ` ocupa 2 bytes en UTF-8; si pasas `html.length()` (caracteres), el navegador puede quedarse esperando el resto.

> 🐛 **Error típico:** `sendResponseHeaders(200, 0)` con HTML funciona, pero con `0` el navegador no sabe cuándo termina el cuerpo con conexiones persistentes. Pasa siempre el tamaño en bytes (o usa `-1` para *chunked*).

---

## 📂 HTML desde un fichero

Escribir HTML dentro de Java es feo cuando la página crece: mezclas dos lenguajes y cualquier comilla es una agonía. La alternativa profesional: guarda la página en un fichero y léela con `Files.readString()` (el mismo API de la U12):

```java
server.createContext("/", intercambio -> {
    String html = Files.readString(Path.of("web", "index.html"));
    intercambio.getResponseHeaders()
        .set("Content-Type", "text/html; charset=UTF-8");
    intercambio.sendResponseHeaders(200, html.getBytes().length);
    intercambio.getResponseBody().write(html.getBytes());
    intercambio.getResponseBody().close();
});
```

Con esta estructura, el HTML vive en `web/index.html` (dentro de tu proyecto, junto a los fuentes) y el código Java solo se encarga de servirlo. Cambiar el diseño ya no exige recompilar: editas el fichero, recargas el navegador y listo.

> 💡 **Consejo:** el fichero puede traer CSS y JavaScript enlazados con rutas relativas (`estilos.css`, `app.js`). Pero ojo: esas rutas también las pide el navegador al servidor, así que tendrás que servir esos ficheros también. Se ve en el punto 6 con el proyecto de tareas.

---

## 🕶️ Sé el Código, my friend...

> **Don Tip:** sirve el HTML con `Content-Type` correcto y el navegador es tu mejor aliado; olvida la cabecera y el navegador te enseñará el código en vez de la página.

**Ejercicio: el servidor despistado**

Un compañero te enseña este handler y jura que funciona:

```java
server.createContext("/", intercambio -> {
    String html = "<h1>Hola mundo</h1>";
    intercambio.sendResponseHeaders(200, html.length());
    intercambio.getResponseBody().write(html.getBytes());
    intercambio.getResponseBody().close();
});
```

Dice que "a veces" el navegador muestra `<h1>Hola mundo</h1>` literal en vez de un encabezado. ¿Por qué? ¿Cuántos bugs hay?

<details>
<summary>🔄 Solución</summary>

Hay **dos** bugs:

1. Falta `Content-Type: text/html`. Sin él, el navegador no sabe que es HTML y puede mostrarlo como texto plano.
2. Se pasa `html.length()` (caracteres) en lugar de `html.getBytes().length` (bytes). Con un HTML tan corto casi nunca falla, pero en cuanto haya un carácter acentuado o un emoji, el navegador esperará más bytes de los que le llegan.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué cabecera necesitas para que el navegador renderice tu respuesta como HTML?
2. ¿Qué le pasas a `sendResponseHeaders` como segundo argumento: caracteres o bytes?
3. ¿Con qué método de la U12 lees el contenido de un fichero en un `String`?
4. ¿Por qué es mejor servir el HTML desde un fichero que escribir 50 líneas dentro del código Java?

<details>
<summary>🔄 Respuestas</summary>

1. `Content-Type: text/html; charset=UTF-8`.
2. **Bytes**: `html.getBytes().length`. Los caracteres acentuados ocupan más de un byte en UTF-8.
3. `Files.readString(Path.of("web", "index.html"))`.
4. Porque separas el diseño del código: editas el HTML sin recompilar y el código Java queda limpio.

</details>

---

## ✅ Resumen en 3 frases

1. Para servir HTML, fija **`Content-Type: text/html; charset=UTF-8`** y pasa el tamaño del cuerpo **en bytes** (`getBytes().length`).
2. El HTML puede ir **en una cadena** (rápido para probar) o **en un fichero** leído con `Files.readString()` (limpio y profesional).
3. Cerrar el `getResponseBody()` sigue siendo obligatorio: es la señal que el navegador espera para pintar la página.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `text/html` | El `Content-Type` de las páginas web |
> | `charset=UTF-8` | Declaración de que el texto usa UTF-8 (tildes incluidas) |
> | `Files.readString` | Lee un fichero completo en un `String` (visto en U12) |
> | Text block | `"""..."""`: cadena multilínea para escribir HTML cómodo |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/14-apis-web) · **Anterior:** [02 · Servidor web mínimo con HttpServer](/ApuntesProgramacion/14-apis-web/02-servidor-minimo) · **Siguiente:** [04 · Parámetros GET y formularios POST](/ApuntesProgramacion/14-apis-web/04-get-post)