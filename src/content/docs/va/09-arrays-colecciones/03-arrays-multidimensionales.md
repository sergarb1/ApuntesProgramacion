---
title: "03 — Arrays multidimensionals"
description: "L'aparcament de diverses plantes: arrays de arrays, files i columnes, i com recórrer-los sense perdre't 🏢"
---

<p><small>L'aparcament de diverses plantes: arrays de arrays, files i columnes, i com recórrer-los sense perdre't 🏢</small></p>

> 🗺️ **Estàs en:** 📚 **U09 · Arrays i Col·leccions** → 03 · Arrays multidimensionals

---

## 📬 La idea en una frase

> **Un array multidimensional és un array els elements del qual són altres arrays: un aparcament de diverses plantes, on cada plaça es localitza per planta i número.**

Fins ara cada plaça guardava una dada. I si la dada en si és un altre aparcament? Aleshores tens una taula amb files i columnes. Això és el que uses per a representar taulers, matrius, mapes i qualsevol cosa amb dues (o més) dimensions.

---

## 🏢 L'aparcament de diverses plantes

Un array bidimensional és "un array de arrays". Es declara amb doble claudàtor:

```java
int[][] tabla = new int[3][4]; // 3 files, 4 columnes
```

Pensa-ho com un aparcament amb **3 plantes** i **4 places** per planta. Per a accedir a una plaça necessites dos números: el de la planta (fila) i el de la plaça dins d'ella (columna).

```java
tabla[0][0] = 1; // fila 0, columna 0
tabla[1][2] = 5; // fila 1, columna 2
```

També pots crear-lo ja ple:

```java
int[][] matriz = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9}
};
```

`matriz.length` és el nombre de files (3). `matriz[0].length` és el nombre de columnes de la fila 0 (3).

> 💡 **Consell:** anomena els índexs dels arrays multidimensionals com a `fila` i `col`, o `i` i `j`. NO uses `x` i `y` tret que realment treballes amb coordenades. El teu jo del futur t'ho agrairà.

---

## 🎲 Arrays de arrays irregulars

Java permet "arrays de arrays" on cada fila té un nombre diferent de columnes (els anomenats *jagged arrays*, arrays dentats):

```java
int[][] irregular = new int[3][];
irregular[0] = new int[2];
irregular[1] = new int[5];
irregular[2] = new int[3];
```

La fila 0 té 2 columnes, la fila 1 en té 5 i la fila 2 en té 3. Per a què servix? Triangles, piràmides o simplement dades que no formen un rectangle perfecte (per exemple, els dies de cada mes: febrer en té menys).

```java
int[][] diasPorMes = {
    {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}, // un sol mes per fila
    {1, 2, 3},                                        // exemple de fila curta
};
```

En un array irregular, `irregular[i].length` pot ser diferent per a cada `i`. Per això els recorreguts usen `matriz[i].length` dins del bucle, mai un número fix.

---

## 🔁 Recórrer un array 2D: els bucles niats

Per a recórrer un rectangle perfecte necessites dos bucles: un per a les files i un altre per a les columnes.

```java
int[][] matriz = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};

for (int i = 0; i < matriz.length; i++) {          // files
    for (int j = 0; j < matriz[i].length; j++) {   // columnes
        System.out.print(matriz[i][j] + " ");
    }
    System.out.println();
}
```

Eixida:

```
1 2 3
4 5 6
7 8 9
```

El bucle exterior va fila a fila; l'interior recorre cada columna d'eixa fila. Fixa't que l'interior usa `matriz[i].length`: així funciona també amb arrays irregulars.

I la versió peresosa amb for-each (només lectura):

```java
for (int[] fila : matriz) {
    for (int valor : fila) {
        System.out.print(valor + " ");
    }
    System.out.println();
}
```

Cada `fila` és un `int[]`, i sobre ell tornes a usar for-each. Arrays de arrays, bucles de bucles.

---

## 🧮 Per a què servix de veritat

