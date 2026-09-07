---
title: "Boletín U12 — Avanzado Resuelto"
description: "Los mismos ejercicios que el boletín avanzado, con soluciones"
---

# 📝 Boletín U12 — Avanzado (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## ⭐⭐ Ejercicio 1: Ordenar con referencias a método

<details>
<summary>🔄 Solución</summary>

```java
import java.util.*;
import java.util.stream.*;

public class Orden {
    public static void main(String[] args) {
        List<String> nombres = List.of("Carlos", "Ana", "David", "Bob");

        List<String> porLongitud = nombres.stream()
            .sorted(Comparator.comparing(String::length))
            .toList();

        System.out.println(porLongitud);   // [Ana, Bob, Carlos, David]

        List<String> inverso = nombres.stream()
            .sorted(Comparator.comparing(String::length).reversed())
            .toList();
        System.out.println(inverso);   // [Carlos, David, Ana, Bob]
    }
}
```

`Comparator.comparing(String::length)` construye un comparador que usa la referencia a método `String::length` como "clave de ordenación". `sorted` no modifica la lista original: devuelve un stream ordenado. Con `.reversed()` inviertes el criterio (los más largos primero; los empates mantienen el orden de llegada).

</details>

---

## ⭐⭐ Ejercicio 2: Agrupar palabras por su primera letra

<details>
<summary>🔄 Solución</summary>

```java
import java.util.*;
import java.util.stream.*;

public class Grupos {
    public static void main(String[] args) {
        List<String> palabras = List.of("hola", "adios", "mar", "mundo", "luna");

        Map<Character, List<String>> porLetra = palabras.stream()
            .collect(Collectors.groupingBy(p -> p.charAt(0)));

        System.out.println(porLetra);
        // {a=[adios], h=[hola], l=[luna], m=[mar, mundo]}

        Map<Character, Long> conteo = palabras.stream()
            .collect(Collectors.groupingBy(p -> p.charAt(0), Collectors.counting()));

        System.out.println(conteo);
        // {a=1, h=1, l=1, m=2}
    }
}
```

`groupingBy(p -> p.charAt(0))` agrupa las palabras por su primera letra: cada letra es una clave y su lista de palabras el valor. Con `Collectors.counting()` como segundo argumento (el "colector aguas abajo"), el valor pasa de `List<String>` a `Long`: cuántas palabras caen en cada grupo. Es el contador de frecuencias por categoría en una línea.

</details>

---

## ⭐⭐ Ejercicio 3: Optional — el que no se deja engañar

<details>
<summary>🔄 Solución</summary>

```java
import java.util.*;
import java.util.stream.*;

public class Maximo {
    public static int maximoSeguro(List<Integer> numeros) {
        return numeros.stream()
            .max(Integer::compareTo)
            .orElse(-1);
    }

    public static void main(String[] args) {
        System.out.println(maximoSeguro(List.of(4, 9, 2, 7)));   // 9
        System.out.println(maximoSeguro(List.of()));             // -1
    }
}
```

`max(Integer::compareTo)` devuelve un `Optional<Integer>`: si la lista está vacía, la caja está vacía. `orElse(-1)` aterriza con seguridad: devuelve el máximo si hay valor y `-1` si no. Usar `get()` aquí habría lanzado `NoSuchElementException` con la lista vacía: el `orElse` es la red que convierte una excepción en un dato controlado.

</details>

---

## ⭐⭐⭐ Ejercicio 4: El pipeline completo

<details>
<summary>🔄 Solución</summary>

```java
import java.util.*;
import java.util.stream.*;

public class Pipeline {
    public static void main(String[] args) {
        List<Integer> numeros = List.of(12, 5, 8, 3, 9, 5, 12, 7);

        List<Integer> resultado = numeros.stream()
            .filter(n -> n >= 5)                     // 12, 5, 8, 9, 5, 12, 7
            .map(n -> n * n)                         // 144, 25, 64, 81, 25, 144, 49
            .distinct()                              // 144, 25, 64, 81, 49
            .sorted(Comparator.reverseOrder())       // 144, 81, 64, 49, 25
            .limit(3)                                // 144, 81, 64
            .toList();

        System.out.println(resultado);   // [144, 81, 64]
    }
}
```

El pipeline completo de la unidad: filtrar (el 3 se queda fuera), transformar al cuadrado, quitar duplicados (el 12 y el 5 repetidos desaparecen), ordenar de mayor a menor con `Comparator.reverseOrder()` y cortar en 3 con `limit`. El orden importa: `distinct` antes de `sorted` significa que la lista a ordenar ya no tiene repetidos.

</details>

---

## ⭐⭐ Ejercicio 5: De lista a mapa con `toMap`

<details>
<summary>🔄 Solución</summary>

