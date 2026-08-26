---
title: Boletín U02 — Inicial
description: Ejercicios básicos de Variables, Tipos y Operadores
---

# 📝 Boletín U02 — Inicial

> Sin soluciones. Sin prisas. Abre el IDE, declara variables y ensucia tus manos de bits. Nadie nace sabiendo qué es un `double`.

---

## Ejercicio 1: conversor de temperaturas

Escribe un programa llamado `ConversorTemperatura` que convierta 30 grados Celsius a Fahrenheit. Usa la fórmula:

```
F = C * 9/5 + 32
```

Declara `int celsius = 30` y una variable `double fahrenheit` para el resultado. Muestra ambas temperaturas.

---

## Ejercicio 2: ¿Qué imprime? — incrementos

Sin ejecutar, escribe la salida exacta de este programa:

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

Pista: recuerda la diferencia entre pre y post. `x++` usa y luego sube; `++x` sube y luego usa.

---

## Ejercicio 3: calculadora de descuentos

Declara una constante `final double DESCUENTO = 0.15` y declara `double precioOriginal = 120.0`. Calcula:

1. El descuento (`precioOriginal * DESCUENTO`)
2. El precio final (`precioOriginal - descuento`)

Muestra todo con `println`. Si luego intentas cambiar el valor de `DESCUENTO`, el compilador se enfadará. ¿Sabes por qué?

---

## Ejercicio 4: El tipo perfecto

Indica qué tipo de dato primitivo (`int`, `double`, `boolean`, `char`, `long`) usarías para cada caso:

1. El número de habitantes de tu ciudad (~500.000)
2. La distancia en kilómetros hasta la Luna (~384.400)
3. La inicial de tu segundo apellido
4. La nota media de un examen (3.7)
5. Si has aprobado o no el examen anterior
6. El precio de un café en céntimos (entero)

---

## Ejercicio 5: El casting asesino

Declara `double precio = 9.99;`. Conviértelo a `int` con un casting explícito. Imprime ambos valores. ¿Qué se pierde por el camino?

Después, declara `int grande = 300;` y conviértelo a `byte`. Imprime el resultado. ¿Te esperabas ese número? (Pista: en un `byte` solo caben -128 a 127.)

---

## Ejercicio 6: ¿Par o impar?

Escribe un programa llamado `ParOImpar` que use el operador `%` para determinar si un número es par o impar. Puedes usar una variable `int numero = 7;` y el operador ternario para mostrar "Par" o "Impar". Muestra también `true` o `false` al comprobar si `numero % 2 == 0`.

---

## Ejercicio 7: String en acción

Escribe un programa llamado `NombreEnAccion` que, con la variable `String nombre = "  ana  ";`:

1. Limpie los espacios con `trim()`
2. Muestre la longitud del nombre limpio
3. Lo muestre en mayúsculas
4. Muestre la primera letra (con `substring(0, 1)`)

---

## Ejercicio 8: saludo con Scanner

Escribe un programa llamado `SaludoScanner` que:

1. Pregunte "¿Cómo te llamas?" y lea el nombre con `nextLine()`
2. Pregunte "¿Cuántos años tienes?" y lea la edad con `nextInt()`
3. Muestre: "Hola, [nombre]. [edad] años, bienvenido."

Recuerda el `import java.util.Scanner;` y el `sc.close()`.

---

## Ejercicio 9: CodeWars — Will you make it?

Resuelve la kata **"Will you make it?"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/5861d28f124b35723e00005e).

Te dan la distancia hasta una gasolinera, los litros que tiene tu coche y los kilómetros por litro. Determina si llegas o no. Devuelve `true` si llegas, `false` si te quedas tirado.
