---
title: "Butlletí 14 - Resolt: Servir i Consumir APIs amb Web"
nav_order: 14
---
Ejercicios de nivel creciente. Sin soluciones, solo pistas.

---

## ⭐ Ejercicio 1: Servidor de archivos estáticos

Sirve cualquier fichero de la carpeta `web/` (HTML, CSS, JS, imágenes) usando `Files.probeContentType()` para el Content-Type.

> Pista: usa `Files.readAllBytes(Path.of("web", ruta))` y captura `NoSuchFileException` para devolver 404.

---

## ⭐ Ejercicio 2: Formulario de contacto

Crea una ruta `/contacto` que sirva un formulario HTML (GET) y otra ruta `/enviar` que reciba los datos por POST y los muestre en una página de confirmación.

> Pista: en el handler de `/enviar` comprueba `e.getRequestMethod().equals("POST")` y lee el cuerpo con `e.getRequestBody().readAllBytes()`.

---

## ⭐⭐ Ejercicio 3: API JSON de productos

Implementa una API REST:

- `GET /api/productos` → lista todos los productos
- `POST /api/productos` → añade uno (recibe JSON)
- `DELETE /api/productos/{id}` → borra uno

Usa un `ArrayList<Producto>` como almacén en memoria.

> Pista: para parsear JSON a mano, usa `String.split()` o la clase `java.util.Scanner`. Para algo más serio, `org.json` o `Gson`.

---

## ⭐⭐ Ejercicio 4: Chat en memoria

Crea un chat simple donde los mensajes se guardan en un `ArrayList`. El frontend pregunta cada 2 segundos con `setInterval` si hay mensajes nuevos.

- `GET /api/mensajes?ultimoId=5` → mensajes nuevos desde el ID 5
- `POST /api/mensajes` → body: `{usuario:"Ana", texto:"Hola"}`

> Pista: El frontend usa `fetch()` dentro de un `setInterval`. El backend filtra mensajes por ID mayor que `ultimoId`.

---

## ⭐⭐⭐ Ejercicio 5: Mini framework MVC

Implementa un mini enrutador que permita definir rutas con esta sintaxis:

```java
get("/usuarios", (req, res) -> res.html("<h1>Usuarios</h1>"));
post("/usuarios", (req, res) -> res.json(nuevoUsuario));
```

> Pista: Crea una clase `Router` con mapas de `HashMap<String, Handler>` para GET y POST. Cada handler recibe `HttpExchange` y tiene métodos auxiliares `html()` y `json()`.

---

## ⭐⭐⭐ Ejercicio 6: Subida de archivos

Permite al usuario seleccionar un archivo desde el navegador y subirlo al servidor. Guárdalo en `uploads/` y muestra el nombre y tamaño en una tabla.

- Frontend: `<input type="file">` + `FormData` + `fetch POST`
- Backend: leer `multipart/form-data` a mano o con `Scanner`

> Pista: El Content-Type `multipart/form-data` incluye un boundary. Separa el cuerpo por ese boundary para extraer el nombre y contenido del archivo.
