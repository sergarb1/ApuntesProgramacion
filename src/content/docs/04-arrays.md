---
title: "U04 — Arrays"
description: "El aparcamiento de datos: crea, recorre, ordena y busca con los arrays de Java 🅿️"
emoji: 🅿️
---

<p><small>El aparcamiento de datos: crea, recorre, ordena y busca con los arrays de Java 🅿️</small></p>

> 🗺️ **El mapa del paquete:** 🚪 Bienvenida → ☕ U01 → 🔤 U02 → 🔀 U03 → **🅿️ AQUÍ ESTÁS (U04)** → 🧩 U05 → ⚡ U06 → 🏗️ U07 → 🔒 U08 → 🧬 U09 → 📚 U10 → 🗺️ U11 → 📁 U12 → 🗄️ U13 → 🌐 U14

---

Bienvenido al aparcamiento. En las unidades anteriores aprendiste a **decidir** (U03) y a **repetir**, pero siempre guardando una cosa por variable. Hasta hoy. En esta unidad descubres los **arrays**: la forma de guardar cientos (o millones) de datos del mismo tipo bajo un solo nombre y de moverlos con un bucle.

Piensa en todo lo que es, en el fondo, una lista de cosas: las notas de tus 30 alumnos, la temperatura de cada día del año, las fichas de un tablero, los nombres de una clase. Pues todo eso, llevado a Java, es esta unidad: **crear** el array, **recorrerlo**, **ordenarlo**, **buscarlo**, manejarlo con la clase `Arrays` y pasarlo a **métodos** sin que se te escape nada por el camino.

Y, como siempre, CONRAD el compilador estará por aquí para recordarte que un índice fuera de rango es el error más caro (y más típico) del curso: `ArrayIndexOutOfBoundsException` no perdona.

Esta unidad se lee como un **libro de 9 capítulos**: los 8 primeros puntos son teoría en progresión y el 9º es un aterrizaje práctico para machacar todo lo aprendido.

---

## 🎯 Objetivo de la unidad

Al terminar, serás capaz de:

- **Crear** arrays de cualquier tipo, inicializarlos y entender sus valores por defecto (`0`, `false`, `null`...).
- **Recorrer** un array con `for` y con `for-each`, sabiendo cuándo usar cada uno.
- Trabajar con **arrays multidimensionales** (filas y columnas, tableros, matrices) y con arrays irregulares.
- Aprovechar la clase **`Arrays`**: `toString`, `sort`, `binarySearch`, `copyOf`, `fill` y `equals`.
- **Pasar arrays a métodos** y entender el paso por referencia de la copia.
- Aplicar los arrays a casos reales: listas de nombres, notas, objetos propios y datos en tabla.
- **Depurar** los errores típicos de los arrays: índices fuera de rango, `null`, imprimir sin `toString`...

---

## 🗺️ Mapa de la unidad

| Punto | Qué aprenderás | Dificultad |
|---|---|---|
| [01 · Arrays: el aparcamiento de datos](/ApuntesProgramacion/04-arrays/01-arrays-basicos) | Crear arrays, índices, `length` y el primer BOOM | Todos |
| [02 · Recorrer arrays: for y for-each](/ApuntesProgramacion/04-arrays/02-recorrer-arrays) | El dúo inseparable y la variante perezosa de solo lectura | Todos |
| [03 · Arrays multidimensionales](/ApuntesProgramacion/04-arrays/03-arrays-multidimensionales) | Arrays de arrays, filas, columnas y bucles anidados | Todos |
| [04 · La clase Arrays: tu navaja suiza](/ApuntesProgramacion/04-arrays/04-clase-arrays) | `toString`, `sort`, `binarySearch`, `copyOf`, `fill`, `equals` | Todos |
| [05 · Arrays y métodos](/ApuntesProgramacion/04-arrays/05-arrays-metodos) | Pasar arrays por referencia y devolverlos | Todos |
| [06 · Aplicaciones de los arrays](/ApuntesProgramacion/04-arrays/06-aplicaciones-arrays) | Arrays de String, de char, de objetos y datos en tabla | Todos |
| [07 · Be the Code: el parking se gestiona](/ApuntesProgramacion/04-arrays/07-be-the-code) | Programar inverso, búsquedas y compactar a mano | Todos |
| [08 · Array-revelde: errores comunes y depuración](/ApuntesProgramacion/04-arrays/08-array-revelde) | La galería de monstruos de los arrays y cómo cazarlos | Todos |
| [09 · Repaso interactivo](/ApuntesProgramacion/04-arrays/09-repaso-interactivo) | Sé el Código, Fireside, Quién Soy, Laboratorio, Crucigrama… | Todos |

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

## ✅ Criterios de evaluación cubiertos (RA6)

**RA6: Escribe programas que manipulen información, seleccionando y utilizando tipos avanzados de datos.**

| CE | Criterio | Dónde se cubre |
|---|---|---|
| RA6 a) | Se han escrito programas que utilicen arrays. | ✅ Todos |
| RA6 b) | Se han reconocido las librerías de clases relacionadas con tipos avanzados de datos. | ✅ Punto 4 |

> 📌 Los arrays son la base de todo lo que viene: los algoritmos de la U05 buscan y ordenan arrays, y cuando un parking de tamaño fijo se te queda pequeño, las colecciones de la U10 (ArrayList, LinkedList...) toman el relevo. Aprender arrays a fondo hoy es la inversión que renta durante todo el curso.

---

## 🚪 ¿Por dónde empiezo?

- ¿Cero conocimientos? → Arranca en el [punto 1](/ApuntesProgramacion/04-arrays/01-arrays-basicos). Solo necesitas variables, bucles y `if` de la U03.
- ¿Ya sabes crear arrays y quieres chicha? → Salta al [recorrido](/ApuntesProgramacion/04-arrays/02-recorrer-arrays) o a la [clase Arrays](/ApuntesProgramacion/04-arrays/04-clase-arrays).
- ¿Solo quieres ver arrays en acción real? → Lee [Aplicaciones de los arrays](/ApuntesProgramacion/04-arrays/06-aplicaciones-arrays).
- ¿Vienes a repasar? → Haz el [Repaso interactivo](/ApuntesProgramacion/04-arrays/09-repaso-interactivo) y después los [boletines](/ApuntesProgramacion/boletines/boletin-u04-inicial).

**📍 Primer punto:** [01 · Arrays: el aparcamiento de datos](/ApuntesProgramacion/04-arrays/01-arrays-basicos)  
**⏭️ Al acabar la unidad, continúa en [U05 · Algorítmica I: Fundamentos](/ApuntesProgramacion/05-algoritmica-fundamentos).**