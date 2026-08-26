---
title: Butlletí U03 — Inicial
description: Exercicis bàsics d'Estructures de Control i Excepcions
---

# 📝 Butlletí U03 — Inicial

> Sense solucions. Sense presses. Obri l'IDE, encén el semàfor i fes que el teu codi decidisca, repetisca i sobrevisca. Ningú no naix sabent quan posar un `break`.

---

## Exercici 1: El porter del club

Escriu un programa anomenat `Porter` que, amb les variables `int edat = 17` i `boolean teEntrada = true`, decidisca amb `if`/`else`:

- Si `edat >= 18` **I** té entrada → "Endavant, que passe el major d'edat."
- Si és major d'edat però **no** té entrada → "Faltes tu sol, sense entrada no hi ha paradís."
- Si és menor → "Fora d'ací, xicotet."

---

## Exercici 2: Què imprimeix? — el semàfor invertit

Sense executar, escriu l'eixida exacta d'este programa:

```java
public class SemaforInvertit {
    public static void main(String[] args) {
        int nota = 8;

        if (nota >= 5) {
            System.out.println("Aprovat");
        } else if (nota >= 7) {
            System.out.println("Notable");
        } else if (nota >= 9) {
            System.out.println("Excel·lent");
        } else {
            System.out.println("Suspés");
        }
    }
}
```

Pista: recorda que guanya el **primer** `if` que es complix, encara que n'hi haja altres més "precisos" després.

---

## Exercici 3: El menú del dia

Escriu un programa anomenat `MenuDia` que, amb `int dia = 4`, mostre amb `switch` el menú corresponent:

- `1` → Dilluns: Llenties
- `2` → Dimarts: Paella
- `3` → Dimecres: Macarrons
- `4` → Dijous: Fabada
- `5` → Divendres: Peix
- Qualsevol altre número → `default`: Cap de setmana, no hi ha menú

No t'oblides del `break` en cada `case` ni del `default`.

---

## Exercici 4: El compte arrere del coet

Escriu un programa anomenat `Coet` que compte des de 5 fins a 0 amb un `while` i després mostre "Enlairament! 🚀". Mostra un nombre per línia.

Pista: `int comptador = 5;` i `while (comptador >= 0) { ... comptador--; }`.

---

## Exercici 5: La taula del 7

Escriu un programa anomenat `TaulaDelSet` que mostre la taula de multiplicar del 7 (de l'1 al 10) usant un `for`:

```
7 x 1 = 7
7 x 2 = 14
...
```

---

## Exercici 6: Només els parells

Escriu un programa anomenat `SolsParells` que imprimisca els nombres parells del 2 al 20 usant un `for` i `continue`. Cada nombre en la seua línia.

Pista: recorre de l'1 al 20 i usa `continue` per a saltar-te els senars (`if (i % 2 != 0) continue;`).

---

## Exercici 7: El detectiu de divisors

Escriu un programa anomenat `DetectiuDivisors` que comprove amb `for` i `break` si el nombre `int numero = 29` té algun divisor entre 2 i `numero - 1`. Si el troba, mostra "No és primer" i ix; si no, mostra "És primer".

Pista: recorre els divisors i, tan bon punt en trobes un (`numero % divisor == 0`), fes `break`.

---

## Exercici 8: L'edat blindada

Escriu un programa anomenat `EdatBlindada` que demane l'edat amb `Scanner.nextInt()` dins d'un `try`/`catch`. Si l'usuari escriu alguna cosa que no és un nombre, atrapar l'`InputMismatchException` i mostra "Això no és una edat vàlida.". Si ho és, mostra "Tens X anys."

Pista: necessites `import java.util.Scanner;` i `import java.util.InputMismatchException;`. Després del `catch`, el programa ha de seguir viu.

---

## Exercici 9: CodeWars — Even or Odd

Resol la kata **"Even or Odd"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/53da3dbb4a5168369a0000fe).

Crea el mètode `public static String even_or_odd(int number)` que retorne `"Even"` si el nombre és parell i `"Odd"` si és senar.

Pista: l'operador `%` del punt 3 de la U02 és el teu millor amic: `number % 2 == 0`.
