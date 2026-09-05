---
title: U02 — Variables, Tipos y Operadores
description: Las cajas del almacén de la memoria y las máquinas del gimnasio de datos 🔤
---

<p><small>Las cajas del almacén de la memoria y las máquinas del gimnasio de datos 🔤</small></p>

> 🗺️ **El mapa del paquete:** 🚪 Bienvenida → ☕ U01 → **🔤 AQUÍ ESTÁS (U02)** → 🔀 U03 → 🅿️ U04 → 🧩 U05 → ⚡ U06 → 🏗️ U07 → 🔒 U08 → 🧬 U09 → 📚 U10 → 🗺️ U11 → 📁 U12 → 🗄️ U13 → 🌐 U14

---

Bienvenido al almacén. En la U01 aprendiste a decirle a Java que te salude por consola, pero un programa que solo imprime texto es un loro: repite, pero no piensa. Para pensar necesita *guardar* cosas. Edades, precios, notas, si hace frío o no... y para eso existen las **variables**.

Imagina que la memoria de tu ordenador es un **almacén gigante** lleno de estanterías. Cada estantería tiene cajas, y las variables son esas cajas: cada una tiene una etiqueta para que sepas qué hay dentro. Y cuando las cajas se llenan de números y texto, llegan los **operadores**: las máquinas de pesas del gimnasio de datos que suman, restan, comparan y transforman.

En esta unidad vas a aprender a declarar variables de los **8 tipos primitivos**, a guardar texto con `String`, a hacer inmutables algunas cajas con `final`, a manejarlas con operadores aritméticos, relacionales y lógicos, a convertirlas entre tipos con **casting**, y a hacer que tu programa **escuche el teclado** con `Scanner` y juegue a la lotería con `Math.random()`.

Esta unidad se lee como un **libro de 10 capítulos**: los 9 primeros puntos son teoría en progresión y el 10º es un aterrizaje práctico para machacar todo lo aprendido.

---

## 🎯 Objetivo de la unidad

Al terminar, serás capaz de:

- Declarar y usar variables de los **8 tipos primitivos** y saber qué cabe en cada caja.
- Aplicar las reglas de **nomenclatura** y distinguir `int`, `long`, `double`, `char` y `boolean` con un vistazo.
- Crear y usar `String` como una **clase** (no un primitivo) y entender su inmutabilidad.
- Declarar **constantes** con `final` y entender por qué el compilador se enfada si las tocas.
- Usar los operadores aritméticos `+ - * / %`, sobrevivir a la **división entera** y respetar la **precedencia**.
- Comparar valores con operadores **relacionales**, combinarlos con **lógicos** (`&&`, `||`, `!`) y resumir decisiones con el **ternario**.
- Convertir entre tipos con **casting** implícito y explícito, sabiendo cuándo se pierde precisión.
- Leer datos del teclado con **`Scanner`** y generar números aleatorios con **`Math.random()`**.
- Manejar los **métodos de `String`** más usados para manipular texto.

---

## 🗺️ Mapa de la unidad

| Punto | Qué aprenderás | Nivel |
|---|---|---|
| [01 · Variables y tipos primitivos](/ApuntesProgramacion/02-variables-tipos-operadores/01-variables-tipos-primitivos) | Declarar variables, nomenclatura y los 8 primitivos | Todos |
| [02 · String, constantes y final](/ApuntesProgramacion/02-variables-tipos-operadores/02-string-constantes-final) | `String`, inmutabilidad, `==` vs `equals` y constantes `final` | Todos |
| [03 · Operadores aritméticos](/ApuntesProgramacion/02-variables-tipos-operadores/03-operadores-aritmeticos) | `+ - * / %`, división entera, precedencia y `++`/`--` | Todos |
| [04 · Relacionales, lógicos y ternario](/ApuntesProgramacion/02-variables-tipos-operadores/04-operadores-relacionales-logicos) | Comparaciones, `&&`/`\|\|`/`!`, cortocircuito y ternario | Todos |
| [05 · Casting y conversiones](/ApuntesProgramacion/02-variables-tipos-operadores/05-casting-conversiones) | Conversión implícita y explícita, truncamiento y desbordamiento | Todos |
| [06 · Scanner: leer por teclado](/ApuntesProgramacion/02-variables-tipos-operadores/06-scanner-entrada-teclado) | `Scanner`, `nextInt`, `nextDouble` y `nextLine` | Todos |
| [07 · Consola: salida formateada y errores de entrada](/ApuntesProgramacion/02-variables-tipos-operadores/07-consola-salida-formateada) | `printf`, `String.format`, `NumberFormat` y errores del `Scanner` | Todos |
| [08 · Math.random() y números aleatorios](/ApuntesProgramacion/02-variables-tipos-operadores/08-math-random-aleatorios) | `Math.random()`, la fórmula min-max y las herramientas de `Math` | Todos |
| [09 · Métodos útiles de String](/ApuntesProgramacion/02-variables-tipos-operadores/09-metodos-string) | `length`, `substring`, `replace`, `trim`, `charAt`… | Todos |
| [10 · Repaso interactivo](/ApuntesProgramacion/02-variables-tipos-operadores/10-repaso-interactivo) | Sé el Código, Fireside, Quién Soy, Laboratorio, Crucigrama… | Todos |

