---
title: Boletín U05 — Extras
description: Katas de CodeWars y problemas de AceptaElReto sobre recursividad y ordenación para los valientes
---

# 📝 Boletín U05 — Extras

> ¿Te has quedado con ganas de más? Esta sección es para los que quieren llegar al examen con el stack templado: 4 katas de CodeWars y 2 problemas de AceptaElReto. Cada pista está escondida en su desplegable para no arruinar el misterio.

---

## 🥋 CodeWars

> Regístrate en [CodeWars](https://www.codewars.com), elige Java y resuelve las katas por orden. Empiezan asequibles y suben de nivel.

---

### Kata 1: Factorial (7 kyu)

En [CodeWars](https://www.codewars.com/kata/54ff0d1f355cfd20e60001fc).

En matemáticas, el factorial de un entero no negativo `n`, denotado `n!`, es el producto de todos los enteros positivos menores o iguales que `n`:

```
n! = 1 * 2 * 3 * ... * n
```

Con la convención de que `0! = 1`. Implementa `public static long factorial(int n)` con recursividad.

<details>
<summary>💡 Pista</summary>

Caso base `n <= 1` → 1; caso recursivo `n * factorial(n - 1)`.

</details>

---

### Kata 2: Descending Order (7 kyu)

En [CodeWars](https://www.codewars.com/kata/5467e4d82edf8bbf40000155).

Toma un número no negativo y devuelve el **número mayor posible** reordenando sus dígitos de mayor a menor. Ejemplos:

- `42145` → `54421`
- `145263` → `654321`
- `123456789` → `987654321`

<details>
<summary>💡 Pista</summary>

Convierte el número a `String`, pasa a un array de `char` o `int`, ordénalo descendente y reconstruye el número con `Long.parseLong`. Este ejercicio te pide ordenar, no recursividad: usa lo aprendido.

</details>

---

### Kata 3: Are the numbers in order? (7 kyu)

En [CodeWars](https://www.codewars.com/kata/56b7f2f3f18876033f000307).

Escribe `public static boolean isAscOrder(int[] arr)` que devuelva `true` si los números están **estrictamente en orden ascendente** (cada uno mayor que el anterior) y `false` en caso contrario.

- `[1, 2, 3, 4]` → true
- `[1, 4, 13, 97, 508, 717]` → true
- `[1, 3, 2]` → false
- `[9, 5, 5]` → false (no es estrictamente ascendente)

<details>
<summary>💡 Pista</summary>

Un solo `for` con `i` de 1 hasta el final comparando `arr[i - 1] >= arr[i]` → si alguna vez se cumple, devuelve `false` al momento.

</details>

---

### Kata 4: Tribonacci Sequence (6 kyu)

En [CodeWars](https://www.codewars.com/kata/556deca17c58da83c00002db).

Igual que Fibonacci pero con tres números de arranque: cada término es la suma de los tres anteriores. El enunciado siempre da una semilla `double[] signature` de 3 elementos y un número `n`. Devuelve los primeros `n` términos:

- `{1, 1, 1}, 10` → `{1, 1, 1, 3, 5, 9, 17, 31, 57, 105}`
- `{0, 0, 1}, 10` → `{0, 0, 1, 1, 2, 4, 7, 13, 24, 44}`
- `{1, 1, 1}, 1` → `{1}` (recuerda: si `n < 3`, solo devuelves los que pida)

<details>
<summary>💡 Pista</summary>

Si `n < 3`, devuelve un subarray con los primeros `n` de la semilla. Si no, crea un `double[n]`, copia la semilla al inicio y rellena de `i = 3` en adelante con `arr[i] = arr[i-1] + arr[i-2] + arr[i-3]`. Puedes hacerlo iterativo; el "truco de tribonacci" no necesita recursividad.

</details>

---

## 🏆 AceptaElReto

> Dos problemas del concurso [ProgramaMe](https://aceptaelreto.com). El primero es un clásico absoluto de la recursividad; el segundo, un sudorífero de ordenación.

---

### Reto 1: Móviles (104)

En [AceptaElReto](https://aceptaelreto.com/problem/statement.php?id=104).

Un móvil colgante se describe con cuatro enteros: `pi di pd dd` (peso y distancia izquierdos, peso y distancia derechos). La barra está equilibrada si `pi * di == pd * dd`. Un peso `0` indica que ahí cuelga otro móvil, que se describe a continuación en la entrada. Debes decir `SI` si el móvil completo está equilibrado (barra Y submóviles) y `NO` en caso contrario. La entrada termina con `0 0 0 0`.

<details>
<summary>💡 Pista</summary>

No hay contador de casos: los móviles se leen **recursivamente**. Crea un método que lea una barra y devuelva el peso total del móvil si está equilibrado, o `-1` si no. Cuando un peso es 0, llama al método para leer el submóvil. Un submóvil desequilibrado (devuelve `-1`) contamina toda la cadena hacia arriba.

</details>

---

### Reto 2: Tortitas (143)

En [AceptaElReto](https://aceptaelreto.com/problem/statement.php?id=143).

Tienes una pila de tortitas con tamaños distintos. Con una espátula puedes dar la vuelta a las `k` tortitas superiores (invertir el orden de las primeras `k`). Encuentra el mínimo número de vueltas para ordenarlas de mayor (arriba) a menor (abajo). La entrada termina con `0`. Para cada caso, imprime cuántas vueltas necesitas.

<details>
<summary>💡 Pista</summary>

Greedy: busca la tortita más grande que no esté en su sitio. Si no está arriba, dale la vuelta hasta su posición (invertir `k` donde `k` es su posición) para subirla. Luego invierte toda la parte sin ordenar para bajarla a su sitio. Cada tortita queda fijada para siempre: ese es el famoso "flip-sort". Con que hagas 2 vueltas por tortita mal colocada te vale.

</details>
