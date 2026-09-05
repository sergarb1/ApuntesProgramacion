---
title: "U10 — Colecciones"
description: "El parking que crece, la conga que encadena, el portero sin duplicados y el camarero que lo recorre todo: ArrayList, LinkedList, Set, Iterator y Collections 📚"
emoji: 📚
---

<p><small>El parking que crece, la conga que encadena, el portero sin duplicados y el camarero que lo recorre todo: ArrayList, LinkedList, Set, Iterator y Collections 📚</small></p>

> 🗺️ **El mapa del paquete:** 🚪 Bienvenida → ☕ U01 → 🔤 U02 → 🔀 U03 → 🅿️ U04 → 🧩 U05 → ⚡ U06 → 🏗️ U07 → 🔒 U08 → 🧬 U09 → **📚 AQUÍ ESTÁS (U10)** → 🗺️ U11 → 📁 U12 → 🗄️ U13 → 🌐 U14

---

En la U04 viste los arrays: tamaño fijo, acceso por índice y bastante trabajo manual para crecer o encoger. Hoy eso se acaba. Las **colecciones** de Java son como las estructuras de datos con superpoderes: crecen solas, se encogen solas, rechazan duplicados si quieres, se ordenan automáticamente y se recorren sin que te importe cómo están construidas por dentro.

Esta unidad tiene tres grandes actos:

- **Listas (`List`):** `ArrayList`, el parking que crece solo, y `LinkedList`, la conga que encadena a sus elementos y brilla en colas y pilas.
- **Conjuntos (`Set`):** `HashSet`, el portero que no deja entrar duplicados; `TreeSet`, el que los ordena solos; y `LinkedHashSet`, el que recuerda el orden de llegada.
- **Herramientas:** el `Iterator`, el camarero que recorre cualquier colección y borra sin romper nada, y la clase `Collections`, la navaja suiza que ordena, revuelve y consulta en una línea.

Por el camino descubrirás la diferencia entre borrar por índice y borrar por valor, por qué `HashSet` y `TreeSet` no se llevan bien con los `null` igual, y por qué borrar un elemento dentro de un `for-each` es la forma más rápida de ganarte una `ConcurrentModificationException`.

Esta unidad se lee como un **libro de 9 capítulos**: los 8 primeros puntos son teoría en progresión y el 9º es un aterrizaje práctico para machacar todo lo aprendido.

---

## 🎯 Objetivo de la unidad

Al terminar, serás capaz de:

- Usar **`ArrayList`** para guardar listas dinámicas y elegir entre `size()`, `length` y `length()` sin equivocarte.
- Distinguir **`remove(índice)`** de **`remove(objeto)`** y explicar el lío de los `Integer`.
- Aplicar **`LinkedList`** para colas (FIFO) y pilas (LIFO).
- Eliminar duplicados con **`HashSet`** y entender por qué `hashCode()` y `equals()` van siempre juntos.
- Ordenar y mantener el orden con **`TreeSet`** y **`LinkedHashSet`**.
- Recorrer cualquier colección con **`Iterator`** y borrar durante el recorrido sin excepción.
- Manipular listas con la clase **`Collections`** (`sort`, `reverse`, `shuffle`, `max`, `min`, `frequency`).
- **Elegir la colección adecuada** para cada problema según el orden, los duplicados y la velocidad.

---

## 🗺️ Mapa de la unidad

