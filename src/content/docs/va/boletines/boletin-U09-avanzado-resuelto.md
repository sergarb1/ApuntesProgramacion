---
title: "Butlletí U09 — Avançat Resolt"
description: "Els mateixos exercicis que el butlletí avançat, amb solucions"
---

# 📝 Butlletí U09 — Avançat (Resolt)

> Les solucions estan amagades a cada exercici. No faces trampa: primer intenta-ho de veritat.

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

Dos punters (`i` i `j`) avancen per cada array comparant en cada pas. El menor dels dos es col·loca al resultat. Quan un array s'esgota, es copia la resta de l'altre. És el mateix algoritme que usa `merge` en el mergesort de la U05.

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

A la diagonal principal, `fila == columna` (`matriz[i][i]`). A la secundària, la columna és la "espill": `n - 1 - i`. Un sol bucle recorre totes dues alhora. `Math.abs` dona la diferència absoluta, sense signe.

</details>

---

## ⭐⭐ Exercici 4: La cua del supermercat amb LinkedList

<details>
<summary>🔄 Solució</summary>

```java
import java.util.LinkedList;
import java.util.Scanner;

public class ColaSupermercado {
    public static void main(String[] args) {
        LinkedList<String> cola = new LinkedList<>();
        Scanner sc = new Scanner(System.in);
        int opcion;

        do {
            System.out.println("\n1. Arriba client  2. Atendre client  3. Qui seguix?  4. Estat  0. Eixir");
            opcion = sc.nextInt();
            sc.nextLine();

            switch (opcion) {
                case 1:
                    System.out.print("Nom del client: ");
                    cola.addLast(sc.nextLine());
                    break;
                case 2:
                    if (!cola.isEmpty()) {
                        System.out.println("Atenent a: " + cola.removeFirst());
                    } else {
                        System.out.println("No hi ha ningú a la cua.");
                    }
                    break;
                case 3:
                    if (!cola.isEmpty()) {
                        System.out.println("El següent és: " + cola.getFirst());
                    } else {
                        System.out.println("No hi ha ningú a la cua.");
                    }
                    break;
                case 4:
                    System.out.println("Cua: " + cola);
                    break;
            }
        } while (opcion != 0);

        sc.close();
    }
}
```

`addLast` fica al final (els clients es posen darrere), `removeFirst` atén el primer (FIFO) i `getFirst` el mira sense traure'l. L'`isEmpty()` evita l'error de demanar el primer a una cua buida.

</details>

---

## ⭐⭐ Exercici 5: Intersecció i unió de conjunts

<details>
<summary>🔄 Solució</summary>

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
        System.out.println("Intersecció: " + interseccion);
        System.out.println("Unió: " + union);
        System.out.println("Diferència simètrica: " + difSimetrica);
    }
}
```

La màgia són els tres mètodes de `Set`: `retainAll` deixa només el comú, `addAll` unix sense duplicats i `removeAll` trau la intersecció de la unió per a deixar el que està només en un dels dos. Com `HashSet` no admet duplicats, la unió ix neta sola.

</details>

---

## ⭐⭐ Exercici 6: Eliminar duplicats mantenint l'ordre

<details>
<summary>🔄 Solució</summary>

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

`LinkedHashSet` és la combinació perfecta: elimina duplicats (com `HashSet`) però conserva l'ordre d'inserció (com una llista). Es construïx passant-li la llista i es torna a convertir en `ArrayList`. Resultat: `[3, 1, 4, 5, 9, 2, 6]`, sense repetits i en ordre de primera aparició.

</details>

---

## ⭐⭐⭐ Exercici 7: Què imprimeix? — el remove que trenca el ball

<details>
<summary>🔄 Solució</summary>

Llança una **`ConcurrentModificationException`**.

El `for-each` usa un `Iterator` per darrere. Quan dins del bucle crides `palabras.remove(p)`, la llista canvia mentre l'iterador la recorre. L'iterador detecta la modificació externa i explota. La solució és recórrer amb un `Iterator` explícit i usar `it.remove()`. O construir una nova llista amb els elements que vols conservar.

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

## ⭐⭐⭐ Exercici 8: Estadístiques de classe

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class Estadisticas {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        double[] notas = new double[20];

        for (int i = 0; i < notas.length; i++) {
            System.out.print("Nota de l'alumne " + (i + 1) + ": ");
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

        System.out.println("Mitjana: " + (suma / notas.length));
        System.out.println("Màxima: " + max);
        System.out.println("Mínima: " + min);
        System.out.println("Aprovats: " + aprobados);
        sc.close();
    }
}
```

Un bucle ompli l'array, i el for-each fa la resta en una sola passada: acumula la suma, actualitza màxim i mínim i compta aprovats. Com `max` i `min` comencen en la primera nota, l'algoritme funciona fins i tot amb totes les notes iguals.

</details>

---

## ⭐⭐⭐ Exercici 9: El gran repte — busca-mines simplificat

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
            System.out.print("Introdueix fila i columna (0-4): ");
            int fila = sc.nextInt();
            int col = sc.nextInt();

            if (minas[fila][col]) {
                System.out.println("¡BOOM! Has trepitjat una mina.");
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
                System.out.println("Segur. Mines al voltant: " + alrededor);
            }
        }
        sc.close();
    }
}
```

El `while` que col·loca mines garantix exactament 5 en posicions diferents (la condició `!minas[f][c]` evita repetir). Per a comptar veïnes, el doble bucle revisa les 8 caselles del voltant i el `if` amb els límits (0-4) impedix eixir-te de l'array: sense eixa comprovació, `minas[-1][...]` seria `ArrayIndexOutOfBoundsException`.

</details>