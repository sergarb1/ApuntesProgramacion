---
title: "06 · La clase Collections: la navaja suiza"
description: "Métodos estáticos que hacen en una línea lo que tú tardarías en diez: sort, reverse, shuffle, max, min y compañía 🧰"
---

<p><small>Métodos estáticos que hacen en una línea lo que tú tardarías en diez: sort, reverse, shuffle, max, min y compañía 🧰</small></p>

> 🗺️ **Estás en:** 📚 **U10 · Colecciones** → 06 · La clase Collections: la navaja suiza

---

## 📬 La idea en una frase

> **`Collections` es la navaja suiza de las colecciones: métodos estáticos (`sort`, `reverse`, `shuffle`, `max`, `min`, `frequency`...) que hacen en una línea lo que tú tardarías en diez.**

En el punto 5 viste cómo recorrer colecciones sin morir en el intento. Ahora toca manipularlas sin escribir un solo bucle a mano. Igual que `Arrays` era la navaja suiza de los arrays (lo viste en la U04), `Collections` lo es de las colecciones. Métodos estáticos (de la U08) que hacen en una línea lo que tú tardarías en 10.

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

---

## ⚠️ Los métodos que modifican tu lista

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

1. ¿`Collections.sort()` modifica la lista original?
2. ¿Qué método de `Collections` devuelve el elemento mayor según el orden natural?
3. ¿Qué método mezcla una lista al azar?
4. ¿Cómo cuentas cuántas veces aparece un elemento en una lista con `Collections`?

<details>
<summary>🔄 Respuestas</summary>

1. Sí. Modifica la lista en el sitio. Si quieres conservar la tuya, cópiala primero con `new ArrayList<>(lista)`.
2. `Collections.max(lista)`. Devuelve el mayor según el orden natural del tipo.
3. `Collections.shuffle(lista)`.
4. `Collections.frequency(lista, e)`.

</details>

---

## ✅ Resumen en 3 frases

1. **Collections** es la navaja suiza estática: `sort`, `reverse`, `shuffle`, `max`, `min`, `frequency`...
2. La mayoría de sus métodos **modifican la lista original**: cópiate antes si la necesitas intacta.
3. Es la hermana de la clase `Arrays` (vista en la U04), pero aplicada a colecciones: misma idea, otros parámetros.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Clase utilitaria | Clase de métodos estáticos que no se instancia |
> | Modificar en el sitio | Cambiar la propia colección (no una copia) |
> | Orden natural | El orden por defecto del tipo (numérico, alfabético) |
> | `shuffle` | Mezclar al azar |
> | `frequency` | Contar apariciones |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/10-colecciones) · **Anterior:** [05 · Iterator: el camarero que toma nota](/ApuntesProgramacion/10-colecciones/05-iterator) · **Siguiente:** [07 · Elegir la colección adecuada](/ApuntesProgramacion/10-colecciones/07-elegir-coleccion)