---
title: "09 — Mi primer problema (puente a Java)"
description: "Resolvemos nuestro primer reto sin tocar Java 🌉☕"
---

<p><small>Resolvemos nuestro primer reto sin tocar Java 🌉☕</small></p>

> 🗺️ **Estás en:** 🧠 **U00 · Introducción al Pensamiento Computacional** → 09 · Mi primer problema (puente a Java)

---

Hemos llegado al final de esta Unidad 0! Después de desmontar falsos mitos, de pelearnos con la literalidad de los robots, de aprender a no tener miedo al texto rojo y de poner a la IA a trabajar como tutor privado, llega el momento de la verdad: **resolver nuestro primer problema de programación real.** 🥳🎉

Y lo mejor de todo? Vamos a hacerlo **sin escribir una sola línea de Java todavía**.

¿Por qué? Porque así comprobarás en carne propia la gran lección de esta unidad: **la parte difícil de programar es pensar la lógica; traducirlo a un lenguaje concreto es solo cuestión de sintaxis.** 🧠➡️⌨️

---

## 🥊 El Reto: El Comparador de Números

Imagina que nos piden crear un programa súper sencillo para una aplicación:

> 📌 **Enunciado del problema:**

> *"Un programa debe pedir dos números enteros al usuario e indicar claramente por pantalla cuál de los dos es el mayor, o si ambos números son iguales."*

Parece fácil, ¿verdad? Pero antes de abrir cualquier editor de código o empezar a escribir paréntesis, aplicaremos nuestro método de trabajo en 3 pasos. 📄✍️

---

## 🧩 Paso 1: Descomposición y Entrenamiento de Datos (Inputs y Outputs)

Antes de pensar la lógica, un/a programador/a se pregunta: **¿Qué necesito pedir (Inputs) y qué tengo que devolver (Outputs)?**

* **📥 Datos de entrada (Inputs):** Necesitamos 2 números enteros. Los llamaremos número A y número B.
* **📤 Dato de salida (Output):** Un mensaje por pantalla que diga cuál es el mayor o si son iguales.

---

## 👣 Paso 2: El Algoritmo en Pseudocódigo (Lógica pura)

Ahora escribiremos la secuencia de pasos en nuestro propio idioma, sin preocuparnos por puntos y comas o llaves. ¡Solo lógica!

```
1. Pedir al usuario el Número A.
2. Pedir al usuario el Número B.
3. Comparar los dos números:
   - SI el Número A es mayor que el Número B:
         Mostrar el mensaje: "El Número A es el mayor".
   - SI NO, SI el Número B es mayor que el Número A:
         Mostrar el mensaje: "El Número B es el mayor".
   - SI NO (si ninguna de las anteriores se cumple):
         Mostrar el mensaje: "Ambos números son iguales".
4. Fin del programa.
```

Mira este algoritmo un segundo. ¿Tiene todo el sentido del mundo? **¡Esto YA es programar.** Cualquier persona, sea de Ontinyent, de Tokio o un robot de la NASA, entiende perfectamente esta lógica. 🚀✨

---

## 🧪 Paso 3: El testing de casos límite (Mentalidad de detective)

Antes de dar el algoritmo por bueno, vamos a hacerle nuestro "control de calidad" probando diferentes valores:

* 🟢 **Caso 1 (Normal):** A = 8, B = 3 ──► El programa dice *"A es el mayor"*. (¡Correcto! ✅)
* 🟢 **Caso 2 (Inverso):** A = 2, B = 10 ──► El programa dice *"B es el mayor"*. (¡Correcto! ✅)
* 🟡 **Caso Límite (Igualdad):** A = 5, B = 5 ──► El programa comprueba la primera opción (5 > 5? Falso), la segunda (5 > 5? Falso) y cae en el *SI NO*, diciendo *"Ambos números son iguales"*. (¡Correcto! ✅)

El algoritmo es 100% sólido. Funciona en papel y funciona en tu cabeza. 🏆

---

## 🌉 Y ahora... ¿Dónde está el puente a Java? ☕

¡Aquí viene la magia! A partir de la próxima unidad, lo único que haremos será **aprender cómo se dicen en Java esas mismas instrucciones que tú ya has pensado**:

