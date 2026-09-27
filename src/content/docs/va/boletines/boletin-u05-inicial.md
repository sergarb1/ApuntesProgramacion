---
title: Butlletí U05 — Inicial
description: Exercicis bàsics de Funcions i mètodes
---

# 📝 Butlletí U05 — Inicial

> Sense solucions. Sense presses. Obri l'IDE, dóna-li a «executar» i deixa que els teus mètodes facen la feina pesada. Un `main` amb tot dins està bé... fins que deixa de cabre.

---

## Exercici 1: La salutació oficial

Escriu un programa anomenat `Saludo` que tinga un mètode `public static void saludar()` que imprima `¡Hola, Java!`. El `main` ha de cridar `saludar()` tres vegades, una per línia.

Pista: el mètode viu fora del `main`; el `main` simplement l'invoca pel seu nom amb parèntesis i punt i coma.

---

## Exercici 2: Què passa? — la variable fantasma

Este programa no compila. Mira'l amb calma i respon: per què falla i què canviaries per arreglar-ho?

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

Pista: `extra` naix i mor dins de `sumar()`. El compilador no la ve des de `main`.

---

## Exercici 3: La fitxa de presentació

Escriu un programa anomenat `Ficha` amb un mètode `public static void presentar(String nombre, int edad)` que imprima:

```
Em dic Ana i tinc 20 anys.
```

El `main` ha de cridar el mètode amb `("Ana", 20)` i amb `("Luis", 15)`, cada crida en la seua línia.

---

## Exercici 4: El primer `return`

Escriu un programa anomenat `Suma` amb un mètode `public static int sumar(int a, int b)` que **torna** la suma en lloc d'imprimir-la.

En el `main`, guarda el resultat de `sumar(3, 4)` en una variable i imprimeix `3 + 4 = 7`. Després imprimeix el resultat de `sumar(10, 20)` directament: `10 + 20 = 30`.

Pista: `return a + b;` entrega el valor a qui l'ha cridat; encara no l'imprimeix ningú.

---

## Exercici 5: Doble, si us plau

Escriu un programa anomenat `Doble` amb **dos** mètodes:

- `public static int calcularDoble(int n)` → torna el doble de `n`.
- `public static void mostrarDoble(int n)` → imprimeix `El doble de 6 és 12`.

El `main` ha d'usar els dos amb el valor `6`. Fixa't en la diferència: un torna, l'altre parla.

---

## Exercici 6: Què imprimeix? — el viatge d'anada i tornada

Sense executar, escriu l'eixida exacta, línia a línia:

```java
public class Viaje {
    static int sumar(int a, int b) {
        System.out.println("sumant...");
        return a + b;
    }

    public static void main(String[] args) {
        System.out.println("abans");
        int total = sumar(3, 4);
        System.out.println("total: " + total);
    }
}
```

Pista: el programa no salta de forma màgica: es para en la crida, executa el mètode i torna amb el valor en la mà.

---

## Exercici 7: Pare o senar?

Escriu un programa anomenat `ParOImpar` amb un mètode `public static boolean esPar(int n)` que torne `true` si el nombre és pare.

El `main` ha de comprovar el `7` i el `12` amb un `if`/`else` i imprimir `7 és senar` i `12 és pare`.

Pista: un sol `return` amb l'operador `%` de la U03.

---

## Exercici 8: La porta de l'edat

Escriu un programa anomenat `Puerta` amb un mètode `public static boolean mayorDeEdad(int edad)` que torne `true` si la persona té 18 anys o més.

El `main` ha de comprovar `15`, `18` i `30` i imprimir, una per línia:

```
15: no entra
18: entra
30: entra
```

Pista: pots usar un ternari en cada `println`, com en l'exercici 6 dels extres de la U04.

---

## Exercici 9: CodeWars — Century From Year

Resol la kata **"Century From Year"** (8 kyu) a [CodeWars](https://www.codewars.com/kata/5a3fe3dde1ce0e8ed6000097).

Completa el mètode `public static int century(int year)` que torna el segle al qual pertany un any: el primer segle va de l'any 1 al 100, el segon del 101 al 200, i així successivament.

**Exemples:** `century(1705)` → `18`, `century(1900)` → `19`, `century(1601)` → `17`, `century(89)` → `1`.

Pista: la divisió entera se menja l'any 1601 (`1601 / 100` és `16`); ajusta restant 1 abans de dividir o arredonint cap amunt amb `Math.ceil`.
