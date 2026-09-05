---
title: "Boletín U09 — Inicial"
description: "Ejercicios básicos de Arrays y Colecciones"
---

# 📝 Boletín U09 — Inicial

> Sin soluciones. Sin prisas. Abre el IDE, crea tu primer parking de datos y haz que el `for-each` deje de parecer magia. Ninguna plaza nace sabiendo tener dueño.

---

## Ejercicio 1: ¿Qué imprime? — Array de booleanos

```java
boolean[] flags = new boolean[3];
flags[1] = true;
System.out.println(flags[0] + " " + flags[1] + " " + flags[2]);
```

¿Qué imprime? ¿Cuál es el valor por defecto de un `boolean` en un array?

---

## Ejercicio 2: Encuentra el error — NullPointerException

```java
String[] nombres = new String[3];
nombres[0] = "Ana";
nombres[1] = "Bob";
System.out.println(nombres[2].toUpperCase());
```

¿Qué ocurre al ejecutar este código? ¿Por qué?

---

## Ejercicio 3: Completa el código — for básico para buscar el mayor

Completa el siguiente programa para que encuentre e imprima el número más grande del array:

```java
int[] numeros = {12, 45, 7, 34, 89, 23};
int mayor = numeros[0];

for (int i = 1; i < ______; i++) {   // ¿hasta dónde llega el bucle?
    if (numeros[i] ______ mayor) {    // ¿qué operador?
        ______ = numeros[i];          // ¿qué asignamos?
    }
}

System.out.println("El mayor es: " + mayor);
```

---

## Ejercicio 4: Escribe este programa — contar números pares

Crea un array de 10 enteros con valores que tú elijas. Recórrelo con un bucle `for` y cuenta cuántos de ellos son pares. Al final, imprime el total de pares y el array original con `Arrays.toString`.

Ejemplo de salida:

```
Array: [3, 8, 12, 5, 7, 10, 2, 9, 6, 1]
Pares: 5
```

---

## Ejercicio 5: ¿Qué imprime? — ArrayList remove por índice vs valor

```java
import java.util.ArrayList;

public class Test {
    public static void main(String[] args) {
        ArrayList<String> lista = new ArrayList<>();
        lista.add("A");
        lista.add("B");
        lista.add("C");
        lista.add("B");
        lista.add("D");

        lista.remove(1);          // remove por índice
        lista.remove("B");        // remove por objeto

        System.out.println(lista);
    }
}
```

¿Qué imprime? ¿Por qué el segundo `remove("B")` no borra el mismo que el primero?

---

## Ejercicio 6: Encuentra el error — length vs length()

```java
int[] numeros = {10, 20, 30};
String texto = "Hola";

System.out.println(numeros.length());
System.out.println(texto.length);
```

¿Qué líneas tienen error? Explica la diferencia entre `length` (sin paréntesis) y `length()` (con paréntesis).

---

## Ejercicio 7: Escribe este programa — búsqueda lineal

Crea un array de enteros llamado `edades` con 8 valores. Pide al usuario un número por teclado (con `Scanner`) y busca si ese número está en el array. Imprime «Encontrado en posición X» o «No encontrado».

```
Introduce edad a buscar: 25
Encontrado en posición 3
```

---

## Ejercicio 8: Escribe este programa — el inverso

Crea un array de 10 enteros, rellénalo con los números del 1 al 10 y luego imprímelo en **orden inverso** (del 10 al 1). Hazlo con un `for` que recorra el array hacia atrás.

---

## Ejercicio 9: CodeWars — Convert number to reversed array of digits

Resuelve la kata **"Convert number to reversed array of digits"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/5583090cbe83f4fd8c000051).

Completa el método `public static int[] digitize(long n)` que reciba un número (por ejemplo `35231`) y devuelva un array con sus dígitos **en orden inverso** (`{1, 3, 2, 5, 3}`).

Pista: usa `String.valueOf(n).toCharArray()` para obtener los dígitos como texto, o divide por 10 dentro de un bucle mientras el número sea mayor que 0.