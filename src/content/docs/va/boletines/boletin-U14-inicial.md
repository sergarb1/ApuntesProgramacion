---
title: "Butlletí U14 — Inicial"
description: "Exercicis bàsics d'APIs web: HttpServer, servir HTML, paràmetres GET i primers JSON"
---

# 📝 Butlletí U14 — Inicial

> Sense solucions. Sense presses. Obri l'IDE, crea el teu primer `HttpServer` i fes que el navegador et parle de tu a tu. Promet que cap bit eixirà ferit. Comença suaument, que la web mossega a poc a poc.

---

## Exercici 1: Escriu este programa — Hola, món web

Crea un servidor HTTP al port 8080 amb una ruta `/` que torne el text `Hola, mundo web!`. Obri `http://localhost:8080` en el teu navegador i comprova que ho veus.

Pista: `HttpServer.create(new InetSocketAddress(8080), 0)`, després `createContext("/", ...)` i `sendResponseHeaders(200, ...)`. No oblides tancar el cos de la resposta.

---

## Exercici 2: Escriu este programa — servidor de l'hora

Afig al teu servidor una ruta `/hora` que torne l'hora actual en text pla amb format `HH:mm:ss`.

Cada vegada que recarregues el navegador, l'hora canvia. Màgia negra amb `LocalTime.now()`.

```java
// Pista:
String hora = java.time.LocalTime.now().format(
    java.time.format.DateTimeFormatter.ofPattern("HH:mm:ss")
);
```

---

## Exercici 3: Escriu este programa — pàgina que diu el teu nom

Afig una ruta `/saludo?nombre=Pepe` que torne una pàgina HTML amb `<h1>¡Hola, Pepe!</h1>`.

Si no es passa nom, que diga `¡Hola, desconocido!`.

Pista: `e.getRequestURI().getQuery()` et dona `nombre=Pepe`. Dividix per `=` i llest.

---

## Exercici 4: Escriu este programa — comptador de visites global

Usa una variable `static int visites = 0`. Cada vegada que algú visita `/`, incrementa el comptador i mostra:

```
Eres el visitante número 47
```

Què passa si dos persones recarreguen alhora? (spoiler: problemes — però de moment no et preocupes).

---

## Exercici 5: Escriu este programa — generador d'excuses per a lliuraments tardans

Crea una ruta `/excusa` que torne una excusa generada aleatòriament combinant elements de tres arrays:

```java
String[] subjectes = {"El meu gos", "GitHub", "El plugin d'IntelliJ", "La connexió"};
String[] verbs     = {"es va menjar", "va esborrar", "va corrompre", "va perdre"};
String[] objectes  = {"l'examen", "la pràctica", "els apunts", "la meua paciència"};
```

Exemple: *"GitHub va esborrar la pràctica"*. Torna-ho en HTML amb bona lletra.

---

## Exercici 6: Escriu este programa — taula de multiplicar personalitzada

Ruta `/tabla?num=7` que genere una taula HTML completa amb la taula de multiplicar del 7 (del 7×1 al 7×10).

Si no es passa número, usa el 5 per defecte. Formata la taula amb `border=1` i colors alterns en les files.

---

## Exercici 7: Escriu este programa — convertidor d'euros a pessetes (sí, pessetes)

Ruta `/conversor?euros=50` que torne HTML amb el resultat: "50 euros son 8319.3 pesetas".

1 € = 166.386 pts. Mostra dos decimals.

Pista: `String.format("%.2f", valor)` per als decimals. Sí, pessetes. Si eres jove, pregunta-li a un vell què era això.

---

## Exercici 8: Escriu este programa — pàgina d'estat del servidor

Ruta `/estado` que torne un JSON amb esta pinta:

```json
{
    "servidor": "ok",
    "hora": "14:30:01",
    "visites": 47,
    "versio": "1.0",
    "autor": "El teu nom ací"
}
```

No oblides el `Content-Type: application/json` o el navegador es tornarà tonto.

---

## Exercici 9: Troba l'error — el Content-Type oblidat

Un company t'ensenya este handler i jura que torna JSON:

```java
server.createContext("/api/frase", intercambio -> {
    String json = """
        {"frase": "El código limpio es como un buen chiste"}
        """;
    intercambio.sendResponseHeaders(200, json.getBytes().length);
    intercambio.getResponseBody().write(json.getBytes());
    intercambio.getResponseBody().close();
});
```

El navegador mostra el text, però el `fetch` que el consumix es queixa: `r.json()` peta. Què falta i per què és tan important?