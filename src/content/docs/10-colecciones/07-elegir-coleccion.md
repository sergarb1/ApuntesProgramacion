---
title: "07 · Elegir la colección adecuada"
description: "ArrayList, LinkedList, HashSet, TreeSet o LinkedHashSet: las tres preguntas que deciden antes de escribir la primera línea ⚖️"
---

<p><small>ArrayList, LinkedList, HashSet, TreeSet o LinkedHashSet: las tres preguntas que deciden antes de escribir la primera línea ⚖️</small></p>

> 🗺️ **Estás en:** 📚 **U10 · Colecciones** → 07 · Elegir la colección adecuada

---

## 📬 La idea en una frase

> **Antes de escribir código, pregúntate tres cosas: ¿me importa el orden? ¿puede haber duplicados? ¿necesito velocidad? Con esas tres respuestas eliges la colección sin dudar.**

En los puntos 1 a 4 viste las colecciones por separado. Ahora toca la parte que separa al novato del que sabe: **elegir**. No hay una colección "mejor": hay una colección para cada problema. Este punto es tu brújula.

---

## 🧭 El árbol de decisiones

Tres preguntas y ya está:

```
¿Importa el orden?
├── No → ¿Duplicados?
│        ├── No → HashSet
│        └── Sí → ArrayList
└── Sí → ¿Qué orden?
         ├── Orden natural (ordenado) → ¿Duplicados?
         │        ├── No → TreeSet
         │        └── Sí → ArrayList + Collections.sort()
         └── Orden de llegada → ¿Duplicados?
                  ├── No → LinkedHashSet
                  └── Sí → ArrayList (o LinkedList)
```

¿Ves el patrón? Cuando el orden no importa, gana `HashSet` (sin duplicados) o `ArrayList` (con duplicados). Cuando sí importa, eliges entre `TreeSet` (orden natural), `LinkedHashSet` (orden de llegada) o listas.

---

## ⚖️ La comparativa definitiva

| Colección | Orden | Duplicados | Acceso/inserción | Lo que vale |
|---|---|---|---|---|
| `ArrayList` | Por índice | Permitidos | `get(i)` rapidísimo | Lista de todos los días |
| `LinkedList` | Por inserción | Permitidos | Rápida al principio/final | Colas, pilas |
| `HashSet` | Ninguno | No | O(1) | "¿Ya lo tengo?", eliminar duplicados |
| `TreeSet` | Orden natural | No | O(log n) | Elementos siempre ordenados |
| `LinkedHashSet` | De llegada | No | O(1) | Duplicados fuera, orden de llegada dentro |

**La regla de oro:** ¿sabes cuántos elementos necesitas y no va a cambiar? → array (U04). ¿Lista que crece y acceso por índice? → ArrayList. ¿Cola o pilas? → LinkedList. ¿Sin duplicados y no te importa el orden? → HashSet. ¿Sin duplicados y ordenados? → TreeSet. ¿Sin duplicados pero manteniendo el orden de llegada? → LinkedHashSet.

---

## 🐢 La tabla de costes

Cuando el rendimiento importa, esta tabla te salva:

| Operación | ArrayList | LinkedList | HashSet | TreeSet |
|---|---|---|---|---|
| `get(i)` | **O(1)** | O(n) | — | — |
| `add` al final | O(1)* | **O(1)** | O(1) | O(log n) |
| `add` al principio | O(n) | **O(1)** | — | — |
| `contains(e)` | O(n) | O(n) | **O(1)** | O(log n) |
| `remove` por valor | O(n) | O(n) | **O(1)** | O(log n) |

> 💡 **Consejo:** el `*` de `ArrayList` significa "casi O(1)": a veces se llena y tiene que copiarse entero a un array más grande. Por eso es muy rápido, pero no instantáneo al 100%.

---

## 🥊 EL RING: ArrayList vs LinkedList

Dos veteranos discuten junto a la máquina de café.

**ArrayList:** — Yo voy directo al índice. `get(5000)` y ya está. Tú tienes que saltar de eslabón en eslabón 5.000 veces.

**LinkedList:** — Cierto, pero yo añado y borro al principio sin mover a nadie. Tú, cuando quitas el primero, desplazas 10.000 elementos una posición.

**ArrayList:** — Sí, pero para recorrer soy un lujo: un array contiguo, el CPU lo devora.

**LinkedList:** — Y para colas y pilas soy el rey: `addLast` + `removeFirst` y listo. ¿Tú cómo harías una cola?

**ArrayList:** — Vale, para colas y pilas eres tú. Para el resto, yo. ¿Tregua?

**LinkedList:** — Tregua. Cada uno en su trinchera.

> La lección: **¿acceso aleatorio frecuente? → ArrayList. ¿Añadir/borrar en los extremos o simular cola/pila? → LinkedList.** El resto del tiempo, la lista de todos los días.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** la respuesta correcta a "¿cuál es la mejor colección?" es siempre "depende". En una entrevista, esa respuesta con argumentos vale oro.

**Ejercicio: ¿qué colección usarías?**

Para cada escenario, elige la colección y justifícala en una línea:

1. La lista de notas de tu clase, que vas a recorrer muchas veces por índice.
2. Una cola de personas esperando para entrar a una sala.
3. Los DNI de los alumnos matriculados, sin repetir y en orden alfabético.
4. El historial de visitas de una web, sin repetir y en orden de llegada.
5. Saber si un número de lotería ya ha salido, con 100.000 números.

<details>
<summary>🔄 Soluciones</summary>

1. **ArrayList** — acceso por índice O(1) y duplicados permitidos (dos alumnos pueden tener la misma nota).
2. **LinkedList** — FIFO con `addLast` y `removeFirst`.
3. **TreeSet** — sin duplicados y orden natural (alfabético) automático.
4. **LinkedHashSet** — sin duplicados pero conservando el orden de llegada.
5. **HashSet** — `contains` en O(1) para la pregunta "¿ya lo tengo?".

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué colección para eliminar duplicados manteniendo el orden de llegada?
2. ¿Qué colección para una cola FIFO?
3. ¿Qué colección da los elementos siempre ordenados y sin duplicados?
4. ¿Cuál es la pregunta más importante antes de elegir colección?

<details>
<summary>🔄 Respuestas</summary>

1. `LinkedHashSet`.
2. `LinkedList`, con `addLast` y `removeFirst`.
3. `TreeSet`.
4. "¿Me importa el orden?" — de ahí salen todas las demás (duplicados y velocidad).

</details>

---

## ✅ Resumen en 3 frases

1. **No hay colección mejor: hay colección adecuada.** Las tres preguntas (orden, duplicados, velocidad) lo deciden todo.
2. **Listas** para orden + duplicados, **Sets** para sin duplicados, **LinkedList** para colas y pilas.
3. En una entrevista, "¿cuál es la mejor colección?" se responde siempre con argumentos, no con un nombre.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Orden natural | El orden por defecto del tipo (numérico, alfabético) |
> | Orden de llegada | El orden de inserción |
> | O(1) | Instantáneo (constante) |
> | O(n) | Lineal: depende del tamaño |
> | O(log n) | Logarítmico: rápido aunque crezca la colección |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/10-colecciones) · **Anterior:** [06 · La clase Collections: la navaja suiza](/ApuntesProgramacion/10-colecciones/06-collections) · **Siguiente:** [08 · Be the Code: colecciones en acción](/ApuntesProgramacion/10-colecciones/08-be-the-code)