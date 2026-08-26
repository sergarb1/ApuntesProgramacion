---
title: "05 — Ordenació per inserció"
description: Ordena les cartes de la mà com un crupier veterà 🃏
---

<p><small>Ordena les cartes de la mà com un crupier veterà 🃏</small></p>

> 🗺️ **Estàs en:** 🧩 **U04 · Algorítmica I: Fonaments** → 05 · Ordenació per inserció

---

## 📬 La idea en una frase

> **La inserció pren cada element com una carta nova i el col·loca en el seu lloc dins de les que ja tens ordenades a la mà. Com ordenar cartes en el pòquer.**

Quan et reparteixen cartes, no les tires totes sobre la taula i comences de zero: vas col·locant cada carta nova en el seu buit dins de la mà que ja tens ordenada. El 7 entre el 5 i el 9, el 3 al principi, la K al final. Doncs això, però en Java.

---

## 🃏 L'algoritme

```java
public class Insercio {

    public static void ordenar(int[] array) {
        for (int i = 1; i < array.length; i++) {
            int clau = array[i];  // la carta que anem a col·locar
            int j = i - 1;

            // desplaçar els majors cap a la dreta
            while (j >= 0 && array[j] > clau) {
                array[j + 1] = array[j];
                j--;
            }
            array[j + 1] = clau;  // col·locar la carta en el seu lloc
        }
    }

    public static void main(String[] args) {
        int[] dades = {9, 5, 1, 4, 3};

        System.out.print("Abans: ");
        for (int nombre : dades) System.out.print(nombre + " ");

        ordenar(dades);

        System.out.print("\nDesprés: ");
        for (int nombre : dades) System.out.print(nombre + " ");
        // 1 3 4 5 9
    }
}
```

El truc està en el `while` interior: guardes la `clau` (la carta nova), i mentre hi haja cartes majors que ella a la seua esquerra, les desplaces una posició a la dreta. Quan trobes una menor (o arribes al principi), eixa és la posició de la clau. La "mà" esquerra sempre està ordenada.

---

## 👣 Pas a pas

Donat `{9, 5, 1, 4, 3}`, mira com creix la "mà" (el que hi ha a l'esquerra de la barra):

```
Pas 0: [9] | 5 1 4 3   → la mà comença amb el 9
Pas 1: [5 9] | 1 4 3   → el 5 es col·loca a l'esquerra del 9
Pas 2: [1 5 9] | 4 3   → l'1 es cola al principi
Pas 3: [1 4 5 9] | 3   → el 4 entra entre l'1 i el 5
Pas 4: [1 3 4 5 9]     → el 3 entra entre l'1 i el 4
```

Cada element nou s'"inserta" en el seu lloc. D'ací el nom. La mà esquerra sempre està ordenada; la resta de l'array espera el seu torn.

---

## 📊 L'anàlisi: quan és bona?

També és **O(n²)** en el pitjor cas (array invertit: cada element ha de viatjar fins al principi). Però té truc:

- **Millor cas (array quasi ordenat):** O(n). Només fa una passada de comprovació. És rapidíssima.
- És **estable**: manté l'ordre relatiu dels elements iguals.
- **No necessita memòria extra**: ordena in-place, modificant el mateix array.
- En la pràctica, és **més ràpida que la bombolla**, encara que totes dos siguen O(n²).

> 💡 **Consell:** la inserció és la reina de les dades **quasi ordenades**. Si saps que el teu array té 100 elements i ja està "quasi bé" (només un parell d'elements fora de lloc), la inserció et sorprendrà. De fet, s'usa com a pas final en algoritmes avançats (TimSort, el que usa Java per defecte en les seues col·leccions).

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** en la inserció, la variable `clau` és l'única que "sobreviu" al desplaçament. Si la usares per a una altra cosa, la perdries en sobrescriure `array[j + 1]`. Guarda-la com un tresor: és la teua carta.

**Exercici: la mà que es desordena**

Sense executar, escriu l'eixida exacta d'este programa:

```java
public class Insercio2 {
    public static void main(String[] args) {
        int[] dades = {4, 2};

        for (int i = 1; i < dades.length; i++) {
            int clau = dades[i];
            int j = i - 1;
            while (j >= 0 && dades[j] > clau) {
                dades[j + 1] = dades[j];
                j--;
            }
            dades[j + 1] = clau;
        }

        System.out.println(dades[0] + " " + dades[1]);
    }
}
```

<details>
<summary>🔄 Solució</summary>

Imprimix **`2 4`**.

Amb només dos elements, la inserció és quasi ridícula de simple: `clau = 2`, `j = 0`. Com que `4 > 2`, desplaça el 4 a la posició 1 i `j` passa a `-1`. El `while` acaba (perquè `j >= 0` ja no es complix) i la clau es col·loca en `dades[0]`. Resultat: `{2, 4}`. La clau va viatjar fins al principi: eixe és el mecanisme exacte que, repetit, ordena arrays sencers.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. En què es diferencia la inserció de la bombolla a l'hora d'ordenar?
2. Quina és la complexitat de la inserció en el seu millor cas i per què?
3. Què significa que siga "estable"?
4. Per què es diu que no necessita memòria extra?

<details>
<summary>🔄 Respostes</summary>

1. La bombolla intercanvia **veïns** en cada passada; la inserció **col·loca cada element en el seu lloc** desplaçant els majors una posició.
2. **O(n)** — amb un array quasi ordenat, cada element només necessita una comprovació i es queda on està.
3. Que manté l'**ordre relatiu** dels elements iguals entre si (si "Anna" venia abans que "Lluís" i tenen la mateixa edat, continua venint abans).
4. Perquè ordena **in-place**: modifica l'array original, sense crear estructures auxiliars.

</details>

---

## ✅ Resum en 3 frases

1. La inserció pren cada element com una **carta nova** i el col·loca en el seu lloc dins de la part ja ordenada.
2. És **O(n²)** en el pitjor cas, però **O(n)** amb dades quasi ordenades: la reina dels arrays quasi llestos.
3. És **estable**, no usa memòria extra i en la pràctica supera la bombolla.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Clau | L'element actual que estem col·locant en el seu lloc |
> | Desplaçar | Moure un element una posició cap a la dreta |
> | Mà | La part de l'array ja ordenada (a l'esquerra) |
> | Estable | Respecta l'ordre relatiu dels elements iguals |
> | In-place | Ordena sense necessitat d'arrays auxiliars |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/04-algoritmica-fundamentos) · **Anterior:** [04 · Ordenació bombolla](/ApuntesProgramacion/va/04-algoritmica-fundamentos/04-ordenacion-burbuja) · **Següent:** [06 · Complexitat algorísmica: Big O](/ApuntesProgramacion/va/04-algoritmica-fundamentos/06-complejidad-big-o)
