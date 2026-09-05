---
title: "08 · Be the Code: colecciones en acción"
description: "Sé el Código puro: predice la salida, caza el bug y decide qué colección encaja antes de que compile nada 🧪"
---

<p><small>Sé el Código puro: predice la salida, caza el bug y decide qué colección encaja antes de que compile nada 🧪</small></p>

> 🗺️ **Estás en:** 📚 **U10 · Colecciones** → 08 · Be the Code: colecciones en acción

---

## 📬 La idea en una frase

> **Solo hay una forma de saber si dominas las colecciones: predecir qué hace un programa sin ejecutarlo, cazar el bug que se esconde y elegir la colección adecuada a ojo.**

Los puntos 1 a 7 te dieron las piezas. Ahora las mezclamos todas: índices que se desplazan, `remove` por valor o por índice, `HashSet` que ignora duplicados, `Iterator` que borra sin romper y `Collections` que lo revuelve todo. Ponte las gafas de la JVM.

---

## 🧪 Sé el Código: la lista que se desplaza

> *Eres la JVM. Ejecuta este programa:*

```java
import java.util.ArrayList;

public class BeTheDomino {
    public static void main(String[] args) {
        ArrayList<String> lista = new ArrayList<>();
        lista.add("A");
        lista.add("B");
        lista.add("C");
        lista.add("D");
        lista.remove(1);          // adiós, "B"
        lista.add(1, "X");        // "X" empuja al resto
        lista.remove("D");        // adiós, "D" por objeto

        System.out.println(lista);
    }
}
```

**¿Qué imprime?**

- (A) `[A, X, C, D]`
- (B) `[A, X, C]`
- (C) `[A, B, C]`
- (D) `[X, A, C]`

<details>
<summary>🔄 Solución</summary>

La **B**. `remove(1)` borra la posición 1 ("B") → `[A, C, D]`. `add(1, "X")` inserta "X" en la posición 1 y desplaza a los demás → `[A, X, C, D]`. `remove("D")` borra el objeto "D" → `[A, X, C]`. Los índices son fichas de dominó: cada borrado o inserción los mueve a todos.

</details>

---

## 🧪 Sé el Código: el portero y el duplicado

> *Eres el compilador. ¿Esto compila y qué hace?*

```java
import java.util.ArrayList;
import java.util.HashSet;

public class BeTheMix {
    public static void main(String[] args) {
        ArrayList<Integer> numeros = new ArrayList<>();
        numeros.add(2);
        numeros.add(3);
        numeros.add(2);
        numeros.add(5);

        HashSet<Integer> unicos = new HashSet<>(numeros);
        numeros.remove(Integer.valueOf(2));

        System.out.println(unicos.size() + " " + numeros.size());
    }
}
```

**¿Qué imprime?**

- (A) `4 3`
- (B) `3 3`
- (C) `3 4`
- (D) `4 4`

<details>
<summary>🔄 Solución</summary>

La **B**. `new HashSet<>(numeros)` se construye con los valores de la lista: `{2, 3, 5}` (el 2 repetido no entra), así que `unicos.size()` = 3. Luego `numeros.remove(Integer.valueOf(2))` borra la **primera** aparición del objeto 2 → la lista queda `[3, 2, 5]`, con `size()` = 3. Ojo: el `HashSet` ya se construyó antes del borrado, así que no se entera de nada.

</details>

---

## 🧪 Sé el Código: el bucle que explota

> *Eres la JVM. ¿Qué pasa aquí?*

```java
import java.util.ArrayList;

public class BeTheBoom {
    public static void main(String[] args) {
        ArrayList<String> nombres = new ArrayList<>();
        nombres.add("Ana");
        nombres.add("Bob");
        nombres.add("Carla");
        nombres.add("David");

        for (String n : nombres) {
            if (n.startsWith("C")) {
                nombres.remove(n);
            }
        }
        System.out.println(nombres);
    }
}
```

**¿Qué ocurre?**

- (A) Imprime `[Ana, Bob, David]`
- (B) Imprime `[Ana, Bob, Carla, David]`
- (C) Lanza `ConcurrentModificationException`
- (D) Lanza `ArrayIndexOutOfBoundsException`

<details>
<summary>🔄 Solución</summary>

