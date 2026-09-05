---
title: "04 · Paràmetres GET i formularis POST"
description: "El navegador pregunta amb la URL i entrega amb el cos: llig la query string i el body com un professional 📥📤"
---

<p><small>El navegador pregunta amb la URL i entrega amb el cos: llig la query string i el body com un professional 📥📤</small></p>

> 🗺️ **Estàs en:** 🌐 **U14 · Servir i Consumir APIs amb Web** → 04 · Paràmetres GET i formularis POST

---

## 📬 La idea en una frase

> **El client pregunta (GET) amb la query string de la URL i entrega (POST) amb el cos de la petició. Saber llegir totes dues coses és saber entendre el que la teua web rep.**

Fins ara el servidor contestava el mateix a tothom. Hui aprén a escoltar: què demana el client i què li envia. Amb GET lliges la URL; amb POST lliges el cos. Tots dos arriben com a text i la teua tasca és convertir-los en dades útils.

---

## 📥 GET: la query string

Quan un formulari s'envia per GET, les dades viatgen en la URL: `http://localhost:8080/saludo?nombre=Ana`. Per a llegir-les:

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

- `getRequestURI().getQuery()` et dona `"nombre=Ana"` (o `null` si no hi ha query).
- L'`if` evita dos drames: que `query` siga `null` i que no comence per `nombre=`.

> ⚠️ **Advertència:** això és **fràgil**. Si el nom conté `&` o `%20` (espai codificat), `split("=")[1]` et dona brossa o peta. En producció usa `URLDecoder.decode(valor, "UTF-8")` i un parser de query de veritat. Este és un exemple didàctic, no codi de producció.

---

## 📤 POST: el cos de la petició

Per a rebre dades d'un formulari POST necessites llegir el **cos** de la petició:

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

I l'HTML del formulari que l'alimenta:

```html
<form action="/procesar" method="POST">
  <input name="nombre" placeholder="Tu nombre">
  <button>Enviar</button>
</form>
```

> 💡 **Consell:** per què `"POST".equals(intercambio.getRequestMethod())` i no `intercambio.getRequestMethod().equals("POST")`? Perquè si `getRequestMethod()` torna `null`, la segona forma peta amb `NullPointerException`. La primera forma és **null-safe**. És una mania que t'estalviarà maldecaps per sempre.

---

## 🧰 El parser casolà

El cos `"nombre=Ana&edad=25"` té el mateix format que la query string: parelles `clau=valor` separades per `&`. Un parser mínim per a tots dos casos:

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

No és la vuitena meravella, però per a aprendre com funciona el format per dins val. Quan al punt 6 faces l'API REST, els cossos seran JSON i el parser el farà Gson.

---

## 🕶️ Sé el Código, my friend...

> **Don Tip:** GET i POST poden portar les mateixes dades, però en llocs diferents. Un GET és reproducible (pots repetir la URL); un POST de registre no s'hauria de repetir sense voler.

**Exercici: el formulari amb dos camps**

Un formulari envia `nombre=Ana&edad=25` per POST a `/procesar`. Amb l'`extraerParametro` de dalt:

1. Què torna `extraerParametro(datos, "edad")`?
2. I `extraerParametro(datos, "ciudad")`?
3. Què torna si `datos` és `null`?

<details>
<summary>🔄 Solució</summary>

1. `"25"`. El bucle partix `"nombre=Ana&edad=25"` per `&`, troba el parell `edad=25` i torna `"25"`.
2. `null`. No existix cap parell la clau del qual siga `ciudad`.
3. `null`, gràcies a l'`if (datos == null) return null;` de la primera línia. Per això sempre es comprova abans d'usar `split`.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. On viatgen les dades d'un formulari GET?
2. On viatgen les dades d'un formulari POST?
3. Per què `"POST".equals(mètode)` és millor que `mètode.equals("POST")`?
4. Quin mètode de `HttpExchange` et dona el cos de la petició?

<details>
<summary>🔄 Respostes</summary>

1. En la **query string** de la URL (`?nombre=Ana&edad=25`), que lliges amb `getRequestURI().getQuery()`.
2. En el **cos** de la petició, que lliges amb `getRequestBody().readAllBytes()`.
3. Perquè és **null-safe**: si `getRequestMethod()` torna `null`, la primera forma no peta i la segona llança `NullPointerException`.
4. `intercambio.getRequestBody()`, del qual lliges els bytes amb `readAllBytes()`.

</details>

---

## ✅ Resum en 3 frases

1. Els **GET** porten les seues dades en la query string (`?clau=valor&...`) i les lliges amb `getRequestURI().getQuery()`.
2. Els **POST** porten les seues dades en el **cos** de la petició i les lliges amb `getRequestBody().readAllBytes()`.
3. En tots dos casos és text amb format `clau=valor`, i la mania de `"POST".equals(...)` en comptes de `...equals("POST")` et salva dels `NullPointerException`.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Query string | Dades del GET, en la URL |
> | Request body | Dades del POST, en el cos de la petició |
> | `URLDecoder` | Convertix `%20` i amics en caràcters llegibles |
> | Null-safe | Codi que no peta encara que reba `null` |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/14-apis-web) · **Anterior:** [03 · Servint HTML](/ApuntesProgramacion/va/14-apis-web/03-sirviendo-html) · **Següent:** [05 · Tornant JSON: com una API de veritat](/ApuntesProgramacion/va/14-apis-web/05-devolviendo-json)