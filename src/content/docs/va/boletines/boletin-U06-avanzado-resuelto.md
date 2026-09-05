---
title: Butlletí U06 — Avançat (Resolt)
description: Els mateixos exercicis intermedis del butlletí avançat amb les seues solucions
---

# 📝 Butlletí U06 — Avançat (Resolt)

> Els exercicis avançats amb les seues solucions. Intenta'ls primer; baixar a vore la solució sense suar és com demanar el 10 abans de l'examen.

---

## Exercici 1: ⭐ Fibonacci amb el comptador xafarder

<details>
<summary>🔄 Solució</summary>

```java
public class FiboContador {

    static long crides;

    static long fibo(int n) {
        crides++;
        if (n <= 1) return n;
        return fibo(n - 1) + fibo(n - 2);
    }

    public static void main(String[] args) {
        long resultat = fibo(30);
        System.out.println("fibo(30) = " + resultat);
        System.out.println("crides = " + crides);
    }
}
```

Eixida: `fibo(30) = 832040` i `crides = 2692537`. ¡Més de 2,6 milions de crides per a un nombre de 6 xifres! La versió ingènua és brutalment cara: cada `fibo(n)` torna a calcular `fibo(n-1)` i `fibo(n-2)` per complet.

El "truc dels índexs" (`fibo(n) + fibo(n-1) + ... + 1`) NO funciona ací perquè les crides no s'encadenen netament: cada terme de l'arbre recalcula subarbres sencers.

</details>

---

## Exercici 2: ⭐⭐ Què imprimeix? — l'arbre de crides

<details>
<summary>🔄 Solució</summary>

```
baixe 3
baixe 2
baixe 1
puge 1
puge 2
puge 3
```

L'ordre: `pintar(3)` imprimix "baixe 3", crida a `pintar(2)`, que imprimix "baixe 2", crida a `pintar(1)`, que imprimix "baixe 1" i crida a `pintar(0)` (que no fa res). En tornar, cada nivell executa el seu `println` pendent: primer el d'1, després el de 2, després el de 3. La pila es desenrotlla en ordre invers: **baixa tot, després puja tot**.

</details>

---

## Exercici 3: ⭐⭐ El palíndrom rebel

<details>
<summary>🔄 Solució</summary>

```java
public class PalindromRebel {

    static boolean esPalindromoFrase(String s, int inicio, int fin) {
        if (inicio >= fin) return true;

        if (!Character.isLetter(s.charAt(inicio))) {
            return esPalindromoFrase(s, inicio + 1, fin);   // salta el no-lletra
        }
        if (!Character.isLetter(s.charAt(fin))) {
            return esPalindromoFrase(s, inicio, fin - 1);   // salta el no-lletra
        }

        char a = Character.toLowerCase(s.charAt(inicio));
        char b = Character.toLowerCase(s.charAt(fin));
        if (a != b) return false;

        return esPalindromoFrase(s, inicio + 1, fin - 1);
    }

    public static void main(String[] args) {
        System.out.println(esPalindromoFrase("Anita lava la tina", 0, 17));          // true
        System.out.println(esPalindromoFrase("La ruta natural", 0, 14));          // true
        System.out.println(esPalindromoFrase("No soy un palindromo", 0, 19));        // false
    }
}
```

Eixida: `true`, `true`, `false`. La clau està en els dos `if` que salten els caràcters que no són lletres ABANS de comparar. Ull: `Character.toLowerCase()` no lleva accents, així que les frases d'exemple es trien sense tildes («La ruta natural»). Si tingueres tildes («Dábale arroz a la zorra el abad»), hauries de normalitzar els accents apart.

</details>

---

## Exercici 4: ⭐⭐ La potència exprés (divide i venceràs)

<details>
<summary>🔄 Solució</summary>

