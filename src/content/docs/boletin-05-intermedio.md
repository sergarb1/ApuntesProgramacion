---
title: "Boletín 5 - Intermedio: Algorítmica II: Técnicas Avanzadas"
nav_order: 3
---
Ejercicios de dificultad progresiva. Los ⭐ son para calentar, ⭐⭐ para pensar, ⭐⭐⭐ para concursar. Si la recursividad te parece un bucle sin fin, espera a hacer estos ejercicios. Bueno, en realidad SÍ es un bucle sin fin, pero controlado.

---

## ⭐ Ejercicio 1: MCD por Euclides recursivo

Implementa el algoritmo de Euclides para calcular el máximo común divisor de dos números enteros **de forma recursiva**. Sin trampas: nada de bucles, nada de `Math.min()` yendo hacia atrás. Tiene que haber una llamada a sí mismo.

El algoritmo de Euclides dice:
- Si `b == 0`, el MCD es `a`.
- Si no, el MCD de `a` y `b` es el MCD de `b` y `a % b`.

```java
public static int mcd(int a, int b) {
    // tu código aquí
}
```

Ejemplo: `mcd(48, 18)` → 6. `mcd(100, 25)` → 25.

---

## ⭐ Ejercicio 2: Contar ocurrencias recursivo

Dado un array de enteros y un número objetivo, cuenta cuántas veces aparece ese número en el array **usando recursividad**. Sin bucles, sin streams, sin trampas.

```java
public static int contarOcurrencias(int[] arr, int objetivo, int indice) {
    // tu código aquí
}
```

Ejemplo: `contarOcurrencias(new int[]{1, 2, 3, 2, 4, 2, 5}, 2, 0)` → 3.

**Pista:** Si el índice llega al final del array, devuelve 0. Si no, comprueba si el elemento actual es el objetivo y suma 1 o 0, luego llama recursivamente con `indice + 1`.

---

## ⭐⭐ Ejercicio 3: Invertir número recursivo

Dado un número entero positivo, devuelve su inverso. Es decir, 1234 se convierte en 4321. **Sin convertir a String.** Todo con operaciones matemáticas y recursividad.

```java
public static int invertirNumero(int n) {
    // tu código aquí
}
```

Ejemplo: `invertirNumero(1234)` → 4321. `invertirNumero(700)` → 7 (los ceros a la izquierda se pierden, como debe ser).

**Pista:** Necesitas un método auxiliar que lleve la cuenta del resultado parcial. Algo así como `invertirAux(n, 0)`.

---

## ⭐⭐ Ejercicio 4: Combinaciones de un array (backtracking)

Dado un array de enteros y un número `k`, genera **todas las combinaciones posibles** de tamaño `k` de los elementos del array. El orden de los elementos dentro de cada combinación no importa, y no debe haber combinaciones repetidas.

```java
public static List<List<Integer>> combinaciones(int[] arr, int k) {
    // tu código aquí
}
```

Ejemplo: `combinaciones(new int[]{1, 2, 3}, 2)` devuelve `[[1,2], [1,3], [2,3]]`.

**Pista:** Es backtracking clásico. Lleva un índice de inicio para evitar repeticiones. En cada paso, decides si incluyes el elemento actual o no. Cuando la combinación actual llega a tamaño `k`, la añades al resultado.

---

## ⭐⭐⭐ Ejercicio 5: N-Reinas (backtracking)

El clásico de los clásicos. Coloca N reinas en un tablero de N×N de forma que ninguna se amenace entre sí. Dos reinas se amenazan si están en la misma fila, columna o diagonal.

```java
public static List<int[][]> resolverNReinas(int n) {
    // Devuelve todas las soluciones posibles
}
```

O más sencillo: implementa un método que **imprima** todas las soluciones para N=4, N=5 y N=8.

```java
public static boolean resolver(int[][] tablero, int col) {
    // tu código aquí
}
```

**Pista:** Coloca una reina por columna. Para cada columna, prueba todas las filas. Antes de colocar, verifica que no haya otra reina en la misma fila ni en las diagonales. Si llegas a la última columna, has encontrado una solución. Si no, retrocede (backtrack). Para N=4 hay 2 soluciones.

---

## ⭐⭐⭐ Ejercicio 6: CodeWars — Tribonacci Sequence

Resuelve la kata **"Tribonacci Sequence"** (6 kyu) en CodeWars.

Bueno, el Fibonacci se ha quedado obsoleto. Ahora toca el Tribonacci: igual pero sumando los tres últimos en lugar de dos. Recibes un array `signature` de 3 números y un `n` que indica cuántos elementos debe tener la secuencia resultante.

```java
public double[] tribonacci(double[] s, int n) {
    // tu código aquí
}
```

Ejemplo: `tribonacci([1,1,1], 10)` → `[1,1,1,3,5,9,17,31,57,105]`

> **Pista:** Si `n == 0`, devuelve array vacío. Si `n <= 3`, devuelve solo los primeros `n` elementos de la firma. Para el resto, itera desde 3 hasta n-1 sumando los tres anteriores. Puedes hacerlo iterativo o recursivo. El iterativo es más eficiente, pero el recursivo queda más bonito.

---

## ⭐⭐⭐ Ejercicio 7: AceptaElReto — 140 Suma de dígitos

Resuelve el problema **140 — Suma de dígitos** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=140).

Dado un número, suma sus dígitos. Si el resultado tiene más de un dígito, vuelve a sumar. Repite hasta obtener un solo dígito. Es la "raíz digital" o "suma de dígitos recursiva".

Ejemplo: 987 → 9+8+7 = 24 → 2+4 = 6. Devuelve 6.

El problema lee números hasta que se introduce un 0.

> **Pista:** Puedes implementarlo con un método recursivo: si `n < 10`, devuelve `n`. Si no, suma los dígitos de `n` y llama recursivamente con el resultado. Para extraer dígitos: `n % 10` da el último, `n / 10` quita el último.

---

## ⭐⭐⭐ Ejercicio 8: AceptaElReto — 162 Suma de dígitos (otra vez no)

Bromita. El verdadero octavo ejercicio no existe, pero si has llegado hasta aquí, ya has hecho suficiente recursividad por hoy. Ve a tomarte un café. O una Coca-Cola. O agua, que es más sano.

---

## 📚 Referencias

| Plataforma | Problema | Dificultad |
|---|---|---|
| CodeWars | Tribonacci Sequence | 6 kyu |
| CodeWars | Sum of Digits / Digital Root | 6 kyu |
| AceptaElReto | 140 — Suma de dígitos | Fácil |
| AceptaElReto | 162 — Suma de dígitos | Fácil |
