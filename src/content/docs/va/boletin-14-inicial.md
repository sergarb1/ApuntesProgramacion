---
title: "Butlletí 14 - Inicial: Servir i Consumir APIs amb Web"
nav_order: 14
---
Escalfa motors amb HttpServer. Promet que cap bit eixirà ferit.

---

## Exercici 1: Servidor de l'hora

Crea un servidor HTTP al port 8080 amb una ruta `/hora` que torne l'hora actual en text pla amb format `HH:mm:ss`.

Cada vegada que recarregues el navegador, l'hora canvia. Màgia negra amb `LocalTime.now()`.

```java
// Pista:
String hora = java.time.LocalTime.now().format(
    java.time.format.DateTimeFormatter.ofPattern("HH:mm:ss")
);
```

---

## Exercici 2: Pàgina que diu el teu nom

Afig una ruta `/saludo?nombre=Pepe` que torne una pàgina HTML amb `<h1>¡Hola, Pepe!</h1>`.

Si no es passa nom, que diga `¡Hola, desconocido!`.

> Pista: `e.getRequestURI().getQuery()` et dona `nombre=Pepe`. Divideix per `=` i llest.

---

## Exercici 3: Comptador de visites global

Usa una variable `static int visites = 0`. Cada vegada que algú visita `/`, incrementa el comptador i mostra:

```
Eres el visitante número 47
```

Què passa si dos persones recarreguen alhora? (spoiler: problemes — però de moment no et preocupes).

---

## Exercici 4: Generador d'excuses per a lliuraments tardans

Crea rutes `/excusa` que torne una excusa generada aleatòriament combinant elements de tres arrays:

```java
String[] subjectes = {"El meu gos", "GitHub", "El plugin d'IntelliJ", "La connexió"};
String[] verbs     = {"es va menjar", "va esborrar", "va corrompre", "va perdre"};
String[] objectes  = {"l'examen", "la pràctica", "els apunts", "la meua paciència"};
```

Exemple: *"GitHub va esborrar la pràctica"*. Torna-ho en HTML amb bona lletra.

---

## Exercici 5: Taula de multiplicar personalitzada

Ruta `/tabla?num=7` que genere una taula HTML completa amb la taula de multiplicar del 7 (del 7×1 al 7×10).

Si no es passa número, usa el 5 per defecte. Formata la taula amb `border=1` i colors alterns en les files.

---

## Exercici 6: Pàgina d'estat del servidor

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

## Exercici 7: Convertidor d'euros a pessetes (sí, pessetes)

Ruta `/conversor?euros=50` que torne HTML amb el resultat: "50 euros son 8319.3 pesetas".

1 € = 166.386 pts. Mostra dos decimals.

> Pista: `String.format("%.2f", valor)` per als decimals. Sí, pessetes. Si eres jove, pregunta-li a un vell què era això.

---

## 📚 Referències

- **CodeWars:** [Decode the Morse code](https://www.codewars.com/kata/54b724efac3d5402db00065e) (6 kyu)
- **AceptaElReto:** [396 - ¿Cuántos días faltan?](https://www.aceptaelreto.com/problem/statement.php?id=396) (⭐⭐)
- **Documentació Oracle:** [HttpServer](https://docs.oracle.com/en/java/javase/21/docs/api/jdk.httpserver/com/sun/net/httpserver/HttpServer.html)
