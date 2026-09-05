---
title: "06 · Mini projecte: gestor de tasques (API REST)"
description: "Ajunta-ho tot en una API REST: GET, POST, PUT i DELETE amb dades en memòria 🗂️🔧"
---

<p><small>Ajunta-ho tot en una API REST: GET, POST, PUT i DELETE amb dades en memòria 🗂️🔧</small></p>

> 🗺️ **Estàs en:** 🌐 **U14 · Servir i Consumir APIs amb Web** → 06 · Mini projecte: gestor de tasques (API REST)

---

## 📬 La idea en una frase

> **Ja saps servir HTML i JSON. Ara ajunta-ho tot en una API REST amb les quatre operacions de la vida: crear, llegir, actualitzar i esborrar (CRUD), amb les dades vivint en un `ArrayList` en memòria.**

Este és el punt on tot cobra sentit. Un servidor que només contesta "hola" és un monòleg. Una **API REST** és una conversa: el client fa `GET`, `POST`, `PUT` o `DELETE` i el servidor respon com cal. I no necessites base de dades: un `ArrayList` en memòria (vas vore les col·leccions a la U10) és suficient perquè funcione.

---

## 🗂️ Què és REST (en 20 segons)

REST és una forma ordenada d'organitzar rutes i mètodes perquè l'API s'explique sola:

| Mètode | Ruta | Acció | Resultat |
|---|---|---|---|
| GET | `/api/tareas` | Llistar totes | `200` + JSON |
| POST | `/api/tareas` | Crear una | `201` + la tasca creada |
| PUT | `/api/tareas/1` | Actualitzar la tasca 1 | `200` |
| DELETE | `/api/tareas/1` | Esborrar la tasca 1 | `204` (sense contingut) |

La regla d'or: **el mètode diu el verb i la ruta diu el substantiu**. `GET /api/tareas` és "dona'm les tasques"; `DELETE /api/tareas/3` és "esborra la tasca 3". Així, una taula de quatre files documenta tota l'API.

---

## 🧱 El model i el magatzem

Primer, la tasca. Un `record` (genèric i net, com a la U11):

```java
record Tarea(int id, String titulo, boolean completada) {}
```

I el magatzem: un `ArrayList<Tarea>` + un comptador d'IDs. El declares com a camp de la classe del servidor:

```java
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

public class ApiTareas {
    private static final List<Tarea> tareas = new ArrayList<>();
    private static final AtomicInteger contador = new AtomicInteger(1);

    static {
        tareas.add(new Tarea(contador.getAndIncrement(), "Aprender HttpServer", false));
        tareas.add(new Tarea(contador.getAndIncrement(), "Hacer la práctica de JSON", false));
    }

    // ... ací van els contexts
}
```

> 💡 **Consell:** `AtomicInteger` et dona IDs que no es repetixen ni amb peticions simultànies. Amb un `int` normal, dues peticions alhora podrien llegir el mateix valor. En producció, eixe `ArrayList` seria una base de dades (JDBC, com a la U13), però el patró és idèntic.

---

## 🔧 Els quatre endpoints

### GET: llistar-ho tot

```java
server.createContext("/api/tareas", intercambio -> {
    if ("GET".equals(intercambio.getRequestMethod())) {
        StringBuilder sb = new StringBuilder("[");
        for (int i = 0; i < tareas.size(); i++) {
            Tarea t = tareas.get(i);
            if (i > 0) sb.append(",");
            sb.append("{\"id\":").append(t.id())
              .append(",\"titulo\":\"").append(t.titulo())
              .append("\",\"completada\":").append(t.completada()).append("}");
        }
        sb.append("]");
        responderJSON(intercambio, sb.toString(), 200);
    }
});
```

Ací el JSON es construïx a mà perquè vegen què és cada peça. Al punt 7 descobriràs que Gson ho fa per tu amb una línia: `new Gson().toJson(tareas)`.

### POST: crear

