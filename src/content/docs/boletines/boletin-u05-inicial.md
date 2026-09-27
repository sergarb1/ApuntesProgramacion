---
title: Boletín U05 — Inicial
description: Ejercicios básicos de Funciones y métodos
---

# 📝 Boletín U05 — Inicial

> Sin soluciones. Sin prisas. Abre el IDE, dale a ejecutar y deja que tus métodos hagan el trabajo pesado. Un `main` con todo dentro está bien... hasta que deja de caber.

---

## Ejercicio 1: El saludo oficial

Escribe un programa llamado `Saludo` que tenga un método `public static void saludar()` que imprima `¡Hola, Java!`. El `main` debe llamar a `saludar()` tres veces, una por línea.

Pista: el método vive fuera del `main`; el `main` solo lo invoca por su nombre con paréntesis y punto y coma.

---

## Ejercicio 2: ¿Qué pasa? — la variable fantasma

Este programa no compila. Míralo con calma y responde: ¿por qué falla y qué cambiarías para arreglarlo?

```java
public class Fantasma {
    static int puntos = 10;

    public static void sumar() {
        int extra = 5;
        puntos += extra;
    }

    public static void main(String[] args) {
        sumar();
        System.out.println(puntos);
        System.out.println(extra);
    }
}
```

Pista: `extra` nace y muere dentro de `sumar()`. El compilador no la ve desde `main`.

---

## Ejercicio 3: La ficha de presentación

Escribe un programa llamado `Ficha` con un método `public static void presentar(String nombre, int edad)` que imprima:

```
Me llamo Ana y tengo 20 años.
```

El `main` debe llamar al método con `("Ana", 20)` y con `("Luis", 15)`, cada llamada en su línea.

---

## Ejercicio 4: El primer `return`

Escribe un programa llamado `Suma` con un método `public static int sumar(int a, int b)` que **devuelva** la suma en lugar de imprimirla.

En el `main`, guarda el resultado de `sumar(3, 4)` en una variable e imprime `3 + 4 = 7`. Después imprime el resultado de `sumar(10, 20)` directamente: `10 + 20 = 30`.

Pista: `return a + b;` entrega el valor a quien llamó; no lo imprime nadie todavía.

---

## Ejercicio 5: Doble, por favor

Escribe un programa llamado `Doble` con **dos** métodos:

- `public static int calcularDoble(int n)` → devuelve el doble de `n`.
- `public static void mostrarDoble(int n)` → imprime `El doble de 6 es 12`.

El `main` debe usar los dos con el valor `6`. Fíjate en la diferencia: uno devuelve, el otro habla.

---

## Ejercicio 6: ¿Qué imprime? — el viaje de ida y vuelta

Sin ejecutar, escribe la salida exacta, línea a línea:

```java
public class Viaje {
    static int sumar(int a, int b) {
        System.out.println("sumando...");
        return a + b;
    }

    public static void main(String[] args) {
        System.out.println("antes");
        int total = sumar(3, 4);
        System.out.println("total: " + total);
    }
}
```

Pista: el programa no salta de forma mágica: se para en la llamada, ejecuta el método y vuelve con el valor en la mano.

---

## Ejercicio 7: ¿Par o impar?

Escribe un programa llamado `ParOImpar` con un método `public static boolean esPar(int n)` que devuelva `true` si el número es par.

El `main` debe comprobar el `7` y el `12` con un `if`/`else` e imprimir `7 es impar` y `12 es par`.

Pista: un solo `return` con el operador `%` de la U03.

---

## Ejercicio 8: La puerta de la edad

Escribe un programa llamado `Puerta` con un método `public static boolean mayorDeEdad(int edad)` que devuelva `true` si la persona tiene 18 años o más.

El `main` debe comprobar `15`, `18` y `30` e imprimir, una por línea:

```
15: no entra
18: entra
30: entra
```

Pista: puedes usar un ternario en cada `println`, como en el ejercicio 6 de los extras de la U04.

---

## Ejercicio 9: CodeWars — Century From Year

Resuelve la kata **"Century From Year"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/5a3fe3dde1ce0e8ed6000097).

Completa el método `public static int century(int year)` que devuelve el siglo al que pertenece un año: el primer siglo va del año 1 al 100, el segundo del 101 al 200, y así sucesivamente.

**Ejemplos:** `century(1705)` → `18`, `century(1900)` → `19`, `century(1601)` → `17`, `century(89)` → `1`.

Pista: la división entera se come el año 1601 (`1601 / 100` es `16`); ajusta restando 1 antes de dividir o redondeando hacia arriba con `Math.ceil`.
