---
title: "U14 — Servir y Consumir APIs con Web"
description: "Del terminal a Internet: HttpServer, HTML, formularios, JSON y HttpClient para servir y consumir APIs como una de verdad 🌐"
emoji: 🌐
---

<p><small>Del terminal a Internet: HttpServer, HTML, formularios, JSON y HttpClient para servir y consumir APIs como una de verdad 🌐</small></p>

> 🗺️ **El mapa del paquete:** 🚪 Bienvenida → ☕ U01 → 🔤 U02 → 🔀 U03 → 🅿️ U04 → 🧩 U05 → ⚡ U06 → 🏗️ U07 → 🔒 U08 → 🧬 U09 → 📚 U10 → 🗺️ U11 → 📁 U12 → 🗄️ U13 → **🌐 AQUÍ ESTÁS (U14)**

---

Hasta ahora tus programas vivían en la terminal, en ficheros y en bases de datos. Hoy se acabó: es hora de que salgan a Internet. Sin JavaScript frameworks, sin servidores de aplicaciones y sin instalaciones eternas: solo Java y HTTP.

Esta unidad tiene tres grandes actos:

- **Ser servidor:** con `HttpServer`, el servidor HTTP que Java trae de serie, servirás texto, HTML, formularios y JSON sin instalar Tomcat ni Spring.
- **Ser API:** montarás un mini proyecto REST completo —un gestor de tareas— con GET, POST, PUT y DELETE.
- **Ser cliente:** con `java.net.http.HttpClient`, consumirás APIs externas reales (GitHub, jsonplaceholder), parsearás JSON con Gson y manejarás cabeceras, timeouts y códigos de estado.

Por el camino entenderás el modelo petición-respuesta de HTTP, por qué `"POST".equals(...)` es mejor que `...equals("POST")`, qué significa de verdad un 404 y por qué el `fetch` de JavaScript y el `HttpClient` de Java son dos caras de la misma moneda.

Esta unidad se lee como un **libro de 9 capítulos**: los 8 primeros puntos son teoría en progresión y el 9º es un aterrizaje práctico para machacar todo lo aprendido.

---

## 🎯 Objetivo de la unidad

Al terminar, serás capaz de:

- Explicar el modelo **petición-respuesta** de HTTP y sus códigos de estado más comunes (200, 404, 500...).
- Montar un **servidor web mínimo** con `com.sun.net.httpserver.HttpServer` en menos de 20 líneas.
- Servir **HTML** desde Java y leerlo también desde un fichero.
- Procesar **parámetros GET** y **formularios POST** sin miedo.
- Devolver **JSON** con el `Content-Type` adecuado y consumirlo con `fetch`.
- Construir una **API REST** completa (GET, POST, PUT, DELETE) con datos en memoria.
- Consumir APIs externas con **`HttpClient`**: GET, POST, cabeceras, timeouts y llamadas asíncronas.
- **Parsear JSON** con Gson, mapearlo a `record` y manejar errores HTTP con elegancia.

---

## 🗺️ Mapa de la unidad

| Punto | Qué aprenderás | Dificultad |
|---|---|---|
| [01 · El protocolo HTTP en 30 segundos](/ApuntesProgramacion/14-apis-web/01-protocolo-http) | Petición-respuesta, métodos, códigos de estado y URLs | Todos |
| [02 · Servidor web mínimo con HttpServer](/ApuntesProgramacion/14-apis-web/02-servidor-minimo) | Tu primer servidor Java: `HttpServer`, `createContext` y `HttpExchange` | Todos |
| [03 · Sirviendo HTML](/ApuntesProgramacion/14-apis-web/03-sirviendo-html) | Páginas completas con `Content-Type: text/html` y desde fichero | Todos |
| [04 · Parámetros GET y formularios POST](/ApuntesProgramacion/14-apis-web/04-get-post) | Leer la query string y el cuerpo de la petición | Todos |
| [05 · Devolviendo JSON: como una API de verdad](/ApuntesProgramacion/14-apis-web/05-devolviendo-json) | `application/json`, `fetch` desde el frontend y por qué front y back se separan | Todos |
| [06 · Mini proyecto: gestor de tareas (API REST)](/ApuntesProgramacion/14-apis-web/06-proyecto-rest) | CRUD completo en memoria: GET, POST, PUT y DELETE | Todos |
| [07 · Consumir APIs externas con HttpClient](/ApuntesProgramacion/14-apis-web/07-httpclient) | `HttpClient`, GET, `BodyHandlers` y parsear JSON con Gson | Todos |
| [08 · HttpClient avanzado](/ApuntesProgramacion/14-apis-web/08-httpclient-avanzado) | POST, cabeceras, timeouts, `sendAsync` y PUT/DELETE | Todos |
| [09 · Repaso interactivo](/ApuntesProgramacion/14-apis-web/09-repaso-interactivo) | Sé el Código, Fireside, Laboratorio, Crucigrama y más | Todos |

