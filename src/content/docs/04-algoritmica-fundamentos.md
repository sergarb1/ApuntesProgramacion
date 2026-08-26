---
title: "U04 — Algorítmica I: Fundamentos"
description: "Recetas, diccionarios, cartas y burbujas: los algoritmos que ordenan y buscan por ti 🧩"
emoji: 🧩
---

<p><small>Recetas, diccionarios, cartas y burbujas: los algoritmos que ordenan y buscan por ti 🧩</small></p>

> 🗺️ **El mapa del paquete:** 🚪 Bienvenida → ☕ U01 → 🔤 Variables → 🔀 Control → **🧩 AQUÍ ESTÁS (U04)** → ⚡ Técnicas → 🏗️ POO → 🔒 Visibilidad → 🧬 Herencia → 📚 Colecciones → 🗺️ Genéricos → 📁 Ficheros → 🗄️ JDBC → 🌐 APIs

---

Bienvenido a la cocina del programador. En la U03 tus programas aprendieron a **decidir** y a **repetir**, pero repetir por repetir es hacer footing sin rumbo: corres, pero no llegas a ninguna parte. Esta es la unidad donde el rumbo aparece: vas a aprender los **algoritmos clásicos** que ordenan y buscan datos, y la herramienta para saber si uno es rápido o lento de solemnidad: la **notación Big O**.

Piensa en lo que haces cada día sin darte cuenta. Buscas la palabra "merienda" en el diccionario (y no abres por la página 1, sino por la mitad). Ordenas las cartas en tu mano para el póker. Buscas tus zapatillas perdidas revisando la habitación. Pues todo eso, llevado a Java, es esta unidad: **búsqueda lineal**, **búsqueda binaria**, **ordenación burbuja**, **ordenación por inserción** y el arte de elegir cuál usar.

Y, como siempre, CONRAD el compilador estará por aquí para recordarte que un algoritmo mal pensado es como una tortilla sin sal: se puede comer, pero no deberías.

Esta unidad se lee como un **libro de 9 capítulos**: los 8 primeros puntos son teoría en progresión y el 9º es un aterrizaje práctico para machacar todo lo aprendido.

---

## 🎯 Objetivo de la unidad

Al terminar, serás capaz de:

- Explicar **qué es un algoritmo**, sus propiedades y la diferencia entre la *idea* y el *código*.
- Buscar elementos en un array con **búsqueda lineal** (O(n)) y saber cuándo conviene.
- Buscar en arrays **ordenados** con **búsqueda binaria** (O(log n)), sin morir en el intento (ni en el off-by-one).
- Ordenar arrays con **burbuja** (el patoso) y con **inserción** (el de las cartas), y saber sus límites.
- Analizar la **complejidad algorítmica** con notación Big O y simplificar con las reglas de oro.
- **Elegir el algoritmo adecuado** según el tamaño, el orden inicial y la situación.
- Escribir búsqueda binaria y burbuja **a mano**, sin mirar apuntes (sí, como en las entrevistas de trabajo).

---

## 🗺️ Mapa de la unidad

| Punto | Qué aprenderás | Dificultad |
|---|---|---|
| [01 · Qué es un algoritmo](/ApuntesProgramacion/04-algoritmica-fundamentos/01-que-es-algoritmo) | Definir algoritmo, sus propiedades y la receta de la tortilla | Todos |
| [02 · Búsqueda lineal](/ApuntesProgramacion/04-algoritmica-fundamentos/02-busqueda-lineal) | Recorrer el array buscando un elemento, O(n) | Todos |
| [03 · Búsqueda binaria](/ApuntesProgramacion/04-algoritmica-fundamentos/03-busqueda-binaria) | Dividir y vencer: descartar mitades, O(log n) | Todos |
| [04 · Ordenación burbuja](/ApuntesProgramacion/04-algoritmica-fundamentos/04-ordenacion-burbuja) | Intercambiar burbujas hasta que todo flote, O(n²) | Todos |
| [05 · Ordenación por inserción](/ApuntesProgramacion/04-algoritmica-fundamentos/05-ordenacion-insercion) | Ordenar como cartas en la mano, O(n²) y bestia con casi ordenados | Todos |
| [06 · Complejidad algorítmica: Big O](/ApuntesProgramacion/04-algoritmica-fundamentos/06-complejidad-big-o) | Cómo crece el tiempo con los datos, de O(1) a O(2ⁿ) | Todos |
| [07 · Elegir el algoritmo adecuado](/ApuntesProgramacion/04-algoritmica-fundamentos/07-elegir-algoritmo) | La tabla de decisión según tamaño y orden inicial | Todos |
| [08 · Be the Code: búsqueda binaria desde cero](/ApuntesProgramacion/04-algoritmica-fundamentos/08-be-the-code) | Programar binaria y burbuja sin red de seguridad | Todos |
| [09 · Repaso interactivo](/ApuntesProgramacion/04-algoritmica-fundamentos/09-repaso-interactivo) | Sé el Código, Fireside, Quién Soy, Laboratorio, Crucigrama… | Todos |

