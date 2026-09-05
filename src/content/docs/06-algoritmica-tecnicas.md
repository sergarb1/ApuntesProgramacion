---
title: "U06 — Algorítmica II: Técnicas"
description: "Recursividad, divide y vencerás, Quicksort y Mergesort: las técnicas que hacen que tu código piense ⚡"
emoji: ⚡
---

<p><small>Recursividad, divide y vencerás, Quicksort y Mergesort: las técnicas que hacen que tu código piense ⚡</small></p>

> 🗺️ **El mapa del paquete:** 🚪 Bienvenida → ☕ U01 → 🔤 U02 → 🔀 U03 → 🅿️ U04 → 🧩 U05 → **⚡ AQUÍ ESTÁS (U06)** → 🏗️ U07 → 🔒 U08 → 🧬 U09 → 📚 U10 → 🗺️ U11 → 📁 U12 → 🗄️ U13 → 🌐 U14

---

Bienvenido, valiente explorador del stack de llamadas. En la U05 dominaste el arte de buscar y ordenar con bucles: búsqueda lineal, binaria, burbuja e inserción. Aprendiste a medir algoritmos con Big O y a no usar jamás burbuja en producción (lo prometiste). Pero los bucles se quedan cortos cuando el problema es *inherentemente* jerárquico. Y aquí es donde la programación se vuelve elegante.

Esta unidad es la que **te cambia la forma de pensar**. Vas a hacer que una función se llame a sí misma (sin volverte loco), vas a partir problemas por la mitad hasta hacerlos triviales, y vas a conocer a los dos reyes de la ordenación moderna: **Quicksort** y **Mergesort**. Cuando termines, verás recursividad por todas partes. Es como aprender una palabra nueva: de repente, la encuentras en cada esquina del código.

Respira hondo. Y recuerda: para entender la recursividad, primero tienes que entender la recursividad.

---

## 🎯 Objetivo de la unidad

Al terminar, serás capaz de:

- Escribir funciones **recursivas** con caso base y caso recursivo, y razonar sobre la **pila de llamadas**.
- Implementar los clásicos: **factorial**, **Fibonacci** (ingenuo y con memoización), **palíndromos** y **torres de Hanói**.
- Aplicar la estrategia **divide y vencerás**: dividir, conquistar y combinar.
- Implementar **Quicksort** entendiendo la partición, el pivote y sus complejidades.
- Implementar **Mergesort** entendiendo la fusión y la estabilidad.
- **Elegir con criterio** el algoritmo de ordenación según el contexto (tamaño, orden previo, memoria, estabilidad).
- Reconocer otras técnicas como los algoritmos **voraces** (greedy) y el **backtracking**.

---

## 🗺️ Mapa de la unidad

| Punto | Qué aprenderás | Dificultad |
|---|---|---|
| [01 · Recursividad](/ApuntesProgramacion/06-algoritmica-tecnicas/01-recursividad) | Caso base, caso recursivo, la pila de llamadas y el miedo al `StackOverflowError` | Todos |
| [02 · Recursividad: ejemplos clásicos](/ApuntesProgramacion/06-algoritmica-tecnicas/02-recursividad-ejemplos-clasicos) | Factorial, Fibonacci, palíndromos y torres de Hanói | Todos |
| [03 · Divide y vencerás](/ApuntesProgramacion/06-algoritmica-tecnicas/03-divide-y-venceras) | Dividir, conquistar y combinar: el patrón de Julio César | Todos |
| [04 · Quicksort](/ApuntesProgramacion/06-algoritmica-tecnicas/04-quicksort) | Partición, pivote, complejidades y por qué es tan famoso | Todos |
| [05 · Mergesort](/ApuntesProgramacion/06-algoritmica-tecnicas/05-mergesort) | División por la mitad, fusión y estabilidad | Todos |
| [06 · Comparación: cuándo usar cada ordenación](/ApuntesProgramacion/06-algoritmica-tecnicas/06-comparacion-ordenacion) | Guía práctica para elegir algoritmo y qué hay bajo `Arrays.sort()` | Todos |
| [07 · Be the Code: quicksort desde cero](/ApuntesProgramacion/06-algoritmica-tecnicas/07-be-the-code-quicksort) | Implementar Quicksort y Mergesort paso a paso, sin mirar | ⭐⭐⭐ |
| [08 · Otras técnicas algorítmicas](/ApuntesProgramacion/06-algoritmica-tecnicas/08-otras-tecnicas-algoritmicas) | Algoritmos voraces (greedy) y backtracking | ⭐⭐⭐ |
| [09 · Repaso interactivo](/ApuntesProgramacion/06-algoritmica-tecnicas/09-repaso-interactivo) | Sé el Código, Fireside, Laboratorio, Crucigrama y más | Todos |

