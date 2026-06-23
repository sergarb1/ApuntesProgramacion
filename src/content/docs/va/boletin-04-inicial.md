---
title: "Butlletí 4 - Inicial: Algorítmica I"
nav_order: 1
---
Sense solucions. Agafa un array, un bucle i molta paciència. Els algorismes són com les receptes de cuina: si et saltes un pas, el pastís explota.

---

## ⭐ Exercici 1: El més gran i el més menut

Escriu un mètode `public static int[] mayorYMenor(int[] arr)` que torne un array de 2 enters: el primer és el valor més gran de l'array, el segon el més menut.

Exemple: `mayorYMenor([3, 7, 2, 9, 4])` → `{9, 2}`

---

## ⭐ Exercici 2: Suma total

Escriu un mètode `public static int sumarElementos(int[] arr)` que torne la suma de tots els elements de l'array.

Exemple: `sumarElementos([1, 2, 3, 4, 5])` → 15

Si l'array està buit, torna 0.

---

## ⭐⭐ Exercici 3: Cercador elemental

Escriu un mètode `public static boolean contiene(int[] arr, int valor)` que torne `true` si `valor` està a l'array, o `false` si no.

No val usar `Arrays.asList(arr).contains()`. Fes-ho amb un bucle.

---

## ⭐⭐ Exercici 4: Invertir array

Escriu un mètode `public static void invertir(int[] arr)` que modifique l'array original invertint l'ordre dels seus elements. No val crear un array nou.

Exemple: `[1, 2, 3, 4, 5]` → `[5, 4, 3, 2, 1]`

Pista: intercanvia el primer amb l'últim, el segon amb el penúltim...

---

## ⭐⭐ Exercici 5: Mitjana de doubles

Escriu un mètode `public static double calcularMedia(double[] arr)` que torne la mitjana aritmètica dels valors.

Exemple: `calcularMedia([2.5, 3.5, 4.0])` → 3.333...

Si l'array està buit, torna 0.0.

---

## ⭐⭐⭐ Exercici 6: CodeWars — Sum without highest and lowest number

Resol la kata **"Sum without highest and lowest number"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/576b93db1129fcf2200001e6).

Suma tots els números d'un array excepte el més alt i el més baix. Si l'array està buit o té un sol element, torna 0.

---

## ⭐⭐⭐ Exercici 7: CodeWars — You're a square!

Resol la kata **"You're a square!"** (7 kyu) en [CodeWars](https://www.codewars.com/kata/54c27a33fb7da0db0100040e).

Donat un número enter, determina si és un quadrat perfecte. Torna `true` si ho és, `false` si no. Per exemple, 25 és quadrat perfecte (5×5), 26 no.
