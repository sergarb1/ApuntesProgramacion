---
title: "07 — Be the Code: quicksort desde cero"
description: Cierra la página, abre el editor y escribe Quicksort y Mergesort tú solo (o sufre con honor) 🕶️
---

<p><small>Cierra la página, abre el editor y escribe Quicksort y Mergesort tú solo (o sufre con honor) 🕶️</small></p>

> 🗺️ **Estás en:** ⚡ **U06 · Algorítmica II: Técnicas** → 07 · Be the Code: quicksort desde cero

---

## 📬 La idea en una frase

> **Ya has visto el código: ahora toca borrarlo de la memoria y escribirlo tú solo, paso a paso, porque un algoritmo solo se entiende de verdad cuando te duele implementarlo.**

> 🕶️ **Don Tip:** Divide y vencerás: elige un pivote, parte el array en menores y mayores, y repite recursivamente. Si dominas ese patrón, Quicksort es tuyo.

---

## 🚦 Ejercicio guiado 1: Quicksort

Cierra esta página. Abre un editor de texto en blanco. No mires ni una línea de lo leído hasta ahora.

La firma del método debe ser:

```java
static void quicksort(int[] arr, int inicio, int fin)
```

### Paso 1: el caso base

¿Cuándo un array (o una zona del array) ya está ordenado? Cuando tiene **0 o 1 elementos**. En términos de índices:

```java
if (inicio >= fin) return;
```

### Paso 2: elegir el pivote

Elige un elemento cualquiera. El del medio es una opción decente y fácil de escribir:

```java
int pivote = arr[(inicio + fin) / 2];
```

### Paso 3: particionar con dos punteros

Dos índices parten de los extremos y avanzan hacia el centro:

- `i` avanza desde `inicio` mientras `arr[i] < pivote` (busca un elemento que *debería* estar a la derecha).
- `j` retrocede desde `fin` mientras `arr[j] > pivote` (busca un elemento que *debería* estar a la izquierda).
- Si `i <= j`, intercambias y sigues.

### Paso 4: llamar recursivamente a cada zona

Cuando `i` y `j` se cruzan, la zona izquierda es `[inicio..j]` y la derecha `[i..fin]`:

```java
quicksort(arr, inicio, j);
quicksort(arr, i, fin);
```

### La solución completa (inténtalo antes de mirar)

<details>
<summary>🔄 Solución de Quicksort</summary>

```java
public class Quicksort {

    static void quicksort(int[] arr, int inicio, int fin) {
        if (inicio >= fin) return;   // caso base

        int pivote = arr[(inicio + fin) / 2];
        int i = inicio, j = fin;

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

        quicksort(arr, inicio, j);
        quicksort(arr, i, fin);
    }

    public static void main(String[] args) {
        int[] datos = {9, 3, 7, 1, 8, 2, 6, 4, 5};
        quicksort(datos, 0, datos.length - 1);
        System.out.println(java.util.Arrays.toString(datos));
    }
}
```

**Salida:** `[1, 2, 3, 4, 5, 6, 7, 8, 9]`

</details>

---

## 🚦 Ejercicio guiado 2: Mergesort

Mismo juego, misma regla: sin mirar. La firma:

```java
static void mergesort(int[] arr, int inicio, int fin)
```

### Paso 1: el caso base

Igual que Quicksort: zona con 0 o 1 elementos, ya ordenada.

### Paso 2: partir por la mitad

```java
int mid = (inicio + fin) / 2;
```

### Paso 3: ordenar cada mitad y fusionar

```java
mergesort(arr, inicio, mid);
mergesort(arr, mid + 1, fin);
fusionar(arr, inicio, mid, fin);   // este método lo escribes en el paso 4
```

### Paso 4: la fusión, el corazón de Mergesort

Dos mitades ordenadas se combinan con un array temporal:

```java
static void fusionar(int[] arr, int inicio, int mid, int fin) {
    int[] tmp = new int[fin - inicio + 1];
    int i = inicio, j = mid + 1, k = 0;

    while (i <= mid && j <= fin)
        tmp[k++] = (arr[i] <= arr[j]) ? arr[i++] : arr[j++];
    while (i <= mid) tmp[k++] = arr[i++];
    while (j <= fin) tmp[k++] = arr[j++];

    System.arraycopy(tmp, 0, arr, inicio, tmp.length);
}
```

### La solución completa (inténtalo antes de mirar)

<details>
<summary>🔄 Solución de Mergesort</summary>

```java
public class Mergesort {

    static void mergesort(int[] arr, int inicio, int fin) {
        if (inicio >= fin) return;

        int mid = (inicio + fin) / 2;
        mergesort(arr, inicio, mid);
        mergesort(arr, mid + 1, fin);
        fusionar(arr, inicio, mid, fin);
    }

    static void fusionar(int[] arr, int inicio, int mid, int fin) {
        int[] tmp = new int[fin - inicio + 1];
        int i = inicio, j = mid + 1, k = 0;

        while (i <= mid && j <= fin)
            tmp[k++] = (arr[i] <= arr[j]) ? arr[i++] : arr[j++];
        while (i <= mid) tmp[k++] = arr[i++];
        while (j <= fin) tmp[k++] = arr[j++];

        System.arraycopy(tmp, 0, arr, inicio, tmp.length);
    }

    public static void main(String[] args) {
        int[] datos = {9, 3, 7, 1, 8, 2, 6, 4, 5};
        mergesort(datos, 0, datos.length - 1);
        System.out.println(java.util.Arrays.toString(datos));
    }
}
```

