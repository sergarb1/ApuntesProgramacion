---
title: "U09 — Arrays y Colecciones"
description: "El parking de datos que crece, se ordena y nunca se queda sin plazas: arrays, ArrayList, HashSet y mucho más 📚"
emoji: 📚
---

<p><small>El parking de datos que crece, se ordena y nunca se queda sin plazas: arrays, ArrayList, HashSet y mucho más 📚</small></p>

> 🗺️ **El mapa del paquete:** 🚪 Bienvenida → ☕ U01 → 🔤 U02 → 🔀 U03 → 🧩 Fundamentos → ⚡ Técnicas → 🏗️ POO → 🔒 Visibilidad → 🧬 Herencia → **📚 AQUÍ ESTÁS (U09)** → 🗺️ Genéricos → 📁 Ficheros → 🗄️ JDBC → 🌐 APIs

---

Bienvenido a la unidad donde tus datos por fin tienen sitio. Hasta ahora guardabas variables sueltas: `nombre`, `edad`, `precio`... Cada una en su cajita. Pero ¿qué haces cuando tienes 100 gatos, 30 notas de alumnos o un tablero de 5x5 que esconde minas? ¿Declaras 100 variables? ¿`gato1`, `gato2`, `gato3`...? En algún lugar del mundo, un programador senior acaba de llorar.

Esta unidad tiene dos mitades que bailan juntas:

- **Arrays:** el bloque de pisos de los datos. Aprendes a declarar un aparcamiento con `new`, a meter y sacar coches por índice y a recorrerlo con `for` y `for-each`. También verás su talón de Aquiles: el **tamaño fijo**. Una vez construido, no crece ni se encoge.
- **Colecciones:** cuando el aparcamiento se queda pequeño, llega el Java Collections Framework. `ArrayList` (crece solo), `LinkedList` (la conga line), `HashSet` (el portero sin duplicados) y `TreeSet` (el organizado). Y con ellos, `Iterator` para recorrerlos y la clase `Collections` para ordenarlos y revolverlos a tu antojo.

En el camino descubrirás por qué `length` va sin paréntesis pero `size()` va con ellos, por qué `ArrayList` no puede guardar `int` a pelo (aunque parezca que sí) y qué le pasa a tu lista si intentas borrar elementos mientras la recorres con un `for-each`. Spoiler: `ConcurrentModificationException`.

Esta unidad se lee como un **libro de 9 capítulos**: los 8 primeros puntos son teoría en progresión y el 9º es un aterrizaje práctico para machacar todo lo aprendido.

---

## 🎯 Objetivo de la unidad

Al terminar, serás capaz de:

- Declarar y recorrer **arrays** unidimensionales y multidimensionales.
- Usar el bucle **for-each** para leer colecciones sin índice.
- Dominar la clase **Arrays** (`toString`, `sort`, `copyOf`, `binarySearch`, `fill`).
- Pasar arrays a métodos y entender el **paso por referencia**.
- Elegir la colección adecuada: **ArrayList, LinkedList, HashSet y TreeSet**.
- Utilizar **iteradores** para recorrer y modificar colecciones sin miedo a `ConcurrentModificationException`.
- Aplicar los métodos utilitarios de **Collections** (`sort`, `reverse`, `max`, `min`...).
- Saber cuándo un array es mejor que una colección y viceversa.

---

## 🗺️ Mapa de la unidad

