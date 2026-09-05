---
title: "U05 — Algorítmica I: Fonaments"
description: "Receptes, diccionaris, cartes i bombolles: els algoritmes que ordenen i busquen per tu 🧩"
emoji: 🧩
---

<p><small>Receptes, diccionaris, cartes i bombolles: els algoritmes que ordenen i busquen per tu 🧩</small></p>

> 🗺️ **El mapa del paquet:** 🚪 Benvinguda → ☕ U01 → 🔤 U02 → 🔀 U03 → 🅿️ U04 → **🧩 ACÍ ETS (U05)** → ⚡ U06 → 🏗️ U07 → 🔒 U08 → 🧬 U09 → 📚 U10 → 🗺️ U11 → 📁 U12 → 🗄️ U13 → 🌐 U14

---

Benvingut a la cuina del programador. En la U03 els teus programes van aprendre a **decidir** i a **repetir**, però repetir per repetir és fer footing sense rumb: corres, però no arribes enlloc. Esta és la unitat on el rumb apareix: aprendràs els **algoritmes clàssics** que ordenen i busquen dades, i la ferramenta per a saber si un és ràpid o lent de solemnitat: la **notació Big O**.

Pensa en el que fas cada dia sense adonar-te'n. Busques la paraula "berenar" en el diccionari (i no obres per la pàgina 1, sinó per la meitat). Ordenes les cartes de la mà per al pòquer. Busques les teues sabatilles perdudes revisant l'habitació. Doncs tot això, portat a Java, és esta unitat: **cerca lineal**, **cerca binària**, **ordenació bombolla**, **ordenació per inserció** i l'art de triar quin usar.

I, com sempre, CONRAD el compilador serà per ací per a recordar-te que un algoritme mal pensat és com una truita sense sal: es pot menjar, però no hauries.

Esta unitat es llig com un **llibre de 9 capítols**: els 8 primers punts són teoria en progressió i el 9 és un aterratge pràctic per a deixar-ho tot ben lligat.

---

## 🎯 Objectiu de la unitat

En acabar, seràs capaç de:

- Explicar **què és un algoritme**, les seues propietats i la diferència entre la *idea* i el *codi*.
- Buscar elements en un array amb **cerca lineal** (O(n)) i saber quan convé.
- Buscar en arrays **ordenats** amb **cerca binària** (O(log n)), sense morir en l'intent (ni en l'off-by-one).
- Ordenar arrays amb **bombolla** (el patós) i amb **inserció** (el de les cartes), i saber els seus límits.
- Analitzar la **complexitat algorísmica** amb notació Big O i simplificar amb les regles d'or.
- **Triar l'algoritme adequat** segons la mida, l'ordre inicial i la situació.
- Escriure cerca binària i bombolla **a mà**, sense mirar apunts (sí, com en les entrevistes de treball).

---

## 🗺️ Mapa de la unitat

