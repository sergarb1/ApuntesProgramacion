---
title: "03 — Cerca binària"
description: "El cercador Jedi: descarta mitja tona de paper en cada intent 🕯️"
---

<p><small>El cercador Jedi: descarta mitja tona de paper en cada intent 🕯️</small></p>

> 🗺️ **Estàs en:** 🧩 **U04 · Algorítmica I: Fonaments** → 03 · Cerca binària

---

## 📬 La idea en una frase

> **La cerca binària obri el "diccionari" per la meitat, compara, i descarta mitja tona de paper en cada intent. Només funciona si l'array està ordenat.**

Buscar una paraula en un diccionari és un ritual molt concret: no obres per la pàgina 1 i passes d'una en una. Obres per la meitat, veus si la paraula està abans o després, i descartes la meitat del llibre en un gest. I repetix. Això és la cerca binària.

---

## ⚠️ El requisit imprescindible

> **L'array ha d'estar ordenat.** Si no, este mètode no funciona.

I el pitjor de tot: no t'avisa. No hi ha error de compilació, no hi ha excepció, no hi ha "ei, m'has donat escombraria". Simplement obtens la resposta equivocada. És com buscar "berenar" en un diccionari les paraules del qual estan a l'atzar: obrir per la meitat no et servix de res.

---

## 🕯️ L'algoritme

```java
public class CercaBinaria {

    public static int buscar(int[] array, int objectiu) {
        int esquerra = 0;
        int dreta = array.length - 1;

        while (esquerra <= dreta) {
            int mig = esquerra + (dreta - esquerra) / 2;  // meitat del segment
            System.out.println("esquerra=" + esquerra + " dreta=" + dreta + " mig=" + mig);

            if (array[mig] == objectiu) {
                return mig;  // Bingo!
            }

            if (array[mig] < objectiu) {
                esquerra = mig + 1;  // descartem la meitat esquerra
            } else {
                dreta = mig - 1;     // descartem la meitat dreta
            }
        }
        return -1;  // no trobat
    }

    public static void main(String[] args) {
        // COMPTE: ha d'estar ORDENAT
        int[] numeros = {2, 5, 8, 12, 19, 24, 31, 37, 42, 50, 58, 63};

        int resultat = buscar(numeros, 31);
        System.out.println("31 trobat en posició: " + resultat);  // 6

        resultat = buscar(numeros, 3);
        System.out.println("3 trobat en: " + resultat);  // -1
    }
}
```

Anem a traçar la cerca del 31 sobre l'array `{2, 5, 8, 12, 19, 24, 31, 37, 42, 50, 58, 63}` (12 elements):

| Volta | esquerra | dreta | mig | array[mig] | Què passa? |
|---|---|---|---|---|---|
| 1 | 0 | 11 | 5 | 24 | 24 < 31 → esquerra = 6 |
| 2 | 6 | 11 | 8 | 42 | 42 > 31 → dreta = 7 |
| 3 | 6 | 7 | 6 | 31 | Bingo! → retorna 6 |

Tres comparacions. La cerca lineal n'hauria necessitat set. I en un array d'un milió d'elements, la diferència encara és més escandalosa.

---

## 🧮 Per què `esquerra + (dreta - esquerra) / 2` i no `(esquerra + dreta) / 2`?

Perquè si l'array és molt gran (a prop de `Integer.MAX_VALUE` elements), `esquerra + dreta` pot **desbordar-se**: el resultat ja no cap en un `int` i es convertix en un nombre negatiu de sobte. La fórmula alternativa `esquerra + (dreta - esquerra) / 2` evita eixe problema.

> ⚠️ **Advertència:** este és un bug tan famós que va aparéixer fins i tot en la biblioteca de Java original. Du anys col·leccionant trofeus: Bug de l'any, Bug de la dècada, Bug favorit del públic...

---

## ⏱️ L'anàlisi: O(log n)

En cada pas, la cerca binària **descartar la meitat** de l'array restant. Mira com creix el nombre de passos:

- Array de 16 elements → 4 passos màxims
- Array de 32 elements → 5 passos
- Array de 1.024 elements → 10 passos
- Array d'1.000.000 d'elements → 20 passos

