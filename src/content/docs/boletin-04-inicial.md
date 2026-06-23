---
title: "Boletín 4 - Inicial: Algorítmica I"
nav_order: 1
---
Sin soluciones. Coge un array, un bucle y mucha paciencia. Los algoritmos son como las recetas de cocina: si te saltas un paso, el pastel explota.

---

## ⭐ Ejercicio 1: El más grande y el más pequeño

Escribe un método `public static int[] mayorYMenor(int[] arr)` que devuelva un array de 2 enteros: el primero es el valor más grande del array, el segundo el más pequeño.

Ejemplo: `mayorYMenor([3, 7, 2, 9, 4])` → `{9, 2}`

---

## ⭐ Ejercicio 2: Suma total

Escribe un método `public static int sumarElementos(int[] arr)` que devuelva la suma de todos los elementos del array.

Ejemplo: `sumarElementos([1, 2, 3, 4, 5])` → 15

Si el array está vacío, devuelve 0.

---

## ⭐⭐ Ejercicio 3: Buscador elemental

Escribe un método `public static boolean contiene(int[] arr, int valor)` que devuelva `true` si `valor` está en el array, o `false` si no.

No vale usar `Arrays.asList(arr).contains()`. Hazlo con un bucle.

---

## ⭐⭐ Ejercicio 4: Invertir array

Escribe un método `public static void invertir(int[] arr)` que modifique el array original invirtiendo el orden de sus elementos. No vale crear un array nuevo.

Ejemplo: `[1, 2, 3, 4, 5]` → `[5, 4, 3, 2, 1]`

Pista: intercambia el primero con el último, el segundo con el penúltimo...

---

## ⭐⭐ Ejercicio 5: Media de doubles

Escribe un método `public static double calcularMedia(double[] arr)` que devuelva la media aritmética de los valores.

Ejemplo: `calcularMedia([2.5, 3.5, 4.0])` → 3.333...

Si el array está vacío, devuelve 0.0.

---

## ⭐⭐⭐ Ejercicio 6: CodeWars — Sum without highest and lowest number

Resuelve la kata **"Sum without highest and lowest number"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/576b93db1129fcf2200001e6).

Suma todos los números de un array excepto el más alto y el más bajo. Si el array está vacío o tiene un solo elemento, devuelve 0.

---

## ⭐⭐⭐ Ejercicio 7: CodeWars — You're a square!

Resuelve la kata **"You're a square!"** (7 kyu) en [CodeWars](https://www.codewars.com/kata/54c27a33fb7da0db0100040e).

Dado un número entero, determina si es un cuadrado perfecto. Devuelve `true` si lo es, `false` si no. Por ejemplo, 25 es cuadrado perfecto (5×5), 26 no.
