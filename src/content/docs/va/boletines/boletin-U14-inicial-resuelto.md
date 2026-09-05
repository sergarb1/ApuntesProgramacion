---
title: "Butlletí U14 — Inicial Resolt"
description: "Els mateixos exercicis que el butlletí inicial, amb solucions"
---

# 📝 Butlletí U14 — Inicial (Resolt)

> Les solucions estan amagades en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## Exercici 1: Escriu este programa — Hola, món web

<details>
<summary>🔄 Solució</summary>

```java
import com.sun.net.httpserver.HttpServer;
import java.io.OutputStream;
import java.net.InetSocketAddress;

public class HolaMundoWeb {
    public static void main(String[] args) throws Exception {
        HttpServer server = HttpServer.create(new InetSocketAddress(8080), 0);
        server.createContext("/", e -> {
            String resp = "Hola, mundo web!";
            e.sendResponseHeaders(200, resp.getBytes().length);
            OutputStream os = e.getResponseBody();
            os.write(resp.getBytes());
            os.close();
        });
        server.setExecutor(null);
        server.start();
        System.out.println("Servidor en http://localhost:8080");
    }
}
```

`createContext` registra la ruta `/` amb el seu handler; `sendResponseHeaders(200, grandària)` envia el codi i la grandària del cos (en bytes); `getResponseBody()` escriu el text i es tanca. El servidor es queda escoltant fins que el detinguis.

</details>

---

## Exercici 2: Escriu este programa — servidor de l'hora

<details>
<summary>🔄 Solució</summary>

```java
server.createContext("/hora", e -> {
    String hora = java.time.LocalTime.now().format(
        java.time.format.DateTimeFormatter.ofPattern("HH:mm:ss")
    );
    String resp = "Hora actual: " + hora;
    e.getResponseHeaders().set("Content-Type", "text/plain; charset=UTF-8");
    e.sendResponseHeaders(200, resp.getBytes().length);
    e.getResponseBody().write(resp.getBytes());
    e.getResponseBody().close();
});
```

`LocalTime.now()` s'avalua en cada petició, per això l'hora canvia en recarregar. Un servidor sense estat: no recorda res entre peticions.

</details>

---

## Exercici 3: Escriu este programa — pàgina que diu el teu nom

<details>
<summary>🔄 Solució</summary>

```java
server.createContext("/saludo", e -> {
    String query = e.getRequestURI().getQuery();
    String nombre = "desconocido";
    if (query != null && query.startsWith("nombre=")) {
        nombre = java.net.URLDecoder.decode(query.split("=")[1], "UTF-8");
    }
    String html = "<h1>¡Hola, " + nombre + "!</h1>";
    e.getResponseHeaders().set("Content-Type", "text/html; charset=UTF-8");
    e.sendResponseHeaders(200, html.getBytes().length);
    e.getResponseBody().write(html.getBytes());
    e.getResponseBody().close();
});
```

La query string arriba com `nombre=Pepe` i es dividix per `=`. L'`URLDecoder` convertix coses com `%20` en espais (si el nom fora "Ana M."). Si no hi ha query, el valor per defecte és `desconocido`.

</details>

---

## Exercici 4: Escriu este programa — comptador de visites global

<details>
<summary>🔄 Solució</summary>

```java
import com.sun.net.httpserver.HttpServer;
import java.net.InetSocketAddress;

public class ContadorVisitas {
    static int visitas = 0;

    public static void main(String[] args) throws Exception {
        HttpServer server = HttpServer.create(new InetSocketAddress(8080), 0);
        server.createContext("/", e -> {
            visitas++;
            String resp = "Eres el visitante número " + visitas;
            e.sendResponseHeaders(200, resp.getBytes().length);
            e.getResponseBody().write(resp.getBytes());
            e.getResponseBody().close();
        });
        server.setExecutor(null);
        server.start();
        System.out.println("Servidor en http://localhost:8080");
    }
}
```

`static int visitas` viu en la classe, no en cap petició, així que sobreviu entre visites. Si dos persones recarreguen alhora, totes dues podrien llegir el mateix valor abans d'incrementar (problema de concurrència). Per a aprendre, val; per a producció, `AtomicInteger`.

</details>

---

## Exercici 5: Escriu este programa — generador d'excuses per a lliuraments tardans

<details>
<summary>🔄 Solució</summary>

