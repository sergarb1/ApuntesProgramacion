---
title: "U11 — Genèrics i Mapes"
description: "El <T> que ho va canviar tot i la guia telefònica que ho associa tot: genèrics, type erasure, wildcards, HashMap, TreeMap i triar estructura 🗺️"
emoji: 🗺️
---

<p><small>El <T> que ho va canviar tot i la guia telefònica que ho associa tot: genèrics, type erasure, wildcards, HashMap, TreeMap i triar estructura 🗺️</small></p>

> 🗺️ **El mapa del paquet:** 🚪 Benvinguda → ☕ U01 → 🔤 U02 → 🔀 U03 → 🅿️ U04 → 🧩 U05 → ⚡ U06 → 🏗️ U07 → 🔒 U08 → 🧬 U09 → 📚 U10 → **🗺️ ACÍ ETS (U11)** → 📁 U12 → 🗄️ U13 → 🌐 U14

---

En la U10 vas vore les col·leccions: llistes, conjunts, iteradors i la classe `Collections`. Però en declarar `ArrayList<String>` et va quedar una pregunta en l'aire: què és eixe `<String>`? I per què no puc ficar un `Integer` en una llista de Strings?

Hui responem a tot això i molt més. Esta unitat té dos grans superpoders:

- **Genèrics (`<T>`):** el sistema que fa que el compilador es convertisca en el teu amic. Descobriràs per què abans dels genèrics programar era com fer malabars amb ganivets embenat, com crear les teues pròpies classes i mètodes genèrics, el truc del diamant `<>` i el misteri del **type erasure**: el mag que fa desaparéixer els tipus quan compiles.
- **Mapes (`Map`):** l'estructura per a associar una cosa amb una altra. `HashMap`, la guia telefònica que busca per nom i et dona el número en un tancar i obrir d'ulls; `TreeMap`, el que ordena les claus tot sol; i `LinkedHashMap`, el que recorda l'ordre d'arribada.

I pel camí, el tancament perfecte del curs d'estructures de dades: **triar bé** entre Map, List i Set segons el problema, amb el principi PECS de Joshua Bloch com a mnemotècnia dels wildcards i el `getOrDefault()` com a salvavides dels `null`.

Esta unitat es llig com un **llibre de 9 capítols**: els 8 primers punts són teoria en progressió i el 9 és un aterratge pràctic per a deixar-ho tot ben lligat.

---

## 🎯 Objectiu de la unitat

En acabar, seràs capaç de:

- Explicar què són els **genèrics** i per què eliminen els castings a cegues i les `ClassCastException`.
- Crear **classes genèriques** (`Caja<T>`, `Pareja<T, U>`) i **mètodes genèrics** propis.
- Dominar el **diamant `<>`** i entendre què és el **type erasure** i què implica en temps d'execució.
- Usar **wildcards** (`? extends T`, `? super T`) aplicant el principi **PECS**.
- Usar **`HashMap`** per a associar claus amb valors i recórrer-lo de les tres formes (`keySet`, `values`, `entrySet`).
- Distingir **`TreeMap`**, **`LinkedHashMap`** i saber quan usar cada un.
- **Triar entre Map, List i Set** segons l'ordre, els duplicats i la velocitat que necessites.

---

## 🗺️ Mapa de la unitat

