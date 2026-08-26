---
title: Boletín U01 — Inicial Resuelto
description: Los mismos ejercicios que el boletín inicial, con soluciones
---

# 📝 Boletín U01 — Inicial (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## Ejercicio 1: Desordena esto

<details>
<summary>🔄 Solución</summary>

```java
public class Ordenado {
    public static void main(String[] args) {
        System.out.println("Mi primer programa ordenado");
    }
}
```

La clase abre y cierra con `{}`, y dentro vive el `main`. El `}` final cierra la clase.

</details>

---

## Ejercicio 2: ¿Qué imprime?

<details>
<summary>🔄 Solución</summary>

```
Dijo: "Java mola" y siguió: 	programando.
```

`\"` imprime la comilla literal, y `\t` deja un tabulador antes de "programando". Como el primer `print` no salta de línea, la salida va toda seguida.

</details>

---

## Ejercicio 3: Cazador de errores

<details>
<summary>🔄 Solución</summary>

Los 4 errores:

1. `Public` → **`public`** (minúscula).
2. `string[] args` → **`String[] args`** (la clase `String` con mayúscula).
3. `"Hola, "Mundo""` → las comillas anidadas rompen el texto. Debe ser `"Hola, \"Mundo\""` o `"Hola, Mundo"`.
4. `?` al final del segundo `println` → falta cerrar el texto con `"` y añadir `;`. Además, falta el `;` al final de la primera línea del `println`.

Versión corregida:

```java
public class ErrorFinder {
    public static void main(String[] args) {
        System.out.println("Hola, \"Mundo\"");
        System.out.println("Esto funciona?");
    }
}
```

</details>

---

## Ejercicio 4: Tu ficha personal

<details>
<summary>🔄 Solución</summary>

```java
public class FichaPersonal {
    public static void main(String[] args) {
        System.out.println("Nombre: Sergi");
        System.out.println("Edad: 30");
        System.out.println("Lenguaje favorito: Java");
        System.out.println("¿Emocionado?: true");
    }
}
```

El `true` va entre comillas porque es parte del texto. Si lo hubieras escrito sin comillas, habría sido un booleano literal de verdad, pero dentro de un `println` con comillas es solo texto.

</details>

---

## Ejercicio 5: Completa el programa

<details>
<summary>🔄 Solución</summary>

Falta el `;` al final del `println` y la llave de cierre `}` de la clase:

```java
public class Completame {
    public static void main(String[] args) {
        System.out.println("Aprobado, esto funciona");
    }
}
```

</details>

---

## Ejercicio 6: Empareja conceptos

<details>
<summary>🔄 Solución</summary>

1→C, 2→A, 3→B, 4→D, 5→E

- `class` define un nuevo tipo de datos (C).
- `main` es el punto de entrada del programa (A).
- `System.out.println` imprime texto y salta de línea (B).
- `//` es el comentario de una línea (D).
- `args` contiene los argumentos de línea de comandos (E).

</details>

---

## Ejercicio 7: CodeWars — Square(n) Sum

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static int squareSum(int[] n) {
        int total = 0;
        for (int i = 0; i < n.length; i++) {
            total += n[i] * n[i];
        }
        return total;
    }
}
```

Para `[1, 2, 2]`: 1² + 2² + 2² = 1 + 4 + 4 = 9. Fíjate en que usamos un `for` y un array `n[]`, conceptos que verás con profundidad en la U09.

</details>

---

## Ejercicio 8: El detective de errores

<details>
<summary>🔄 Solución</summary>

Los 2 errores:

1. Falta el `;` al final de `System.out.println("Soy un detective")`.
2. Falta la llave de cierre `}` de la clase.

Versión corregida:

```java
public class Detective {
    public static void main(String[] args) {
        System.out.println("Soy un detective");
        System.out.println("y resuelvo errores");
    }
}
```

</details>

---

## Ejercicio 9: Tu biografía

<details>
<summary>🔄 Solución</summary>

```java
public class Biografia {
    public static void main(String[] args) {
        System.out.println("Nombre: Sergi\nEdad: 30\nLenguaje favorito: Java\nFrase: El código bien escrito se comenta solo");
    }
}
```

El `\n` inserta un salto de línea dentro del mismo texto, así que una sola instrucción `println` muestra las cuatro líneas.

</details>