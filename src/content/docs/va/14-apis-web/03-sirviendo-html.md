---
title: "03 · Servint HTML"
description: "El teu servidor passa de parlar en text pla a servir pàgines completes: Content-Type, cadenes ben formades i fitxers 📄🎨"
---

<p><small>El teu servidor passa de parlar en text pla a servir pàgines completes: Content-Type, cadenes ben formades i fitxers 📄🎨</small></p>

> 🗺️ **Estàs en:** 🌐 **U14 · Servir i Consumir APIs amb Web** → 03 · Servint HTML

---

## 📬 La idea en una frase

> **Tornar text pla és com parlar-li al navegador a cau d'orella: s'assabenta, però no mostra res bonic. Amb `Content-Type: text/html` i una cadena ben formada, el teu servidor es convertix en una web de veritat.**

Al punt 2 el servidor contestava amb una frase solta. Hui li ensenyem a vestir-se: pàgines HTML completes. Dos camins, tots dos legítims: escriure-ho directament en una cadena Java o llegir-ho des d'un fitxer (molt més còmode quan la pàgina creix).

---

## 📄 HTML des d'una cadena

El pas natural: en comptes de `"Hola, mundo web!"`, tornes una pàgina completa. Fixa't en el bloc de text (Java 15+):

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

Dos detalls importants:

- **`Content-Type: text/html; charset=UTF-8`** — sense esta capçalera, el navegador pot tractar el teu HTML com a text pla o interpretar malament les titles. El `charset=UTF-8` és obligatori si la teua pàgina porta caràcters com `á`, `ñ` o `€`.
- **`html.getBytes().length`** — la grandària del cos en **bytes**, no en caràcters. Una `ñ` ocupa 2 bytes en UTF-8; si passes `html.length()` (caràcters), el navegador pot quedar-se esperant la resta.

> 🐛 **Error típic:** `sendResponseHeaders(200, 0)` amb HTML funciona, però amb `0` el navegador no sap quan acaba el cos amb connexions persistents. Passa sempre la grandària en bytes (o usa `-1` per a *chunked*).

---

## 📂 HTML des d'un fitxer

Escriure HTML dins de Java és lleig quan la pàgina creix: barreges dos llenguatges i qualsevol cometa és una agonia. L'alternativa professional: guarda la pàgina en un fitxer i llig-la amb `Files.readString()` (el mateix API de la U12):

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

Amb esta estructura, l'HTML viu en `web/index.html` (dins del teu projecte, junt als fonts) i el codi Java només s'encarrega de servir-lo. Canviar el disseny ja no exigix recompilar: edites el fitxer, recarregues el navegador i llest.

> 💡 **Consell:** el fitxer pot portar CSS i JavaScript enllaçats amb rutes relatives (`estilos.css`, `app.js`). Però compte: eixes rutes també les demana el navegador al servidor, així que hauràs de servir eixos fitxers també. Es veu al punt 6 amb el projecte de tasques.

---

## 🕶️ Sé el Código, my friend...

> **Don Tip:** servix l'HTML amb el `Content-Type` correcte i el navegador és el teu millor aliat; oblida la capçalera i el navegador et mostrarà el codi en comptes de la pàgina.

**Exercici: el servidor despistat**

Un company t'ensenya este handler i jura que funciona:

```java
server.createContext("/", intercambio -> {
    String html = "<h1>Hola mundo</h1>";
    intercambio.sendResponseHeaders(200, html.length());
    intercambio.getResponseBody().write(html.getBytes());
    intercambio.getResponseBody().close();
});
```

Diu que "de vegades" el navegador mostra `<h1>Hola mundo</h1>` literal en comptes d'un encapçalament. Per què? Quants bugs hi ha?

<details>
<summary>🔄 Solució</summary>

Hi ha **dos** bugs:

1. Falta `Content-Type: text/html`. Sense ell, el navegador no sap que és HTML i pot mostrar-lo com a text pla.
2. Es passa `html.length()` (caràcters) en comptes de `html.getBytes().length` (bytes). Amb un HTML tan curt quasi mai falla, però en quan hi haja un caràcter accentuat o un emoji, el navegador esperarà més bytes dels que li arriben.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quina capçalera necessites perquè el navegador renderitze la teua resposta com a HTML?
2. Què li passes a `sendResponseHeaders` com a segon argument: caràcters o bytes?
3. Amb quin mètode de la U12 lliges el contingut d'un fitxer en un `String`?
4. Per què és millor servir l'HTML des d'un fitxer que escriure 50 línies dins del codi Java?

<details>
<summary>🔄 Respostes</summary>

1. `Content-Type: text/html; charset=UTF-8`.
2. **Bytes**: `html.getBytes().length`. Els caràcters accentuats ocupen més d'un byte en UTF-8.
3. `Files.readString(Path.of("web", "index.html"))`.
4. Perquè separes el disseny del codi: edites l'HTML sense recompilar i el codi Java queda net.

</details>

---

## ✅ Resum en 3 frases

1. Per a servir HTML, fixa **`Content-Type: text/html; charset=UTF-8`** i passa la grandària del cos **en bytes** (`getBytes().length`).
2. L'HTML pot anar **en una cadena** (ràpid per a provar) o **en un fitxer** llegit amb `Files.readString()` (net i professional).
3. Tancar el `getResponseBody()` seguix sent obligatori: és el senyal que el navegador espera per a pintar la pàgina.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `text/html` | El `Content-Type` de les pàgines web |
> | `charset=UTF-8` | Declaració que el text usa UTF-8 (titles incloses) |
> | `Files.readString` | Llig un fitxer complet en un `String` (vist a U12) |
> | Text block | `"""..."""`: cadena multilínia per a escriure HTML còmodament |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/14-apis-web) · **Anterior:** [02 · Servidor web mínim amb HttpServer](/ApuntesProgramacion/va/14-apis-web/02-servidor-minimo) · **Següent:** [04 · Paràmetres GET i formularis POST](/ApuntesProgramacion/va/14-apis-web/04-get-post)