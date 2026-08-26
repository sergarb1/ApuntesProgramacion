---
title: Boletín U05 — Avanzado (Resuelto)
description: Los mismos ejercicios intermedios del boletín avanzado con sus soluciones
---

# 📝 Boletín U05 — Avanzado (Resuelto)

> Los ejercicios avanzados con sus soluciones. Inténtalos primero; bajar a ver la solución sin sudar es como pedir el 10 antes del examen.

---

## Ejercicio 1: ⭐ Fibonacci con el contador chivato

<details>
<summary>🔄 Solución</summary>

```java
public class FiboContador {

    static long llamadas;

    static long fibo(int n) {
        llamadas++;
        if (n <= 1) return n;
        return fibo(n - 1) + fibo(n - 2);
    }

    public static void main(String[] args) {
        long resultado = fibo(30);
        System.out.println("fibo(30) = " + resultado);
        System.out.println("llamadas = " + llamadas);
    }
}
```

Salida: `fibo(30) = 832040` y `llamadas = 2692537`. ¡Más de 2,6 millones de llamadas para un número de 6 cifras! La versión ingenua es brutalmente cara: cada `fibo(n)` vuelve a calcular `fibo(n-1)` y `fibo(n-2)` por completo.

El "truco de los índices" (`fibo(n) + fibo(n-1) + ... + 1`) NO funciona aquí porque las llamadas no se encadenan limpiamente: cada término del árbol recalcula subárboles enteros.

</details>

---

## Ejercicio 2: ⭐⭐ ¿Qué imprime? — el árbol de llamadas

<details>
<summary>🔄 Solución</summary>

```
bajo 3
bajo 2
bajo 1
subo 1
subo 2
subo 3
```

El orden: `pintar(3)` imprime "bajo 3", llama a `pintar(2)`, que imprime "bajo 2", llama a `pintar(1)`, que imprime "bajo 1" y llama a `pintar(0)` (que no hace nada). Al volver, cada nivel ejecuta su `println` pendiente: primero el de 1, luego el de 2, luego el de 3. La pila se desenrolla en orden inverso: **baja todo, luego sube todo**.

</details>

---

## Ejercicio 3: ⭐⭐ El palíndromo rebelde

<details>
<summary>🔄 Solución</summary>

```java
public class PalindromoRebelde {

    static boolean esPalindromoFrase(String s, int inicio, int fin) {
        if (inicio >= fin) return true;

        if (!Character.isLetter(s.charAt(inicio))) {
            return esPalindromoFrase(s, inicio + 1, fin);   // salta el no-letra
        }
        if (!Character.isLetter(s.charAt(fin))) {
            return esPalindromoFrase(s, inicio, fin - 1);   // salta el no-letra
        }

        char a = Character.toLowerCase(s.charAt(inicio));
        char b = Character.toLowerCase(s.charAt(fin));
        if (a != b) return false;

        return esPalindromoFrase(s, inicio + 1, fin - 1);
    }

    public static void main(String[] args) {
        System.out.println(esPalindromoFrase("Anita lava la tina", 0, 16));          // true
        System.out.println(esPalindromoFrase("Dábale arroz a la zorra el abad", 0, 32)); // true
        System.out.println(esPalindromoFrase("No soy un palindromo", 0, 19));        // false
    }
}
```

Salida: `true`, `true`, `false`. La clave está en los dos `if` que saltan los caracteres que no son letras ANTES de comparar. Ojo con el acento de "Dábale": los dos `á` del enunciado lo compensan (empieza y termina con la misma letra).

</details>

---

## Ejercicio 4: ⭐⭐ La potencia exprés (divide y vencerás)

<details>
<summary>🔄 Solución</summary>

```java
public class PotenciaRapida {

    static long potenciaRapida(int base, int exponente) {
        if (exponente == 0) return 1;
        long mitad = potenciaRapida(base, exponente / 2);
        if (exponente % 2 == 0) {
            return mitad * mitad;
        } else {
            return mitad * mitad * base;
        }
    }

    public static void main(String[] args) {
        System.out.println("2^20 = " + potenciaRapida(2, 20));   // 1048576
        System.out.println("3^10 = " + potenciaRapida(3, 10));   // 59049
    }
}
```

