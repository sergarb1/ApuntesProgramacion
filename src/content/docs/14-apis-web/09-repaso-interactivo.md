---
title: "09 · Repaso interactivo: domina la web"
description: "El cierre práctico de la unidad y del curso, con un parser que lo va a liar todo y un servidor que no arranca 😈🌐"
---

<p><small>El cierre práctico de la unidad y del curso, con un parser que lo va a liar todo y un servidor que no arranca 😈🌐</small></p>

> 🗺️ **Estás en:** 🌐 **U14 · Servir y Consumir APIs con Web** → 09 · Repaso interactivo

---

## 📬 La idea en una frase

> **En este punto no aprendemos nada nuevo: lo convertimos todo en práctica. Y, como siempre, algo no va a funcionar.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaban de darte este programa para ejecutar:*

```java
public class Misterio {

    static String extraer(String query, String clave) {
        if (query == null) return "nada";
        for (String par : query.split("&")) {
            String[] trozos = par.split("=");
            if (trozos.length == 2 && trozos[0].equals(clave)) {
                return trozos[1];
            }
        }
        return "nada";
    }

    public static void main(String[] args) {
        System.out.println(extraer("nombre=Ana&edad=25", "edad"));
        System.out.println(extraer("nombre=Ana&edad=25", "ciudad"));
        System.out.println(extraer("clave=valor", "clave"));
    }
}
```

**¿Qué imprimes por pantalla? Elige sabiamente:**

1. **`25 nada valor`** → ✅ ¡Correcto! Para la clave `edad` encuentra el par `edad=25` y devuelve `"25"`. Para `ciudad` no hay par con esa clave → `"nada"`. Para `clave` → `"valor"`.
2. **`nada 25 valor`** → Leíste el orden al revés: piensa qué clave se busca primero. ❌
3. **`25 25 valor`** → El segundo `System.out` no busca "edad" dos veces: busca `ciudad`, que no existe. ❌

> <details>
> <summary>🔄 Solución</summary>
>
> La opción **1**. El parser recorre los pares `clave=valor` separados por `&` y devuelve el valor de la clave pedida. `edad` → `25`; `ciudad` → no está → `nada`; `clave` → `valor`. Es exactamente el `extraerParametro` del punto 4: la misma lógica que usas para leer la query string de un GET.
>
> </details>

---

## 🔥 Fireside Chat: GET vs POST

> *Dos primos del protocolo se enzarzan frente a la máquina de café.*

**GET:** — Yo soy el de toda la vida. Pido, me dan, no cambio nada. ¿Quieres repetir mi petición? Solo pegas la URL en el navegador y ya está. Reproducible, cacheable, simple.

**POST:** — ¿Y para enviar el formulario de registro de un usuario? ¿Vas a meter su contraseña en la URL para que quede en el historial y en los logs del servidor? Eso es lo que harías tú. Yo lo llevo en el cuerpo: privado, ordenado y sin límite de tamaño práctico.

**GET:** — Vale, para datos sensibles eres tú. Pero yo soy el que carga el 99 % de la web: cada página, cada imagen, cada búsqueda pasa por mí. ¿Cuántas veces te he visto en un formulario de búsqueda? Ah, que el buscador usa GET, porque así el resultado se puede compartir y enlazar. Interesante.

**POST:** — Tú para leer y compartir. Yo para enviar y crear. ¿Tregua?

**GET:** — Tregua. Pero no me mandes un `DELETE` con cuerpo, que eso es de mal gusto.

> La lección: **¿leer, cachear, compartir? → GET. ¿enviar datos, crear, algo sensible? → POST.** Y recuerda: un GET no debe cambiar el estado del servidor; eso es trabajo de POST, PUT y DELETE.

---

## 🕵️ ¿Quién soy?

Adivina qué concepto de la unidad soy:

1. **Soy el idioma que hablan el cliente y el servidor, y el 200 es mi saludo favorito.**
2. **Soy el servidor web que Java trae de serie; créame un puerto y un contexto y le atenderé.**
3. **Soy el formato de datos que cualquier lenguaje entiende, con llaves y corchetes.**
4. **Soy la cabecera que delata si la respuesta es HTML, JSON o texto plano.**
5. **Soy el cliente de Java 11+ que consulta APIs ajenas con el trío cliente-petición-respuesta.**
6. **Soy la librería que convierte JSON en objetos Java, con `fromJson` como conjuro.**

<details>
<summary>🔄 Respuestas</summary>

