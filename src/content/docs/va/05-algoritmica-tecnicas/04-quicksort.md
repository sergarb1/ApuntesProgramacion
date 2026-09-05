---
title: "04 — Quicksort: el ràpid"
description: L'algorisme d'ordenació més famós del món, amb la seua partició, el seu pivot i les seues manies 🚀
---

<p><small>L'algorisme d'ordenació més famós del món, amb la seua partició, el seu pivot i les seues manies 🚀</small></p>

> 🗺️ **Estàs en:** ⚡ **U05 · Algorítmica II: Tècniques** → 04 · Quicksort

---

## 📬 La idea en una frase

> **Quicksort tria un pivot, partix l'array en menors i majors al seu voltant, i repetix recursivament en cada meitat: divide i venceràs en estat pur.**

Creat per **Tony Hoare** el 1959. Sí, té més anys que els teus pares. I continua sent l'algorisme d'ordenació més usat del món. Per alguna cosa serà.

---

## 🎯 Com funciona

1. Triem un **pivot** (un element de l'array).
2. Col·loquem tots els elements **menors** que el pivot a la seua esquerra i els **majors** a la seua dreta. Això es diu **particionar**.
3. Apliquem el mateix procés recursivament a les dues zones (esquerra i dreta del pivot).

Quan l'array té 0 o 1 elements... ja està ordenat. Cas base.

---

## 🛠️ Implementació

```java
public class Quicksort {

    static void qs(int[] arr, int izq, int der) {
        if (izq >= der) return;   // cas base: 0 o 1 elements

        int pivote = arr[(izq + der) / 2];  // triem el del mig
        int i = izq, j = der;

        // partició
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

        // crides recursives a cada zona
        qs(arr, izq, j);
        qs(arr, i, der);
    }

    public static void main(String[] args) {
        int[] datos = {9, 3, 7, 1, 8, 2, 6, 4, 5};
        qs(datos, 0, datos.length - 1);
        System.out.println(java.util.Arrays.toString(datos));
    }
}
```

**Execució pas a pas** amb `{3, 1, 4, 1, 5, 9, 2, 6}` (primera partició):

```
Array inicial:  [3, 1, 4, 1, 5, 9, 2, 6]
Pivot = arr[(0 + 7) / 2] = arr[3] = 1
Posicions i=0, j=7

1. i no avança (arr[0]=3 no és < 1); j retrocedeix fins a 3 (arr[3]=1 no és > 1)
2. i(0) <= j(3): intercanviem arr[0] i arr[3] → [1, 1, 4, 3, 5, 9, 2, 6]; i=1, j=2
3. i no avança (arr[1]=1 no és < 1); j retrocedeix a 1 (arr[2]=4 > 1)
4. i(1) <= j(1): s'intercanvia amb si mateix; i=2, j=0 → i > j, fi de la partició
5. Recursió esquerra: segment [0..0] (un sol element, ja ordenat)
6. Recursió dreta: segment [2..7] → [4, 3, 5, 9, 2, 6], amb pivot 5
...
```

Fixa't: el pivot (1) ha quedat ben col·locat i l'array s'ha partit en `[1]` i `[4, 3, 5, 9, 2, 6]`. Cada zona s'ordena igual, recursivament. Si tries un pivot diferent, els intercanvis canvien, però el patró és el mateix.

> [!TIP]
> El secret de Quicksort està en la **partició**. Si aconseguixes que els elements es repartisquen més o menys equilibradament, l'algorisme vola. Si no... prepara els O(n²).

---

## 🎚️ Elecció del pivot

| Estratègia | Avantatge | Desavantatge |
|---|---|---|
| Primer element | Simple | Pèssim si l'array ja està ordenat |
| Últim element | Simple | Pèssim si l'array ja està ordenat |
| Element central | Millor equilibri | Seguix tenint casos dolents |
| Mediana de tres (primer, mig, últim) | Molt robust | Un poc més de càlcul |
| Aleatori | Evita el cas pitjor en la pràctica | Aleatorietat no determinista |

> [!WARNING]
> Si tries sempre el primer element com a pivot i l'array ja està ordenat, Quicksort es torna més lent que una tortuga amb ressaca: **O(n²)**, literalment pitjor que un `for` anidat cutre. Per això en producció ningú usa "primer element" a seques.

---

## 📊 Complexitat

- **Cas mitjà**: O(n log n) — quasi sempre.
- **Millor cas**: O(n log n) — quan el pivot dividix sempre en meitats iguals.
- **Pitjor cas**: O(n²) — quan el pivot és sempre el menor o el major (array ja ordenat amb mal pivot).
- **Memòria**: O(log n) extra (per l'stack de les crides recursives). No necessita arrays auxiliars: ordena *in-place*.

---

## 🚫 És estable?

**No.** Durant la partició, dos elements iguals poden intercanviar-se de posició. Si necessites estabilitat (conservar l'ordre original dels elements iguals), millor usa Mergesort.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quines són les tres parts de Quicksort?
2. Quin és el pitjor cas de Quicksort i quan ocorre?
3. Quina estratègia de pivot fa que el pitjor cas "quasi mai" ocórrega en la pràctica?
4. És Quicksort estable?

<details>
<summary>🔄 Respostes</summary>

1. Triar **pivot**, **particionar** (menors a un costat, majors a l'altre) i **cridar recursivament** cada zona.
2. **O(n²)**, quan el pivot és sempre el menor o el major de la seua zona (típic amb array ordenat i pivot = primer element).
3. La **mediana de tres** o el **pivot aleatori**: repartixen l'array de forma equilibrada i eviten els casos dolents en la pràctica.
4. **No**. En la partició, elements iguals poden canviar el seu ordre relatiu.

</details>

---

## ✅ Resum en 3 frases

1. Quicksort **particiona** al voltant d'un pivot i repetix recursivament en cada zona: divide i venceràs.
2. El seu **cas mitjà** és O(n log n) i el **pitjor cas** O(n²), que s'evita amb una bona elecció de pivot.
3. És **in-place** (memòria O(log n)) i **no estable**; el treball important ocorre en la partició.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Pivot | L'element que dividix l'array en menors i majors |
> | Partició | Repartir elements al voltant del pivot |
> | In-place | Ordenar sense arrays auxiliars, movent el propi array |
> | Estable | Que conserva l'ordre original dels elements iguals |
> | O(n log n) | Complexitat "quasi lineal": l'estàndard de l'ordenació moderna |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/05-algoritmica-tecnicas) · **Anterior:** [03 · Divide i venceràs](/ApuntesProgramacion/va/05-algoritmica-tecnicas/03-divide-y-venceras) · **Següent:** [05 · Mergesort](/ApuntesProgramacion/va/05-algoritmica-tecnicas/05-mergesort)
