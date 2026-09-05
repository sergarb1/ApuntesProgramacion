---
title: "07 — LinkedList, HashSet y TreeSet"
description: "La conga line, el portero sin duplicados y el organizado: tres colecciones para tres problemas distintos 🎉"
---

<p><small>La conga line, el portero sin duplicados y el organizado: tres colecciones para tres problemas distintos 🎉</small></p>

> 🗺️ **Estás en:** 📚 **U09 · Arrays y Colecciones** → 07 · LinkedList, HashSet y TreeSet

---

## 📬 La idea en una frase

> **ArrayList no es la única lista: LinkedList encadena elementos como una conga, HashSet no deja entrar duplicados y TreeSet los guarda ya ordenados. Cada problema tiene su colección.**

En el punto 6 conociste a la familia. Ahora toca conocer a los primos: dos listas/colecciones que resuelven problemas que `ArrayList` no resuelve del todo bien. Elegir la colección adecuada es una de las señales de que dejas de ser novato.

---

## 🎉 LinkedList: la conga line

LinkedList es una **lista enlazada**: cada elemento sabe quién está delante y quién detrás, como en una conga. Para recorrerla por índice hay que saltar de elemento en elemento (es más lenta que `ArrayList` en eso), pero es rapidísima para añadir o borrar **al principio** y al final.

```java
import java.util.LinkedList;

public class EjemploLinkedList {
    public static void main(String[] args) {
        LinkedList<String> cola = new LinkedList<>();
        cola.addLast("Persona 1");   // al final
        cola.addLast("Persona 2");
        cola.addFirst("Colado");     // se cuela al principio
        String primero = cola.removeFirst(); // "Colado" - se va
        System.out.println(cola);    // [Persona 1, Persona 2]
    }
}
```

Sus métodos propios (aunque `add`, `remove`, `get` también funcionan):

| Método | Qué hace |
|---|---|
| `addFirst(e)` / `addLast(e)` | Añade al principio / al final |
| `removeFirst()` / `removeLast()` | Quita y devuelve el primero / el último |
| `getFirst()` / `getLast()` | Mira el primero / el último sin quitarlo |
| `peek()` | Mira el primero sin quitarlo (no lanza si está vacía) |
| `poll()` | Quita el primero (no lanza si está vacía) |

> 💡 **Consejo:** usa `LinkedList` cuando necesites una **cola** (FIFO: el primero en llegar es el primero en salir) o una **pila** (LIFO), o cuando vayas a añadir/borrar mucho al principio. Para acceso aleatorio frecuente (`get(i)`), `ArrayList` es mejor: va directo al índice.

---

## 🚫 HashSet: el portero que no deja duplicados

HashSet es como una discoteca: **no deja entrar a nadie que ya esté dentro**. No importa el orden, solo la exclusividad.

```java
import java.util.HashSet;

public class EjemploHashSet {
    public static void main(String[] args) {
        HashSet<String> invitados = new HashSet<>();
        invitados.add("Ana");
        invitados.add("Bob");
        invitados.add("Ana"); // No pasa nada, Ana ya está
        System.out.println(invitados.size()); // 2, no 3
        System.out.println(invitados.contains("Bob")); // true
    }
}
```

¿Cómo sabe si un elemento ya está? Usa `hashCode()` y `equals()`. Primero calcula el `hashCode()` del elemento para encontrar el "cajón" y luego comprueba con `equals()` si ya hay uno igual dentro.

> ⚠️ **Advertencia:** si sobreescribes `equals()` en una clase, SOBREESCRIBE `hashCode()`. Siempre. Si dos objetos son iguales según `equals()`, deben tener el mismo `hashCode()`. Si no, HashSet se volverá loco. Repito: **siempre**.

### Operaciones típicas con HashSet

```java
HashSet<String> set = new HashSet<>();
set.add("rojo");
set.add("verde");
set.add("azul");
set.remove("rojo");
set.contains("verde");   // true
set.isEmpty();           // false
set.size();              // 2
set.clear();             // lo vacía todo
```

Sus ventajas: **O(1)** para añadir, borrar y comprobar pertenencia, y elimina duplicados sin que tengas que pensarlo. Es la colección más rápida para "¿ya tengo esto?".

---

## 📚 TreeSet: el organizado

TreeSet es un HashSet que **se ordena solo**. Internamente usa un árbol rojo-negro (no necesitas saber más, solo que ordena). Todo lo que metas se coloca automáticamente en su sitio.

```java
import java.util.TreeSet;

public class EjemploTreeSet {
    public static void main(String[] args) {
        TreeSet<String> ordenado = new TreeSet<>();
        ordenado.add("Zara");
        ordenado.add("Ana");
        ordenado.add("Bob");
        System.out.println(ordenado); // [Ana, Bob, Zara] - orden alfabético

        System.out.println(ordenado.first());      // "Ana"
        System.out.println(ordenado.last());       // "Zara"
        System.out.println(ordenado.headSet("Bob")); // [Ana]
    }
}
```

