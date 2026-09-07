---
title: "U12 — Programació Funcional"
description: "La cinta transportadora que processa les teues col·leccions i la fletxa que viatja sola: lambdes, interfícies funcionals, streams, Collectors i Optional 🎯"
emoji: 🎯
---

<p><small>La cinta transportadora que processa les teues col·leccions i la fletxa que viatja sola: lambdes, interfícies funcionals, streams, Collectors i Optional 🎯</small></p>

> 🗺️ **El mapa del paquet:** 🚪 Benvinguda → ☕ U01 → 🔤 U02 → 🔀 U03 → 🅿️ U04 → 🧩 U05 → ⚡ U06 → 🏗️ U07 → 🔒 U08 → 🧬 U09 → 📚 U10 → 🗺️ U11 → **🎯 ACÍ ETS (U12)** → 📁 U13 → 🗄️ U14 → 🌐 U15

---

En la U11 vas vore genèrics i mapes: les teues dades per fi viuen en estructures que el compilador controla i que s'associen amb elegància. Però hi havia una manera de recórrer-les: bucles, bucles i més bucles. I si et diguera que hi ha una forma de dir-li a Java **QUÈ** vols aconseguir i que ell s'encarregue del **COM**?

Benvingut o benvinguda a la programació funcional. Esta unitat té tres grans actes:

- **Lambdes i interfícies funcionals:** la fletxa `->` i els quatre vestits oficials (`Predicate`, `Function`, `Consumer`, `Supplier`). Les funcions deixen de ser només blocs de codi i es convertixen en valors que viatgen d'un lloc a un altre com un missatge dins d'una botella.
- **Streams:** la cinta transportadora que recorre les teues col·leccions sense escriure un sol bucle. `filter`, `map`, `distinct`, `sorted`, `limit`, `collect`, `reduce`... declares què vols i Java s'encarrega del com. La peresa mai no va ser tan productiva: les operacions intermèdies no fan res fins que obris l'aixeta.
- **Optional i Collectors:** la capsa que accepta l'absència en comptes d'un `null` a seques, i la maleta que convertix streams en llistes, conjunts i mapes (`toList()`, `groupingBy`, `toMap`).

Pel camí entendràs per què les operacions intermèdies són peresoses, per què un `Stream` només es recorre una vegada, i per què `Optional.of(null)` t'explotarà a la cara (una vegada. Només en necessites una).

Esta unitat es llig com un **llibre de 9 capítols**: els 8 primers punts són teoria en progressió i el 9 és un aterratge pràctic per a deixar-ho tot ben lligat.

---

## 🎯 Objectiu de la unitat

En acabar, seràs capaç de:

- Explicar què és una **expressió lambda** i escriure la sintaxi `(x) -> ...` sense por.
- Reconéixer les **interfícies funcionals** de `java.util.function`: `Predicate`, `Function`, `Consumer` i `Supplier`.
- Usar **referències a mètodes** (`::`) per a escriure el mateix codi amb menys soroll.
- Crear un **`Stream`** a partir d'una col·lecció amb `stream()` o des de zero amb `Stream.of`.
- Encadenar **operacions intermèdies** (`filter`, `map`, `distinct`, `sorted`, `limit`) sense executar res.
- Tancar el pipeline amb **operacions terminals** (`collect`, `reduce`, `count`, `forEach`).
- Convertir streams en col·leccions amb **`toList()`** i **`Collectors`** (`groupingBy`, `toMap`, `joining`).
- Usar **`Optional`** per a gestionar l'absència de valor i per què és millor que un `null` a seques.

---

## 🗺️ Mapa de la unitat

