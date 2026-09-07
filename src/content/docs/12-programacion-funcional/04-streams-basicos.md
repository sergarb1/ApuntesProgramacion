---
title: "04 · Streams: el flujo de datos"
description: "La cinta transportadora de Java: crear un `Stream`, el pipeline y por qué no guarda nada 📦"
---

<p><small>La cinta transportadora de Java: crear un `Stream`, el pipeline y por qué no guarda nada 📦</small></p>

> 🗺️ **Estás en:** 🗺️ **U12 · Programación Funcional** → 04 · Streams: el flujo de datos

---

## 📬 La idea en una frase

> **Un `Stream` no es una colección nueva: es una cinta transportadora por la que pasan los elementos de una fuente (una lista, un array, varios valores...) para procesarlos de una vez, sin bucles.**

Hasta ahora, para trabajar con una lista de la U10 escribías `for (String s : lista)` y dentro hacías la magia. El stream es otra filosofía: en vez de decirle a Java **cómo** recorrer (bucle, índice, iterador), le dices **qué** quieres conseguir y él monta la cinta. Tú diseñas el flujo; Java mueve los paquetes.

---

## 📦 ¿Qué es un Stream (y qué NO es)?

Un `Stream<T>` es una **secuencia de elementos** de tipo `T` que se procesa de una vez. Tres reglas que te van a evitar disgustos:

- **No guarda datos.** La cinta no almacena paquetes: los datos siguen viviendo en tu lista o tu array. El stream solo los va pasando.
- **Es perezoso.** Las operaciones intermedias no se ejecutan hasta que aparece una operación terminal (lo vemos en el punto 5).
- **Solo se recorre una vez.** Como una cinta de supermercado: cuando el último producto cae en la bolsa, la cinta se queda vacía. Usarlo dos veces es imposible.

---

## 🚚 Crear un Stream: las cuatro fuentes

```java
import java.util.*;
import java.util.stream.*;

public class Fuentes {
    public static void main(String[] args) {
        List<String> nombres = List.of("ana", "bob", "carla");

        Stream<String> s1 = nombres.stream();                          // desde una colección
        Stream<Integer> s2 = Stream.of(1, 2, 3);                       // desde valores sueltos
        Stream<String> s3 = Arrays.stream(new String[]{"x", "y"});     // desde un array
        Stream<Integer> s4 = Stream.iterate(0, n -> n + 1);            // infinita (¡con cuidado!)
    }
}
```

- `lista.stream()` — la fuente más común: cualquier colección de la U10 tiene este método.
- `Stream.of(a, b, c)` — cuando quieres un flujo a partir de varios valores sin montar una lista.
- `Arrays.stream(array)` — para convertir un array de la U04 en flujo.
- `Stream.iterate(0, n -> n + 1)` — genera una secuencia infinita. No la cierres con una terminal que lo recorra todo o tu programa se dedicará a contar hasta el infinito (y no es una metáfora).

---

## 🏭 El pipeline: fuente → intermedias → terminal

La forma de usar un stream es el **pipeline**: una fuente, cero o más operaciones intermedias, y una operación terminal que cierra el grifo.

```java
import java.util.*;
import java.util.stream.*;

public class Pipeline {
    public static void main(String[] args) {
        List<String> nombres = List.of("ana", "bob", "carla", "david", "eva");

        long cantidad = nombres.stream()          // 1. fuente
            .filter(n -> n.length() > 3)          // 2. intermedia: se queda con los largos
            .count();                             // 3. terminal: los cuenta

        System.out.println(cantidad);             // 3 (carla, david, eva)
    }
}
```

La operación terminal (`count()`) es la que hace que la cinta arranque. Sin ella, el stream no mueve ni un paquete: las intermedias solo preparan la cinta. Es como planear un viaje: puedes diseñar la ruta todo lo que quieras, pero nadie sale hasta que el autobús arranca.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `lista.stream()` te da un flujo, pero `List.of(...)` crea listas **inmutables**. Si necesitas que el resultado sea modificable, en el punto 7 verás cómo salir del stream a una colección que sí puedas tocar.

**Ejercicio: la cinta que arranca**

```java
import java.util.*;
import java.util.stream.*;

public class Cinta {
    public static void main(String[] args) {
        List<Integer> numeros = List.of(4, 8, 15, 16, 23, 42);
        Stream<Integer> flujo = numeros.stream()
            .filter(n -> n % 2 == 0)
            .map(n -> n * 10);
        System.out.println("Cinta preparada");
    }
}
```

**¿Qué imprime?**

- (A) `Cinta preparada`
- (B) `Cinta preparada` y luego `40 80 160 420`
- (C) `40 80 160 420`
- (D) Nada: el programa se queda colgado esperando la cinta.

<details>
<summary>🔄 Solución</summary>

La **A**. El pipeline termina con `map` (una operación intermedia), así que **no hay operación terminal**: la cinta se prepara pero jamás arranca. `filter` y `map` no ejecutan nada hasta que llega un `collect`, `count`, `forEach` o similar. Es la pereza del stream en estado puro: preparas la ruta, y nadie se sube al autobús. La B y la C serían ciertas si añadieras `forEach(System.out::println)` o un `toList()` al final. Y el programa no se cuelga: simplemente no imprime números.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Un `Stream` guarda datos?
2. ¿Cuántas veces puedes recorrer un `Stream`?
3. ¿Cómo creas un stream desde una lista?
4. ¿Y desde varios valores sueltos?

<details>
<summary>🔄 Respuestas</summary>

1. No. Es una vista/flujo: los datos siguen en la colección original.
2. Una sola vez. Tras una operación terminal, el stream queda consumido.
3. Con `lista.stream()`.
4. Con `Stream.of(valor1, valor2, ...)`.

</details>

---

## ✅ Resumen en 3 frases

1. Un **`Stream`** es un flujo de elementos, no un contenedor: no guarda nada, es una cinta por la que pasan los datos.
2. Se crea con `coleccion.stream()`, `Stream.of(...)`, `Arrays.stream(array)` o `Stream.iterate`, y se usa en un **pipeline** de fuente → intermedias → terminal.
3. El stream es **perezoso y de un solo uso**: sin operación terminal no hace nada, y una vez consumido no se puede reutilizar.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Stream | Flujo de datos que se procesa de una vez |
> | Pipeline | Cadena fuente → intermedias → terminal |
> | Fuente | De dónde salen los elementos (colección, array, `Stream.of`) |
> | Pereza | Las operaciones intermedias no se ejecutan hasta la terminal |
> | Consumible | Un stream solo se recorre una vez |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/12-programacion-funcional) · **Anterior:** [03 · Referencias a métodos: el atajo `::`](/ApuntesProgramacion/12-programacion-funcional/03-referencias-metodos) · **Siguiente:** [05 · Operaciones intermedias: filter, map, distinct, sorted, limit](/ApuntesProgramacion/12-programacion-funcional/05-streams-intermedias)