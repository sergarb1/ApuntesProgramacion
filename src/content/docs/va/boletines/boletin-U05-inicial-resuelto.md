---
title: Butlletí U05 — Inicial (Resolt)
description: Els mateixos exercicis bàsics del butlletí inicial amb les seues solucions
---

# 📝 Butlletí U05 — Inicial (Resolt)

> Les solucions estan amagades darrere de cada 🔄. Primer intenta resoldre'ls tu; mirar la resposta abans d'intentar-ho és com copiar en un examen de màgia: el truc s'espatla.

---

## Exercici 1: El factorial del valent

<details>
<summary>🔄 Solució</summary>

```java
public class FactorialValent {

    static long fact(int n) {
        if (n <= 1) return 1;
        return n * fact(n - 1);
    }

    public static void main(String[] args) {
        System.out.println("fact(5)  = " + fact(5));   // 120
        System.out.println("fact(0)  = " + fact(0));   // 1
        System.out.println("fact(10) = " + fact(10));  // 3628800
    }
}
```

Eixida: `fact(5) = 120`, `fact(0) = 1`, `fact(10) = 3628800`.

</details>

---

## Exercici 2: L'àvia suma l'array

<details>
<summary>🔄 Solució</summary>

```java
public class SumaRecursiva {

    static int sumar(int[] arr, int indice) {
        if (indice == arr.length) return 0;
        return arr[indice] + sumar(arr, indice + 1);
    }

    public static void main(String[] args) {
        int[] datos = {3, 8, 2, 10, 5};
        System.out.println("Suma: " + sumar(datos, 0));   // 28
    }
}
```

Eixida: `Suma: 28`. El cas base quan `indice` ix de l'array torna 0 (element neutre de la suma).

</details>

---

## Exercici 3: Què imprimeix? — la compte arrere recursiva

<details>
<summary>🔄 Solució</summary>

```
3
2
1
¡BOOM!
```

Imprimix 3, 2 i 1 mentre baixa recursivament, i en arribar al cas base (`n == 0`) fa ¡BOOM! i la pila es va desenrotllant sense fer res més.

</details>

---

## Exercici 4: La potència de l'aprenent

<details>
<summary>🔄 Solució</summary>

```java
public class PotenciaRecursiva {

    static double potencia(double base, int exponente) {
        if (exponente == 0) return 1;
        return base * potencia(base, exponente - 1);
    }

    public static void main(String[] args) {
        System.out.println("2^10 = " + potencia(2, 10));   // 1024
        System.out.println("3^3  = " + potencia(3, 3));    // 27
        System.out.println("5^0  = " + potencia(5, 0));    // 1
    }
}
```

Eixida: `2^10 = 1024.0`, `3^3 = 27.0`, `5^0 = 1.0`.

</details>

---

## Exercici 5: El detectiu de dígits

<details>
<summary>🔄 Solució</summary>

```java
public class ContadorDigitos {

    static int contarDigitos(int n) {
        if (n < 10) return 1;
        return 1 + contarDigitos(n / 10);
    }

    public static void main(String[] args) {
        System.out.println("12345 té " + contarDigitos(12345) + " dígits");  // 5
        System.out.println("7 té " + contarDigitos(7) + " dígits");          // 1
    }
}
```

Eixida: `12345 té 5 dígits`, `7 té 1 dígit`. Cada crida lleva l'última xifra (`n / 10`) i suma 1.

</details>

---

## Exercici 6: El mirall de lletres

<details>
<summary>🔄 Solució</summary>

```java
public class InvertirText {

    static String invertir(String s) {
        if (s.isEmpty()) return "";
        return invertir(s.substring(1)) + s.charAt(0);
    }

    public static void main(String[] args) {
        System.out.println("\"hola\" → " + invertir("hola"));   // aloh
        System.out.println("\"juan\" → " + invertir("juan"));    // nauj
    }
}
```

Eixida: `"hola" → aloh`, `"juan" → nauj`. La crida recursiva primer invertix la resta i després concatena el primer caràcter al final.

</details>

---

## Exercici 7: Què imprimeix? — l'enigma del stack

<details>
<summary>🔄 Solució</summary>

```
10
```

És una **suma de dígits recursiva**: 4 + 3 + 2 + 1 = 10. En cada crida, `n % 10` extrau l'última xifra i `n / 10` la lleva al nombre.

</details>

---

## Exercici 8: El guardià dels palíndroms

<details>
<summary>🔄 Solució</summary>

```java
public class GuardiaPalindroms {

    static boolean esPalindromo(String s, int inicio, int fin) {
        if (inicio >= fin) return true;
        if (s.charAt(inicio) != s.charAt(fin)) return false;
        return esPalindromo(s, inicio + 1, fin - 1);
    }

    public static void main(String[] args) {
        System.out.println("reconocer: " + esPalindromo("reconocer", 0, 9));  // true
        System.out.println("salas:     " + esPalindromo("salas", 0, 4));      // true
        System.out.println("hola:      " + esPalindromo("hola", 0, 3));       // false
    }
}
```

Eixida: `reconocer: true`, `salas: true`, `hola: false`. El truc: comparar les puntes i, si no coincidixen, tornar `false` sense gastar més stack.

</details>

---

## Exercici 9: CodeWars — Factorial

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {

    public static long factorial(int n) {
        if (n <= 1) return 1;
        return n * factorial(n - 1);
    }
}
```

Amb `factorial(5)` → `120` i `factorial(0)` → `1`. El cas base `n <= 1` cobrix tant el 0 com l'1, i el cas recursiu encadena les multiplicacions.

</details>
