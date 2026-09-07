---
title: "Boletín U12 — Inicial Resuelto"
description: "Los mismos ejercicios que el boletín inicial, con soluciones"
---

# 📝 Boletín U12 — Inicial (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## Ejercicio 1: Completa el código — tu primera lambda

<details>
<summary>🔄 Solución</summary>

```java
Predicate<Integer> esMayorDeEdad = edad -> edad >= 18;
Function<Integer, Integer> doble = x -> x * 2;
Consumer<String> imprimir = s -> System.out.println(s);
Supplier<String> saludar = () -> "¡Hola!";
```

La variable debe ser de tipo **interfaz funcional**: la lambda solo compila si su firma encaja con el método abstracto de la interfaz. `Predicate` espera `boolean test(Integer)`, `Function` espera `R apply(T)`, `Consumer` espera `void accept(T)` y `Supplier` espera `T get()`. Fíjate en el `Supplier`: sin parámetros, los paréntesis vacíos `()` son obligatorios.

</details>

---

## Ejercicio 2: ¿Qué imprime? — el orden de la flecha

<details>
<summary>🔄 Solución</summary>

Imprime:

```
26
1
```

- `operacion.apply(5)` → `5 * 5 + 1` = 26.
- `operacion.apply(0)` → `0 * 0 + 1` = 1.

El cuerpo `x * x + 1` es una **sola expresión**: en las lambdas, un cuerpo de una expresión devuelve su resultado sin necesidad de `return` ni llaves. Las llaves y el `return` solo hacen falta cuando el cuerpo tiene varias sentencias.

</details>

---

## Ejercicio 3: Encuentra el error — la lambda mal vestida

<details>
<summary>🔄 Solución</summary>

El error está en la línea `esPositivo.accept(5)`: `Predicate` no tiene un método `accept`. Su método abstracto es `test(T)`. `accept` pertenece a `Consumer`. La línea correcta es:

```java
System.out.println(esPositivo.test(5));   // true
```

Cada interfaz funcional tiene SU método: `Predicate` usa `test`, `Function` usa `apply`, `Consumer` usa `accept` y `Supplier` usa `get`. Confundirlos es como pedir una pizza en la pescadería: no es que la pizza no exista, es que no está ahí.

</details>

---

## Ejercicio 4: Escribe este programa — filtrar pares con streams

<details>
<summary>🔄 Solución</summary>

```java
import java.util.*;
import java.util.stream.*;

public class Pares {
    public static void main(String[] args) {
        List<Integer> numeros = List.of(10, 15, 22, 33, 40, 55);

        List<Integer> pares = numeros.stream()
            .filter(n -> n % 2 == 0)
            .toList();

        System.out.println(pares);   // [10, 22, 40]
    }
}
```

El `filter` con `n -> n % 2 == 0` (un `Predicate<Integer>`) deja pasar solo los pares: 10, 22 y 40. `toList()` recoge el resultado. Hay 3 pares. Fíjate en que la lista original no se toca: el stream crea una lista nueva.

</details>

---

## Ejercicio 5: ¿Qué imprime? — el pipeline básico

<details>
<summary>🔄 Solución</summary>

Imprime **`2`**.

- `filter(p -> p.length() >= 4)` deja pasar: `luna` (4), `cielo` (5) y la segunda `sol` no (3 letras). Pero la primera `sol` tampoco: 3 < 4. Espera... repasemos: `sol`=3, `luna`=4, `mar`=3, `cielo`=5. Pasan `luna` y `cielo`.
- `distinct()` no cambia nada aquí (ya no hay repetidos entre los que pasan).
- `count()` → 2.

Sin `distinct()`, el resultado sería el mismo en este caso (2), porque `sol` ya fue eliminada por el `filter`. `distinct()` habría importado si el `filter` dejara pasar dos iguales.

</details>

---

## Ejercicio 6: Completa el código — mayúsculas con map

<details>
<summary>🔄 Solución</summary>

```java
List<String> mayusculas = palabras.stream()
    .map(String::toUpperCase)
    .toList();
```

- La intermedia es **`map`** con la referencia a método `String::toUpperCase` (equivale a `p -> p.toUpperCase()`).
- La terminal es **`toList()`** (Java 16+).

Con `Collectors.toList()` sería exactamente igual pero devolviendo un `ArrayList` modificable: `palabras.stream().map(String::toUpperCase).collect(Collectors.toList())`. `toList()` devuelve una lista inmutable; para el resultado sería `["HOLA", "JAVA", "MUNDO"]`.

</details>

---

## Ejercicio 7: Escribe este programa — longitud de cada palabra

<details>
<summary>🔄 Solución</summary>

```java
import java.util.*;
import java.util.stream.*;

public class Longitudes {
    public static void main(String[] args) {
        String[] nombres = {"Ana", "Bob", "Carla", "David"};

        List<Integer> longitudes = Arrays.stream(nombres)
            .map(String::length)
            .collect(Collectors.toList());

        longitudes.forEach(System.out::println);   // 3, 3, 5, 5
    }
}
```

Dos trucos nuevos: `Arrays.stream(nombres)` convierte el array (de la U04) en stream, y `map(String::length)` transforma cada `String` en su longitud, cambiando el tipo del flujo a `Stream<Integer>`. El `forEach` con `System.out::println` es la terminal que imprime cada elemento.

</details>

---

## Ejercicio 8: Encuentra el error — la cinta que nunca arranca

<details>
<summary>🔄 Solución</summary>

El pipeline no tiene **operación terminal**: `filter` y `map` son intermedias (perezosas) y no ejecutan nada hasta que llega un `collect`, `count`, `forEach` o similar. El stream se prepara, pero la cinta nunca arranca.

Para ver los números transformados hay que cerrar el grifo. Por ejemplo:

```java
List<Integer> imparesDoblados = numeros.stream()
    .filter(n -> n % 2 == 1)
    .map(n -> n * 10)
    .toList();
System.out.println(imparesDoblados);   // [10, 30, 50]
```

Es el error más típico de la unidad: montar la ruta y olvidar que el autobús necesita arrancar.

</details>

---

## Ejercicio 9: Completa el código — un Consumer para imprimir

<details>
<summary>🔄 Solución</summary>

```java
palabras.stream()
    .forEach(p -> System.out.print("(" + p + ")"));
```

- `System.out.print(...)` imprime **sin salto de línea**: la salida sería `(hola)(java)`.
- `System.out.println(...)` añade el salto de línea al final: `(hola)` y `(java)` en líneas separadas.

El `forEach` recibe un `Consumer<String>`; la lambda `p -> System.out.print("(" + p + ")")` se puede reescribir con una referencia a método, aunque aquí el cuerpo ya no es una única llamada, así que la lambda es la opción natural.

</details>