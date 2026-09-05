---
title: "04 — La classe Arrays: la teua navalla suïssa"
description: "toString, sort, copyOf, binarySearch i fill: els mètodes estàtics que t'estalvien reinventar la roda 🔧"
---

<p><small>toString, sort, copyOf, binarySearch i fill: els mètodes estàtics que t'estalvien reinventar la roda 🔧</small></p>

> 🗺️ **Estàs en:** 📚 **U09 · Arrays i Col·leccions** → 04 · La classe Arrays: la teua navalla suïssa

---

## 📬 La idea en una frase

> **`java.util.Arrays` és una classe plena de mètodes estàtics per a treballar amb arrays: imprimir, ordenar, copiar, buscar i omplir sense escriure tu el bucle.**

Els arrays tenen un problema: no tenen mètodes. `numeros.sort()` no existix. Per això Java et regala una classe de ferramentes, totes estàtiques, perquè no hagis de reinventar el bucle cada volta. És el més paregut a una navalla suïssa que existix en el món dels arrays.

---

## 🧰 La classe Arrays

S'importa amb `import java.util.Arrays;` i els seus mètodes es criden passant-li l'array:

```java
import java.util.Arrays;

public class EjemploArrays {
    public static void main(String[] args) {
        int[] numeros = {5, 2, 8, 1, 9};

        Arrays.sort(numeros);                    // {1, 2, 5, 8, 9}
        String texto = Arrays.toString(numeros); // "[1, 2, 5, 8, 9]"
        System.out.println(texto);
    }
}
```

Recorda: com són mètodes `static` (ho vas vore en la U07), es criden amb el nom de la classe: `Arrays.xxx(array)`. No cal crear cap objecte `Arrays` — de fet, no pots.

### 🔍 Arrays.toString: imprimir bonic

El mètode més socorregut. Sense ell, imprimir un array mostra escombraries:

```java
int[] numeros = {1, 2, 3};
System.out.println(numeros);           // [I@6d06d69c  (adreça de memòria, inútil)
System.out.println(Arrays.toString(numeros)); // [1, 2, 3]
```

Sense `toString`, Java imprimeix l'adreça de memòria de l'objecte (`[I@6d06d69c`), no les dades. Amb ell, obtens alguna cosa llegible. Per a arrays 2D existix `Arrays.deepToString()`.

> ⚠️ **Advertència:** `numeros.toString()` tampoc no funciona: els arrays no sobreescriuen `toString()`. Sempre `Arrays.toString(numeros)`.

### 📊 Arrays.sort: ordenar d'un buf

Ordena l'array al lloc, de menor a major (segons l'ordre natural del tipus):

```java
int[] notas = {7, 3, 9, 5};
Arrays.sort(notas);
System.out.println(Arrays.toString(notas)); // [3, 5, 7, 9]
```

Amb `String` ordena alfabèticament. Compte amb les majúscules: `"Zebra"` va abans que `"abc"` perquè les majúscules tenen menor valor Unicode. És ordenació lexicogràfica, no "de diccionari humà".

### 🔎 Arrays.binarySearch: buscar ràpid (però només ordenat)

La cerca binària partix l'array per la meitat a cada pas. És rapidíssima, però **exigix que l'array estiga ordenat abans**.

```java
int[] numeros = {3, 5, 7, 9, 11};
int pos = Arrays.binarySearch(numeros, 7);
System.out.println(pos); // 2
```

Si el valor no hi és, torna un número negatiu (`-(puntDInsercio) - 1`). Compte: si l'array no està ordenat, el resultat és impredictible. Ordena abans de buscar, sempre.

### 📋 Arrays.copyOf: copiar amb talla nova

Crea un **nou** array amb els primers `n` elements (o tots més zeros si demanes més dels que hi ha):

```java
int[] original = {1, 2, 3, 4, 5};
int[] retallat = Arrays.copyOf(original, 3); // {1, 2, 3}
int[] allargat = Arrays.copyOf(original, 8); // {1, 2, 3, 4, 5, 0, 0, 0}
```

És la forma civilitzada de "canviar la grandària" d'un array, que com saps és fixa: en crees un de nou i copies.

### 🧽 Arrays.fill: omplir-ho tot d'un colp

Posa el mateix valor a totes les places:

```java
int[] tabla = new int[10];
Arrays.fill(tabla, 0);     // tot a zeros
Arrays.fill(tabla, 7);     // tot a sets
```