Salida: `2^20 = 1048576`, `3^10 = 59049`. `potenciaRapida(2, 20)` hace solo **5 llamadas recursivas** (20 → 10 → 5 → 2 → 1 → 0), mientras que la versión lineal del boletín inicial hace 20. De O(n) a O(log n): ese salto es todo el divide y vencerás. Cuando `e` es impar, `e / 2` redondea hacia abajo y por eso hay que multiplicar por `base` una vez más.

</details>

---

## Ejercicio 5: ⭐⭐⭐ Quicksort con mediana de tres

<details>
<summary>🔄 Solución</summary>

```java
public class QuicksortMedianaTres {

    static void quicksort(int[] arr, int inicio, int fin) {
        if (inicio >= fin) return;

        int medio = (inicio + fin) / 2;

        // elegir la mediana de arr[inicio], arr[medio], arr[fin] y llevarla a arr[inicio]
        if (arr[medio] < arr[inicio]) intercambiar(arr, inicio, medio);
        if (arr[fin] < arr[inicio]) intercambiar(arr, inicio, fin);
        if (arr[fin] < arr[medio]) intercambiar(arr, medio, fin);
        intercambiar(arr, inicio, medio);

        int pivote = arr[inicio];
        int i = inicio + 1;

        for (int j = inicio + 1; j <= fin; j++) {
            if (arr[j] < pivote) {
                intercambiar(arr, i, j);
                i++;
            }
        }

        intercambiar(arr, inicio, i - 1);

        quicksort(arr, inicio, i - 2);
        quicksort(arr, i, fin);
    }

    static void intercambiar(int[] arr, int a, int b) {
        int tmp = arr[a];
        arr[a] = arr[b];
        arr[b] = tmp;
    }

    public static void main(String[] args) {
        int[] datos = {1, 2, 3, 4, 5, 6, 7, 8};
        quicksort(datos, 0, datos.length - 1);
        System.out.println(java.util.Arrays.toString(datos));
    }
}
```

Salida: `[1, 2, 3, 4, 5, 6, 7, 8]`. Con el array ya ordenado, el pivote ya NO es el menor (o el mayor): con la mediana de tres (`inicio`, `medio`, `fin`) el pivote de la primera llamada es 4, partiendo el array por la mitad. Así se evita el peor caso O(n²) de los arrays casi ordenados. Los tres `if` colocan el valor del medio de los tres en `arr[medio]`, y luego se intercambia a `arr[inicio]` para no cambiar la técnica de partición de la unidad.

</details>

---

## Ejercicio 6: ⭐⭐⭐ Mergesort con el contador de comparaciones

<details>
<summary>🔄 Solución</summary>

```java
public class MergesortContador {

    static long comparaciones;

    static void mergesort(int[] arr) {
        if (arr.length <= 1) return;
        int medio = arr.length / 2;

        int[] izq = new int[medio];
        int[] der = new int[arr.length - medio];

        for (int i = 0; i < medio; i++) izq[i] = arr[i];
        for (int i = medio; i < arr.length; i++) der[i - medio] = arr[i];

        mergesort(izq);
        mergesort(der);
        fusionar(arr, izq, der);
    }

    static void fusionar(int[] destino, int[] izq, int[] der) {
        int i = 0, j = 0, k = 0;

        while (i < izq.length && j < der.length) {
            comparaciones++;
            if (izq[i] <= der[j]) {
                destino[k++] = izq[i++];
            } else {
                destino[k++] = der[j++];
            }
        }

        while (i < izq.length) {
            comparaciones++;
            destino[k++] = izq[i++];
        }
        while (j < der.length) {
            comparaciones++;
            destino[k++] = der[j++];
        }
    }

    public static void main(String[] args) {
        comparaciones = 0;
        int[] datos = {9, 8, 7, 6, 5, 4, 3, 2, 1};
        mergesort(datos);
        System.out.println(java.util.Arrays.toString(datos));
        System.out.println("comparaciones (caso malo) = " + comparaciones);

        comparaciones = 0;
        int[] datos2 = {1, 2, 3, 4, 5, 6, 7, 8, 9};
        mergesort(datos2);
        System.out.println("comparaciones (ya ordenado) = " + comparaciones);
    }
}
```

