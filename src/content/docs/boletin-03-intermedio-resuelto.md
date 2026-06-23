---
title: "Boletín 3 - Resuelto: Estructuras de Control"
nav_order: 9
---
Dificultad progresiva. Los ⭐ te calientan, los ⭐⭐ te hacen pensar, los ⭐⭐⭐ te preparan para el mundo real (y para ProgramaMe).

---

## ⭐ Ejercicio 1: El clasificador de notas sarcástico

Pide una nota (0-100) y clasifícala: 90+ "Sobresaliente", 70+ "Notable", 50+ "Aprobado", menos "Suspenso". Captura que la nota sea válida (0-100).

> **💡 Explicación:** Primero validamos que la nota esté entre 0 y 100. Luego, con `else if`, evaluamos de mayor a menor. Si la nota es 85, no entra en `>= 90` pero sí en `>= 70`. El orden es crucial: si pusieras `>= 50` antes que `>= 90`, un 95 también entraría en `>= 50`. Siempre ve de lo más específico a lo más general. Como en la vida: primero lo urgente, luego lo importante, luego lo que sea.

---

## ⭐ Ejercicio 2: Tabla de multiplicar

Pide un número y muestra su tabla de multiplicar del 1 al 10 con un `for`.

> **💡 Explicación:** El `for` va de 1 a 10. En cada vuelta, multiplica `n` por `i`. Simple, directo. Es como cuando eras pequeño y recitabas la tabla del 7: "7 por 1 es 7, 7 por 2 es 14...". La diferencia es que ahora el ordenador lo hace por ti y no se equivoca (a menos que tú te equivoques al programarlo, claro).

---

## ⭐⭐ Ejercicio 3: División segura con try-catch

Pide dos números enteros. Divide el primero entre el segundo. Captura `ArithmeticException` (división por cero) e `InputMismatchException` (no escribir un número).

> **💡 Explicación:** El bloque `try` contiene el código peligroso. Si ocurre un `ArithmeticException` (división por cero) o un `InputMismatchException` (el usuario escribe letras), se ejecuta el `catch` correspondiente. El `finally` se ejecuta siempre, haya o no error. Es como el seguro de vida de tu programa: pase lo que pase, se cierra el Scanner y se dice algo. Sin `try-catch`, si el usuario divide por cero, el programa muere con un mensaje rojo de error. Con `try-catch`, el programa sobrevive y sigue adelante como un héroe de acción.

---

## ⭐⭐ Ejercicio 4: El triángulo constructor

Dibuja un triángulo de asteriscos con bucles anidados. El usuario introduce la altura.

```
*
**
***
****
*****
```

> **💡 Explicación:** El bucle exterior (`i`) controla las filas (de 1 a altura). El bucle interior (`j`) controla las columnas de cada fila: en la fila 1 imprime 1 asterisco, en la fila 2 imprime 2... Usamos `print` (sin `ln`) para que los asteriscos salgan en la misma línea. Al terminar cada fila, hacemos un `println` vacío para saltar a la siguiente línea. Los bucles anidados son como muñecas rusas: un bucle dentro de otro. El interior da vueltas completas por cada vuelta del exterior.

---

## ⭐⭐ Ejercicio 5: Fibonacci con for

Muestra los primeros N números de Fibonacci. La secuencia empieza: 0, 1, 1, 2, 3, 5, 8, 13...

> **💡 Explicación:** Fibonacci es la secuencia donde cada número es la suma de los dos anteriores. Empezamos con a=0, b=1. En cada iteración, calculamos c = a+b, mostramos c, y desplazamos: a pasa a ser b, b pasa a ser c. Es como una carrera de relevos: el valor se pasa de una variable a otra. El bucle empieza en 3 porque ya hemos impreso los dos primeros (0 y 1). Este es el ejercicio clásico de entrevista técnica. Si lo resuelves en la primera entrevista, el entrevistador asiente con la cabeza. Si no lo resuelves, te preguntan "¿y qué tal se te da trabajar en equipo?"

---

## ⭐⭐⭐ Ejercicio 6: AceptaElReto 340 — Juegos de naipes

Resuelve el problema **340 — Juegos de naipes** en AceptaElReto.

Dada una secuencia de cartas representadas por números (1 a 10), determina cuántas veces hay que ordenarlas para que queden en orden ascendente según un algoritmo específico de "colocar la primera al final".

> **💡 Explicación:** El problema simula un juego de cartas donde buscas la carta 1, luego la 2, etc. Vas pasando cartas de la primera a la última posición (como si pasaras de una punta a otra) hasta que encuentras la que buscas. El `% n` hace que el índice dé la vuelta cuando llega al final (como una ruleta). Es un ejercicio de lógica con arrays y bucles. La dificultad está en entender el algoritmo de búsqueda circular. No te preocupes si no te sale a la primera: los juegos de naipes siempre han sido complicados, incluso para los programadores.

---

## ⭐⭐⭐ Ejercicio 7: Excepción personalizada

Crea `EdadInvalidaException` (excepción checked). Lánzala si la edad es menor que 0 o mayor que 150. Crea un programa que la pruebe.

**Salida:**
```
Error: Edad negativa: -5. ¿Eres viajero en el tiempo?
Error: 200 años? O eres inmortal o me tomas el pelo
Edad válida: 25
```

> **💡 Explicación:** Creamos una excepción personalizada heredando de `Exception`. Le ponemos un constructor que llame a `super(mensaje)` para que el mensaje se guarde. Luego, en `validarEdad`, lanzamos la excepción con `throw` cuando la edad es inválida. Como es checked, quien llame al método debe capturarla con `try-catch` o declararla con `throws`. Es como crear tu propio tipo de error: "esto no es un error cualquiera, es MI error".

---

## ⭐⭐⭐ Ejercicio 8: AceptaElReto 100 — Kaprekar

Resuelve el problema **100 — Kaprekar** en AceptaElReto.

Dado un número de 4 dígitos (no todos iguales), ordénalo ascendente y descendentemente, resta, y repite. Siempre llegas a 6174 (la constante de Kaprekar). Cuenta cuántas iteraciones se necesitan.

> **💡 Explicación:** Kaprekar descubrió que, para cualquier número de 4 dígitos (no todos iguales), si ordenas los dígitos de mayor a menor, restas el orden inverso, y repites, siempre llegas a 6174 en pocos pasos. El programa extrae los dígitos, los ordena con `Arrays.sort()`, construye el número ascendente y descendente, resta, y repite hasta llegar a 6174. Es como un funnel matemático: todos los caminos llevan a 6174. Este problema es un clásico de las olimpiadas de programación (ProgramaMe). Si lo resuelves, ya puedes poner "experto en Kaprekar" en tu LinkedIn.

---

## 📚 Referencias

| Plataforma | Problema | Dificultad |
|---|---|---|
| AceptaElReto | 200 — Aburrimiento en las aulas | Medio |
| AceptaElReto | 340 — Juegos de naipes | Medio |
| AceptaElReto | 100 — Kaprekar | Difícil |
| AceptaElReto | 151 — ¿Es matriz identidad? | Medio |
| CodeWars | Century From Year (8 kyu) | Principiante |
| CodeWars | Cat years, Dog years (7 kyu) | Fácil |
