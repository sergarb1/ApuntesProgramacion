---
title: Butlletí U06 — Inicial
description: Exercicis bàsics de recursivitat per a escalfar els motors del stack
---

# 📝 Butlletí U06 — Inicial

> Sense solucions. Sense presses. Obri l'IDE, respira fondo i recorda: per a entendre la recursivitat, primer has d'entendre la recursivitat.

---

## Exercici 1: El factorial del valent

Escriu un programa anomenat `FactorialValent` amb un mètode recursiu `static long fact(int n)` que calcule el factorial d'un nombre. Prova'l amb `fact(5)`, `fact(0)` i `fact(10)`.

Recorda: `0! = 1` i `n! = n * (n-1)!`.

---

## Exercici 2: L'àvia suma l'array

Escriu un programa anomenat `SumaRecursiva` que sume tots els elements d'un array usant un mètode recursiu:

```java
static int sumar(int[] arr, int indice)
```

Si `indice == arr.length`, torna 0. Si no, `arr[indice] + sumar(arr, indice + 1)`. Prova'l amb `{3, 8, 2, 10, 5}` → ha de donar 28.

---

## Exercici 3: Què imprimeix? — la compte arrere recursiva

Sense executar, escriu l'eixida exacta d'este programa:

```java
public class CompteRara {
    static void compte(int n) {
        if (n == 0) {
            System.out.println("¡BOOM!");
            return;
        }
        System.out.println(n);
        compte(n - 1);
    }

    public static void main(String[] args) {
        compte(3);
    }
}
```

Pista: primer baixa imprimint nombres i, quan arriba al cas base, fa BOOM.

---

## Exercici 4: La potència de l'aprenent

Escriu un programa anomenat `PotenciaRecursiva` amb un mètode recursiu `static double potencia(double base, int exponente)` que calcule `base^exponente`:

- Cas base: `exponente == 0` → torna 1.
- Cas recursiu: `base * potencia(base, exponente - 1)`.

Prova'l amb `potencia(2, 10)` → 1024.

---

## Exercici 5: El detectiu de dígits

Escriu un programa anomenat `ContadorDigitos` amb un mètode recursiu `static int contarDigitos(int n)` que compte quants dígits té un nombre:

- Cas base: `n < 10` → torna 1.
- Cas recursiu: `1 + contarDigitos(n / 10)`.

Prova'l amb `12345` → ha de donar 5.

---

## Exercici 6: El mirall de lletres

Escriu un programa anomenat `InvertirText` amb un mètode recursiu `static String invertir(String s)` que torne el text al revés:

- Cas base: `s.isEmpty()` → torna `""`.
- Cas recursiu: `invertir(s.substring(1)) + s.charAt(0)`.

Prova'l amb `"hola"` → ha de tornar `"aloh"`.

---

## Exercici 7: Què imprimeix? — l'enigma del stack

Sense executar, escriu l'eixida exacta:

```java
public class EnigmaStack {
    static int misterio(int n) {
        if (n == 0) return 0;
        return n % 10 + misterio(n / 10);
    }

    public static void main(String[] args) {
        System.out.println(misterio(1234));
    }
}
```

Pista: `n % 10` extrau l'última xifra i `n / 10` la lleva.

---

## Exercici 8: El guardià dels palíndroms

Escriu un programa anomenat `GuardiaPalindroms` amb un mètode recursiu que comprove si una paraula és un palíndrom (es llig igual cap avant i cap arrere):

```java
static boolean esPalindromo(String s, int inicio, int fin)
```

Prova'l amb `"reconocer"` (sí), `"salas"` (sí) i `"hola"` (no). Pista: si les puntes no coincidixen, ja pots tornar `false` sense continuar recursant.

---

## Exercici 9: CodeWars — Factorial

Resol la kata **"Factorial"** (7 kyu) en [CodeWars](https://www.codewars.com/kata/54ff0d1f355cfd20e60001fc).

Crea el mètode `public static long factorial(int n)` que torne el factorial de `n` (recorda: `0! = 1`). ¡Resol-la amb recursivitat, que és el que toca!

Pista: `if (n <= 1) return 1; return n * factorial(n - 1);`
