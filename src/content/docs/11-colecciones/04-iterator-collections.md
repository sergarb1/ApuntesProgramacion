---
title: "04 · Iterator y Collections: recorrer y manipular"
description: "El camarero que recorre cualquier colección y borra sin romper nada, y la navaja suiza que ordena, revuelve y consulta en una línea 🍽️🧰"
---

<p><small>El camarero que recorre cualquier colección y borra sin romper nada, y la navaja suiza que ordena, revuelve y consulta en una línea 🍽️🧰</small></p>

> 🗺️ **Estás en:** 📚 **U11 · Colecciones, genéricos y mapas** → 04 · Iterator y Collections

---

## 📬 La idea en una frase

> **`Iterator` recorre cualquier colección y su `remove()` es la única forma segura de borrar durante el recorrido; `Collections` es la navaja suiza de métodos estáticos que hace en una línea lo que tú tardarías en diez.**

En los puntos anteriores recorriste listas y conjuntos con `for-each` sin preguntarte cómo funcionaban por dentro. Ese `for-each` tiene un superhéroe trabajando por debajo: el `Iterator`. Y una vez sabes recorrer, toca manipular sin escribir bucles a mano: para eso está `Collections`, la hermana de la clase `Arrays` que viste en la U05.

---

## 🍽️ Iterator: el camarero que toma nota

`Iterator` recorre una colección **sin que sepas ni te importe cómo está implementada por dentro**. Es como un camarero: "¿Qué quiere? ¿Y usted? ¿Y usted?"

```java
import java.util.ArrayList;
import java.util.Iterator;

public class EjemploIterator {
    public static void main(String[] args) {
        ArrayList<String> platos = new ArrayList<>();
        platos.add("Tortilla");
        platos.add("Paella");
        platos.add("Croquetas");

        Iterator<String> it = platos.iterator();
        while (it.hasNext()) {          // ¿queda algo?
            String plato = it.next();   // dámelo
            System.out.println(plato);
        }
    }
}
```

El protocolo del camarero:

| Método | Qué hace |
|---|---|
| `hasNext()` | ¿Hay más elementos? (`boolean`) |
| `next()` | Devuelve el siguiente y avanza |
| `remove()` | Borra el último elemento devuelto por `next()` |

> 💡 **Consejo:** el `for-each` usa un `Iterator` por debajo. Por eso puedes usar `for-each` con cualquier colección: todas lo implementan. El for-each es el atajo; el `Iterator` es la herramienta con superpoderes (borrar).

### 💥 La superpotencia: borrar durante el recorrido

Aquí está la joya. **Nunca** hagas `lista.remove(elemento)` mientras usas un `for-each`:

```java
ArrayList<String> platos = new ArrayList<>();
platos.add("Tortilla");
platos.add("Paella");
platos.add("Croquetas");

// MAL: ConcurrentModificationException
for (String plato : platos) {
    if (plato.equals("Paella")) {
        platos.remove(plato);   // BOOM
    }
}
```

> ⚠️ **Advertencia:** borrar con `lista.remove()` mientras un for-each recorre la lista lanza `ConcurrentModificationException`. El for-each no sabe que la lista ha cambiado por debajo y se vuelve loco. Usa SIEMPRE `iterator.remove()` si necesitas borrar durante el recorrido.

La forma correcta:

```java
Iterator<String> it = platos.iterator();
while (it.hasNext()) {
    String plato = it.next();
    if (plato.equals("Paella")) {
        it.remove(); // BORRA de la lista ORIGINAL, sin excepción
    }
}
// Ahora platos = [Tortilla, Croquetas]
```

`it.remove()` borra el elemento que acaba de devolver `next()` de la colección original. Es la única forma segura de "borrar mientras recorres".

---

## 🧰 Collections: el amigo utilitario

```java
import java.util.ArrayList;
import java.util.Collections;

public class EjemploCollections {
    public static void main(String[] args) {
        ArrayList<String> lista = new ArrayList<>();
        lista.add("Zara");
        lista.add("Ana");
        lista.add("Bob");

        Collections.sort(lista);        // [Ana, Bob, Zara]
        Collections.reverse(lista);     // [Zara, Bob, Ana]
        Collections.shuffle(lista);     // orden aleatorio
        String max = Collections.max(lista);    // "Zara" (orden alfabético)
        String min = Collections.min(lista);    // "Ana"
        int veces = Collections.frequency(lista, "Ana"); // cuántas veces aparece
        Collections.replaceAll(lista, "Ana", "Ana María");
        Collections.rotate(lista, 2);   // rota 2 posiciones
    }
}
```

El repertorio esencial:

| Método | Qué hace |
|---|---|
| `sort(lista)` | Ordena la lista en el sitio |
| `reverse(lista)` | Le da la vuelta |
| `shuffle(lista)` | Mezcla al azar |
| `max(lista)` / `min(lista)` | El mayor / el menor |
| `frequency(lista, e)` | Cuántas veces aparece `e` |
| `replaceAll(lista, viejo, nuevo)` | Sustituye todas las apariciones |
| `rotate(lista, k)` | Rota los elementos `k` posiciones |
| `binarySearch(lista, e)` | Busca (lista ordenada) |
| `copy(destino, origen)` | Copia una lista en otra |

