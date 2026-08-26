---
title: "07 — Be the Code: quicksort des de zero"
description: Tanca la pàgina, obri l'editor i escriu Quicksort i Mergesort tu sol (o patix amb honor) 🕶️
---

<p><small>Tanca la pàgina, obri l'editor i escriu Quicksort i Mergesort tu sol (o patix amb honor) 🕶️</small></p>

> 🗺️ **Estàs en:** ⚡ **U05 · Algorítmica II: Tècniques** → 07 · Be the Code: quicksort des de zero

---

## 📬 La idea en una frase

> **Ja has vist el codi: ara toca esborrar-lo de la memòria i escriure'l tu sol, pas a pas, perquè un algorisme només s'entén de veritat quan et dol implementar-lo.**

> 🕶️ **Don Tip:** Divide i venceràs: tria un pivot, partix l'array en menors i majors, i repetix recursivament. Si domines eixe patró, Quicksort és teu.

---

## 🚦 Exercici guiat 1: Quicksort

Tanca esta pàgina. Obri un editor de text en blanc. No miris ni una línia del que has llegit fins ara.

La firma del mètode ha de ser:

```java
static void quicksort(int[] arr, int inicio, int fin)
```

### Pas 1: el cas base

Quan un array (o una zona de l'array) ja està ordenat? Quan té **0 o 1 elements**. En termes d'índexs:

```java
if (inicio >= fin) return;
```

### Pas 2: triar el pivot

Tria un element qualsevol. El del mig és una opció decent i fàcil d'escriure:

```java
int pivote = arr[(inicio + fin) / 2];
```

### Pas 3: particionar amb dos punters

Dos índexs partixen dels extrems i avancen cap al centre:

- `i` avança des de `inicio` mentre `arr[i] < pivote` (busca un element que *hauria* d'estar a la dreta).
- `j` retrocedix des de `fin` mentre `arr[j] > pivote` (busca un element que *hauria* d'estar a l'esquerra).
- Si `i <= j`, intercanvies i continues.

### Pas 4: cridar recursivament cada zona

Quan `i` i `j` es creuen, la zona esquerra és `[inicio..j]` i la dreta `[i..fin]`:

```java
quicksort(arr, inicio, j);
quicksort(arr, i, fin);
```

### La solució completa (intenta-ho abans de mirar)

<details>
<summary>🔄 Solució de Quicksort</summary>

```java
public class Quicksort {

    static void quicksort(int[] arr, int inicio, int fin) {
        if (inicio >= fin) return;   // cas base

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

**Eixida:** `[1, 2, 3, 4, 5, 6, 7, 8, 9]`

</details>

---

## 🚦 Exercici guiat 2: Mergesort

Mateix joc, mateixa regla: sense mirar. La firma:

```java
static void mergesort(int[] arr, int inicio, int fin)
```

### Pas 1: el cas base

Igual que Quicksort: zona amb 0 o 1 elements, ja ordenada.

### Pas 2: partir per la meitat

```java
int mid = (inicio + fin) / 2;
```

### Pas 3: ordenar cada meitat i fusionar

```java
mergesort(arr, inicio, mid);
mergesort(arr, mid + 1, fin);
fusionar(arr, inicio, mid, fin);   // este mètode l'escrius al pas 4
```

### Pas 4: la fusió, el cor de Mergesort

Dues meitats ordenades es combinen amb un array temporal:

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

### La solució completa (intenta-ho abans de mirar)

<details>
<summary>🔄 Solució de Mergesort</summary>

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

**Eixida:** `[1, 2, 3, 4, 5, 6, 7, 8, 9]`

</details>

---

## ⭐ Nivells de logro

- ⭐ **Ho tens, però has hagut de mirar el codi una vegada.** Aprovat raspadet.
- ⭐⭐ **T'ha eixit a la primera i funciona.** Ets una màquina.
- ⭐⭐⭐ **T'ha eixit a la primera, sense errors d'off-by-one, i a més has triat mediana de tres com a pivot.** No necessites este curs. Vés a donar una xarrada TED.

> [!TIP]
> Pista mental gratuïta: Quicksort necessita **tres coses** — triar un pivot, partir l'array en dues zones (menors i majors), i cridar recursivament cada costat. Si memoritzes eixe patró, Quicksort és teu per sempre. Mergesort, per la seua banda, només necessita **dues** — partir per la meitat i fusionar.

---

## 🧩 El merder

El departament de qualitat ha rebut este Quicksort. Alguna cosa fa mala olor. Troba els **3 errors**:

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

> 🕶️ **Don Tip:** prova a executar-lo amb `{3, 1, 4}` i mira què passa amb el cas base, el lloc del pivot i la variable `i` després del bucle.

<details>
<summary>🔄 Solució del merder</summary>

1. **El cas base és incorrecte**: `if (inicio > fin)` hauria de ser `if (inicio >= fin)`. Amb `inicio == fin` hi ha un sol element (ja ordenat), però este codi continuaria "particionant" i es saltaria elements.
2. **El pivot mai no es col·loca en el seu lloc final**: després del bucle, el pivot (que està a `arr[fin]`) hauria d'intercanviar-se amb `arr[i]` abans de les crides recursives. Sense eixe intercanvi, el pivot es queda fora de la zona correcta.
3. **La partició està incompleta**: falten els `else` per als elements *majors o iguals* al pivot. Així, els duplicats del pivot es repartixen malament i l'algorisme pot deixar d'ordenar correctament.

Amb `{3, 1, 4}` es veu clar: l'`1` no s'intercanvia amb el pivot al final i l'array queda desordenat. La lliçó: **el cas base, la posició final del pivot i els elements iguals són els tres clàssics on mor un Quicksort**.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quan retorna la recursió de Quicksort?
2. Què ocorre quan `i` i `j` es creuen en la partició?
3. Quin és el cas base de Mergesort?
4. Què fan els tres `while` de la fusió?

<details>
<summary>🔄 Respostes</summary>

1. Quan `inicio >= fin`: la zona té **0 o 1 elements** i ja està ordenada.
2. Que la partició ha acabat: la zona esquerra és `[inicio..j]` i la dreta `[i..fin]`.
3. `inicio >= fin`: zona amb **0 o 1 elements**.
4. El primer **comparar i copiar el menor** de les dues meitats; els altres dos **bolquen els restes** que queden de cada meitat.

</details>

---

## ✅ Resum en 3 frases

1. **Quicksort** es reduïx a triar pivot, particionar amb dos punters i cridar recursivament cada zona.
2. **Mergesort** es reduïx a partir per la meitat, ordenar cada meitat i fusionar amb un array temporal.
3. L'off-by-one en els casos base i els elements iguals són els errors clàssics: **prova sempre amb arrays xicotets a mà**.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Off-by-one | Error de "un de més o un de menys" en els índexs |
> | Partició | Repartir menors i majors al voltant del pivot |
> | Punters `i` i `j` | Índexs que avancen des dels extrems fins a creuar-se |
> | Fusió | Combinar dues meitats ordenades en una |
> | Array temporal | El `tmp` de la fusió, que costa O(n) de memòria |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/05-algoritmica-tecnicas) · **Anterior:** [06 · Comparació: quan usar cada ordenació](/ApuntesProgramacion/va/05-algoritmica-tecnicas/06-comparacion-ordenacion) · **Següent:** [08 · Altres tècniques algorísmiques](/ApuntesProgramacion/va/05-algoritmica-tecnicas/08-otras-tecnicas-algoritmicas)