> 📖 **Flujo de lectura:** los 8 primeros puntos son teoría y práctica en progresión. El 9º es el aterrizaje final: léelo justo después del 8º y antes de abrir los boletines.

---

## 📝 Boletines de la unidad

> Practica con los pares del curso: empieza siempre por el resuelto para ver el estilo y luego intenta el por-resolver.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/boletines/boletin-u06-inicial-resuelto" class="elink">✅ Inicial resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u06-inicial" class="elink">🟢 Inicial por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u06-avanzado-resuelto" class="elink">💪 Avanzado resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u06-avanzado" class="elink">⭐ Avanzado por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u06-extras" class="elink">🔥 Extras</a>
</div>

---

## ✅ Criterios de evaluación cubiertos (RA2 + RA6)

**RA2: Escribe y prueba programas sencillos, reconociendo y aplicando los fundamentos de la programación orientada a objetos.**

**RA6: Escribe programas que manipulen información, seleccionando y utilizando tipos avanzados de datos.**

| CE | Criterio | Dónde se cubre |
|---|---|---|
| RA2 b) | Se han escrito programas simples. | ✅ Todos |
| RA2 e) | Se han escrito llamadas a métodos estáticos. | ✅ Puntos 1-7 |
| RA2 f) | Se han utilizado parámetros en la llamada a métodos. | ✅ Puntos 1-8 |
| RA2 i) | Se ha utilizado el entorno integrado de desarrollo en la creación y compilación de programas simples. | ✅ Todos |
| RA6 a) | Se han escrito programas que utilicen arrays. | ✅ Puntos 3-8 |
| RA6 b) | Se han reconocido las librerías de clases relacionadas con tipos de datos avanzados. | ✅ Puntos 4, 5 y 6 |

> 📌 La recursividad de los puntos 1 y 2 es la semilla de las **estructuras jerárquicas** (árboles, grafos) que explorarás con más profundidad en el módulo de Estructuras de Datos. Y la elección justificada de algoritmo del punto 6 es, directamente, un RA6 en estado puro: *seleccionar* el tipo de procesamiento adecuado a los datos.

---

## 🚪 ¿Por dónde empiezo?

- ¿Vienes de la U05 y estás fresco de Big O? → Arranca en el [punto 1](/ApuntesProgramacion/06-algoritmica-tecnicas/01-recursividad). Solo necesitas lo que viste en Fundamentos.
- ¿Lo tuyo es ver el resultado y no las tripas? → Salta al [punto 4](/ApuntesProgramacion/06-algoritmica-tecnicas/04-quicksort) y al [punto 5](/ApuntesProgramacion/06-algoritmica-tecnicas/05-mergesort) y vuelve después a la teoría de la recursividad.
- ¿Te flipan los retos? → Haz el [punto 7](/ApuntesProgramacion/06-algoritmica-tecnicas/07-be-the-code-quicksort) sin mirar el código de los puntos 4 y 5. Sufre con honor.
- ¿Vienes a repasar? → Haz el [Repaso interactivo](/ApuntesProgramacion/06-algoritmica-tecnicas/09-repaso-interactivo) y después los [boletines](/ApuntesProgramacion/boletines/boletin-u06-inicial).

**📍 Primer punto:** [01 · Recursividad](/ApuntesProgramacion/06-algoritmica-tecnicas/01-recursividad)  
**⏭️ Al acabar la unidad, continúa en [U07 · POO: Clases y Objetos](/ApuntesProgramacion/07-poo-clases-objetos).**
