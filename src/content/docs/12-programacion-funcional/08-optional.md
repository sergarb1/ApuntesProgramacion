---
title: "08 · Optional: el que acepta la ausencia"
description: "Envolver el `null` para no tropezarte: `Optional.of`, `orElse`, `isPresent` e `ifPresent` 🎁"
---

<p><small>Envolver el `null` para no tropezarte: `Optional.of`, `orElse`, `isPresent` e `ifPresent` 🎁</small></p>

> 🗺️ **Estás en:** 🎯 **U12 · Programación Funcional** → 08 · Optional: el que acepta la ausencia

---

## 📬 La idea en una frase

> **`Optional<T>` es una caja que contiene un valor o está vacía. En vez de devolver un `null` a secas (que nadie sabe si era un dato real o un olvido), devuelves la caja y obligas a quien la recibe a preguntar: ¿hay valor dentro, o no?**

Llevas toda la unidad procesando datos como un jefe. Pero hay un momento en que todo se tuerce: cuando un método no encuentra lo que busca y devuelve `null`. Y tú, inocente, llamas a `.length()` o a `.get()` sobre ese `null`... y la `NullPointerException` te saluda en toda la cara. `Optional` existe para que la ausencia sea **explícita** y **gestionable**, no un accidente.

---

## 🎁 La caja en acción

Un `Optional<T>` es una cajita que puede estar **llena** (con un valor) o **vacía**. Crearla es fácil:

```java
import java.util.*;

Optional<String> algo = Optional.of("java");        // caja LLENA. Prohibido pasar null.
Optional<String> vacio = Optional.empty();           // caja VACÍA.
Optional<String> dudoso = Optional.ofNullable(valor); // acepta null: si es null, caja vacía
```

> ⚠️ **Advertencia:** `Optional.of(null)` lanza `NullPointerException` al instante. Es la forma de decir "esta caja SOLO admite valores reales". Si no sabes si puede llegar `null`, usa `ofNullable`.

---

## 🎁 Abrir la caja con elegancia

La gracia de la caja es que no la abres a lo bruto: usas sus métodos para decidir qué pasa en cada caso.

```java
import java.util.*;

public class Caja {
    public static void main(String[] args) {
        Optional<String> vacio = Optional.empty();

        // Preguntar
        System.out.println(vacio.isPresent());          // false

        // Valor por defecto: inmediato
        String texto = vacio.orElse("valor por defecto");
        System.out.println(texto);                       // valor por defecto

        // Valor por defecto: perezoso (Supplier)
        String fabricado = vacio.orElseGet(() -> fabricarLento());

        // Si está vacío... revienta con tu excepción
        // String valor = vacio.orElseThrow(() -> new IllegalStateException("¡Faltaba!"));

        // Si hay valor, haz algo (Consumer). Si no, no hagas nada.
        vacio.ifPresent(s -> System.out.println(s.toUpperCase()));  // no imprime nada
    }

    static String fabricarLento() {
        return "fabricado con esfuerzo";
    }
}
```

La diferencia entre `orElse` y `orElseGet`: `orElse(x)` ya tiene `x` calculado (el argumento se evalúa siempre, haya o no valor). `orElseGet(() -> ...)` solo fabrica el valor por defecto si la caja está vacía: es perezoso, y si fabricar es caro, te ahorra el gasto.

---

## 🎁 Optional y los streams: pareja de baile

Aquí se junta todo: muchas operaciones terminales de streams devuelven un `Optional` porque no pueden garantizar que exista resultado. `findFirst`, `findAny`, `max` y `min` son las típicas.

```java
import java.util.*;
import java.util.stream.*;

public class Pareja {
    public static void main(String[] args) {
        List<String> nombres = List.of("bob", "ana", "carla");

        Optional<String> primeroConA = nombres.stream()
            .filter(n -> n.startsWith("a"))
            .findFirst();

        System.out.println(primeroConA.isPresent());      // true
        primeroConA.ifPresent(System.out::println);       // ana

        Optional<String> ninguno = nombres.stream()
            .filter(n -> n.startsWith("z"))
            .findFirst();
        System.out.println(ninguno.orElse("no hay nadie"));  // no hay nadie
    }
}
```