| Punt | Què aprendràs | Dificultat |
|---|---|---|
| [01 · Què és un algoritme](/ApuntesProgramacion/va/05-algoritmica-fundamentos/01-que-es-algoritmo) | Definir algoritme, les seues propietats i la recepta de la truita | Tots |
| [02 · Cerca lineal](/ApuntesProgramacion/va/05-algoritmica-fundamentos/02-busqueda-lineal) | Recórrer l'array buscant un element, O(n) | Tots |
| [03 · Cerca binària](/ApuntesProgramacion/va/05-algoritmica-fundamentos/03-busqueda-binaria) | Dividir i véncer: descartar mitats, O(log n) | Tots |
| [04 · Ordenació bombolla](/ApuntesProgramacion/va/05-algoritmica-fundamentos/04-ordenacion-burbuja) | Intercanviar bombolles fins que tot sura, O(n²) | Tots |
| [05 · Ordenació per inserció](/ApuntesProgramacion/va/05-algoritmica-fundamentos/05-ordenacion-insercion) | Ordenar com cartes a la mà, O(n²) i bèstia amb quasi ordenats | Tots |
| [06 · Complexitat algorísmica: Big O](/ApuntesProgramacion/va/05-algoritmica-fundamentos/06-complejidad-big-o) | Com creix el temps amb les dades, d'O(1) a O(2ⁿ) | Tots |
| [07 · Triar l'algoritme adequat](/ApuntesProgramacion/va/05-algoritmica-fundamentos/07-elegir-algoritmo) | La taula de decisió segons mida i ordre inicial | Tots |
| [08 · Be the Code: cerca binària des de zero](/ApuntesProgramacion/va/05-algoritmica-fundamentos/08-be-the-code) | Programar binària i bombolla sense xarxa de seguretat | Tots |
| [09 · Repàs interactiu](/ApuntesProgramacion/va/05-algoritmica-fundamentos/09-repaso-interactivo) | Sé el Código, Fireside, Qui Soc, Laboratori, Crucigrama… | Tots |

> 📖 **Flux de lectura:** els 8 primers punts són teoria en progressió. El 9 és l'aterratge pràctic: llig-lo just després del 8 i abans d'obrir els butlletins.

---

## 📝 Butlletins de la unitat

> Practica amb els parells del curs: comença sempre pel resolt per a vore l'estil i després intenta el per-resoldre.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/va/boletines/boletin-u05-inicial-resuelto" class="elink">✅ Inicial resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u05-inicial" class="elink">🟢 Inicial per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u05-avanzado-resuelto" class="elink">💪 Avançat resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u05-avanzado" class="elink">⭐ Avançat per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u05-extras" class="elink">🔥 Extres</a>
</div>

---

## ✅ Criteris d'avaluació coberts (RA2 + RA6)

**RA2: Escriu i prova programes senzills, reconeixent i aplicant els fonaments de la programació orientada a objectes.**

**RA6: Escriu programes que manipulen informació, seleccionant i utilitzant tipus avançats de dades.**

| CE | Criteri | On es cobreix |
|---|---|---|
| RA2 b) | S'han escrit programes simples. | ✅ Tots |
| RA2 f) | S'han utilitzat paràmetres en la crida a mètodes. | ✅ Punts 2, 3, 4 i 5 |
| RA6 a) | S'han escrit programes que utilitzen arrays. | ✅ Tots |

> 📌 Esta unitat és el germen de la U06: els bucles que domines ací (`for`, `while`), les cerques i les ordenacions es convertixen en QuickSort, MergeSort i recursivitat. I els arrays que recorres hui són la base de les col·leccions de la U10.

---

## 🚪 Per on comence?

- Cero coneixements? → Comença en el [punt 1](/ApuntesProgramacion/va/05-algoritmica-fundamentos/01-que-es-algoritmo). Només necessites variables, bucles i arrays bàsics de la U03.
- Ja saps què és un algoritme i vols molta cosa? → Salta a la [cerca binària](/ApuntesProgramacion/va/05-algoritmica-fundamentos/03-busqueda-binaria) o a l'[ordenació per inserció](/ApuntesProgramacion/va/05-algoritmica-fundamentos/05-ordenacion-insercion).
- Només vols saber quin algoritme triar? → Llig [Big O](/ApuntesProgramacion/va/05-algoritmica-fundamentos/06-complejidad-big-o) i [Triar l'algoritme adequat](/ApuntesProgramacion/va/05-algoritmica-fundamentos/07-elegir-algoritmo).
- Vens a repassar? → Fes el [Repàs interactiu](/ApuntesProgramacion/va/05-algoritmica-fundamentos/09-repaso-interactivo) i després els [butlletins](/ApuntesProgramacion/va/boletines/boletin-u05-inicial).

**📍 Primer punt:** [01 · Què és un algoritme](/ApuntesProgramacion/va/05-algoritmica-fundamentos/01-que-es-algoritmo)  
**⏭️ En acabar la unitat, continua en [U06 · Algorítmica II: Tècniques](/ApuntesProgramacion/va/06-algoritmica-tecnicas).**
