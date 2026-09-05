---
title: "02 — LinkedList: la conga line"
description: "La lista que encadena a sus elementos como una conga: rapidísima al principio y al final, y perfecta para colas y pilas 🎉"
---

<p><small>La lista que encadena a sus elementos como una conga: rapidísima al principio y al final, y perfecta para colas y pilas 🎉</small></p>

> 🗺️ **Estás en:** 📚 **U10 · Colecciones** → 02 · LinkedList: la conga line

---

## 📬 La idea en una frase

> **LinkedList encadena sus elementos como una conga: cada uno sabe quién va delante y quién detrás, y es rapidísima para añadir o borrar al principio y al final.**

En el punto 1 viste a `ArrayList`, la lista de todos los días. Ahora toca conocer a su prima, que resuelve un problema distinto: meter y sacar gente por los extremos sin que nada se descoloque. Es la colección perfecta para colas y pilas.

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

## 🛒 Colas y pilas: los dos disfraces de LinkedList

LinkedList es camaleónica: según qué métodos uses, se comporta como una cola o como una pila.

**Cola (FIFO):** el primero en llegar es el primero en salir. Como la fila del supermercado.

```java
LinkedList<String> cola = new LinkedList<>();
cola.addLast("Ana");     // Ana se pone al final
cola.addLast("Bob");     // Bob detrás de Ana
cola.addLast("Carla");   // Carla detrás de Bob
String atendido = cola.removeFirst(); // "Ana" - la primera en llegar
```

**Pila (LIFO):** el último en entrar es el primero en salir. Como la pila de platos: el de arriba del todo es el que coges.

```java
LinkedList<String> pila = new LinkedList<>();
pila.addFirst("plato 1");  // base
pila.addFirst("plato 2");
pila.addFirst("plato 3");  // el último apilado
String quito = pila.removeFirst(); // "plato 3" - el último que entró
```

> ⚠️ **Advertencia:** cuando la cola está vacía, `removeFirst()` y `getFirst()` lanzan una `NoSuchElementException`. Pregunta antes con `isEmpty()`, o usa `peek()` y `poll()`, que devuelven `null` en lugar de explotar.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `addLast` + `removeFirst` = cola FIFO. `addFirst` + `removeFirst` = pila LIFO. Elige los métodos, no la clase.

**Ejercicio: el colado de la conga**

```java
import java.util.LinkedList;

public class BeTheConga {
    public static void main(String[] args) {
        LinkedList<String> conga = new LinkedList<>();
        conga.addLast("Ana");
        conga.addLast("Bob");
        conga.addFirst("Carlos");   // se cuela
        conga.removeLast();

        System.out.println(conga.getFirst());
    }
}
```

**¿Qué imprime?**

- (A) Ana
- (B) Bob
- (C) Carlos
- (D) Error de ejecución

<details>
<summary>🔄 Solución</summary>

La **C**. `addLast("Ana")` → `[Ana]`, `addLast("Bob")` → `[Ana, Bob]`, `addFirst("Carlos")` → `[Carlos, Ana, Bob]`. `removeLast()` quita a Bob → `[Carlos, Ana]`. `getFirst()` devuelve a Carlos. La conga queda cortada por el principio, no por el final.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué colección usarías para una cola de supermercado?
2. ¿Qué hace `removeFirst()` sobre una lista vacía si usas `peek()`/`poll()` en su lugar?
3. ¿Cuál es la diferencia clave de rendimiento entre `LinkedList` y `ArrayList`?
4. Con `addFirst` + `removeFirst`, ¿estás simulando una cola o una pila?

<details>
<summary>🔄 Respuestas</summary>

1. `LinkedList`, con sus métodos `addLast` y `removeFirst`: la cola FIFO del supermercado.
2. `peek()` devuelve `null` sin tocar la lista; `poll()` devuelve `null` y no lanza excepción. `removeFirst()` directo sobre vacía lanza `NoSuchElementException`.
3. `LinkedList` brilla añadiendo/borrando en los extremos; `ArrayList` brilla con el acceso aleatorio `get(i)`, que va directo al índice.
4. Una pila (LIFO): el último en entrar es el primero en salir.

</details>

---

## ✅ Resumen en 3 frases

1. **LinkedList** encadena sus elementos (la conga): cada uno sabe quién va delante y detrás.
2. Es **rapidísima al principio y al final**, y por eso es la reina de las **colas (FIFO)** y las **pilas (LIFO)**.
3. Para acceso aleatorio frecuente (`get(i)`), gana `ArrayList`: `LinkedList` tiene que saltar de eslabón en eslabón.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Lista enlazada | Elementos encadenados que saben quién va delante y detrás |
> | FIFO | First In, First Out: la cola del supermercado |
> | LIFO | Last In, First Out: la pila de platos |
> | `peek()` | Mirar el primero sin quitarlo |
> | `poll()` | Quitar el primero sin lanzar excepción si está vacía |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/10-colecciones) · **Anterior:** [01 · ArrayList y el Java Collections Framework](/ApuntesProgramacion/10-colecciones/01-arraylist-jcf) · **Siguiente:** [03 · HashSet: el portero sin duplicados](/ApuntesProgramacion/10-colecciones/03-hashset)