**Salida:** `[1, 2, 3, 4, 5, 6, 7, 8, 9]`

</details>

---

## ⭐ Niveles de logro

- ⭐ **Lo tienes, pero has tenido que mirar el código una vez.** Aprobado raspado.
- ⭐⭐ **Te ha salido a la primera y funciona.** Eres una máquina.
- ⭐⭐⭐ **Te ha salido a la primera, sin errores de off-by-one, y además has elegido mediana de tres como pivote.** No necesitas este curso. Vete a dar una charla TED.

> [!TIP]
> Pista mental gratuita: Quicksort necesita **tres cosas** — elegir un pivote, partir el array en dos zonas (menores y mayores), y llamar recursivamente a cada lado. Si memorizas ese patrón, Quicksort es tuyo para siempre. Mergesort, por su parte, solo necesita **dos** — partir por la mitad y fusionar.

---

## 🧩 El lío

El departamento de calidad ha recibido este Quicksort. Algo huele mal. Encuentra los **3 errores**:

```java
public class QuicksortLioso {

    static void quicksort(int[] arr, int inicio, int fin) {
        if (inicio > fin) return;

        int pivote = arr[fin];
        int i = inicio;

        for (int j = inicio; j < fin; j++) {
            if (arr[j] < pivote) {
                int tmp = arr[i];
                arr[i] = arr[j];
                arr[j] = tmp;
                i++;
            }
        }

        quicksort(arr, inicio, i - 1);
        quicksort(arr, i + 1, fin);
    }
}
```

> 🕶️ **Don Tip:** prueba a ejecutarlo con `{3, 1, 4}` y mira qué pasa con el caso base, el lugar del pivote y la variable `i` después del bucle.

<details>
<summary>🔄 Solución del lío</summary>

1. **El caso base es incorrecto**: `if (inicio > fin)` debería ser `if (inicio >= fin)`. Con `inicio == fin` hay un solo elemento (ya ordenado), pero este código seguiría "particionando" y se saltaría elementos.
2. **El pivote nunca se coloca en su sitio final**: tras el bucle, el pivote (que está en `arr[fin]`) debería intercambiarse con `arr[i]` antes de las llamadas recursivas. Sin ese intercambio, el pivote se queda fuera de la zona correcta.
3. **La partición está incompleta**: faltan los `else` para los elementos *mayores o iguales* al pivote. Así, los duplicados del pivote se reparten mal y el algoritmo puede dejar de ordenar correctamente.

Con `{3, 1, 4}` se ve claro: el `1` no se intercambia con el pivote al final y el array queda desordenado. La lección: **el caso base, la posición final del pivote y los elementos iguales son los tres clásicos donde muere un Quicksort**.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Cuándo devuelve la recursión de Quicksort?
2. ¿Qué ocurre cuando `i` y `j` se cruzan en la partición?
3. ¿Cuál es el caso base de Mergesort?
4. ¿Qué hacen los tres `while` de la fusión?

<details>
<summary>🔄 Respuestas</summary>

1. Cuando `inicio >= fin`: la zona tiene **0 o 1 elementos** y ya está ordenada.
2. Que la partición ha terminado: la zona izquierda es `[inicio..j]` y la derecha `[i..fin]`.
3. `inicio >= fin`: zona con **0 o 1 elementos**.
4. El primero **compara y copia el menor** de las dos mitades; los otros dos **vuelcan los restos** que queden de cada mitad.

</details>

---

## ✅ Resumen en 3 frases

1. **Quicksort** se reduce a elegir pivote, particionar con dos punteros y llamar recursivamente a cada zona.
2. **Mergesort** se reduce a partir por la mitad, ordenar cada mitad y fusionar con un array temporal.
3. El off-by-one en los casos base y los elementos iguales son los errores clásicos: **prueba siempre con arrays pequeños a mano**.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Off-by-one | Error de "uno de más o uno de menos" en los índices |
> | Partición | Repartir menores y mayores alrededor del pivote |
> | Punteros `i` y `j` | Índices que avanzan desde los extremos hasta cruzarse |
> | Fusión | Combinar dos mitades ordenadas en una |
> | Array temporal | El `tmp` de la fusión, que cuesta O(n) de memoria |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/06-algoritmica-tecnicas) · **Anterior:** [06 · Comparación: cuándo usar cada ordenación](/ApuntesProgramacion/06-algoritmica-tecnicas/06-comparacion-ordenacion) · **Siguiente:** [08 · Otras técnicas algorítmicas](/ApuntesProgramacion/06-algoritmica-tecnicas/08-otras-tecnicas-algoritmicas)