```java
server.createContext("/excusa", e -> {
    String[] subjectes = {"El meu gos", "GitHub", "El plugin d'IntelliJ", "La connexió"};
    String[] verbs     = {"es va menjar", "va esborrar", "va corrompre", "va perdre"};
    String[] objectes  = {"l'examen", "la pràctica", "els apunts", "la meua paciència"};

    java.util.Random r = new java.util.Random();
    String excusa = subjectes[r.nextInt(subjectes.length)] + " "
        + verbs[r.nextInt(verbs.length)] + " "
        + objectes[r.nextInt(objectes.length)];

    String html = "<h1>La teua excusa per a hui</h1><p><em>" + excusa + "</em></p>";
    e.getResponseHeaders().set("Content-Type", "text/html; charset=UTF-8");
    e.sendResponseHeaders(200, html.getBytes().length);
    e.getResponseBody().write(html.getBytes());
    e.getResponseBody().close();
});
```

`Random.nextInt(longitud)` tria un índex aleatori de cada array sense passar-se. Tres decisions aleatòries = una excusa nova en cada recàrrega. Recorda: `nextInt(n)` va de 0 a `n-1`.

</details>

---

## Exercici 6: Escriu este programa — taula de multiplicar personalitzada

<details>
<summary>🔄 Solució</summary>

```java
server.createContext("/tabla", e -> {
    String query = e.getRequestURI().getQuery();
    int num = 5;
    if (query != null && query.startsWith("num=")) {
        num = Integer.parseInt(query.split("=")[1]);
    }

    StringBuilder sb = new StringBuilder("<table border=1>");
    sb.append("<tr><th>").append(num).append(" × n</th><th>Resultado</th></tr>");
    for (int i = 1; i <= 10; i++) {
        String color = (i % 2 == 0) ? "#e0f7e0" : "#ffffff";
        sb.append("<tr style=\"background:").append(color).append("\">")
          .append("<td>").append(num).append(" × ").append(i).append("</td>")
          .append("<td>").append(num * i).append("</td></tr>");
    }
    sb.append("</table>");

    String html = "<html><body>" + sb + "</body></html>";
    e.getResponseHeaders().set("Content-Type", "text/html; charset=UTF-8");
    e.sendResponseHeaders(200, html.getBytes().length);
    e.getResponseBody().write(html.getBytes());
    e.getResponseBody().close();
});
```

El `StringBuilder` munta l'HTML de la taula fila a fila (és més eficient que concatenar amb `+` en un bucle). Les files parells porten un fons verd clar per a alternar colors. Si no hi ha `num=`, s'usa el 5.

</details>

---

## Exercici 7: Escriu este programa — convertidor d'euros a pessetes

<details>
<summary>🔄 Solució</summary>

```java
server.createContext("/conversor", e -> {
    String query = e.getRequestURI().getQuery();
    double euros = 50;
    if (query != null && query.startsWith("euros=")) {
        euros = Double.parseDouble(query.split("=")[1]);
    }
    double pesetas = euros * 166.386;
    String html = "<h1>" + String.format("%.2f", euros) + " euros son "
        + String.format("%.2f", pesetas) + " pesetas</h1>";
    e.getResponseHeaders().set("Content-Type", "text/html; charset=UTF-8");
    e.sendResponseHeaders(200, html.getBytes().length);
    e.getResponseBody().write(html.getBytes());
    e.getResponseBody().close();
});
```

`String.format("%.2f", valor)` arredonix a dos decimals. Es multiplica per 166.386 (el canvi oficial). Un exercici clàssic de GET: l'entrada viatja en la URL i l'eixida és HTML.

</details>

---

## Exercici 8: Escriu este programa — pàgina d'estat del servidor

<details>
<summary>🔄 Solució</summary>

```java
server.createContext("/estado", e -> {
    String json = "{\"servidor\":\"ok\","
        + "\"hora\":\"" + java.time.LocalTime.now().format(
            java.time.format.DateTimeFormatter.ofPattern("HH:mm:ss")) + "\","
        + "\"visites\":" + visitas + ","
        + "\"versio\":\"1.0\","
        + "\"autor\":\"El teu nom ací\"}";
    e.getResponseHeaders().set("Content-Type", "application/json");
    e.sendResponseHeaders(200, json.getBytes().length);
    e.getResponseBody().write(json.getBytes());
    e.getResponseBody().close();
});
```

La capçalera `Content-Type: application/json` és el que convertix això en una API: sense ella, el navegador i `fetch` tractarien el text com a HTML o text pla. Fixa't en com s'escapen les cometes del JSON dins del codi Java.

</details>

---

## Exercici 9: Troba l'error — el Content-Type oblidat

<details>
<summary>🔄 Solució</summary>

Falta **`Content-Type: application/json`**. Sense eixa capçalera, `fetch` no sap que la resposta és JSON i `r.json()` falla (o torna brossa). El text arriba, però el navegador l'interpreta com a text pla.

La solució és afegir una línia abans d'enviar les capçaleres:

```java
intercambio.getResponseHeaders().set("Content-Type", "application/json");
```

Esta és la lliçó que es repetix en tota la unitat: **la capçalera correcta és la diferència entre "funciona" i "funciona en la meua màquina però el frontend es queixa"**.

</details>