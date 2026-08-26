---
title: "U03 — Estructuras de Control y Excepciones"
description: El semáforo, la cinta de correr y el seguro de vida que hacen decidir y repetir a tus programas 🔀
emoji: 🔀
---

<p><small>El semáforo, la cinta de correr y el seguro de vida que hacen decidir y repetir a tus programas 🔀</small></p>

> 🗺️ **El mapa del paquete:** 🚪 Bienvenida → ☕ U01 → 🔤 Variables → **🔀 AQUÍ ESTÁS (U03)** → 🧩 Algorítmica → ⚡ Técnicas → 🏗️ POO → 🔒 Visibilidad → 🧬 Herencia → 📚 Colecciones → 🗺️ Genéricos → 📁 Ficheros → 🗄️ JDBC → 🌐 APIs

---

Bienvenido al semáforo del código. En la U01 tu programa aprendió a hablar y en la U02 a guardar datos. Pero hablar y guardar sin decidir es un loro con archivador: repite, pero no piensa. Esta es la unidad donde tus programas empiezan a **pensar**.

Hasta ahora, tu código corría en línea recta, de arriba abajo, como un soldadito obediente. En esta unidad vas a darle tres superpoderes:

1. **Decidir**: "si aprueba, sube la nota; si no, a recuperación". Eso es `if`, `else` y `switch`.
2. **Repetir**: "imprime las tablas de multiplicar, todos los números del 1 al 10". Eso es `while`, `do-while` y `for`.
3. **Sobrevivir**: "¿y si el usuario escribe letras donde se esperaban números?". Eso es `try`, `catch`, `throw` y las excepciones.

Y, de propina, aprenderás a escaparte de un bucle con `break`, a saltarte una vuelta con `continue` y a inventarte tus propias excepciones. Sí, como en la vida real: te quejas de algo, y de paso construyes tu propio defecto.

Esta unidad se lee como un **libro de 9 capítulos**: los 8 primeros puntos son teoría en progresión y el 9º es un aterrizaje práctico para machacar todo lo aprendido.

---

## 🎯 Objetivo de la unidad

Al terminar, serás capaz de:

- Tomar decisiones con **`if`, `else if` y `else`**, anidarlos sin perder el norte y resumir decisiones simples con el **ternario**.
- Elegir entre muchas opciones con **`switch`**, sin olvidar el `break` ni el `default`.
- Repetir código con **`while`** y **`do-while`**, sabiendo cuándo se ejecuta al menos una vez.
- Contar vueltas con **`for`**, controlar contadores y crear **bucles anidados**.
- Escaparte de un bucle con **`break`**, saltarte una vuelta con **`continue`** y usar **etiquetas** cuando haga falta.
- Entender la jerarquía de **`Throwable`, `Exception` y `RuntimeException`** y conocer las excepciones más comunes de Java.
- Proteger tu código con **`try` / `catch` / `finally`** y capturar varios errores a la vez.
- Lanzar excepciones con **`throw`** y crear tus propias excepciones con herencia.
- Escribir programas que **decidan, repitan y sobrevivan**, y depurarlos cuando algo explote.

---

## 🗺️ Mapa de la unidad

| Punto | Qué aprenderás | Dificultad |
|---|---|---|
| [01 · if, else if y else](/ApuntesProgramacion/03-estructuras-control-excepciones/01-if-else) | Decisiones con `if`/`else`, anidados y ternario | Todos |
| [02 · switch](/ApuntesProgramacion/03-estructuras-control-excepciones/02-switch) | `switch`, `case`, `break` y `default` | Todos |
| [03 · Bucles: while y do-while](/ApuntesProgramacion/03-estructuras-control-excepciones/03-bucles-while-do-while) | Repetir con `while` y `do-while`, bucles infinitos | Todos |
| [04 · Bucle for y bucles anidados](/ApuntesProgramacion/03-estructuras-control-excepciones/04-bucle-for) | `for` con contador y bucles dentro de bucles | Todos |
| [05 · break, continue y etiquetas](/ApuntesProgramacion/03-estructuras-control-excepciones/05-break-continue) | Escapes del bucle y salto entre etiquetas | Todos |
| [06 · Excepciones básicas](/ApuntesProgramacion/03-estructuras-control-excepciones/06-excepciones-basicas) | `Throwable`, `Exception`, `RuntimeException` y las excepciones típicas | Todos |
| [07 · try, catch y finally](/ApuntesProgramacion/03-estructuras-control-excepciones/07-try-catch-finally) | Proteger código, capturar errores y captura múltiple | Todos |
| [08 · throw y excepciones propias](/ApuntesProgramacion/03-estructuras-control-excepciones/08-throw-excepciones-propias) | Lanzar excepciones y crear las tuyas | Todos |
| [09 · Repaso interactivo](/ApuntesProgramacion/03-estructuras-control-excepciones/09-repaso-interactivo) | Sé el Código, Fireside, Quién Soy, Laboratorio, Crucigrama… | Todos |

