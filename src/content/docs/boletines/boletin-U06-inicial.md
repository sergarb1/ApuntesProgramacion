---
title: Boletín U06 — Inicial
description: Ejercicios básicos de recursividad para calentar los motores del stack
---

# 📝 Boletín U06 — Inicial

> Sin soluciones. Sin prisas. Abre el IDE, respira hondo y recuerda: para entender la recursividad, primero tienes que entender la recursividad.

---

## Ejercicio 1: El factorial del valiente

Escribe un programa llamado `FactorialValiente` con un método recursivo `static long fact(int n)` que calcule el factorial de un número. Pruébalo con `fact(5)`, `fact(0)` y `fact(10)`.

Recuerda: `0! = 1` y `n! = n * (n-1)!`.

---

## Ejercicio 2: La abuela suma el array

Escribe un programa llamado `SumaRecursiva` que sume todos los elementos de un array usando un método recursivo:

```java
static int sumar(int[] arr, int indice)
```

Si `indice == arr.length`, devuelve 0. Si no, `arr[indice] + sumar(arr, indice + 1)`. Pruébalo con `{3, 8, 2, 10, 5}` → debe dar 28.

---

## Ejercicio 3: ¿Qué imprime? — la cuenta atrás recursiva

Sin ejecutar, escribe la salida exacta de este programa:

```java
public class CuentaRara {
    static void cuenta(int n) {
        if (n == 0) {
            System.out.println("¡BOOM!");
            return;
        }
        System.out.println(n);
        cuenta(n - 1);
    }

    public static void main(String[] args) {
        cuenta(3);
    }
}
```

Pista: primero baja imprimiendo números y, cuando llega al caso base, hace BOOM.

---

## Ejercicio 4: La potencia del aprendiz

Escribe un programa llamado `PotenciaRecursiva` con un método recursivo `static double potencia(double base, int exponente)` que calcule `base^exponente`:

- Caso base: `exponente == 0` → devuelve 1.
- Caso recursivo: `base * potencia(base, exponente - 1)`.

Pruébalo con `potencia(2, 10)` → 1024.

---

## Ejercicio 5: El detective de dígitos

Escribe un programa llamado `ContadorDigitos` con un método recursivo `static int contarDigitos(int n)` que cuente cuántos dígitos tiene un número:

- Caso base: `n < 10` → devuelve 1.
- Caso recursivo: `1 + contarDigitos(n / 10)`.

Pruébalo con `12345` → debe dar 5.

---

## Ejercicio 6: El espejo de letras

Escribe un programa llamado `InvertirTexto` con un método recursivo `static String invertir(String s)` que devuelva el texto al revés:

- Caso base: `s.isEmpty()` → devuelve `""`.
- Caso recursivo: `invertir(s.substring(1)) + s.charAt(0)`.

Pruébalo con `"hola"` → debe devolver `"aloh"`.

---

## Ejercicio 7: ¿Qué imprime? — el enigma del stack

Sin ejecutar, escribe la salida exacta:

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

Pista: `n % 10` extrae la última cifra y `n / 10` se la quita.

---

## Ejercicio 8: El guardián de los palíndromos

Escribe un programa llamado `GuardianPalindromos` con un método recursivo que compruebe si una palabra es un palíndromo (se lee igual hacia delante y hacia atrás):

```java
static boolean esPalindromo(String s, int inicio, int fin)
```

Pruébalo con `"reconocer"` (sí), `"salas"` (sí) y `"hola"` (no). Pista: si las puntas no coinciden, ya puedes devolver `false` sin seguir recursando.

---

## Ejercicio 9: CodeWars — Factorial

Resuelve la kata **"Factorial"** (7 kyu) en [CodeWars](https://www.codewars.com/kata/54ff0d1f355cfd20e60001fc).

Crea el método `public static long factorial(int n)` que devuelva el factorial de `n` (recuerda: `0! = 1`). ¡Resuélvela con recursividad, que es lo que toca!

Pista: `if (n <= 1) return 1; return n * factorial(n - 1);`
