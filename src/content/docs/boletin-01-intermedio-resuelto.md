---
title: "Boletín 1 - Resuelto: Introducción"
nav_order: 3
---
Ejercicios de dificultad progresiva. Los ⭐ son para calentar, ⭐⭐ para pensar, ⭐⭐⭐ para concursar.

---

## ⭐ Ejercicio 1: El programa que saluda tres veces

Escribe un programa que imprima "Hola" tres veces en tres líneas separadas, pero solo usando UNA línea de `System.out.println` (pista: usa `\n`).

> **💡 Explicación:** `\n` es un carácter especial que significa "nueva línea". Es como pulsar Enter dentro del texto. Java interpreta `\n` como un salto de línea, aunque esté dentro de las comillas. Así que con un solo `println` puedes imprimir varias líneas. Es como escribir un poema en una sola línea del cuaderno: los `\n` son los puntos y aparte invisibles.

---

## ⭐ Ejercicio 2: Argumentos en la arena

Escribe un programa que reciba argumentos desde la línea de comandos y los imprima en orden inverso.

> **💡 Explicación:** `args` es un array que contiene todo lo que escribas después de `java NombreClase`. Si pones `java ArgumentosInversos hola mundo cruel`, `args[0]` es "hola", `args[1]` es "mundo", `args[2]` es "cruel". El bucle `for` empieza por el último índice (args.length - 1) y va hacia atrás. Si no pasas argumentos, args.length es 0 y el bucle no se ejecuta. El programa no dice nada. Como un concierto sin público.

---

## ⭐⭐ Ejercicio 3: Comentario o no comentario

Sin ejecutar, ¿qué imprime este programa?

```java
public class Comentarios {
    public static void main(String[] args) {
        // System.out.println("Uno");
        System.out.println("Dos");
        /* System.out.println("Tres"); */
        System.out.println(/* "Cuatro" */ "Cinco");
    }
}
```

**Solución:**
```
Dos
Cinco
```

> **💡 Explicación:** Las líneas con `//` se ignoran completamente. `System.out.println("Dos")` se ejecuta normal. El bloque `/* ... */` también se ignora. Pero la última línea es una trampa: el comentario está DENTRO de la línea. `System.out.println(/* "Cuatro" */ "Cinco")` — el `/* "Cuatro" */` se ignora, pero `"Cinco"` permanece como argumento del `println`. Así que imprime "Cinco". Los comentarios no son comandos, son notas adhesivas: puedes ponerlos donde quieras, incluso en medio de una línea, y el compilador los ignorará como si nunca hubieran existido.

---

## ⭐⭐ Ejercicio 4: La fiesta de aceptaelreto.com

Resuelve el problema **117 — La fiesta** de [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=117).

Dice: dado un número N, imprime "Hola mundo." N veces.

> **💡 Explicación:** El problema te da un número N en la primera línea. Tienes que leerlo con `Scanner` (sí, ya sé que Scanner no lo hemos visto oficialmente, pero AceptaElReto exige leer de teclado). Luego un `for` que se repite N veces, imprimiendo "Hola mundo." cada vez. Si te fijas, el `for` es como una grabación en bucle: "dilo otra vez, dilo otra vez, dilo otra vez...". El `sc.close()` es opcional pero educado: cierras el Scanner porque eres una persona limpia.

---

## ⭐⭐ Ejercicio 5: Calculadora sin Scanner

Declara dos variables `int a` y `int b` con valores fijos (15 y 4). Muestra: suma, resta, multiplicación, división entera, división real y resto. Todo con `System.out.println`.

**Salida:**
```
a = 15, b = 4
Suma: 19
Resta: 11
Multiplicación: 60
División entera: 3
División real: 3.75
Resto: 3
```

> **💡 Explicación:** La división entera (`15 / 4`) da `3` porque ambos son `int`: Java tritura los decimales y se queda con la parte entera. Para la división real, convertimos `a` a `double` con `(double) a`. Así Java entiende que queremos decimales. El `%` te da el resto: `15 % 4 = 3` porque 4 cabe 3 veces en 15 (4×3=12) y sobran 3. Esto es la base de TODO: saber cuándo Java corta decimales y cuándo no te salvará de muchos dolores de cabeza.

---

## ⭐⭐⭐ Ejercicio 6: Javadoc de tu vida

Crea una clase `SobreMi` con:
- Comentario Javadoc en la clase explicando quién eres
- Comentario Javadoc en el método `main`
- Un `println` que muestre tu nombre y motivación

> **💡 Explicación:** Javadoc son comentarios especiales que empiezan con `/**` y permiten generar documentación automática con la herramienta `javadoc`. Se colocan justo antes de la clase o método que documentan. Las etiquetas `@author` y `@version` son para la clase; `@param` para los parámetros del método. No es obligatorio, pero cuando trabajes en equipo y te pidan documentar tu código, dará las gracias. Además, en los exámenes suele caer. Y sí, en la vida real casi nadie documenta con Javadoc... pero los que lo hacen duermen mejor.

---

## ⭐⭐⭐ Ejercicio 7: El primer depurador

Escribe un programa con un bucle que sume los números del 1 al 10. Pon un breakpoint en la línea de la suma y ejecuta paso a paso. Anota:

1. ¿Cuántas veces se para el breakpoint?
2. ¿Qué valor tiene la variable `suma` en cada parada?
3. ¿Cuál es el valor final?

**Respuestas:**
1. Se para **10 veces** (una por cada iteración del `for`, cuando `i` vale 1, 2, 3... hasta 10).
2. Valores de `suma`: 1, 3, 6, 10, 15, 21, 28, 36, 45, 55.
3. Valor final: **55**.

> **💡 Explicación:** El depurador es como tener una máquina del tiempo para tu código. Pones un breakpoint (punto de ruptura) en una línea y el programa se detiene justo ahí. Puedes ver el valor de todas las variables. Luego avanzas paso a paso y ves cómo cambian. En este caso, `suma` empieza en 0, y en cada vuelta se le suma el valor de `i`. `i` va de 1 a 10. La suma total 1+2+3+...+10 = 55. Si no sabías esta fórmula, ahora sí: la suma de 1 a N es N*(N+1)/2. Para N=10: 10*11/2 = 55. El depurador te permite confirmar que es cierto, paso a paso, como un científico loco verificando su teoría.

---

## ⭐⭐⭐ Ejercicio 8: CodeWars — Return Negative

Resuelve la kata **"Return Negative"** (8 kyu) en CodeWars.

Dado un número, devuélvelo negativo. Si ya es negativo, devuélvelo tal cual. Si es 0, devuelve 0.

> **💡 Explicación:** Si el número ya es negativo (o cero), lo devolvemos tal cual. Si es positivo, le ponemos un `-` delante. También se puede hacer con el operador ternario: `return x <= 0 ? x : -x;` en una sola línea. La kata te enseña que a veces lo más simple funciona. No necesitas una función de 20 líneas para esto. Una línea (o un if) bastan. Es como cuando te preguntan "¿cómo estás?" y respondes "bien". No necesitas un discurso de 5 minutos.

---

## 📚 Referencias

| Plataforma | Problema | Dificultad |
|---|---|---|
| AceptaElReto | 116 — ¡Hola mundo! | Principiante |
| AceptaElReto | 117 — La fiesta | Fácil |
| AceptaElReto | 119 — Futbolistas | Fácil |
| CodeWars | Multiply (8 kyu) | Principiante |
| CodeWars | Return Negative (8 kyu) | Principiante |
