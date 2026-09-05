---
title: "05 — Iterator: el camarero que toma nota"
description: "Recorre cualquier colección sin que te importe su estructura, y su remove() es la única forma segura de borrar mientras avanzas 🍽️"
---

<p><small>Recorre cualquier colección sin que te importe su estructura, y su remove() es la única forma segura de borrar mientras avanzas 🍽️</small></p>

> 🗺️ **Estás en:** 📚 **U10 · Colecciones** → 05 · Iterator: el camarero que toma nota

---

## 📬 La idea en una frase

> **`Iterator` recorre cualquier colección sin que te importe cómo está hecha por dentro, y su `remove()` es la única forma segura de borrar durante el recorrido sin que explote nada.**

En los puntos anteriores recorriste listas y conjuntos con `for-each` sin preguntarte cómo funcionaban por dentro. Ese `for-each` tiene un superhéroe trabajando por debajo: el `Iterator`. Hoy vas a conocerlo en persona, y a descubrir su superpoder.

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

---

## 💥 La superpotencia: borrar durante el recorrido

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

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `it.remove()` borra el último elemento devuelto por `next()`. Nunca llames a `remove()` sin un `next()` justo antes.

**Ejercicio: ¿qué imprime (o qué lanza)?**

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

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué excepción lanza borrar con `lista.remove()` dentro de un `for-each`?
2. ¿Cómo se borra un elemento mientras se recorre con `Iterator`?
3. ¿Qué método del `Iterator` devuelve el siguiente elemento?
4. ¿Por qué el `for-each` funciona con cualquier colección?

<details>
<summary>🔄 Respuestas</summary>

1. `ConcurrentModificationException`. El for-each no detecta que la lista ha cambiado y se vuelve loco.
2. Con `it.remove()` justo después de `it.next()`. Borra el último elemento devuelto, de la colección original.
3. `next()`.
4. Porque el `for-each` usa un `Iterator` por debajo, y todas las colecciones del JCF lo implementan.

</details>

---

## ✅ Resumen en 3 frases

1. **Iterator** recorre cualquier colección con `hasNext()` / `next()`, sin exponer su estructura interna.
2. Su `remove()` es la única forma segura de **borrar durante el recorrido**.
3. Borrar con `lista.remove()` dentro de un `for-each` lanza `ConcurrentModificationException`: error de examen garantizado.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Iterador | Objeto que recorre una colección sin exponer su estructura |
> | `ConcurrentModificationException` | Error al modificar la colección mientras se recorre |
> | `hasNext()` | ¿Quedan más elementos? |
> | `next()` | Devuelve el siguiente y avanza |
> | `remove()` | Borra el último elemento devuelto por `next()` |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/10-colecciones) · **Anterior:** [04 · TreeSet y LinkedHashSet: el ordenado y el que recuerda](/ApuntesProgramacion/10-colecciones/04-treeset-linkedhashset) · **Siguiente:** [06 · La clase Collections: la navaja suiza](/ApuntesProgramacion/10-colecciones/06-collections)