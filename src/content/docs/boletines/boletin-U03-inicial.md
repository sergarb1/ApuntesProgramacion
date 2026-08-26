---
title: Boletín U03 — Inicial
description: Ejercicios básicos de Estructuras de Control y Excepciones
---

# 📝 Boletín U03 — Inicial

> Sin soluciones. Sin prisas. Abre el IDE, enciende el semáforo y haz que tu código decida, repita y sobreviva. Nadie nace sabiendo cuándo poner un `break`.

---

## Ejercicio 1: El portero del club

Escribe un programa llamado `Portero` que, con las variables `int edad = 17` y `boolean tieneEntrada = true`, decida con `if`/`else`:

- Si `edad >= 18` **Y** tiene entrada → "Adelante, que pase el mayor de edad."
- Si es mayor de edad pero **no** tiene entrada → "Faltas tú solito, sin entrada no hay paraíso."
- Si es menor → "Fuera de aquí, pequeñín."

---

## Ejercicio 2: ¿Qué imprime? — el semáforo invertido

Sin ejecutar, escribe la salida exacta de este programa:

```java
public class SemaforoInvertido {
    public static void main(String[] args) {
        int nota = 8;

        if (nota >= 5) {
            System.out.println("Aprobado");
        } else if (nota >= 7) {
            System.out.println("Notable");
        } else if (nota >= 9) {
            System.out.println("Sobresaliente");
        } else {
            System.out.println("Suspenso");
        }
    }
}
```

Pista: recuerda que gana el **primer** `if` que se cumple, aunque haya otros más "precisos" después.

---

## Ejercicio 3: El menú del día

Escribe un programa llamado `MenuDia` que, con `int dia = 4`, muestre con `switch` el menú correspondiente:

- `1` → Lunes: Lentejas
- `2` → Martes: Paella
- `3` → Miércoles: Macarrones
- `4` → Jueves: Fabada
- `5` → Viernes: Pescado
- Cualquier otro número → `default`: Fin de semana, no hay menú

No te olvides del `break` en cada `case` ni del `default`.

---

## Ejercicio 4: La cuenta atrás del cohete

Escribe un programa llamado `Cohete` que cuente desde 5 hasta 0 con un `while` y luego muestre "¡Despegue! 🚀". Muestra un número por línea.

Pista: `int contador = 5;` y `while (contador >= 0) { ... contador--; }`.

---

## Ejercicio 5: La tabla del 7

Escribe un programa llamado `TablaDelSiete` que muestre la tabla de multiplicar del 7 (del 1 al 10) usando un `for`:

```
7 x 1 = 7
7 x 2 = 14
...
```

---

## Ejercicio 6: Solo los pares

Escribe un programa llamado `SoloPares` que imprima los números pares del 2 al 20 usando un `for` y `continue`. Cada número en su línea.

Pista: recorre del 1 al 20 y usa `continue` para saltarte los impares (`if (i % 2 != 0) continue;`).

---

## Ejercicio 7: El detective de divisores

Escribe un programa llamado `DetectiveDivisores` que compruebe con `for` y `break` si el número `int numero = 29` tiene algún divisor entre 2 y `numero - 1`. Si lo encuentra, muestra "No es primo" y sale; si no, muestra "Es primo".

Pista: recorre los divisores y, en cuanto encuentres uno (`numero % divisor == 0`), haz `break`.

---

## Ejercicio 8: La edad blindada

Escribe un programa llamado `EdadBlindada` que pida la edad con `Scanner.nextInt()` dentro de un `try`/`catch`. Si el usuario escribe algo que no es un número, atrapa el `InputMismatchException` y muestra "Eso no es una edad válida.". Si lo es, muestra "Tienes X años."

Pista: necesitas `import java.util.Scanner;` e `import java.util.InputMismatchException;`. Después del `catch`, el programa debe seguir vivo.

---

## Ejercicio 9: CodeWars — Even or Odd

Resuelve la kata **"Even or Odd"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/53da3dbb4a5168369a0000fe).

Crea el método `public static String even_or_odd(int number)` que devuelva `"Even"` si el número es par y `"Odd"` si es impar.

Pista: el operador `%` del punto 3 de la U02 es tu mejor amigo: `number % 2 == 0`.
