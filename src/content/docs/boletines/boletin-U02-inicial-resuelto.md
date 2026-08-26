---
title: Boletín U02 — Inicial Resuelto
description: Los mismos ejercicios que el boletín inicial, con soluciones
---

# 📝 Boletín U02 — Inicial (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## Ejercicio 1: conversor de temperaturas

<details>
<summary>🔄 Solución</summary>

```java
public class ConversorTemperatura {
    public static void main(String[] args) {
        int celsius = 30;
        double fahrenheit = celsius * 9 / 5.0 + 32;

        System.out.println(celsius + "°C son " + fahrenheit + "°F");
    }
}
```

Salida: `30°C son 86.0°F`.

Fíjate en el `5.0`: si escribieras `celsius * 9 / 5 + 32`, la división `9 / 5` se haría con enteros (da 1) y el resultado sería 62, un desastre. Al usar `5.0`, la división se hace en decimal. Esto es la división entera del punto 3 en acción.

</details>

---

## Ejercicio 2: ¿Qué imprime? — incrementos

<details>
<summary>🔄 Solución</summary>

```
5
7
7
5
5
```

Paso a paso, con `x` empezando en 5:

1. `x++` (POST) → imprime 5, luego `x` pasa a 6.
2. `++x` (PRE) → `x` pasa a 7, luego imprime 7.
3. `x--` (POST) → imprime 7, luego `x` pasa a 6.
4. `--x` (PRE) → `x` pasa a 5, luego imprime 5.
5. `x` → imprime 5.

</details>

---

## Ejercicio 3: calculadora de descuentos

<details>
<summary>🔄 Solución</summary>

```java
public class CalculadoraDescuentos {
    public static void main(String[] args) {
        final double DESCUENTO = 0.15;
        double precioOriginal = 120.0;

        double descuento = precioOriginal * DESCUENTO;
        double precioFinal = precioOriginal - descuento;

        System.out.println("Precio original: " + precioOriginal + "€");
        System.out.println("Descuento (15%): " + descuento + "€");
        System.out.println("Precio final: " + precioFinal + "€");
    }
}
```

Si intentas hacer `DESCUENTO = 0.20;` después, el compilador te lo impedirá: `final` es el superglue del punto 2, una constante no se puede reasignar. Esa es la razón de que "el compilador se enfade".

</details>

---

## Ejercicio 4: El tipo perfecto

<details>
<summary>🔄 Solución</summary>

1. **`int`** — ~500.000 cabe de sobra en un `int` (tope: 2.147 millones).
2. **`long`** — 384.400 km sí que cabe en un `int`, pero es una distancia "astronómica" y queda más coherente con `long`. (Si lo pusiste `int`, también compila: la decisión de fondo es que supera lo cotidiano.)
3. **`char`** — una sola letra, con comillas simples: `'M'`.
4. **`double`** — 3.7 tiene decimales.
5. **`boolean`** — solo dos valores: `true` o `false`.
6. **`int`** — los céntimos son un número entero (sin decimales).

</details>

---

## Ejercicio 5: El casting asesino

<details>
<summary>🔄 Solución</summary>

```java
public class CastingAsesino {
    public static void main(String[] args) {
        double precio = 9.99;
        int precioEntero = (int) precio;

        System.out.println("Precio original: " + precio);
        System.out.println("Precio entero: " + precioEntero);

        int grande = 300;
        byte pequeno = (byte) grande;
        System.out.println("300 en un byte: " + pequeno);
    }
}
```

- `(int) 9.99` trunca y da **9**: se pierden los 0,99 €. El casting corta con hacha, no redondea.
- `300` en un `byte` (máximo 127) se **desborda** silenciosamente y da **44**. Java no avisa: es tu responsabilidad comprobar que el valor cabe antes de estrechar la caja.

</details>

---

## Ejercicio 6: ¿Par o impar?

<details>
<summary>🔄 Solución</summary>

```java
public class ParOImpar {
    public static void main(String[] args) {
        int numero = 7;
        String resultado = numero % 2 == 0 ? "Par" : "Impar";

        System.out.println(numero + " es " + resultado);
        System.out.println("¿Es par? " + (numero % 2 == 0));
    }
}
```

Salida:

```
7 es Impar
¿Es par? false
```

El `%` devuelve el resto de la división: si es 0, el número es par. El ternario elige el mensaje en una línea.

</details>

---

## Ejercicio 7: String en acción

<details>
<summary>🔄 Solución</summary>

```java
public class NombreEnAccion {
    public static void main(String[] args) {
        String nombre = "  ana  ";
        String limpio = nombre.trim();

        System.out.println("Limpio: " + limpio);
        System.out.println("Longitud: " + limpio.length());
        System.out.println("Mayúsculas: " + limpio.toUpperCase());
        System.out.println("Primera letra: " + limpio.toUpperCase().substring(0, 1));
    }
}
```

Salida:

```
Limpio: ana
Longitud: 3
Mayúsculas: ANA
Primera letra: A
```

Fíjate en el encadenado: `limpio.toUpperCase().substring(0, 1)` limpia, pone en mayúsculas y corta la primera letra en una sola línea.

</details>

---

## Ejercicio 8: saludo con Scanner

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class SaludoScanner {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("¿Cómo te llamas? ");
        String nombre = sc.nextLine();

        System.out.print("¿Cuántos años tienes? ");
        int edad = sc.nextInt();

        System.out.println("Hola, " + nombre + ". " + edad + " años, bienvenido.");

        sc.close();
    }
}
```

En este programa el orden está bien: como el `nextLine()` va antes que el `nextInt()`, no hay Enter residual que reclamar. El lío aparece al revés (número primero y texto después), como en el punto 6.

</details>

---

## Ejercicio 9: CodeWars — Will you make it?

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static boolean zeroFuel(double distanceToPump, double mpg, double fuelLeft) {
        return mpg * fuelLeft >= distanceToPump;
    }
}
```

Multiplicas los litros que tienes por los kilómetros por litro: eso te da la distancia máxima que puedes recorrer. Si es mayor o igual que la distancia a la gasolinera, llegas (`true`); si no, te quedas tirado (`false`). Una línea con un operador relacional y un `>=`.

</details>
