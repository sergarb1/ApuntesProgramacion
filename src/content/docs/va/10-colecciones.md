---
title: "U10 — Col·leccions"
description: "L'aparcament que creix, la conga que encadena, el porter sense duplicats i el cambrer que ho recorre tot: ArrayList, LinkedList, Set, Iterator i Collections 📚"
emoji: 📚
---

<p><small>L'aparcament que creix, la conga que encadena, el porter sense duplicats i el cambrer que ho recorre tot: ArrayList, LinkedList, Set, Iterator i Collections 📚</small></p>

> 🗺️ **El mapa del paquet:** 🚪 Benvinguda → ☕ U01 → 🔤 U02 → 🔀 U03 → 🅿️ U04 → 🧩 U05 → ⚡ U06 → 🏗️ U07 → 🔒 U08 → 🧬 U09 → **📚 ACÍ ETS (U10)** → 🗺️ U11 → 📁 U12 → 🗄️ U13 → 🌐 U14

---

En la U04 vas vore els arrays: grandària fixa, accés per índex i prou treball manual per a créixer o encongir-se. Hui això s'acaba. Les **col·leccions** de Java són com les estructures de dades amb superpoders: creixen soles, s'encongixen soles, rebutgen duplicats si vols, s'ordenen automàticament i es recorren sense que t'importe com estan construïdes per dins.

Esta unitat té tres grans actes:

- **Llistes (`List`):** `ArrayList`, l'aparcament que creix sol, i `LinkedList`, la conga que encadena els seus elements i brilla en cues i piles.
- **Conjunts (`Set`):** `HashSet`, el porter que no deixa entrar duplicats; `TreeSet`, el que els ordena sols; i `LinkedHashSet`, el que recorda l'ordre d'arribada.
- **Ferramentes:** l'`Iterator`, el cambrer que recorre qualsevol col·lecció i esborra sense trencar res, i la classe `Collections`, la navalla suïssa que ordena, remena i consulta en una línia.

Pel camí descobriràs la diferència entre esborrar per índex i esborrar per valor, per què `HashSet` i `TreeSet` no es porten bé amb els `null` per igual, i per què esborrar un element dins d'un `for-each` és la forma més ràpida de guanyar-te una `ConcurrentModificationException`.

Esta unitat es llig com un **llibre de 9 capítols**: els 8 primers punts són teoria en progressió i el 9 és un aterratge pràctic per a deixar-ho tot ben lligat.

---

## 🎯 Objectiu de la unitat

En acabar, seràs capaç de:

- Usar **`ArrayList`** per a guardar llistes dinàmiques i triar entre `size()`, `length` i `length()` sense equivocar-te.
- Distingir **`remove(índex)`** de **`remove(objecte)`** i explicar el lio dels `Integer`.
- Aplicar **`LinkedList`** per a cues (FIFO) i piles (LIFO).
- Eliminar duplicats amb **`HashSet`** i entendre per què `hashCode()` i `equals()` van sempre junts.
- Ordenar i mantindre l'ordre amb **`TreeSet`** i **`LinkedHashSet`**.
- Recórrer qualsevol col·lecció amb **`Iterator`** i esborrar durant el recorregut sense excepció.
- Manipular llistes amb la classe **`Collections`** (`sort`, `reverse`, `shuffle`, `max`, `min`, `frequency`).
- **Triar la col·lecció adequada** per a cada problema segons l'ordre, els duplicats i la velocitat.

---

## 🗺️ Mapa de la unitat

