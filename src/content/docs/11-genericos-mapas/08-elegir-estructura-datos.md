---
title: "08 · Map vs List vs Set: elige tu estructura"
description: "Las tres familias del paquete java.util y las preguntas que deciden antes de escribir código ⚖️"
---

<p><small>Las tres familias del paquete java.util y las preguntas que deciden antes de escribir código ⚖️</small></p>

> 🗺️ **Estás en:** 🗺️ **U11 · Genéricos y Mapas** → 08 · Map vs List vs Set: elige tu estructura

---

## 📬 La idea en una frase

> **Antes de escribir código, pregúntate: ¿necesito asociar clave-valor? ¿me importa el orden? ¿puede haber duplicados? Con esas respuestas eliges Map, List o Set sin dudar.**

En la U10 dominaste las listas y los conjuntos. En los puntos 6 y 7, los mapas. Ahora toca el cierre de las tres familias: saber cuál usar en cada situación. No hay estructura "mejor": hay una estructura para cada problema. Este punto es tu brújula definitiva.

---

## ⚖️ La comparativa definitiva

| Característica | List | Set | Map |
|---|---|---|---|
| ¿Qué guarda? | Elementos ordenados por posición | Elementos únicos | Pares clave → valor |
| ¿Duplicados? | Sí | No | Claves no, valores sí |
| ¿Orden? | De inserción | Depende (Hash/Tree) | Depende (Hash/Tree) |
| Acceso | Por índice | Por elemento | Por clave |
| ¿Nulls? | Sí | HashSet: 1, TreeSet: 0 | HashMap: 1 clave, TreeMap: 0 |
| Implementación principal | `ArrayList` | `HashSet` | `HashMap` |

**La gran diferencia:** List y Set guardan elementos sueltos; Map guarda parejas. Si tu dato necesita una "clave" para buscarlo después (un DNI, un nombre, una palabra), es un Map. Si solo necesitas una colección de cosas, es List o Set.

---

## 🧭 El árbol de decisiones

```
¿Tienes parejas clave → valor?
├── Sí → ¿Necesitas orden por clave?
│        ├── Sí → TreeMap
│        └── No → ¿Orden de llegada?
│                 ├── Sí → LinkedHashMap
│                 └── No → HashMap
└── No → ¿Me importa el orden?
         ├── No → ¿Duplicados?
         │        ├── No → HashSet
         │        └── Sí → ArrayList
         └── Sí → ¿Qué orden?
                  ├── Natural → ¿Duplicados?
                  │        ├── No → TreeSet
                  │        └── Sí → ArrayList + sort
                  └── De llegada → ¿Duplicados?
                           ├── No → LinkedHashSet
                           └── Sí → ArrayList
```

¿Ves el patrón? La primera pregunta es la nueva de esta unidad: **¿necesitas asociar?** Si la respuesta es sí, entras en el mundo de los mapas y solo decides entre orden natural, orden de llegada o velocidad pura. Si es no, vuelves a la lógica de la U10.

---

## 💡 La regla práctica

- ¿Una lista de cosas que recorres por posición? → `ArrayList`
- ¿Cosas sin repetir y no te importa el orden? → `HashSet`
- ¿Cosas sin repetir y siempre ordenadas? → `TreeSet`
- ¿Asociar una cosa con otra y buscar por clave? → `HashMap`
- ¿Claves ordenadas o navegación (`firstKey`, `headMap`)? → `TreeMap`
- ¿Velocidad pero respetando el orden de llegada? → `LinkedHashMap`

**La regla de oro:** ¿el dato se busca solo por su contenido? → Set. ¿Por una posición? → List. ¿Por una clave distinta de él mismo? → Map. Esa última frase separa al que memoriza de quien entiende.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** la respuesta correcta a "¿cuál es la mejor estructura?" es siempre "depende". En una entrevista, esa respuesta con argumentos vale oro.

**Ejercicio: ¿qué estructura usarías?**

Para cada escenario, elige la estructura y justifícala en una línea:

1. Asociar cada alumno (por su nombre) con su nota de examen.
2. Las notas de la clase, para recorrerlas muchas veces por posición.
3. Los DNI de los matriculados, sin repetir y en orden alfabético.
4. Saber si una palabra ya ha salido en un sorteo, con 100.000 palabras.
5. El número de veces que aparece cada letra en un texto, mostradas en orden alfabético.

<details>
<summary>🔄 Soluciones</summary>

1. **`HashMap<String, Integer>`** — clave = nombre, valor = nota. Búsqueda directa por alumno.
2. **`ArrayList<Integer>`** — acceso por índice O(1) y duplicados permitidos.
3. **`TreeSet<String>`** — sin duplicados y orden natural automático.
4. **`HashSet<String>`** — `contains` en O(1) para la pregunta "¿ya salió?".
5. **`TreeMap<Character, Integer>`** — frecuencia por letra con las claves ordenadas solo.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué guarda un Map que no guardan ni List ni Set?
2. ¿Qué estructura para claves ordenadas con navegación?
3. ¿Puede un Map tener valores duplicados?
4. ¿Cuál es la primera pregunta del árbol de decisiones?

<details>
<summary>🔄 Respuestas</summary>

1. Parejas clave → valor; las claves son únicas.
2. `TreeMap` (orden natural) o `LinkedHashMap` (orden de llegada).
3. Sí: las claves son únicas, pero los valores pueden repetirse.
4. "¿Tienes parejas clave → valor?" — si la respuesta es sí, es un Map.

</details>

---

## ✅ Resumen en 3 frases

1. **List** guarda elementos por posición (duplicados sí), **Set** guarda únicos (orden según la implementación) y **Map** asocia claves únicas con valores.
2. La primera pregunta es **"¿necesitas asociar clave → valor?"**: si es sí, es un Map; si es no, List o Set.
3. En una entrevista, "¿cuál es la mejor estructura?" se responde siempre con argumentos, no con un nombre.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `List` | Colección ordenada por posición, con duplicados |
> | `Set` | Colección sin duplicados |
> | `Map` | Asociación clave → valor |
> | Clave única | Lo que hace que un Map sea un Map |
> | O(1) / O(log n) | Instantáneo / logarítmico (rápido aunque crezca) |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/11-genericos-mapas) · **Anterior:** [07 · TreeMap, LinkedHashMap y otros mapas](/ApuntesProgramacion/11-genericos-mapas/07-treemap-otros-mapas) · **Siguiente:** [09 · Repaso interactivo](/ApuntesProgramacion/11-genericos-mapas/09-repaso-interactivo)