> 📝 **Nota:** `Collections.sort()` ordena la **lista original** (la modifica). Si no quieres tocar la tuya, cópiala antes: `ArrayList<String> copia = new ArrayList<>(lista);` y ordena la copia.

### ⚠️ Los métodos que modifican tu lista

Casi todos los métodos de `Collections` que empiezan con un verbo ("sort", "shuffle", "reverse", "rotate"...) **modifican la lista que les pasas**. No devuelven una nueva: cambian la original.

```java
ArrayList<Integer> nums = new ArrayList<>();
nums.add(3);
nums.add(1);
nums.add(2);

Collections.sort(nums);      // nums AHORA es [1, 2, 3]
System.out.println(nums);    // [1, 2, 3] - la original, modificada
```

> ⚠️ **Advertencia:** si necesitas conservar la lista original, haz siempre una copia antes: `new ArrayList<>(lista)`. Es el error típico de quien ordena sin querer su lista de la compra.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `it.remove()` borra el último elemento devuelto por `next()`. Nunca llames a `remove()` sin un `next()` justo antes. Y recuerda: los métodos estáticos de `Collections` van a por el original.

**Ejercicio 1: ¿qué imprime (o qué lanza)?**

```java
import java.util.ArrayList;

public class BeTheIterator {
    public static void main(String[] args) {
        ArrayList<String> nombres = new ArrayList<>();
        nombres.add("Ana");
        nombres.add("Bob");
        nombres.add("Carla");

        for (String n : nombres) {
            if (n.equals("Bob")) {
                nombres.remove(n);
            }
        }
        System.out.println(nombres);
    }
}
```

**¿Qué ocurre?**

- (A) Imprime `[Ana, Carla]`
- (B) Imprime `[Ana, Bob, Carla]`
- (C) Lanza `ConcurrentModificationException`
- (D) No compila

<details>
<summary>🔄 Solución</summary>

La **C**. El `for-each` usa un `Iterator` interno. Al borrar con `nombres.remove(n)` mientras el iterador recorre la lista, la colección cambia "por la espalda" y el iterador lanza `ConcurrentModificationException`. La solución: recorrer con `Iterator` explícito y usar `it.remove()`.

</details>

**Ejercicio 2: Collections en acción**

```java
import java.util.*;

public class BeTheCollections {
    public static void main(String[] args) {
        ArrayList<Integer> nums = new ArrayList<>();
        nums.add(5);
        nums.add(1);
        nums.add(8);
        nums.add(3);

        Collections.sort(nums);
        Collections.reverse(nums);

        System.out.println(nums.get(1));
    }
}
```

**¿Qué imprime?**

- (A) 1
- (B) 3
- (C) 5
- (D) 8

<details>
<summary>🔄 Solución</summary>

La **C**. `sort` → `{1, 3, 5, 8}`. `reverse` → `{8, 5, 3, 1}`. `get(1)` = 5. Dos métodos estáticos en dos líneas y ya tienes la lista manipulada. Sin bucles a mano.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué excepción lanza borrar con `lista.remove()` dentro de un `for-each`?
2. ¿Cómo se borra un elemento mientras se recorre con `Iterator`?
3. ¿`Collections.sort()` modifica la lista original?
4. ¿Qué método de `Collections` devuelve el elemento mayor según el orden natural?

<details>
<summary>🔄 Respuestas</summary>

1. `ConcurrentModificationException`. El for-each no detecta que la lista ha cambiado y se vuelve loco.
2. Con `it.remove()` justo después de `it.next()`. Borra el último elemento devuelto, de la colección original.
3. Sí. Modifica la lista en el sitio. Si quieres conservar la tuya, cópiala primero con `new ArrayList<>(lista)`.
4. `Collections.max(lista)`. Devuelve el mayor según el orden natural del tipo.

</details>

---

## ✅ Resumen en 3 frases

1. **Iterator** recorre cualquier colección con `hasNext()` / `next()`, y su `remove()` es la única forma segura de **borrar durante el recorrido**.
2. **Collections** es la navaja suiza estática: `sort`, `reverse`, `shuffle`, `max`, `min`, `frequency`...
3. La mayoría de los métodos de `Collections` **modifican la lista original**: cópiate antes si la necesitas intacta.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Iterador | Objeto que recorre una colección sin exponer su estructura |
> | `ConcurrentModificationException` | Error al modificar la colección mientras se recorre |
> | Clase utilitaria | Clase de métodos estáticos que no se instancia |
> | Modificar en el sitio | Cambiar la propia colección (no una copia) |
> | `shuffle` | Mezclar al azar |
> | `frequency` | Contar apariciones |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/11-colecciones) · **Anterior:** [03 · HashSet, TreeSet y LinkedHashSet](/ApuntesProgramacion/11-colecciones/03-conjuntos-sets) · **Siguiente:** [05 · Tu propia clase genérica: `Caja<T>`](/ApuntesProgramacion/11-colecciones/05-clases-genericas)