| Punt | Què aprendràs | Dificultat |
|---|---|---|
| [01 · Lambdes: funcions que viatgen soles](/ApuntesProgramacion/va/12-programacion-funcional/01-lambdas) | La fletxa `->`, la sintaxi i guardar funcions en variables | Tots |
| [02 · Interfícies funcionals: Predicate, Function, Consumer, Supplier](/ApuntesProgramacion/va/12-programacion-funcional/02-interfaces-funcionales) | Els quatre vestits oficials de tota lambda i `@FunctionalInterface` | Tots |
| [03 · Referències a mètodes: la drecera `::`](/ApuntesProgramacion/va/12-programacion-funcional/03-referencias-metodos) | `String::toUpperCase`: reciclar mètodes com si foren lambdes | Tots |
| [04 · Streams: el flux de dades](/ApuntesProgramacion/va/12-programacion-funcional/04-streams-basicos) | Crear streams amb `stream()` i `Stream.of`, i el pipeline | Tots |
| [05 · Operacions intermèdies: filter, map, distinct, sorted, limit](/ApuntesProgramacion/va/12-programacion-funcional/05-streams-intermedias) | La cinta que filtra, transforma, lleva repetits, ordena i limita | Tots |
| [06 · Operacions terminals: collect, reduce, count, forEach](/ApuntesProgramacion/va/12-programacion-funcional/06-streams-terminales) | L'aixeta que fa que l'aigua fluesca de veritat | Tots |
| [07 · Del stream a la col·lecció: toList, Collectors, groupingBy](/ApuntesProgramacion/va/12-programacion-funcional/07-streams-colecciones) | `toList()`, `Collectors.toMap` i agrupar com en una taula | Tots |
| [08 · Optional: el que accepta l'absència](/ApuntesProgramacion/va/12-programacion-funcional/08-optional) | Embolicar el `null` per a no ensopegar-hi | Tots |
| [09 · Repàs interactiu](/ApuntesProgramacion/va/12-programacion-funcional/09-repaso-interactivo) | Sé el Código, Fireside, Laboratori, Crucigrama i més | Tots |

> 📖 **Flux de lectura:** els 8 primers punts són teoria en progressió. El 9 és l'aterratge pràctic: llig-lo just després del 8 i abans d'obrir els butlletins.

---

## 📝 Butlletins de la unitat

> Practica amb els parells del curs: en esta unitat el per-resoldre va primer. Intenta-ho de veritat i només mira el resolt quan hages suat una mica.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/va/boletines/boletin-u12-inicial" class="elink">🟢 Inicial per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u12-inicial-resuelto" class="elink">✅ Inicial resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u12-avanzado" class="elink">⭐ Avançat per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u12-avanzado-resuelto" class="elink">💪 Avançat resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u12-extras" class="elink">🔥 Extres</a>
</div>

---

## ✅ Criteris d'avaluació coberts (RA6)

**RA6: Escriu programes que manipulen informació, seleccionant i utilitzant tipus avançats de dades.**

| CE | Criteri | On es cobreix |
|---|---|---|
| RA6 b) | S'han reconegut les llibreries de classes relacionades amb tipus avançats de dades. | ✅ Punts 1, 2, 4, 7 i 8 |
| RA6 c) | S'han utilitzat llistes per a emmagatzemar i processar informació. | ✅ Punts 4, 5, 6 i 7 |

> 📌 La **RA6** es completa amb la **U04** (arrays, CE a), la **U10** (col·leccions, CEs b, c, d i e), la **U11** (genèrics i mapes, CE f) i la **U13** (regex, CE g). Esta unitat afig la capa de **programació funcional**: processa la informació de les col·leccions amb lambdes, streams i `Optional`, reforçant els CEs b i c des de l'enfocament declaratiu.

---

## ✅ Criteris d'avaluació coberts (RA7)

**RA7: Desenvolupa programes, aplicant característiques avançades dels llenguatges orientats a objectes i de l'entorn de programació.**

| CE | Criteri | On es cobreix |
|---|---|---|
| RA7 a)–g) | Herència, superclasse, subclasse, modificadors, constructors, sobrescriptura i jerarquies de classes. | 🔁 Es va cobrir en la **U09** |
| RA7 h) | S'ha comentat i documentat el codi. | ✅ Repàs interactiu i butlletins |

> 📌 La **RA7** es recolza en la **U09** (herència, CEs a–g). Esta unitat la desenvolupa en la seua vessant de **característiques avançades del llenguatge**: lambdes, interfícies funcionals, streams i `Optional`, els paquets `java.util.function` i `java.util.stream`.

---

## 🚪 Per on comence?

- Vens de la U11 i vols l'essencial? → Comença en el [punt 1](/ApuntesProgramacion/va/12-programacion-funcional/01-lambdas) i el [punt 2](/ApuntesProgramacion/va/12-programacion-funcional/02-interfaces-funcionales): les funcions que viatgen soles.
- Ja escrius lambdes i vols fluxos? → Ves directe al [punt 4](/ApuntesProgramacion/va/12-programacion-funcional/04-streams-basicos) i al [punt 5](/ApuntesProgramacion/va/12-programacion-funcional/05-streams-intermedias): la cinta transportadora.
- Només vens a pels trucs? → Salta al [punt 3](/ApuntesProgramacion/va/12-programacion-funcional/03-referencias-metodos) (la drecera `::`) i al [punt 8](/ApuntesProgramacion/va/12-programacion-funcional/08-optional) (la capsa que accepta l'absència).
- Vens a repassar? → Fes el [Repàs interactiu](/ApuntesProgramacion/va/12-programacion-funcional/09-repaso-interactivo) i després els [butlletins](/ApuntesProgramacion/va/boletines/boletin-u12-inicial).

**📍 Primer punt:** [01 · Lambdes: funcions que viatgen soles](/ApuntesProgramacion/va/12-programacion-funcional/01-lambdas)  
**⏭️ En acabar la unitat, continua en [U13 · Fitxers i Regex](/ApuntesProgramacion/va/13-ficheros-regex).**