1. **HTTP** — petición-respuesta, y `200` es "todo bien".
2. **`HttpServer`** — `createContext` + `start()` y a servir.
3. **JSON** — objetos `{...}` y arrays `[...]`.
4. **`Content-Type`** — `text/html`, `application/json`...
5. **`HttpClient`** — `HttpClient`, `HttpRequest` y `HttpResponse`.
6. **Gson** — `gson.fromJson(cuerpo, Clase.class)`.

</details>

---

## 🤬 CONRAD VS EL MUNDO: "El puerto que no arranca"

> *CONRAD, nuestro compilador cascarrabias, opina sobre los clásicos del novato en la web.*

**CONRAD:** — ¡OTRA VEZ! Viene un alumno y me dice: *CONRAD, mi servidor no arranca*. Y yo: vale, ¿qué error? *Pues algo de "Address already in use".* ¡AY, MADRE MÍA! Tienes otra instancia del servidor corriendo desde la práctica anterior. Cierra la pestaña de la terminal o cambia de puerto: `new InetSocketAddress(8081, 0)`. El puerto no es de tu propiedad vitalicia.

*Y luego está el del HTML.* Devuelve una página y el navegador le enseña el código en vez de la web. ¿Adivinas qué falta? El `Content-Type: text/html`. Sin la cabecera, el navegador hace lo que puede, y lo que puede es mostrarte el código como texto plano. La cabecera es el uniforme: sin ella, nadie sabe qué eres.

*Y el colmo de los colmos:* el que parsea el JSON a mano con `split`. Le llega un título con una comilla y Gson no tiene culpa de nada: es que el `split("\"titulo\":\"")` se ha descosido. ¿Por qué? Porque existe Gson para eso. En el servidor y en el cliente: **para parsear JSON, deja de usar tijeras.** Un `split` es para aprender, no para producir.

**La lección:** antes de acusar a Java de "odiarte", repasa el trío sagrado de la unidad: **¿tengo la cabecera correcta? ¿estoy usando el método HTTP adecuado? ¿estoy parseando JSON con una herramienta de verdad?** El compilador no te odia: te está pasando las respuestas del examen.

---

## 🎮 El juego de las decisiones

Elige la respuesta correcta para cada decisión (respuestas al final):

1. Un formulario de inicio de sesión envía la contraseña. ¿GET o POST?
   - a) GET   b) POST
2. Tu endpoint devuelve una lista de usuarios. ¿Qué `Content-Type` pones?
   - a) `text/html`   b) `application/json`
3. El cliente pide `/api/tareas/99` y esa tarea no existe. ¿Qué código devuelves?
   - a) `200`   b) `404`
4. En `HttpClient`, ¿qué método envía datos en el cuerpo de la petición?
   - a) `.GET()`   b) `.POST(...)`
5. `gson.fromJson(cuerpo, Usuario.class)` con un campo que no está en el JSON... ¿qué recibe ese campo?
   - a) `null`   b) `""` (cadena vacía)

<details>
<summary>🔄 Soluciones</summary>

1. **b)** — La contraseña viaja en el cuerpo del POST, no en la URL.
2. **b)** — `application/json`. Devuelves datos, no una página.
3. **b)** — `404`: el recurso pedido no existe.
4. **b)** — `.POST(...)` lleva el `BodyPublisher`; `.GET()` no manda cuerpo.
5. **a)** — Gson deja los campos ausentes en `null`. Por eso se comprueban con `has(...)` / `isJsonNull()`.

</details>

---

## ⚡ Laboratorio de tortura: el servidor que no era

> **Duración estimada:** 30 minutos
> **Herramienta:** tu IDE y un archivo nuevo

**El escenario:** copia este programa y haz que funcione. Te dicen que tiene **3 errores** que impiden que compile y 1 error de lógica que hace que el JSON salga mal... pero, ¿y si te lo dicen mal? Tu tarea: hacer que compile, que ejecute y que **toda** la salida sea correcta, contando tú los errores reales.

```java
import com.sun.net.httpserver.HttpServer;
import java.net.InetSocketAddress;

public class ApiHora {

    public static void main(String[] args) throws Exception {
        HttpServer server = HttpServer.create(
            new InetSocketAddress(8080), 0
        );
        server.createContext("/api/hora", e -> {
            String json = "{\"hora\": \"" + java.time.LocalTime.now() + "\"}";
            e.getResponseHeaders().set("Content-Type", "application/json");
            e.sendResponseHeaders(200, json.getBytes().length);
            e.getResponseBody().write(json.getBytes())
            e.getResponseBody().close();
        });
        server.setExecutor(null);
        server.start();
        System.out.println("Servidor en http://localhost:8080")
    }
}
```