* Para pedir datos, aprenderemos a usar una herramienta de Java llamada Scanner.
* Para comparar y tomar decisiones (SI... SI NO), aprenderemos la palabra reservada if y else.
* Para mostrar mensajes por pantalla, usaremos una instrucción llamada System.out.println().

| 🧠 TU LÓGICA (Unidad 0) | ☕ LA TRADUCCIÓN A JAVA (Unidad 1) |
| --- | --- |
| SI el Número A es mayor que el B... | if (numeroA > numeroB) { |
| Mostrar "A es el mayor" | System.out.println("A es el mayor"); |
| FIN DEL SI | } |

¿Ves que no era tan oscuro ni tan difícil? ¡La lógica ya la tienes; ahora solo aprenderemos el "diccionario" de Java para decírselo a la máquina! 📖☕

---

## 💡 Idea clave para cerrar la Unidad 0

> **Ya sabes pensar como un programador/a.**

> Ahora que tienes el método, la mentalidad y el protocolo para no bloquearte, abrimos la puerta a la Unidad 1. ¡Bienvenido/a al mundo real de Java! 🚀☕💻

---

# 🐛 Glosario

Para cerrar la unidad y que no te suenen a "chino" las palabras que el profesorado y el sector utilizan a diario, aquí tienes tu guía rápida de consulta.

---

## 💻 Términos técnicos de Infraestructura

* **Código Fuente (Source Code):** El texto que tú escribes en el lenguaje de programación (archivos .java). Es el "manuscrito" que nosotros podemos leer y editar.
* **Sintaxis:** Las reglas gramaticales de un lenguaje. Si te saltas un punto y coma ; o una llave {}, el compilador no entenderá nada y te dará un error de sintaxis.
* **Compilador:** El programa traductor que coge tu código fuente y lo convierte en instrucciones que el procesador pueda ejecutar.
* **IDE (*Integrated Development Environment*):** El programa que utilizas para escribir código (como *Eclipse*, *NetBeans* o *VS Code*). Es como un "Word para programadores", con colores, autocompletado y botón de ejecutar.

## 🧠 Términos de lógica y proceso

* **Algoritmo:** La secuencia ordenada, finita y sin ambigüedades de pasos que resuelve un problema.
* **Pseudocódigo:** Hay que escribir la lógica de un algoritmo en tu propio idioma (español/valenciano) antes de traducirlo a Java.
* **Descomposición:** La técnica de dividir un problema grande y complejo en sub-problemas mucho más pequeños y fáciles de resolver.
* **Abstracción:** El proceso de filtrar e ignorar los detalles irrelevantes de un problema para centrarte solo en los datos esenciales.

## 🐛 Términos de gestión de errores y control

* **Bug:** Un error o fallo en la lógica o en la ejecución de un programa.
* **Debugging (o Depuración):** El proceso de buscar, aislar y corregir un *bug* en tu código.
* **Stack Trace:** La montaña de texto rojo que aparece en la consola cuando el programa falla. Te dice qué error ha habido y en qué línea exacta ha pasado.
* **Casos límite (*Edge Cases*):** Las situaciones o datos extremados (valores cero, números negativos, edades exactas) donde el programa tiene más riesgo de fallar si no se ha probado bien.

## 🤖 Términos de trabajo y metodología

* **Espejo de la comprensión:** La falsa sensación de saber hacer un ejercicio solo por haber visto o leído cómo lo resolvía otra persona.
* **Tutor Socrático (con IA):** Utilizar la inteligencia artificial haciéndole preguntas para que te ayude a pensar, en vez de pedirle que te haga el código directamente.
* **Entrada/Salida (*Input/Output* o I/O):** Los datos que el programa recibe del usuario (Input) y los resultados que el programa muestra por pantalla (Output).

---

📚 [Volver al índice de la unidad](/ApuntesProgramacion/00-pensamiento-computacional) · **Anterior:** [08 · Cómo utilizaremos la IA](/ApuntesProgramacion/00-pensamiento-computacional/08-ia-tutor) · **Siguiente:** **[U01 · Introducción a Java](/ApuntesProgramacion/01-introduccion)**