```java
public class PotenciaRapida {

    static long potenciaRapida(int base, int exponente) {
        if (exponente == 0) return 1;
        long meitat = potenciaRapida(base, exponente / 2);
        if (exponente % 2 == 0) {
            return meitat * meitat;
        } else {
            return meitat * meitat * base;
        }
    }

    public static void main(String[] args) {
        System.out.println("2^20 = " + potenciaRapida(2, 20));   // 1048576
        System.out.println("3^10 = " + potenciaRapida(3, 10));   // 59049
    }
}
```

Eixida: `2^20 = 1048576`, `3^10 = 59049`. `potenciaRapida(2, 20)` fa només **5 crides recursives** (20 → 10 → 5 → 2 → 1 → 0), mentre que la versió lineal del butlletí inicial en fa 20. De O(n) a O(log n): eixe salt és tot el divide i venceràs. Quan `e` és senar, `e / 2` arredonix cap avall i per això cal multiplicar per `base` una vegada més.

</details>

---

## Exercici 5: ⭐⭐⭐ Quicksort amb mediana de tres

<details>
<summary>🔄 Solució</summary>

```java
public class QuicksortMedianaTres {

    static void quicksort(int[] arr, int inicio, int fin) {
        if (inicio >= fin) return;

        int medio = (inicio + fin) / 2;

        // triar la mediana de arr[inicio], arr[medio], arr[fin] i portar-la a arr[inicio]
        if (arr[medio] < arr[inicio]) intercanviar(arr, inicio, medio);
        if (arr[fin] < arr[inicio]) intercanviar(arr, inicio, fin);
        if (arr[fin] < arr[medio]) intercanviar(arr, medio, fin);
        intercanviar(arr, inicio, medio);

        int pivote = arr[inicio];
        int i = inicio + 1;

        for (int j = inicio + 1; j <= fin; j++) {
            if (arr[j] < pivote) {
                intercanviar(arr, i, j);
                i++;
            }
        }

        intercanviar(arr, inicio, i - 1);

        quicksort(arr, inicio, i - 2);
        quicksort(arr, i, fin);
    }

    static void intercanviar(int[] arr, int a, int b) {
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

Eixida: `[1, 2, 3, 4, 5, 6, 7, 8]`. Amb l'array ja ordenat, el pivot ja NO és el menor (o el major): amb la mediana de tres (`inicio`, `medio`, `fin`) el pivot de la primera crida és 4, partint l'array per la meitat. Així s'evita el pitjor cas O(n²) dels arrays quasi ordenats. Els tres `if` col·loquen el valor del mig dels tres en `arr[medio]`, i després s'intercanvia a `arr[inicio]` per a no canviar la tècnica de partició de la unitat.

</details>

---

## Exercici 6: ⭐⭐⭐ Mergesort amb el comptador de comparacions

<details>
<summary>🔄 Solució</summary>

```java
public class MergesortContador {

    static long comparacions;

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
            comparacions++;
            if (izq[i] <= der[j]) {
                destino[k++] = izq[i++];
            } else {
                destino[k++] = der[j++];
            }
        }

        while (i < izq.length) {
            comparacions++;
            destino[k++] = izq[i++];
        }
        while (j < der.length) {
            comparacions++;
            destino[k++] = der[j++];
        }
    }

    public static void main(String[] args) {
        comparacions = 0;
        int[] datos = {9, 8, 7, 6, 5, 4, 3, 2, 1};
        mergesort(datos);
        System.out.println(java.util.Arrays.toString(datos));
        System.out.println("comparacions (cas dolent) = " + comparacions);

        comparacions = 0;
        int[] datos2 = {1, 2, 3, 4, 5, 6, 7, 8, 9};
        mergesort(datos2);
        System.out.println("comparacions (ja ordenat) = " + comparacions);
    }
}
```

Eixida (exemple): `[1, 2, 3, 4, 5, 6, 7, 8, 9]`, `comparacions (cas dolent) = 25`, `comparacions (ja ordenat) = 18`. Mergesort sempre fa ~n·log₂(n) comparacions (per a n=9, 9·3,17 ≈ 28 en el pitjor cas teòric), per això és tan previsible: l'ordre de l'entrada amb prou faenes canvia el total. Compara-ho amb Quicksort, on l'entrada ho canvia TOT.

</details>

---

## Exercici 7: ⭐⭐⭐ Les torres de Hanói amb comptador

<details>
<summary>🔄 Solució</summary>

```java
public class HanoiContador {

