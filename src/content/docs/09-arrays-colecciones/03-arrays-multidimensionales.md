---
title: "03 — Arrays multidimensionales"
description: "El parking de varias plantas: arrays de arrays, filas y columnas, y cómo recorrerlos sin perderte 🏢"
---

<p><small>El parking de varias plantas: arrays de arrays, filas y columnas, y cómo recorrerlos sin perderte 🏢</small></p>

> 🗺️ **Estás en:** 📚 **U09 · Arrays y Colecciones** → 03 · Arrays multidimensionales

---

## 📬 La idea en una frase

> **Un array multidimensional es un array cuyos elementos son otros arrays: un aparcamiento de varias plantas, donde cada plaza se localiza por planta y número.**

Hasta ahora cada plaza guardaba un dato. ¿Y si el dato en sí es otro parking? Entonces tienes una tabla con filas y columnas. Esto es lo que usas para representar tableros, matrices, mapas y cualquier cosa con dos (o más) dimensiones.

---

## 🏢 El parking de varias plantas

Un array bidimensional es "un array de arrays". Se declara con doble corchete:

```java
int[][] tabla = new int[3][4]; // 3 filas, 4 columnas
```

Piénsalo como un parking con **3 plantas** y **4 plazas** por planta. Para acceder a una plaza necesitas dos números: el de la planta (fila) y el de la plaza dentro de ella (columna).

```java
tabla[0][0] = 1; // fila 0, columna 0
tabla[1][2] = 5; // fila 1, columna 2
```

También puedes crearlo ya lleno:

```java
int[][] matriz = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9}
};
```

`matriz.length` es el número de filas (3). `matriz[0].length` es el número de columnas de la fila 0 (3).

> 💡 **Consejo:** nombra los índices de arrays multidimensionales como `fila` y `col`, o `i` y `j`. NO uses `x` e `y` a menos que realmente trabajes con coordenadas. Tu yo del futuro te lo agradecerá.

---

## 🎲 Arrays de arrays irregulares

Java permite "arrays de arrays" donde cada fila tiene un número distinto de columnas (los llamados *jagged arrays*, arrays dentados):

```java
int[][] irregular = new int[3][];
irregular[0] = new int[2];
irregular[1] = new int[5];
irregular[2] = new int[3];
```

La fila 0 tiene 2 columnas, la fila 1 tiene 5 y la fila 2 tiene 3. ¿Para qué sirve? Triángulos, pirámides o simplemente datos que no forman un rectángulo perfecto (por ejemplo, los días de cada mes: febrero tiene menos).

```java
int[][] diasPorMes = {
    {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}, // un solo mes por fila
    {1, 2, 3},                                        // ejemplo de fila corta
};
```

En un array irregular, `irregular[i].length` puede ser distinto para cada `i`. Por eso los recorridos usan `matriz[i].length` dentro del bucle, nunca un número fijo.

---

## 🔁 Recorrer un array 2D: los bucles anidados

Para recorrer un rectángulo perfecto necesitas dos bucles: uno para las filas y otro para las columnas.

```java
int[][] matriz = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};

for (int i = 0; i < matriz.length; i++) {          // filas
    for (int j = 0; j < matriz[i].length; j++) {   // columnas
        System.out.print(matriz[i][j] + " ");
    }
    System.out.println();
}
```

Salida:

```
1 2 3
4 5 6
7 8 9
```

El bucle exterior va fila a fila; el interior recorre cada columna de esa fila. Fíjate que el interior usa `matriz[i].length`: así funciona también con arrays irregulares.

Y la versión perezosa con for-each (solo lectura):

```java
for (int[] fila : matriz) {
    for (int valor : fila) {
        System.out.print(valor + " ");
    }
    System.out.println();
}
```

Cada `fila` es un `int[]`, y sobre él vuelves a usar for-each. Arrays de arrays, bucles de bucles.

---

## 🧮 Para qué sirve de verdad

