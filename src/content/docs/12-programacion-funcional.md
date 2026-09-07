---
title: "U12 — Programación Funcional"
description: "La cinta transportadora que procesa tus colecciones y la flecha que viaja sola: lambdas, interfaces funcionales, streams, Collectors y Optional 🎯"
emoji: 🎯
---

<p><small>La cinta transportadora que procesa tus colecciones y la flecha que viaja sola: lambdas, interfaces funcionales, streams, Collectors y Optional 🎯</small></p>

> 🗺️ **El mapa del paquete:** 🚪 Bienvenida → ☕ U01 → 🔤 U02 → 🔀 U03 → 🅿️ U04 → 🧩 U05 → ⚡ U06 → 🏗️ U07 → 🔒 U08 → 🧬 U09 → 📚 U10 → 🗺️ U11 → **🎯 AQUÍ ESTÁS (U12)** → 📁 U13 → 🗄️ U14 → 🌐 U15

---

En la U11 viste genéricos y mapas: tus datos por fin viven en estructuras que el compilador controla y que se asocian con elegancia. Pero había una manera de recorrerlas: bucles, bucles y más bucles. ¿Y si te dijera que existe una forma de decirle a Java **QUÉ** quieres conseguir y que él se encargue del **CÓMO**?

Bienvenido o bienvenida a la programación funcional. Esta unidad tiene tres grandes actos:

- **Lambdas e interfaces funcionales:** la flecha `->` y los cuatro trajes oficiales (`Predicate`, `Function`, `Consumer`, `Supplier`). Las funciones dejan de ser solo bloques de código y se convierten en valores que viajan de un lado a otro como un mensaje en una botella.
- **Streams:** la cinta transportadora que recorre tus colecciones sin escribir un solo bucle. `filter`, `map`, `distinct`, `sorted`, `limit`, `collect`, `reduce`... declaras qué quieres y Java se ocupa del cómo. La pereza nunca fue tan productiva: las operaciones intermedias no hacen nada hasta que abres el grifo.
- **Optional y Collectors:** la caja que acepta la ausencia en vez de un `null` a secas, y el maletín que convierte streams en listas, conjuntos y mapas (`toList()`, `groupingBy`, `toMap`).

Por el camino entenderás por qué las operaciones intermedias son perezosas, por qué un `Stream` solo se recorre una vez, y por qué `Optional.of(null)` te va a explotar en la cara (una vez. Solo necesitas una).

Esta unidad se lee como un **libro de 9 capítulos**: los 8 primeros puntos son teoría en progresión y el 9º es un aterrizaje práctico para machacar todo lo aprendido.

---

## 🎯 Objetivo de la unidad

Al terminar, serás capaz de:

- Explicar qué es una **expresión lambda** y escribir la sintaxis `(x) -> ...` sin miedo.
- Reconocer las **interfaces funcionales** de `java.util.function`: `Predicate`, `Function`, `Consumer` y `Supplier`.
- Usar **referencias a métodos** (`::`) para escribir el mismo código con menos ruido.
- Crear un **`Stream`** a partir de una colección con `stream()` o desde cero con `Stream.of`.
- Encadenar **operaciones intermedias** (`filter`, `map`, `distinct`, `sorted`, `limit`) sin ejecutar nada.
- Cerrar el pipeline con **operaciones terminales** (`collect`, `reduce`, `count`, `forEach`).
- Convertir streams en colecciones con **`toList()`** y **`Collectors`** (`groupingBy`, `toMap`, `joining`).
- Usar **`Optional`** para gestionar la ausencia de valor y por qué es mejor que un `null` a secas.

---

## 🗺️ Mapa de la unidad

| Punto | Qué aprenderás | Dificultad |
|---|---|---|
| [01 · Lambdas: funciones que viajan solas](/ApuntesProgramacion/12-programacion-funcional/01-lambdas) | La flecha `->`, la sintaxis y guardar funciones en variables | Todos |
| [02 · Interfaces funcionales: Predicate, Function, Consumer, Supplier](/ApuntesProgramacion/12-programacion-funcional/02-interfaces-funcionales) | Los cuatro trajes oficiales de toda lambda y `@FunctionalInterface` | Todos |
| [03 · Referencias a métodos: el atajo `::`](/ApuntesProgramacion/12-programacion-funcional/03-referencias-metodos) | `String::toUpperCase`: reciclar métodos como si fueran lambdas | Todos |
| [04 · Streams: el flujo de datos](/ApuntesProgramacion/12-programacion-funcional/04-streams-basicos) | Crear streams con `stream()` y `Stream.of`, y el pipeline | Todos |
| [05 · Operaciones intermedias: filter, map, distinct, sorted, limit](/ApuntesProgramacion/12-programacion-funcional/05-streams-intermedias) | La cinta que filtra, transforma, quita repetidos, ordena y limita | Todos |
| [06 · Operaciones terminales: collect, reduce, count, forEach](/ApuntesProgramacion/12-programacion-funcional/06-streams-terminales) | El grifo que hace que el agua fluya de verdad | Todos |
| [07 · Del stream a la colección: toList, Collectors, groupingBy](/ApuntesProgramacion/12-programacion-funcional/07-streams-colecciones) | `toList()`, `Collectors.toMap` y agrupar como en una tabla | Todos |
| [08 · Optional: el que acepta la ausencia](/ApuntesProgramacion/12-programacion-funcional/08-optional) | Envolver el `null` para no tropezarte con él | Todos |
| [09 · Repaso interactivo](/ApuntesProgramacion/12-programacion-funcional/09-repaso-interactivo) | Sé el Código, Fireside, Laboratorio, Crucigrama y más | Todos |

