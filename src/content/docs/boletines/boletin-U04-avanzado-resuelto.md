---
title: "Boletín U04 — Avanzado Resuelto"
description: "Los mismos ejercicios que el boletín avanzado, con soluciones"
---

# 📝 Boletín U04 — Avanzado (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## ⭐ Ejercicio 1: La fusión de arrays ordenados

<details>
<summary>🔄 Solución</summary>

```java
public class Fusion {
    public static int[] fusionarArrays(int[] a, int[] b) {
        int[] resultado = new int[a.length + b.length];
        int i = 0, j = 0, k = 0;

        while (i < a.length && j < b.length) {
            if (a[i] < b[j]) {
                resultado[k++] = a[i++];
            } else {
                resultado[k++] = b[j++];
            }
        }

        while (i < a.length) {
            resultado[k++] = a[i++];
        }
        while (j < b.length) {
            resultado[k++] = b[j++];
        }

        return resultado;
    }

    public static void main(String[] args) {
        int[] a = {1, 3, 5};
        int[] b = {2, 4, 6};
        int[] r = fusionarArrays(a, b);
        System.out.println(java.util.Arrays.toString(r)); // [1, 2, 3, 4, 5, 6]
    }
}
```

Dos punteros (`i` y `j`) avanzan por cada array comparando en cada paso. El menor de los dos se coloca en el resultado. Cuando un array se agota, se copia el resto del otro. Es el mismo algoritmo que usa `merge` en el mergesort de la U05.

</details>

---

## ⭐ Ejercicio 2: Rotación circular a la derecha

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Arrays;

public class Rotar {
    public static void rotarDerecha(int[] arr, int k) {
        int n = arr.length;
        if (n == 0) return;
        k = k % n; // si k >= n, sobran vueltas completas

        int[] guardados = new int[k];
        for (int i = 0; i < k; i++) {
            guardados[i] = arr[n - k + i]; // los últimos k
        }
        for (int i = n - 1; i >= k; i--) {
            arr[i] = arr[i - k];           // desplaza el resto a la derecha
        }
        for (int i = 0; i < k; i++) {
            arr[i] = guardados[i];         // los guardados al principio
        }
    }

    public static void main(String[] args) {
        int[] arr = {1, 2, 3, 4, 5};
        rotarDerecha(arr, 2);
        System.out.println(Arrays.toString(arr)); // [4, 5, 1, 2, 3]
    }
}
```

Con `{1,2,3,4,5}` y `k = 2`: guardas `{4,5}`, desplazas `{1,2,3}` a las posiciones 2, 3, 4 y colocas `{4,5}` al principio. El `k % n` evita dar vueltas completas inútiles si `k` es mayor que el tamaño.

</details>

---

## ⭐ Ejercicio 3: Suma de diagonales (matriz cuadrada)

<details>
<summary>🔄 Solución</summary>

```java
public class Diagonales {
    public static void main(String[] args) {
        int n = 5;
        int[][] matriz = new int[n][n];

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                matriz[i][j] = (int) (Math.random() * 100) + 1;
            }
        }

        int diagPrincipal = 0;
        int diagSecundaria = 0;
        for (int i = 0; i < n; i++) {
            diagPrincipal += matriz[i][i];
            diagSecundaria += matriz[i][n - 1 - i];
        }

        int diferencia = Math.abs(diagPrincipal - diagSecundaria);
        System.out.println("Principal: " + diagPrincipal);
        System.out.println("Secundaria: " + diagSecundaria);
        System.out.println("Diferencia: " + diferencia);
    }
}
```

En la diagonal principal, `fila == columna` (`matriz[i][i]`). En la secundaria, la columna es la "espejo": `n - 1 - i`. Un solo bucle recorre ambas a la vez. `Math.abs` da la diferencia absoluta, sin signo.

</details>

---

## ⭐⭐ Ejercicio 4: ¿Está ordenado?

<details>
<summary>🔄 Solución</summary>

```java
public class EstaOrdenado {
    public static boolean estaOrdenado(int[] arr) {
        for (int i = 1; i < arr.length; i++) {
            if (arr[i] < arr[i - 1]) {
                return false;
            }
        }
        return true;
    }

    public static void main(String[] args) {
        System.out.println(estaOrdenado(new int[]{1, 2, 3, 4})); // true
        System.out.println(estaOrdenado(new int[]{1, 3, 2, 4})); // false
        System.out.println(estaOrdenado(new int[]{}));           // true
        System.out.println(estaOrdenado(new int[]{7}));          // true
    }
}
```

Empiezas en `i = 1` y comparas cada elemento con su anterior: si alguno es menor que el precedente, el orden está roto. Con array vacío o de un elemento, el bucle no llega a ejecutarse y devuelve `true` (no hay nada desordenado).

</details>

---

## ⭐⭐ Ejercicio 5: El inverso en el sitio

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Arrays;

public class Invertir {
    public static void invertir(int[] arr) {
        int izquierda = 0;
        int derecha = arr.length - 1;

        while (izquierda < derecha) {
            int temp = arr[izquierda];
            arr[izquierda] = arr[derecha];
            arr[derecha] = temp;
            izquierda++;
            derecha--;
        }
    }

    public static void main(String[] args) {
        int[] datos = {1, 2, 3, 4, 5};
        invertir(datos);
        System.out.println(Arrays.toString(datos)); // [5, 4, 3, 2, 1]
    }
}
```