Los arrays 2D no son un capricho académico. Son la forma natural de representar:

| Situación | Array |
|---|---|
| Tablero de juego (ajedrez, buscaminas, tres en raya) | `char[][]` o `boolean[][]` |
| Notas por alumno y asignatura | `double[][]` |
| Mapa de píxeles de una imagen | `int[][]` |
| Matrices matemáticas | `int[][]`, `double[][]` |

Un buscaminas simplificado, por ejemplo, es un `boolean[][]`:

```java
boolean[][] minas = new boolean[5][5];
minas[2][3] = true;  // hay una mina en fila 2, columna 3
```

Y para saber si una posición existe, siempre preguntas antes de tocar: el índice de fila va de `0` a `length - 1` y el de columna de `0` a `matriz[fila].length - 1`. Salirte de ahí vuelve a ser `ArrayIndexOutOfBoundsException`, pero ahora con dos coordenadas.

> ⚠️ **Advertencia:** `matriz.length` y `matriz[0].length` NO son lo mismo. El primero son las filas; el segundo, las columnas de la fila 0. Confundirlos es el error clásico de los principiantes con matrices.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuando recorres una matriz con dos bucles, el orden importa: `i` para filas, `j` para columnas. Si los intercambias, estás recorriendo la matriz traspuesta.

**Ejercicio: la diagonal que no se ve**

```java
public class BeTheDiagonal {
    public static void main(String[] args) {
        int[][] m = {
            {1, 2, 3},
            {4, 5, 6},
            {7, 8, 9}
        };

        int suma = 0;
        for (int i = 0; i < m.length; i++) {
            suma += m[i][i];
        }
        System.out.println(suma);
    }
}
```

**¿Qué imprime?**

- (A) 12
- (B) 15
- (C) 18
- (D) 45

<details>
<summary>🔄 Solución</summary>

La **B**. El bucle suma `m[0][0] + m[1][1] + m[2][2]` = `1 + 5 + 9` = 15. Es la **diagonal principal**: cuando fila y columna son el mismo número, caminas por la diagonal de arriba-izquierda a abajo-derecha. Un solo bucle, no dos.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Cuántas filas y columnas tiene `int[][] a = new int[3][4]`?
2. ¿Cómo accedes al elemento de la fila 2, columna 1?
3. ¿Qué representa `a.length` y qué representa `a[0].length`?
4. ¿Por qué en un array irregular el bucle interior usa `a[i].length`?

<details>
<summary>🔄 Respuestas</summary>

1. 3 filas y 4 columnas.
2. `a[2][1]`. Recuerda: primero la fila, después la columna, ambos empezando en 0.
3. `a.length` es el número de filas; `a[0].length`, el número de columnas de la primera fila.
4. Porque cada fila puede tener un tamaño distinto. Usar `a[i].length` garantiza que recorres exactamente las columnas de esa fila, ni más ni menos.

</details>

---

## ✅ Resumen en 3 frases

1. Un array **bidimensional** es un array de arrays: se accede con dos índices `[fila][columna]`.
2. Se **recorre con dos bucles anidados**: el exterior para filas y el interior para columnas, usando `matriz[i].length`.
3. Java admite **arrays irregulares** donde cada fila tiene su propia longitud, y `matriz.length` y `matriz[i].length` no son lo mismo.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Array multidimensional | Array cuyos elementos son otros arrays |
> | Fila | Primera dimensión (el índice `i`) |
> | Columna | Segunda dimensión (el índice `j`) |
> | Array irregular | Cada fila con distinto número de columnas |
> | Diagonal principal | Los elementos donde `fila == columna` |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/09-arrays-colecciones) · **Anterior:** [02 · Recorrer arrays: for y for-each](/ApuntesProgramacion/09-arrays-colecciones/02-recorrer-arrays) · **Siguiente:** [04 · La clase Arrays: tu navaja suiza](/ApuntesProgramacion/09-arrays-colecciones/04-clase-arrays)