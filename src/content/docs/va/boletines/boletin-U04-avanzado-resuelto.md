---
title: "Butlletí U04 — Avançat Resolt"
description: "Els mateixos exercicis que el butlletí avançat, amb solucions"
---

# 📝 Butlletí U04 — Avançat (Resolt)

> Les solucions estan amagades en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## ⭐ Exercici 1: La fusió d'arrays ordenats

<details>
<summary>🔄 Solució</summary>

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

Dos punters (`i` i `j`) avancen per cada array comparant a cada pas. El menor dels dos es col·loca al resultat. Quan un array s'esgota, es copia la resta de l'altre. És el mateix algoritme que usa `merge` en el mergesort de la U06.

</details>

---

## ⭐ Exercici 2: Rotació circular a la dreta

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Arrays;

public class Rotar {
    public static void rotarDerecha(int[] arr, int k) {
        int n = arr.length;
        if (n == 0) return;
        k = k % n; // si k >= n, sobren voltes completes

        int[] guardados = new int[k];
        for (int i = 0; i < k; i++) {
            guardados[i] = arr[n - k + i]; // els últims k
        }
        for (int i = n - 1; i >= k; i--) {
            arr[i] = arr[i - k];           // desplaça la resta a la dreta
        }
        for (int i = 0; i < k; i++) {
            arr[i] = guardados[i];         // els guardats al principi
        }
    }

    public static void main(String[] args) {
        int[] arr = {1, 2, 3, 4, 5};
        rotarDerecha(arr, 2);
        System.out.println(Arrays.toString(arr)); // [4, 5, 1, 2, 3]
    }
}
```

Amb `{1,2,3,4,5}` i `k = 2`: guardes `{4,5}`, desplaces `{1,2,3}` a les posicions 2, 3, 4 i col·loques `{4,5}` al principi. El `k % n` evita donar voltes completes inútils si `k` és major que la grandària.

</details>

---

## ⭐ Exercici 3: Suma de diagonals (matriu quadrada)

<details>
<summary>🔄 Solució</summary>

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

A la diagonal principal, `fila == columna` (`matriz[i][i]`). A la secundària, la columna és el "mirall": `n - 1 - i`. Un sol bucle recorre totes dues a la vegada. `Math.abs` dona la diferència absoluta, sense signe.

</details>

---

## ⭐⭐ Exercici 4: Està ordenat?

<details>
<summary>🔄 Solució</summary>

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

Comences en `i = 1` i compares cada element amb l'anterior: si algun és menor que el precedent, l'ordre està trencat. Amb array buit o d'un element, el bucle ni tan sols s'executa i torna `true` (no hi ha res desordenat).

</details>

---

## ⭐⭐ Exercici 5: L'invers al lloc

<details>
<summary>🔄 Solució</summary>

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

Els dos punters es mouen cap al centre intercanviant elements. Amb `{1,2,3,4,5}`: primer canvia 1↔5, després 2↔4, i quan es creuen (`izquierda >= derecha`) ja està. Només s'usa memòria per a la variable temporal `temp`.

</details>

---

## ⭐⭐ Exercici 6: Què imprimeix? — el doble bucle que compta parelles

<details>
<summary>🔄 Solució</summary>

Imprimeix **`3`**.

El bucle exterior va amb `i` per 0, 1 i 2. L'interior comença en `j = i + 1`:

- `i = 0`: parelles `(0,1)` i `(0,2)` → `2 < 4` i `2 < 6` → **2**.
- `i = 1`: parella `(1,2)` → `4 < 6` → **1**.
- `i = 2`: l'interior no entra (`j = 3` no és `< 3`).

Total: `2 + 1 = 3`. Amb `{2, 4, 6}` totes les parelles complixen `datos[i] < datos[j]`, i hi ha exactament `3 · 2 / 2 = 3` parelles.

</details>

---

## ⭐⭐⭐ Exercici 7: Estadístiques de classe

<details>
<summary>🔄 Solució</summary>

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

Un bucle ompli l'array, i el for-each fa la resta en una sola passada: acumula la suma, actualitza màxim i mínim i compta aprovats. Com `max` i `min` comencen en la primera nota, l'algoritme funciona fins i tot amb totes les notes iguals.

</details>

---

## ⭐⭐⭐ Exercici 8: El gran repte — busca-mines simplificat

<details>
<summary>🔄 Solució</summary>

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

El `while` que col·loca mines garantix exactament 5 en posicions diferents (la condició `!minas[f][c]` evita repetir). Per a comptar veïnes, el doble bucle revisa les 8 caselles al voltant i el `if` amb els límits (0-4) impedix eixir-te de l'array: sense eixa comprovació, `minas[-1][...]` seria `ArrayIndexOutOfBoundsException`.

</details>

---

## ⭐⭐⭐ Exercici 9: Compactar — els zeros al final

<details>
<summary>🔄 Solució</summary>

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

L'índex `pos` marca on va el següent valor no zero. Quan trobes un valor diferent de 0, el copies a `arr[pos]` i avances. En acabar, des de `pos` fins al final s'ompli amb zeros. És el mateix patró de "índex lent / índex ràpid" que usa la fusió i que veuràs de nou amb les col·leccions.

</details>