| Punto | Qué aprenderás | Dificultad |
|---|---|---|
| [01 · Arrays: el aparcamiento de datos](/ApuntesProgramacion/09-arrays-colecciones/01-arrays-basicos) | Declaración, índices y el primer BOOM: la `ArrayIndexOutOfBoundsException` | Todos |
| [02 · Recorrer arrays: for y for-each](/ApuntesProgramacion/09-arrays-colecciones/02-recorrer-arrays) | El dúo inseparable y la variante perezosa que solo lee | Todos |
| [03 · Arrays multidimensionales](/ApuntesProgramacion/09-arrays-colecciones/03-arrays-multidimensionales) | El parking de varias plantas y cómo recorrerlo con bucles anidados | Todos |
| [04 · La clase Arrays: tu navaja suiza](/ApuntesProgramacion/09-arrays-colecciones/04-clase-arrays) | `toString`, `sort`, `copyOf`, `binarySearch` y `fill` | Todos |
| [05 · Arrays y métodos](/ApuntesProgramacion/09-arrays-colecciones/05-arrays-metodos) | Pasando el testigo: los arrays viajan por referencia | Todos |
| [06 · ArrayList y el Java Collections Framework](/ApuntesProgramacion/09-arrays-colecciones/06-arraylist-jcf) | El parking que crece solo y la familia `java.util` | Todos |
| [07 · LinkedList, HashSet y TreeSet](/ApuntesProgramacion/09-arrays-colecciones/07-linkedlist-hashset) | La conga line, el portero sin duplicados y el organizado | Todos |
| [08 · Iterator y la clase Collections](/ApuntesProgramacion/09-arrays-colecciones/08-iterator-collections) | El camarero que toma nota y la navaja suiza de las colecciones | Todos |
| [09 · Repaso interactivo](/ApuntesProgramacion/09-arrays-colecciones/09-repaso-interactivo) | Sé el Código, Fireside, Laboratorio, Crucigrama y más | Todos |

> 📖 **Flujo de lectura:** los 8 primeros puntos son teoría en progresión. El 9º es el aterrizaje práctico: léelo justo después del 8º y antes de abrir los boletines.

---

## 📝 Boletines de la unidad

> Practica con los pares del curso: empieza siempre por el resuelto para ver el estilo y luego intenta el por-resolver.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/boletines/boletin-u09-inicial-resuelto" class="elink">✅ Inicial resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u09-inicial" class="elink">🟢 Inicial por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u09-avanzado-resuelto" class="elink">💪 Avanzado resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u09-avanzado" class="elink">⭐ Avanzado por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u09-extras" class="elink">🔥 Extras</a>
</div>

---

## ✅ Criterios de evaluación cubiertos (RA6)

**RA6: Escribe programas que manipulen información, seleccionando y utilizando tipos avanzados de datos.**

| CE | Criterio | Dónde se cubre |
|---|---|---|
| RA6 a) | Se han escrito programas que utilicen arrays. | ✅ Puntos 1, 2 y 3 |
| RA6 b) | Se han reconocido las librerías de clases relacionadas con tipos de datos avanzados. | ✅ Puntos 4 y 6 |
| RA6 c) | Se han utilizado listas para almacenar y procesar información. | ✅ Puntos 6 y 7 |
| RA6 d) | Se han utilizado iteradores para recorrer los elementos de las listas. | ✅ Punto 8 |
| RA6 e) | Se han reconocido las características y ventajas de cada una de las colecciones de datos disponibles. | ✅ Puntos 7 y 8 |

> 📌 Los **genéricos** (RA6 f) tienen su capítulo propio en la **U10**, y las **expresiones regulares** (RA6 g) y los documentos **XML** (RA6 h e i) florecen en la **U11**. Aquí nos quedamos con los tipos avanzados que dan de comer: arrays y colecciones.

---

## 🚪 ¿Por dónde empiezo?

- ¿Cero conocimientos? → Arranca en el [punto 1](/ApuntesProgramacion/09-arrays-colecciones/01-arrays-basicos). Solo necesitas variables y bucles, que ya viste en la U02 y la U03.
- ¿Ya te mueves con los arrays y quieres chicha? → Ve directo al [punto 6](/ApuntesProgramacion/09-arrays-colecciones/06-arraylist-jcf): ahí empiezan las colecciones.
- ¿Solo vienes a por las colecciones? → Salta al [punto 6](/ApuntesProgramacion/09-arrays-colecciones/06-arraylist-jcf) y al [punto 7](/ApuntesProgramacion/09-arrays-colecciones/07-linkedlist-hashset).
- ¿Vienes a repasar? → Haz el [Repaso interactivo](/ApuntesProgramacion/09-arrays-colecciones/09-repaso-interactivo) y después los [boletines](/ApuntesProgramacion/boletines/boletin-u09-inicial).

**📍 Primer punto:** [01 · Arrays: el aparcamiento de datos](/ApuntesProgramacion/09-arrays-colecciones/01-arrays-basicos)  
**⏭️ Al acabar la unidad, continúa en [U10 · Genéricos y Mapas](/ApuntesProgramacion/10-genericos-mapas).