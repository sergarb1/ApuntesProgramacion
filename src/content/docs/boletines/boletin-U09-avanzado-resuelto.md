---
title: "Boletín U09 — Avanzado Resuelto"
description: "Los mismos ejercicios que el boletín avanzado, con soluciones"
---

# 📝 Boletín U09 — Avanzado (Resuelto)

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
        k = k % n; // si k >= n, sobra dar vueltas completas

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

## ⭐⭐ Ejercicio 4: La cola del supermercado con LinkedList

<details>
<summary>🔄 Solución</summary>

```java
import java.util.LinkedList;
import java.util.Scanner;

public class ColaSupermercado {
    public static void main(String[] args) {
        LinkedList<String> cola = new LinkedList<>();
        Scanner sc = new Scanner(System.in);
        int opcion;

        do {
            System.out.println("\n1. Llega cliente  2. Atender cliente  3. ¿Quién sigue?  4. Estado  0. Salir");
            opcion = sc.nextInt();
            sc.nextLine();

            switch (opcion) {
                case 1:
                    System.out.print("Nombre del cliente: ");
                    cola.addLast(sc.nextLine());
                    break;
                case 2:
                    if (!cola.isEmpty()) {
                        System.out.println("Atendiendo a: " + cola.removeFirst());
                    } else {
                        System.out.println("No hay nadie en la cola.");
                    }
                    break;
                case 3:
                    if (!cola.isEmpty()) {
                        System.out.println("El siguiente es: " + cola.getFirst());
                    } else {
                        System.out.println("No hay nadie en la cola.");
                    }
                    break;
                case 4:
                    System.out.println("Cola: " + cola);
                    break;
            }
        } while (opcion != 0);

        sc.close();
    }
}
```

`addLast` mete al final (los clientes se ponen detrás), `removeFirst` atiende al primero (FIFO) y `getFirst` lo mira sin sacarlo. El `isEmpty()` evita el error de pedirle el primero a una cola vacía.

</details>

---

## ⭐⭐ Ejercicio 5: Intersección y unión de conjuntos

<details>
<summary>🔄 Solución</summary>

```java
import java.util.HashSet;
import java.util.Set;

public class Conjuntos {
    public static void main(String[] args) {
        Set<Integer> a = new HashSet<>();
        Set<Integer> b = new HashSet<>();

        while (a.size() < 8) a.add((int) (Math.random() * 20) + 1);
        while (b.size() < 8) b.add((int) (Math.random() * 20) + 1);

        Set<Integer> interseccion = new HashSet<>(a);
        interseccion.retainAll(b);

        Set<Integer> union = new HashSet<>(a);
        union.addAll(b);

        Set<Integer> difSimetrica = new HashSet<>(union);
        difSimetrica.removeAll(interseccion);

        System.out.println("A: " + a);
        System.out.println("B: " + b);
        System.out.println("Intersección: " + interseccion);
        System.out.println("Unión: " + union);
        System.out.println("Diferencia simétrica: " + difSimetrica);
    }
}
```

La magia son los tres métodos de `Set`: `retainAll` deja solo lo común, `addAll` une sin duplicados y `removeAll` quita la intersección de la unión para dejar lo que está solo en uno de los dos. Como `HashSet` no admite duplicados, la unión sale limpia sola.

</details>

---

## ⭐⭐ Ejercicio 6: Eliminar duplicados manteniendo el orden

<details>
<summary>🔄 Solución</summary>

```java
import java.util.ArrayList;
import java.util.LinkedHashSet;

public class SinDuplicados {
    public static ArrayList<Integer> sinDuplicados(ArrayList<Integer> lista) {
        LinkedHashSet<Integer> set = new LinkedHashSet<>(lista);
        return new ArrayList<>(set);
    }

    public static void main(String[] args) {
        ArrayList<Integer> lista = new ArrayList<>();
        for (int n : new int[]{3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5}) {
            lista.add(n);
        }
        System.out.println(sinDuplicados(lista)); // [3, 1, 4, 5, 9, 2, 6]
    }
}
```

`LinkedHashSet` es la combinación perfecta: elimina duplicados (como `HashSet`) pero conserva el orden de inserción (como una lista). Se construye pasándole la lista y se vuelve a convertir en `ArrayList`. Resultado: `[3, 1, 4, 5, 9, 2, 6]`, sin repetidos y en orden de primera aparición.

</details>

---

## ⭐⭐⭐ Ejercicio 7: ¿Qué imprime? — el remove que rompe el baile

<details>
<summary>🔄 Solución</summary>

Lanza una **`ConcurrentModificationException`**.

El `for-each` usa un `Iterator` por debajo. Cuando dentro del bucle llamas a `palabras.remove(p)`, la lista cambia mientras el iterador la está recorriendo. El iterador detecta la modificación externa y explota. La solución es recorrer con un `Iterator` explícito y usar `it.remove()`. O construir una nueva lista con los elementos que quieres conservar.

```java
import java.util.ArrayList;
import java.util.Iterator;

public class Puzle {
    public static void main(String[] args) {
        ArrayList<String> palabras = new ArrayList<>();
        palabras.add("hola");
        palabras.add("mundo");
        palabras.add("adiós");

        Iterator<String> it = palabras.iterator();
        while (it.hasNext()) {
            if (it.next().equals("mundo")) {
                it.remove();
            }
        }
        System.out.println(palabras); // [hola, adiós]
    }
}
```

</details>

---

## ⭐⭐⭐ Ejercicio 8: Estadísticas de clase

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

## ⭐⭐⭐ Ejercicio 9: El gran reto — buscaminas simplificado

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