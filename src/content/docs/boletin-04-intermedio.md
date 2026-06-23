---
title: "Boletín 4 - Intermedio: Algorítmica I"
nav_order: 4
---
Ejercicios de dificultad progresiva. Los ⭐ son para calentar, ⭐⭐ para pensar, ⭐⭐⭐ para concursar.

---

## ⭐⭐ Ejercicio 1: Mover ceros al final

Escribe un método `public static void moverCeros(int[] arr)` que mueva todos los ceros del array al final, manteniendo el orden relativo de los no ceros. Hazlo **in-place**, sin crear un array nuevo.

Ejemplo: `[0, 1, 0, 3, 12]` → `[1, 3, 12, 0, 0]`

Pista: usa un índice `posicionNoCero` que avance solo cuando encuentres un número distinto de cero. Intercambia o desplaza según el valor.

---

## ⭐⭐ Ejercicio 2: El número que falta

Dado un array de N enteros únicos que contiene números del 0 al N (es decir, tiene N+1 números posibles pero solo N elementos), encuentra el número que falta.

Ejemplo: `[3, 0, 1]` falta el 2. `[9,6,4,2,3,5,7,0,1]` falta el 8.

Escribe el método `public static int numeroFaltante(int[] arr)`.

Pista: suma todos los números del array. Después suma todos los números de 0 a N (que es `arr.length`). La diferencia es el número que falta.

---

## ⭐⭐ Ejercicio 3: Primer carácter no repetido

Escribe un método `public static char primerNoRepetido(String s)` que devuelva el primer carácter de la cadena que no se repite en ninguna otra posición. Si todos se repiten o la cadena está vacía, devuelve `' '` (espacio).

Ejemplo: `"amor a roma"` — la 'a' se repite, la 'm' se repite, la 'o' se repite, la 'r' se repite... el espacio se repite. En este caso, no hay caracteres no repetidos, devuelve `' '`.

Ejemplo: `"programacion"` — la 'p' no se repite → devuelve `'p'`.

Pista: puedes usar un array de 26 enteros (uno por letra) para contar frecuencias, o un array de 256 para todo el ASCII.

---

## ⭐⭐⭐ Ejercicio 4: Anagramas

Dos strings son anagramas si contienen los mismos caracteres con la misma frecuencia. Escribe `public static boolean sonAnagramas(String a, String b)` que devuelva `true` si lo son.

Ejemplos:
- `"listen"` y `"silent"` → `true`
- `"java"` y `"avaj"` → `true`
- `"hola"` y `"halo"` → `true`
- `"hola"` y `"adios"` → `false`

Pista: conviértelos a arrays de char, ordénalos con `Arrays.sort()`, y compáralos. O cuenta frecuencias con un array de 26 enteros.

---

## ⭐⭐⭐ Ejercicio 5: Ordenar 0s, 1s y 2s (Dutch National Flag)

Dado un array que contiene solo 0, 1 y 2 ordénalo **in-place** en una sola pasada (complejidad O(n)). Escribe `public static void ordenarColores(int[] arr)`.

Ejemplo: `[0, 2, 1, 2, 0, 1, 0]` → `[0, 0, 0, 1, 1, 2, 2]`

Pista: usa tres punteros: `izquierdo` (para 0s), `derecho` (para 2s) y `actual` (que recorre el array). Intercambia según el valor encontrado. Este algoritmo se llama "Dutch National Flag" y lo inventó Edsger Dijkstra. Si lo resuelves, tienes nivel de entrevista técnica en Google.

---

## ⭐⭐⭐ Ejercicio 6: CodeWars — Disemvowel Trolls

Resuelve la kata **"Disemvowel Trolls"** (7 kyu) en [CodeWars](https://www.codewars.com/kata/52fba66badcd10859f00097e).

Elimina todas las vocales (a, e, i, o, u) de un string dado. El input puede tener mayúsculas y minúsculas. Por ejemplo, `"This website is for losers LOL!"` → `"Ths wbst s fr lsrs LL!"`.

---

## ⭐⭐⭐ Ejercicio 7: AceptaElReto — 219 La lotería

Resuelve el problema **219 — La lotería** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=219).

Dado un array de números de lotería, cuenta cuántas "inversiones" hay: pares de posiciones (i, j) donde i < j pero el número en i es mayor que el de j. En otras palabras, cuenta cuántos pares están desordenados.

Pista: puedes hacerlo con dos bucles anidados (complejidad O(n²)), pero para valores grandes necesitarías merge sort (O(n log n)). Empieza por la versión simple.

---

## 📚 Referencias

| Plataforma | Problema | Dificultad |
|---|---|---|
| AceptaElReto | 151 — ¿Es matriz identidad? | Medio |
| AceptaElReto | 219 — La lotería | Medio |
| AceptaElReto | 340 — Juegos de naipes | Medio |
| CodeWars | Vowel Count (7 kyu) | Fácil |
| CodeWars | Disemvowel Trolls (7 kyu) | Fácil |
| CodeWars | You're a square! (7 kyu) | Fácil |
