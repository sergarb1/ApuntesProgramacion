---
title: "04 · Parámetros GET y formularios POST"
description: "El navegador pregunta con la URL y entrega con el cuerpo: lee la query string y el body como un profesional 📥📤"
---

<p><small>El navegador pregunta con la URL y entrega con el cuerpo: lee la query string y el body como un profesional 📥📤</small></p>

> 🗺️ **Estás en:** 🌐 **U14 · Servir y Consumir APIs con Web** → 04 · Parámetros GET y formularios POST

---

## 📬 La idea en una frase

> **El cliente pregunta (GET) con la query string de la URL y entrega (POST) con el cuerpo de la petición. Saber leer ambas cosas es saber entender lo que tu web recibe.**

Hasta ahora el servidor contestaba lo mismo a todo el mundo. Hoy aprende a escuchar: qué pide el cliente y qué le envía. Con GET lees la URL; con POST lees el cuerpo. Ambos llegan como texto y tu trabajo es convertirlos en datos útiles.

---

## 📥 GET: la query string

Cuando un formulario se envía por GET, los datos viajan en la URL: `http://localhost:8080/saludo?nombre=Ana`. Para leerlos:

```java
server.createContext("/saludo", intercambio -> {
    String query = intercambio.getRequestURI().getQuery();
    String nombre = "Mundo";
    if (query != null && query.startsWith("nombre=")) {
        nombre = query.split("=")[1];
    }
    String html = "<h1>Hola, " + nombre + "!</h1>";
    intercambio.getResponseHeaders()
        .set("Content-Type", "text/html");
    intercambio.sendResponseHeaders(200, html.getBytes().length);
    intercambio.getResponseBody().write(html.getBytes());
    intercambio.getResponseBody().close();
});
```

- `getRequestURI().getQuery()` te da `"nombre=Ana"` (o `null` si no hay query).
- El `if` evita dos dramas: que `query` sea `null` y que no empiece por `nombre=`.

> ⚠️ **Advertencia:** esto es **frágil**. Si el nombre contiene `&` o `%20` (espacio codificado), `split("=")[1]` te da basura o peta. En producción usa `URLDecoder.decode(valor, "UTF-8")` y un parser de query de verdad. Este es un ejemplo didáctico, no código de producción.

---

## 📤 POST: el cuerpo de la petición

Para recibir datos de un formulario POST necesitas leer el **cuerpo** de la petición:

```java
server.createContext("/procesar", intercambio -> {
    if ("POST".equals(intercambio.getRequestMethod())) {
        byte[] body = intercambio.getRequestBody().readAllBytes();
        String datos = new String(body);
        // datos = "nombre=Ana&edad=25"
        String nombre = extraerParametro(datos, "nombre");
        String respuesta = "<h1>Recibido: " + nombre + "</h1>";
        intercambio.getResponseHeaders()
            .set("Content-Type", "text/html");
        intercambio.sendResponseHeaders(200,
            respuesta.getBytes().length);
        intercambio.getResponseBody()
            .write(respuesta.getBytes());
        intercambio.getResponseBody().close();
    }
});
```

Y el HTML del formulario que lo alimenta:

```html
<form action="/procesar" method="POST">
  <input name="nombre" placeholder="Tu nombre">
  <button>Enviar</button>
</form>
```

> 💡 **Consejo:** ¿por qué `"POST".equals(intercambio.getRequestMethod())` y no `intercambio.getRequestMethod().equals("POST")`? Porque si `getRequestMethod()` devuelve `null`, la segunda forma casca con `NullPointerException`. La primera forma es **null-safe**. Es una manía que te ahorrará dolores de cabeza para siempre.

---

## 🧰 El parser casero

El cuerpo `"nombre=Ana&edad=25"` tiene el mismo formato que la query string: pares `clave=valor` separados por `&`. Un parser mínimo para ambos casos:

```java
static String extraerParametro(String datos, String clave) {
    if (datos == null) return null;
    for (String par : datos.split("&")) {
        String[] trozos = par.split("=");
        if (trozos.length == 2 && trozos[0].equals(clave)) {
            return trozos[1];
        }
    }
    return null;
}
```

No es la octava maravilla, pero para aprender cómo funciona el formato por dentro vale. Cuando en el punto 6 hagas la API REST, los cuerpos serán JSON y el parser lo hará Gson.

---

## 🕶️ Sé el Código, my friend...

> **Don Tip:** GET y POST pueden llevar los mismos datos, pero en sitios distintos. Un GET es reproducible (puedes repetir la URL); un POST de registro no debería repetirse sin querer.

**Ejercicio: el formulario con dos campos**

Un formulario envía `nombre=Ana&edad=25` por POST a `/procesar`. Con el `extraerParametro` de arriba:

1. ¿Qué devuelve `extraerParametro(datos, "edad")`?
2. ¿Y `extraerParametro(datos, "ciudad")`?
3. ¿Qué devuelve si `datos` es `null`?

<details>
<summary>🔄 Solución</summary>

1. `"25"`. El bucle parte `"nombre=Ana&edad=25"` por `&`, encuentra el par `edad=25` y devuelve `"25"`.
2. `null`. No existe ningún par cuya clave sea `ciudad`.
3. `null`, gracias al `if (datos == null) return null;` de la primera línea. Por eso siempre se comprueba antes de usar `split`.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Dónde viajan los datos de un formulario GET?
2. ¿Dónde viajan los datos de un formulario POST?
3. ¿Por qué `"POST".equals(método)` es mejor que `método.equals("POST")`?
4. ¿Qué método de `HttpExchange` te da el cuerpo de la petición?

<details>
<summary>🔄 Respuestas</summary>

1. En la **query string** de la URL (`?nombre=Ana&edad=25`), que lees con `getRequestURI().getQuery()`.
2. En el **cuerpo** de la petición, que lees con `getRequestBody().readAllBytes()`.
3. Porque es **null-safe**: si `getRequestMethod()` devuelve `null`, la primera forma no peta y la segunda lanza `NullPointerException`.
4. `intercambio.getRequestBody()`, del que lees los bytes con `readAllBytes()`.

</details>

---

## ✅ Resumen en 3 frases

1. Los **GET** llevan sus datos en la query string (`?clave=valor&...`) y los lees con `getRequestURI().getQuery()`.
2. Los **POST** llevan sus datos en el **cuerpo** de la petición y los lees con `getRequestBody().readAllBytes()`.
3. En ambos casos es texto con formato `clave=valor`, y la manía de `"POST".equals(...)` en vez de `...equals("POST")` te salva de los `NullPointerException`.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Query string | Datos del GET, en la URL |
> | Request body | Datos del POST, en el cuerpo de la petición |
> | `URLDecoder` | Convierte `%20` y amigos en caracteres legibles |
> | Null-safe | Código que no peta aunque reciba `null` |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/14-apis-web) · **Anterior:** [03 · Sirviendo HTML](/ApuntesProgramacion/14-apis-web/03-sirviendo-html) · **Siguiente:** [05 · Devolviendo JSON: como una API de verdad](/ApuntesProgramacion/14-apis-web/05-devolviendo-json)