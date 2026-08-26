---
title: Boletín U05 — Avanzado
description: Ejercicios intermedios de recursividad, divide y vencerás y ordenación para sudar el stack
---

# 📝 Boletín U05 — Avanzado

> La zona intermedia: aquí ya no basta con copiar el patrón, hay que pensar. Cada ejercicio trae su **Pista** para cuando lleves 10 minutos dándole vueltas.

---

## Ejercicio 1: ⭐ Fibonacci con el contador chivato

Crea un programa `FiboContador` que calcule el enésimo Fibonacci con la versión ingenua recursiva PERO que además cuente **cuántas llamadas hace en total**.

```java
static long llamadas;   // variable estática que suma 1 en cada llamada
static long fibo(int n)
```

Pruébalo con `fibo(30)`. ¿Cuántas llamadas hace? ¿Y cuántas haría si solo sumaras los índices `fibo(30) + fibo(29) + ... + 1`?

**Pista:** súmale 1 a `llamadas` como primera línea del método, antes de cualquier caso base.

---

## Ejercicio 2: ⭐⭐ ¿Qué imprime? — el árbol de llamadas

Sin ejecutar, escribe la salida exacta y el **orden de las llamadas** (quién llama a quién):

```java
public class ArbolRaro {
    static void pintar(int n) {
        if (n == 0) return;
        System.out.println("bajo " + n);
        pintar(n - 1);
        System.out.println("subo " + n);
    }

    public static void main(String[] args) {
        pintar(3);
    }
}
```

**Pista:** el `System.out.println` de después de la llamada recursiva no se ejecuta hasta que esa llamada termina. Dibuja la pila con lápiz y papel.

---

## Ejercicio 3: ⭐⭐ El palíndromo rebelde

Amplía el palíndromo para que **ignore espacios, signos y mayúsculas**:

- `"Anita lava la tina"` → true
- `"Dábale arroz a la zorra el abad"` → true
- `"No soy un palíndromo"` → false

```java
static boolean esPalindromoFrase(String s, int inicio, int fin)
```

**Pista:** en vez de comparar directamente `s.charAt(inicio)`, saltate los caracteres que no sean letras avanzando `inicio` o retrocediendo `fin` en el propio método. Usa `Character.isLetter()` y `Character.toLowerCase()`.

---

## Ejercicio 4: ⭐⭐ La potencia exprés (divide y vencerás)

Escribe un programa `PotenciaRapida` con un método recursivo `static long potenciaRapida(int base, int exponente)` que calcule `base^exponente` en **O(log n)**:

```
potenciaRapida(b, e):
  si e == 0 → 1
  mitad = potenciaRapida(b, e / 2)
  si e es par  → mitad * mitad
  si e es impar → mitad * mitad * b
```

Pruébalo con `potenciaRapida(2, 20)` → 1048576. ¿Cuántas llamadas hace comparado con `potencia(2, 20)` del boletín inicial?

**Pista:** ojo con el redondeo: cuando `e` es impar, `e / 2` se queda con la parte entera y por eso multiplicas por `b` una vez más.

---

## Ejercicio 5: ⭐⭐⭐ Quicksort con mediana de tres

Mejora el Quicksort de la unidad: en vez de coger el primer elemento como pivote, elige la **mediana de tres** (primero, medio y último) para evitar el peor caso con arrays casi ordenados.

```java
static void quicksort(int[] arr, int inicio, int fin)
```

Pruébalo con el array ya ordenado `{1, 2, 3, 4, 5, 6, 7, 8}`. ¿Cuántas particiones hace tu versión con mediana de tres?

**Pista:** `int medio = (inicio + fin) / 2;` compara `arr[inicio]`, `arr[medio]` y `arr[fin]` y coloca el del medio en `arr[inicio]` (intercambiándolos) antes de particionar con la técnica de la unidad.

---

## Ejercicio 6: ⭐⭐⭐ Mergesort con el contador de comparaciones

Modifica el Mergesort de la unidad para que cuente **cuántas comparaciones** hace la fusión en total, y muestra el número al final.

```java
static long comparaciones;   // suma 1 en cada comparación de la fusión
```

Pruébalo con `{9, 8, 7, 6, 5, 4, 3, 2, 1}` (el peor caso visual). ¿Cuántas comparaciones? ¿Y con `{1, 2, 3, 4, 5, 6, 7, 8, 9}`?

**Pista:** en la fusión, suma 1 en cada `while` que compara dos elementos. En los bucles donde una lista ya se ha acabado, también hay comparaciones contra el final del array: cuéntalas con la misma variable.

---

## Ejercicio 7: ⭐⭐⭐ Las torres de Hanói con contador

Implementa las Torres de Hanói recursivas de la unidad y añade un **contador de movimientos**:

```java
static int movimientos;
static void hanoi(int n, char origen, char destino, char auxiliar)
```

Cada vez que se mueva un disco, imprime `"Mueve disco X de ORIGEN a DESTINO"` y suma 1 al contador. Al final, imprime el total. Pruébalo con 3, 4 y 8 discos.

**Pista:** con `n` discos el mínimo de movimientos es `2^n - 1`. Si tu contador con 8 discos no da 255, algo estás moviendo de más.

---

## Ejercicio 8: ⭐⭐⭐ CodeWars — Sort Numbers

Resuelve la kata **"Sort Numbers"** (7 kyu) en [CodeWars](https://www.codewars.com/kata/5174a4c0f2769dd8b1000003).

Crea el método `public static int[] sortArray(int[] nums)` que devuelva el array ordenado de menor a mayor. Si `nums` es `null` o está vacío, devuelve un array vacío.

**Pista:** haz un método `int[] copia` (para no mutar el original) y ordénalo con `Arrays.sort()`. O, si te sientes con ganas, implementa tu propio Mergesort sobre la copia.

---

## Ejercicio 9: ⭐⭐⭐ AceptaElReto — 104 Móviles

Resuelve el problema **"Móviles" (104)** de [AceptaElReto](https://aceptaelreto.com/problem/statement.php?id=104).

Un móvil cuelga de una barra con dos pesos `izq` y `der` a distancias `dizq` y `dder`. Está equilibrado si `izq * dizq == der * dder` y además las dos subbarras (que pueden contener otros móviles) también lo están. Un peso `0` significa que ahí cuelga otro móvil, que se describe a continuación. Devuelve `SI` si el móvil está equilibrado y `NO` en caso contrario.

**Pista:** no hay un caso base con `n`: los móviles se leen recursivamente. Lee `izq dizq der dder`; si `izq == 0`, hay que leer (y comprobar) un submóvil completo antes de continuar; si `der == 0`, otro. Recuerda que **ambos** submóviles deben estar equilibrados, no solo la barra.
