---
title: "05 — Mergesort: el fiable"
description: "L'algorisme que sempre complix el que promet: O(n log n) passe el que passe 🤝"
---

<p><small>L'algorisme que sempre complix el que promet: O(n log n) passe el que passe 🤝</small></p>

> 🗺️ **Estàs en:** ⚡ **U05 · Algorítmica II: Tècniques** → 05 · Mergesort

---

## 📬 La idea en una frase

> **Mergesort dividix l'array per la meitat, ordena cada meitat recursivament i després fusiona les dues meitats ordenades en una de sola: el "divide i venceràs" sense trampes.**

Creat per **John von Neumann** el 1945. Sí, el mateix de l'arquitectura d'ordinadors. El tio no parava.

---

## 🎯 Com funciona

1. **Dividir** l'array en dues meitats (per la meitat exactament; no cal triar pivot).
2. **Ordenar** cada meitat recursivament.
3. **Fusionar** (merge) les dues meitats ordenades en un únic array ordenat.

```
[7, 3, 9, 1, 8, 2, 6, 4]
         │
    ┌────┴────┐
 [7, 3, 9, 1] [8, 2, 6, 4]
    │            │
 ┌──┴──┐      ┌──┴──┐
[7, 3] [9, 1] [8, 2] [6, 4]
  │      │      │      │
┌─┴─┐  ┌─┴─┐  ┌─┴─┐  ┌─┴─┐
[7] [3] [9] [1] [8] [2] [6] [4]   ← cas base
  │      │      │      │
└─┬─┘  └─┬─┘  └─┬─┘  └─┬─┘
[3, 7] [1, 9] [2, 8] [4, 6]       ← fusionar
    │            │
 ┌──┴──┐      ┌──┴──┐
[1, 3, 7, 9] [2, 4, 6, 8]          ← fusionar
    │            │
 ┌──┴────────────┘
[1, 2, 3, 4, 6, 7, 8, 9]          ← fusionar
```

---

## 🛠️ Implementació

```java
public class Mergesort {

    static void ms(int[] arr, int izq, int der) {
        if (izq >= der) return;  // cas base

        int mid = (izq + der) / 2;
        ms(arr, izq, mid);                   // ordenar meitat esquerra
        ms(arr, mid + 1, der);               // ordenar meitat dreta
        fusionar(arr, izq, mid, der);         // combinar les dues meitats
    }

    static void fusionar(int[] arr, int izq, int mid, int der) {
        int[] tmp = new int[der - izq + 1];
        int i = izq, j = mid + 1, k = 0;

        // comparar elements de les dues meitats
        while (i <= mid && j <= der)
            tmp[k++] = (arr[i] <= arr[j]) ? arr[i++] : arr[j++];

        // copiar el que quede de la meitat esquerra
        while (i <= mid) tmp[k++] = arr[i++];

        // copiar el que quede de la meitat dreta
        while (j <= der) tmp[k++] = arr[j++];

        // copiar l'array temporal a l'original
        System.arraycopy(tmp, 0, arr, izq, tmp.length);
    }

    public static void main(String[] args) {
        int[] datos = {9, 3, 7, 1, 8, 2, 6, 4, 5};
        ms(datos, 0, datos.length - 1);
        System.out.println(java.util.Arrays.toString(datos));
    }
}
```

> [!TIP]
> La **fusió** és la part interessant. Imagina dos pilons de cartes ja ordenats: compares les cartes superiors i te'n portes la menor, una vegada i una altra. Com dues cues de supermercat que s'unixen en una caixa i sempre passa el primer de cada cua.

---

## 📊 Complexitat

- **Sempre**: O(n log n). No importa com estiga l'array. Mergesort no té cas dolent.
- **Memòria**: O(n) extra per l'array temporal `tmp`. Eixe és el seu punt feble.

L'estructura és la típica de divide i venceràs: hi ha `log n` nivells de divisió, i en cada nivell es fa un treball total de `O(n)` (fusionar tots els fragments d'eixe nivell). Resultat: `n · log n`.

---

## ✅ És estable?

**Sí.** Quan dos elements són iguals, el de l'esquerra va primer en la fusió (fixa't en el `<=` de la condició). Això manté l'ordre original dels elements iguals, una cosa que Quicksort no pot garantir.

> [!NOTE]
> L'estabilitat no és un concepte teòric avorrit. És important quan ordenes per múltiples criteris. Per exemple, si ordenes una llista d'alumnes per nota i després per nom, vols que els que tenen la mateixa nota mantinguen l'ordre alfabètic. Mergesort t'ho dona. Quicksort et fa plorar.

---

## 🏆 Quan brilla Mergesort

- Quan necessites **estabilitat** a tot preu.
- Quan l'array està **quasi ordenat** o ple de duplicats (no li afecta).
- Quan les dades no caben en memòria: el **mergesort extern** (fusionant trossos en disc) és la base de l'ordenació de les bases de dades.

I el seu punt feble: si la memòria és justa (sistemes encastats, mòbils amb poca RAM), l'array temporal de O(n) pot doldre.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quin és el cas dolent de Mergesort?
2. Quin és el seu punt feble davant de Quicksort?
3. Per què és estable?
4. En què es diferencia la seua "divisió" de la de Quicksort?

<details>
<summary>🔄 Respostes</summary>

1. **No en té**: sempre és O(n log n), passe el que passe l'array.
2. La **memòria extra** de O(n) per l'array temporal `tmp`.
3. Perquè en la fusió, quan dos elements són iguals, es copia primer el de la meitat esquerra (el `<=`).
4. Quicksort partix al voltant d'un **pivot**; Mergesort talla **per la meitat exacta**, sense triar pivot.

</details>

---

## ✅ Resum en 3 frases

1. Mergesort **dividix per la meitat**, ordena cada meitat i **fusiona** les meitats ordenades.
2. És **sempre O(n log n)** i **estable**, a canvi de O(n) de memòria extra.
3. És l'opció fiable quan importa l'estabilitat o l'ordre inicial és problemàtic.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Fusió (merge) | Combinar dues meitats ordenades en una |
> | Estable | Conserva l'ordre original dels elements iguals |
> | Divide i venceràs | El patró de dividir, conquistar i combinar |
> | Memòria O(n) | Necessita un array auxiliar de la mateixa mida |
> | Mergesort extern | Variant que ordena dades que no caben en RAM (discs) |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/05-algoritmica-tecnicas) · **Anterior:** [04 · Quicksort](/ApuntesProgramacion/va/05-algoritmica-tecnicas/04-quicksort) · **Següent:** [06 · Comparació: quan usar cada ordenació](/ApuntesProgramacion/va/05-algoritmica-tecnicas/06-comparacion-ordenacion)
