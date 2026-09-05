---
title: "01 · El protocolo HTTP en 30 segundos"
description: "Petición-respuesta, verbos HTTP, códigos de estado y por qué toda la web se sostiene sobre una conversación tan simple 🌐⚡"
---

<p><small>Petición-respuesta, verbos HTTP, códigos de estado y por qué toda la web se sostiene sobre una conversación tan simple 🌐⚡</small></p>

> 🗺️ **Estás en:** 🌐 **U14 · Servir y Consumir APIs con Web** → 01 · El protocolo HTTP en 30 segundos

---

## 📬 La idea en una frase

> **HTTP es un protocolo de petición-respuesta: el cliente pide un recurso (una URL) y el servidor le responde con un código de estado y el contenido. Eso es todo. El resto son capas que se construyen encima.**

En la U12 ya cerrabas ficheros con `try-with-resources` y en la U13 conectabas Java a bases de datos. Ahora el protagonista es otro: la web. Y da igual si algún día usas Tomcat, Spring Boot o un microservicio en la nube: todos hablan el mismo idioma, y ese idioma se llama HTTP. Hoy lo aprendes en 30 segundos... y en unas pocas páginas más.

---

## 💬 La conversación de la web

Cuando escribes `https://google.com` en tu navegador, ocurre esto:

```
Tú (cliente)                  Google (servidor)
    ── GET / HTTP/1.1 ──────────►
    │                              │
    ◄── HTTP/1.1 200 OK ──────────
         Content-Type: text/html
         (el HTML de Google)
```

Tres piezas:

1. **Petición:** el cliente pide un recurso. Incluye un método (`GET`), una ruta (`/`) y cabeceras (información extra como `User-Agent`).
2. **Respuesta:** el servidor contesta con un **código de estado** (`200 OK`) y un cuerpo (el HTML, un JSON, una imagen...).
3. **Cabeceras:** notas al margen que viajan en ambos sentidos. La más importante de momento: `Content-Type`, que le dice al cliente qué tipo de contenido le mandas (`text/html`, `application/json`...).

> 💡 **Consejo:** memoriza la estructura del código de estado: el primer dígito es la familia. **2xx** todo bien, **3xx** redirecciones, **4xx** el cliente se ha equivocado, **5xx** el servidor ha fallado. Con eso ya vas sobrado para interpretar cualquier error.

---

## 🎤 Los verbos de HTTP

Los métodos HTTP son el verbo de la frase. Hay muchos, pero con estos cuatro haces el 99 % de tu vida:

| Método | Qué hace | Analogía |
|---|---|---|
| `GET` | Pedir información | Preguntar |
| `POST` | Enviar información nueva | Entregar un formulario |
| `PUT` | Reemplazar un recurso completo | Devolver algo por uno nuevo |
| `DELETE` | Borrar un recurso | Tirar a la papelera |

Fíjate en la diferencia fina: `GET` no cambia nada en el servidor (es de solo lectura), mientras que `POST`, `PUT` y `DELETE` lo modifican. Por eso un enlace normal es `GET` y el envío de un formulario de registro es `POST`.

---

## 🚦 Los códigos de estado más comunes

No necesitas memorizar los cientos que existen. Con la familia y estos clásicos te basta:

| Código | Significado | Momento típico |
|---|---|---|
| `200` | Todo bien | Página cargada correctamente |
| `201` | Recurso creado | Un `POST` que crea algo nuevo |
| `404` | No encontrado | La URL no existe (o el usuario no existe) |
| `403` | Prohibido | Sin permiso (suele faltar un token) |
| `500` | Error interno | El servidor ha petado por dentro |

> 🐛 **Error típico:** cuando tu servidor devuelve `500`, casi siempre es una excepción que no capturaste dentro del handler. El navegador solo ve `500`, pero tu consola de Java te cuenta toda la historia.

---

## 🧩 Anatomía de una URL

Todo lo anterior ocurre sobre una URL. Y una URL tiene partes que te interesan:

```
http://localhost:8080/saludo?nombre=Ana&edad=25
└─┬──┘ └───┬────┘ └─┬─┘ └──┬───┘ └──────┬─────┘
protocolo  dominio   puerto  ruta    query string
```

La **query string** (después de `?`) son pares `clave=valor` separados por `&`. Es lo que envía un formulario GET y lo que leerás en el punto 4. El puerto por defecto de HTTP es el 80 (no se ve), pero en desarrollo usarás el 8080.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué dos cosas componen siempre la respuesta de un servidor HTTP?
2. ¿Qué método HTTP usarías para que un usuario registre una cuenta nueva: `GET` o `POST`? ¿Y para ver su perfil?
3. ¿Qué significa un `404`? ¿Y un `500`?
4. En `http://localhost:8080/saludo?nombre=Ana&edad=25`, ¿qué es `nombre=Ana&edad=25`?

<details>
<summary>🔄 Respuestas</summary>

1. Un **código de estado** (como `200 OK`) y un **cuerpo** (HTML, JSON, imagen...) con sus cabeceras.
2. `POST` para registrar (crea algo en el servidor). `GET` para ver el perfil (solo lectura).
3. `404` es que el recurso no existe; `500` es que el servidor ha fallado internamente.
4. La **query string**: los parámetros que viajan en la URL como pares `clave=valor`.

</details>

---

## ✅ Resumen en 3 frases

1. **HTTP es petición-respuesta:** el cliente pide una URL con un método y el servidor responde con un código de estado y un contenido.
2. Los métodos clave son **GET** (leer), **POST** (crear), **PUT** (reemplazar) y **DELETE** (borrar), y los códigos se agrupan en familias: 2xx bien, 4xx culpa del cliente, 5xx culpa del servidor.
3. La **query string** (`?clave=valor&clave2=valor2`) es cómo viajan los datos en una petición GET.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | HTTP | El idioma que hablan cliente y servidor |
> | Petición | Lo que el cliente pide (método + URL + cabeceras) |
> | Respuesta | Lo que el servidor contesta (código + cuerpo + cabeceras) |
> | `Content-Type` | Cabecera que dice qué tipo de contenido se envía |
> | Query string | Los parámetros `clave=valor` que viajan en la URL |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/14-apis-web) · **Anterior:** — · **Siguiente:** [02 · Servidor web mínimo con HttpServer](/ApuntesProgramacion/14-apis-web/02-servidor-minimo)