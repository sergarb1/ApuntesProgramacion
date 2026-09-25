---
title: "U11 — Col·leccions, genèrics i mapes"
description: "L'aparcament que creix, el porter sense duplicats, el `<T>` que ho canvia tot i la guia telefònica: ArrayList, Set, genèrics i HashMap en una sola unitat 📚"
emoji: 📚
---

<p><small>L'aparcament que creix, el porter sense duplicats, el `<T>` que ho canvia tot i la guia telefònica: ArrayList, Set, genèrics i HashMap en una sola unitat 📚</small></p>

---

En la U05 vas vore els arrays: grandària fixa, accés per índex i prou treball manual per a créixer o encongir-se. Hui això s'acaba. Les **col·leccions** de Java són les estructures de dades amb superpoders: creixen soles, s'encongeixen soles, rebutgen duplicats si vols, s'ordenen automàticament i es recorren sense que t'importe com estan construïdes per dins.

I esta unitat va més enllà: després de dominar les col·leccions, llevarem el capó del `<String>` que portes setmanes escrivint. Els **genèrics** expliquen per què el compilador es fia de les teues llistes, i els **mapes** (`HashMap`, `TreeMap`) et donen l'estructura que més s'usa en Java real: associar una clau amb un valor.

Esta unitat té quatre grans actes:

- **Llistes (`List`):** `ArrayList`, l'aparcament que creix sol, i `LinkedList`, la conga que encadena els seus elements i brilla en cues i piles.
- **Conjunts (`Set`):** `HashSet`, el porter que no deixa entrar duplicats; `TreeSet`, el que els ordena sols; i `LinkedHashSet`, el que recorda l'ordre d'arribada.
- **Genèrics:** d'on ix el `<T>`, la teua pròpia classe genèrica, el diamant `<>`, el type erasure i el principi PECS.
- **Mapes (`Map`):** `HashMap`, la guia telefònica de Java; `TreeMap`, el que ordena les seues claus; i la guia definitiva per a triar estructura.

Esta unitat es llig com un **llibre de 9 capítols**: els 8 primers punts són teoria en progressió i el 9 és un aterratge pràctic per a deixar-ho tot ben lligat.

---

## 🎯 Objectiu de la unitat

En acabar, seràs capaç de:

- Usar **`ArrayList`** per a guardar llistes dinàmiques i distingir **`remove(índex)`** de **`remove(objecte)`**.
- Aplicar **`LinkedList`** per a cues (FIFO) i piles (LIFO).
- Eliminar duplicats amb **`HashSet`** i entendre per què `hashCode()` i `equals()` van sempre junts.
- Ordenar i mantindre l'ordre amb **`TreeSet`** i **`LinkedHashSet`**.
- Recórrer qualsevol col·lecció amb **`Iterator`** i esborrar durant el recorregut sense excepció.
- Manipular llistes amb la classe **`Collections`** (`sort`, `reverse`, `shuffle`, `max`, `min`, `frequency`).
- Crear les teues **classes i mètodes genèrics** amb `<T>`, límits i wildcards.
- Guardar i buscar parelles clau → valor amb **`HashMap`** i **`TreeMap`**.
- **Triar l'estructura adequada** (List, Set o Map) per a cada problema.

---

## 🗺️ Mapa de la unitat

| Punt | Què aprendràs | Dificultat |
|---|---|---|
| [01 · ArrayList i el Java Collections Framework](/ApuntesProgramacion/va/11-colecciones/01-arraylist-jcf) | L'aparcament que creix sol, la família `java.util` i per què no guarda `int` a palpes | Tots |
| [02 · LinkedList: la conga line](/ApuntesProgramacion/va/11-colecciones/02-linkedlist) | La llista enllaçada, cues FIFO, piles LIFO i els seus mètodes d'extrems | Tots |
| [03 · HashSet, TreeSet i LinkedHashSet: els conjunts](/ApuntesProgramacion/va/11-colecciones/03-conjuntos-sets) | El porter sense duplicats, el que ordena sol i el que recorda l'ordre d'arribada | Tots |
| [04 · Iterator i Collections](/ApuntesProgramacion/va/11-colecciones/04-iterator-collections) | Esborrar mentre recorres i la navalla suïssa de les col·leccions | Tots |
| [05 · Classes genèriques: la teua `Caja<T>`](/ApuntesProgramacion/va/11-colecciones/05-clases-genericas) | D'on ix el `<String>`, convencions T/E/K/V i la teua primera classe genèrica | Tots |
| [06 · El diamant, mètodes genèrics i wildcards](/ApuntesProgramacion/va/11-colecciones/06-genericos-avanzado) | Type erasure, inferència, límits i el principi PECS | Tots |
| [07 · HashMap: la guia telefònica](/ApuntesProgramacion/va/11-colecciones/07-hashmap) | Clau → valor, `get`, `put`, `containsKey` i recórrer mapes | Tots |
| [08 · TreeMap i com triar estructura](/ApuntesProgramacion/va/11-colecciones/08-treemap-elegir-estructura) | Mapes ordenats, `LinkedHashMap` i Map vs List vs Set | Tots |
| [09 · Repàs interactiu](/ApuntesProgramacion/va/11-colecciones/09-repaso-interactivo) | Sé el Código, Fireside, Laboratori, Crucigrama i més | Tots |

