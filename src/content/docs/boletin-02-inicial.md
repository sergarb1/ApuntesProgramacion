---
title: "Boletín 2 - Inicial: Variables y Operadores"
nav_order: 4
---
Sin soluciones. Abre el IDE, declara variables y ensucia tus manos de bits. Nadie nace sabiendo qué es un `double`.

---

## Ejercicio 1: Conversor de temperaturas

Escribe un programa llamado `ConversorTemperatura` que convierta 30 grados Celsius a Fahrenheit. Usa la fórmula:

```
F = C * 9/5 + 32
```

Declara `int celsius = 30` y una variable `double fahrenheit` para el resultado. Muestra ambas temperaturas.

---

## Ejercicio 2: ¿Qué imprime?

Sin ejecutar, escribe la salida exacta:

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

## Ejercicio 3: Calculadora de descuentos

Declara una constante `final double DESCUENTO = 0.15` y declara `double precioOriginal = 120.0`. Calcula:

1. El descuento (`precioOriginal * DESCUENTO`)
2. El precio final (`precioOriginal - descuento`)

Muestra todo con `println`. ¿Te animas a declarar el descuento como `final`? Si luego intentas cambiarlo, el compilador se enfadará.

---

## Ejercicio 4: Precedencia de pesadilla

Sin ejecutar, ¿qué valor tiene `resultado`?

```java
int resultado = 2 + 3 * 4 - 8 / 2 + (6 - 1) * 2;
```

Escribe el paso a paso y el valor final. No hay trampa, solo matemáticas y orden de operaciones.

---

## Ejercicio 5: El tipo perfecto

Indica qué tipo de dato primitivo (`int`, `double`, `boolean`, `char`, `long`) usarías para cada caso:

1. El número de habitantes de tu ciudad (~500.000)
2. La distancia en kilómetros hasta la luna (~384.400)
3. La inicial de tu segundo apellido
4. La nota media de un examen (3.7)
5. Si has aprobado o no el examen anterior
6. El precio de un café en céntimos (entero)

---

## Ejercicio 6: El intercambio mágico

Dadas dos variables `int a = 7;` e `int b = 3;`, intercambia sus valores **sin usar una variable temporal**. Pista: usa suma y resta:

```java
a = a + b;
b = a - b;
a = a - b;
```

Muestra los valores antes y después para comprobar que funcionó.

---

## Ejercicio 7: CodeWars — Will you make it?

Resuelve la kata **"Will you make it?"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/5861d28f124b35723e00005e).

Te dan la distancia hasta una gasolinera, los litros que tiene tu coche y los kilómetros por litro. Determina si llegas o no. Devuelve `true` si llegas, `false` si te quedas tirado.