```java
import java.util.*;
import java.util.stream.*;

class Alumno {
    private String nombre;
    private int nota;

    public Alumno(String nombre, int nota) {
        this.nombre = nombre;
        this.nota = nota;
    }

    public String getNombre() { return nombre; }
    public int getNota() { return nota; }
}

public class Mapa {
    public static void main(String[] args) {
        List<Alumno> alumnos = List.of(
            new Alumno("Ana", 8),
            new Alumno("Bob", 6),
            new Alumno("Carla", 9),
            new Alumno("David", 7),
            new Alumno("Eva", 5)
        );

        Map<String, Integer> porNombre = alumnos.stream()
            .collect(Collectors.toMap(Alumno::getNombre, Alumno::getNota, (a, b) -> a));

        System.out.println(porNombre);   // {Eva=5, Ana=8, Bob=6, Carla=9, David=7}
    }
}
```

`Collectors.toMap(Alumno::getNombre, Alumno::getNota, (a, b) -> a)` usa referencias a método para sacar clave (nombre) y valor (nota). La función de fusión `(a, b) -> a` es el seguro: si un nombre se repitiera, dos elementos querrían la misma clave y sin fusión Java lanzaría `IllegalStateException`. Con `(a, b) -> a` se queda con el primero.

</details>

---

## ⭐⭐⭐ Ejercicio 6: El máximo con `reduce` y comparador

<details>
<summary>🔄 Solución</summary>

```java
import java.util.*;
import java.util.stream.*;

public class Maximo {
    public static void main(String[] args) {
        List<Integer> numeros = List.of(4, 9, 2, 9, 7);

        int conReduce = numeros.stream()
            .reduce(Integer.MIN_VALUE, (a, b) -> a > b ? a : b);
        System.out.println(conReduce);   // 9

        Optional<Integer> conMax = numeros.stream().max(Integer::compareTo);
        System.out.println(conMax.orElse(-1));   // 9
    }
}
```

- Con `reduce`, la identidad `Integer.MIN_VALUE` garantiza que el primer elemento siempre gane la comparación (cualquier `int` es mayor que el mínimo posible). El acumulador va guardando el mayor visto.
- Con `max(Integer::compareTo)` no hay identidad: devuelve un `Optional<Integer>` porque una lista vacía no tiene máximo. Se aterriza con `orElse(-1)`.

La diferencia clave: `reduce` con identidad devuelve el valor directo; `max` devuelve `Optional` y te obliga a gestionar la ausencia.

</details>

---

## ⭐⭐ Ejercicio 7: Frecuencias con `groupingBy`

<details>
<summary>🔄 Solución</summary>

```java
import java.util.*;
import java.util.stream.*;

public class Frecuencias {
    public static void main(String[] args) {
        String[] palabras = {"hola", "adios", "hola", "java", "hola", "adios"};

        Map<String, Long> frec = Arrays.stream(palabras)
            .collect(Collectors.groupingBy(p -> p, Collectors.counting()));

        System.out.println(frec);   // {adios=2, hola=3, java=1}

        Map.Entry<String, Long> campeona = frec.entrySet().stream()
            .max(Map.Entry.comparingByValue())
            .orElse(null);

        System.out.println("Más repetida: " + campeona.getKey() + " (" + campeona.getValue() + ")");
    }
}
```

Dos niveles de streams: el primero convierte el array en flujo y agrupa por la palabra misma (`p -> p`), contando con `counting()`: `hola`=3, `adios`=2, `java`=1. El segundo recorre las entradas del mapa (`entrySet()`) y busca el máximo valor con `max(Map.Entry.comparingByValue())`, que devuelve `Optional<Map.Entry>` (aterrizado con `orElse(null)`). Es el `entrySet` de la U11 + el `max` de los streams.

</details>

---

## ⭐⭐⭐ Ejercicio 8: Optional y streams, la pareja

<details>
<summary>🔄 Solución</summary>

```java
import java.util.*;
import java.util.stream.*;

public class Busqueda {
    public static void buscarJ(List<String> nombres) {
        nombres.stream()
            .filter(n -> n.startsWith("J"))
            .findFirst()
            .ifPresentOrElse(
                System.out::println,
                () -> System.out.println("no hay nadie")
            );
    }

    public static void main(String[] args) {
        buscarJ(List.of("Ana", "Juan", "Carla"));    // Juan
        buscarJ(List.of("Ana", "Carla"));            // no hay nadie
    }
}
```

`filter(n -> n.startsWith("J")).findFirst()` devuelve `Optional<String>`: la caja está llena si alguien cumple y vacía si no. `ifPresentOrElse` es el método que junta los dos caminos: el primer argumento es el `Consumer` para cuando hay valor (`System.out::println`), el segundo un `Runnable` para cuando no lo hay. También podrías hacerlo con `ifPresent` + `orElse`, pero `ifPresentOrElse` hace la pareja en una sola llamada.

</details>

---

## ⭐⭐⭐ Ejercicio 9: el stream que se niega a morir

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