> 📖 **Flujo de lectura:** los 8 primeros puntos son teoría en progresión. El 9º es el aterrizaje práctico: léelo justo después del 8º y antes de abrir los boletines.

---

## 📝 Boletines de la unidad

> Practica con los pares del curso: empezar siempre el resuelto para ver el estilo y luego intentar el por-resolver.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/boletines/boletin-u03-inicial-resuelto" class="elink">✅ Inicial resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u03-inicial" class="elink">🟢 Inicial por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u03-avanzado-resuelto" class="elink">💪 Avanzado resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u03-avanzado" class="elink">⭐ Avanzado por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u03-extras" class="elink">🔥 Extras</a>
</div>

---

## ✅ Criterios de evaluación cubiertos (RA3)

**RA3: Escribe y depura código, analizando y utilizando las estructuras de control del lenguaje.**

| CE | Criterio | Dónde se cubre |
|---|---|---|
| RA3 a) | Se ha escrito y probado código que haga uso de estructuras de selección. | ✅ Puntos 1 y 2 |
| RA3 b) | Se han utilizado estructuras de repetición. | ✅ Puntos 3 y 4 |
| RA3 c) | Se han reconocido las posibilidades de las sentencias de salto. | ✅ Punto 5 |
| RA3 d) | Se ha escrito código utilizando control de excepciones. | ✅ Puntos 6, 7 y 8 |
| RA3 e) | Se han creado programas ejecutables utilizando diferentes estructuras de control. | ✅ Todos |
| RA3 f) | Se han probado y depurado los programas. | ✅ Todos, con chicha extra en los boletines |
| RA3 g) | Se ha comentado y documentado el código. | ✅ Todos |

> 📌 Los bucles que ves aquí son el músculo de todo lo que viene: los recorridos de arrays y colecciones (U09) y los algoritmos de ordenación y búsqueda (U05) no serían nada sin `for` y `while`.

---

## 🚪 ¿Por dónde empiezo?

- ¿Cero conocimientos? → Arranca en el [punto 1](/ApuntesProgramacion/03-estructuras-control-excepciones/01-if-else). Solo necesitas las variables y el `Scanner` de la U02.
- ¿Ya sabes decidir y solo quieres repetir? → Ve directo al [punto 3](/ApuntesProgramacion/03-estructuras-control-excepciones/03-bucles-while-do-while) y al [punto 4](/ApuntesProgramacion/03-estructuras-control-excepciones/04-bucle-for).
- ¿Tu programa se rompe y no sabes por qué? → Los [puntos 6](/ApuntesProgramacion/03-estructuras-control-excepciones/06-excepciones-basicas), [7](/ApuntesProgramacion/03-estructuras-control-excepciones/07-try-catch-finally) y [8](/ApuntesProgramacion/03-estructuras-control-excepciones/08-throw-excepciones-propias) te enseñan a leer los gritos de Java.
- ¿Vienes a repasar? → Haz el [Repaso interactivo](/ApuntesProgramacion/03-estructuras-control-excepciones/09-repaso-interactivo) y después los [boletines](/ApuntesProgramacion/boletines/boletin-u03-inicial).

**📍 Primer punto:** [01 · if, else if y else](/ApuntesProgramacion/03-estructuras-control-excepciones/01-if-else)  
**⏭️ Al acabar la unidad, continúa en [U04 · Algorítmica I: Fundamentos](/ApuntesProgramacion/04-algoritmica-fundamentos).**
