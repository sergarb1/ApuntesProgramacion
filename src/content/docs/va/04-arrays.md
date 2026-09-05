---
title: "U04 — Arrays"
description: "L'aparcament de dades: crea, recorre, ordena i busca amb els arrays de Java 🅿️"
emoji: 🅿️
---

<p><small>L'aparcament de dades: crea, recorre, ordena i busca amb els arrays de Java 🅿️</small></p>

> 🗺️ **El mapa del paquet:** 🚪 Benvinguda → ☕ U01 → 🔤 U02 → 🔀 U03 → **🅿️ ACÍ ETS (U04)** → 🧩 U05 → ⚡ U06 → 🏗️ U07 → 🔒 U08 → 🧬 U09 → 📚 U10 → 🗺️ U11 → 📁 U12 → 🗄️ U13 → 🌐 U14

---

Benvingut a l'aparcament. En les unitats anteriors vas aprendre a **decidir** (U03) i a **repetir**, però sempre guardant una cosa per variable. Fins hui. En esta unitat descobrixes els **arrays**: la forma de guardar centenars (o milions) de dades del mateix tipus sota un sol nom i de moure-les amb un bucle.

Pensa en tot el que és, en el fons, una llista de coses: les notes dels teus 30 alumnes, la temperatura de cada dia de l'any, les fitxes d'un tauler, els noms d'una classe. Doncs tot això, portat a Java, és esta unitat: **crear** l'array, **recórrer-lo**, **ordenar-lo**, **buscar-lo**, gestionar-lo amb la classe `Arrays` i passar-lo a **mètodes** sense que se t'escape res pel camí.

I, com sempre, CONRAD el compilador serà per ací per a recordar-te que un índex fora de rang és l'error més car (i més típic) del curs: `ArrayIndexOutOfBoundsException` no perdona.

Esta unitat es llig com un **llibre de 9 capítols**: els 8 primers punts són teoria en progressió i el 9 és un aterratge pràctic per a deixar-ho tot ben lligat.

---

## 🎯 Objectiu de la unitat

En acabar, seràs capaç de:

- **Crear** arrays de qualsevol tipus, inicialitzar-los i entendre els seus valors per defecte (`0`, `false`, `null`...).
- **Recórrer** un array amb `for` i amb `for-each`, sabent quan usar cada un.
- Treballar amb **arrays multidimensionals** (files i columnes, taulers, matrius) i amb arrays irregulars.
- Aprofitar la classe **`Arrays`**: `toString`, `sort`, `binarySearch`, `copyOf`, `fill` i `equals`.
- **Passar arrays a mètodes** i entendre el pas per referència de la còpia.
- Aplicar els arrays a casos reals: llistes de noms, notes, objectes propis i dades en taula.
- **Depurar** els errors típics dels arrays: índexs fora de rang, `null`, imprimir sense `toString`...

---

## 🗺️ Mapa de la unitat

| Punt | Què aprendràs | Dificultat |
|---|---|---|
| [01 · Arrays: l'aparcament de dades](/ApuntesProgramacion/va/04-arrays/01-arrays-basicos) | Crear arrays, índexs, `length` i el primer BOOM | Tots |
| [02 · Recórrer arrays: for i for-each](/ApuntesProgramacion/va/04-arrays/02-recorrer-arrays) | El duo inseparable i la variant peresosa de només lectura | Tots |
| [03 · Arrays multidimensionals](/ApuntesProgramacion/va/04-arrays/03-arrays-multidimensionales) | Arrays de arrays, files, columnes i bucles niats | Tots |
| [04 · La classe Arrays: la teua navalla suïssa](/ApuntesProgramacion/va/04-arrays/04-clase-arrays) | `toString`, `sort`, `binarySearch`, `copyOf`, `fill`, `equals` | Tots |
| [05 · Arrays i mètodes](/ApuntesProgramacion/va/04-arrays/05-arrays-metodos) | Passar arrays per referència i tornar-los | Tots |
| [06 · Aplicacions dels arrays](/ApuntesProgramacion/va/04-arrays/06-aplicaciones-arrays) | Arrays de String, de char, d'objectes i dades en taula | Tots |
| [07 · Be the Code: l'aparcament es gestiona](/ApuntesProgramacion/va/04-arrays/07-be-the-code) | Programar invers, cerques i compactar a mà | Tots |
| [08 · Array-revelde: errors comuns i depuració](/ApuntesProgramacion/va/04-arrays/08-array-revelde) | La galeria de monstres dels arrays i com caçar-los | Tots |
| [09 · Repàs interactiu](/ApuntesProgramacion/va/04-arrays/09-repaso-interactivo) | Sé el Código, Fireside, Qui Soc, Laboratori, Crucigrama… | Tots |

> 📖 **Flux de lectura:** els 8 primers punts són teoria en progressió. El 9 és l'aterratge pràctic: llig-lo just després del 8 i abans d'obrir els butlletins.

---

## 📝 Butlletins de la unitat

> Practica amb els parells del curs: comença sempre pel resolt per a vore l'estil i després intenta el per-resoldre.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/va/boletines/boletin-u04-inicial-resuelto" class="elink">✅ Inicial resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u04-inicial" class="elink">🟢 Inicial per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u04-avanzado-resuelto" class="elink">💪 Avançat resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u04-avanzado" class="elink">⭐ Avançat per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u04-extras" class="elink">🔥 Extres</a>
</div>

---

## ✅ Criteris d'avaluació coberts (RA6)

**RA6: Escriu programes que manipulen informació, seleccionant i utilitzant tipus avançats de dades.**

| CE | Criteri | On es cobreix |
|---|---|---|
| RA6 a) | S'han escrit programes que utilitzen arrays. | ✅ Tots |
| RA6 b) | S'han reconegut les llibreries de classes relacionades amb tipus avançats de dades. | ✅ Punt 4 |

> 📌 Els arrays són la base de tot el que ve: els algoritmes de la U05 busquen i ordenen arrays, i quan un aparcament de grandària fixa se't queda menut, les col·leccions de la U10 (ArrayList, LinkedList...) prenen el relleu. Aprendre arrays a fons hui és la inversió que rendeix durant tot el curs.

---

## 🚪 Per on comence?

- Cero coneixements? → Comença en el [punt 1](/ApuntesProgramacion/va/04-arrays/01-arrays-basicos). Només necessites variables, bucles i `if` de la U03.
- Ja saps crear arrays i vols molta cosa? → Salta al [recorregut](/ApuntesProgramacion/va/04-arrays/02-recorrer-arrays) o a la [classe Arrays](/ApuntesProgramacion/va/04-arrays/04-clase-arrays).
- Només vols vore arrays en acció real? → Llig [Aplicacions dels arrays](/ApuntesProgramacion/va/04-arrays/06-aplicaciones-arrays).
- Vens a repassar? → Fes el [Repàs interactiu](/ApuntesProgramacion/va/04-arrays/09-repaso-interactivo) i després els [butlletins](/ApuntesProgramacion/va/boletines/boletin-u04-inicial).

**📍 Primer punt:** [01 · Arrays: l'aparcament de dades](/ApuntesProgramacion/va/04-arrays/01-arrays-basicos)  
**⏭️ En acabar la unitat, continua en [U05 · Algorítmica I: Fonaments](/ApuntesProgramacion/va/05-algoritmica-fundamentos).**