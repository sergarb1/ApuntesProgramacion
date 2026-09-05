---
title: "Boletín U14 — Avanzado"
description: "Ejercicios de dificultad progresiva para dominar JSON, formularios POST y HttpClient"
---

# 📝 Boletín U14 — Avanzado

> Dificultad progresiva. ⭐ para calentar, ⭐⭐ para pensar, ⭐⭐⭐ para concursar. Cada ejercicio incluye una pista (resiste a mirarla).

---

## ⭐ Ejercicio 1: API de frases motivacionales

Crea un endpoint `GET /api/frase` que devuelva un JSON con una frase aleatoria de un array precargado y su autor.

```json
{"frase": "El código limpio es como un buen chiste: si tienes que explicarlo, es malo", "autor": "Alguien que sabe"}
```

El frontend es un HTML con un botón "Nueva frase" que al hacer clic hace `fetch('/api/frase')` y muestra la frase en pantalla.

**Pista:** usa `Math.random()` para elegir un índice aleatorio del array, o `Random.nextInt(longitud)`.

---

## ⭐ Ejercicio 2: Formulario de contacto con POST

Crea una ruta `/contacto` que sirva un formulario HTML (GET) con campos `nombre` y `mensaje`, y una ruta `/enviar` que reciba los datos por POST y los muestre en una página de confirmación.

**Pista:** en el handler de `/enviar` comprueba `"POST".equals(e.getRequestMethod())` y lee el cuerpo con `e.getRequestBody().readAllBytes()`. El formato del cuerpo es `nombre=Ana&mensaje=Hola`.

---

## ⭐ Ejercicio 3: Piedra, papel, tijera online

Endpoint `POST /api/jugar` que recibe:

```json
{"jugada": "piedra"}
```

Y devuelve:

```json
{"jugadaPC": "tijera", "resultado": "ganaste"}
```

Reglas clásicas: piedra > tijera, tijera > papel, papel > piedra.

Frontend: tres botones con emojis 🪨📄✂️. Al hacer clic, envía la jugada y muestra el resultado.

**Pista:** la jugada del PC se elige con `Random`. Las reglas se pueden implementar con un `Map<String, String>` donde la clave vence al valor: `{"piedra": "tijera", "tijera": "papel", "papel": "piedra"}`.

---

## ⭐⭐ Ejercicio 4: El tiempo que NO hace

Crea `GET /api/clima?ciudad=Madrid` que devuelva un JSON con datos meteorológicos **aleatorios** (generados cada vez):

```json
{"ciudad": "Madrid", "temperatura": 28, "humedad": 45, "estado": "soleado"}
```

Estados posibles: `"soleado"`, `"nublado"`, `"lluvia"`, `"tormenta"`. Frontend con emojis y temperaturas de colores.

**Pista:** usa `String[] estados = {...}` y elige aleatoriamente. La temperatura puede ser `random.nextInt(40) - 5`.

---

## ⭐⭐ Ejercicio 5: Traductor chungo (pero funcional)

Implementa un endpoint `POST /api/traducir` que reciba:

```json
{"texto": "hola", "idioma": "en"}
```

Y devuelva:

```json
{"traduccion": "hello"}
```

Usa un `HashMap<String, HashMap<String, String>>` como diccionario. Mete al menos 10 palabras en español traducidas a inglés y francés.

**Pista:** inicializa el diccionario con bloques `static`. `diccionario.get("hola").get("en")` te da `"hello"`. Los mapas los viste en la U11.

---

## ⭐⭐ Ejercicio 6: API REST de tareas con prioridad

Implementa un CRUD completo de tareas donde cada tarea tiene: `id`, `titulo`, `prioridad` (`"ALTA"`, `"MEDIA"`, `"BAJA"`).

| Método | Ruta | Descripción |
|--------|------|-------------|
| GET | `/api/tareas` | Lista todas |
| POST | `/api/tareas` | Crea una (JSON: `{"titulo": "...", "prioridad": "ALTA"}`) |
| PUT | `/api/tareas/{id}` | Cambia prioridad (JSON: `{"prioridad": "BAJA"}`) |
| DELETE | `/api/tareas/{id}` | Borra una |

Frontend: tabla con colores de fondo según prioridad (rojo ALTA, amarillo MEDIA, verde BAJA). Botones para crear, cambiar prioridad y borrar.

**Pista:** guarda las tareas en un `ConcurrentHashMap<Integer, Tarea>` con un `AtomicInteger` para los IDs. Para el path param, parsea la ruta con `substring`.

---

## ⭐⭐ Ejercicio 7: Cliente GET — los repos de GitHub

Usa `HttpClient` para consultar la API de GitHub (`https://api.github.com/users/{usuario}/repos`) y mostrar solo el **nombre** y el **lenguaje** de cada repositorio de un usuario (que se pide por teclado). Luego guarda los resultados en un archivo `repos.txt`.

**Pista:** parsea la respuesta con Gson (`JsonArray`), recórrela, y escribe con `Files.writeString` (los ficheros los viste en la U12). Recuerda la cabecera `User-Agent`, que GitHub exige.

---

## ⭐⭐ Ejercicio 8: Cliente POST — crear una publicación en jsonplaceholder

Usa `HttpClient` para hacer un `POST` a `https://jsonplaceholder.typicode.com/posts` con un cuerpo JSON:

```json
{"title": "Mi primera API", "body": "Consumida desde Java", "userId": 1}
```

Muestra el código de estado y el cuerpo de la respuesta. Comprueba que la cabecera `Content-Type: application/json` está puesta.

**Pista:** `HttpRequest.newBuilder().uri(...).header("Content-Type", "application/json").POST(HttpRequest.BodyPublishers.ofString(json)).build()`.

---

## ⭐⭐⭐ Ejercicio 9: Middleware de logging

Crea una clase `LoggerMiddleware` que envuelva cualquier `HttpHandler` y registre en consola:

```
[2026-06-21 14:30:01] GET /api/peliculas → 200 (15ms)
[2026-06-21 14:30:05] POST /api/tareas → 201 (3ms)
```

Debe poder aplicarse a cualquier handler así:

```java
server.createContext("/api", new LoggerMiddleware(new TareasHandler()));
```

**Pista:** guarda `System.currentTimeMillis()` antes y después de llamar al handler original. Usa `e.getRequestMethod()`, `e.getRequestURI()` y `e.getResponseCode()` (tras enviar cabeceras).