| Punto | Qué aprenderás | Dificultad |
|---|---|---|
| [01 · ArrayList y el Java Collections Framework](/ApuntesProgramacion/10-colecciones/01-arraylist-jcf) | El parking que crece solo, la familia `java.util` y por qué no guarda `int` a pelo | Todos |
| [02 · LinkedList: la conga line](/ApuntesProgramacion/10-colecciones/02-linkedlist) | La lista enlazada, colas FIFO, pilas LIFO y sus métodos de extremos | Todos |
| [03 · HashSet: el portero sin duplicados](/ApuntesProgramacion/10-colecciones/03-hashset) | Sin repetidos, sin orden y O(1): `hashCode()` y `equals()` en acción | Todos |
| [04 · TreeSet y LinkedHashSet](/ApuntesProgramacion/10-colecciones/04-treeset-linkedhashset) | El que ordena solo y el que recuerda el orden de llegada | Todos |
| [05 · Iterator: el camarero que toma nota](/ApuntesProgramacion/10-colecciones/05-iterator) | Recorrer cualquier colección y borrar durante el recorrido sin `ConcurrentModificationException` | Todos |
| [06 · La clase Collections: la navaja suiza](/ApuntesProgramacion/10-colecciones/06-collections) | `sort`, `reverse`, `shuffle`, `max`, `min`, `frequency`... en una línea | Todos |
| [07 · Elegir la colección adecuada](/ApuntesProgramacion/10-colecciones/07-elegir-coleccion) | Orden, duplicados y velocidad: las tres preguntas que deciden | Todos |
| [08 · Be the Code: colecciones en acción](/ApuntesProgramacion/10-colecciones/08-be-the-code) | Predice la salida, caza el bug y elige la colección a ojo | Todos |
| [09 · Repaso interactivo](/ApuntesProgramacion/10-colecciones/09-repaso-interactivo) | Sé el Código, Fireside, Laboratorio, Crucigrama y más | Todos |

> 📖 **Flujo de lectura:** los 8 primeros puntos son teoría en progresión. El 9º es el aterrizaje práctico: léelo justo después del 8º y antes de abrir los boletines.

---

## 📝 Boletines de la unidad

> Practica con los pares del curso: empieza siempre por el resuelto para ver el estilo y luego intenta el por-resolver.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/boletines/boletin-u10-inicial-resuelto" class="elink">✅ Inicial resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u10-inicial" class="elink">🟢 Inicial por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u10-avanzado-resuelto" class="elink">💪 Avanzado resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u10-avanzado" class="elink">⭐ Avanzado por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u10-extras" class="elink">🔥 Extras</a>
</div>

---

## ✅ Criterios de evaluación cubiertos (RA6)

**RA6: Escribe programas que manipulen información, seleccionando y utilizando tipos avanzados de datos.**

| CE | Criterio | Dónde se cubre |
|---|---|---|
| RA6 b) | Se han reconocido las librerías de clases relacionadas con tipos de datos avanzados. | ✅ Puntos 1 y 7 |
| RA6 c) | Se han utilizado listas para almacenar y procesar información. | ✅ Puntos 1, 2 y 8 |
| RA6 d) | Se han utilizado iteradores para recorrer los elementos de las listas. | ✅ Puntos 5 y 9 |
| RA6 e) | Se han reconocido las características y ventajas de cada una de las colecciones de datos disponibles. | ✅ Puntos 3, 4 y 7 |

> 📌 La **RA6** se completa con la **U04** (arrays, CE a), la **U11** (genéricos y mapas, CE f) y la **U12** (regex y XML, CEs g, h e i). Esta unidad cubre el corazón de las colecciones: listas, conjuntos, iteradores y la librería `java.util`.

---

## 🚪 ¿Por dónde empiezo?

- ¿Vienes de la U09 y quieres lo esencial? → Arranca en el [punto 1](/ApuntesProgramacion/10-colecciones/01-arraylist-jcf) y el [punto 2](/ApuntesProgramacion/10-colecciones/02-linkedlist): las listas de todos los días.
- ¿Ya usas listas y quieres conjuntos? → Ve directo al [punto 3](/ApuntesProgramacion/10-colecciones/03-hashset) y al [punto 4](/ApuntesProgramacion/10-colecciones/04-treeset-linkedhashset): duplicados fuera.
- ¿Solo vienes a por los trucos? → Salta al [punto 5](/ApuntesProgramacion/10-colecciones/05-iterator) (borrar mientras recorres) y al [punto 7](/ApuntesProgramacion/10-colecciones/07-elegir-coleccion) (elegir bien).
- ¿Vienes a repasar? → Haz el [Repaso interactivo](/ApuntesProgramacion/10-colecciones/09-repaso-interactivo) y después los [boletines](/ApuntesProgramacion/boletines/boletin-u10-inicial).

**📍 Primer punto:** [01 · ArrayList y el Java Collections Framework](/ApuntesProgramacion/10-colecciones/01-arraylist-jcf)  
**⏭️ Al acabar la unidad, continúa en [U11 · Genéricos y Mapas](/ApuntesProgramacion/11-genericos-mapas).