**Fallo intencionado:** el número de errores del enunciado está mal a propósito: si buscas el "tercer error de compilación" y el "error de lógica", te vuelves loco. La trampa es tu confianza en el enunciado.

**Tu tarea:** conseguir que compile, que ejecute y que **toda** la salida sea correcta. Si el resultado no cuadra, diagnostica.

**Pistas para cuando te frustres (no antes):**

1. ¿Hay algún `;` que falte? *no → sigue buscando.*
   <details><summary>¿Y si sigo atascado?</summary>Repasa la línea `e.getResponseBody().write(json.getBytes())` y la última del `main`: ambas necesitan `;`.</details>
2. ¿Compila ya? *no → mira los tipos y los imports.*
   <details><summary>¿Y si sigo atascado?</summary>El endpoint devuelve JSON y el `Content-Type` ya está. Mira otra vez los `;`.</details>
3. ¿Crees que hay un error de lógica que rompe el JSON? *Vuelve a leer el código con calma y no te fíes del enunciado.*
   <details><summary>Solución final</summary>

Los **errores de compilación**:

1. Falta el `;` al final de `e.getResponseBody().write(json.getBytes())`.
2. Falta el `;` al final de `System.out.println(...)`.

El **error de lógica**: no existe. El JSON `{"hora": "09:30:05"}` se construye bien y el `Content-Type` es correcto. Esa era la fallada intencionada: el enunciado dice "3 errores de compilación y 1 de lógica", pero solo hay 2 faltas de `;` y ninguna lógica rota. El error "oculto" era tu confianza en el enunciado. El servidor funciona en `http://localhost:8080/api/hora`.

```java
import com.sun.net.httpserver.HttpServer;
import java.net.InetSocketAddress;

public class ApiHora {

    public static void main(String[] args) throws Exception {
        HttpServer server = HttpServer.create(
            new InetSocketAddress(8080), 0
        );
        server.createContext("/api/hora", e -> {
            String json = "{\"hora\": \"" + java.time.LocalTime.now() + "\"}";
            e.getResponseHeaders().set("Content-Type", "application/json");
            e.sendResponseHeaders(200, json.getBytes().length);
            e.getResponseBody().write(json.getBytes());
            e.getResponseBody().close();
        });
        server.setExecutor(null);
        server.start();
        System.out.println("Servidor en http://localhost:8080");
    }
}
```

La lección real: **lee el código, no el enunciado**. Un bug puede ser que te digan "hay 3 errores" y solo haya 2: si buscas el tercero, te vuelves loco. Cuenta, verifica y confía en el compilador, no en la leyenda.

</details>

---

## 🏆 Logros de esta unidad

| Logro | Cómo conseguirlo |
|---|---|
| 🏅 **El Cartero** | Explicar la diferencia entre GET y POST con un ejemplo de cada uno |
| 🏅 **El Gran Jefe del Puerto** | Montar un `HttpServer` que no diga "Address already in use" y sirva dos rutas |
| 🏅 **El Sommelier de Content-Type** | Devolver HTML, JSON o texto plano con la cabecera correcta en cada caso |
| 🏅 **El Cliente Elegante** | Consumir una API externa con `HttpClient` y parsear el JSON con Gson |
| 🏅 **El Maestro de la API** | Construir un CRUD REST completo (GET, POST, PUT, DELETE) en memoria |

---

## 🧠 Atrévete a pensar

1. **Sin ejecutar:** ¿qué imprime este programa?

```java
public class Acertijo {
    static String url = "/api/tareas/3";

    public static void main(String[] args) {
        String id = url.substring("/api/tareas/".length());
        System.out.println(id);
        System.out.println(url.split("/").length);
    }
}
```

2. **El servidor que espía:** ¿qué cabecera pones para que el navegador no cachee tus respuestas JSON y siempre reciba datos frescos?
3. **El detective del 403:** consumes una API sin autenticarte y te devuelve `403`. ¿Qué cabecera probablemente te falta? ¿Y qué debes hacer para conseguirla?
4. **Verdadero o falso:** "un `GET` puede enviar datos en el cuerpo de la petición".

<details>
<summary>💡 Soluciones</summary>

1. Imprime `3` y luego `4`. `substring` extrae el ID de la ruta; `url.split("/")` da `["", "api", "tareas", "3"]`, que son 4 trozos (el primero es vacío porque la URL empieza por `/`).
2. `Cache-Control: no-cache` (o `no-store`). Así el navegador no sirve la respuesta de la caché y vuelve a preguntar al servidor.
3. La cabecera **`Authorization`** con un token. Para conseguirlo, normalmente registras una aplicación en la plataforma y obtienes un token de acceso.
4. **Falso en la práctica.** El estándar HTTP no lo prohíbe del todo, pero ningún servidor decente lo respeta y `HttpClient` no te lo pone fácil: para enviar datos usa POST, PUT o PATCH, que es lo que el mundo espera.