> 📖 **Flujo de lectura:** los 8 primeros puntos son teoría en progresión. El 9º es el aterrizaje práctico: léelo justo después del 8º y antes de abrir los boletines.

---

## 📝 Boletines de la unidad

> Practica con los pares del curso: en esta unidad el por-resolver va primero. Inténtalo de verdad y solo mira el resuelto cuando hayas sudado un poco.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/boletines/boletin-u12-inicial" class="elink">🟢 Inicial por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u12-inicial-resuelto" class="elink">✅ Inicial resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u12-avanzado" class="elink">⭐ Avanzado por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u12-avanzado-resuelto" class="elink">💪 Avanzado resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u12-extras" class="elink">🔥 Extras</a>
</div>

---

## ✅ Criterios de evaluación cubiertos (RA6)

**RA6: Escribe programas que manipulen información, seleccionando y utilizando tipos avanzados de datos.**

| CE | Criterio | Dónde se cubre |
|---|---|---|
| RA6 b) | Se han reconocido las librerías de clases relacionadas con tipos de datos avanzados. | ✅ Puntos 1, 2, 4, 7 y 8 |
| RA6 c) | Se han utilizado listas para almacenar y procesar información. | ✅ Puntos 4, 5, 6 y 7 |

> 📌 La **RA6** se completa con la **U04** (arrays, CE a), la **U10** (colecciones, CEs b, c, d y e), la **U11** (genéricos y mapas, CE f) y la **U13** (regex, CE g). Esta unidad añade la capa de **programación funcional**: procesa la información de las colecciones con lambdas, streams y `Optional`, reforzando los CEs b y c desde el enfoque declarativo.

---

## ✅ Criterios de evaluación cubiertos (RA7)

**RA7: Desarrolla programas, aplicando características avanzadas de los lenguajes orientados a objetos y del entorno de programación.**

| CE | Criterio | Dónde se cubre |
|---|---|---|
| RA7 a)–g) | Herencia, superclase, subclase, modificadores, constructores, sobrescritura y jerarquías de clases. | 🔁 Se cubrió en la **U09** |
| RA7 h) | Se ha comentado y documentado el código. | ✅ Repaso interactivo y boletines |

> 📌 La **RA7** se apoya en la **U09** (herencia, CEs a–g). Esta unidad la desarrolla en su vertiente de **características avanzadas del lenguaje**: lambdas, interfaces funcionales, streams y `Optional`, los paquetes `java.util.function` y `java.util.stream`.

---

## 🚪 ¿Por dónde empiezo?

- ¿Vienes de la U11 y quieres lo esencial? → Arranca en el [punto 1](/ApuntesProgramacion/12-programacion-funcional/01-lambdas) y el [punto 2](/ApuntesProgramacion/12-programacion-funcional/02-interfaces-funcionales): las funciones que viajan solas.
- ¿Ya escribes lambdas y quieres flujos? → Ve directo al [punto 4](/ApuntesProgramacion/12-programacion-funcional/04-streams-basicos) y al [punto 5](/ApuntesProgramacion/12-programacion-funcional/05-streams-intermedias): la cinta transportadora.
- ¿Solo vienes a por los trucos? → Salta al [punto 3](/ApuntesProgramacion/12-programacion-funcional/03-referencias-metodos) (la drecera `::`) y al [punto 8](/ApuntesProgramacion/12-programacion-funcional/08-optional) (la caja que acepta la ausencia).
- ¿Vienes a repasar? → Haz el [Repaso interactivo](/ApuntesProgramacion/12-programacion-funcional/09-repaso-interactivo) y después los [boletines](/ApuntesProgramacion/boletines/boletin-u12-inicial).

**📍 Primer punto:** [01 · Lambdas: funciones que viajan solas](/ApuntesProgramacion/12-programacion-funcional/01-lambdas)  
**⏭️ Al acabar la unidad, continúa en [U13 · Ficheros y Regex](/ApuntesProgramacion/13-ficheros-regex).**