```java
server.createContext("/api/tareas", intercambio -> {
    if ("POST".equals(intercambio.getRequestMethod())) {
        String body = new String(intercambio.getRequestBody().readAllBytes());
        // body = {"titulo": "Comprar café"}
        String titulo = body.split("\"titulo\":\"")[1].split("\"")[0];
        Tarea nueva = new Tarea(contador.getAndIncrement(), titulo, false);
        tareas.add(nueva);
        responderJSON(intercambio,
            "{\"id\":" + nueva.id() + ",\"titulo\":\"" + titulo + "\",\"completada\":false}",
            201);
    }
});
```

> ⚠️ **Advertència:** parsejar JSON amb `split` és un apaño didàctic. Si el títol porta cometes, es trenca. El camí professional és Gson (punts 7 i 8), que parseja això en una línia i sense drama.

### PUT i DELETE: actualitzar i esborrar per ID

Per a rutes amb paràmetre (`/api/tareas/3`) cal llegir l'ID de la pròpia ruta:

```java
server.createContext("/api/tareas/", intercambio -> {
    String ruta = intercambio.getRequestURI().getPath();
    int id = Integer.parseInt(ruta.substring("/api/tareas/".length()));

    if ("PUT".equals(intercambio.getRequestMethod())) {
        for (int i = 0; i < tareas.size(); i++) {
            if (tareas.get(i).id() == id) {
                tareas.set(i, new Tarea(id, tareas.get(i).titulo(), true));
                responderJSON(intercambio, "{\"actualizada\":true}", 200);
                return;
            }
        }
        responderJSON(intercambio, "{\"error\":\"tarea no encontrada\"}", 404);
    } else if ("DELETE".equals(intercambio.getRequestMethod())) {
        boolean borrada = tareas.removeIf(t -> t.id() == id);
        if (borrada) {
            intercambio.sendResponseHeaders(204, -1);
        } else {
            responderJSON(intercambio, "{\"error\":\"tarea no encontrada\"}", 404);
        }
        intercambio.close();
    }
});
```

Fixa't en dos detalls: el `404` quan l'ID no existix (el client pregunta per una cosa que no hi és), i el `204` del DELETE (esborrar "bé" no torna cos).

> 💡 **Consell:** `tareas.removeIf(...)` és la joia de les col·leccions de la U10: esborra tots els elements que complisquen la condició en una línia, sense `ConcurrentModificationException` perquè és un mètode de la pròpia llista.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quin mètode HTTP uses per a crear un recurs? I per a llistar-los?
2. Quin codi d'estat tornes quan el client demana un ID que no existix?
3. Què torna un `DELETE` que ha eixit bé?
4. Per què servix un `ArrayList` com a magatzem si en reiniciar es perd tot?

<details>
<summary>🔄 Respostes</summary>

1. `POST` per a crear, `GET` per a llistar.
2. `404`, perquè el recurs demanat no existix.
3. `204` (sense contingut): esborrar amb èxit no necessita tornar cos.
4. Perquè per a aprendre el patró REST basta; la persistència (amb JDBC, U13) canvia el magatzem, no les rutes ni els mètodes.

</details>

---

## ✅ Resum en 3 frases

1. Una **API REST** ordena rutes i mètodes: `GET` llig, `POST` crea, `PUT` actualitza, `DELETE` esborra, i cada ruta diu quin recurs toca.
2. El **magatzem en memòria** (`ArrayList` + `AtomicInteger`) és perfecte per a aprendre el patró; la base de dades de la U13 només substituïx el magatzem, no les rutes.
3. Gestiona els **errors amb codis honestos**: `404` si no existix, `201` si crees, `204` si esborres; així la teua API parla clar.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | REST | Estil d'organització de rutes i mètodes d'una API |
> | CRUD | Crear, llegir, actualitzar, esborrar (les 4 operacions) |
> | Endpoint | Una ruta concreta de l'API (`/api/tareas`) |
> | Path param | El `3` de `/api/tareas/3`, llegit de la pròpia ruta |
> | `204` | Resposta d'èxit sense contingut (típic de DELETE) |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/14-apis-web) · **Anterior:** [05 · Tornant JSON: com una API de veritat](/ApuntesProgramacion/va/14-apis-web/05-devolviendo-json) · **Següent:** [07 · Consumir APIs externes amb HttpClient](/ApuntesProgramacion/va/14-apis-web/07-httpclient)