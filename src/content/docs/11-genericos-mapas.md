---
title: "U11 — Genéricos y Mapas"
description: "El <T> que lo cambió todo y la guía telefónica que lo asocia todo: genéricos, type erasure, wildcards, HashMap, TreeMap y elegir estructura 🗺️"
emoji: 🗺️
---

<p><small>El <T> que lo cambió todo y la guía telefónica que lo asocia todo: genéricos, type erasure, wildcards, HashMap, TreeMap y elegir estructura 🗺️</small></p>

> 🗺️ **El mapa del paquete:** 🚪 Bienvenida → ☕ U01 → 🔤 U02 → 🔀 U03 → 🅿️ U04 → 🧩 U05 → ⚡ U06 → 🏗️ U07 → 🔒 U08 → 🧬 U09 → 📚 U10 → **🗺️ AQUÍ ESTÁS (U11)** → 📁 U12 → 🗄️ U13 → 🌐 U14

---

En la U10 viste las colecciones: listas, conjuntos, iteradores y la clase `Collections`. Pero al declarar `ArrayList<String>` te quedaste con una pregunta en el aire: ¿qué es ese `<String>`? ¿Y por qué no puedo meter un `Integer` en una lista de Strings?

Hoy respondemos a todo eso y mucho más. Esta unidad tiene dos grandes superpoderes:

- **Genéricos (`<T>`):** el sistema que hace que el compilador se convierta en tu amigo. Descubrirás por qué antes de los genéricos programar era como hacer malabares con cuchillos vendado, cómo crear tus propias clases y métodos genéricos, el truco del diamante `<>` y el misterio del **type erasure**: el mago que hace desaparecer los tipos cuando compilas.
- **Mapas (`Map`):** la estructura para asociar una cosa con otra. `HashMap`, la guía telefónica que busca por nombre y te da el número en un santiamén; `TreeMap`, el que ordena las claves solo; y `LinkedHashMap`, el que recuerda el orden de llegada.

Y por el camino, el cierre perfecto del curso de estructuras de datos: **elegir bien** entre Map, List y Set según el problema, con el principio PECS de Joshua Bloch como mnemotecnia de los wildcards y el `getOrDefault()` como salvavidas de los `null`.

Esta unidad se lee como un **libro de 9 capítulos**: los 8 primeros puntos son teoría en progresión y el 9º es un aterrizaje práctico para machacar todo lo aprendido.

---

## 🎯 Objetivo de la unidad

Al terminar, serás capaz de:

- Explicar qué son los **genéricos** y por qué eliminan los castings a ciegas y las `ClassCastException`.
- Crear **clases genéricas** (`Caja<T>`, `Pareja<T, U>`) y **métodos genéricos** propios.
- Dominar el **diamante `<>`** y entender qué es el **type erasure** y qué implica en tiempo de ejecución.
- Usar **wildcards** (`? extends T`, `? super T`) aplicando el principio **PECS**.
- Usar **`HashMap`** para asociar claves con valores y recorrerlo de las tres formas (`keySet`, `values`, `entrySet`).
- Distinguir **`TreeMap`**, **`LinkedHashMap`** y saber cuándo usar cada uno.
- **Elegir entre Map, List y Set** según el orden, los duplicados y la velocidad que necesitas.

---

## 🗺️ Mapa de la unidad

