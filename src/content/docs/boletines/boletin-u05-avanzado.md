---
title: Boletín U05 — Avanzado
description: Ejercicios de dificultad progresiva para exprimir la unidad
---

# 📝 Boletín U05 — Avanzado

> Dificultad progresiva. ⭐ para calentar, ⭐⭐ para pensar, ⭐⭐⭐ para concursar. Cada ejercicio incluye una pista (resiste a mirarla).

---

## ⭐ Ejercicio 1: El clasificador de notas

Escribe un programa con un método `public static String calificar(double nota)` que devuelva la calificación textual con las mismas reglas de la U04: `>= 9` → "Sobresaliente", `>= 7` → "Notable", `>= 5` → "Aprobado", `>= 0` → "Suspenso", y fuera de rango → "Nota inválida".

El `main` debe imprimir el resultado de `calificar(8.7)`, `calificar(4.5)`, `calificar(11)` y `calificar(-2)`, uno por línea.

**Pista:** el método **devuelve** cadenas con `return`, no imprime nada. Comprueba primero si la nota está fuera de rango.

---

## ⭐ Ejercicio 2: Tablas a demanda

Escribe un método `public static void imprimirTabla(int n)` que imprima la tabla de multiplicar del `n` (del 1 al 10), una línea por cada multiplicación.

El `main` debe pedirle la tabla del 7, luego un separador `---`, y luego la tabla del 3.

**Pista:** el método no sabe nada del 7 ni del 3: solo conoce su parámetro `n`. Un `for` y a volar.

---

## ⭐⭐ Ejercicio 3: ¿Qué imprime? — la sombra del parámetro

Sin ejecutar, escribe la salida exacta:

```java
public class Sombra {
    static int valor = 100;

    public static void cambiar(int valor) {
        valor = valor + 1;
    }

    public static void main(String[] args) {
        cambiar(5);
        System.out.println(valor);
    }
}
```

**Pista:** dentro de `cambiar`, el parámetro `valor` tapa al campo `valor`. ¿Cuál de los dos cambia con `valor + 1`?

---

## ⭐⭐ Ejercicio 4: La suma de dígitos

Escribe un método `public static int sumaDigitos(int n)` que devuelva la suma de las cifras de `n` (por ejemplo, `1234` → `10`).

El `main` debe mostrar `sumaDigitos(1234)` y `sumaDigitos(905)`.

**Pista:** `n % 10` saca el último dígito y `n / 10` se lo come; repite con un `while` hasta que `n` sea 0. Si el número puede ser negativo, usa `Math.abs(n)` al principio.

---

## ⭐⭐⭐ Ejercicio 5: ¿Qué imprime? — el return que corta

Sin ejecutar, escribe la salida exacta:

```java
public class Corte {
    public static String signo(int n) {
        if (n < 0) {
            return "negativo";
        }
        if (n == 0) {
            return "cero";
        }
        return "positivo";
    }

    public static int primeroPar(int a, int b) {
        if (a % 2 == 0) {
            return a;
        }
        if (b % 2 == 0) {
            return b;
        }
        return -1;
    }

    public static void main(String[] args) {
        System.out.println(signo(-5) + " " + signo(0) + " " + signo(4));
        System.out.println(primeroPar(7, 4));
        System.out.println(primeroPar(3, 5));
    }
}
```

**Pista:** en cada método solo se ejecuta **un** `return`: el resto del código queda muerto. Recorre los casos uno a uno.

---

## ⭐⭐⭐ Ejercicio 6: Divide el informe

Este programa funciona, pero todo vive dentro del `main`:

```java
public class Informe {
    public static void main(String[] args) {
        double a = 7.5, b = 9.0, c = 4.5, d = 8.25;

        double media = (a + b + c + d) / 4;
        double maximo = a;
        if (b > maximo) maximo = b;
        if (c > maximo) maximo = c;
        if (d > maximo) maximo = d;
        double minimo = a;
        if (b < minimo) minimo = b;
        if (c < minimo) minimo = c;
        if (d < minimo) minimo = d;

        System.out.println("Media: " + media);
        System.out.println("Máximo: " + maximo);
        System.out.println("Mínimo: " + minimo);
    }
}
```

Trocealo en **tres métodos** que devuelven `double`: `media(a, b, c, d)`, `maximo(a, b, c, d)` y `minimo(a, b, c, d)`. El `main` debe quedarse en tres líneas de `println` que llaman a los métodos.

**Pista:** los tres métodos son `public static double ...` con `return` y ninguna llamada a `System.out`. Comparar `a, b, c, d` es exactamente lo mismo dentro de cada uno.

---

## ⭐⭐ Ejercicio 7: El contador de vocales

Escribe un método `public static int contarVocales(String texto)` que devuelva cuántas vocales hay en `texto` (sin distinguir mayúsculas de minúsculas).

El `main` debe imprimir `contarVocales("Hola mundo")` (da `4`) y `contarVocales("zzz")` (da `0`).

**Pista:** recorre con `for (int i = 0; i < texto.length(); i++)`, mira cada carácter con `charAt(i)` y compáralo con las cinco vocales en sus dos versiones.

---

## ⭐⭐⭐ Ejercicio 8: CodeWars — 'Disemvowel' Trolls

Resuelve la kata **"'Disemvowel' Trolls"** (7 kyu) en [CodeWars](https://www.codewars.com/kata/52fba66badcd10859f00097e).

Crea el método `public static String disemvowel(String str)` que devuelve la cadena sin vocales.

**Ejemplo:** `"This website is for losers LOL!"` → `"Ths wbst s fr lsrs LL!"`.

**Pista:** recorre con `charAt` y concatena solo lo que no sea vocal. La solución con regex llega en la U13; aquí nos vale un `if` con muchas comparaciones.

---

## ⭐⭐⭐ Ejercicio 9: AceptaElReto — 165 Número hyperpar

Resuelve el problema **165 — Número hyperpar** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=165).

Un número es *hyperpar* cuando **todos** sus dígitos son pares. La entrada contiene un número por línea hasta un número negativo (que no se procesa). Para cada caso, muestra `SI` o `NO`.

**Ejemplo:**

```
2460
1234
2
-1
```

```
SI
NO
SI
```

**Pista:** envuelve la comprobación en un método `public static boolean esHyperpar(int n)`: con un `while` saca dígitos con `n % 10` y, si alguno es impar, `return false` en cuanto lo encuentres. Si el bucle acaba sin encontrar ninguno, `return true`.

---

## 📚 Referencias

| Plataforma | Problema | Dificultad |
|---|---|---|
| AceptaElReto | 165 — Número hyperpar | Fácil |
| AceptaElReto | 115 — Número de Kaprekar | Medio |
| CodeWars | Century From Year (8 kyu) | Principiante |
| CodeWars | 'Disemvowel' Trolls (7 kyu) | Aficionado |
| CodeWars | Volume of a Cuboid (8 kyu) | Principiante |
| CodeWars | Drink about (8 kyu) | Principiante |
