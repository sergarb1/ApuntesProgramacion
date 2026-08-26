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