> 📖 **Flujo de lectura:** los 9 primeros puntos son teoría en progresión. El 10º es el aterrizaje práctico: léelo justo después del 9º y antes de abrir los boletines.

---

## 📝 Boletines de la unidad

> Practica con los pares del curso: empezar siempre el resuelto para ver el estilo y luego intentar el por-resolver.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/boletines/boletin-u02-inicial-resuelto" class="elink">✅ Inicial resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u02-inicial" class="elink">🟢 Inicial por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u02-avanzado-resuelto" class="elink">💪 Avanzado resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u02-avanzado" class="elink">⭐ Avanzado por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u02-extras" class="elink">🔥 Extras</a>
</div>

---

## ✅ Criterios de evaluación cubiertos (RA2 + RA1)

**RA1: Reconoce la estructura de un programa informático, identificando y relacionando los elementos propios del lenguaje de programación utilizado.**

**RA2: Escribe y prueba programas sencillos, reconociendo y aplicando los fundamentos de la programación orientada a objetos.**

| CE | Criterio | Dónde se cubre |
|---|---|---|
| RA1 d) | Se han identificado los distintos tipos de variables y la utilidad específica de cada uno. | ✅ Punto 1 |
| RA1 e) | Se ha modificado el código de un programa para crear y utilizar variables. | ✅ Punto 1 |
| RA1 f) | Se han creado y utilizado constantes y literales. | ✅ Punto 2 |
| RA1 g) | Se han clasificado, reconocido y utilizado en expresiones los operadores del lenguaje. | ✅ Puntos 3 y 4 |
| RA1 h) | Se ha comprobado el funcionamiento de las conversiones de tipo explícitas e implícitas. | ✅ Punto 5 |
| RA2 b) | Se han escrito programas simples. | ✅ Todos |
| RA2 c) | Se han instanciado objetos a partir de clases predefinidas. | ✅ Puntos 2 y 6 |
| RA2 d) | Se han utilizado métodos y propiedades de los objetos. | ✅ Puntos 6 y 8 |
| RA2 e) | Se han escrito llamadas a métodos estáticos. | ✅ Punto 7 |
| RA2 g) | Se han incorporado y utilizado librerías de objetos. | ✅ Punto 6 |
| RA2 h) | Se han utilizado constructores. | ✅ Puntos 2 y 6 |

> 📌 El `Scanner` del punto 6, la salida formateada del punto 7 y los métodos de `String` del punto 9 plantan la semilla del RA5 (entrada y salida de información), que florece en la U12.

---

## 🚪 ¿Por dónde empiezo?

- ¿Cero conocimientos? → Arranca en el [punto 1](/ApuntesProgramacion/02-variables-tipos-operadores/01-variables-tipos-primitivos). Solo necesitas lo que viste en la U01.
- ¿Ya sabes declarar variables y quieres chicha? → Ve directo al [punto 6](/ApuntesProgramacion/02-variables-tipos-operadores/06-scanner-entrada-teclado) y al [punto 8](/ApuntesProgramacion/02-variables-tipos-operadores/08-math-random-aleatorios): ahí empiezan los programas interesantes.
- ¿Solo vienes a por operadores? → Salta al [punto 3](/ApuntesProgramacion/02-variables-tipos-operadores/03-operadores-aritmeticos) y al [punto 4](/ApuntesProgramacion/02-variables-tipos-operadores/04-operadores-relacionales-logicos).
- ¿Vienes a repasar? → Haz el [Repaso interactivo](/ApuntesProgramacion/02-variables-tipos-operadores/10-repaso-interactivo) y después los [boletines](/ApuntesProgramacion/boletines/boletin-u02-inicial).

**📍 Primer punto:** [01 · Variables y tipos primitivos](/ApuntesProgramacion/02-variables-tipos-operadores/01-variables-tipos-primitivos)  
**⏭️ Al acabar la unidad, continúa en [U03 · Estructuras de Control](/ApuntesProgramacion/03-estructuras-control-excepciones).**
