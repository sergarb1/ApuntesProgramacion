---
title: "05 · Devolviendo JSON: como una API de verdad"
description: "application/json, fetch desde el frontend y por qué las aplicaciones modernas separan datos de diseño 🧩🔀"
---

<p><small>application/json, fetch desde el frontend y por qué las aplicaciones modernas separan datos de diseño 🧩🔀</small></p>

> 🗺️ **Estás en:** 🌐 **U14 · Servir y Consumir APIs con Web** → 05 · Devolviendo JSON: como una API de verdad

---

## 📬 La idea en una frase

> **Las aplicaciones modernas no devuelven HTML al navegador: devuelven datos en JSON y que el frontend se las arregle. Cuando tu servidor responde con `application/json`, deja de ser una página web y se convierte en una API.**

Hasta aquí tu servidor hablaba en HTML, el idioma de los humanos. Ahora aprende el idioma de las máquinas: JSON. El frontend (JavaScript) pide datos y el backend se los da en JSON, sin mezclar diseño con datos. Es la separación que hace funcionar a todas las aplicaciones modernas.

---

## 🧩 Qué es JSON (en 10 segundos)

JSON es texto con una estructura de dos piezas:

```json
{
  "id": 1,
  "nombre": "Ana",
  "edad": 25,
  "activo": true
}
```

- **Objetos** entre llaves `{...}`: colección de pares `"clave": valor`.
- **Arrays** entre corchetes `[...]`: listas de valores.
- Valores posibles: textos entre comillas, números, `true`/`false`, `null`, objetos y arrays.

Un `record` de Java (los viste en la U11) y un objeto JSON son primos hermanos: misma idea de "datos con nombre". La diferencia es que JSON es texto, así que cualquier lenguaje lo entiende.

---

## 🚀 Servir JSON desde tu servidor

La clave de todo es una cabecera y una cadena:

```java
server.createContext("/api/usuarios", intercambio -> {
    String json = """
        [
            {"id":1,"nombre":"Ana","edad":25},
            {"id":2,"nombre":"Luis","edad":30}
        ]
        """;
    intercambio.getResponseHeaders()
        .set("Content-Type", "application/json");
    intercambio.sendResponseHeaders(200, json.getBytes().length);
    intercambio.getResponseBody().write(json.getBytes());
    intercambio.getResponseBody().close();
});
```

Fíjate: nada ha cambiado respecto al HTML salvo dos cosas:

- El `Content-Type` es ahora **`application/json`**.
- El contenido es un array JSON con los datos.

> ⚠️ **Advertencia:** si devuelves JSON con `Content-Type: text/html` o sin cabecera, el navegador no lo tratará como datos. Muchas APIs externas rechazan respuestas que dicen ser JSON y no lo son... y lo notarás. Cabecera correcta o nada.

---

## 📡 Consumirlo con fetch

Y ahora el otro lado de la moneda: desde el HTML, JavaScript pide los datos y los pinta. Nada de recargar la página: el `fetch` hace una petición en segundo plano:

```html
<script>
fetch('/api/usuarios')
  .then(r => r.json())
  .then(data => console.log(data));
</script>
```

Lo que ocurre por dentro es exactamente el punto 1: el navegador hace un `GET /api/usuarios`, tu servidor responde con `200` y un JSON, y `r.json()` lo convierte en objetos JavaScript listos para usar.

> 💡 **Consejo:** esto es el patrón de todas las aplicaciones modernas: el **backend** sirve datos (JSON) y el **frontend** los consume y decide cómo mostrarlos. Aprender a servir JSON es aprender a hacer APIs; el frontend ya viene de serie en el navegador.

---

## 🕶️ Sé el Código, my friend...

> **Don Tip:** cuando el `fetch` falla, no mires solo el `console.log`: abre la pestaña *Network* del navegador y mira el código de estado y el `Content-Type` de la respuesta. El 90 % de los misterios se resuelven ahí.

**Ejercicio: el endpoint con cabeza**

Escribe el handler de `/api/hora` que devuelva este JSON:

```json
{"hora": "14:30:01", "zona": "Europe/Madrid"}
```

Completa el código (sin ejecutar, a ojo):

```java
server.createContext("/api/hora", intercambio -> {
    String json = """
        {"hora": "______", "zona": "______"}
        """;
    intercambio.getResponseHeaders()
        .set("______", "application/json");
    intercambio.sendResponseHeaders(______, json.getBytes().length);
    intercambio.getResponseBody().write(json.getBytes());
    intercambio.getResponseBody().close();
});
```

<details>
<summary>🔄 Solución</summary>

```java
server.createContext("/api/hora", intercambio -> {
    String json = """
        {"hora": "14:30:01", "zona": "Europe/Madrid"}
        """;
    intercambio.getResponseHeaders()
        .set("Content-Type", "application/json");
    intercambio.sendResponseHeaders(200, json.getBytes().length);
    intercambio.getResponseBody().write(json.getBytes());
    intercambio.getResponseBody().close();
});
```

Los huecos eran: la hora (`14:30:01`), la zona (`Europe/Madrid`), `Content-Type` y `200`.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué `Content-Type` usas para servir JSON?
2. ¿Qué dos estructuras componen el formato JSON?
3. ¿Qué método de JavaScript hace una petición HTTP desde el navegador?
4. ¿Cuál es la ventaja de servir datos JSON en vez de HTML?

<details>
<summary>🔄 Respuestas</summary>

1. `application/json`.
2. **Objetos** (`{...}`, pares clave-valor) y **arrays** (`[...]`, listas).
3. `fetch()`, que devuelve una promesa con la respuesta.
4. Separas datos de diseño: cualquier frontend (web, móvil, otro servidor) puede consumir los mismos datos, porque JSON es texto universal.

</details>

---

## ✅ Resumen en 3 frases

1. **JSON** es el formato de datos universal: objetos `{...}` y arrays `[...]`, y un `record` de Java es su primo hermano.
2. Para servir JSON, fija **`Content-Type: application/json`** y el resto del handler es idéntico al de HTML.
3. El **frontend** lo consume con `fetch(...).then(r => r.json())`, y así nace la separación entre datos y diseño que define a las APIs.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | JSON | Formato de datos universal en texto |
> | `application/json` | El `Content-Type` de JSON |
> | API | Interfaz por la que tu servidor expone datos |
> | `fetch` | La forma de JavaScript de hacer peticiones HTTP |
> | Frontend / Backend | Quien muestra (navegador) / quien sirve (servidor) |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/14-apis-web) · **Anterior:** [04 · Parámetros GET y formularios POST](/ApuntesProgramacion/14-apis-web/04-get-post) · **Siguiente:** [06 · Mini proyecto: gestor de tareas (API REST)](/ApuntesProgramacion/14-apis-web/06-proyecto-rest)