---
title: "U14 — Servir i Consumir APIs amb Web"
description: "Del terminal a Internet: HttpServer, HTML, formularis, JSON i HttpClient per a servir i consumir APIs com una de veritat 🌐"
emoji: 🌐
---

<p><small>Del terminal a Internet: HttpServer, HTML, formularis, JSON i HttpClient per a servir i consumir APIs com una de veritat 🌐</small></p>

> 🗺️ **El mapa del paquet:** 🚪 Benvinguda → ☕ U01 → 🔤 U02 → 🔀 U03 → 🅿️ U04 → 🧩 U05 → ⚡ U06 → 🏗️ U07 → 🔒 U08 → 🧬 U09 → 📚 U10 → 🗺️ U11 → 📁 U12 → 🗄️ U13 → **🌐 ACÍ ETS (U14)**

---

Fins ara els teus programes vivien en la terminal, en fitxers i en bases de dades. Hui s'ha acabat: és hora que isquen a Internet. Sense JavaScript frameworks, sense servidors d'aplicacions i sense instal·lacions eternes: només Java i HTTP.

Esta unitat té tres grans actes:

- **Ser servidor:** amb `HttpServer`, el servidor HTTP que Java porta de sèrie, serviràs text, HTML, formularis i JSON sense instal·lar Tomcat ni Spring.
- **Ser API:** muntaràs un mini projecte REST complet —un gestor de tasques— amb GET, POST, PUT i DELETE.
- **Ser client:** amb `java.net.http.HttpClient`, consumiràs APIs externes reals (GitHub, jsonplaceholder), parsejaràs JSON amb Gson i gestionaràs capçaleres, timeouts i codis d'estat.

Pel camí entendràs el model petició-resposta d'HTTP, per què `"POST".equals(...)` és millor que `...equals("POST")`, què significa de veritat un 404 i per què el `fetch` de JavaScript i l'`HttpClient` de Java són dos cares de la mateixa moneda.

Esta unitat es llig com un **llibre de 9 capítols**: els 8 primers punts són teoria en progressió i el 9 és un aterratge pràctic per a deixar-ho tot ben lligat.

---

## 🎯 Objectiu de la unitat

En acabar, seràs capaç de:

- Explicar el model **petició-resposta** d'HTTP i els seus codis d'estat més comuns (200, 404, 500...).
- Muntar un **servidor web mínim** amb `com.sun.net.httpserver.HttpServer` en menys de 20 línies.
- Servir **HTML** des de Java i llegir-lo també des d'un fitxer.
- Processar **paràmetres GET** i **formularis POST** sense por.
- Tornar **JSON** amb el `Content-Type` adequat i consumir-lo amb `fetch`.
- Construir una **API REST** completa (GET, POST, PUT, DELETE) amb dades en memòria.
- Consumir APIs externes amb **`HttpClient`**: GET, POST, capçaleres, timeouts i crides asíncrones.
- **Parsejar JSON** amb Gson, mapejar-lo a `record` i gestionar errors HTTP amb elegància.

---

## 🗺️ Mapa de la unitat

| Punt | Què aprendràs | Dificultat |
|---|---|---|
| [01 · El protocol HTTP en 30 segons](/ApuntesProgramacion/va/14-apis-web/01-protocolo-http) | Petició-resposta, mètodes, codis d'estat i URLs | Tots |
| [02 · Servidor web mínim amb HttpServer](/ApuntesProgramacion/va/14-apis-web/02-servidor-minimo) | El teu primer servidor Java: `HttpServer`, `createContext` i `HttpExchange` | Tots |
| [03 · Servint HTML](/ApuntesProgramacion/va/14-apis-web/03-sirviendo-html) | Pàgines completes amb `Content-Type: text/html` i des de fitxer | Tots |
| [04 · Paràmetres GET i formularis POST](/ApuntesProgramacion/va/14-apis-web/04-get-post) | Llegir la query string i el cos de la petició | Tots |
| [05 · Tornant JSON: com una API de veritat](/ApuntesProgramacion/va/14-apis-web/05-devolviendo-json) | `application/json`, `fetch` des del frontend i per què front i back se separen | Tots |
| [06 · Mini projecte: gestor de tasques (API REST)](/ApuntesProgramacion/va/14-apis-web/06-proyecto-rest) | CRUD complet en memòria: GET, POST, PUT i DELETE | Tots |
| [07 · Consumir APIs externes amb HttpClient](/ApuntesProgramacion/va/14-apis-web/07-httpclient) | `HttpClient`, GET, `BodyHandlers` i parsejar JSON amb Gson | Tots |
| [08 · HttpClient avançat](/ApuntesProgramacion/va/14-apis-web/08-httpclient-avanzado) | POST, capçaleres, timeouts, `sendAsync` i PUT/DELETE | Tots |
| [09 · Repàs interactiu](/ApuntesProgramacion/va/14-apis-web/09-repaso-interactivo) | Sé el Código, Fireside, Laboratori, Crucigrama i més | Tots |

