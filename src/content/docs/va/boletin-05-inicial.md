---
title: "Boletí 5 - Inicial: Algorísmica II"
nav_order: 1
---
Sense solucions. La recursivitat és com caure per un pou, però el pou es repeteix a si mateix.

---

## Exercici 1: Potència recursiva

Implementa una funció recursiva que calcule `a` elevat a `n` (amb `n >= 0`). Sense usar `Math.pow()` ni bucles.

```java
public static int potencia(int a, int n) {
    // el teu codi ací
}
```

Exemple: `potencia(2, 3)` → 8, `potencia(5, 0)` → 1.

---

## Exercici 2: Comptar dígits recursiu

Implementa una funció recursiva que compte quants dígits té un nombre enter positiu.

```java
public static int contarDigits(int n) {
    // el teu codi ací
}
```

Exemple: `contarDigits(12345)` → 5, `contarDigits(7)` → 1, `contarDigits(0)` → 1.

---

## Exercici 3: Què imprimeix?

Sense executar, digues què imprimeix este codi malvat:

```java
public class Misteri {
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

## Exercici 4: Palíndrom recursiu

Implementa una funció recursiva que determine si un String és un palíndrom (es llig igual cap endavant i cap arrere).

```java
public static boolean esPalindrom(String s) {
    // el teu codi ací
}
```

Exemples: `esPalindrom("ana")` → true, `esPalindrom("reconéixer")` → true, `esPalindrom("hola")` → false.

---

## Exercici 5: Troba l'error

Què li passa a aquest codi? Compila, però no funciona com esperem. Explica per què:

```java
public static int factorial(int n) {
    return n * factorial(n - 1);
}
```

Què ocorre si cridem `factorial(5)`?

---

## Exercici 6: Sumatori recursiu

Implementa una funció recursiva que sume tots els nombres des de 1 fins a `n`.

```java
public static int sumatori(int n) {
    // el teu codi ací
}
```

Exemple: `sumatori(5)` → 15 (1+2+3+4+5).

---

## Exercici 7: CodeWars — Reversed Strings

Resol la kata **"Reversed Strings"** (8 kyu) en CodeWars.

Completa la funció `solution` que rep un String i torna el String al revés. Fàcil, oi? Doncs fes-ho **recursivament**, no amb `StringBuilder.reverse()`.

```java
public class StringReverser {
    public static String solution(String s) {
        // el teu codi recursiu ací
    }
}
```

---

## Exercici 8: AceptaElReto — 165 Número hyperpar

Resol el problema **165 — Número hyperpar** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=165).

Un nombre és "hyperpar" si tots els seus dígits són parells. Donada una seqüència de nombres fins que s'introduïsca -1, indica si cada un és hyperpar o no.

Exemple: 246 → SI, 2486 → SI, 123 → NO, 0 → SI.
