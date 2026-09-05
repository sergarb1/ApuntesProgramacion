---
title: "04 · TreeSet y LinkedHashSet: el ordenado y el que recuerda"
description: "TreeSet ordena todo lo que metes y LinkedHashSet conserva el orden de llegada: dos primos de HashSet con memoria y brújula 🧭"
---

<p><small>TreeSet ordena todo lo que metes y LinkedHashSet conserva el orden de llegada: dos primos de HashSet con memoria y brújula 🧭</small></p>

> 🗺️ **Estás en:** 📚 **U10 · Colecciones** → 04 · TreeSet y LinkedHashSet: el ordenado y el que recuerda

---

## 📬 La idea en una frase

> **TreeSet es un HashSet que se ordena solo (como si tuviera brújula), y LinkedHashSet es un HashSet con memoria: conserva el orden en el que llegaron los elementos.**

En el punto 3 conociste al portero que no deja duplicados. Ahora tocan sus dos primos, que heredan esa manía de no admitir repetidos pero le añaden una superpotencia a cada uno: orden automático (TreeSet) y memoria del orden de llegada (LinkedHashSet).

---

## 🧭 TreeSet: el organizado

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

## 🧠 LinkedHashSet: el que recuerda el orden de llegada

LinkedHashSet es el hermano de HashSet que **conserva el orden de inserción**. Elimina duplicados como el portero del punto 3, pero recuerda quién llegó primero, segundo, tercero...

```java
import java.util.LinkedHashSet;

public class EjemploLinkedHashSet {
    public static void main(String[] args) {
        LinkedHashSet<String> colaDeEntrada = new LinkedHashSet<>();
        colaDeEntrada.add("Ana");
        colaDeEntrada.add("Bob");
        colaDeEntrada.add("Ana");   // duplicado: no entra
        colaDeEntrada.add("Carla");
        System.out.println(colaDeEntrada); // [Ana, Bob, Carla] - orden de llegada
    }
}
```

Su uso estrella: **eliminar duplicados manteniendo el orden de primera aparición**. Un clásico de los ejercicios y de las entrevistas.

```java
import java.util.ArrayList;
import java.util.LinkedHashSet;

ArrayList<Integer> lista = new ArrayList<>(java.util.Arrays.asList(3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5));
LinkedHashSet<Integer> sinRepetidos = new LinkedHashSet<>(lista);
System.out.println(sinRepetidos); // [3, 1, 4, 5, 9, 2, 6] - sin duplicados y en orden de llegada
```

Construir un `LinkedHashSet` a partir de la lista elimina los repetidos; convertirlo de vuelta en `ArrayList` te devuelve la lista limpia. Dos líneas y el problema de los duplicados desaparece.

> 💡 **Consejo:** HashSet es el más rápido (O(1)), TreeSet ordena (O(log n)) y LinkedHashSet recuerda el orden (O(1) con un pelín más de memoria). Cada uno con su superpoder.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** ante "sin duplicados y ordenados" piensa en TreeSet. Ante "sin duplicados pero manteniendo el orden de llegada" piensa en LinkedHashSet. Ante "solo sin duplicados" piensa en HashSet.

**Ejercicio: ¿qué sale por pantalla?**

```java
import java.util.TreeSet;

public class BeTheTree {
    public static void main(String[] args) {
        TreeSet<Integer> notas = new TreeSet<>();
        notas.add(7);
        notas.add(3);
        notas.add(9);
        notas.add(7);   // duplicado: no entra
        notas.add(1);

        System.out.println(notas.first() + " " + notas.last());
        System.out.println(notas.size());
    }
}
```

**¿Qué imprime?**

- (A) 1 9 y 5
- (B) 3 9 y 4
- (C) 1 9 y 4
- (D) 1 7 y 4

<details>
<summary>🔄 Solución</summary>

La **C**. Los valores únicos son `{1, 3, 7, 9}`: 4 elementos (el 7 repetido no entra). Ordenados: primero el `1`, último el `9`. `first()` = 1, `last()` = 9, `size()` = 4.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué diferencia a `TreeSet` de `HashSet`?
2. ¿Puede un `TreeSet` contener un `null`? ¿Y un `HashSet`?
3. ¿Qué colección elimina duplicados **manteniendo el orden de inserción**?
4. ¿Qué devuelve `headSet("Bob")` en un TreeSet con `{"Ana", "Bob", "Zara"}`?

<details>
<summary>🔄 Respuestas</summary>

1. `TreeSet` mantiene los elementos ordenados automáticamente (árbol rojo-negro) a costa de ser más lento (O(log n) frente a O(1)).
2. `TreeSet` no: necesita comparar para ordenar y no puede comparar `null`. `HashSet` sí admite un único `null`.
3. `LinkedHashSet`: elimina duplicados como HashSet pero conserva el orden de llegada.
4. `[Ana]`: todo lo que va antes de "Bob" en el orden natural.

</details>

---

## ✅ Resumen en 3 frases

1. **TreeSet** ordena todo lo que metes automáticamente y ofrece extras (`first`, `last`, `headSet`, `subSet`), a cambio de ser más lento y no aceptar `null`.
2. **LinkedHashSet** conserva el orden de inserción y es la solución estrella para **eliminar duplicados manteniendo el orden de llegada**.
3. Ambos son `Set`: no admiten duplicados. La diferencia con HashSet está en el orden que guardan (ninguno, natural o de llegada).

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Árbol rojo-negro | Estructura interna de TreeSet que mantiene el orden |
> | Orden natural | El orden por defecto del tipo (numérico, alfabético) |
> | Orden de inserción | El orden en el que se añadieron los elementos |
> | `headSet(e)` / `tailSet(e)` | Elementos antes / después de `e` |
> | O(log n) | Coste logarítmico: rápido, pero más lento que O(1) |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/10-colecciones) · **Anterior:** [03 · HashSet: el portero sin duplicados](/ApuntesProgramacion/10-colecciones/03-hashset) · **Siguiente:** [05 · Iterator: el camarero que toma nota](/ApuntesProgramacion/10-colecciones/05-iterator)