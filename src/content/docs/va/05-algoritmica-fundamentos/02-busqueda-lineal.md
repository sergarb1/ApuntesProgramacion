---
title: "02 — Cerca lineal"
description: "El cercador de sabatilles perdudes: revisa cada lloc fins a trobar el que busques 👟"
---

<p><small>El cercador de sabatilles perdudes: revisa cada lloc fins a trobar el que busques 👟</small></p>

> 🗺️ **Estàs en:** 🧩 **U05 · Algorítmica I: Fonaments** → 02 · Cerca lineal

---

## 📬 La idea en una frase

> **La cerca lineal recorre l'array element per element fins a trobar l'objectiu (o fins a comprovar que no hi és). Simple, directa i funciona encara que les dades estiguen desordenades.**

Imagina que perds una sabatilla en la teua habitació. Què fas? Mires davall del llit, darrere de la porta, en l'armari... bàsicament **revises cada lloc fins a trobar-la**. Doncs això és la cerca lineal: vas un a un, sense dreceres.

---

## 👟 L'algoritme

```java
public class CercaLiniaal {

    public static int buscar(int[] array, int objectiu) {
        for (int i = 0; i < array.length; i++) {
            if (array[i] == objectiu) {
                return i;  // Trobat! Retorna la posició
            }
        }
        return -1;  // No és en l'array
    }

    public static void main(String[] args) {
        int[] numeros = {34, 12, 56, 78, 23, 9, 45, 67};

        int resultat = buscar(numeros, 23);
        if (resultat != -1) {
            System.out.println("Trobat el 23 en la posició " + resultat + "!");
        } else {
            System.out.println("El 23 no és en l'array.");
        }

        resultat = buscar(numeros, 99);
        if (resultat == -1) {
            System.out.println("El 99 no hi és. Com unes sabatilles que mai no apareixen.");
        }
    }
}
```

Eixida:

```
Trobat el 23 en la posició 4!
El 99 no hi és. Com unes sabatilles que mai no apareixen.
```

Detalls del mètode `buscar`:

- Recorre l'array amb un `for` des de la posició 0 fins a `array.length - 1`.
- Si troba l'objectiu, **retorna el seu índex** i para: el `return` talla el mètode sencer.
- Si acaba el bucle sense trobar res, retorna `-1`, el "índex impossible" que usem com a senyal de *no trobat*.

> 💡 **Detall pràctic:** retornar `-1` és la convenció clàssica de "no hi és". No retornes mai `0` per a dir "no trobat", perquè `0` és una posició vàlida: la primera. Eixe error és el clàssic "bug de l'índex zero".

---

## ⏱️ Com de ràpida és?

En el **millor cas**, l'element és en la primera posició → 1 pas.

En el **pitjor cas**, l'element és al final, o no existix → recorres els `n` elements sencers.

Diem que la seua complexitat és **O(n)**, lineal. Si l'array té 10 elements, tardes ~10 passos; si en té 10.000, tardes ~10.000. Creix al mateix ritme que les dades.

> 💡 **Consell:** la cerca lineal és com buscar en la teua nevera: si és xicoteta, tant li fa el mètode. Però si tens un magatzem de 10.000 productes, necessites alguna cosa millor... i en el pròxim punt la trobes.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** quan un mètode retorna un índex, els dos camins d'eixida són: `return` quan el trobes, `return -1` quan el bucle acaba. Si mescles això, el programa es comporta com una gavina: confon els llocs.

**Exercici: el cercador que es perd**

Sense executar, calcula quantes comparacions fa este programa i què imprimix:

```java
public class Cerca2 {
    public static int buscar(int[] array, int objectiu) {
        int passos = 0;
        for (int i = 0; i < array.length; i++) {
            passos++;
            if (array[i] == objectiu) {
                System.out.println("He necessitat " + passos + " passos.");
                return i;
            }
        }
        System.out.println("He necessitat " + passos + " passos.");
        return -1;
    }

    public static void main(String[] args) {
        int[] dades = {3, 8, 1, 9, 5, 2};
        int resultat = buscar(dades, 9);
        System.out.println("Posició: " + resultat);
    }
}
```

<details>
<summary>🔄 Solució</summary>

El 9 és en la posició 3 (índex 3, el quart element). El bucle compara: `3` (pas 1), `8` (pas 2), `1` (pas 3), `9` (pas 4) → el troba. Imprimix:

```
He necessitat 4 passos.
Posició: 3
```

Fixa't que el `for` **no** recorre tot l'array: s'atura tan bon punt el `return` talla el mètode. Eixe és el poder del `return` com a "break" d'emergència.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què retorna la cerca lineal quan l'element no és en l'array?
2. Funciona la cerca lineal amb arrays desordenats?
3. Per què es diu que és O(n)?
4. Què imprimiria `buscar(new int[]{5, 5, 5}, 5)`? Quina posició retorna?

<details>
<summary>🔄 Respostes</summary>

1. Retorna `-1`, la senyal clàssica de "no trobat".
2. **Sí.** Eixa és la seua gran avantatge: no exigix cap ordre previ.
3. Perquè en el pitjor cas recorre els `n` elements de l'array: el temps creix en proporció directa amb les dades.
4. Retorna la posició **0** (el primer `5`), perquè el `return` talla tan bon punt troba el primer. La posició 0 és vàlida i diferent de "no trobat".

</details>

---

## ✅ Resum en 3 frases

1. La cerca lineal recorre l'array **element per element** fins a trobar l'objectiu o esgotar la llista.
2. Retorna l'**índex** de l'element, o `-1` si no existix, i funciona amb dades **desordenades**.
3. La seua complexitat és **O(n)**: perfecta per a arrays xicotets, lenta per als grans.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Índex | Posició d'un element dins de l'array (comença en 0) |
> | Recórrer | Visitar cada element de l'array un a un |
> | -1 | L'"índex impossible": senyal que l'element no hi és |
> | O(n) | El temps creix en proporció directa al nombre d'elements |
> | Millor cas | L'element és el primer: 1 sol pas |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/05-algoritmica-fundamentos) · **Anterior:** [01 · Què és un algoritme](/ApuntesProgramacion/va/05-algoritmica-fundamentos/01-que-es-algoritmo) · **Següent:** [03 · Cerca binària](/ApuntesProgramacion/va/05-algoritmica-fundamentos/03-busqueda-binaria)
