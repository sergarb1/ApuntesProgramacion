---
title: "Boletín U12 — Inicial"
description: "Ejercicios básicos de Programación Funcional: lambdas, Predicate, map y filter sobre streams"
---

# 📝 Boletín U12 — Inicial

> Sin soluciones. Sin prisas. Abre el IDE, escribe tu primera `->` y haz que la cinta transportadora del stream deje de parecer magia. Las funciones viajan solas, pero el que programa eres tú. Empieza suave, que la flecha no muerde.

---

## Ejercicio 1: Completa el código — tu primera lambda

Completa las lambdas para que hagan lo que dice el comentario:

```java
Predicate<Integer> esMayorDeEdad = ______;      // edad >= 18
Function<Integer, Integer> doble = ______;      // x * 2
Consumer<String> imprimir = ______;             // System.out.println(s)
Supplier<String> saludar = ______;              // "¡Hola!"
```

¿Qué tipo necesita la variable para que la lambda compile en cada caso?

---

## Ejercicio 2: ¿Qué imprime? — el orden de la flecha

```java
import java.util.function.Function;

public class Test {
    public static void main(String[] args) {
        Function<Integer, Integer> operacion = x -> x * x + 1;
        System.out.println(operacion.apply(5));
        System.out.println(operacion.apply(0));
    }
}
```

¿Qué imprime? ¿Por qué el cuerpo `x * x + 1` no necesita `return` ni llaves?

---

## Ejercicio 3: Encuentra el error — la lambda mal vestida

```java
import java.util.function.Predicate;

public class Error {
    public static void main(String[] args) {
        Predicate<Integer> esPositivo = x -> x > 0;
        System.out.println(esPositivo.test(-3));
        System.out.println(esPositivo.accept(5));   // ¿Qué ocurre aquí?
    }
}
```

Este código **no compila**. ¿Por qué? ¿Qué método deberías llamar en vez de `accept`?

---

## Ejercicio 4: Escribe este programa — filtrar pares con streams

Crea un programa que tenga esta lista:

```java
List<Integer> numeros = List.of(10, 15, 22, 33, 40, 55);
```

Usa un stream para **filtrar los pares**, recogerlos en una lista con `toList()` y mostrarla. ¿Cuántos pares hay?

---

## Ejercicio 5: ¿Qué imprime? — el pipeline básico

```java
import java.util.*;
import java.util.stream.*;

public class Test {
    public static void main(String[] args) {
        List<String> palabras = List.of("sol", "luna", "mar", "cielo", "sol");
        long largas = palabras.stream()
            .filter(p -> p.length() >= 4)
            .distinct()
            .count();
        System.out.println(largas);
    }
}
```

¿Qué imprime? ¿Por qué `distinct()` cambia el resultado frente a no usarlo?

---

## Ejercicio 6: Completa el código — mayúsculas con map

Completa el pipeline para que transforme cada palabra a mayúsculas y las recoja en una lista:

```java
List<String> palabras = List.of("hola", "java", "mundo");

List<String> mayusculas = palabras.stream()
    .______(String::toUpperCase)
    .______();
```

¿Qué operación intermedia y qué terminal necesitas? ¿Y si usaras `Collectors.toList()` en vez de `toList()`?

---

## Ejercicio 7: Escribe este programa — longitud de cada palabra

Crea un programa que tenga un array de nombres y use un stream con `map` para calcular la **longitud de cada nombre**, recogiéndolo en una `List<Integer>`. Después muestra el resultado con `forEach(System.out::println)`.

---

## Ejercicio 8: Encuentra el error — la cinta que nunca arranca

```java
import java.util.*;
import java.util.stream.*;

public class Error {
    public static void main(String[] args) {
        List<Integer> numeros = List.of(1, 2, 3, 4, 5);
        Stream<Integer> flujo = numeros.stream()
            .filter(n -> n % 2 == 1)
            .map(n -> n * 10);
        System.out.println("Preparado");
    }
}
```

Este programa **compila y ejecuta**, pero no imprime ningún número transformado. ¿Por qué? ¿Qué le falta al pipeline?

---

## Ejercicio 9: Completa el código — un Consumer para imprimir

Tienes una lista de Strings y quieres imprimir cada uno entre paréntesis, por ejemplo `(hola)`. Completa el `forEach`:

```java
List<String> palabras = List.of("hola", "java");

palabras.stream()
    .forEach(p -> System.out.______("(" + p + ")"));
```

¿Qué método de `System.out` imprime sin salto de línea? ¿Y cuál añade el salto?