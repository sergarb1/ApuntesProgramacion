---
title: "05 — Mergesort: el fiable"
description: "El algoritmo que siempre cumple lo que promete: O(n log n) pase lo que pase 🤝"
---

<p><small>El algoritmo que siempre cumple lo que promete: O(n log n) pase lo que pase 🤝</small></p>

> 🗺️ **Estás en:** ⚡ **U06 · Algorítmica II: Técnicas** → 05 · Mergesort

---

## 📬 La idea en una frase

> **Mergesort divide el array por la mitad, ordena cada mitad recursivamente y luego fusiona las dos mitades ordenadas en una sola: el "divide y vencerás" sin trampas.**

Creado por **John von Neumann** en 1945. Sí, el mismo de la arquitectura de ordenadores. El tío no paraba.

---

## 🎯 Cómo funciona

1. **Dividir** el array en dos mitades (por la mitad exactamente; no hay que elegir pivote).
2. **Ordenar** cada mitad recursivamente.
3. **Fusionar** (merge) las dos mitades ordenadas en un único array ordenado.

```
[7, 3, 9, 1, 8, 2, 6, 4]
         │
    ┌────┴────┐
 [7, 3, 9, 1] [8, 2, 6, 4]
    │            │
 ┌──┴──┐      ┌──┴──┐
[7, 3] [9, 1] [8, 2] [6, 4]
  │      │      │      │
┌─┴─┐  ┌─┴─┐  ┌─┴─┐  ┌─┴─┐
[7] [3] [9] [1] [8] [2] [6] [4]   ← caso base
  │      │      │      │
└─┬─┘  └─┬─┘  └─┬─┘  └─┬─┘
[3, 7] [1, 9] [2, 8] [4, 6]       ← fusionar
    │            │
 ┌──┴──┐      ┌──┴──┐
[1, 3, 7, 9] [2, 4, 6, 8]          ← fusionar
    │            │
 ┌──┴────────────┘
[1, 2, 3, 4, 6, 7, 8, 9]          ← fusionar
```

---

## 🛠️ Implementación

```java
public class Mergesort {

    static void ms(int[] arr, int izq, int der) {
        if (izq >= der) return;  // caso base

        int mid = (izq + der) / 2;
        ms(arr, izq, mid);                   // ordenar mitad izquierda
        ms(arr, mid + 1, der);               // ordenar mitad derecha
        fusionar(arr, izq, mid, der);         // combinar las dos mitades
    }

    static void fusionar(int[] arr, int izq, int mid, int der) {
        int[] tmp = new int[der - izq + 1];
        int i = izq, j = mid + 1, k = 0;

        // comparar elementos de las dos mitades
        while (i <= mid && j <= der)
            tmp[k++] = (arr[i] <= arr[j]) ? arr[i++] : arr[j++];

        // copiar lo que quede de la mitad izquierda
        while (i <= mid) tmp[k++] = arr[i++];

        // copiar lo que quede de la mitad derecha
        while (j <= der) tmp[k++] = arr[j++];

        // copiar el array temporal al original
        System.arraycopy(tmp, 0, arr, izq, tmp.length);
    }

    public static void main(String[] args) {
        int[] datos = {9, 3, 7, 1, 8, 2, 6, 4, 5};
        ms(datos, 0, datos.length - 1);
        System.out.println(java.util.Arrays.toString(datos));
    }
}
```

> [!TIP]
> La **fusión** es la parte interesante. Imagina dos pilas de cartas ya ordenadas: comparas las cartas superiores y te llevas la menor, una y otra vez. Como dos colas de supermercado que se unen en una caja y siempre pasa el que llega primero de cada cola.

---

## 📊 Complejidad

- **Siempre**: O(n log n). No importa cómo esté el array. Mergesort no tiene caso malo.
- **Memoria**: O(n) extra por el array temporal `tmp`. Ese es su punto débil.

La estructura es la típica de divide y vencerás: hay `log n` niveles de división, y en cada nivel se hace un trabajo total de `O(n)` (fusionar todos los fragmentos de ese nivel). Resultado: `n · log n`.

---

## ✅ ¿Es estable?

**Sí.** Cuando dos elementos son iguales, el de la izquierda va primero en la fusión (fíjate en el `<=` de la condición). Esto mantiene el orden original de los elementos iguales, algo que Quicksort no puede garantizar.

> [!NOTE]
> La estabilidad no es un concepto teórico aburrido. Es importante cuando ordenas por múltiples criterios. Por ejemplo, si ordenas una lista de alumnos por nota y luego por nombre, quieres que los que tienen la misma nota mantengan el orden alfabético. Mergesort te lo da. Quicksort te hace llorar.

---

## 🏆 Cuándo brilla Mergesort

- Cuando necesitas **estabilidad** a toda costa.
- Cuando el array está **casi ordenado** o lleno de duplicados (no le afecta).
- Cuando los datos no caben en memoria: el **mergesort externo** (fusionando trozos en disco) es la base de la ordenación de las bases de datos.

Y su punto débil: si la memoria es justa (sistemas embebidos, móviles con poca RAM), el array temporal de O(n) puede doler.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Cuál es el caso malo de Mergesort?
2. ¿Cuál es su punto débil frente a Quicksort?
3. ¿Por qué es estable?
4. ¿En qué se diferencia su "división" de la de Quicksort?

<details>
<summary>🔄 Respuestas</summary>

1. **No tiene**: siempre es O(n log n), pase lo que pase el array.
2. La **memoria extra** de O(n) por el array temporal `tmp`.
3. Porque en la fusión, cuando dos elementos son iguales, se copia primero el de la mitad izquierda (el `<=`).
4. Quicksort parte alrededor de un **pivote**; Mergesort corta **por la mitad exacta**, sin elegir pivote.

</details>

---

## ✅ Resumen en 3 frases

1. Mergesort **divide por la mitad**, ordena cada mitad y **fusiona** las mitades ordenadas.
2. Es **siempre O(n log n)** y **estable**, a cambio de O(n) de memoria extra.
3. Es la opción fiable cuando importa la estabilidad o el orden inicial es problemático.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Fusión (merge) | Combinar dos mitades ordenadas en una |
> | Estable | Conserva el orden original de los elementos iguales |
> | Divide y vencerás | El patrón de dividir, conquistar y combinar |
> | Memoria O(n) | Necesita un array auxiliar del mismo tamaño |
> | Mergesort externo | Variante que ordena datos que no caben en RAM (discos) |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/06-algoritmica-tecnicas) · **Anterior:** [04 · Quicksort](/ApuntesProgramacion/06-algoritmica-tecnicas/04-quicksort) · **Siguiente:** [06 · Comparación: cuándo usar cada ordenación](/ApuntesProgramacion/06-algoritmica-tecnicas/06-comparacion-ordenacion)