</details>

---

## 🧩 Crucigrama de bits

```
Horizontal:
1. Formato de datos universal de la web, con llaves y corchetes (4 letras)
4. Servidor HTTP que Java trae de serie (11 letras)
6. Código de estado para "no encontrado" (3 letras)
7. Cabecera que dice el tipo de contenido (12 letras)

Vertical:
2. Método HTTP para enviar datos y crear recursos (4 letras)
3. Cliente HTTP moderno de Java 11+ (11 letras)
5. Formato de contenido de una página web (4 letras)
```

<details>
<summary>📝 Soluciones</summary>

**Horizontal:** 1. JSON · 4. HTTPSERVER · 6. CERO CUATRO CUATRO (404) · 7. CONTENTTYPE
**Vertical:** 2. POST · 3. HTTPCLIENT · 5. HTML

</details>

---

## 💬 Preguntas de entrevista de trabajo

> Preguntas reales que te harían para programador Java junior.

1. **"Explícame, como si yo fuera tu abuela, qué es una API REST."**
2. **"¿Cuál es la diferencia entre GET y POST? ¿Cuándo usarías cada uno?"**
3. **"¿Qué significa el código 404? ¿Y el 500?"**
4. **"¿Cómo consumes una API externa en Java sin librerías de terceros?"**
5. **"¿Qué es Gson y para qué sirve? ¿Qué pasa si el JSON trae un campo que no está en tu `record`?"**
6. **"¿Qué es un `Content-Type` y por qué es importante?"**

---

## 🤷 No hay preguntas tontas

> ❓ **¿HTTP y HTTPS son lo mismo?**

Casi. HTTPS es HTTP con una capa de cifrado (SSL/TLS): los datos viajan encriptados. Para producción, siempre HTTPS; para desarrollo local, HTTP basta.

---

> ❓ **¿Qué es CORS y por qué me da error?**

*Cross-Origin Resource Sharing*. El navegador bloquea peticiones de un dominio a otro por seguridad. Para desarrollo, añade en tu servidor: `intercambio.getResponseHeaders().add("Access-Control-Allow-Origin", "*")`.

---

> ❓ **¿El `HttpServer` es como Tomcat?**

No. `HttpServer` es mínimo y didáctico: sirve para entender el protocolo. Tomcat es un servidor de aplicaciones completo (Servlets, JSP...). Aquí usamos lo justo para que la web deje de ser magia.

---

## 🎬 Poscréditos

La programadora termina su primera API: un gestor de tareas servido con `HttpServer`, con sus cuatro verbos REST y un frontend que hace `fetch`. Funciona. Hasta que abre el móvil y quiere consumirla desde fuera del ordenador, y descubre que el localhost solo vive en su máquina.

Se acerca CONRAD, el compilador cascarrabias, con su taza humeante.

**CONRAD:** — Eso es lo bonito de lo que acabas de construir: la API ya no depende de dónde se ejecuta. Hoy vive en tu portátil; mañana, en una nube. Los que la consumen solo ven rutas y JSON.

**Programadora:** — Vale... pero ahora mismo todo está en un `ArrayList` que se borra al reiniciar. ¿Cuándo aprendo a guardarlo de verdad?

**CONRAD:** — *asiente* Eso ya lo viste en la U13 con JDBC: cambia el almacén, no las rutas. Tu API no se entera. Pero si me preguntas a mí, ya has recorrido un camino enorme: empezaste con un `Hola, mundo` en una consola y acabas sirviendo y consumiendo web. Eso es todo el curso.

**Programadora:** — ¿Y ahora qué?

**CONRAD:** — *se ajusta las gafas* Ahora elige. Spring Boot, tu proyecto final, tu primera entrevista... El curso se acabó, pero la programación no: solo cambia de terminal.

**🎓 FIN DEL CURSO.** De `System.out.println("Hola, mundo")` a servir y consumir APIs en 14 unidades. Ha sido un placer programar contigo. ¡Sigue escribiendo código! 🌐

---

📚 [Volver al índice de la unidad](/ApuntesProgramacion/14-apis-web) · **Anterior:** [08 · HttpClient avanzado](/ApuntesProgramacion/14-apis-web/08-httpclient-avanzado) · **🎓 Fin del curso**