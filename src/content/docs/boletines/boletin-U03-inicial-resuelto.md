---
title: Boletín U03 — Inicial Resuelto
description: Los mismos ejercicios que el boletín inicial, con soluciones
---

# 📝 Boletín U03 — Inicial (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## Ejercicio 1: El portero del club

<details>
<summary>🔄 Solución</summary>

```java
public class Portero {
    public static void main(String[] args) {
        int edad = 17;
        boolean tieneEntrada = true;

        if (edad >= 18 && tieneEntrada) {
            System.out.println("Adelante, que pase el mayor de edad.");
        } else if (edad >= 18) {
            System.out.println("Faltas tú solito, sin entrada no hay paraíso.");
        } else {
            System.out.println("Fuera de aquí, pequeñín.");
        }
    }
}
```

Salida: `Fuera de aquí, pequeñín.`

Fíjate en el orden: primero compruebas la combinación completa (`mayor Y entrada`), luego el caso del mayor sin entrada. El `else` final se queda con los menores. Orden estricto a laxo, como en el punto 1.

</details>

---

## Ejercicio 2: ¿Qué imprime? — el semáforo invertido

<details>
<summary>🔄 Solución</summary>

Imprime **`Aprobado`**.

Con `nota = 8`, el primer `if` (`nota >= 5`) se cumple y gana, aunque 8 también cumpliría las condiciones de Notable y Sobresaliente. Java evalúa en orden y se queda con la primera `true`. La lección: el orden de los `else if` decide el resultado.

</details>

---

## Ejercicio 3: El menú del día

<details>
<summary>🔄 Solución</summary>

```java
public class MenuDia {
    public static void main(String[] args) {
        int dia = 4;

        switch (dia) {
            case 1:
                System.out.println("Lunes: Lentejas");
                break;
            case 2:
                System.out.println("Martes: Paella");
                break;
            case 3:
                System.out.println("Miércoles: Macarrones");
                break;
            case 4:
                System.out.println("Jueves: Fabada");
                break;
            case 5:
                System.out.println("Viernes: Pescado");
                break;
            default:
                System.out.println("Fin de semana, no hay menú");
                break;
        }
    }
}
```

Salida: `Jueves: Fabada`

Cada `case` con su `break` (salvo el `default`, que no lo necesita, pero no hace daño). Sin los `break`, el switch se convertiría en un tobogán y lo imprimiría todo desde el `case 4` en adelante.

</details>

---

## Ejercicio 4: La cuenta atrás del cohete

<details>
<summary>🔄 Solución</summary>

```java
public class Cohete {
    public static void main(String[] args) {
        int contador = 5;

        while (contador >= 0) {
            System.out.println(contador);
            contador--;
        }

        System.out.println("¡Despegue! 🚀");
    }
}
```

Salida:

```
5
4
3
2
1
0
¡Despegue! 🚀
```

El `contador--` al final de cada vuelta es el que evita el bucle infinito: la condición `contador >= 0` avanza hacia `false`.

</details>

---

## Ejercicio 5: La tabla del 7

<details>
<summary>🔄 Solución</summary>

```java
public class TablaDelSiete {
    public static void main(String[] args) {
        for (int i = 1; i <= 10; i++) {
            System.out.println("7 x " + i + " = " + (7 * i));
        }
    }
}
```

Salida (primeras líneas):

```
7 x 1 = 7
7 x 2 = 14
```

Fíjate en los paréntesis de `(7 * i)`: sin ellos, el `+` concatenaría "7 x 1 = " con el resultado de `7 * 1` igualmente (porque `*` manda sobre `+`), pero es más claro con ellos. El `for` junta contador, condición y avance en una línea.

</details>

---

## Ejercicio 6: Solo los pares

<details>
<summary>🔄 Solución</summary>

```java
public class SoloPares {
    public static void main(String[] args) {
        for (int i = 1; i <= 20; i++) {
            if (i % 2 != 0) {
                continue;
            }
            System.out.println(i);
        }
    }
}
```

Salida:

```
2
4
6
8
10
12
14
16
18
20
```

El `continue` se salta los impares y el bucle sigue con el siguiente número. Alternativa sin `continue`: `for (int i = 2; i <= 20; i += 2)`, pero aquí practicamos el salto.

</details>

---

## Ejercicio 7: El detective de divisores

<details>
<summary>🔄 Solución</summary>

```java
public class DetectiveDivisores {
    public static void main(String[] args) {
        int numero = 29;
        boolean esPrimo = true;

        for (int divisor = 2; divisor < numero; divisor++) {
            if (numero % divisor == 0) {
                esPrimo = false;
                break;
            }
        }

        System.out.println(esPrimo ? "Es primo" : "No es primo");
    }
}
```

Salida: `Es primo`

El `break` corta el bucle en cuanto aparece un divisor: no hace falta seguir comprobando. Para el 29 no hay divisores (es primo), así que el bucle se recorre entero y `esPrimo` sigue siendo `true`.

</details>

---

## Ejercicio 8: La edad blindada

<details>
<summary>🔄 Solución</summary>

```java
import java.util.InputMismatchException;
import java.util.Scanner;

public class EdadBlindada {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        try {
            System.out.print("¿Cuántos años tienes? ");
            int edad = sc.nextInt();
            System.out.println("Tienes " + edad + " años.");
        } catch (InputMismatchException e) {
            System.out.println("Eso no es una edad válida.");
        }

        System.out.println("El programa sigue vivo. 🎉");
        sc.close();
    }
}
```

Si escribes `hola`, el `catch` atrapa el error, imprime el mensaje y el programa continúa. Si escribes `17`, todo normal. Ese es el poder del `try`/`catch`: tu programa ya no muere por la basura del usuario.

</details>

---

## Ejercicio 9: CodeWars — Even or Odd

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static String even_or_odd(int number) {
        return number % 2 == 0 ? "Even" : "Odd";
    }
}
```

Una línea con el operador `%` y un ternario. Si el resto de dividir entre 2 es 0, es par (`"Even"`); si no, impar (`"Odd"`). Los dos conceptos de la U02 y la U03 trabajando juntos.

</details>
