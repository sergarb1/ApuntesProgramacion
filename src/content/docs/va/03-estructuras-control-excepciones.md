---
title: "U03 — Estructures de Control i Excepcions"
description: El semàfor, la cinta de córrer i l'assegurança de vida que fan decidir i repetir als teus programes 🔀
emoji: 🔀
---

<p><small>El semàfor, la cinta de córrer i l'assegurança de vida que fan decidir i repetir als teus programes 🔀</small></p>

> 🗺️ **El mapa del paquet:** 🚪 Benvinguda → ☕ U01 → 🔤 Variables → **🔀 ACI ETS (U03)** → 🧩 Algorítmica → ⚡ Tècniques → 🏗️ POO → 🔒 Visibilitat → 🧬 Herència → 📚 Col·leccions → 🗺️ Genèrics → 📁 Fitxers → 🗄️ JDBC → 🌐 APIs

---

Benvingut al semàfor del codi. En la U01 el teu programa va aprendre a parlar i en la U02 a guardar dades. Però parlar i guardar sense decidir és un lloro amb arxivador: repetix, però no pensa. Esta és la unitat on els teus programes comencen a **pensar**.

Fins ara, el teu codi corria en línia recta, de dalt a baix, com un soldadet obedient. En esta unitat li donaràs tres superpoders:

1. **Decidir**: "si aprova, puja la nota; si no, a recuperació". Això és `if`, `else` i `switch`.
2. **Repetir**: "imprimix les taules de multiplicar, tots els nombres de l'1 al 10". Això és `while`, `do-while` i `for`.
3. **Sobrevindre**: "i si l'usuari escriu lletres on s'esperaven nombres?". Això és `try`, `catch`, `throw` i les excepcions.

I, de regal, aprendràs a escapar-te d'un bucle amb `break`, a saltar-te una volta amb `continue` i a inventar-te les teues pròpies excepcions. Sí, com en la vida real: et queixes d'alguna cosa, i de pas construïxes el teu propi defecte.

Esta unitat es llig com un **llibre de 9 capítols**: els 8 primers punts són teoria en progressió i el 9 és un aterratge pràctic per a deixar-ho tot ben lligat.

---

## 🎯 Objectiu de la unitat

En acabar, seràs capaç de:

- Prendre decisions amb **`if`, `else if` i `else`**, anidar-los sense perdre el nord i resumir decisions simples amb el **ternari**.
- Triar entre moltes opcions amb **`switch`**, sense oblidar el `break` ni el `default`.
- Repetir codi amb **`while`** i **`do-while`**, sabent quan s'executa almenys una volta.
- Contar voltes amb **`for`**, controlar comptadors i crear **bucles anidats**.
- Escapar-te d'un bucle amb **`break`**, saltar-te una volta amb **`continue`** i usar **etiquetes** quan calga.
- Entendre la jerarquia de **`Throwable`, `Exception` i `RuntimeException`** i conéixer les excepcions més comunes de Java.
- Protegir el teu codi amb **`try` / `catch` / `finally`** i capturar diversos errors alhora.
- Llançar excepcions amb **`throw`** i crear les teues pròpies excepcions amb herència.
- Escriure programes que **decidisquen, repetisquen i sobrevisquen**, i depurar-los quan alguna cosa explota.

---

## 🗺️ Mapa de la unitat

| Punt | Què aprendràs | Dificultat |
|---|---|---|
| [01 · if, else if i else](/ApuntesProgramacion/va/03-estructuras-control-excepciones/01-if-else) | Decisions amb `if`/`else`, anidats i ternari | Tots |
| [02 · switch](/ApuntesProgramacion/va/03-estructuras-control-excepciones/02-switch) | `switch`, `case`, `break` i `default` | Tots |
| [03 · Bucles: while i do-while](/ApuntesProgramacion/va/03-estructuras-control-excepciones/03-bucles-while-do-while) | Repetir amb `while` i `do-while`, bucles infinits | Tots |
| [04 · Bucle for i bucles anidats](/ApuntesProgramacion/va/03-estructuras-control-excepciones/04-bucle-for) | `for` amb comptador i bucles dins de bucles | Tots |
| [05 · break, continue i etiquetes](/ApuntesProgramacion/va/03-estructuras-control-excepciones/05-break-continue) | Eixides del bucle i salt entre etiquetes | Tots |
| [06 · Excepcions bàsiques](/ApuntesProgramacion/va/03-estructuras-control-excepciones/06-excepciones-basicas) | `Throwable`, `Exception`, `RuntimeException` i les excepcions típiques | Tots |
| [07 · try, catch i finally](/ApuntesProgramacion/va/03-estructuras-control-excepciones/07-try-catch-finally) | Protegir codi, capturar errors i captura múltiple | Tots |
| [08 · throw i excepcions pròpies](/ApuntesProgramacion/va/03-estructuras-control-excepciones/08-throw-excepciones-propias) | Llançar excepcions i crear les teues | Tots |
| [09 · Repàs interactiu](/ApuntesProgramacion/va/03-estructuras-control-excepciones/09-repaso-interactivo) | Sé el Código, Fireside, Qui Soc, Laboratori, Crucigrama… | Tots |

