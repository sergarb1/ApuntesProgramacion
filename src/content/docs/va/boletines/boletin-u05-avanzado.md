---
title: Butlletí U05 — Avançat
description: Exercicis de dificultat progressiva per a exprimir la unitat
---

# 📝 Butlletí U05 — Avançat

> Dificultat progressiva. ⭐ per a escalfar, ⭐⭐ per a pensar, ⭐⭐⭐ per a concursar. Cada exercici inclou una pista (resisteix-te a mirar-la).

---

## ⭐ Exercici 1: El classificador de notes

Escriu un programa amb un mètode `public static String calificar(double nota)` que torne la qualificació textual amb les mateixes regles de la U04: `>= 9` → "Excel·lent", `>= 7` → "Notable", `>= 5` → "Aprovat", `>= 0` → "Suspés", i fora de rang → "Nota no vàlida".

El `main` ha d'imprimir el resultat de `calificar(8.7)`, `calificar(4.5)`, `calificar(11)` i `calificar(-2)`, un per línia.

**Pista:** el mètode **torna** cadenes amb `return`, no imprimeix res. Comprova primer si la nota està fora de rang.

---

## ⭐ Exercici 2: Taules a demanda

Escriu un mètode `public static void imprimirTabla(int n)` que imprima la taula de multiplicar del `n` (de l'1 al 10), una línia per cada multiplicació.

El `main` ha de demanar-li la taula del 7, després un separador `---`, i després la taula del 3.

**Pista:** el mètode no sap res del 7 ni del 3: només coneix el seu paràmetre `n`. Un `for` i a volar.

---

## ⭐⭐ Exercici 3: Què imprimeix? — l'ombra del paràmetre

Sense executar, escriu l'eixida exacta:

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

**Pista:** dins de `cambiar`, el paràmetre `valor` tapa al camp `valor`. Quin dels dos canvia amb `valor + 1`?

---

## ⭐⭐ Exercici 4: La suma de xifres

Escriu un mètode `public static int sumaDigitos(int n)` que torne la suma de les xifres de `n` (per exemple, `1234` → `10`).

El `main` ha de mostrar `sumaDigitos(1234)` i `sumaDigitos(905)`.

**Pista:** `n % 10` trau l'última xifra i `n / 10` se la menja; repeteix amb un `while` fins que `n` siga 0. Si el nombre pot ser negatiu, usa `Math.abs(n)` al principi.

---

## ⭐⭐⭐ Exercici 5: Què imprimeix? — el return que talla

Sense executar, escriu l'eixida exacta:

```java
public class Corte {
    public static String signo(int n) {
        if (n < 0) {
            return "negatiu";
        }
        if (n == 0) {
            return "zero";
        }
        return "positiu";
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

**Pista:** en cada mètode només s'executa **un** `return`: la resta del codi queda mort. Recorre els casos un a un.

---

## ⭐⭐⭐ Exercici 6: Divideix l'informe

Este programa funciona, però tot viu dins del `main`:

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

        System.out.println("Mitjana: " + media);
        System.out.println("Màxim: " + maximo);
        System.out.println("Mínim: " + minimo);
    }
}
```

Trosseja-lo en **tres mètodes** que tornen `double`: `media(a, b, c, d)`, `maximo(a, b, c, d)` i `minimo(a, b, c, d)`. El `main` ha de quedar-se en tres línies de `println` que criden als mètodes.

**Pista:** els tres mètodes són `public static double ...` amb `return` i cap crida a `System.out`. Comparar `a, b, c, d` és exactament el mateix dins de cadascun.

---

## ⭐⭐ Exercici 7: El comptador de vocals

Escriu un mètode `public static int contarVocales(String texto)` que torne quantes vocals hi ha en `texto` (sense distingir majúscules de minúscules).

El `main` ha d'imprimir `contarVocales("Hola mundo")` (dona `4`) i `contarVocales("zzz")` (dona `0`).

**Pista:** recorre amb `for (int i = 0; i < texto.length(); i++)`, mira cada caràcter amb `charAt(i)` i compara'l amb les cinc vocals en les seues dues versions.

---

## ⭐⭐⭐ Exercici 8: CodeWars — 'Disemvowel' Trolls

Resol la kata **"'Disemvowel' Trolls"** (7 kyu) a [CodeWars](https://www.codewars.com/kata/52fba66badcd10859f00097e).

Crea el mètode `public static String disemvowel(String str)` que torne la cadena sense vocals.

**Exemple:** `"This website is for losers LOL!"` → `"Ths wbst s fr lsrs LL!"`.

**Pista:** recorre amb `charAt` i concatena només el que no siga vocal. La solució amb regex arriba en la U13; ací ens val un `if` amb moltes comparacions.

---

## ⭐⭐⭐ Exercici 9: AceptaElReto — 165 Número hyperpar

Resol el problema **165 — Número hyperpar** a [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=165).

Un nombre és *hyperpar* quan **totes** les seues xifres són parells. L'entrada conté un nombre per línia fins a un nombre negatiu (que no es processa). Per a cada cas, mostra `SI` o `NO`.

**Exemple:**

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

**Pista:** embolica la comprovació en un mètode `public static boolean esHyperpar(int n)`: amb un `while` trau xifres amb `n % 10` i, si alguna és senar, `return false` en quant la trobes. Si el bucle acaba sense trobar-ne cap, `return true`.

---

## 📚 Referències

| Plataforma | Problema | Dificultat |
|---|---|---|
| AceptaElReto | 165 — Número hyperpar | Fàcil |
| AceptaElReto | 115 — Número de Kaprekar | Mitjà |
| CodeWars | Century From Year (8 kyu) | Principiant |
| CodeWars | 'Disemvowel' Trolls (7 kyu) | Aficionat |
| CodeWars | Volume of a Cuboid (8 kyu) | Principiant |
| CodeWars | Drink about (8 kyu) | Principiant |
