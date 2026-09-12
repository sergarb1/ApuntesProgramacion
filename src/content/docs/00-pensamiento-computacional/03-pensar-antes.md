---
title: "03 — Primero pensamos, después escribimos"
description: "El camino sagrado del programador y el test del Robot Literal 📝➡️💻"
---

<p><small>El camino sagrado del programador y el test del Robot Literal 📝➡️💻</small></p>

> 🗺️ **Estás en:** 🧠 **U00 · Introducción al Pensamiento Computacional** → 03 · Primero pensamos, después escribimos

---

Hay un error clásico de principiante que se repite desde la invención de los ordenadores: abrir el editor de código, poner las manos sobre el teclado y empezar a escribir líneas sin tener la más remota idea de cómo se resuelve el problema. 🤦‍♂️💥

El resultado de esto suele ser una mezcla de frustración, errores de sintaxis en rojo por toda la pantalla y la sensación de que la informática es una especie de magia negra reservada para unos pocos elegidos. 🧙‍♂️❌

Hoy queremos romper este mito con una regla de oro que te ahorrará cientos de horas de dolor durante el curso: **El código es simplemente la traducción de una solución que YA has pensado previamente en papel.** 📄✍️

---

## 🔮 La ilusión de la literalidad (Tu ordenador no es adivino)

Los humanos somos unas máquinas de "leer entre líneas". Si le dices a un amigo *"Voy a la cocina, ¿quieres agua?"* y te responde *"Sí, por favor"*, entiendes perfectamente que tienes que coger un vaso, abrir el grifo o la botella, llenar el vaso y llevárselo. No se te pasa por la cabeza ir a la cocina, coger un chorro de agua con las manos y tirárselo por encima a la cara, ¿verdad? 🌊😳

**Si le pides eso mismo a un ordenador:**

* No sabe qué es un vaso 🥃.
* No sabe cuándo parar de verter agua (inundación en la cocina 🌊).
* Se queda bloqueado para siempre esperando que le digas si el agua debe ser del tiempo o fría 🧊.

> 🤖 **La cruda realidad:** Un ordenador no tiene intuición, no tiene sentido común, no tiene empatía y **no interpreta lo que quieres decir: ejecuta exactamente las instrucciones que le das**. Si tu programa hace cosas raras, no es que la máquina te tenga manía; es que tú has asumido que el ordenador "ya te entendía". Y no, ¡no te entiende!

---

## 🛣️ El camino sagrado del programador

Para no colapsar tu cerebro, el flujo de trabajo para resolver cualquier ejercicio debe seguir SIEMPRE esta secuencia de 4 pasos:

***[1. Problema 🧩] ──► [2. Paso a paso (Algoritmo) 👣] ──► [3. Solución en papel 📄✍️] ──► [4. Código 💻]***

1. **Entender el problema 🧩:** Leer el enunciado hasta que seas capaz de explicárselo a tu abuela o a tu gato. Si no sabes qué te piden, ¡es imposible resolverlo!
2. **Pensar los pasos (Algoritmo) 👣:** Diseñar la secuencia lógica de pasos que solucionan el problema. ¿Qué dato va primero? ¿Qué tengo que calcular? ¿Qué decisión tengo que tomar?
3. **Escribir la solución en papel 📄:** Usar tu propio idioma (español/valenciano) o un dibujo para comprobar que la lógica tiene sentido.
4. **Traducir a Java 💻:** Abres el ordenador. Ahora solo tienes que preocuparte por la sintaxis (puntos y comas ;, llaves {}, etc.), porque la lógica ya la tienes resuelta en el papel.

Si intentas hacer el Paso 2 y el Paso 4 al mismo tiempo directamente en el teclado, tu "RAM mental" se colapsará y aparecerá el bloqueo. 🤯❌

---

## 🤖🧪 Ejercicio práctico: El test del Robot Literal

Para experimentar esto en tu propia piel sin tocar ningún ordenador, vamos a hacer un experimento mental.

Imagina que tienes que dar instrucciones a un **Robot Literal** (un ser que no tiene sentido común y lo hace TODO al pie de la letra) para una de estas tareas cotidianas:

* ☕ **Hacer un café en cafetera de goteo.**
* 🎒 **Preparar la mochila para ir a clase.**
* 🍳 **Hacer una tortilla de patatas.**
* 🚗 **Cambiar una rueda pinchada de un coche.**
* 🛒 **Hacer una compra en una tienda online.**

### ¿Qué pasa cuando intentamos escribir las instrucciones? ⚠️

Si escribes: *"Coge el café y ponlo en la cafetera"*, el Robot Literal cogerá el paquete de café CERRADO y lo tirará encima de la cafetera sin abrirlo. 📦💥

Para que el Robot lo haga bien, tienes que desglosarlo así:

1. Coge el paquete de café con la mano derecha.
2. Con la mano izquierda, abre la pestaña superior del paquete.
3. Coge la cuchara... *(y así 20 pasos más)*.

---

## 👿 Los 5 demonios de la lógica

Cuando hacemos este ejercicio, aparecen inmediatamente los 5 problemas que después te encontrarás programando en Java:

1. **Pasos que faltan 🚫:** Abrir la botella de agua antes de verterla.
2. **Orden incorrecto 🔀:** Ponerse los zapatos antes que los calcetines.
3. **Ambigüedades ❓:** En vez de decir *"Gira a la derecha"*, decir *"Gira un poco"*. ¿Cuánto es "un poco"? ¿45 grados? ¿180 grados?
4. **Información implícita 🤫:** Dar por hecho que el Robot sabe que el agua quema.
5. **Decisiones no contemplades 🔀:** ¿Qué hace el Robot si cuando coge el café... se ha acabado el café? *(Si no le has dicho nada, el Robot se queda colgado para siempre).*

---

## 💡 Idea clave para recordar

> **El código es solo el último paso.**

> Si no sabes resolver un problema con un papel y un bolígrafo en tu propio idioma, es absolutamente imposible que puedas resolverlo en Java frente a la pantalla. ¡Piensa primero, teclea después! 🧠📄➡️⌨️

---

📚 [Volver al índice de la unidad](/ApuntesProgramacion/00-pensamiento-computacional) · **Anterior:** [02 · Programar no es memorizar código](/ApuntesProgramacion/00-pensamiento-computacional/02-no-memorizar) · **Siguiente:** [04 · La descomposición](/ApuntesProgramacion/00-pensamiento-computacional/04-descomposicion)