| Punt | Què aprendràs | Dificultat |
|---|---|---|
| [01 · ArrayList i el Java Collections Framework](/ApuntesProgramacion/va/10-colecciones/01-arraylist-jcf) | L'aparcament que creix sol, la família `java.util` i per què no guarda `int` a palpes | Tots |
| [02 · LinkedList: la conga line](/ApuntesProgramacion/va/10-colecciones/02-linkedlist) | La llista enllaçada, cues FIFO, piles LIFO i els seus mètodes d'extrems | Tots |
| [03 · HashSet: el porter sense duplicats](/ApuntesProgramacion/va/10-colecciones/03-hashset) | Sense repetits, sense ordre i O(1): `hashCode()` i `equals()` en acció | Tots |
| [04 · TreeSet i LinkedHashSet](/ApuntesProgramacion/va/10-colecciones/04-treeset-linkedhashset) | El que ordena sol i el que recorda l'ordre d'arribada | Tots |
| [05 · Iterator: el cambrer que pren nota](/ApuntesProgramacion/va/10-colecciones/05-iterator) | Recórrer qualsevol col·lecció i esborrar durant el recorregut sense `ConcurrentModificationException` | Tots |
| [06 · La classe Collections: la navalla suïssa](/ApuntesProgramacion/va/10-colecciones/06-collections) | `sort`, `reverse`, `shuffle`, `max`, `min`, `frequency`... en una línia | Tots |
| [07 · Triar la col·lecció adequada](/ApuntesProgramacion/va/10-colecciones/07-elegir-coleccion) | Ordre, duplicats i velocitat: les tres preguntes que decidixen | Tots |
| [08 · Be the Code: col·leccions en acció](/ApuntesProgramacion/va/10-colecciones/08-be-the-code) | Prediu l'eixida, caça el bug i tria la col·lecció a ull | Tots |
| [09 · Repàs interactiu](/ApuntesProgramacion/va/10-colecciones/09-repaso-interactivo) | Sé el Código, Fireside, Laboratori, Crucigrama i més | Tots |

> 📖 **Flux de lectura:** els 8 primers punts són teoria en progressió. El 9 és l'aterratge pràctic: llig-lo just després del 8 i abans d'obrir els butlletins.

---

## 📝 Butlletins de la unitat

> Practica amb els parells del curs: comença sempre pel resolt per a vore l'estil i després intenta el per-resoldre.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/va/boletines/boletin-u10-inicial-resuelto" class="elink">✅ Inicial resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u10-inicial" class="elink">🟢 Inicial per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u10-avanzado-resuelto" class="elink">💪 Avançat resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u10-avanzado" class="elink">⭐ Avançat per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u10-extras" class="elink">🔥 Extres</a>
</div>

---

## ✅ Criteris d'avaluació coberts (RA6)

**RA6: Escriu programes que manipulen informació, seleccionant i utilitzant tipus avançats de dades.**

| CE | Criteri | On es cobreix |
|---|---|---|
| RA6 b) | S'han reconegut les llibreries de classes relacionades amb tipus avançats de dades. | ✅ Punts 1 i 7 |
| RA6 c) | S'han utilitzat llistes per a emmagatzemar i processar informació. | ✅ Punts 1, 2 i 8 |
| RA6 d) | S'han utilitzat iteradors per a recórrer els elements de les llistes. | ✅ Punts 5 i 9 |
| RA6 e) | S'han reconegut les característiques i avantatges de cadascuna de les col·leccions de dades disponibles. | ✅ Punts 3, 4 i 7 |

> 📌 La **RA6** es completa amb la **U04** (arrays, CE a), la **U11** (genèrics i mapes, CE f) i la **U12** (regex i XML, CEs g, h i i). Esta unitat cobrix el cor de les col·leccions: llistes, conjunts, iteradors i la llibreria `java.util`.

---

## 🚪 Per on comence?

- Vens de la U09 i vols l'essencial? → Comença en el [punt 1](/ApuntesProgramacion/va/10-colecciones/01-arraylist-jcf) i el [punt 2](/ApuntesProgramacion/va/10-colecciones/02-linkedlist): les llistes de tots els dies.
- Ja uses llistes i vols conjunts? → Ves directe al [punt 3](/ApuntesProgramacion/va/10-colecciones/03-hashset) i al [punt 4](/ApuntesProgramacion/va/10-colecciones/04-treeset-linkedhashset): duplicats fora.
- Només vens a pels trucs? → Salta al [punt 5](/ApuntesProgramacion/va/10-colecciones/05-iterator) (esborrar mentre recorres) i al [punt 7](/ApuntesProgramacion/va/10-colecciones/07-elegir-coleccion) (triar bé).
- Vens a repassar? → Fes el [Repàs interactiu](/ApuntesProgramacion/va/10-colecciones/09-repaso-interactivo) i després els [butlletins](/ApuntesProgramacion/va/boletines/boletin-u10-inicial).

**📍 Primer punt:** [01 · ArrayList i el Java Collections Framework](/ApuntesProgramacion/va/10-colecciones/01-arraylist-jcf)  
**⏭️ En acabar la unitat, continua en [U11 · Genèrics i Mapes](/ApuntesProgramacion/va/11-genericos-mapas).