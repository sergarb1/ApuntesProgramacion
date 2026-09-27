---
title: "U05 — Funciones y métodos"
description: "El oficio de trocear tu código: métodos que reciben datos, devuelven resultados y convierten un main gigante en piezas pequeñas y probables 🔧"
emoji: 🔧
---

<p><small>El oficio de trocear tu código: métodos que reciben datos, devuelven resultados y convierten un main gigante en piezas pequeñas y probables 🔧</small></p>



---

Hasta ahora todo tu código ha vivido dentro de `main`: declarabas variables, repartías `if` y bucles, y el programa entero era un párrafo largo y valiente. Funciona... hasta que el programa crece. Entonces `main` se convierte en un pliego de recetas, no puedes repetir una parte sin copiar y pegar, y cada cambio se propaga como una mancha de café.

En esta unidad aprendes la herramienta que separa a quien escribe código de quien lo **diseña**: el **método** (o función). Un método es una receta con nombre: recibe datos por la puerta, hace una cosa bien explicada, y devuelve el resultado o no devuelve nada y se va. Nada más. Pero con eso construyes programas enteros.

La promesa concreta: al terminar esta unidad, `main` será pequeño, cada concepto vivirá en su propio método con un nombre que se explica solo, y habrás dado el salto que te separa de los ejercicios de "un solo archivo" para siempre.

Esta unidad se lee como un **libro de 9 capítulos**: los 8 primeros puntos son teoría en progresión y el 9º es un aterrizaje práctico para machacar todo lo aprendido.

---

## 🎯 Objetivo de la unidad

Al terminar, serás capaz de:

- **Declarar** tus propios métodos (`public static`) y llamarlos desde `main`.
- **Pasar datos** a un método mediante **parámetros** y usarlos dentro como si fueran variables.
- **Devolver resultados** con `return` y distinguir cuándo un método devuelve y cuándo es `void`.
- Entender el **ámbito** de las variables: qué existe dentro de un método y qué no se sale de él.
- Reconocer y arreglar los **errores típicos** de las funciones (return olvidado, argumentos desordenados...).
- **Dividir** un problema grande en métodos pequeños, cada uno con una responsabilidad.
- **Refactorizar** un programa monolítico en funciones reutilizables sin cambiar lo que hace.

---

## 🗺️ Mapa de la unidad

| Punto | Qué aprenderás | Dificultad |
|---|---|---|
| [01 · ¿Qué es una función?](/ApuntesProgramacion/05-funciones/01-que-es-funcion) | La receta con nombre: por qué existe y qué es "método" | Todos |
| [02 · Tu primer método](/ApuntesProgramacion/05-funciones/02-primer-metodo) | `public static void`, llamar desde `main` y ejecutar | Todos |
| [03 · Parámetros: la entrada](/ApuntesProgramacion/05-funciones/03-parametros) | Datos que entran: tipos, orden y varios a la vez | Todos |
| [04 · return: la salida](/ApuntesProgramacion/05-funciones/04-return-valores) | Devolver resultados y cuándo usar `void` | Todos |
| [05 · Ámbito de variables](/ApuntesProgramacion/05-funciones/05-ambito-variables) | Qué variables viven dentro de un método y por qué | Todos |
| [06 · Errores frecuentes](/ApuntesProgramacion/05-funciones/06-errores-frecuentes) | Los 7 tropiezos de todo el mundo y cómo salir de ellos | Todos |
| [07 · Divide el problema](/ApuntesProgramacion/05-funciones/07-divide-problema) | Componer: main pequeño, una responsabilidad por método | Todos |
| [08 · Be the Code](/ApuntesProgramacion/05-funciones/08-be-the-code) | Refactoriza un programa monolítico a mano | Todos |
| [09 · Repaso interactivo](/ApuntesProgramacion/05-funciones/09-repaso-interactivo) | Sé el Código, Fireside, Quién Soy, Laboratorio, Crucigrama… | Todos |

> 📖 **Flujo de lectura:** los 8 primeros puntos son teoría en progresión. El 9º es el aterrizaje práctico: léelo justo después del 8º y antes de abrir los boletines.

---

## 📝 Boletines de la unidad

> Practica con los pares del curso: intenta primero el por-resolver y comprueba con el resuelto cuando hayas terminado.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/boletines/boletin-u05-inicial" class="elink">🟢 Inicial por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u05-inicial-resuelto" class="elink">✅ Inicial resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u05-avanzado" class="elink">⭐ Avanzado por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u05-avanzado-resuelto" class="elink">💪 Avanzado resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u05-extras" class="elink">🔥 Extras</a>
</div>

---

## ✅ Criterios de evaluación cubiertos (RA2)

**RA2: Escribe y prueba programas sencillos, reconociendo y aplicando los fundamentos de la programación orientada a objetos.**

| CE | Criterio | Dónde se cubre |
|---|---|---|
| RA2 b) | Se han escrito programas simples. | ✅ Todos |
| RA2 e) | Se han escrito llamadas a métodos estáticos. | ✅ Puntos 2, 3, 4 y 7 |
| RA2 f) | Se han utilizado parámetros en la llamada a métodos. | ✅ Puntos 3, 4 y 7 |

> 📌 Esta unidad es la primera mitad del viaje de los métodos: aquí los escribes "a pelo" con `static`, como recetas sueltas. La segunda mitad llega en la U09 (POO), donde los métodos viven dentro de clases con atributos, y en la U10, donde `static` por fin explica su nombre. Hoy solo necesitas la herramienta: entradas, salidas y un nombre honesto.

---

## 🚪 ¿Por dónde empiezo?

- ¿Nunca has escrito un método que no fuera `main`? → Arranca en el [punto 1](/ApuntesProgramacion/05-funciones/01-que-es-funcion) y no te saltes el 2.
- ¿Tu `main` ya parece un párrafo infinito de copiar y pegar? → Ve directo al [punto 7](/ApuntesProgramacion/05-funciones/07-divide-problema) y luego al [Be the Code](/ApuntesProgramacion/05-funciones/08-be-the-code).
- ¿Solo quieres entender por qué `main` es `public static void main`? → El [punto 2](/ApuntesProgramacion/05-funciones/02-primer-metodo) te desmonta la firma en 4 palabras.
- ¿Vienes a repasar? → Haz el [Repaso interactivo](/ApuntesProgramacion/05-funciones/09-repaso-interactivo) y después los [boletines](/ApuntesProgramacion/boletines/boletin-u05-inicial).

**📍 Primer punto:** [01 · ¿Qué es una función?](/ApuntesProgramacion/05-funciones/01-que-es-funcion)  
**⏭️ Al acabar la unidad, continúa en [U06 · Arrays](/ApuntesProgramacion/06-arrays).**
