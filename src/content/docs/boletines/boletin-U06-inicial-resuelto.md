---
title: Boletín U06 — Inicial (Resuelto)
description: Los mismos ejercicios básicos del boletín inicial con sus soluciones
---

# 📝 Boletín U06 — Inicial (Resuelto)

> Las soluciones están escondidas detrás de cada 🔄. Primero intenta resolverlos tú; mirar la respuesta antes de intentarlo es como copiar en un examen de magia: el truco se estropea.

---

## Ejercicio 1: El factorial del valiente

<details>
<summary>🔄 Solución</summary>

```java
public class FactorialValiente {

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

Salida: `fact(5) = 120`, `fact(0) = 1`, `fact(10) = 3628800`.

</details>

---

## Ejercicio 2: La abuela suma el array

<details>
<summary>🔄 Solución</summary>

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

Salida: `Suma: 28`. El caso base cuando `indice` se sale del array devuelve 0 (elemento neutro de la suma).

</details>

---

## Ejercicio 3: ¿Qué imprime? — la cuenta atrás recursiva

<details>
<summary>🔄 Solución</summary>

```
3
2
1
¡BOOM!
```

Imprime 3, 2 y 1 mientras baja recursivamente, y al llegar al caso base (`n == 0`) hace ¡BOOM! y la pila se va desenrollando sin hacer nada más.

</details>

---

## Ejercicio 4: La potencia del aprendiz

<details>
<summary>🔄 Solución</summary>

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

Salida: `2^10 = 1024.0`, `3^3 = 27.0`, `5^0 = 1.0`.

</details>

---

## Ejercicio 5: El detective de dígitos

<details>
<summary>🔄 Solución</summary>

```java
public class ContadorDigitos {

    static int contarDigitos(int n) {
        if (n < 10) return 1;
        return 1 + contarDigitos(n / 10);
    }

    public static void main(String[] args) {
        System.out.println("12345 tiene " + contarDigitos(12345) + " dígitos");  // 5
        System.out.println("7 tiene " + contarDigitos(7) + " dígitos");          // 1
    }
}
```

Salida: `12345 tiene 5 dígitos`, `7 tiene 1 dígito`. Cada llamada arranca la última cifra (`n / 10`) y suma 1.

</details>

---

## Ejercicio 6: El espejo de letras

<details>
<summary>🔄 Solución</summary>

```java
public class InvertirTexto {

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

Salida: `"hola" → aloh`, `"juan" → nauj`. La llamada recursiva primero invierte el resto y luego concatena el primer carácter al final.

</details>

---

## Ejercicio 7: ¿Qué imprime? — el enigma del stack

<details>
<summary>🔄 Solución</summary>

```
10
```

Es una **suma de dígitos recursiva**: 4 + 3 + 2 + 1 = 10. En cada llamada, `n % 10` extrae la última cifra y `n / 10` se la quita al número.

</details>

---

## Ejercicio 8: El guardián de los palíndromos

<details>
<summary>🔄 Solución</summary>

```java
public class GuardianPalindromos {

    static boolean esPalindromo(String s, int inicio, int fin) {
        if (inicio >= fin) return true;
        if (s.charAt(inicio) != s.charAt(fin)) return false;
        return esPalindromo(s, inicio + 1, fin - 1);
    }

    public static void main(String[] args) {
        System.out.println("reconocer: " + esPalindromo("reconocer", 0, 8));  // true
        System.out.println("salas:     " + esPalindromo("salas", 0, 4));      // true
        System.out.println("hola:      " + esPalindromo("hola", 0, 3));       // false
    }
}
```

Salida: `reconocer: true`, `salas: true`, `hola: false`. El truco: comparar las puntas y, si no coinciden, devolver `false` sin seguir gastando stack.

</details>

---

## Ejercicio 9: CodeWars — Factorial

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {

    public static long factorial(int n) {
        if (n <= 1) return 1;
        return n * factorial(n - 1);
    }
}
```

Con `factorial(5)` → `120` y `factorial(0)` → `1`. El caso base `n <= 1` cubre tanto el 0 como el 1, y el caso recursivo encadena las multiplicaciones.

</details>