Si el `filter` no deja pasar a nadie, `findFirst` devuelve una caja vacía... y tú, con `orElse` o `ifPresent`, decides el aterrizaje. Eso sí: **no uses `get()` a lo loco**: si la caja está vacía, `get()` lanza `NoSuchElementException`. Pregunta (`isPresent`) o aterriza (`orElse`) antes de abrir.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `orElse(null)` es legal pero es volver a casa con las manos vacías: mejor `orElse("algo sensato")` o `orElseThrow(...)`. Si vas a devolver `null`, ¿para qué envolviste la ausencia en una caja?

**Ejercicio: el ascensor de la caja**

```java
import java.util.*;
import java.util.stream.*;

public class Ascensor {
    public static void main(String[] args) {
        List<Integer> notas = List.of();
        Optional<Integer> maxima = notas.stream()
            .max(Integer::compareTo);
        System.out.println(maxima.orElse(-1));
    }
}
```

**¿Qué imprime?**

- (A) `-1`
- (B) `0`
- (C) `Optional.empty`
- (D) Una `NoSuchElementException`

<details>
<summary>🔄 Solución</summary>

La **A**. `notas` está vacía, así que `max(Integer::compareTo)` no encuentra ningún máximo y devuelve una caja **vacía**. `orElse(-1)` es la red de seguridad: como no hay valor, devuelve `-1`. Sin el `orElse`, un `get()` a ciegas habría lanzado `NoSuchElementException` (la D, que pasa si intentas `maxima.get()`). La B (`0`) sería el resultado de `orElse(0)` con otra red. Y la C describe la caja antes de abrirla: el `orElse` ya la ha abierto y ha decidido el aterrizaje.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué pasa si haces `Optional.of(null)`?
2. ¿Cómo lees el valor de un `Optional` sin arriesgarte a una excepción?
3. ¿Qué diferencia hay entre `orElse` y `orElseGet`?
4. ¿Qué métodos de streams devuelven `Optional`?

<details>
<summary>🔄 Respuestas</summary>

1. `NullPointerException`: `Optional.of` solo admite valores reales. Para posibles `null`, usa `ofNullable`.
2. Con `orElse`, `orElseGet` o `ifPresent`. Nunca con `get()` a ciegas.
3. `orElse(x)` tiene el valor por defecto ya calculado (se evalúa siempre); `orElseGet(() -> ...)` lo fabrica solo si la caja está vacía (perezoso).
4. `findFirst`, `findAny`, `max` y `min` devuelven `Optional` porque no pueden garantizar resultado.

</details>

---

## ✅ Resumen en 3 frases

1. **`Optional`** es una caja que contiene un valor o está vacía: sustituye al `null` a secas y hace explícita la ausencia.
2. Se crea con `of`, `ofNullable` o `empty`, y se consume con `orElse`, `orElseGet`, `orElseThrow` e `ifPresent`.
3. Muchos métodos de streams (`findFirst`, `max`, `min`) devuelven `Optional`: la caja es el puente entre la pereza del stream y tu decisión sobre la ausencia.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `Optional<T>` | Caja que envuelve un valor o su ausencia |
> | `Optional.of(v)` | Caja llena (prohíbe `null`) |
> | `Optional.ofNullable(v)` | Caja que admite `null` (si es null, queda vacía) |
> | `Optional.empty()` | Caja vacía |
> | `orElse(x)` / `orElseGet(s)` | Valor por defecto (inmediato / perezoso) |
> | `orElseThrow()` | Lanza una excepción si está vacío |
> | `ifPresent(c)` | Ejecuta un `Consumer` solo si hay valor |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/12-programacion-funcional) · **Anterior:** [07 · Del stream a la colección: toList, Collectors, groupingBy](/ApuntesProgramacion/12-programacion-funcional/07-streams-colecciones) · **Siguiente:** [09 · Repaso interactivo](/ApuntesProgramacion/12-programacion-funcional/09-repaso-interactivo)