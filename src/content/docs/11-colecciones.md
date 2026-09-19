---
title: "U11 — Colecciones, genéricos y mapas"
description: "El parking que crece, el portero sin duplicados, el `<T>` que lo cambia todo y la guía telefónica: ArrayList, Set, genéricos y HashMap en una sola unidad 📚"
emoji: 📚
---

<p><small>El parking que crece, el portero sin duplicados, el `<T>` que lo cambia todo y la guía telefónica: ArrayList, Set, genéricos y HashMap en una sola unidad 📚</small></p>

---

En la U05 viste los arrays: tamaño fijo, acceso por índice y bastante trabajo manual para crecer o encoger. Hoy eso se acaba. Las **colecciones** de Java son las estructuras de datos con superpoderes: crecen solas, se encogen solas, rechazan duplicados si quieres, se ordenan automáticamente y se recorren sin que te importe cómo están construidas por dentro.

Y esta unidad va más allá: después de dominar las colecciones, levantaremos el capó del `<String>` que llevas escribiendo desde hace semanas. Los **genéricos** explican por qué el compilador te fía de tus listas, y los **mapas** (`HashMap`, `TreeMap`) te dan la estructura que más se usa en Java real: asociar una clave con un valor.

Esta unidad tiene cuatro grandes actos:

- **Listas (`List`):** `ArrayList`, el parking que crece solo, y `LinkedList`, la conga que encadena a sus elementos y brilla en colas y pilas.
- **Conjuntos (`Set`):** `HashSet`, el portero que no deja entrar duplicados; `TreeSet`, el que los ordena solos; y `LinkedHashSet`, el que recuerda el orden de llegada.
- **Genéricos:** de dónde sale el `<T>`, tu propia clase genérica, el diamante `<>`, el type erasure y el principio PECS.
- **Mapas (`Map`):** `HashMap`, la guía telefónica de Java; `TreeMap`, el que ordena sus claves; y la guía definitiva para elegir estructura.

Esta unidad se lee como un **libro de 9 capítulos**: los 8 primeros puntos son teoría en progresión y el 9º es un aterrizaje práctico para machacar todo lo aprendido.

---

## 🎯 Objetivo de la unidad

Al terminar, serás capaz de:

- Usar **`ArrayList`** para guardar listas dinámicas y distinguir **`remove(índice)`** de **`remove(objeto)`**.
- Aplicar **`LinkedList`** para colas (FIFO) y pilas (LIFO).
- Eliminar duplicados con **`HashSet`** y entender por qué `hashCode()` y `equals()` van siempre juntos.
- Ordenar y mantener el orden con **`TreeSet`** y **`LinkedHashSet`**.
- Recorrer cualquier colección con **`Iterator`** y borrar durante el recorrido sin excepción.
- Manipular listas con la clase **`Collections`** (`sort`, `reverse`, `shuffle`, `max`, `min`, `frequency`).
- Crear tus **clases y métodos genéricos** con `<T>`, límites y wildcards.
- Guardar y buscar parejas clave → valor con **`HashMap`** y **`TreeMap`**.
- **Elegir la estructura adecuada** (List, Set o Map) para cada problema.

---

## 🗺️ Mapa de la unidad

| Punto | Qué aprenderás | Dificultad |
|---|---|---|
| [01 · ArrayList y el Java Collections Framework](/ApuntesProgramacion/11-colecciones/01-arraylist-jcf) | El parking que crece solo, la familia `java.util` y por qué no guarda `int` a pelo | Todos |
| [02 · LinkedList: la conga line](/ApuntesProgramacion/11-colecciones/02-linkedlist) | La lista enlazada, colas FIFO, pilas LIFO y sus métodos de extremos | Todos |
| [03 · HashSet, TreeSet y LinkedHashSet: los conjuntos](/ApuntesProgramacion/11-colecciones/03-conjuntos-sets) | El porter sin duplicados, el que ordena solo y el que recuerda el orden de llegada | Todos |
| [04 · Iterator y Collections](/ApuntesProgramacion/11-colecciones/04-iterator-collections) | Borrar mientras recorres y la navaja suiza de las colecciones | Todos |
| [05 · Clases genéricas: tu propia `Caja<T>`](/ApuntesProgramacion/11-colecciones/05-clases-genericas) | De dónde sale el `<String>`, convenciones T/E/K/V y tu primera clase genérica | Todos |
| [06 · El diamante, métodos genéricos y wildcards](/ApuntesProgramacion/11-colecciones/06-genericos-avanzado) | Type erasure, inferencia, límites y el principio PECS | Todos |
| [07 · HashMap: la guía telefónica](/ApuntesProgramacion/11-colecciones/07-hashmap) | Clave → valor, `get`, `put`, `containsKey` y recorrer mapas | Todos |
| [08 · TreeMap y cómo elegir estructura](/ApuntesProgramacion/11-colecciones/08-treemap-elegir-estructura) | Mapas ordenados, `LinkedHashMap` y Map vs List vs Set | Todos |
| [09 · Repaso interactivo](/ApuntesProgramacion/11-colecciones/09-repaso-interactivo) | Sé el Código, Fireside, Laboratorio, Crucigrama y más | Todos |