> 📖 **Flujo de lectura:** los 8 primeros puntos son teoría en progresión. El 9º es el aterrizaje práctico: léelo justo después del 8º y antes de abrir los boletines.

---

## 📝 Boletines de la unidad

> Practica con los pares del curso: empezar siempre el resuelto para ver el estilo y luego intentar el por-resolver.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/boletines/boletin-u04-inicial-resuelto" class="elink">✅ Inicial resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u04-inicial" class="elink">🟢 Inicial por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u04-avanzado-resuelto" class="elink">💪 Avanzado resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u04-avanzado" class="elink">⭐ Avanzado por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u04-extras" class="elink">🔥 Extras</a>
</div>

---

## ✅ Criterios de evaluación cubiertos (RA2 + RA6)

**RA2: Escribe y prueba programas sencillos, reconociendo y aplicando los fundamentos de la programación orientada a objetos.**

**RA6: Escribe programas que manipulen información, seleccionando y utilizando tipos avanzados de datos.**

| CE | Criterio | Dónde se cubre |
|---|---|---|
| RA2 b) | Se han escrito programas simples. | ✅ Todos |
| RA2 f) | Se han utilizado parámetros en la llamada a métodos. | ✅ Puntos 2, 3, 4 y 5 |
| RA6 a) | Se han escrito programas que utilicen arrays. | ✅ Todos |

> 📌 Esta unidad es el germen de la U05: los bucles que machacas aquí (`for`, `while`), las búsquedas y las ordenaciones se convierten en QuickSort, MergeSort y recursividad. Y los arrays que recorres hoy son la base de las colecciones de la U09.

---

## 🚪 ¿Por dónde empiezo?

- ¿Cero conocimientos? → Arranca en el [punto 1](/ApuntesProgramacion/04-algoritmica-fundamentos/01-que-es-algoritmo). Solo necesitas variables, bucles y arrays básicos de la U03.
- ¿Ya sabes qué es un algoritmo y quieres chicha? → Salta a la [búsqueda binaria](/ApuntesProgramacion/04-algoritmica-fundamentos/03-busqueda-binaria) o a la [ordenación por inserción](/ApuntesProgramacion/04-algoritmica-fundamentos/05-ordenacion-insercion).
- ¿Solo quieres saber qué algoritmo elegir? → Lee [Big O](/ApuntesProgramacion/04-algoritmica-fundamentos/06-complejidad-big-o) y [Elegir el algoritmo adecuado](/ApuntesProgramacion/04-algoritmica-fundamentos/07-elegir-algoritmo).
- ¿Vienes a repasar? → Haz el [Repaso interactivo](/ApuntesProgramacion/04-algoritmica-fundamentos/09-repaso-interactivo) y después los [boletines](/ApuntesProgramacion/boletines/boletin-u04-inicial).

**📍 Primer punto:** [01 · Qué es un algoritmo](/ApuntesProgramacion/04-algoritmica-fundamentos/01-que-es-algoritmo)  
**⏭️ Al acabar la unidad, continúa en [U05 · Algorítmica II: Técnicas](/ApuntesProgramacion/05-algoritmica-tecnicas).**
