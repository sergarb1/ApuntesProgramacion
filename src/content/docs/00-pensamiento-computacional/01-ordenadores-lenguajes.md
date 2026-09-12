---
title: "01 — Qué es un ordenador y un lenguaje de programación"
description: "El primer paso: entender con quién vamos a hablar 🖥️"
---

<p><small>El primer paso: entender con quién vamos a hablar 🖥️</small></p>

> 🗺️ **Estás en:** 🧠 **U00 · Introducción al Pensamiento Computacional** → 01 · Qué es un ordenador y un lenguaje de programación

---

Antes de aprender a pensar la lógica de nuestros programas, hay que dar un paso atrás y entender **dónde demonios estamos y con quién vamos a hablar**.

Cuando la gente dice *"estoy aprendiendo a programar"*, en realidad está aprendiendo a traduir ideas humanas a un formato que un conjunto de circuitos electrónicos pueda ejecutar. ¿Pero cómo se produce esa magia? Aquí tienes los conceptos clave que necesitas tener claros antes de empezar. 📌

---

## 🧠 1. Un ordenador es extraordinariamente rápido, pero absolutamente tonto

Un ordenador no piensa, no tiene intuición y no sabe qué quieres hacer. Lo único que entiende la máquina a nivel de hardware es el código máquina: una secuencia infinita de ceros y unos (0 y 1), conocida como sistema binario.

* Los 0 y 1 representan, literalmente, la ausencia o el paso de corriente eléctrica por los transistores del procesador.
* Escribir un programa directamente en ceros y unos es una tarea humana prácticamente imposible y dolorosa.

---

## 🗣️ 2. ¿Qué es un lenguaje de programación?

Un **lenguaje de programación** es el puente o la interfaz entre tu cerebro y el procesador. Es un conjunto de reglas, palabras clave y estructuras creadas por humanos que nos permiten escribir instrucciones de manera entendible para nosotros, pero que se pueden traducir fácilmente a ceros y unos.

Hay dos grandes tipos de lenguajes según su proximidad a la máquina:

* **Lenguajes de bajo nivel (ej: Ensamblador):** Están muy cerca del hardware. Son ultra-rápidos, pero extremadamente difíciles de escribir y mantener para un humano.
* **Lenguajes de alto nivel (ej: Java, Python, C#):** Utilizan palabras en inglés (if, while, class), estructuras lógicas complejas y símbolos matemáticos. Son fáciles de leer y escribir para nosotros, pero la máquina no los entiende directamente.

---

## 🔄 3. El traductor: Compiladores vs. Intérpretes

Como el ordenador solo entiende binario y nosotros escribimos en un lenguaje de alto nivel, **necesitamos un traductor**. Aquí es donde aparece la gran diferencia en cómo se ejecuta el código:

[📝 Código Fuente (Java)] ──► [⚙️ TRADUCTOR / Compilador] ──► [🤖 Código Máquina (0s y 1s)]

1. **Compilador (El traductor de libros):** Coge TU archivo de código fuente, lo revisa entero, comprueba que no haya errores de sintaxis y genera un archivo ejecutable independiente. Si hay un solo error, no traduce nada hasta que lo corrijas. *(Ejemplo: C, C++).*
2. **Intérprete (El traductor en directo):** Lee tu código línea por línea y lo ejecuta al acto. Si encuentra un error en la línea 50, ejecutará las primeras 49 líneas y se parará exactamente en la 50. *(Ejemplo: Python, JavaScript).*

> ☕ **¿Y Java?** Java utiliza un sistema híbrido muy especial. Primero se **compila** a un código intermedio llamado *Bytecode*, y después una "máquina virtual" (**JVM - Java Virtual Machine**) lo **interpreta** en cualquier ordenador (Windows, Mac, Linux). Por eso se dice que Java es *"Escríbelo una vez, ejecútalo donde quieras"*.

---

## 🔤 4. Conceptos clave que escucharás cada día

Para no sonar como un extranjero cuando hablamos del módulo, guarda estos 5 términos en tu diccionario personal:

* **Código Fuente (Source Code):** El texto plano que tú escribes en el lenguaje de programación (tus archivos .java).
* **Sintaxis:** Las reglas gramaticales del lenguaje. Si en español no puedes decir *"casa la roja es"*, en Java no puedes olvidar un punto y coma ; o una llave {}. Si te saltas la sintaxis, el compilador se quejará en rojo.
* **IDE (Entorno de Desarrollo Integrado):** El programa o la "fábrica" que utilizamos para escribir código (como VS Code, Eclipse o NetBeans). Es como un procesador de textos (estilo Word), pero diseñado para programar: remarca colores, avisa de errores y tiene el botón de ejecutar integrado.
* **Algoritmo:** La secuencia lógica y finita de pasos que resuelve un problema (independientemente del lenguaje que uses).
* **Ejecución / Run:** El momento en que le dices al ordenador *"Coge mi programa y haz lo que pone aquí"*.

---

## 💡 Idea clave para recordar

> **El lenguaje de programación es solo el idioma de la conversación.**

> Aprender la sintaxis de Java es fácil (es como aprender vocabulario). El reto real de este curso no es memorizar el diccionario, sino saber **qué demonios quieres decirle a la máquina** para resolver un problema. ¡Y de eso trata el resto de esta Unidad 0! 🚀

---

📚 [Volver al índice de la unidad](/ApuntesProgramacion/00-pensamiento-computacional) · **Anterior:** [Índice de la unidad](/ApuntesProgramacion/00-pensamiento-computacional) · **Siguiente:** [02 · Programar no es memorizar código](/ApuntesProgramacion/00-pensamiento-computacional/02-no-memorizar)
