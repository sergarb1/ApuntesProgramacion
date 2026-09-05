---
title: "01 · El protocol HTTP en 30 segons"
description: "Petició-resposta, verbs HTTP, codis d'estat i per què tota la web se sosté sobre una conversa tan simple 🌐⚡"
---

<p><small>Petició-resposta, verbs HTTP, codis d'estat i per què tota la web se sosté sobre una conversa tan simple 🌐⚡</small></p>

> 🗺️ **Estàs en:** 🌐 **U14 · Servir i Consumir APIs amb Web** → 01 · El protocol HTTP en 30 segons

---

## 📬 La idea en una frase

> **HTTP és un protocol de petició-resposta: el client demana un recurs (una URL) i el servidor li respon amb un codi d'estat i el contingut. Això és tot. La resta són capes que es construïxen damunt.**

En la U12 ja tancaves fitxers amb `try-with-resources` i en la U13 connectaves Java a bases de dades. Ara el protagonista és un altre: la web. I tant si algun dia uses Tomcat, Spring Boot o un microservei al núvol: tots parlen el mateix idioma, i eixe idioma es diu HTTP. Hui ho aprens en 30 segons... i en unes poques pàgines més.

---

## 💬 La conversa de la web

Quan escrius `https://google.com` en el teu navegador, ocorre això:

```
Tu (client)                  Google (servidor)
    ── GET / HTTP/1.1 ──────────►
    │                              │
    ◄── HTTP/1.1 200 OK ──────────
         Content-Type: text/html
         (el HTML de Google)
```

Tres peces:

1. **Petició:** el client demana un recurs. Inclou un mètode (`GET`), una ruta (`/`) i capçaleres (informació extra com `User-Agent`).
2. **Resposta:** el servidor contesta amb un **codi d'estat** (`200 OK`) i un cos (el HTML, un JSON, una imatge...).
3. **Capçaleres:** notes al marge que viatgen en tots dos sentits. La més important de moment: `Content-Type`, que li diu al client quin tipus de contingut li envies (`text/html`, `application/json`...).

> 💡 **Consell:** memoritza l'estructura del codi d'estat: el primer dígit és la família. **2xx** tot bé, **3xx** redireccions, **4xx** el client s'ha equivocat, **5xx** el servidor ha fallat. Amb això ja vas sobradet per a interpretar qualsevol error.

---

## 🎤 Els verbs d'HTTP

Els mètodes HTTP són el verb de la frase. N'hi ha molts, però amb estos quatre fas el 99 % de la teua vida:

| Mètode | Què fa | Analogia |
|---|---|---|
| `GET` | Demanar informació | Preguntar |
| `POST` | Enviar informació nova | Entregar un formulari |
| `PUT` | Reemplaçar un recurs complet | Tornar una cosa per una de nova |
| `DELETE` | Esborrar un recurs | Llançar a la paperera |

Fixa't en la diferència fina: `GET` no canvia res al servidor (és de només lectura), mentre que `POST`, `PUT` i `DELETE` el modifiquen. Per això un enllaç normal és `GET` i l'enviament d'un formulari de registre és `POST`.

---

## 🚦 Els codis d'estat més comuns

No necessites memoritzar els centenars que existixen. Amb la família i estos clàssics et basta:

| Codi | Significat | Moment típic |
|---|---|---|
| `200` | Tot bé | Pàgina carregada correctament |
| `201` | Recurs creat | Un `POST` que crea alguna cosa nova |
| `404` | No trobat | La URL no existix (o l'usuari no existix) |
| `403` | Prohibit | Sense permís (sol faltar un token) |
| `500` | Error intern | El servidor ha petat per dins |

> 🐛 **Error típic:** quan el teu servidor torna `500`, quasi sempre és una excepció que no vas capturar dins del handler. El navegador només veu `500`, però la teua consola de Java et conta tota la història.

---

## 🧩 Anatomia d'una URL

Tot l'anterior ocorre sobre una URL. I una URL té parts que t'interessen:

```
http://localhost:8080/saludo?nombre=Ana&edad=25
└─┬──┘ └───┬────┘ └─┬─┘ └──┬───┘ └──────┬─────┘
protocol   domini    port   ruta     query string
```

La **query string** (després de `?`) són parelles `clau=valor` separades per `&`. És el que envia un formulari GET i el que llegiràs al punt 4. El port per defecte d'HTTP és el 80 (no es veu), però en desenvolupament usaràs el 8080.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què componen sempre la resposta d'un servidor HTTP?
2. Quin mètode HTTP usaríes perquè un usuari registre un compte nou: `GET` o `POST`? I per a veure el seu perfil?
3. Què significa un `404`? I un `500`?
4. En `http://localhost:8080/saludo?nombre=Ana&edad=25`, què és `nombre=Ana&edad=25`?

<details>
<summary>🔄 Respostes</summary>

1. Un **codi d'estat** (com `200 OK`) i un **cos** (HTML, JSON, imatge...) amb les seues capçaleres.
2. `POST` per a registrar (crea alguna cosa al servidor). `GET` per a veure el perfil (només lectura).
3. `404` és que el recurs no existix; `500` és que el servidor ha fallat internament.
4. La **query string**: els paràmetres que viatgen en la URL com a parelles `clau=valor`.

</details>

---

## ✅ Resum en 3 frases

1. **HTTP és petició-resposta:** el client demana una URL amb un mètode i el servidor respon amb un codi d'estat i un contingut.
2. Els mètodes clau són **GET** (llegir), **POST** (crear), **PUT** (reemplaçar) i **DELETE** (esborrar), i els codis s'agrupen en famílies: 2xx bé, 4xx culpa del client, 5xx culpa del servidor.
3. La **query string** (`?clau=valor&clau2=valor2`) és com viatgen les dades en una petició GET.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | HTTP | L'idioma que parlen client i servidor |
> | Petició | El que el client demana (mètode + URL + capçaleres) |
> | Resposta | El que el servidor contesta (codi + cos + capçaleres) |
> | `Content-Type` | Capçalera que diu quin tipus de contingut s'envia |
> | Query string | Els paràmetres `clau=valor` que viatgen en la URL |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/14-apis-web) · **Anterior:** — · **Següent:** [02 · Servidor web mínim amb HttpServer](/ApuntesProgramacion/va/14-apis-web/02-servidor-minimo)