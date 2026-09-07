---
title: "Boletín U12 — Avanzado"
description: "Ejercicios de dificultad progresiva para exprimir reduce, groupingBy, Optional y las referencias a métodos"
---

# 📝 Boletín U12 — Avanzado

> Dificultad progresiva. ⭐ para calentar, ⭐⭐ para pensar, ⭐⭐⭐ para concursar. Cada ejercicio incluye una pista (resiste a mirarla).

---

## ⭐⭐ Ejercicio 1: Ordenar con referencias a método

Tienes una lista de nombres. Ordena la lista **por longitud** (de menor a mayor) con un stream usando `sorted()` y la referencia `String::length` combinada con `Comparator.comparing`. Después muéstrala.

**Pista:** `sorted(Comparator.comparing(String::length))` ordena por longitud sin tocar la lista original. Si quieres el orden inverso, usa `reversed()`.

---

## ⭐⭐ Ejercicio 2: Agrupar palabras por su primera letra

Tienes una lista de palabras. Usa `groupingBy` para agruparlas por su **primera letra** y muestra el mapa resultante. Después, con `groupingBy(p -> p.charAt(0), Collectors.counting())`, cuenta cuántas palabras hay en cada grupo.

**Pista:** `groupingBy` devuelve `Map<Character, List<String>>`. El segundo argumento `counting()` cambia el valor del mapa a `Long`.

---

## ⭐⭐ Ejercicio 3: Optional — el que no se deja engañar

Implementa un método que reciba una `List<Integer>` y devuelva el **máximo** usando `max(Integer::compareTo)`, gestionando el resultado con `orElse` para que devuelva `-1` si la lista está vacía. Prueba con una lista vacía y con una llena.

**Pista:** `max` devuelve `Optional<Integer>`. No uses `get()` a ciegas: `orElse(-1)` aterriza con seguridad.

---

## ⭐⭐⭐ Ejercicio 4: El pipeline completo

Tienes esta lista de números:

```java
List<Integer> numeros = List.of(12, 5, 8, 3, 9, 5, 12, 7);
```

Construye un pipeline que: filtre los **mayores o iguales a 5**, los **eleve al cuadrado** (`n * n`), **elimine los duplicados**, los **ordene de mayor a menor** y se quede con los **3 primeros**. Recoge el resultado en una lista con `toList()`.

**Pista:** para ordenar de mayor a menor: `sorted(Comparator.reverseOrder())`. Recuerda que el orden de las estaciones importa: `distinct` antes de `sorted` cambia la cuenta.

---

## ⭐⭐ Ejercicio 5: De lista a mapa con `toMap`

Crea una clase sencilla `Alumno` con `nombre` y `nota`. Con una lista de 5 alumnos, usa `Collectors.toMap` para obtener un `Map<String, Integer>` donde la clave sea el nombre y el valor la nota. Como los nombres son únicos, usa una función de fusión por si acaso.

**Pista:** `Collectors.toMap(Alumno::getNombre, Alumno::getNota, (a, b) -> a)`. La fusión `(a, b) -> a` evita la `IllegalStateException` si se repite una clave.

---

## ⭐⭐⭐ Ejercicio 6: El máximo con `reduce` y comparador

Implementa el máximo de una `List<Integer>` de dos formas: con `reduce` y un acumulador que vaya guardando el mayor (sin usar `Math::max`), y con `max`. ¿Qué devuelve cada una? ¿Cuál necesitas una identidad?

**Pista:** `reduce(Integer.MIN_VALUE, (a, b) -> a > b ? a : b)` usa `Integer.MIN_VALUE` como identidad. `max(Integer::compareTo)` devuelve un `Optional`.

---

## ⭐⭐ Ejercicio 7: Frecuencias con `groupingBy`

Tienes un array de palabras con repetidas:

```java
String[] palabras = {"hola", "adios", "hola", "java", "hola", "adios"};
```

Usa `Arrays.stream` y `groupingBy(p -> p, Collectors.counting())` para contar cuántas veces aparece cada palabra. Muestra el mapa y, después, la palabra que más veces aparece.

**Pista:** el mapa es `Map<String, Long>`. Para la palabra más repetida, recorre `entrySet()` comparando valores, o usa streams de nuevo con `max(Map.Entry.comparingByValue())`.

---

## ⭐⭐⭐ Ejercicio 8: Optional y streams, la pareja

Tienes una lista de nombres. Busca, con streams, el **primer nombre que empiece por "J"** usando `filter(...).findFirst()`. Gestiona el `Optional` resultante con `ifPresent` para imprimirlo y con `orElse` para mostrar "no hay nadie" si no existe. Prueba con una lista que tenga "J" y con otra que no.

**Pista:** `findFirst()` devuelve `Optional<String>`. Con `ifPresent(System.out::println)` imprimes solo si hay valor; `orElse("no hay nadie")` cubre la ausencia.

---

## ⭐⭐⭐ Ejercicio 9: el stream que se niega a morir

Observa este código y responde **sin ejecutarlo**:

```java
import java.util.*;
import java.util.stream.*;

public class Test {
    public static void main(String[] args) {
        Stream<Integer> flujo = List.of(1, 2, 3).stream();
        long a = flujo.count();
        long b = flujo.count();
        System.out.println(a + " " + b);
    }
}
```

1. ¿Compila?
2. ¿Qué ocurre al ejecutarlo?
3. ¿Cómo lo arreglarías?

**Pista:** un stream es de un solo uso. La primera operación terminal lo consume. Si quieres contar dos veces, crea dos streams (`List.of(1, 2, 3).stream()` dos veces).

<details>
<summary>🔄 Solución</summary>

1. **Sí, compila** (el error es de ejecución, no de sintaxis).
2. Al ejecutar, la segunda llamada `flujo.count()` lanza **`IllegalStateException: stream has already been operated upon or closed`**. El primer `count()` ya consumió el stream: no se puede reutilizar.
3. Creando un stream nuevo para cada cuenta:

```java
long a = List.of(1, 2, 3).stream().count();
long b = List.of(1, 2, 3).stream().count();
System.out.println(a + " " + b);   // 3 3
```

La regla de oro: un stream es como un billete de autobús de un solo viaje. Tras bajarte, el billete no sirve.

</details>