> 📖 **Flujo de lectura:** los 8 primeros puntos son teoría en progresión. El 9º es el aterrizaje práctico: léelo justo después del 8º y antes de abrir los boletines.

---

## 📝 Boletines de la unidad

> Practica con los pares del curso: empieza siempre por el resuelto para ver el estilo y luego intenta el por-resolver.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/boletines/boletin-u14-inicial-resuelto" class="elink">✅ Inicial resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u14-inicial" class="elink">🟢 Inicial por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u14-avanzado-resuelto" class="elink">💪 Avanzado resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u14-avanzado" class="elink">⭐ Avanzado por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u14-extras" class="elink">🔥 Extras</a>
</div>

---

## ✅ Criterios de evaluación cubiertos (RA5)

**RA5: Realiza operaciones de entrada y salida de información, utilizando procedimientos específicos del lenguaje y librerías de clases.**

| CE | Criterio | Dónde se cubre |
|---|---|---|
| RA5 c) | Se han reconocido las posibilidades de entrada / salida del lenguaje y las librerías asociadas. | ✅ Puntos 1, 2, 7 y 8 |
| RA5 f) | Se han utilizado las herramientas del entorno de desarrollo para crear interfaces gráficos de usuario simples. | ✅ Puntos 3 y 6 |
| RA5 g) | Se han programado controladores de eventos. | ✅ Punto 6 |
| RA5 h) | Se han escrito programas que utilicen interfaces gráficos para la entrada y salida de información. | ✅ Puntos 5 y 6 |

> 📌 La **RA5** se completa con la **U02** (consola y formatos, CEs a y b) y la **U12** (ficheros y acceso a archivos, CEs c, d y e). Esta unidad cubre la cara web de la entrada/salida: HTTP como protocolo, HTML y JSON como formatos, y las librerías `HttpServer` y `HttpClient` como procedimientos del lenguaje.

---

## 🚪 ¿Por dónde empiezo?

- ¿Vienes de la U13 (JDBC) y quieres lo esencial? → Arranca en el [punto 1](/ApuntesProgramacion/14-apis-web/01-protocolo-http) y el [punto 2](/ApuntesProgramacion/14-apis-web/02-servidor-minimo): HTTP y tu primer servidor.
- ¿Ya sabes servir y quieres hacer APIs? → Ve directo al [punto 5](/ApuntesProgramacion/14-apis-web/05-devolviendo-json) y al [punto 6](/ApuntesProgramacion/14-apis-web/06-proyecto-rest): JSON y el CRUD de tareas.
- ¿Solo vienes a por el lado cliente? → Salta al [punto 7](/ApuntesProgramacion/14-apis-web/07-httpclient) y al [punto 8](/ApuntesProgramacion/14-apis-web/08-httpclient-avanzado): consumir APIs externas.
- ¿Vienes a repasar? → Haz el [Repaso interactivo](/ApuntesProgramacion/14-apis-web/09-repaso-interactivo) y después los [boletines](/ApuntesProgramacion/boletines/boletin-u14-inicial).

**📍 Primer punto:** [01 · El protocolo HTTP en 30 segundos](/ApuntesProgramacion/14-apis-web/01-protocolo-http)

**🎓 Fin del curso.** Empezaste escribiendo `System.out.println("Hola, mundo")` en una terminal y acabas sirviendo y consumiendo APIs por Internet. De consola a web en 14 unidades: no es poco. La siguiente parada ya no tiene guía: elige tu camino (Spring Boot, tu proyecto final, tu primera entrevista) y sigue programando.