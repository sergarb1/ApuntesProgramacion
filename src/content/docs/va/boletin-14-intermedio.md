---
title: "Butlletí 14 - Intermedi: Servir i Consumir APIs amb Web"
nav_order: 14
---
Exercicis per a dominar l'art de servir JSON, processar formularis i fer que frontend i backend es parlen sense barallar-se.

---

## ⭐ Exercici 1: API de frases motivacionals

Crea un endpoint `GET /api/frase` que torne un JSON amb una frase aleatòria d'un array precarregat i el seu autor.

```json
{"frase": "El código limpio es como un buen chiste: si tienes que explicarlo, es malo", "autor": "Alguien que sabe"}
```

El frontend és un HTML amb un botó "Nova frase" que al fer clic fa `fetch('/api/frase')` i mostra la frase en pantalla.

> Pista: usa `Math.random()` per a triar un índex aleatori de l'array.

---

## ⭐ Exercici 2: Traductor xungo (però funcional)

Implementa un endpoint `POST /api/traducir` que reba:

```json
{"texto": "hola", "idioma": "en"}
```

I torne:

```json
{"traduccion": "hello"}
```

Usa un `HashMap<String, HashMap<String, String>>` com a diccionari. Fica almenys 10 paraules en espanyol traduïdes a anglés i francés.

> Pista: Inicialitza el diccionari amb blocs static. `diccionario.get("hola").get("en")` et dona "hello".

---

## ⭐⭐ Exercici 3: API REST de tasques amb prioritat

Implementa un CRUD complet de tasques on cada tasca té: `id`, `titol`, `prioritat` ("ALTA", "MITJA", "BAIXA").

| Mètode | Ruta | Descripció |
|--------|------|-------------|
| GET | `/api/tareas` | Llista totes |
| POST | `/api/tareas` | Crea una (JSON: `{"titulo": "...", "prioridad": "ALTA"}`) |
| PUT | `/api/tareas/{id}` | Canvia prioritat (JSON: `{"prioridad": "BAJA"}`) |
| DELETE | `/api/tareas/{id}` | Borra una |

Frontend: taula amb colors de fons segons prioritat (roig ALTA, groc MITJA, verd BAIXA). Botons per a crear, canviar prioritat i borrar.

> Pista: guarda les tasques en un `ConcurrentHashMap<Integer, Tarea>` amb un `AtomicInteger` per a IDs.

---

## ⭐⭐ Exercici 4: El temps que NO fa

Crea `GET /api/clima?ciudad=Madrid` que torne un JSON amb dades meteorològiques **aleatòries** (generades cada vegada):

```json
{"ciudad": "Madrid", "temperatura": 28, "humedad": 45, "estado": "soleado"}
```

Estats possibles: "soleado", "nublado", "lluvia", "tormenta". Frontend amb emojis i temperatures de colors.

> Pista: usa `String[] estados = {"soleado", "nublado", "lluvia", "tormenta"}` i tria aleatòriament. La temperatura pot ser `random.nextInt(40) - 5`.

---

## ⭐⭐ Exercici 5: Catàleg de pel·lícules amb filtres

Precarrega un array de 10-15 pel·lícules (amb `titol`, `genere`, `any`, `puntuacio`). Implementa:

- `GET /api/peliculas` → llista totes
- `GET /api/peliculas?genero=comedia` → filtra per gènere
- `GET /api/peliculas?genero=comedia&anyo=1994` → filtra per gènere i any
- `GET /api/peliculas/3` → detall de la pel·lícula amb ID 3

Frontend: selectors de gènere i any, que al canviar actualitzen la llista via fetch.

> Pista: per a filtrar usa `stream().filter(p -> p.getGenero().equals(genero)).toList()`. Per al path param, parseja la URI.

---

## ⭐⭐⭐ Exercici 6: Middleware de logging

Crea una classe `LoggerMiddleware` que embolique qualsevol `HttpHandler` i registre en consola:

```
[2026-06-21 14:30:01] GET /api/peliculas → 200 (15ms)
[2026-06-21 14:30:05] POST /api/tareas → 201 (3ms)
```

Ha de poder aplicar-se a qualsevol handler així:

```java
server.createContext("/api", new LoggerMiddleware(new TareasHandler()));
```

> Pista: guarda `System.currentTimeMillis()` abans i després de cridar al handler original. Usa `e.getRequestMethod()` i `e.getResponseCode()` (després d'enviar capçaleres).

---

## ⭐⭐⭐ Exercici 7: Server-Sent Events — El rellotge del servidor

Implementa un endpoint `GET /api/eventos` que use Server-Sent Events (SSE). Cada 5 segons, el servidor envia un esdeveniment amb l'hora actual:

```
data: {"hora": "14:30:05", "timestamp": 1718975405}

```

Frontend amb `EventSource`:

```js
const source = new EventSource('/api/eventos');
source.onmessage = (e) => {
    document.getElementById('reloj').textContent = JSON.parse(e.data).hora;
};
```

> Pista: en el handler, posa `e.getResponseHeaders().set("Content-Type", "text/event-stream")` i NO tanques la connexió. Usa `e.getResponseBody().write()` en un bucle amb `Thread.sleep(5000)`.

---

## ⭐ Exercici 8: Pedra, paper, tisora online

Endpoint `POST /api/jugar` que rep:

```json
{"jugada": "piedra"}
```

I torna:

```json
{"jugadaPC": "tijera", "resultado": "ganaste"}
```

Regles clàssiques: pedra > tisora, tisora > paper, paper > pedra.

Frontend: tres botons amb emojis 🪨📄✂️. Al fer clic, envia la jugada i mostra el resultat. Porta un comptador de victòries/derrotes/empats.

> Pista: la jugada del PC es tria amb `Random`. Les regles es poden implementar amb un `Map<String, String>` on la clau venç el valor: `{"piedra": "tijera", "tijera": "papel", "papel": "piedra"}`.

---

## 📚 Referències

- **CodeWars:** [IP Validation](https://www.codewars.com/kata/515decfd9dcfc23bb6000006) (6 kyu)
- **CodeWars:** [Simple URL parser](https://www.codewars.com/kata/56f8fe6a2e6c0dc83b0008a7) (6 kyu)
- **AceptaElReto:** [462 - Día de la semana](https://www.aceptaelreto.com/problem/statement.php?id=462) (⭐⭐)
- **Documentació Oracle:** [HttpExchange](https://docs.oracle.com/en/java/javase/21/docs/api/jdk.httpserver/com/sun/net/httpserver/HttpExchange.html)
- **MDN:** [Server-Sent Events](https://developer.mozilla.org/es/docs/Web/API/Server-sent_events)