| Punto | Qué aprenderás | Dificultad |
|---|---|---|
| [01 · Genéricos: el `<T>` que lo cambió todo](/ApuntesProgramacion/11-genericos-mapas/01-que-son-genericos) | El lío antes de los genéricos, el compilador como amigo y `ArrayList<T>` | Todos |
| [02 · Tu propia clase genérica: `Caja<T>`](/ApuntesProgramacion/11-genericos-mapas/02-clases-genericas) | Parámetros de tipo, las convenciones T/E/K/V/N y tu primera clase con huecos | Todos |
| [03 · El diamante `<>` y type erasure](/ApuntesProgramacion/11-genericos-mapas/03-diamante-type-erasure) | `new Caja<>()`, la inferencia y el mago que borra los tipos en el bytecode | Todos |
| [04 · Métodos genéricos: funciones para todo tipo](/ApuntesProgramacion/11-genericos-mapas/04-metodos-genericos) | El `<T>` antes del tipo de retorno, la inferencia y los límites con `Comparable` | Todos |
| [05 · Wildcards: `? extends T` y `? super T`](/ApuntesProgramacion/11-genericos-mapas/05-wildcards) | Covarianza, contravarianza y el principio PECS | Todos |
| [06 · HashMap: la guía telefónica](/ApuntesProgramacion/11-genericos-mapas/06-hashmap) | `put`, `get`, recorrer con `keySet`/`values`/`entrySet` y contar frecuencias | Todos |
| [07 · TreeMap, LinkedHashMap y otros mapas](/ApuntesProgramacion/11-genericos-mapas/07-treemap-otros-mapas) | Orden natural, orden de inserción, `firstKey`, `headMap`... | Todos |
| [08 · Map vs List vs Set: elige tu estructura](/ApuntesProgramacion/11-genericos-mapas/08-elegir-estructura-datos) | Las tres preguntas que deciden antes de escribir la primera línea | Todos |
| [09 · Repaso interactivo](/ApuntesProgramacion/11-genericos-mapas/09-repaso-interactivo) | Sé el Código, Fireside, Laboratorio, Crucigrama y más | Todos |

> 📖 **Flujo de lectura:** los 8 primeros puntos son teoría en progresión. El 9º es el aterrizaje práctico: léelo justo después del 8º y antes de abrir los boletines.

---

## 📝 Boletines de la unidad

> Practica con los pares del curso: empieza siempre por el resuelto para ver el estilo y luego intenta el por-resolver.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/boletines/boletin-u11-inicial-resuelto" class="elink">✅ Inicial resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u11-inicial" class="elink">🟢 Inicial por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u11-avanzado-resuelto" class="elink">💪 Avanzado resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u11-avanzado" class="elink">⭐ Avanzado por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u11-extras" class="elink">🔥 Extras</a>
</div>

---

## ✅ Criterios de evaluación cubiertos (RA6)

**RA6: Escribe programas que manipulen información, seleccionando y utilizando tipos avanzados de datos.**

| CE | Criterio | Dónde se cubre |
|---|---|---|
| RA6 b) | Se han reconocido las librerías de clases relacionadas con tipos avanzados de datos. | ✅ Puntos 6 y 7 |
| RA6 e) | Se han reconocido las características y ventajas de cada una de las colecciones de datos disponibles. | ✅ Punto 8 |
| RA6 f) | Se han creado clases y métodos genéricos. | ✅ Puntos 1, 2, 3, 4 y 5 |

> 📌 La **RA6** se completa con la **U04** (arrays, CE a), la **U10** (colecciones, CEs c, d y e) y la **U12** (regex y XML, CEs g, h e i). Esta unidad cubre los genéricos (CE f) y los mapas del paquete `java.util`.

---

## 🚪 ¿Por dónde empiezo?

- ¿Vienes de la U10 y quieres lo esencial? → Arranca en el [punto 1](/ApuntesProgramacion/11-genericos-mapas/01-que-son-genericos) y el [punto 2](/ApuntesProgramacion/11-genericos-mapas/02-clases-genericas): los genéricos de todos los días.
- ¿Ya usas genéricos y quieres mapas? → Ve directo al [punto 6](/ApuntesProgramacion/11-genericos-mapas/06-hashmap) y al [punto 7](/ApuntesProgramacion/11-genericos-mapas/07-treemap-otros-mapas): la guía telefónica.
- ¿Solo vienes a por los trucos? → Salta al [punto 3](/ApuntesProgramacion/11-genericos-mapas/03-diamante-type-erasure) (el diamante y el type erasure) y al [punto 5](/ApuntesProgramacion/11-genericos-mapas/05-wildcards) (los wildcards).
- ¿Vienes a repasar? → Haz el [Repaso interactivo](/ApuntesProgramacion/11-genericos-mapas/09-repaso-interactivo) y después los [boletines](/ApuntesProgramacion/boletines/boletin-u11-inicial).

**📍 Primer punto:** [01 · Genéricos: el `<T>` que lo cambió todo](/ApuntesProgramacion/11-genericos-mapas/01-que-son-genericos)  
**⏭️ Al acabar la unidad, continúa en [U12 · Ficheros y Regex](/ApuntesProgramacion/12-ficheros-regex).**