---
title: "04 — La clase Arrays: tu navaja suiza"
description: "toString, sort, copyOf, binarySearch y fill: los métodos estáticos que te ahorran reinventar la rueda 🔧"
---

<p><small>toString, sort, copyOf, binarySearch y fill: los métodos estáticos que te ahorran reinventar la rueda 🔧</small></p>

> 🗺️ **Estás en:** 🅿️ **U04 · Arrays** → 04 · La clase Arrays: tu navaja suiza

---

## 📬 La idea en una frase

> **`java.util.Arrays` es una clase llena de métodos estáticos para trabajar con arrays: imprimir, ordenar, copiar, buscar y rellenar sin escribir tú el bucle.**

Los arrays tienen un problema: no tienen métodos. `numeros.sort()` no existe. Por eso Java te regala una clase de herramientas, todas estáticas, para que no tengas que reinventar el bucle cada vez. Es lo más parecido a una navaja suiza que existe en el mundo de los arrays.

---

## 🧰 La clase Arrays

Se importa con `import java.util.Arrays;` y sus métodos se llaman pasándole el array:

```java
import java.util.Arrays;

public class EjemploArrays {
    public static void main(String[] args) {
        int[] numeros = {5, 2, 8, 1, 9};

        Arrays.sort(numeros);                    // {1, 2, 5, 8, 9}
        String texto = Arrays.toString(numeros); // "[1, 2, 5, 8, 9]"
        System.out.println(texto);
    }
}
```

Recuerda: como son métodos `static` (lo viste en la U07), se llaman con el nombre de la clase: `Arrays.xxx(array)`. No hace falta crear ningún objeto `Arrays` — de hecho, no puedes.

### 🔍 Arrays.toString: imprimir bonito

El método más socorrido. Sin él, imprimir un array muestra basura:

```java
int[] numeros = {1, 2, 3};
System.out.println(numeros);           // [I@6d06d69c  (dirección de memoria, inútil)
System.out.println(Arrays.toString(numeros)); // [1, 2, 3]
```

Sin `toString`, Java imprime la dirección de memoria del objeto (`[I@6d06d69c`), no los datos. Con él, obtienes algo legible. Para arrays 2D existe `Arrays.deepToString()`.

> ⚠️ **Advertencia:** `numeros.toString()` tampoco funciona: los arrays no sobreescriben `toString()`. Siempre `Arrays.toString(numeros)`.

### 📊 Arrays.sort: ordenar de un plumazo

Ordena el array en el sitio, de menor a mayor (según el orden natural del tipo):

```java
int[] notas = {7, 3, 9, 5};
Arrays.sort(notas);
System.out.println(Arrays.toString(notas)); // [3, 5, 7, 9]
```

Con `String` ordena alfabéticamente. Ojo con las mayúsculas: `"Zebra"` va antes que `"abc"` porque las mayúsculas tienen menor valor Unicode. Es ordenación lexicográfica, no "de diccionario humano".

### 🔎 Arrays.binarySearch: buscar rápido (pero solo ordenado)

La búsqueda binaria parte el array por la mitad en cada paso. Es rapidísima, pero **exige que el array esté ordenado antes**.

```java
int[] numeros = {3, 5, 7, 9, 11};
int pos = Arrays.binarySearch(numeros, 7);
System.out.println(pos); // 2
```

Si el valor no está, devuelve un número negativo (`-(puntoDeInsercion) - 1`). Ojo: si el array no está ordenado, el resultado es impredecible. Ordena antes de buscar, siempre.

### 📋 Arrays.copyOf: copiar con talla nueva

Crea un **nuevo** array con los primeros `n` elementos (o todos más ceros si pides más de los que hay):

```java
int[] original = {1, 2, 3, 4, 5};
int[] recortado = Arrays.copyOf(original, 3); // {1, 2, 3}
int[] alargado = Arrays.copyOf(original, 8);  // {1, 2, 3, 4, 5, 0, 0, 0}
```

Es la forma civilizada de "cambiar el tamaño" de un array, que como sabes es fijo: creas uno nuevo y copias.

### 🧽 Arrays.fill: rellenar todo de golpe

Pone el mismo valor en todas las plazas:

```java
int[] tabla = new int[10];
Arrays.fill(tabla, 0);     // todo a ceros
Arrays.fill(tabla, 7);     // todo a sietes
```

Útil para inicializar tableros, resetear marcadores o preparar un array antes de usarlo.

