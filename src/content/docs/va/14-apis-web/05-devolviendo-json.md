---
title: "05 · Tornant JSON: com una API de veritat"
description: "application/json, fetch des del frontend i per què les aplicacions modernes separen dades de disseny 🧩🔀"
---

<p><small>application/json, fetch des del frontend i per què les aplicacions modernes separen dades de disseny 🧩🔀</small></p>

> 🗺️ **Estàs en:** 🌐 **U14 · Servir i Consumir APIs amb Web** → 05 · Tornant JSON: com una API de veritat

---

## 📬 La idea en una frase

> **Les aplicacions modernes no tornen HTML al navegador: tornen dades en JSON i que el frontend se les arregle. Quan el teu servidor respon amb `application/json`, deixa de ser una pàgina web i es convertix en una API.**

Fins ací el teu servidor parlava en HTML, l'idioma dels humans. Ara aprén l'idioma de les màquines: JSON. El frontend (JavaScript) demana dades i el backend li les dona en JSON, sense barrejar disseny amb dades. És la separació que fa funcionar totes les aplicacions modernes.

---

## 🧩 Què és JSON (en 10 segons)

JSON és text amb una estructura de dues peces:

```json
{
  "id": 1,
  "nombre": "Ana",
  "edad": 25,
  "activo": true
}
```

- **Objectes** entre claus `{...}`: col·lecció de parells `"clau": valor`.
- **Arrays** entre corxets `[...]`: llistes de valors.
- Valors possibles: textos entre cometes, números, `true`/`false`, `null`, objectes i arrays.

Un `record` de Java (els vas vore a la U11) i un objecte JSON són cosins germans: mateixa idea de "dades amb nom". La diferència és que JSON és text, així que qualsevol llenguatge l'entén.

---

## 🚀 Servir JSON des del teu servidor

La clau de tot és una capçalera i una cadena:

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

Fixa't: res ha canviat respecte a l'HTML excepte dos coses:

- El `Content-Type` ara és **`application/json`**.
- El contingut és un array JSON amb les dades.

> ⚠️ **Advertència:** si tornes JSON amb `Content-Type: text/html` o sense capçalera, el navegador no ho tractarà com a dades. Moltes APIs externes rebutgen respostes que diuen ser JSON i no ho són... i ho notaràs. Capçalera correcta o res.

---

## 📡 Consumir-lo amb fetch

I ara l'altra cara de la moneda: des de l'HTML, JavaScript demana les dades i les pinta. Res de recarregar la pàgina: el `fetch` fa una petició en segon pla:

```html
<script>
fetch('/api/usuarios')
  .then(r => r.json())
  .then(data => console.log(data));
</script>
```

El que ocorre per dins és exactament el punt 1: el navegador fa un `GET /api/usuarios`, el teu servidor respon amb `200` i un JSON, i `r.json()` el convertix en objectes JavaScript llestos per a usar.

> 💡 **Consell:** este és el patró de totes les aplicacions modernes: el **backend** servix dades (JSON) i el **frontend** les consumix i decidix com mostrar-les. Aprendre a servir JSON és aprendre a fer APIs; el frontend ja ve de sèrie en el navegador.

---

## 🕶️ Sé el Código, my friend...

> **Don Tip:** quan el `fetch` falla, no mires només el `console.log`: obri la pestanya *Network* del navegador i mira el codi d'estat i el `Content-Type` de la resposta. El 90 % dels misteris es resolen allà.

**Exercici: l'endpoint amb cap**

Escriu el handler de `/api/hora` que torne este JSON:

```json
{"hora": "14:30:01", "zona": "Europe/Madrid"}
```

Completa el codi (sense executar, a ull):

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
<summary>🔄 Solució</summary>

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

Els buits eren: l'hora (`14:30:01`), la zona (`Europe/Madrid`), `Content-Type` i `200`.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quin `Content-Type` uses per a servir JSON?
2. Quines dues estructures componen el format JSON?
3. Quin mètode de JavaScript fa una petició HTTP des del navegador?
4. Quin avantatge té servir dades JSON en comptes d'HTML?

<details>
<summary>🔄 Respostes</summary>

1. `application/json`.
2. **Objectes** (`{...}`, parells clau-valor) i **arrays** (`[...]`, llistes).
3. `fetch()`, que torna una promesa amb la resposta.
4. Separes dades de disseny: qualsevol frontend (web, mòbil, un altre servidor) pot consumir les mateixes dades, perquè JSON és text universal.

</details>

---

## ✅ Resum en 3 frases

1. **JSON** és el format de dades universal: objectes `{...}` i arrays `[...]`, i un `record` de Java és el seu cosí germà.
2. Per a servir JSON, fixa **`Content-Type: application/json`** i la resta del handler és idèntic al de l'HTML.
3. El **frontend** el consumix amb `fetch(...).then(r => r.json())`, i així naix la separació entre dades i disseny que definix les APIs.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | JSON | Format de dades universal en text |
> | `application/json` | El `Content-Type` de JSON |
> | API | Interfície per la qual el teu servidor exposa dades |
> | `fetch` | La forma de JavaScript de fer peticions HTTP |
> | Frontend / Backend | Qui mostra (navegador) / qui servix (servidor) |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/14-apis-web) · **Anterior:** [04 · Paràmetres GET i formularis POST](/ApuntesProgramacion/va/14-apis-web/04-get-post) · **Següent:** [06 · Mini projecte: gestor de tasques (API REST)](/ApuntesProgramacion/va/14-apis-web/06-proyecto-rest)