Això és **O(log n)**, complexitat logarítmica. Creix molt a poc a poc fins i tot amb dades enormes. És la diferència entre preguntar a mil persones una per una, o preguntar "és a l'esquerra o a la dreta?" i descartar-ne 500 de cop. Amb un milió d'elements, la lineal necessita un milió de passos i la binària només **20**. Torna a llegir-ho. Vint.

> 📝 **Nota:** quan un informàtic diu "log n", pensa en **base 2**: és "meitat, meitat, meitat...". No és el logaritme decimal de tota la vida. Un logaritme en base 2 respon a la pregunta "quantes vegades puc partir entre 2 abans d'arribar a 1?".

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** la cerca binària té una regla d'or: si el mig és menor que l'objectiu, `esquerra = mig + 1`; si és major, `dreta = mig - 1`. El `+1` i el `-1` són sagrats: sense ells, el bucle es pot quedar donant voltes per sempre.

**Exercici: el cercador que no avança**

Sense executar, traça la cerca del nombre **8** en este array ordenat i escriu els valors d'`esquerra`, `dreta` i `mig` en cada volta:

```java
public class Traça {
    public static int buscar(int[] array, int objectiu) {
        int esquerra = 0;
        int dreta = array.length - 1;

        while (esquerra <= dreta) {
            int mig = esquerra + (dreta - esquerra) / 2;
            System.out.println("esquerra=" + esquerra + " dreta=" + dreta + " mig=" + mig);

            if (array[mig] == objectiu) return mig;
            if (array[mig] < objectiu) {
                esquerra = mig + 1;
            } else {
                dreta = mig - 1;
            }
        }
        return -1;
    }

    public static void main(String[] args) {
        int[] dades = {1, 4, 8, 12, 20, 33};
        System.out.println("Resultat: " + buscar(dades, 8));
    }
}
```

<details>
<summary>🔄 Solució</summary>

| Volta | esquerra | dreta | mig | array[mig] | Acció |
|---|---|---|---|---|---|
| 1 | 0 | 5 | 2 | 8 | Bingo! → retorna 2 |

Imprimix:

```
esquerra=0 dreta=5 mig=2
Resultat: 2
```

El 8 és just en el mig de la primera passada, així que l'algoritme fa **una sola comparació**. Este és el millor cas de la cerca binària: trobar l'objectiu en el centre a la primera.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quin requisit imprescindible té la cerca binària?
2. Què passa si l'incomplixes?
3. Quants passos màxims necessita per a un array d'1.000.000 d'elements?
4. Per què s'usa `esquerra + (dreta - esquerra) / 2` en comptes de `(esquerra + dreta) / 2`?

<details>
<summary>🔄 Respostes</summary>

1. Que l'array estiga **ordenat**.
2. Retorna la resposta equivocada **sense avisar**: no hi ha error ni excepció. Silenci i escombraria.
3. **20 passos** — log₂(1.000.000) ≈ 20.
4. Per a evitar el **desbordament**: `esquerra + dreta` pot no cabre en un `int` amb arrays gegants.

</details>

---

## ✅ Resum en 3 frases

1. La cerca binària **dividix el problema a la meitat en cada pas**, comparant l'objectiu amb l'element central.
2. Exigix un array **ordenat**; si no ho està, retorna escombraria sense avisar.
3. La seua complexitat és **O(log n)**: amb un milió d'elements basten ~20 passos, mentre que la lineal necessita un milió.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Meitat | L'element central del segment actual (`mig`) |
> | Descartar | Eliminar la meitat esquerra o dreta del segment |
> | O(log n) | El temps creix molt a poc a poc: cada pas descarta la meitat |
> | Off-by-one | Error de "per un": confondre `<=` amb `<` o `mig+1` amb `mig` |
> | Desbordament | Quan una suma supera el màxim que cap en un `int` |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/04-algoritmica-fundamentos) · **Anterior:** [02 · Cerca lineal](/ApuntesProgramacion/va/04-algoritmica-fundamentos/02-busqueda-lineal) · **Següent:** [04 · Ordenació bombolla](/ApuntesProgramacion/va/04-algoritmica-fundamentos/04-ordenacion-burbuja)