> 📖 **Flux de lectura:** els 8 primers punts són teoria en progressió. El 9 és l'aterratge pràctic: llig-lo just després del 8 i abans d'obrir els butlletins.

---

## 📝 Butlletins de la unitat

> Practica amb els parells del curs: comença sempre pel resolt per a vore l'estil i després intenta el per-resoldre.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/va/boletines/boletin-u03-inicial-resuelto" class="elink">✅ Inicial resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u03-inicial" class="elink">🟢 Inicial per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u03-avanzado-resuelto" class="elink">💪 Avançat resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u03-avanzado" class="elink">⭐ Avançat per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u03-extras" class="elink">🔥 Extres</a>
</div>

---

## ✅ Criteris d'avaluació coberts (RA3)

**RA3: Escriu i depura codi, analitzant i utilitzant les estructures de control del llenguatge.**

| CE | Criteri | On es cobreix |
|---|---|---|
| RA3 a) | S'ha escrit i provat codi que faça ús d'estructures de selecció. | ✅ Punts 1 i 2 |
| RA3 b) | S'han utilitzat estructures de repetició. | ✅ Punts 3 i 4 |
| RA3 c) | S'han reconegut les possibilitats de les sentències de salt. | ✅ Punt 5 |
| RA3 d) | S'ha escrit codi utilitzant control d'excepcions. | ✅ Punts 6, 7 i 8 |
| RA3 e) | S'han creat programes executables utilitzant diferents estructures de control. | ✅ Tots |
| RA3 f) | S'han provat i depurat els programes. | ✅ Tots, amb molta cosa extra en els butlletins |
| RA3 g) | S'ha comentat i documentat el codi. | ✅ Tots |

> 📌 Els bucles que veus ací són el múscul de tot el que ve: els recorreguts d'arrays i col·leccions (U09) i els algoritmes d'ordenació i cerca (U05) no serien res sense `for` i `while`.

---

## 🚪 Per on comence?

- Cero coneixements? → Comença en el [punt 1](/ApuntesProgramacion/va/03-estructuras-control-excepciones/01-if-else). Només necessites les variables i el `Scanner` de la U02.
- Ja saps decidir i només vols repetir? → Ves directe al [punt 3](/ApuntesProgramacion/va/03-estructuras-control-excepciones/03-bucles-while-do-while) i al [punt 4](/ApuntesProgramacion/va/03-estructuras-control-excepciones/04-bucle-for).
- El teu programa es trenca i no saps per què? → Els [punts 6](/ApuntesProgramacion/va/03-estructuras-control-excepciones/06-excepciones-basicas), [7](/ApuntesProgramacion/va/03-estructuras-control-excepciones/07-try-catch-finally) i [8](/ApuntesProgramacion/va/03-estructuras-control-excepciones/08-throw-excepciones-propias) t'ensenyen a llegir els crits de Java.
- Vens a repassar? → Fes el [Repàs interactiu](/ApuntesProgramacion/va/03-estructuras-control-excepciones/09-repaso-interactivo) i després els [butlletins](/ApuntesProgramacion/va/boletines/boletin-u03-inicial).

**📍 Primer punt:** [01 · if, else if i else](/ApuntesProgramacion/va/03-estructuras-control-excepciones/01-if-else)  
**⏭️ En acabar la unitat, continua en [U04 · Algorítmica I: Fonaments](/ApuntesProgramacion/va/04-algoritmica-fundamentos).**
