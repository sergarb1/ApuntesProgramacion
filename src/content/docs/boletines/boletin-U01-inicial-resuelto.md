---
title: "Boletín U01 — Inicial Resuelto"
description: "Los mismos ejercicios que el boletín inicial, con soluciones"
---

# 📝 Boletín U01 — Inicial (Resuelto)

> Las soluciones están ocultas. Intenta de verdad antes de destaparlas. Compara tu código con estas propuestas de resolución y comparte tus dudas o alternativas en el foro.

---

## Ejercicio 1: Desordena esto (Solución)

<details>
<summary>🔄 Solución</summary>

**Código ordenado y corregido:**

```java
public class Ordenado {
    public static void main(String[] args) {
        System.out.println("Mi primer programa ordenado");
    }
}
```

</details>

---

## Ejercicio 2: ¿Qué imprime? (Solución)

<details>
<summary>🔄 Solución</summary>

**Salida exacta por pantalla:**

```
Dijo: "Java mola" y siguió: 	programando.
```

**Explicación**: `System.out.print` no añade salto de línea al final, por lo que la segunda instrucción se imprime inmediatamente a continuación. La secuencia `\"` permite escribir la comilla doble sin cerrar la cadena, y `\t` añade el espaciado del tabulador.

</details>

---

## Ejercicio 3: Cazador de errores (Solución)

<details>
<summary>🔄 Solución</summary>

**Errores encontrados:**

1. `Public` va en minúscula (`public`).
2. `string` va con la primera letra en mayúscula (`String`).
3. En `"Hola, "Mundo""` hay que escapar las comillas internas (`"Hola, \"Mundo\""`)
4. En `"Esto funciona?)` falta la comilla doble de cierre (`"Esto funciona?"`).

**Código corregido:**

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

## Ejercicio 4: Tu ficha personal (Solución)

<details>
<summary>🔄 Solución</summary>

**Código de resolución:**

```java
public class FichaPersonal {
    public static void main(String[] args) {
        System.out.println("Nombre: Sergi");
        System.out.println("Edad: 25");
        System.out.println("Lenguaje favorito: Java");
        System.out.println("¿Emocionado?: " + true);
    }
}
```

</details>

---

## Ejercicio 5: Completa el programa (Solución)

<details>
<summary>🔄 Solución</summary>

**Elementos añadidos:**

- El punto y coma `;` al final de la instrucción `System.out.println`.
- La llave de cierre `}` de la clase `Completame`.

**Código corregido:**

```java
public class Completame {
    public static void main(String[] args) {
        System.out.println("Aprobado, esto funciona");
    }
}
```

</details>

---

## Ejercicio 6: Empareja conceptos (Solución)

<details>
<summary>🔄 Solución</summary>

**Resolución:** 1→C, 2→A, 3→B, 4→D, 5→E

</details>

---

## Ejercicio 7: El detective de errores (Solución)

<details>
<summary>🔄 Solución</summary>

**Error encontrado:** Falta el punto y coma `;` al final de la primera instrucción `System.out.println("Soy un detective")`.

**Código corregido:**

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

## Ejercicio 8: Tu biografía (Solución)

<details>
<summary>🔄 Solución</summary>

**Código de resolución (con una sola instrucción y `\n`):**

```java
public class Biografia {
    public static void main(String[] args) {
        System.out.println("Nombre: Sergi\nEdad: 25\nLenguaje favorito: Java\nFrase: El código limpio habla por sí solo.");
    }
}
```

</details>