Los dos punteros se mueven hacia el centro intercambiando elementos. Con `{1,2,3,4,5}`: primero cambia 1↔5, luego 2↔4, y cuando se cruzan (`izquierda >= derecha`) ya está. Solo se usa memoria para la variable temporal `temp`.

</details>

---

## ⭐⭐ Ejercicio 6: ¿Qué imprime? — el doble bucle que cuenta parejas

<details>
<summary>🔄 Solución</summary>

Imprime **`3`**.

El bucle exterior va con `i` por 0, 1 y 2. El interior empieza en `j = i + 1`:

- `i = 0`: parejas `(0,1)` y `(0,2)` → `2 < 4` y `2 < 6` → **2**.
- `i = 1`: pareja `(1,2)` → `4 < 6` → **1**.
- `i = 2`: el interior no entra (`j = 3` no es `< 3`).

Total: `2 + 1 = 3`. Con `{2, 4, 6}` todas las parejas cumplen `datos[i] < datos[j]`, y hay exactamente `3 · 2 / 2 = 3` parejas.

</details>

---

## ⭐⭐⭐ Ejercicio 7: Estadísticas de clase

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class Estadisticas {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        double[] notas = new double[20];

        for (int i = 0; i < notas.length; i++) {
            System.out.print("Nota del alumno " + (i + 1) + ": ");
            notas[i] = sc.nextDouble();
        }

        double suma = 0;
        double max = notas[0];
        double min = notas[0];
        int aprobados = 0;

        for (double n : notas) {
            suma += n;
            if (n > max) max = n;
            if (n < min) min = n;
            if (n >= 5) aprobados++;
        }

        System.out.println("Media: " + (suma / notas.length));
        System.out.println("Máxima: " + max);
        System.out.println("Mínima: " + min);
        System.out.println("Aprobados: " + aprobados);
        sc.close();
    }
}
```

Un bucle rellena el array, y el for-each hace el resto en una sola pasada: acumula la suma, actualiza máximo y mínimo y cuenta aprobados. Como `max` y `min` empiezan en la primera nota, el algoritmo funciona incluso con todas las notas iguales.

</details>

---

## ⭐⭐⭐ Ejercicio 8: El gran reto — buscaminas simplificado

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class Buscaminas {
    public static void main(String[] args) {
        boolean[][] minas = new boolean[5][5];
        int puestas = 0;
        while (puestas < 5) {
            int f = (int) (Math.random() * 5);
            int c = (int) (Math.random() * 5);
            if (!minas[f][c]) {
                minas[f][c] = true;
                puestas++;
            }
        }

        Scanner sc = new Scanner(System.in);
        boolean juegoActivo = true;

        while (juegoActivo) {
            System.out.print("Introduce fila y columna (0-4): ");
            int fila = sc.nextInt();
            int col = sc.nextInt();

            if (minas[fila][col]) {
                System.out.println("¡BOOM! Has pisado una mina.");
                juegoActivo = false;
            } else {
                int alrededor = 0;
                for (int i = fila - 1; i <= fila + 1; i++) {
                    for (int j = col - 1; j <= col + 1; j++) {
                        if (i >= 0 && i < 5 && j >= 0 && j < 5 && minas[i][j]) {
                            alrededor++;
                        }
                    }
                }
                System.out.println("Seguro. Minas alrededor: " + alrededor);
            }
        }
        sc.close();
    }
}
```

El `while` que coloca minas garantiza exactamente 5 en posiciones distintas (la condición `!minas[f][c]` evita repetir). Para contar vecinas, el doble bucle revisa las 8 casillas alrededor y el `if` con los límites (0-4) impide salirte del array: sin esa comprobación, `minas[-1][...]` sería `ArrayIndexOutOfBoundsException`.

</details>

---

## ⭐⭐⭐ Ejercicio 9: Compactar — los ceros al final

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Arrays;

public class Compactar {
    public static void compactar(int[] arr) {
        int pos = 0;

        for (int i = 0; i < arr.length; i++) {
            if (arr[i] != 0) {
                arr[pos] = arr[i];
                pos++;
            }
        }

        for (int i = pos; i < arr.length; i++) {
            arr[i] = 0;
        }
    }

    public static void main(String[] args) {
        int[] datos = {0, 3, 0, 1, 0, 2};
        compactar(datos);
        System.out.println(Arrays.toString(datos)); // [3, 1, 2, 0, 0, 0]
    }
}
```

El índice `pos` marca dónde va el siguiente valor no cero. Cuando encuentras un valor distinto de 0, lo copias a `arr[pos]` y avanzas. Al terminar, desde `pos` hasta el final se rellena con ceros. Es el mismo patrón de "índice lento / índice rápido" que usa la fusión y que verás de nuevo con colecciones.

</details>