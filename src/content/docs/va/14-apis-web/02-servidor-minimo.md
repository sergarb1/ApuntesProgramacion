---
title: "02 · Servidor web mínim amb HttpServer"
description: "El teu primer servidor Java: HttpServer, createContext i HttpExchange en menys de 20 línies 🖥️🚀"
---

<p><small>El teu primer servidor Java: HttpServer, createContext i HttpExchange en menys de 20 línies 🖥️🚀</small></p>

> 🗺️ **Estàs en:** 🌐 **U14 · Servir i Consumir APIs amb Web** → 02 · Servidor web mínim amb HttpServer

---

## 📬 La idea en una frase

> **Java porta un servidor HTTP de sèrie en `com.sun.net.httpserver.HttpServer`: sense Tomcat, sense Spring, sense instal·lar res. En menys de 20 línies tens un servidor responent en `http://localhost:8080`.**

Al punt anterior vas vore el protocol. Ara toca posar-lo en marxa: no amb Tomcat ni amb un framework, sinó amb el que Java ja porta dins des de la versió 6. És mínim, és didàctic i, per a aprendre com funciona una petició per dins, és perfecte.

---

## 🖥️ El servidor mínim

Copia això, compila i executa:

```java
import com.sun.net.httpserver.HttpServer;
import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;

public class ServidorMinimo {
    public static void main(String[] args) throws IOException {
        HttpServer server = HttpServer.create(
            new InetSocketAddress(8080), 0
        );
        server.createContext("/", intercambio -> {
            String resp = "Hola, mundo web!";
            intercambio.sendResponseHeaders(200, resp.length());
            OutputStream os = intercambio.getResponseBody();
            os.write(resp.getBytes());
            os.close();
        });
        server.setExecutor(null);
        server.start();
        System.out.println("Servidor en http://localhost:8080");
    }
}
```

Obri `http://localhost:8080` en el teu navegador. **Acabes de crear el teu primer servidor web en Java.** Ara desmuntem les peces:

- **`HttpServer.create(new InetSocketAddress(8080), 0)`** — crea el servidor al port 8080. El `0` és el nombre de connexions en espera (el backlog); amb 0 val.
- **`server.createContext("/", lambda)`** — registra una ruta i li associa un *handler*: una lambda que rep un `HttpExchange`, l'objecte que representa "una petició que està entrant".
- **`intercambio.sendResponseHeaders(200, longitud)`** — envia el codi d'estat i la grandària del cos. Si passes `0` o `-1`, Java usa *chunked* i no necessites la grandària exacta.
- **`getResponseBody().write(...)` i `.close()`** — escriu el cos i tanca el canal. Tancar és obligatori: si no, el navegador es queda esperant.
- **`server.setExecutor(null)`** — usa l'executor per defecte; cada petició s'atén en un fil propi.
- **`server.start()`** — arranca. A partir d'ací el `main` no s'"acaba": el servidor es queda escoltant.

> 💡 **Consell:** el `try-with-resources` de la U12 no val ací: el servidor ha d'estar viu mentre el `main` seguix corrent. Per això `start()` no està dins d'un `try`.

---

## 🕶️ Sé el Código, my friend...

> **Don Tip:** el mètode HTTP el decidix el client. `intercambio.getRequestMethod()` et diu quin ha sigut.

Afig just abans de `server.start()`:

```java
server.createContext("/track", intercambio -> {
    System.out.println("Mètode: " + intercambio.getRequestMethod());
    System.out.println("URI: " + intercambio.getRequestURI());
    System.out.println("Capçaleres: " + intercambio.getRequestHeaders().entrySet());
    intercambio.getResponseHeaders().add("Content-Type", "text/plain");
    intercambio.sendResponseHeaders(200, 0);
    try (var os = intercambio.getResponseBody()) {
        os.write("Tot bé, gràcies per preguntar.".getBytes());
    }
});
```

Obri `http://localhost:8080/track?nombre=Ana&edad=25` i mira la consola del servidor: veuràs el mètode, la URI amb la query string i totes les capçaleres que t'envia el navegador. És el millor "espia" que tindràs en tota la unitat.

<details>
<summary>🔄 Què esperes vore?</summary>

Alguna cosa pareguda a això (simplificat):

```
Mètode: GET
URI: /track?nombre=Ana&edad=25
Capçaleres: [Host=[localhost:8080], User-Agent=[Mozilla/5.0 ...], Accept=[text/html,...]]
```

És la petició HTTP del punt 1, destripada i en viu.

</details>

---

## 🚨 "Address already in use"

L'error més típic en arrancar el servidor. Significa que el port 8080 ja l'està usant un altre procés (una instància anterior de la teua, o una altra aplicació). Dues solucions:

- Canvia el port en `new InetSocketAddress(8081, 0)`.
- O troba i mata el culpable. A Windows: `netstat -ano | findstr 8080` i després `taskkill /PID <numero> /F`.

> ⚠️ **Advertència:** els ports per davall de 1024 (com el 80) requerixen permisos d'administrador. Queda't amb el 8080 per a desenvolupament.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quina classe de Java et dona un servidor HTTP sense dependències externes?
2. Quin mètode de `HttpServer` associes a una ruta amb el seu handler?
3. Quin objecte rep la teua lambda i què representa?
4. Què passa si oblides tancar el `getResponseBody()`?

<details>
<summary>🔄 Respostes</summary>

1. `com.sun.net.httpserver.HttpServer` (paquet `jdk.httpserver`, inclòs en el JDK).
2. `server.createContext("/ruta", handler)`.
3. Un `HttpExchange`, que representa una petició entrant i et dona accés a la petició i a la resposta.
4. El navegador es queda esperant la resposta per sempre: el cos no es considera enviat fins que tanques el canal.

</details>

---

## ✅ Resum en 3 frases

1. **`HttpServer`** és el servidor HTTP que Java porta de sèrie: el crees en un port, registres rutes amb `createContext` i l'arranques amb `start()`.
2. El **handler** rep un `HttpExchange` amb el qual lliges la petició, envies el codi d'estat amb `sendResponseHeaders` i escrius el cos amb `getResponseBody()`.
3. **Tanca sempre el cos** de la resposta i recorda que el servidor no es deté fins que tu ho vulgues: és la teua primera aplicació "que no s'acaba".

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `HttpServer` | El servidor HTTP del JDK |
> | `createContext` | Associa una ruta amb el seu handler |
> | `HttpExchange` | Objecte que representa una petició entrant |
> | Handler | La lambda que processa cada petició d'una ruta |
> | `sendResponseHeaders` | Envia el codi d'estat (i la grandària del cos) |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/14-apis-web) · **Anterior:** [01 · El protocol HTTP en 30 segons](/ApuntesProgramacion/va/14-apis-web/01-protocolo-http) · **Següent:** [03 · Servint HTML](/ApuntesProgramacion/va/14-apis-web/03-sirviendo-html)