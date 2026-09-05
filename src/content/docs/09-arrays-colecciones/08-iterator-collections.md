---
title: "08 — Iterator y la clase Collections"
description: "El camarero que toma nota uno a uno y la navaja suiza de las colecciones: sort, max, min y compañía 🍽️"
---

<p><small>El camarero que toma nota uno a uno y la navaja suiza de las colecciones: sort, max, min y compañía 🍽️</small></p>

> 🗺️ **Estás en:** 📚 **U09 · Arrays y Colecciones** → 08 · Iterator y la clase Collections

---

## 📬 La idea en una frase

> **`Iterator` recorre cualquier colección sin que te importe cómo está hecha por dentro (y permite borrar durante el recorrido); `Collections` aporta los métodos estáticos para ordenar, revolver y consultar tus colecciones.**

Dos herramientas cierran el círculo de las colecciones: una para **recorrer** con seguridad (y borrar sin morir en el intento) y otra para **manipular** listas y conjuntos con un solo método. Vamos a por ellas.

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

### La superpotencia: borrar durante el recorrido

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

Igual que `Arrays` era la navaja suiza de los arrays, `Collections` lo es de las colecciones. Métodos estáticos (de la U07) que hacen en una línea lo que tú tardarías en 10:

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

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** los métodos estáticos de `Collections` son potentes pero van a por el original: `sort`, `shuffle` y `reverse` modifican tu lista. Cópiate antes si la necesitas intacta.

**Ejercicio: Collections en acción**

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
2. Borrar con `lista.remove()` dentro de un `for-each` lanza `ConcurrentModificationException`: error de examen garantizado.
3. **Collections** es la navaja suiza estática: `sort`, `reverse`, `shuffle`, `max`, `min`, `frequency`... y todos modifican o consultan la colección original.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Iterador | Objeto que recorre una colección sin exponer su estructura |
> | `ConcurrentModificationException` | Error al modificar la colección mientras se recorre |
> | Modificar en el sitio | Cambiar la propia colección (no una copia) |
> | Orden natural | El orden por defecto del tipo (numérico, alfabético) |
> | Clase utilitaria | Clase de métodos estáticos que no se instancia |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/09-arrays-colecciones) · **Anterior:** [07 · LinkedList, HashSet y TreeSet](/ApuntesProgramacion/09-arrays-colecciones/07-linkedlist-hashset) · **Siguiente:** [09 · Repaso interactivo](/ApuntesProgramacion/09-arrays-colecciones/09-repaso-interactivo)