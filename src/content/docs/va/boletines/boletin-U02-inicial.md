---
title: Butlletí U02 — Inicial
description: Exercicis bàsics de Variables, Tipus i Operadors
---

# 📝 Butlletí U02 — Inicial

> Sense solucions. Sense presses. Obri l'IDE, declara variables i embruta't les mans de bits. Ningú no naix sabent què és un `double`.

---

## Exercici 1: Conversor de temperatures

Escriu un programa anomenat `ConversorTemperatura` que convertisca 30 graus Celsius a Fahrenheit. Usa la fórmula:

```
F = C * 9/5 + 32
```

Declara `int celsius = 30` i una variable `double fahrenheit` per al resultat. Mostra les dues temperatures.

---

## Exercici 2: Què imprimeix? — increments

Sense executar, escriu l'eixida exacta d'este programa:

```java
public class Increments {
    public static void main(String[] args) {
        int x = 5;
        System.out.println(x++);
        System.out.println(++x);
        System.out.println(x--);
        System.out.println(--x);
        System.out.println(x);
    }
}
```

Pista: recorda la diferència entre pre i post. `x++` usa i després puja; `++x` puja i després usa.

---

## Exercici 3: Calculadora de descomptes

Declara una constant `final double DESCOMPTE = 0.15` i declara `double preuOriginal = 120.0`. Calcula:

1. El descompte (`preuOriginal * DESCOMPTE`)
2. El preu final (`preuOriginal - descompte`)

Mostra-ho tot amb `println`. Si després intentes canviar el valor de `DESCOMPTE`, el compilador s'enfadarà. Saps per què?

---

## Exercici 4: El tipus perfecte

Indica quin tipus de dada primitiu (`int`, `double`, `boolean`, `char`, `long`) usaríes per a cada cas:

1. El nombre d'habitants de la teua ciutat (~500.000)
2. La distància en quilòmetres fins a la Lluna (~384.400)
3. La inicial del teu segon cognom
4. La nota mitjana d'un examen (3.7)
5. Si has aprovat o no l'examen anterior
6. El preu d'un cafè en cèntims (enter)

---

## Exercici 5: El casting assassí

Declara `double preu = 9.99;`. Convertix-lo a `int` amb un casting explícit. Imprimix tots dos valors. Què es perd pel camí?

Després, declara `int gran = 300;` i convertix-lo a `byte`. Imprimix el resultat. T'esperaves eixe nombre? (Pista: en un `byte` només caben de -128 a 127.)

---

## Exercici 6: Parell o senar?

Escriu un programa anomenat `ParellOSenar` que use l'operador `%` per a determinar si un nombre és parell o senar. Pots usar una variable `int numero = 7;` i l'operador ternari per a mostrar "Parell" o "Senar". Mostra també `true` o `false` en comprovar si `numero % 2 == 0`.

---

## Exercici 7: String en acció

Escriu un programa anomenat `NomEnAccio` que, amb la variable `String nom = "  ana  ";`:

1. Netege els espais amb `trim()`
2. Mostre la longitud del nom net
3. El mostre en majúscules
4. Mostre la primera lletra (amb `substring(0, 1)`)

---

## Exercici 8: Salutació amb Scanner

Escriu un programa anomenat `SalutacioScanner` que:

1. Pregunte "Com et dius?" i llegixca el nom amb `nextLine()`
2. Pregunte "Quants anys tens?" i llegixca l'edat amb `nextInt()`
3. Mostre: "Hola, [nom]. [edat] anys, benvingut."

Recorda l'`import java.util.Scanner;` i el `sc.close()`.

---

## Exercici 9: CodeWars — Will you make it?

Resol la kata **"Will you make it?"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/5861d28f124b35723e00005e).

Et donen la distància fins a una gasolinera, els litres que té el teu cotxe i els quilòmetres per litre. Determina si hi arribes o no. Retorna `true` si hi arribes, `false` si et quedes tirat.

---

## Exercici 10: Què imprimeix? — printf amb conversions

Sense executar, escriu l'eixida exacta d'este programa:

```java
public class FormatacioBasica {
    public static void main(String[] args) {
        int enter = 42;
        double decimal = 3.1416;
        String text = "Java";

        System.out.printf("%d %f %s %n", enter, decimal, text);
    }
}
```

Què imprimeix? Què fa `%n` al final?

**Pista:** `%d` és per a enters, `%f` per a decimals i `%s` per a text. Quants decimals mostra `%f` quan no li poses `%.2f`?

---

## Exercici 11: la nota amb dos decimals

Escriu un programa anomenat `NotaFormatejada` que declare `String nom = "Marta"` i `double nota = 9.5678;`. Usa `String.format()` per a construir este missatge:

```
Marta ha tret un 9.57.
```

Després mostra el mateix missatge amb `System.out.printf()`. Quina diferència hi ha entre les dos formes?

**Pista:** `String.format` retorna un `String` i no imprimeix res; `printf` escriu directament en pantalla. Els dos usen `%.2f` per a deixar dos decimals.

---

## Exercici 12: la propina amb dos decimals

Escriu un programa anomenat `PropinaFormatejada` que demane amb `Scanner` el total del compte (`double`) i el percentatge de propina (`int`). Calcula la propina i el total final, i mostra'ls amb `System.out.printf` i dos decimals:

```
Total: 45.50 €
Propina (15%): 6.82 €
Total a pagar: 52.33 €
```

**Pista:** `%.2f` controla els decimals. Multiplica primer (`total * percentatge`) i dividix després amb `100.0`, o `percentatge / 100` donarà 0.