---
title: "Boletín 5 - Inicial: Algorítmica II"
nav_order: 1
---
Sin soluciones. La recursividad es como caer por un pozo, pero el pozo se repite a sí mismo.

---

## Ejercicio 1: Potencia recursiva

Implementa una función recursiva que calcule `a` elevado a `n` (con `n >= 0`). Sin usar `Math.pow()` ni bucles.

```java
public static int potencia(int a, int n) {
    // tu código aquí
}
```

Ejemplo: `potencia(2, 3)` → 8, `potencia(5, 0)` → 1.

**Pista:** Cualquier número elevado a 0 es 1. Para el resto, `a^n = a * a^(n-1)`.

---

## Ejercicio 2: Contar dígitos recursivo

Implementa una función recursiva que cuente cuántos dígitos tiene un número entero positivo.

```java
public static int contarDigitos(int n) {
    // tu código aquí
}
```

Ejemplo: `contarDigitos(12345)` → 5, `contarDigitos(7)` → 1, `contarDigitos(0)` → 1.

---

## Ejercicio 3: ¿Qué imprime?

Sin ejecutar, di qué imprime este código malvado:

```java
public class Misterio {
    public static int enigma(int x) {
        if (x < 10) return x;
        return enigma(x / 10) + x % 10;
    }

    public static void main(String[] args) {
        System.out.println(enigma(1234));
        System.out.println(enigma(999));
        System.out.println(enigma(5));
    }
}
```

---

## Ejercicio 4: Palíndromo recursivo

Implementa una función recursiva que determine si un String es un palíndromo (se lee igual al derecho y al revés).

```java
public static boolean esPalindromo(String s) {
    // tu código aquí
}
```

Ejemplos: `esPalindromo("ana")` → true, `esPalindromo("reconocer")` → true, `esPalindromo("hola")` → false.

**Pista:** Un String es palíndromo si el primer y último carácter son iguales, y el substring interno también lo es. Los casos base son: length 0 o 1 → true.

---

## Ejercicio 5: Encuentra el error

¿Qué le pasa a este código? Compila, pero no funciona como esperamos. Explica por qué:

```java
public static int factorial(int n) {
    return n * factorial(n - 1);
}
```

¿Qué ocurre si llamamos a `factorial(5)`?

---

## Ejercicio 6: Sumatorio recursivo

Implementa una función recursiva que sume todos los números desde 1 hasta `n`.

```java
public static int sumatorio(int n) {
    // tu código aquí
}
```

Ejemplo: `sumatorio(5)` → 15 (1+2+3+4+5).

---

## Ejercicio 7: CodeWars — Reversed Strings

Resuelve la kata **"Reversed Strings"** (8 kyu) en CodeWars.

Completa la función `solution` que recibe un String y devuelve el String al revés. Fácil, ¿no? Pues hazlo **recursivamente**, no con `StringBuilder.reverse()`.

```java
public class StringReverser {
    public static String solution(String s) {
        // tu código recursivo aquí
    }
}
```

---

## Ejercicio 8: AceptaElReto — 165 Número hyperpar

Resuelve el problema **165 — Número hyperpar** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=165).

Un número es "hyperpar" si todos sus dígitos son pares. Dada una secuencia de números hasta que se introduzca -1, indica si cada uno es hyperpar o no.

Ejemplo: 246 → SI, 2486 → SI, 123 → NO, 0 → SI.

> **Pista:** Puedes extraer dígitos con `n % 10` y comprobar si son pares. Si encuentras uno impar, dejas de mirar. El 0 se considera par, así que 0 y 00 son hyperpar.
