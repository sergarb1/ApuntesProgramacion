---
title: "Boletín U04 — Inicial"
description: "Ejercicios básicos de Arrays"
---

# 📝 Boletín U04 — Inicial

> Sin soluciones. Sin prisas. Abre el IDE, crea tu primer aparcamiento de datos y haz que el `for-each` deje de parecer magia. Ninguna plaza nace sabiendo tener dueño.

---

## Ejercicio 1: ¿Qué imprime? — Array de booleanos

```java
boolean[] flags = new boolean[3];
flags[1] = true;
System.out.println(flags[0] + " " + flags[1] + " " + flags[2]);
```

¿Qué imprime? ¿Cuál es el valor por defecto de un `boolean` en un array?

---

## Ejercicio 2: Encuentra el error — NullPointerException

```java
String[] nombres = new String[3];
nombres[0] = "Ana";
nombres[1] = "Bob";
System.out.println(nombres[2].toUpperCase());
```

¿Qué ocurre al ejecutar este código? ¿Por qué?

---

## Ejercicio 3: Completa el código — for básico para buscar el mayor

Completa el siguiente programa para que encuentre e imprima el número más grande del array:

```java
int[] numeros = {12, 45, 7, 34, 89, 23};
int mayor = numeros[0];

for (int i = 1; i < ______; i++) {   // ¿hasta dónde llega el bucle?
    if (numeros[i] ______ mayor) {    // ¿qué operador?
        ______ = numeros[i];          // ¿qué asignamos?
    }
}

System.out.println("El mayor es: " + mayor);
```

---

## Ejercicio 4: Escribe este programa — contar números pares

Crea un array de 10 enteros con valores que tú elijas. Recórrelo con un bucle `for` y cuenta cuántos de ellos son pares. Al final, imprime el total de pares y el array original con `Arrays.toString`.

Ejemplo de salida:

```
Array: [3, 8, 12, 5, 7, 10, 2, 9, 6, 1]
Pares: 5
```

Pista: un número es par si `numeros[i] % 2 == 0`.

---

## Ejercicio 5: Encuentra el error — length vs length()

```java
int[] numeros = {10, 20, 30};
String texto = "Hola";

System.out.println(numeros.length());
System.out.println(texto.length);
```

¿Qué líneas tienen error? Explica la diferencia entre `length` (sin paréntesis) y `length()` (con paréntesis).

---

## Ejercicio 6: ¿Qué imprime? — la suma de los impares

Sin ejecutar, escribe la salida exacta de este programa:

```java
public class SumaImpares {
    public static void main(String[] args) {
        int[] datos = {3, 8, 2, 9, 5};
        int total = 0;

        for (int n : datos) {
            if (n % 2 == 1) {
                total += n;
            }
        }

        System.out.println(total);
    }
}
```

Pista: el `for-each` recorre todos los valores; solo se suman los que dejan resto 1 al dividir entre 2.

---

## Ejercicio 7: Escribe este programa — búsqueda lineal

Crea un array de enteros llamado `edades` con 8 valores. Pide al usuario un número por teclado (con `Scanner`) y busca si ese número está en el array. Imprime «Encontrado en posición X» o «No encontrado».

```
Introduce edad a buscar: 25
Encontrado en posición 3
```

Pista: usa una variable `posicion = -1` como "no encontrado", y `break` en cuanto lo encuentres.

---

## Ejercicio 8: Escribe este programa — el inverso

Crea un array de 10 enteros, rellénalo con los números del 1 al 10 y luego imprímelo en **orden inverso** (del 10 al 1). Hazlo con un `for` que recorra el array hacia atrás.

Pista: el bucle va de `length - 1` hasta `0`, bajando con `i--`.

---

## Ejercicio 9: Escribe este programa — la clase Arrays en acción

Crea el array `int[] notas = {7, 3, 9, 5, 2, 8}` y haz lo siguiente:

1. Muéstralo con `Arrays.toString`.
2. Ordena con `Arrays.sort` y muéstralo otra vez.
3. Busca el `8` con `Arrays.binarySearch` e imprime su posición.

Pista: `import java.util.Arrays;` al principio, y recuerda: `binarySearch` solo es fiable si el array ya está ordenado.