Métodos extra útiles:

| Método | Qué hace |
|---|---|
| `first()` / `last()` | El menor / el mayor |
| `headSet(e)` | Todo lo que va antes de `e` |
| `tailSet(e)` | Todo lo que va después (incluido) de `e` |
| `subSet(a, b)` | El trozo entre `a` y `b` |
| `floor(e)` / `ceiling(e)` | El mayor ≤ e / el menor ≥ e |

> 📝 **Nota:** TreeSet **no admite `null`**. Para ordenar necesita comparar elementos, y ¿cómo comparas `null` con algo? HashSet, en cambio, admite un único `null`. Detalle de examen asegurado.

---

## ⚖️ La comparativa definitiva

| Colección | Orden | Duplicados | Acceso/inserción | Lo que vale |
|---|---|---|---|---|
| `ArrayList` | Por índice | Permitidos | `get(i)` rapidísimo | Lista de todos los días |
| `LinkedList` | Por inserción | Permitidos | Rápida al principio/final | Colas, pilas |
| `HashSet` | Ninguno | No | O(1) | "¿Ya lo tengo?", eliminar duplicados |
| `TreeSet` | Orden natural | No | O(log n) | Elementos siempre ordenados |

**La regla de oro:** ¿sabes cuántos elementos necesitas y no va a cambiar? → array. ¿Lista que crece y acceso por índice? → ArrayList. ¿Cola o pilas? → LinkedList. ¿Sin duplicados y no te importa el orden? → HashSet. ¿Sin duplicados y ordenados? → TreeSet.

> 💡 **Consejo:** ¿necesitas eliminar duplicados pero **manteniendo el orden de llegada**? Usa `LinkedHashSet`, el hermano de HashSet que conserva el orden de inserción. Un clásico en los ejercicios.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cada colección resuelve un problema distinto. Antes de escribir código, pregúntate: ¿me importa el orden? ¿puede haber duplicados? ¿necesito velocidad?

**Ejercicio: el portero de la fiesta**

```java
import java.util.HashSet;

public class BeTheSet {
    public static void main(String[] args) {
        HashSet<Integer> numeros = new HashSet<>();
        numeros.add(3);
        numeros.add(1);
        numeros.add(4);
        numeros.add(1);   // duplicado: no entra
        numeros.add(5);
        numeros.add(3);   // duplicado: no entra

        System.out.println(numeros.size());
        System.out.println(numeros.contains(4));
    }
}
```

**¿Qué imprime?**

- (A) 6 y true
- (B) 4 y true
- (C) 4 y false
- (D) 5 y true

<details>
<summary>🔄 Solución</summary>

La **B**. Los valores únicos son `{1, 3, 4, 5}`: 4 elementos. El `4` sí está (`contains` → true). El `add(1)` y el `add(3)` repetidos se ignoran silenciosamente. Ojo: HashSet no garantiza un orden concreto al imprimir, por eso el `size()` es lo fiable.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué colección usarías para una cola de supermercado?
2. ¿Cuántos elementos hay en un `HashSet` tras añadir `a, b, a, c, b`?
3. ¿Qué diferencia a `TreeSet` de `HashSet`?
4. ¿Puede un `TreeSet` contener un `null`? ¿Y un `HashSet`?

<details>
<summary>🔄 Respuestas</summary>

1. `LinkedList`, por sus métodos `addLast` y `removeFirst`: la cola FIFO del supermercado.
2. 3 (`a`, `b`, `c`). Los duplicados no entran.
3. `TreeSet` mantiene los elementos ordenados automáticamente (árbol rojo-negro) a costa de ser más lento (O(log n) frente a O(1)).
4. `TreeSet` no: necesita comparar para ordenar y no puede comparar `null`. `HashSet` sí admite un único `null`.

</details>

---

## ✅ Resumen en 3 frases

1. **LinkedList** encadena elementos (la conga): rapidísima para añadir/borrar al principio y para simular colas y pilas.
2. **HashSet** es el portero sin duplicados: no admite repetidos, no ordena, y es O(1) en sus operaciones básicas.
3. **TreeSet** ordena todo lo que metes automáticamente y ofrece extras (`first`, `last`, `headSet`), a cambio de ser más lento y no aceptar `null`.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Lista enlazada | Elementos encadenados que saben quién va delante y detrás |
> | FIFO | First In, First Out: la cola del supermercado |
> | LIFO | Last In, First Out: la pila de platos |
> | `hashCode()` | "Número de cajón" que usa HashSet para encontrar elementos |
> | Árbol rojo-negro | Estructura interna de TreeSet que mantiene el orden |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/09-arrays-colecciones) · **Anterior:** [06 · ArrayList y el Java Collections Framework](/ApuntesProgramacion/09-arrays-colecciones/06-arraylist-jcf) · **Siguiente:** [08 · Iterator y la clase Collections](/ApuntesProgramacion/09-arrays-colecciones/08-iterator-collections)