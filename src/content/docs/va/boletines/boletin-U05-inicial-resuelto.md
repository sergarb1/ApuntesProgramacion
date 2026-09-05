---
title: Butlletí U05 — Inicial Resolt
description: Els mateixos exercicis que el butlletí inicial, amb solucions
---

# 📝 Butlletí U05 — Inicial (Resolt)

> Les solucions estan amagades en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## Exercici 1: Què imprimeix? — la cerca de la gema

<details>
<summary>🔄 Solució</summary>

Imprimix **`Posició: 3`**.

Recorregut: `cofre[0] = 12` (no), `cofre[1] = 7` (no), `cofre[2] = 25` (no), `cofre[3] = 9` (sí!). Guardem `posicio = 3` i el `break` talla el bucle. No cal seguir buscant: ja està.

</details>

---

## Exercici 2: El buscador de tresors

<details>
<summary>🔄 Solució</summary>

```java
public static int buscar(int[] dades, int objectiu) {
    for (int i = 0; i < dades.length; i++) {
        if (dades[i] == objectiu) {
            return i;
        }
    }
    return -1;
}
```

Si el troba, el `return i` retorna l'índex i talla el mètode a l'instant. Només si el bucle acaba sencer sense trobar-lo, s'executa el `return -1`. Eixe `-1` és la contrasenya universal del "no trobat" que usa tota la indústria.

</details>

---

## Exercici 3: Què imprimeix? — la bombolla mínima

<details>
<summary>🔄 Solució</summary>

Imprimix **`1 2 3 `**.

Traça de la bombolla sobre `{3, 1, 2}`:

| Passada | j | Compara | Intercanvia | Array |
|---|---|---|---|---|
| 1 | 0 | 3 vs 1 | Sí | 1 3 2 |
| 1 | 1 | 3 vs 2 | Sí | 1 2 3 |
| 2 | 0 | 1 vs 2 | No | 1 2 3 |

La passada 2 només comprova (el `-1 - i` reduïx el recorregut) i confirma que ja està ordenat.

</details>

---

## Exercici 4: La capsa de sabates ordenada

<details>
<summary>🔄 Solució</summary>

```java
public static void ordenar(int[] dades) {
    for (int i = 1; i < dades.length; i++) {
        int clau = dades[i];
        int j = i - 1;

        while (j >= 0 && dades[j] > clau) {
            dades[j + 1] = dades[j];
            j--;
        }
        dades[j + 1] = clau;
    }
}

// En main:
int[] capsa = {9, 2, 7, 1};
ordenar(capsa);
for (int num : capsa) {
    System.out.print(num + " ");
}
```

Eixida: `1 2 7 9 `

Sobre `{9, 2, 7, 1}`: el 2 es cola a l'esquerra del 9, el 7 entra entre el 2 i el 9, i l'1 viatja fins al principi. Cada element s'inserix en el seu lloc dins de la "mà" ja ordenada.

</details>

---

## Exercici 5: El detectiu de la cerca binària

<details>
<summary>🔄 Solució</summary>

```java
public static int cercaBinaria(int[] dades, int objectiu) {
    int esquerra = 0;
    int dreta = dades.length - 1;

    while (esquerra <= dreta) {
        int mig = esquerra + (dreta - esquerra) / 2;

        if (dades[mig] == objectiu) {
            return mig;
        } else if (dades[mig] < objectiu) {
            esquerra = mig + 1;
        } else {
            dreta = mig - 1;
        }
    }
    return -1;
}
```

Per al 23: mig = 4 (16 < 23 → esquerra = 5), mig = 7 (56 > 23 → dreta = 6), mig = 5 (23 → retorna 5). Per al 30: descarta i descarta fins que `esquerra` supera `dreta` i cau el `return -1`. Els `+1`/`-1` són els que garanteixen que el segment sempre es reduïx.

</details>

---

## Exercici 6: Què imprimeix? — la binària que falla

<details>
<summary>🔄 Solució</summary>

Imprimix **`false`**.

El 35 no està en l'array. La binària va descartant meitats: mig = 2 (30 < 35 → esquerra = 3), mig = 4 (50 > 35 → dreta = 3), mig = 3 (40 > 35 → dreta = 2). Ara `esquerra = 3` > `dreta = 2`, el `while` acaba i `trobat` seguix en `false`. Sense error, sense drama: el "no trobat" també es comunica.

</details>

---

## Exercici 7: El comptador d'intercanvis

<details>
<summary>🔄 Solució</summary>

```java
public class ComptadorIntercanvis {
    public static void main(String[] args) {
        int[] dades = {5, 2, 9, 1, 5};
        int intercanvis = 0;

        for (int i = 0; i < dades.length - 1; i++) {
            for (int j = 0; j < dades.length - 1 - i; j++) {
                if (dades[j] > dades[j + 1]) {
                    int temp = dades[j];
                    dades[j] = dades[j + 1];
                    dades[j + 1] = temp;
                    intercanvis++;
                }
            }
        }

        System.out.println("Intercanvis: " + intercanvis);
    }
}
```

Eixida: `Intercanvis: 5`

Cada vegada que el `if` dispara un intercanvi, sumem 1 al comptador. Amb els dos 5 (repetits), la bombolla no els intercanvia entre si (perquè `5 > 5` és `false`): la comparació estricta manté l'ordre relatiu dels iguals. Ordenat: `{1, 2, 5, 5, 9}`.

</details>

---

## Exercici 8: La nota més alta de la classe

<details>
<summary>🔄 Solució</summary>

```java
public static int notaMaxima(int[] notes) {
    int maxim = notes[0];

    for (int i = 1; i < notes.length; i++) {
        if (notes[i] > maxim) {
            maxim = notes[i];
        }
    }
    return maxim;
}
```

Inicialitzem `maxim` amb el primer element (no amb 0, per si hi haguera notes negatives) i comparem amb els altres. Recorregut lineal O(n): un sol bucle. Retorna 10.

</details>

---

## Exercici 9: CodeWars — Find the smallest integer in the array

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static int findSmallestInt(int[] args) {
        int minim = args[0];

        for (int i = 1; i < args.length; i++) {
            if (args[i] < minim) {
                minim = args[i];
            }
        }
        return minim;
    }
}
```

El mirall de l'exercici 8: en comptes de buscar el màxim, busquem el mínim. `args[0]` com a valor inicial i un sol recorregut. O(n): no pots fer-ho més ràpid sense mirar cada element almenys una vegada.

</details>
