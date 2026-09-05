---
title: "U09 — Arrays i Col·leccions"
description: "L'aparcament de dades que creix, s'ordena i mai no es queda sense places: arrays, ArrayList, HashSet i molt més 📚"
emoji: 📚
---

<p><small>L'aparcament de dades que creix, s'ordena i mai no es queda sense places: arrays, ArrayList, HashSet i molt més 📚</small></p>

> 🗺️ **El mapa del paquet:** 🚪 Benvinguda → ☕ U01 → 🔤 U02 → 🔀 U03 → 🧩 Fonaments → ⚡ Tècniques → 🏗️ POO → 🔒 Visibilitat → 🧬 Herència → **📚 ACÍ ETS (U09)** → 🗺️ Genèrics → 📁 Fitxers → 🗄️ JDBC → 🌐 APIs

---

Benvingut a la unitat on les teues dades per fi tenen lloc. Fins ara guardaves variables soltes: `nombre`, `edad`, `precio`... Cadascuna en la seua capseta. Però què fas quan tens 100 gats, 30 notes d'alumnes o un tauler de 5x5 que amaga mines? Declares 100 variables? `gato1`, `gato2`, `gato3`...? En algun lloc del món, un programador sènior acaba de plorar.

Esta unitat té dues mitats que ballen juntes:

- **Arrays:** el bloc de pisos de les dades. Aprens a declarar un aparcament amb `new`, a ficar i traure cotxes per índex i a recórrer-lo amb `for` i `for-each`. També veuràs el seu taló d'Aquil·les: la **grandària fixa**. Una vegada construït, no creix ni s'encongix.
- **Col·leccions:** quan l'aparcament es queda petit, arriba el Java Collections Framework. `ArrayList` (creix sol), `LinkedList` (la conga line), `HashSet` (el porter sense duplicats) i `TreeSet` (l'organitzat). I amb ells, `Iterator` per a recórrer-los i la classe `Collections` per a ordenar-los i remenar-los al teu gust.

Pel camí descobriràs per què `length` va sense parèntesis però `size()` va amb ells, per què `ArrayList` no pot guardar `int` a palpes (encara que semble que sí) i què li passa a la teua llista si intentes esborrar elements mentre la recórres amb un `for-each`. Spoiler: `ConcurrentModificationException`.

Esta unitat es llig com un **llibre de 9 capítols**: els 8 primers punts són teoria en progressió i el 9 és un aterratge pràctic per a deixar-ho tot ben lligat.

---

## 🎯 Objectiu de la unitat

En acabar, seràs capaç de:

- Declarar i recórrer **arrays** unidimensionals i multidimensionals.
- Usar el bucle **for-each** per a llegir col·leccions sense índex.
- Dominar la classe **Arrays** (`toString`, `sort`, `copyOf`, `binarySearch`, `fill`).
- Passar arrays a mètodes i entendre el **pas per referència**.
- Triar la col·lecció adequada: **ArrayList, LinkedList, HashSet i TreeSet**.
- Utilitzar **iteradors** per a recórrer i modificar col·leccions sense por a `ConcurrentModificationException`.
- Aplicar els mètodes utilitaris de **Collections** (`sort`, `reverse`, `max`, `min`...).
- Saber quan un array és millor que una col·lecció i a la inversa.

---

## 🗺️ Mapa de la unitat