> 📖 **Flux de lectura:** els 8 primers punts són teoria en progressió. El 9 és l'aterratge pràctic: llig-lo just després del 8 i abans d'obrir els butlletins.

---

## 📝 Butlletins de la unitat

> Practica amb els parells del curs: comença sempre pel resolt per a vore l'estil i després intenta el per-resoldre.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/va/boletines/boletin-u14-inicial-resuelto" class="elink">✅ Inicial resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u14-inicial" class="elink">🟢 Inicial per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u14-avanzado-resuelto" class="elink">💪 Avançat resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u14-avanzado" class="elink">⭐ Avançat per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u14-extras" class="elink">🔥 Extres</a>
</div>

---

## ✅ Criteris d'avaluació coberts (RA5)

**RA5: Realitza operacions d'entrada i eixida d'informació, utilitzant procediments específics del llenguatge i llibreries de classes.**

| CE | Criteri | On es cobreix |
|---|---|---|
| RA5 c) | S'han reconegut les possibilitats d'entrada / eixida del llenguatge i les llibreries associades. | ✅ Punts 1, 2, 7 i 8 |
| RA5 f) | S'han utilitzat les ferramentes de l'entorn de desenvolupament per a crear interfícies gràfiques d'usuari simples. | ✅ Punts 3 i 6 |
| RA5 g) | S'han programat controladors d'esdeveniments. | ✅ Punt 6 |
| RA5 h) | S'han escrit programes que utilitzen interfícies gràfiques per a l'entrada i eixida d'informació. | ✅ Punts 5 i 6 |

> 📌 La **RA5** es completa amb la **U11** (consola i formats, CEs a i b) i la **U12** (fitxers i accés a arxius, CEs d i e). Esta unitat cobrix la cara web de l'entrada/eixida: HTTP com a protocol, HTML i JSON com a formats, i les llibreries `HttpServer` i `HttpClient` com a procediments del llenguatge.

---

## 🚪 Per on comence?

- Vens de la U13 (JDBC) i vols l'essencial? → Comença en el [punt 1](/ApuntesProgramacion/va/14-apis-web/01-protocolo-http) i el [punt 2](/ApuntesProgramacion/va/14-apis-web/02-servidor-minimo): HTTP i el teu primer servidor.
- Ja saps servir i vols fer APIs? → Ves directe al [punt 5](/ApuntesProgramacion/va/14-apis-web/05-devolviendo-json) i al [punt 6](/ApuntesProgramacion/va/14-apis-web/06-proyecto-rest): JSON i el CRUD de tasques.
- Només vens a pel costat client? → Salta al [punt 7](/ApuntesProgramacion/va/14-apis-web/07-httpclient) i al [punt 8](/ApuntesProgramacion/va/14-apis-web/08-httpclient-avanzado): consumir APIs externes.
- Vens a repassar? → Fes el [Repàs interactiu](/ApuntesProgramacion/va/14-apis-web/09-repaso-interactivo) i després els [butlletins](/ApuntesProgramacion/va/boletines/boletin-u14-inicial).

**📍 Primer punt:** [01 · El protocol HTTP en 30 segons](/ApuntesProgramacion/va/14-apis-web/01-protocolo-http)

**🎓 Fi del curs.** Vas començar escrivint `System.out.println("Hola, mundo")` en una terminal i acabes servint i consumint APIs per Internet. De consola a web en 14 unitats: no és poc. La propera parada ja no té guia: tria el teu camí (Spring Boot, el teu projecte final, la teua primera entrevista) i seguix programant.