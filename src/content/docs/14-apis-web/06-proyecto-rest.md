---
title: "06 · Mini proyecto: gestor de tareas (API REST)"
description: "Júntalo todo en una API REST: GET, POST, PUT y DELETE con datos en memoria 🗂️🔧"
---

<p><small>Júntalo todo en una API REST: GET, POST, PUT y DELETE con datos en memoria 🗂️🔧</small></p>

> 🗺️ **Estás en:** 🌐 **U14 · Servir y Consumir APIs con Web** → 06 · Mini proyecto: gestor de tareas (API REST)

---

## 📬 La idea en una frase

> **Ya sabes servir HTML y JSON. Ahora júntalo todo en una API REST con las cuatro operaciones de la vida: crear, leer, actualizar y borrar (CRUD), con los datos viviendo en un `ArrayList` en memoria.**

Este es el punto donde todo cobra sentido. Un servidor que solo contesta "hola" es un monólogo. Una **API REST** es una conversación: el cliente hace `GET`, `POST`, `PUT` o `DELETE` y el servidor responde como es debido. Y no necesitas base de datos: un `ArrayList` en memoria (viste las colecciones en la U10) es suficiente para que funcione.

---

## 🗂️ Qué es REST (en 20 segundos)

REST es una forma ordenada de organizar rutas y métodos para que la API se explique sola:

| Método | Ruta | Acción | Resultado |
|---|---|---|---|
| GET | `/api/tareas` | Listar todas | `200` + JSON |
| POST | `/api/tareas` | Crear una | `201` + la tarea creada |
| PUT | `/api/tareas/1` | Actualizar la tarea 1 | `200` |
| DELETE | `/api/tareas/1` | Borrar la tarea 1 | `204` (sin contenido) |

La regla de oro: **el método dice el verbo y la ruta dice el sustantivo**. `GET /api/tareas` es "dame las tareas"; `DELETE /api/tareas/3` es "borra la tarea 3". Así, una tabla de cuatro filas documenta toda la API.

---

## 🧱 El modelo y el almacén

Primero, la tarea. Un `record` (genérico y limpio, como en la U11):

```java
record Tarea(int id, String titulo, boolean completada) {}
```

Y el almacén: un `ArrayList<Tarea>` + un contador de IDs. Lo declaras como campo de la clase del servidor:

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

    // ... aquí van los contextos
}
```

> 💡 **Consejo:** `AtomicInteger` te da IDs que no se repiten ni con peticiones simultáneas. Con un `int` normal, dos peticiones a la vez podrían leer el mismo valor. En producción, ese `ArrayList` sería una base de datos (JDBC, como en la U13), pero el patrón es idéntico.

---

## 🔧 Los cuatro endpoints

### GET: listar todo

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

Aquí el JSON se construye a mano para que veas qué es cada pieza. En el punto 7 descubrirás que Gson lo hace por ti con una línea: `new Gson().toJson(tareas)`.

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

> ⚠️ **Advertencia:** parsear JSON con `split` es un apaño didáctico. Si el título lleva comillas, se rompe. El camino profesional es Gson (puntos 7 y 8), que parsea esto en una línea y sin drama.

### PUT y DELETE: actualizar y borrar por ID

Para rutas con parámetro (`/api/tareas/3`) hay que leer el ID de la propia ruta:

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

Fíjate en dos detalles: el `404` cuando el ID no existe (el cliente pregunta por algo que no está), y el `204` del DELETE (borrar "bien" no devuelve cuerpo).

> 💡 **Consejo:** `tareas.removeIf(...)` es la joya de las colecciones de la U10: borra todos los elementos que cumplan la condición en una línea, sin `ConcurrentModificationException` porque es un método de la propia lista.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué método HTTP usas para crear un recurso? ¿Y para listarlos?
2. ¿Qué código de estado devuelves cuando el cliente pide un ID que no existe?
3. ¿Qué devuelve un `DELETE` que ha salido bien?
4. ¿Por qué sirve un `ArrayList` como almacén si al reiniciar se pierde todo?

<details>
<summary>🔄 Respuestas</summary>

1. `POST` para crear, `GET` para listar.
2. `404`, porque el recurso pedido no existe.
3. `204` (sin contenido): borrar con éxito no necesita devolver cuerpo.
4. Porque para aprender el patrón REST basta; la persistencia (con JDBC, U13) cambia el almacén, no las rutas ni los métodos.

</details>

---

## ✅ Resumen en 3 frases

1. Una **API REST** ordena rutas y métodos: `GET` lee, `POST` crea, `PUT` actualiza, `DELETE` borra, y cada ruta dice qué recurso toca.
2. El **almacén en memoria** (`ArrayList` + `AtomicInteger`) es perfecto para aprender el patrón; la base de datos de la U13 solo sustituye el almacén, no las rutas.
3. Maneja los **errores con códigos honestos**: `404` si no existe, `201` si creas, `204` si borras; así tu API habla claro.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | REST | Estilo de organización de rutas y métodos de una API |
> | CRUD | Crear, leer, actualizar, borrar (las 4 operaciones) |
> | Endpoint | Una ruta concreta de la API (`/api/tareas`) |
> | Path param | El `3` de `/api/tareas/3`, leído de la propia ruta |
> | `204` | Respuesta de éxito sin contenido (típico de DELETE) |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/14-apis-web) · **Anterior:** [05 · Devolviendo JSON: como una API de verdad](/ApuntesProgramacion/14-apis-web/05-devolviendo-json) · **Siguiente:** [07 · Consumir APIs externas con HttpClient](/ApuntesProgramacion/14-apis-web/07-httpclient)