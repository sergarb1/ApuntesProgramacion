---
title: "04 — Ordenació bombolla"
description: Simple, simpàtica... i la més lenta de les que mereixen la pena 🫧
---

<p><small>Simple, simpàtica... i la més lenta de les que mereixen la pena 🫧</small></p>

> 🗺️ **Estàs en:** 🧩 **U04 · Algorítmica I: Fonaments** → 04 · Ordenació bombolla

---

## 📬 La idea en una frase

> **La bombolla recorre l'array comparant parelles veïnes: si el de l'esquerra és major, els intercanvia. Repetix fins que en una passada no hi haja cap intercanvi. Els grans "pugen" cap al final com bombolles en una copa.**

És l'algoritme d'ordenació més senzill d'entendre... i el més lent dels que mereixen la pena. Però abans d'aprendre a córrer, cal aprendre a caminar. La bombolla és el teu caminador.

---

## 🫧 L'algoritme

```java
public class Bombolla {

    public static void ordenar(int[] array) {
        int n = array.length;
        boolean hiHaIntercanvi;

        for (int i = 0; i < n - 1; i++) {
            hiHaIntercanvi = false;

            for (int j = 0; j < n - 1 - i; j++) {
                if (array[j] > array[j + 1]) {
                    // intercanvi
                    int temp = array[j];
                    array[j] = array[j + 1];
                    array[j + 1] = temp;
                    hiHaIntercanvi = true;
                }
            }

            // si no hi va haver intercanvi, l'array ja està ordenat
            if (!hiHaIntercanvi) break;
        }
    }

    public static void main(String[] args) {
        int[] dades = {64, 34, 25, 12, 22, 11, 90};

        System.out.print("Abans: ");
        for (int nombre : dades) System.out.print(nombre + " ");

        ordenar(dades);

        System.out.print("\nDesprés: ");
        for (int nombre : dades) System.out.print(nombre + " ");
        // 11 12 22 25 34 64 90
    }
}
```

Anem a traçar la primera passada amb un array xicotet, `{5, 2, 9, 1}`:

| Pas | Què compara? | Intercanvia? | Array |
|---|---|---|---|
| 1 | 5 vs 2 | Sí | 2 5 9 1 |
| 2 | 5 vs 9 | No | 2 5 9 1 |
| 3 | 9 vs 1 | Sí | 2 5 1 9 |

El 9, el major, "va pujar" fins al final. En cada passada, el major dels que queden queda col·locat en el seu lloc: el 9, després el 5, després el 2, després el 1. Per això el bucle interior arriba només fins a `n - 1 - i`: ja no cal mirar els elements que van quedar col·locats al final.

---

## 🏎️ Per què és tan lenta?

Dos bucles anidats. Per a un array de `n` elements:

- Primer bucle: `n` vegades.
- Segon bucle: `~n` vegades (en realitat `n-i-1`, però a grans trets `n`).

**Total: ~n × n = n² operacions.** Complexitat **O(n²)**.

- Per a 10 elements → 100 operacions (bé).
- Per a 1.000 elements → 1.000.000 d'operacions (comença a doldre).
- Per a 1.000.000 d'elements → 1.000.000.000.000 d'operacions (el teu ordinador demana la jubilació).

> 💡 **Consell:** la bombolla només s'usa en dos situacions: (1) estàs aprenent, i (2) saps que l'array tindrà menys de 50 elements. Per a tot lo demés hi ha alternatives millors (les veuràs en la U05).

---

## 🚩 L'optimització del flag

Fixa't en la variable `hiHaIntercanvi`. Si en una passada completa no intercanviem res, és que l'array ja està ordenat i podem parar: `break`. Sense este flag, la bombolla faria totes les passades encara que l'array arribara ordenat en la primera.

Esta optimització **no millora el pitjor cas** (array invertit: cal intercanviar-ho tot), però convertix el millor cas (array ja ordenat) en O(n): una sola passada de comprovació i llest.

> 💡 **Detall pràctic:** el patró del flag ("marca si ha passat alguna cosa; si no, para") apareix en moltíssims algoritmes reals. És una d'eixes idees que et faran semblar programador sènior encara que només portes quatre unitats.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** quan veges `array[j] > array[j + 1]`, pensa "estic ordenant **de menor a major**". Si vols el contrari, canvia la fletxa. La resta de l'algoritme no canvia ni una coma.

**Exercici: la bombolla que es queda curta**

Sense executar, escriu l'eixida exacta d'este programa:

```java
public class BombollaCurta {
    public static void main(String[] args) {
        int[] dades = {3, 1, 2};

        for (int i = 0; i < dades.length - 1; i++) {
            for (int j = 0; j < dades.length - 1 - i; j++) {
                if (dades[j] > dades[j + 1]) {
                    int temp = dades[j];
                    dades[j] = dades[j + 1];
                    dades[j + 1] = temp;
                }
            }
        }

        for (int nombre : dades) {
            System.out.print(nombre + " ");
        }
    }
}
```

<details>
<summary>🔄 Solució</summary>

Imprimix **`1 2 3`**.

Traça sense el flag (este programa no té `hiHaIntercanvi`):

| Passada | j | Compara? | Array |
|---|---|---|---|
| 1 | 0 | 3 vs 1 → sí | 1 3 2 |
| 1 | 1 | 3 vs 2 → sí | 1 2 3 |
| 2 | 0 | 1 vs 2 → no | 1 2 3 |

Sense el flag, la bombolla fa una passada extra de comprovació. El resultat és el mateix, però en un array ja ordenat de 1.000 elements faria totes les passades sense necessitat. Ahí guanya la versió amb `break`.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Per què el bucle interior de la bombolla només arriba fins a `n - 1 - i`?
2. Quina és la complexitat de la bombolla en el pitjor cas?
3. Què fa la variable `hiHaIntercanvi`?
4. Quan està justificat usar la bombolla en un programa real?

<details>
<summary>🔄 Respostes</summary>

1. Perquè després de cada passada, el major dels elements restants ja va quedar **col·locat al final**, i no cal tornar-lo a mirar.
2. **O(n²)** — dos bucles anidats.
3. Detecta si en la passada hi va haver intercanvis: si no n'hi va haver cap, l'array ja està ordenat i es fa `break`.
4. Només per a aprendre, o amb arrays de **menys de ~50 elements**. Per a la resta, espera a la U05.

</details>

---

## ✅ Resum en 3 frases

1. La bombolla compara **parelles veïnes** i intercanvia les que estan desordenades, passada rere passada.
2. La seua complexitat és **O(n²)**: funciona, però és lenta amb dades grans.
3. El flag `hiHaIntercanvi` l'optimitza per a arrays quasi ordenats, convertint el millor cas en O(n).

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Intercanvi | Canviar dos elements entre si usant una variable temporal |
> | Passada | Un recorregut complet del bucle interior |
> | Flag | Variable booleana que marca si alguna cosa va ocórrer durant la passada |
> | O(n²) | El temps creix al quadrat: dos bucles anidats |
> | In-place | Ordena modificant el mateix array, sense memòria extra |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/04-algoritmica-fundamentos) · **Anterior:** [03 · Cerca binària](/ApuntesProgramacion/va/04-algoritmica-fundamentos/03-busqueda-binaria) · **Següent:** [05 · Ordenació per inserció](/ApuntesProgramacion/va/04-algoritmica-fundamentos/05-ordenacion-insercion)