> 📖 **Flujo de lectura:** los 8 primeros puntos son teoría en progresión. El 9º es el aterrizaje práctico: léelo justo después del 8º y antes de abrir los boletines.

---

## 📝 Boletines de la unidad

> Practica con los pares del curso: intenta primero el por-resolver y comprueba con el resuelto cuando hayas terminado.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/boletines/boletin-u11-inicial" class="elink">🟢 Inicial por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u11-inicial-resuelto" class="elink">✅ Inicial resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u11-avanzado" class="elink">⭐ Avanzado por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u11-avanzado-resuelto" class="elink">💪 Avanzado resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u11-extras" class="elink">🔥 Extras</a>
</div>

---

## ✅ Criterios de evaluación cubiertos (RA6)

**RA6: Escribe programas que manipulen información, seleccionando y utilizando tipos avanzados de datos.**

| CE | Criterio | Dónde se cubre |
|---|---|---|
| RA6 b) | Se han reconocido las librerías de clases relacionadas con tipos de datos avanzados. | ✅ Puntos 1, 7 y 8 |
| RA6 c) | Se han utilizado listas para almacenar y procesar información. | ✅ Puntos 1, 2 y 9 |
| RA6 d) | Se han utilizado iteradores para recorrer los elementos de las listas. | ✅ Puntos 4 y 9 |
| RA6 e) | Se han reconocido las características y ventajas de cada una de las colecciones de datos disponibles. | ✅ Puntos 3, 7 y 8 |
| RA6 f) | Se han utilizado tipos enumeradores, estructuras dinámicas de datos y clases genéricas. | ✅ Puntos 5, 6, 7 y 8 |

> 📌 La **RA6** se completa con la **U05** (arrays, CE a) y la **U13** (regex y XML, CEs g, h e i). Esta unidad cubre colecciones, genéricos y mapas: la librería `java.util` entera.

---

## 🚪 ¿Por dónde empiezo?

- ¿Vienes de la U10 y quieres lo esencial? → Arranca en el [punto 1](/ApuntesProgramacion/11-colecciones/01-arraylist-jcf) y el [punto 2](/ApuntesProgramacion/11-colecciones/02-linkedlist): las listas de todos los días.
- ¿Ya usas listas y quieres conjuntos? → Ve directo al [punto 3](/ApuntesProgramacion/11-colecciones/03-conjuntos-sets): duplicados fuera.
- ¿Te pica la curiosidad del `<T>`? → Salta al [punto 5](/ApuntesProgramacion/11-colecciones/05-clases-genericas) y al [punto 6](/ApuntesProgramacion/11-colecciones/06-genericos-avanzado): genéricos de cabo a rabo.
- ¿Quieres mapas? → [Punto 7](/ApuntesProgramacion/11-colecciones/07-hashmap) y [punto 8](/ApuntesProgramacion/11-colecciones/08-treemap-elegir-estructura): la guía telefónica y el mapa de decisión.
- ¿Vienes a repasar? → Haz el [Repaso interactivo](/ApuntesProgramacion/11-colecciones/09-repaso-interactivo) y después los [boletines](/ApuntesProgramacion/boletines/boletin-u11-inicial).

**📍 Primer punto:** [01 · ArrayList y el Java Collections Framework](/ApuntesProgramacion/11-colecciones/01-arraylist-jcf)  
**⏭️ Al acabar la unidad, continúa en [U12 · Programación Funcional](/ApuntesProgramacion/12-programacion-funcional).**