> 📖 **Flux de lectura:** els 8 primers punts són teoria en progressió. El 9 és l'aterratge pràctic: llig-lo just després del 8 i abans d'obrir els butlletins.

---

## 📝 Butlletins de la unitat

> Practica amb els parells del curs: intenta primer el per-resoldre i comprova amb el resolt quan hagues acabat.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/va/boletines/boletin-u11-inicial" class="elink">🟢 Inicial per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u11-inicial-resuelto" class="elink">✅ Inicial resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u11-avanzado" class="elink">⭐ Avançat per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u11-avanzado-resuelto" class="elink">💪 Avançat resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u11-extras" class="elink">🔥 Extres</a>
</div>

---

## ✅ Criteris d'avaluació coberts (RA6)

**RA6: Escriu programes que manipulen informació, seleccionant i utilitzant tipus avançats de dades.**

| CE | Criteri | On es cobreix |
|---|---|---|
| RA6 b) | S'han reconegut les llibreries de classes relacionades amb tipus avançats de dades. | ✅ Punts 1, 7 i 8 |
| RA6 c) | S'han utilitzat llistes per a emmagatzemar i processar informació. | ✅ Punts 1, 2 i 9 |
| RA6 d) | S'han utilitzat iteradors per a recórrer els elements de les llistes. | ✅ Punts 4 i 9 |
| RA6 e) | S'han reconegut les característiques i avantatges de cadascuna de les col·leccions de dades disponibles. | ✅ Punts 3, 7 i 8 |
| RA6 f) | S'han utilitzat tipus enumeradors, estructures dinàmiques de dades i classes genèriques. | ✅ Punts 5, 6, 7 i 8 |

> 📌 La **RA6** es completa amb la **U05** (arrays, CE a) i la **U13** (regex i XML, CEs g, h i i). Esta unitat cobreix col·leccions, genèrics i mapes: la llibreria `java.util` sencera.

---

## 🚪 Per on comence?

- Vens de la U10 i vols l'essencial? → Comença en el [punt 1](/ApuntesProgramacion/va/11-colecciones/01-arraylist-jcf) i el [punt 2](/ApuntesProgramacion/va/11-colecciones/02-linkedlist): les llistes de tots els dies.
- Ja uses llistes i vols conjunts? → Ves directe al [punt 3](/ApuntesProgramacion/va/11-colecciones/03-conjuntos-sets): duplicats fora.
- Et pica la curiositat del `<T>`? → Salta al [punt 5](/ApuntesProgramacion/va/11-colecciones/05-clases-genericas) i al [punt 6](/ApuntesProgramacion/va/11-colecciones/06-genericos-avanzado): genèrics de cap a cap.
- Vols mapes? → [Punt 7](/ApuntesProgramacion/va/11-colecciones/07-hashmap) i [punt 8](/ApuntesProgramacion/va/11-colecciones/08-treemap-elegir-estructura): la guia telefònica i el mapa de decisió.
- Vens a repassar? → Fes el [Repàs interactiu](/ApuntesProgramacion/va/11-colecciones/09-repaso-interactivo) i després els [butlletins](/ApuntesProgramacion/va/boletines/boletin-u11-inicial).

**📍 Primer punt:** [01 · ArrayList i el Java Collections Framework](/ApuntesProgramacion/va/11-colecciones/01-arraylist-jcf)  
**⏭️ En acabar la unitat, continua en [U12 · Programació funcional (Streams i Lambdas)](/ApuntesProgramacion/va/12-programacion-funcional).**