Útil per a inicialitzar taulers, reiniciar marcadors o preparar un array abans d'usar-lo.

### ⚖️ Arrays.equals: comparar contingut, no referències

Este és el que més bugs evita. `array1.equals(array2)` NO compara els elements: compara si són el MATEIX objecte en memòria. Usa SEMPRE `Arrays.equals()`:

```java
int[] a = {1, 2, 3};
int[] b = {1, 2, 3};

System.out.println(a.equals(b));            // false (objectes diferents en memòria)
System.out.println(Arrays.equals(a, b));    // true (mateix contingut)
```

El teu cap t'ho agrairà.

---

## 🧭 El mapa de la navalla

| Mètode | Què fa | Compte amb |
|---|---|---|
| `Arrays.toString(arr)` | Imprimeix l'array llegible | No usar `arr.toString()` |
| `Arrays.sort(arr)` | Ordena al lloc | Modifica l'original |
| `Arrays.binarySearch(arr, v)` | Busca per índex | Requerix array ordenat |
| `Arrays.copyOf(arr, n)` | Nou array amb n elements | Crea còpia, no toca l'original |
| `Arrays.fill(arr, v)` | Ompli tot amb v | Servix per a inicialitzar |
| `Arrays.equals(a, b)` | Compara contingut | No confondre amb `==` |
| `Arrays.deepToString(arr2d)` | Imprimeix arrays 2D | Versió profunda del toString |

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `Arrays.binarySearch()` requerix l'array ORDENAT. Si no, el resultat és impredictible. És com buscar en un diccionari que no està alfabètic: no trobaràs res fiable.

**Exercici: la cerca que ho tenia tot**

```java
import java.util.Arrays;

public class BeTheSort {
    public static void main(String[] args) {
        int[] datos = {42, 17, 8, 99, 3};
        Arrays.sort(datos);

        int indice = Arrays.binarySearch(datos, 42);
        System.out.println(indice);
    }
}
```

**Què imprimeix?**

- (A) 0
- (B) 3
- (C) 4
- (D) 99

<details>
<summary>🔄 Solució</summary>

La **B**. Després d'ordenar, l'array és `{3, 8, 17, 42, 99}`. El 42 està a l'índex 3. Si no hagueres ordenat abans, `binarySearch` podria haver-te tornat qualsevol cosa, inclòs un negatiu fals.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què torna `Arrays.binarySearch` si el valor no està a l'array?
2. `a.equals(b)` i `Arrays.equals(a, b)` fan el mateix?
3. Què fa `Arrays.copyOf(arr, 10)` si `arr` té 4 elements?
4. Per què `System.out.println(arr)` no imprimeix les dades?

<details>
<summary>🔄 Respostes</summary>

1. Un número negatiu (`-(puntDInsercio) - 1`). És una forma compacta de dir "no hi és, però ací aniria".
2. No. `a.equals(b)` compara referències (és el mateix objecte?); `Arrays.equals(a, b)` compara el contingut element a element.
3. Crea un nou array de 10 places amb els 4 valors i la resta a `0`. És el truc per a "engrandir" un array.
4. Perquè `arr` és un objecte i el seu `toString()` heretat imprimeix l'adreça de memòria (`[I@...`). Per a vore les dades usa `Arrays.toString(arr)`.

</details>

---

## ✅ Resum en 3 frases

1. `java.util.Arrays` és la caixa de ferramentes **estàtica** dels arrays: s'importa i s'usa sense crear objectes.
2. Els cinc imprescindibles: `toString` (imprimir), `sort` (ordenar), `copyOf` (copiar), `binarySearch` (buscar, requerix ordre) i `fill` (omplir).
3. Per a **comparar contingut** usa `Arrays.equals`, mai `equals` ni `==`, que comparen referències.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Classe utilitària | Classe amb mètodes estàtics que no s'instancia (com `Math`) |
> | Ordre natural | L'ordre que el tipus definix per defecte (numèric, alfabètic) |
> | Cerca binària | Cerca que partix l'array per la meitat; requerix ordre |
> | Ordenació lexicogràfica | Ordre alfabètic segons el valor dels caràcters |
> | Còpia | Nou array independent amb els mateixos valors |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/09-arrays-colecciones) · **Anterior:** [03 · Arrays multidimensionals](/ApuntesProgramacion/va/09-arrays-colecciones/03-arrays-multidimensionales) · **Següent:** [05 · Arrays i mètodes](/ApuntesProgramacion/va/09-arrays-colecciones/05-arrays-metodos)