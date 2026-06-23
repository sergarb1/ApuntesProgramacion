---
title: "Butlletí 2 - Inicial: Variables i Operadors"
nav_order: 4
---
Sense solucions. Obri l'IDE, declara variables i embruta't les mans de bits. Ningun no naix sabent què és un `double`.

---

## Exercici 1: Conversor de temperatures

Escriu un programa anomenat `ConversorTemperatura` que convertisca 30 graus Celsius a Fahrenheit. Usa la fórmula:

```
F = C * 9/5 + 32
```

Declara `int celsius = 30` i una variable `double fahrenheit` per al resultat. Mostra les dues temperatures.

---

## Exercici 2: Què imprimeix?

Sense executar, escriu l'eixida exacta:

```java
public class Incrementos {
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

---

## Exercici 3: Calculadora de descomptes

Declara una constant `final double DESCUENTO = 0.15` i declara `double precioOriginal = 120.0`. Calcula:

1. El descompte (`precioOriginal * DESCUENTO`)
2. El preu final (`precioOriginal - descuento`)

Mostra-ho tot amb `println`. T'animes a declarar el descompte com a `final`? Si després intentes canviar-lo, el compilador s'enfadarà.

---

## Exercici 4: Precedència de malson

Sense executar, quin valor té `resultado`?

```java
int resultado = 2 + 3 * 4 - 8 / 2 + (6 - 1) * 2;
```

Escriu el pas a pas i el valor final. No hi ha trampa, només matemàtiques i ordre d'operacions.

---

## Exercici 5: El tipus perfecte

Indica quin tipus de dada primitiu (`int`, `double`, `boolean`, `char`, `long`) utilitzaries per a cada cas:

1. El nombre d'habitants de la teua ciutat (~500.000)
2. La distància en quilòmetres fins a la lluna (~384.400)
3. La inicial del teu segon cognom
4. La nota mitjana d'un examen (3.7)
5. Si has aprovat o no l'examen anterior
6. El preu d'un café en cèntims (enter)

---

## Exercici 6: L'intercanvi màgic

Donades dues variables `int a = 7;` i `int b = 3;`, intercanvia els seus valors **sense usar una variable temporal**. Pista: usa suma i resta:

```java
a = a + b;
b = a - b;
a = a - b;
```

Mostra els valors abans i després per a comprovar que va funcionar.

---

## Exercici 7: CodeWars — Will you make it?

Resol la kata **"Will you make it?"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/5861d28f124b35723e00005e).

Et donen la distància fins a una gasolinera, els litres que té el teu cotxe i els quilòmetres per litre. Determina si arribes o no. Torna `true` si hi arribes, `false` si et quedes tirat.