    static int moviments;

    static void hanoi(int n, char origen, char destino, char auxiliar) {
        if (n == 1) {
            System.out.println("Mueve disco 1 de " + origen + " a " + destino);
            moviments++;
            return;
        }
        hanoi(n - 1, origen, auxiliar, destino);
        System.out.println("Mueve disco " + n + " de " + origen + " a " + destino);
        moviments++;
        hanoi(n - 1, auxiliar, destino, origen);
    }

    public static void main(String[] args) {
        moviments = 0;
        hanoi(3, 'A', 'C', 'B');
        System.out.println("Total de moviments: " + moviments);
    }
}
```

Amb 3 discos, `Total de moviments: 7`. Amb 4 → 15, i amb 8 → 255. La fórmula `2^n - 1` es complix exactament. El patró clàssic: moure `n-1` a l'auxiliar, moure el disc gran, moure `n-1` de l'auxiliar al destí. Cada moviment imprés suma 1 al comptador.

</details>

---

## Exercici 8: ⭐⭐⭐ CodeWars — Sort Numbers

<details>
<summary>🔄 Solució</summary>

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

Amb `{1, 5, 2, 3, 4}` → `{1, 2, 3, 4, 5}`, amb `null` → `[]`, amb `{}` → `[]`. Es clona l'array per a no mutar l'original i s'ordena la còpia.

</details>

---

## Exercici 9: ⭐⭐⭐ AceptaElReto — 104 Mòbils

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class Mobils {

    // Llig un mòbil complet (la seua barra i els seus submòbils) i torna:
    //   el seu pes total si està equilibrat
    //   -1 si NO està equilibrat
    static int llegirMobil(Scanner sc) {
        int pi = sc.nextInt();   // pes esquerre
        int di = sc.nextInt();   // distància esquerra
        int pd = sc.nextInt();   // pes dret
        int dd = sc.nextInt();   // distància dreta

        boolean ok = true;

        if (pi == 0) {                 // hi ha un submòbil a l'esquerra
            int sub = llegirMobil(sc);
            if (sub == -1) ok = false;
            else pi = sub;
        }
        if (pd == 0) {                 // hi ha un submòbil a la dreta
            int sub = llegirMobil(sc);
            if (sub == -1) ok = false;
            else pd = sub;
        }

        if (!ok) return -1;                       // algun submòbil ja estava desequilibrat
        if (pi * di != pd * dd) return -1;        // esta barra no s'equilibra
        return pi + pd;                           // el pes total d'este mòbil
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            int pi = sc.nextInt();
            int di = sc.nextInt();
            int pd = sc.nextInt();
            int dd = sc.nextInt();

            if (pi == 0 && di == 0 && pd == 0 && dd == 0) break;   // fi de l'entrada

            boolean ok = true;
            if (pi == 0) {
                int sub = llegirMobil(sc);
                if (sub == -1) ok = false;
                else pi = sub;
            }
            if (pd == 0) {
                int sub = llegirMobil(sc);
                if (sub == -1) ok = false;
                else pd = sub;
            }

            boolean equilibrada = ok && pi * di == pd * dd;
            System.out.println(equilibrada ? "SI" : "NO");
        }
    }
}
```

El cas base no és un nombre: el mòbil "fulla" és aquell els dos costats del qual tenen pes > 0 (no hi ha submòbils a llegir). Cada crida recursiva llig i comprova un submòbil complet i torna el seu pes total. El flag `ok` (o el `-1`) propaga cap amunt que TOTES les subbarres estiguen equilibrades. Entrada `0 0 0 0` marca el final de l'entrada.

</details>
