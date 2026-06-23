---
title: "Boletín 3 - Inicial: Estructuras de Control"
nav_order: 7
---
Sin soluciones. Respira. Los bucles no muerden. Las excepciones tampoco. El único peligro eres tú sin dormir.

---

## Ejercicio 1: ¿Qué imprime este if?

Sin ejecutar, escribe la salida exacta:

```java
public class Clasificador {
    public static void main(String[] args) {
        int nota = 65;

        if (nota >= 90) {
            System.out.println("Sobresaliente");
        } else if (nota >= 70) {
            System.out.println("Notable");
        } else if (nota >= 50) {
            System.out.println("Aprobado");
        } else {
            System.out.println("Suspenso");
        }
    }
}
```

---

## Ejercicio 2: Encuentra el error en el for

El siguiente bucle debería contar del 1 al 5, pero no funciona. ¿Por qué? Corrígelo.

```java
public class ForError {
    public static void main(String[] args) {
        for (int i = 1; i <= 10; i--) {
            System.out.println("Cuenta: " + i);
        }
    }
}
```

Pista: mira la condición y la actualización. Una de las dos no cuadra.

---

## Ejercicio 3: Completa el programa (do-while)

Falta la condición del `do-while`. Complétala para que el programa pida números hasta que el usuario introduzca un número negativo.

```java
import java.util.Scanner;

public class DoWhile {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int numero;

        do {
            System.out.print("Introduce un número (negativo para salir): ");
            numero = sc.nextInt();
            System.out.println("Has escrito: " + numero);
        } while (/* tu condición aquí */);

        System.out.println("¡Hasta luego!");
        sc.close();
    }
}
```

---

## Ejercicio 4: Cuenta atrás

Escribe un programa que muestre una cuenta atrás desde 10 hasta 0 usando un `for`. Después del 0, debe imprimir "¡Despegue!".

Salida esperada:
```
10
9
8
...
1
0
¡Despegue!
```

---

## Ejercicio 5: Menú con switch

Escribe un programa que muestre un menú de bebidas y pida al usuario que elija una opción (1-4). Usa `switch` para mostrar el nombre de la bebida seleccionada.

```
=== BAR JAVA ===
1. Café solo
2. Café con leche
3. Té
4. Refresco
Elige una opción:
```

Si el usuario elige 2, debe mostrar "Has elegido Café con leche". Si elige un número inválido, muestra "Opción no válida".

---

## Ejercicio 6: Tabla de multiplicar del 7

Escribe un programa que muestre la tabla de multiplicar del 7 usando un `for`. Debe imprimir:

```
7 x 1 = 7
7 x 2 = 14
...
7 x 10 = 70
```

---

## Ejercicio 7: CodeWars — Grasshopper - Grade book

Resuelve la kata **"Grasshopper - Grade book"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/55cbd4ba903825f7970000f5).

Recibes tres notas (0-100). Devuelve la letra correspondiente según la media:

| Media | Nota |
|---|---|
| >= 90 | 'A' |
| >= 80 | 'B' |
| >= 70 | 'C' |
| >= 60 | 'D' |
| < 60 | 'F' |