Salida (ejemplo): `[1, 2, 3, 4, 5, 6, 7, 8, 9]`, `comparaciones (caso malo) = 25`, `comparaciones (ya ordenado) = 18`. Mergesort siempre hace ~n·log₂(n) comparaciones (para n=9, 9·3,17 ≈ 28 en el peor de los casos teóricos), por eso es tan predecible: el orden de entrada apenas cambia el total. Compara con Quicksort, donde la entrada lo cambia TODO.

</details>

---

## Ejercicio 7: ⭐⭐⭐ Las torres de Hanói con contador

<details>
<summary>🔄 Solución</summary>

```java
public class HanoiContador {

    static int movimientos;

    static void hanoi(int n, char origen, char destino, char auxiliar) {
        if (n == 1) {
            System.out.println("Mueve disco 1 de " + origen + " a " + destino);
            movimientos++;
            return;
        }
        hanoi(n - 1, origen, auxiliar, destino);
        System.out.println("Mueve disco " + n + " de " + origen + " a " + destino);
        movimientos++;
        hanoi(n - 1, auxiliar, destino, origen);
    }

    public static void main(String[] args) {
        movimientos = 0;
        hanoi(3, 'A', 'C', 'B');
        System.out.println("Total de movimientos: " + movimientos);
    }
}
```

Con 3 discos, `Total de movimientos: 7`. Con 4 → 15, y con 8 → 255. La fórmula `2^n - 1` se cumple exactamente. El patrón clásico: mover `n-1` al auxiliar, mover el disco grande, mover `n-1` del auxiliar al destino. Cada movimiento impreso suma 1 al contador.

</details>

---

## Ejercicio 8: ⭐⭐⭐ CodeWars — Sort Numbers

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Arrays;

public class Kata {

    public static int[] sortArray(int[] nums) {
        if (nums == null || nums.length == 0) return new int[0];

        int[] copia = nums.clone();
        Arrays.sort(copia);
        return copia;
    }
}
```

Con `{1, 5, 2, 3, 4}` → `{1, 2, 3, 4, 5}`, con `null` → `[]`, con `{}` → `[]`. Se clona el array para no mutar el original y se ordena la copia.

</details>

---

## Ejercicio 9: ⭐⭐⭐ AceptaElReto — 104 Móviles

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class Moviles {

    // Lee un móvil completo (su barra y sus submóviles) y devuelve:
    //   su peso total si está equilibrado
    //   -1 si NO está equilibrado
    static int leerMovil(Scanner sc) {
        int pi = sc.nextInt();   // peso izquierdo
        int di = sc.nextInt();   // distancia izquierda
        int pd = sc.nextInt();   // peso derecho
        int dd = sc.nextInt();   // distancia derecha

        boolean ok = true;

        if (pi == 0) {                 // hay un submóvil a la izquierda
            int sub = leerMovil(sc);
            if (sub == -1) ok = false;
            else pi = sub;
        }
        if (pd == 0) {                 // hay un submóvil a la derecha
            int sub = leerMovil(sc);
            if (sub == -1) ok = false;
            else pd = sub;
        }

        if (!ok) return -1;                       // algún submóvil ya estaba desequilibrado
        if (pi * di != pd * dd) return -1;        // esta barra no se equilibra
        return pi + pd;                           // el peso total de este móvil
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            int pi = sc.nextInt();
            int di = sc.nextInt();
            int pd = sc.nextInt();
            int dd = sc.nextInt();

            if (pi == 0 && di == 0 && pd == 0 && dd == 0) break;   // fin de la entrada

            boolean ok = true;
            if (pi == 0) {
                int sub = leerMovil(sc);
                if (sub == -1) ok = false;
                else pi = sub;
            }
            if (pd == 0) {
                int sub = leerMovil(sc);
                if (sub == -1) ok = false;
                else pd = sub;
            }

            boolean equilibrada = ok && pi * di == pd * dd;
            System.out.println(equilibrada ? "SI" : "NO");
        }
    }
}
```

El caso base no es un número: el móvil "hoja" es aquel cuyos dos lados tienen peso > 0 (no hay submóviles que leer). Cada llamada recursiva lee y comprueba un submóvil completo y devuelve su peso total. El flag `ok` (o el `-1`) propaga hacia arriba que TODAS las subbarras estén equilibradas. Entrada `0 0 0 0` marca el final de la entrada.

</details>