| Punt | Què aprendràs | Dificultat |
|---|---|---|
| [01 · Arrays: l'aparcament de dades](/ApuntesProgramacion/va/09-arrays-colecciones/01-arrays-basicos) | Declaració, índexs i el primer BOOM: la `ArrayIndexOutOfBoundsException` | Tots |
| [02 · Recórrer arrays: for i for-each](/ApuntesProgramacion/va/09-arrays-colecciones/02-recorrer-arrays) | El duo inseparable i la variant peresosa que només llig | Tots |
| [03 · Arrays multidimensionals](/ApuntesProgramacion/va/09-arrays-colecciones/03-arrays-multidimensionales) | L'aparcament de diverses plantes i com recórrer-lo amb bucles niats | Tots |
| [04 · La classe Arrays: la teua navalla suïssa](/ApuntesProgramacion/va/09-arrays-colecciones/04-clase-arrays) | `toString`, `sort`, `copyOf`, `binarySearch` i `fill` | Tots |
| [05 · Arrays i mètodes](/ApuntesProgramacion/va/09-arrays-colecciones/05-arrays-metodos) | Passant el testimoni: els arrays viatgen per referència | Tots |
| [06 · ArrayList i el Java Collections Framework](/ApuntesProgramacion/va/09-arrays-colecciones/06-arraylist-jcf) | L'aparcament que creix sol i la família `java.util` | Tots |
| [07 · LinkedList, HashSet i TreeSet](/ApuntesProgramacion/va/09-arrays-colecciones/07-linkedlist-hashset) | La conga line, el porter sense duplicats i l'organitzat | Tots |
| [08 · Iterator i la classe Collections](/ApuntesProgramacion/va/09-arrays-colecciones/08-iterator-collections) | El cambrer que pren nota i la navalla suïssa de les col·leccions | Tots |
| [09 · Repàs interactiu](/ApuntesProgramacion/va/09-arrays-colecciones/09-repaso-interactivo) | Sé el Código, Fireside, Laboratori, Crucigrama i més | Tots |

> 📖 **Flux de lectura:** els 8 primers punts són teoria en progressió. El 9 és l'aterratge pràctic: llig-lo just després del 8 i abans d'obrir els butlletins.

---

## 📝 Butlletins de la unitat

> Practica amb els parells del curs: comença sempre pel resolt per a vore l'estil i després intenta el per-resoldre.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/va/boletines/boletin-u09-inicial-resuelto" class="elink">✅ Inicial resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u09-inicial" class="elink">🟢 Inicial per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u09-avanzado-resuelto" class="elink">💪 Avançat resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u09-avanzado" class="elink">⭐ Avançat per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u09-extras" class="elink">🔥 Extres</a>
</div>

---

## ✅ Criteris d'avaluació coberts (RA6)

**RA6: Escriu programes que manipulen informació, seleccionant i utilitzant tipus avançats de dades.**

| CE | Criteri | On es cobreix |
|---|---|---|
| RA6 a) | S'han escrit programes que utilitzen arrays. | ✅ Punts 1, 2 i 3 |
| RA6 b) | S'han reconegut les llibreries de classes relacionades amb tipus de dades avançats. | ✅ Punts 4 i 6 |
| RA6 c) | S'han utilitzat llistes per a emmagatzemar i processar informació. | ✅ Punts 6 i 7 |
| RA6 d) | S'han utilitzat iteradors per a recórrer els elements de les llistes. | ✅ Punt 8 |
| RA6 e) | S'han reconegut les característiques i avantatges de cadascuna de les col·leccions de dades disponibles. | ✅ Punts 7 i 8 |

> 📌 Els **genèrics** (RA6 f) tenen el seu capítol propi en la **U10**, i les **expressions regulars** (RA6 g) i els documents **XML** (RA6 h i i) floreixen en la **U11**. Ací ens quedem amb els tipus avançats que donen de menjar: arrays i col·leccions.

---

## 🚪 Per on comence?

- Cero coneixements? → Comença en el [punt 1](/ApuntesProgramacion/va/09-arrays-colecciones/01-arrays-basicos). Només necessites variables i bucles, que ja vas vore en la U02 i la U03.
- Ja et mous amb els arrays i vols cim? → Ves directe al [punt 6](/ApuntesProgramacion/va/09-arrays-colecciones/06-arraylist-jcf): ací comencen les col·leccions.
- Només vens a per les col·leccions? → Salta al [punt 6](/ApuntesProgramacion/va/09-arrays-colecciones/06-arraylist-jcf) i al [punt 7](/ApuntesProgramacion/va/09-arrays-colecciones/07-linkedlist-hashset).
- Vens a repassar? → Fes el [Repàs interactiu](/ApuntesProgramacion/va/09-arrays-colecciones/09-repaso-interactivo) i després els [butlletins](/ApuntesProgramacion/va/boletines/boletin-u09-inicial).

**📍 Primer punt:** [01 · Arrays: l'aparcament de dades](/ApuntesProgramacion/va/09-arrays-colecciones/01-arrays-basicos)  
**⏭️ En acabar la unitat, continua en [U10 · Genèrics i Mapes](/ApuntesProgramacion/va/10-genericos-mapas).