---
title: "03 · HashSet, TreeSet y LinkedHashSet: los conjuntos"
description: "El portero sin duplicados, el que ordena solo y el que recuerda el orden de llegada: la familia Set al completo 🚫🧭"
---

<p><small>El portero sin duplicados, el que ordena solo y el que recuerda el orden de llegada: la familia Set al completo 🚫🧭</small></p>

> 🗺️ **Estás en:** 📚 **U11 · Colecciones, genéricos y mapas** → 03 · HashSet, TreeSet y LinkedHashSet

---

## 📬 La idea en una frase

> **HashSet es una discoteca que no deja entrar a nadie repetido; TreeSet es el mismo portero pero con brújula (ordena solo); y LinkedHashSet tiene memoria del orden de llegada.**

En el punto 2 conociste las listas: orden y duplicados bienvenidos. Ahora cambia el baile: hay problemas donde los repetidos sobran. Ahí entra la familia `Set`, con tres hermanos que comparten la manía de no admitir duplicados pero se diferencian en el orden.

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

### Un HashSet no tiene orden

**HashSet no garantiza ningún orden**. Si metes `{"rojo", "verde", "azul"}`, al imprimir puede salir `[azul, rojo, verde]` o cualquier otra combinación. No te fíes del orden, fíate de `size()` y `contains()`.

```java
HashSet<String> colores = new HashSet<>();
colores.add("rojo");
colores.add("verde");
colores.add("azul");
System.out.println(colores); // ¿[rojo, verde, azul]? Quizá, quizá no...
```

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

LinkedHashSet es el hermano de HashSet que **conserva el orden de inserción**. Elimina duplicados como el portero de antes, pero recuerda quién llegó primero, segundo, tercero...

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

1. ¿Cuántos elementos hay en un `HashSet` tras añadir `a, b, a, c, b`?
2. ¿Qué diferencia a `TreeSet` de `HashSet`?
3. ¿Puede un `TreeSet` contener un `null`? ¿Y un `HashSet`?
4. ¿Qué colección elimina duplicados **manteniendo el orden de inserción**?
5. ¿Qué devuelve `headSet("Bob")` en un TreeSet con `{"Ana", "Bob", "Zara"}`?

<details>
<summary>🔄 Respuestas</summary>

1. 3 (`a`, `b`, `c`). Los duplicados no entran.
2. `TreeSet` mantiene los elementos ordenados automáticamente (árbol rojo-negro) a costa de ser más lento (O(log n) frente a O(1)).
3. `TreeSet` no: necesita comparar para ordenar y no puede comparar `null`. `HashSet` sí admite un único `null`.
4. `LinkedHashSet`: elimina duplicados como HashSet pero conserva el orden de llegada.
5. `[Ana]`: todo lo que va antes de "Bob" en el orden natural.

</details>

---

## ✅ Resumen en 3 frases

1. **HashSet** es el portero sin duplicados: no admite repetidos, no ordena nada y es **O(1)** gracias a `hashCode()` y `equals()`.
2. **TreeSet** ordena todo lo que metes automáticamente y ofrece extras (`first`, `last`, `headSet`, `subSet`), a cambio de ser más lento y no aceptar `null`.
3. **LinkedHashSet** conserva el orden de inserción y es la solución estrella para **eliminar duplicados manteniendo el orden de llegada**.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `Set` | Colección sin duplicados |
> | `hashCode()` | "Número de cajón" que usa HashSet para encontrar elementos |
> | Árbol rojo-negro | Estructura interna de TreeSet que mantiene el orden |
> | Orden natural | El orden por defecto del tipo (numérico, alfabético) |
> | Orden de inserción | El orden en el que se añadieron los elementos |
> | O(1) / O(log n) | Instantáneo / logarítmico (rápido aunque crezca) |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/11-colecciones) · **Anterior:** [02 · LinkedList: la conga line](/ApuntesProgramacion/11-colecciones/02-linkedlist) · **Siguiente:** [04 · Iterator y Collections](/ApuntesProgramacion/11-colecciones/04-iterator-collections)