La **C**. El `for-each` recorre con un `Iterator` interno. Cuando `remove("Carla")` cambia la lista por la espalda, el iterador lo detecta y lanza `ConcurrentModificationException`. La solución correcta: `Iterator<String> it = nombres.iterator();` y borrar con `it.remove()`.

</details>

---

## 🧪 Sé el Código: Collections lo revuelve todo

> *Eres la JVM. ¿Cuál es la última línea?*

```java
import java.util.*;

public class BeTheShuffle {
    public static void main(String[] args) {
        ArrayList<Integer> nums = new ArrayList<>();
        nums.add(4);
        nums.add(2);
        nums.add(6);
        nums.add(1);

        Collections.sort(nums);
        Collections.reverse(nums);
        int max = Collections.max(nums);
        int veces = Collections.frequency(nums, 6);

        System.out.println(nums.get(0) + " " + max + " " + veces);
    }
}
```

**¿Qué imprime?**

- (A) `6 6 1`
- (B) `1 6 1`
- (C) `6 1 1`
- (D) `6 6 0`

<details>
<summary>🔄 Solución</summary>

La **A**. `sort` → `[1, 2, 4, 6]`. `reverse` → `[6, 4, 2, 1]`. `max` = 6 (el mayor). `frequency` de 6 = 1 (aparece una vez). `get(0)` = 6. Salida: `6 6 1`.

</details>

---

## 🧪 Sé el Código: elige la colección

> *Eres la persona que decide. Para cada escenario, una línea: qué colección y por qué.*

1. Guardar las matrículas de los coches de un parking, **sin repetir** y sin importar el orden.
2. Simular la **fila** de la cafetería a la hora del recreo.
3. Ordenar por nota una lista de alumnos (la nota puede repetirse).
4. Eliminar duplicados de una lista **conservando el orden de llegada**.

<details>
<summary>🔄 Soluciones</summary>

1. **HashSet** — no admite duplicados y `contains` es O(1) para saber si ya está aparcado.
2. **LinkedList** — FIFO con `addLast` y `removeFirst`.
3. **ArrayList** + `Collections.sort()` — se puede ordenar con notas repetidas.
4. **LinkedHashSet** — elimina repetidos y recuerda el orden de inserción.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. `lista.remove(1)` con `lista.add(1, "X")` después: ¿qué pasa con los elementos que estaban a partir del índice 1?
2. ¿Qué lanza borrar con `lista.remove()` dentro de un `for-each`?
3. ¿`Collections.sort()` devuelve una lista nueva u ordena la que le pasas?
4. ¿Qué colección da `size()` = 3 si metes `{2, 3, 2, 5}`?

<details>
<summary>🔄 Respuestas</summary>

1. `remove(1)` borra la posición 1 y desplaza los siguientes hacia la izquierda; `add(1, "X")` inserta en la posición 1 y desplaza los siguientes hacia la derecha. Los índices se mueven como fichas de dominó.
2. `ConcurrentModificationException`. El `for-each` recorre con un `Iterator` interno que detecta el cambio.
3. Ordena la que le pasas: la modifica en el sitio. Para conservar la tuya, cópiala antes.
4. `HashSet` (o `LinkedHashSet`): el 2 repetido solo entra una vez → `{2, 3, 5}`.

</details>

---

## ✅ Resumen en 3 frases

1. **Be the Code** es leer código como lo lee la JVM: sin ejecutar, sin adivinar, con las reglas en la cabeza.
2. Las trampas favoritas: `remove(índice)` vs `remove(objeto)`, borrar durante un `for-each` y confiar en el orden de un `HashSet`.
3. Si predices correctamente la salida de estos cinco programas, dominas la unidad.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Desplazar índices | Efecto dominó al insertar o borrar en una lista |
> | `remove(objeto)` | Borra la primera aparición de ese objeto |
> | `remove(índice)` | Borra la posición indicada |
> | `ConcurrentModificationException` | Boom al modificar mientras se recorre |
> | Be the Code | Leer código y predecir su salida sin ejecutarlo |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/10-colecciones) · **Anterior:** [07 · Elegir la colección adecuada](/ApuntesProgramacion/10-colecciones/07-elegir-coleccion) · **Siguiente:** [09 · Repaso interactivo](/ApuntesProgramacion/10-colecciones/09-repaso-interactivo)