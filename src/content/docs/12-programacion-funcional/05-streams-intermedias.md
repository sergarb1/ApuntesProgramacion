---
title: "05 · Operaciones intermedias: filter, map, distinct, sorted, limit"
description: "La cinta que filtra, transforma, quita repetidos, ordena y limita el flujo 🌀"
---

<p><small>La cinta que filtra, transforma, quita repetidos, ordena y limita el flujo 🌀</small></p>

> 🗺️ **Estás en:** 🎯 **U12 · Programación Funcional** → 05 · Operaciones intermedias: filter, map, distinct, sorted, limit

---

## 📬 La idea en una frase

> **Las operaciones intermedias transforman el flujo y devuelven otro `Stream`. No hacen nada por sí solas (son perezosas) y no tocan la colección original: solo deciden cómo será la cinta cuando arranque.**

Ya tienes la cinta del punto 4. Hoy le pones las estaciones: `filter` decide qué paquetes pasan, `map` los reetiqueta, `distinct` saca los duplicados, `sorted` los ordena y `limit` corta el flujo. Todas devuelven un stream nuevo, todas son perezosas y ninguna modifica tu lista original. Eso sí: **el orden de las estaciones importa**.

---

## 🌀 Las cinco estaciones

### `filter(Predicate)` — el portero

Deja pasar solo los elementos que cumplen la condición. Necesita un `Predicate` (punto 2).

```java
List<Integer> numeros = List.of(1, 2, 3, 4, 5, 6);
List<Integer> pares = numeros.stream()
    .filter(n -> n % 2 == 0)      // 2, 4, 6
    .toList();
```

### `map(Function)` — el transformador

Transforma cada elemento. Necesita una `Function` (punto 2). Cambia el tipo de la cinta: `Stream<Integer>` → `Stream<String>` si quieres.

```java
List<String> palabras = List.of("hola", "java");
List<Integer> longitudes = palabras.stream()
    .map(String::length)          // 4, 4
    .toList();
```

### `distinct()` — el que quita repetidos

Elimina duplicados usando `equals()`.

```java
List<String> repetidas = List.of("sol", "mar", "sol", "luna");
List<String> unicas = repetidas.stream()
    .distinct()                   // sol, mar, luna
    .toList();
```

### `sorted()` — el que ordena

Ordena según el orden natural (con `Comparable`). Si quieres otro criterio, usa `sorted(Comparator)`.

```java
List<Integer> desordenados = List.of(5, 2, 8, 1);
List<Integer> ordenados = desordenados.stream()
    .sorted()                     // 1, 2, 5, 8
    .toList();
```

### `limit(n)` — la tijera

Se queda con los `n` primeros elementos del flujo.

```java
List<Integer> numeros = List.of(10, 20, 30, 40, 50);
List<Integer> tresPrimeros = numeros.stream()
    .limit(3)                     // 10, 20, 30
    .toList();
```

---

## 🏭 Las estaciones en cadena

Lo bonito es que se encadenan: cada operación recibe el flujo de la anterior y le pasa el suyo a la siguiente. Un ejemplo completo:

```java
import java.util.*;
import java.util.stream.*;

public class Cadena {
    public static void main(String[] args) {
        List<String> palabras = List.of("java", "hola", "java", "mundo", "adios", "luna");

        palabras.stream()
            .filter(p -> p.length() > 3)      // java, hola, java, mundo, adios, luna
            .map(String::toUpperCase)         // JAVA, HOLA, JAVA, MUNDO, ADIOS, LUNA
            .distinct()                       // JAVA, HOLA, MUNDO, ADIOS, LUNA
            .sorted()                         // ADIOS, HOLA, JAVA, LUNA, MUNDO
            .limit(3)                         // ADIOS, HOLA, JAVA
            .forEach(System.out::println);    // terminal: imprime las tres
    }
}
```

Salida:

```
ADIOS
HOLA
JAVA
```

Fíjate en la **importancia del orden**: si pones `limit(3)` antes de `sorted()`, te quedas con los tres primeros en el orden de llegada y luego los ordenas; el resultado cambia. Diseñar el pipeline es decidir en qué orden pasa cada paquete por cada estación.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `map` puede cambiar el tipo del stream (`Stream<String>` → `Stream<Integer>`), pero `filter` siempre devuelve el mismo tipo que recibe: solo quita elementos, no los transforma.

**Ejercicio: la estación que sobra**

```java
import java.util.*;
import java.util.stream.*;

public class Estaciones {
    public static void main(String[] args) {
        List<String> nombres = List.of("ana", "bob", "carla", "david", "eva");
        List<String> resultado = nombres.stream()
            .sorted()
            .filter(n -> n.length() == 3)
            .limit(1)
            .toList();
        System.out.println(resultado);
    }
}
```

**¿Qué imprime?**

- (A) `[ana]`
- (B) `[bob]`
- (C) `[ana, bob, eva]`
- (D) `[eva]`

<details>
<summary>🔄 Solución</summary>

La **B**. Primero `sorted()` ordena: `ana, bob, carla, david, eva`. Después `filter(n -> n.length() == 3)` deja solo los de 3 letras: `ana, bob, eva`. Y `limit(1)` se queda con el primero del flujo filtrado, que ahora es `bob` (porque tras ordenar, `bob` va antes que `eva`). Sin el `sorted`, el resultado habría sido `[ana]`; el orden de las estaciones cambia la respuesta. Fíjate cómo `filter` y `limit` no tocan el tipo: seguimos con `List<String>`.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿`filter` deja pasar los elementos que cumplen la condición o los que no?
2. ¿`map` modifica la colección original?
3. ¿Qué hace `distinct`?
4. ¿Qué hace `limit(3)`?

<details>
<summary>🔄 Respuestas</summary>

1. Los que hacen que el `Predicate` devuelva `true`.
2. No. Devuelve un stream nuevo; la colección original no se toca.
3. Elimina duplicados usando `equals()`.
4. Corta el flujo y se queda con los 3 primeros elementos (su efecto depende de si va antes o después de `sorted`).

</details>

---

## ✅ Resumen en 3 frases

1. Las **operaciones intermedias** transforman el flujo y devuelven otro `Stream`: `filter`, `map`, `distinct`, `sorted` y `limit`.
2. Son **perezosas**: no se ejecutan hasta que llega una operación terminal, y **no modifican** la fuente.
3. El **orden de las estaciones importa**: el mismo pipeline con las mismas operaciones en distinto orden puede dar resultados distintos.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Intermedia | Operación que devuelve otro `Stream` |
> | `filter` | Deja pasar lo que cumple el `Predicate` |
> | `map` | Transforma cada elemento con una `Function` |
> | `distinct` | Elimina repetidos (con `equals`) |
> | `sorted` | Ordena (orden natural o con `Comparator`) |
> | `limit(n)` | Corta el flujo en n elementos |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/12-programacion-funcional) · **Anterior:** [04 · Streams: el flujo de datos](/ApuntesProgramacion/12-programacion-funcional/04-streams-basicos) · **Siguiente:** [06 · Operaciones terminales: collect, reduce, count, forEach](/ApuntesProgramacion/12-programacion-funcional/06-streams-terminales)