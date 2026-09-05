---
title: "Boletín 14 - Intermedio: Servir y Consumir APIs con Web"
nav_order: 14
---
Ejercicios para dominar el arte de servir JSON, procesar formularios y hacer que frontend y backend se hablen sin pelearse.

---

## ⭐ Ejercicio 1: API de frases motivacionales

Crea un endpoint `GET /api/frase` que devuelva un JSON con una frase aleatoria de un array precargado y su autor.

```json
{"frase": "El código limpio es como un buen chiste: si tienes que explicarlo, es malo", "autor": "Alguien que sabe"}
```

El frontend es un HTML con un botón "Nueva frase" que al hacer clic hace `fetch('/api/frase')` y muestra la frase en pantalla.

> Pista: usa `Math.random()` para elegir un índice aleatorio del array.

---

## ⭐ Ejercicio 2: Traductor chungo (pero funcional)

Implementa un endpoint `POST /api/traducir` que reciba:

```json
{"texto": "hola", "idioma": "en"}
```

Y devuelva:

```json
{"traduccion": "hello"}
```

Usa un `HashMap<String, HashMap<String, String>>` como diccionario. Mete al menos 10 palabras en español traducidas a inglés y francés.

> Pista: Inicializa el diccionario con bloques static. `diccionario.get("hola").get("en")` te da "hello".

---

## ⭐⭐ Ejercicio 3: API REST de tareas con prioridad

Implementa un CRUD completo de tareas donde cada tarea tiene: `id`, `titulo`, `prioridad` ("ALTA", "MEDIA", "BAJA").

| Método | Ruta | Descripción |
|--------|------|-------------|
| GET | `/api/tareas` | Lista todas |
| POST | `/api/tareas` | Crea una (JSON: `{"titulo": "...", "prioridad": "ALTA"}`) |
| PUT | `/api/tareas/{id}` | Cambia prioridad (JSON: `{"prioridad": "BAJA"}`) |
| DELETE | `/api/tareas/{id}` | Borra una |

Frontend: tabla con colores de fondo según prioridad (rojo ALTA, amarillo MEDIA, verde BAJA). Botones para crear, cambiar prioridad y borrar.

> Pista: guarda las tareas en un `ConcurrentHashMap<Integer, Tarea>` con un `AtomicInteger` para IDs.

---

## ⭐⭐ Ejercicio 4: El tiempo que NO hace

Crea `GET /api/clima?ciudad=Madrid` que devuelva un JSON con datos meteorológicos **aleatorios** (generados cada vez):

```json
{"ciudad": "Madrid", "temperatura": 28, "humedad": 45, "estado": "soleado"}
```

Estados posibles: "soleado", "nublado", "lluvia", "tormenta". Frontend con emojis y temperaturas de colores.

> Pista: usa `String[] estados = {"soleado", "nublado", "lluvia", "tormenta"}` y elige aleatoriamente. La temperatura puede ser `random.nextInt(40) - 5`.

---

## ⭐⭐ Ejercicio 5: Catálogo de películas con filtros

Precarga un array de 10-15 películas (con `titulo`, `genero`, `anyo`, `puntuacion`). Implementa:

- `GET /api/peliculas` → lista todas
- `GET /api/peliculas?genero=comedia` → filtra por género
- `GET /api/peliculas?genero=comedia&anyo=1994` → filtra por género y año
- `GET /api/peliculas/3` → detalle de la película con ID 3

Frontend: selectores de género y año, que al cambiar actualizan la lista vía fetch.

> Pista: para filtrar usa `stream().filter(p -> p.getGenero().equals(genero)).toList()`. Para el path param, parsea la URI.

---

## ⭐⭐⭐ Ejercicio 6: Middleware de logging

Crea una clase `LoggerMiddleware` que envuelva cualquier `HttpHandler` y registre en consola:

```
[2026-06-21 14:30:01] GET /api/peliculas → 200 (15ms)
[2026-06-21 14:30:05] POST /api/tareas → 201 (3ms)
```

Debe poder aplicarse a cualquier handler así:

```java
server.createContext("/api", new LoggerMiddleware(new TareasHandler()));
```

> Pista: guarda `System.currentTimeMillis()` antes y después de llamar al handler original. Usa `e.getRequestMethod()` y `e.getResponseCode()` (tras enviar cabeceras).

---

## ⭐⭐⭐ Ejercicio 7: Server-Sent Events — El reloj del servidor

Implementa un endpoint `GET /api/eventos` que use Server-Sent Events (SSE). Cada 5 segundos, el servidor envía un evento con la hora actual:

```
data: {"hora": "14:30:05", "timestamp": 1718975405}

```

Frontend con `EventSource`:

```js
const source = new EventSource('/api/eventos');
source.onmessage = (e) => {
    document.getElementById('reloj').textContent = JSON.parse(e.data).hora;
};
```

> Pista: en el handler, pon `e.getResponseHeaders().set("Content-Type", "text/event-stream")` y NO cierres la conexión. Usa `e.getResponseBody().write()` en un bucle con `Thread.sleep(5000)`.

---

## ⭐ Ejercicio 8: Piedra, papel, tijera online

Endpoint `POST /api/jugar` que recibe:

```json
{"jugada": "piedra"}
```

Y devuelve:

```json
{"jugadaPC": "tijera", "resultado": "ganaste"}
```

Reglas clásicas: piedra > tijera, tijera > papel, papel > piedra.

Frontend: tres botones con emojis 🪨📄✂️. Al hacer clic, envía la jugada y muestra el resultado. Lleva un contador de victorias/derrotas/empates.

> Pista: la jugada del PC se elige con `Random`. Las reglas se pueden implementar con un `Map<String, String>` donde la clave vence al valor: `{"piedra": "tijera", "tijera": "papel", "papel": "piedra"}`.

---

## 📚 Referencias

- **CodeWars:** [IP Validation](https://www.codewars.com/kata/515decfd9dcfc23bb6000006) (6 kyu)
- **CodeWars:** [Simple URL parser](https://www.codewars.com/kata/56f8fe6a2e6c0dc83b0008a7) (6 kyu)
- **AceptaElReto:** [462 - Día de la semana](https://www.aceptaelreto.com/problem/statement.php?id=462) (⭐⭐)
- **Documentación Oracle:** [HttpExchange](https://docs.oracle.com/en/java/javase/21/docs/api/jdk.httpserver/com/sun/net/httpserver/HttpExchange.html)
- **MDN:** [Server-Sent Events](https://developer.mozilla.org/es/docs/Web/API/Server-sent_events)
