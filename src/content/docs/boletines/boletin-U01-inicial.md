---
title: Boletín U01 — Inicial
description: Ejercicios básicos de Introducción a Java
---

# 📝 Boletín U01 — Inicial

> Sin soluciones. Sin prisas. Con un editor de texto y muchas ganas de compilar. Esto apenas empieza.

---

## Ejercicio 1: desordena esto

Las líneas de este programa están desordenadas. Ordénalas para formar un programa Java válido que compile y se ejecute.

```java
}
    public static void main(String[] args) {
        System.out.println("Mi primer programa ordenado");
public class Ordenado {
    }
```

---

## Ejercicio 2: ¿Qué imprime?

Sin ejecutar, escribe la salida exacta de este programa:

```java
public class Escapista {
    public static void main(String[] args) {
        System.out.print("Dijo: \"Java mola\"");
        System.out.println(" y siguió: \tprogramando.");
    }
}
```

Pista: `\"` imprime una comilla literal, `\t` es un tabulador.

---

## Ejercicio 3: cazador de errores

Este código tiene **4 errores**. Encuéntralos y corrígelos.

```java
Public class ErrorFinder {
    public static void main(string[] args) {
        System.out.println("Hola, "Mundo"");
        System.out.println("Esto funciona?)
    }
}
```

---

## Ejercicio 4: Tu ficha personal

Escribe un programa llamado `FichaPersonal` que muestre:

```
Nombre: [Tu nombre]
Edad: [Tu edad]
Lenguaje favorito: Java
¿Emocionado?: true
```

Usa una línea `println` para cada campo. Fíjate en el último: `true` va como **texto** dentro de las comillas del `println` (así aparece el texto «¿Emocionado?: true»), no como un booleano suelto.

---

## Ejercicio 5: completa el programa

Falta una línea crucial y un par de caracteres. Añádelos para que compile y muestre "Aprobado, esto funciona".

```java
public class Completame {
    public static void main(String[] args) {
        System.out.println("Aprobado, esto funciona")
}
```

---

## Ejercicio 6: empareja conceptos

Relaciona cada concepto de la izquierda con su definición de la derecha:

| Concepto | Definición |
|---|---|
| 1. `class` | A. Punto de entrada del programa |
| 2. `main` | B. Imprime texto y salta de línea |
| 3. `System.out.println` | C. Define un nuevo tipo de datos |
| 4. `//` | D. Comentario de una línea |
| 5. `args` | E. Contiene los argumentos de línea de comandos |

Escribe las respuestas como "1→C, 2→A, ..."

---

## Ejercicio 7: CodeWars — Square(n) Sum

Resuelve la kata **"Square(n) Sum"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/515e271a311df0350d00000f).

Dado un array de números, eleva cada uno al cuadrado y suma los resultados. Por ejemplo, `[1, 2, 2]` → 1 + 4 + 4 = 9.

---

## Ejercicio 8: El detective de errores

El siguiente código tiene 2 errores que impiden que compile. Encuéntralos y corrígelos:

```java
public class Detective {
    public static void main(String[] args) {
        System.out.println("Soy un detective")
        System.out.println("y resuelvo errores");
    }
}
```

Escribe la versión corregida. Después, ejecútala y comprueba que funciona.

---

## Ejercicio 9: Tu biografía

Escribe un programa llamado `Biografia` que muestre:
- Tu nombre
- Tu edad
- Tu lenguaje de programación favorito
- Una frase que te motive

Cada cosa en una línea. Usa **una sola** instrucción `System.out.println` con `\n` para los saltos.