### ⚖️ Arrays.equals: comparar contenido, no referencias

Este es el que más bugs evita. `array1.equals(array2)` NO compara los elementos: compara si son el MISMO objeto en memoria. Usa SIEMPRE `Arrays.equals()`:

```java
int[] a = {1, 2, 3};
int[] b = {1, 2, 3};

System.out.println(a.equals(b));            // false (objetos distintos en memoria)
System.out.println(Arrays.equals(a, b));    // true (mismo contenido)
```

Tu jefe te lo agradecerá.

---

## 🧭 El mapa de la navaja

| Método | Qué hace | Ojo con |
|---|---|---|
| `Arrays.toString(arr)` | Imprime el array legible | No usar `arr.toString()` |
| `Arrays.sort(arr)` | Ordena en el sitio | Modifica el original |
| `Arrays.binarySearch(arr, v)` | Busca por índice | Requiere array ordenado |
| `Arrays.copyOf(arr, n)` | Nuevo array con n elementos | Crea copia, no toca el original |
| `Arrays.fill(arr, v)` | Rellena todo con v | Sirve para inicializar |
| `Arrays.equals(a, b)` | Compara contenido | No confundir con `==` |
| `Arrays.deepToString(arr2d)` | Imprime arrays 2D | Versión profunda del toString |

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `Arrays.binarySearch()` requiere el array ORDENADO. Si no, el resultado es impredecible. Es como buscar en un diccionario que no está alfabético: no encontrarás nada fiable.

**Ejercicio: la búsqueda que lo tenía todo**

```java
import java.util.Arrays;

public class BeTheSort {
    public static void main(String[] args) {
        int[] datos = {42, 17, 8, 99, 3};
        Arrays.sort(datos);

        int indice = Arrays.binarySearch(datos, 42);
        System.out.println(indice);
    }
}
```

**¿Qué imprime?**

- (A) 0
- (B) 3
- (C) 4
- (D) 99

<details>
<summary>🔄 Solución</summary>

La **B**. Después de ordenar, el array es `{3, 8, 17, 42, 99}`. El 42 está en el índice 3. Si no hubieras ordenado antes, `binarySearch` podría haberte devuelto cualquier cosa, incluido un negativo falso.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué devuelve `Arrays.binarySearch` si el valor no está en el array?
2. ¿`a.equals(b)` y `Arrays.equals(a, b)` hacen lo mismo?
3. ¿Qué hace `Arrays.copyOf(arr, 10)` si `arr` tiene 4 elementos?
4. ¿Por qué `System.out.println(arr)` no imprime los datos?

<details>
<summary>🔄 Respuestas</summary>

1. Un número negativo (`-(puntoDeInsercion) - 1`). Es una forma compacta de decir "no está, pero aquí iría".
2. No. `a.equals(b)` compara referencias (¿es el mismo objeto?); `Arrays.equals(a, b)` compara el contenido elemento a elemento.
3. Crea un nuevo array de 10 plazas con los 4 valores y el resto a `0`. Es el truco para "agrandar" un array.
4. Porque `arr` es un objeto y su `toString()` heredado imprime la dirección de memoria (`[I@...`). Para ver los datos usa `Arrays.toString(arr)`.

</details>

---

## ✅ Resumen en 3 frases

1. `java.util.Arrays` es la caja de herramientas **estática** de los arrays: se importa y se usa sin crear objetos.
2. Los cinco imprescindibles: `toString` (imprimir), `sort` (ordenar), `copyOf` (copiar), `binarySearch` (buscar, requiere orden) y `fill` (rellenar).
3. Para **comparar contenido** usa `Arrays.equals`, nunca `equals` ni `==`, que comparan referencias.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Clase utilitaria | Clase con métodos estáticos que no se instancia (como `Math`) |
> | Orden natural | El orden que el tipo define por defecto (numérico, alfabético) |
> | Búsqueda binaria | Búsqueda que parte el array por la mitad; requiere orden |
> | Ordenación lexicográfica | Orden alfabético según el valor de los caracteres |
> | Copia | Nuevo array independiente con los mismos valores |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/04-arrays) · **Anterior:** [03 · Arrays multidimensionales](/ApuntesProgramacion/04-arrays/03-arrays-multidimensionales) · **Siguiente:** [05 · Arrays y métodos](/ApuntesProgramacion/04-arrays/05-arrays-metodos)