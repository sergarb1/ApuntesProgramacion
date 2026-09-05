---
title: "06 — Comparación: cuándo usar cada ordenación"
description: La tabla de decisión definitiva para elegir algoritmo como un profesional ⚖️
---

<p><small>La tabla de decisión definitiva para elegir algoritmo como un profesional ⚖️</small></p>

> 🗺️ **Estás en:** ⚡ **U06 · Algorítmica II: Técnicas** → 06 · Comparación: cuándo usar cada ordenación

---

## 📬 La idea en una frase

> **No existe el "mejor algoritmo de ordenación": existe el mejor para tu caso concreto, y elegirlo bien es tan importante como saber implementarlo.**

Ya has visto Quicksort y Mergesort, y en la U05 sobreviviste a burbuja e inserción. Ahora toca la pregunta de examen, de entrevista y de la vida real: *¿cuál uso?* La respuesta siempre empieza igual: *depende*.

---

## 🧭 La tabla de decisión

| Situación | Elige |
|---|---|
| Array pequeño (< 50 elementos) | Da igual, usa `Arrays.sort()` |
| Array grande con datos al azar | **Quicksort** (irá genial en promedio) |
| Array grande, casi ordenado o con muchos duplicados | **Mergesort** o Quicksort con mediana de tres |
| Necesitas estabilidad (orden relativo) | **Mergesort** |
| La memoria es justa (sistema embebido, móvil) | **Quicksort** (O(log n) vs O(n)) |
| No te pagan por pensar | `Arrays.sort()` y a seguir con tu vida |
| El array es enorme y los datos están en disco | Mergesort externo (el de las bases de datos) |

> [!WARNING]
> Nunca, bajo ningún concepto, uses **Burbuja (Bubble Sort)** en producción. Es O(n²), lento, y tus compañeros te odiarán. Es como usar un caracol para repartir pizzas: existe, pero no debería.

---

## 🥊 El duelo de los titanes

| | Quicksort | Mergesort |
|---|---|---|
| Complejidad promedio | O(n log n) | O(n log n) |
| Peor caso | O(n²) (evitable con buen pivote) | O(n log n) siempre |
| Memoria extra | O(log n) | O(n) |
| Estable | No | Sí |
| Trabajo principal | En la **partición** | En la **fusión** |
| Ideal cuando | Velocidad y poca memoria | Estabilidad y garantías |

**En resumen:** Quicksort es el velocista con mal genio; Mergesort es el maratoniano fiable. Quicksort suele ganar en velocidad práctica con arrays grandes en memoria; Mergesort gana cuando no puedes permitirte un mal día.

---

## 🕵️ ¿Qué hace Java por dentro?

En Java, `Arrays.sort()` no es un algoritmo, son dos según el tipo:

- Para **tipos primitivos** (`int[]`, `double[]`...): usa **Dual-Pivot Quicksort**, una versión mejorada con dos pivotes que reduce el peor caso y acelera el promedio.
- Para **objetos** (`String[]`, `ArrayList`...): usa **TimSort**, una mezcla de Mergesort e Insertion Sort. Estable, y rapidísima con datos casi ordenados.

Por eso "usa `Arrays.sort()`" es casi siempre la respuesta correcta: Java ya eligió bien por ti.

---

## 📊 Rendimiento en la práctica

| Algoritmo | n=10 | n=100 | n=1.000 | n=10.000 | n=100.000 | n=1.000.000 |
|---|---|---|---|---|---|---|
| Quicksort | ~0 ms | ~0 ms | ~0 ms | ~1 ms | ~15 ms | ~120 ms |
| Mergesort | ~0 ms | ~0 ms | ~0 ms | ~2 ms | ~20 ms | ~150 ms |
| Burbuja (para llorar) | ~0 ms | ~1 ms | ~100 ms | ~10.000 ms | no esperes | no esperes |

Los tiempos son orientativos y dependen del hardware, pero la *tendencia* es la que importa: con 10.000 elementos, Quicksort y Mergesort siguen en "misilísegundos" mientras burbuja ya se ha ido a tomar un café. Con 100.000, burbuja ni se presenta.

---

## 🧠 La lógica que hay detrás

Recuerda la regla de oro de la complejidad: **O(n log n) casi siempre gana a O(n²)**, y la diferencia se nota brutalmente cuando `n` crece. Para un millón de elementos:

- O(n log n): ~20 millones de operaciones → un abrir y cerrar de ojos.
- O(n²): ~1 billón de operaciones → el ordenador pide la jubilación.

Así que la decisión no es "¿qué algoritmo?", sino "¿qué necesito garantizar?". Y eso, amigo mío, es pensamiento de ingeniero: elige la herramienta por el **contexto**, no por la costumbre.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué algoritmo elegirías para ordenar 10.000 ints al azar en un servidor con RAM de sobra?
2. ¿Y si necesitas estabilidad para una ordenación por dos criterios?
3. ¿Qué usa `Arrays.sort()` para primitivos? ¿Y para objetos?
4. ¿Cuánto le cuesta a burbuja ordenar un millón de elementos?

<details>
<summary>🔄 Respuestas</summary>

1. **Quicksort** (o `Arrays.sort()` directamente): datos al azar, grande, sin restricción de memoria.
2. **Mergesort** (o TimSort vía `Arrays.sort()` sobre objetos): necesita mantener el orden relativo.
3. **Dual-Pivot Quicksort** para primitivos y **TimSort** para objetos.
4. **O(n²)** → ~1 billón de operaciones. Que llame al seguro.

</details>

---

## ✅ Resumen en 3 frases

1. No hay un "mejor" algoritmo universal: la elección depende del **tamaño**, el **orden inicial**, la **memoria** y la **estabilidad** que necesites.
2. **Quicksort** gana en velocidad práctica y memoria; **Mergesort** gana en garantías y estabilidad.
3. En Java, `Arrays.sort()` ya elige bien por ti: **Dual-Pivot Quicksort** para primitivos y **TimSort** para objetos.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Dual-Pivot Quicksort | Quicksort con dos pivotes (Java, primitivos) |
> | TimSort | Mezcla de Mergesort e Insertion Sort (Java, objetos) |
> | Estabilidad | Conservar el orden de los elementos iguales |
> | Orden inicial | Cómo llegan los datos: al azar, ordenados, casi ordenados |
> | Mergesort externo | Ordenación de datos que no caben en RAM (bases de datos) |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/06-algoritmica-tecnicas) · **Anterior:** [05 · Mergesort](/ApuntesProgramacion/06-algoritmica-tecnicas/05-mergesort) · **Siguiente:** [07 · Be the Code: quicksort desde cero](/ApuntesProgramacion/06-algoritmica-tecnicas/07-be-the-code-quicksort)