Els arrays 2D no són un caprici acadèmic. Són la forma natural de representar:

| Situació | Array |
|---|---|
| Tauler de joc (escacs, busca-mines, tres en ratlla) | `char[][]` o `boolean[][]` |
| Notes per alumne i assignatura | `double[][]` |
| Mapa de píxels d'una imatge | `int[][]` |
| Matrius matemàtiques | `int[][]`, `double[][]` |

Un busca-mines simplificat, per exemple, és un `boolean[][]`:

```java
boolean[][] minas = new boolean[5][5];
minas[2][3] = true;  // hi ha una mina en fila 2, columna 3
```

I per a saber si una posició existix, sempre preguntes abans de tocar: l'índex de fila va de `0` a `length - 1` i el de columna de `0` a `matriz[fila].length - 1`. Eixir-te d'allí torna a ser `ArrayIndexOutOfBoundsException`, però ara amb dues coordenades.

> ⚠️ **Advertència:** `matriz.length` i `matriz[0].length` NO són el mateix. El primer són les files; el segon, les columnes de la fila 0. Confondre'ls és l'error clàssic dels principiants amb matrius.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** quan recórres una matriu amb dos bucles, l'ordre importa: `i` per a files, `j` per a columnes. Si els intercanvies, estàs recorrent la matriu transposada.

**Exercici: la diagonal que no es veu**

```java
public class BeTheDiagonal {
    public static void main(String[] args) {
        int[][] m = {
            {1, 2, 3},
            {4, 5, 6},
            {7, 8, 9}
        };

        int suma = 0;
        for (int i = 0; i < m.length; i++) {
            suma += m[i][i];
        }
        System.out.println(suma);
    }
}
```

**Què imprimeix?**

- (A) 12
- (B) 15
- (C) 18
- (D) 45

<details>
<summary>🔄 Solució</summary>

La **B**. El bucle suma `m[0][0] + m[1][1] + m[2][2]` = `1 + 5 + 9` = 15. És la **diagonal principal**: quan fila i columna són el mateix número, camines per la diagonal de dalt-esquerra a baix-dreta. Un sol bucle, no dos.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quantes files i columnes té `int[][] a = new int[3][4]`?
2. Com accedixes a l'element de la fila 2, columna 1?
3. Què representa `a.length` i què representa `a[0].length`?
4. Per què en un array irregular el bucle interior usa `a[i].length`?

<details>
<summary>🔄 Respostes</summary>

1. 3 files i 4 columnes.
2. `a[2][1]`. Recorda: primer la fila, després la columna, tots dos començant en 0.
3. `a.length` és el nombre de files; `a[0].length`, el nombre de columnes de la primera fila.
4. Perquè cada fila pot tindre una grandària diferent. Usar `a[i].length` garantix que recorres exactament les columnes d'eixa fila, ni més ni menys.

</details>

---

## ✅ Resum en 3 frases

1. Un array **bidimensional** és un array de arrays: s'accedeix amb dos índexs `[fila][columna]`.
2. Es **recorre amb dos bucles niats**: l'exterior per a files i l'interior per a columnes, usant `matriz[i].length`.
3. Java admet **arrays irregulars** on cada fila té la seua longitud, i `matriz.length` i `matriz[i].length` no són el mateix.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Array multidimensional | Array els elements del qual són altres arrays |
> | Fila | Primera dimensió (l'índex `i`) |
> | Columna | Segona dimensió (l'índex `j`) |
> | Array irregular | Cada fila amb diferent nombre de columnes |
> | Diagonal principal | Els elements on `fila == columna` |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/09-arrays-colecciones) · **Anterior:** [02 · Recórrer arrays: for i for-each](/ApuntesProgramacion/va/09-arrays-colecciones/02-recorrer-arrays) · **Següent:** [04 · La classe Arrays: la teua navalla suïssa](/ApuntesProgramacion/va/09-arrays-colecciones/04-clase-arrays)