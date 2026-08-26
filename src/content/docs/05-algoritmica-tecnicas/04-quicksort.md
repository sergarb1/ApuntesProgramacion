---
title: "04 — Quicksort: el rápido"
description: El algoritmo de ordenación más famoso del mundo, con su partición, su pivote y sus manías 🚀
---

<p><small>El algoritmo de ordenación más famoso del mundo, con su partición, su pivote y sus manías 🚀</small></p>

> 🗺️ **Estás en:** ⚡ **U05 · Algorítmica II: Técnicas** → 04 · Quicksort

---

## 📬 La idea en una frase

> **Quicksort elige un pivote, parte el array en menores y mayores a su alrededor, y repite recursivamente en cada mitad: divide y vencerás en estado puro.**

Creado por **Tony Hoare** en 1959. Sí, tiene más años que tus padres. Y sigue siendo el algoritmo de ordenación más usado del mundo. Por algo será.

---

## 🎯 Cómo funciona

1. Elegimos un **pivote** (un elemento del array).
2. Colocamos todos los elementos **menores** que el pivote a su izquierda y los **mayores** a su derecha. Esto se llama **particionar**.
3. Aplicamos el mismo proceso recursivamente a las dos zonas (izquierda y derecha del pivote).

Cuando el array tiene 0 o 1 elementos... ya está ordenado. Caso base.

---

## 🛠️ Implementación

```java
public class Quicksort {

    static void qs(int[] arr, int izq, int der) {
        if (izq >= der) return;   // caso base: 0 o 1 elementos

        int pivote = arr[(izq + der) / 2];  // elegimos el del medio
        int i = izq, j = der;

        // partición
        while (i <= j) {
            while (arr[i] < pivote) i++;
            while (arr[j] > pivote) j--;
            if (i <= j) {
                int tmp = arr[i];
                arr[i] = arr[j];
                arr[j] = tmp;
                i++;
                j--;
            }
        }

        // llamadas recursivas a cada zona
        qs(arr, izq, j);
        qs(arr, i, der);
    }

    public static void main(String[] args) {
        int[] datos = {9, 3, 7, 1, 8, 2, 6, 4, 5};
        qs(datos, 0, datos.length - 1);
        System.out.println(java.util.Arrays.toString(datos));
    }
}
```

**Ejecución paso a paso** con `{3, 1, 4, 1, 5, 9, 2, 6}`:

```
Array inicial:  [3, 1, 4, 1, 5, 9, 2, 6]
Pivote = 5 (posición media)
Posiciones i=0, j=7

1. i avanza hasta encontrar 9 (>=5), j retrocede hasta encontrar 2 (<=5)
2. Intercambiamos 9 y 2 → [3, 1, 4, 1, 5, 2, 9, 6]
3. i=5, j=4 → i > j, terminamos la partición
4. Llamada recursiva izquierda: [3, 1, 4, 1, 5, 2]
5. Llamada recursiva derecha: [9, 6]
...
```

> [!TIP]
> El secreto de Quicksort está en la **partición**. Si consigues que los elementos se repartan más o menos equilibradamente, el algoritmo vuela. Si no... prepara los O(n²).

---

## 🎚️ Elección del pivote

| Estrategia | Ventaja | Desventaja |
|---|---|---|
| Primer elemento | Simple | Pésimo si el array ya está ordenado |
| Último elemento | Simple | Pésimo si el array ya está ordenado |
| Elemento central | Mejor equilibrio | Sigue teniendo casos malos |
| Mediana de tres (primero, medio, último) | Muy robusto | Un poco más de cálculo |
| Aleatorio | Evita el caso peor en la práctica | Aleatoriedad no determinista |

> [!WARNING]
> Si eliges siempre el primer elemento como pivote y el array ya está ordenado, Quicksort se vuelve más lento que una tortuga con resaca: **O(n²)**, literalmente peor que un `for` anidado cutre. Por eso en producción nadie usa "primer elemento" a secas.

---

## 📊 Complejidad

- **Caso promedio**: O(n log n) — casi siempre.
- **Mejor caso**: O(n log n) — cuando el pivote divide siempre en mitades iguales.
- **Peor caso**: O(n²) — cuando el pivote es siempre el menor o el mayor (array ya ordenado con mal pivote).
- **Memoria**: O(log n) extra (por el stack de las llamadas recursivas). No necesita arrays auxiliares: ordena *in-place*.

---

## 🚫 ¿Es estable?

**No.** Durante la partición, dos elementos iguales pueden intercambiarse de posición. Si necesitas estabilidad (conservar el orden original de los elementos iguales), mejor usa Mergesort.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Cuáles son las tres partes de Quicksort?
2. ¿Cuál es el peor caso de Quicksort y cuándo ocurre?
3. ¿Qué estrategia de pivote hace que el peor caso "casi nunca" ocurra en la práctica?
4. ¿Es Quicksort estable?

<details>
<summary>🔄 Respuestas</summary>

1. Elegir **pivote**, **particionar** (menores a un lado, mayores al otro) y **llamar recursivamente** a cada zona.
2. **O(n²)**, cuando el pivote es siempre el menor o el mayor de su zona (típico con array ordenado y pivote = primer elemento).
3. La **mediana de tres** o el **pivote aleatorio**: reparten el array de forma equilibrada y evitan los casos malos en la práctica.
4. **No**. En la partición, elementos iguales pueden cambiar su orden relativo.

</details>

---

## ✅ Resumen en 3 frases

1. Quicksort **particiona** alrededor de un pivote y repite recursivamente en cada zona: divide y vencerás.
2. Su **caso promedio** es O(n log n) y su **peor caso** O(n²), que se evita con una buena elección de pivote.
3. Es **in-place** (memoria O(log n)) y **no estable**; el trabajo importante ocurre en la partición.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Pivote | El elemento que divide el array en menores y mayores |
> | Partición | Repartir elementos alrededor del pivote |
> | In-place | Ordenar sin arrays auxiliares, moviendo el propio array |
> | Estable | Que conserva el orden original de los elementos iguales |
> | O(n log n) | Complejidad "casi lineal": el estándar de la ordenación moderna |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/05-algoritmica-tecnicas) · **Anterior:** [03 · Divide y vencerás](/ApuntesProgramacion/05-algoritmica-tecnicas/03-divide-y-venceras) · **Siguiente:** [05 · Mergesort](/ApuntesProgramacion/05-algoritmica-tecnicas/05-mergesort)