| Punt | Què aprendràs | Dificultat |
|---|---|---|
| [01 · Genèrics: el `<T>` que ho va canviar tot](/ApuntesProgramacion/va/11-genericos-mapas/01-que-son-genericos) | El lio abans dels genèrics, el compilador com a amic i `ArrayList<T>` | Tots |
| [02 · La teua pròpia classe genèrica: `Caja<T>`](/ApuntesProgramacion/va/11-genericos-mapas/02-clases-genericas) | Paràmetres de tipus, les convencions T/E/K/V/N i la teua primera classe amb buits | Tots |
| [03 · El diamant `<>` i type erasure](/ApuntesProgramacion/va/11-genericos-mapas/03-diamante-type-erasure) | `new Caja<>()`, la inferència i el mag que borra els tipus en el bytecode | Tots |
| [04 · Mètodes genèrics: funcions per a tot tipus](/ApuntesProgramacion/va/11-genericos-mapas/04-metodos-genericos) | El `<T>` abans del tipus de retorn, la inferència i els límits amb `Comparable` | Tots |
| [05 · Wildcards: `? extends T` i `? super T`](/ApuntesProgramacion/va/11-genericos-mapas/05-wildcards) | Covariància, contravariància i el principi PECS | Tots |
| [06 · HashMap: la guia telefònica](/ApuntesProgramacion/va/11-genericos-mapas/06-hashmap) | `put`, `get`, recórrer amb `keySet`/`values`/`entrySet` i comptar freqüències | Tots |
| [07 · TreeMap, LinkedHashMap i altres mapes](/ApuntesProgramacion/va/11-genericos-mapas/07-treemap-otros-mapas) | Ordre natural, ordre d'inserció, `firstKey`, `headMap`... | Tots |
| [08 · Map vs List vs Set: tria la teua estructura](/ApuntesProgramacion/va/11-genericos-mapas/08-elegir-estructura-datos) | Les tres preguntes que decidixen abans d'escriure la primera línia | Tots |
| [09 · Repàs interactiu](/ApuntesProgramacion/va/11-genericos-mapas/09-repaso-interactivo) | Sé el Código, Fireside, Laboratori, Crucigrama i més | Tots |

> 📖 **Flux de lectura:** els 8 primers punts són teoria en progressió. El 9 és l'aterratge pràctic: llig-lo just després del 8 i abans d'obrir els butlletins.

---

## 📝 Butlletins de la unitat

> Practica amb els parells del curs: comença sempre pel resolt per a vore l'estil i després intenta el per-resoldre.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/va/boletines/boletin-u11-inicial-resuelto" class="elink">✅ Inicial resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u11-inicial" class="elink">🟢 Inicial per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u11-avanzado-resuelto" class="elink">💪 Avançat resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u11-avanzado" class="elink">⭐ Avançat per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u11-extras" class="elink">🔥 Extres</a>
</div>

---

## ✅ Criteris d'avaluació coberts (RA6)

**RA6: Escriu programes que manipulen informació, seleccionant i utilitzant tipus avançats de dades.**

| CE | Criteri | On es cobreix |
|---|---|---|
| RA6 b) | S'han reconegut les llibreries de classes relacionades amb tipus avançats de dades. | ✅ Punts 6 i 7 |
| RA6 e) | S'han reconegut les característiques i avantatges de cadascuna de les col·leccions de dades disponibles. | ✅ Punt 8 |
| RA6 f) | S'han creat classes i mètodes genèrics. | ✅ Punts 1, 2, 3, 4 i 5 |

> 📌 La **RA6** es completa amb la **U04** (arrays, CE a), la **U10** (col·leccions, CEs c, d i e) i la **U12** (regex i XML, CEs g, h i i). Esta unitat cobrix els genèrics (CE f) i els mapes del paquet `java.util`.

---

## 🚪 Per on comence?

- Vens de la U10 i vols l'essencial? → Comença en el [punt 1](/ApuntesProgramacion/va/11-genericos-mapas/01-que-son-genericos) i el [punt 2](/ApuntesProgramacion/va/11-genericos-mapas/02-clases-genericas): els genèrics de tots els dies.
- Ja uses genèrics i vols mapes? → Ves directe al [punt 6](/ApuntesProgramacion/va/11-genericos-mapas/06-hashmap) i al [punt 7](/ApuntesProgramacion/va/11-genericos-mapas/07-treemap-otros-mapas): la guia telefònica.
- Només vens a pels trucs? → Salta al [punt 3](/ApuntesProgramacion/va/11-genericos-mapas/03-diamante-type-erasure) (el diamant i el type erasure) i al [punt 5](/ApuntesProgramacion/va/11-genericos-mapas/05-wildcards) (els wildcards).
- Vens a repassar? → Fes el [Repàs interactiu](/ApuntesProgramacion/va/11-genericos-mapas/09-repaso-interactivo) i després els [butlletins](/ApuntesProgramacion/va/boletines/boletin-u11-inicial).

**📍 Primer punt:** [01 · Genèrics: el `<T>` que ho va canviar tot](/ApuntesProgramacion/va/11-genericos-mapas/01-que-son-genericos)  
**⏭️ En acabar la unitat, continua en [U12 · Fitxers i Regex](/ApuntesProgramacion/va/12-ficheros-regex).**