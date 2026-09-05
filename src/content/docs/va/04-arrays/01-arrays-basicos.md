---
title: "01 — Arrays: l'aparcament de dades"
description: "Declaració, índexs i el primer BOOM: la ArrayIndexOutOfBoundsException que et farà estavellar-te alguna volta 🅿️"
---

<p><small>Declaració, índexs i el primer BOOM: la ArrayIndexOutOfBoundsException que et farà estavellar-te alguna volta 🅿️</small></p>

> 🗺️ **Estàs en:** 🅿️ **U04 · Arrays** → 01 · Arrays: l'aparcament de dades

---

## 📬 La idea en una frase

> **Un array és un aparcament de grandària fixa: guarda moltes dades del mateix tipus sota un sol nom, i cada plaça té un número (l'índex) que comença en 0.**

Fins ara guardaves una cosa per variable. Amb els arrays en guardes 100 sota el mateix cartell. És la primera ferramenta "de veritat" per a gestionar quantitats, i d'ella penja tot el que ve després.

---

## 🐱 El problema: tens 100 gats i un sol nom

Imagina que tens 100 gats i necessites guardar els seus noms. Podries fer això:

```java
String gato1 = "Bigotes";
String gato2 = "Garfield";
String gato3 = "Misifú";
// ... 97 líneas después ...
String gato100 = "Calcetines";
```

Però aleshores arriba el gat 101 i el teu programa es cau. O pitjor: vols saber quants gats comencen amb "M" i has d'escriure 100 `if`. L'esquena ja et fa mal només de pensar-ho.

> ⚠️ **Advertència:** si alguna volta escrius `gato1`, `gato2`, `gato3`... `gatoN` al teu codi, en algun lloc un programador sènior plora. Els arrays existeixen exactament per a això.

---

## 🅿️ L'array: el teu primer aparcament

Un array és com un aparcament de diverses plantes. Cada plaça té un número (l'**índex**) i en cada plaça només caben cotxes del mateix tipus (bé, i les seues subclasses).

```java
String[] gatos = new String[100];
// Has creat un aparcament amb 100 places per a Strings
```

Hi ha dues formes de declarar-lo i crear-lo:

```java
int[] numeros = new int[5];      // 5 places, totes buides (0)
int[] directo = {10, 20, 30};    // 3 places, ja ocupades
```

La primera plaça és la **0**, no la 1. Això confon tothom al principi. Accepta-ho.

> 💡 **Consell:** pensa en els índexs com a distàncies des de la primera posició. La primera casa és a 0 passes de tu, no a 1.

### Els valors per defecte

Quan crees un array amb `new`, cada plaça s'ompli amb el valor per defecte del tipus:

| Tipus | Valor per defecte |
|---|---|
| `int`, `long`, `short`, `byte` | `0` |
| `double`, `float` | `0.0` |
| `boolean` | `false` |
| `char` | `'\u0000'` |
| Objectes (`String`, `Persona`...) | `null` |

Eixe últim és el que mossega: un array de `String` acabat de crear està ple de `null`, no de `""`. Si intentes cridar un mètode sobre una plaça null, et portes un `NullPointerException` a l'acte.

---

## 🚗 Com ficar coses a l'aparcament

S'accedeix a una plaça amb claudàtors i el número d'índex:

```java
String[] gatos = new String[3];
gatos[0] = "Bigotes";
gatos[1] = "Garfield";
gatos[2] = "Misifú";
gatos[3] = "Calcetines"; // ¡BOOM!
```

Què passa a l'última línia? Et vas a estavellar.

### ¡BOOM! La ArrayIndexOutOfBoundsException

```java
int[] numeros = new int[5];
numeros[0] = 10;
numeros[1] = 20;
numeros[2] = 30;
numeros[3] = 40;
numeros[4] = 50;
numeros[5] = 60; // Index 5 out of bounds for length 5
```

L'array té places del 0 al 4. Demanar la 5 és com intentar aparcar on no hi ha plaça. Java et respon amb `ArrayIndexOutOfBoundsException` i el teu programa mor a l'acte. És **la** excepció més típica d'esta unitat i la primera que quasi tothom patix.

> 📝 **Nota:** els índexs vàlids van de `0` a `length - 1`. L'últim element sempre és `arr[arr.length - 1]`. No t'ho penses dues voltes: memoritza-ho.

### La longitud: `length` sense parèntesis

Per a saber quantes places té l'aparcament:

```java
int[] numeros = new int[10];
System.out.println(numeros.length);  // 10 (sense parèntesis)
```

Fixa't: `array.length` NO porta parèntesis. No és un mètode, és un atribut. Els `String` usen `length()`. Els arrays usen `length`. És una trampa mortal als exàmens.

> ⚠️ **Advertència:** l'array és un objecte (és al heap), però la variable que el referencia és a la pila (stack). Quan passes un array a un mètode, passes la referència, no les dades. Ho veuràs en detall al punt 5, però ja ho saps: si modifiques l'array dins d'un mètode, els canvis afecten l'original.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** els arrays tenen grandària fixa. Una vegada creats, no pots afegir ni traure elements. Si ho necessites, se'n crea un altre i es copia. En la U10 veuràs les col·leccions, que solucionen això.

**Exercici: l'array que es duplica**

```java
public class BeTheArray {
    public static void main(String[] args) {
        int[] arr = new int[4];
        arr[0] = 2;
        arr[1] = 4;
        arr[2] = 6;
        arr[3] = 8;

        for (int i = 0; i < arr.length; i++) {
            arr[i] = arr[i] * 2;
        }

        System.out.println(arr[2]);
    }
}
```

**Què imprimeix?**

- (A) 6
- (B) 8
- (C) 12
- (D) 16

<details>
<summary>🔄 Solució</summary>

La **C**. L'array original és `{2, 4, 6, 8}`. Després del bucle, cada element es multiplica per 2: `{4, 8, 12, 16}`. Per tant, `arr[2]` = 12. El `for` recorre totes les places i les sobreescriu al lloc: no necessites un altre array.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quantes places té `int[] a = new int[7]` i quins són els índexs vàlids?
2. Quin valor té `boolean[] b = new boolean[3]` a cada plaça?
3. Quina excepció llança `arr[arr.length]`?
4. `numeros.length` o `numeros.length()`? I per a un `String`?

<details>
<summary>🔄 Respostes</summary>

1. 7 places. Índexs del 0 al 6 (`length - 1`).
2. `false` a totes: és el valor per defecte de `boolean`.
3. `ArrayIndexOutOfBoundsException`: la plaça `length` no existeix, les vàlides acaben en `length - 1`.
4. `numeros.length` (atribut, sense parèntesis) per a arrays; `texto.length()` (mètode, amb parèntesis) per a `String`.

</details>

---

## ✅ Resum en 3 frases

1. Un **array** guarda molts valors del mateix tipus sota un sol nom, en un aparcament de **grandària fixa**.
2. S'accedeix per **índex** des de `0` fins a `length - 1`; passar-te provoca `ArrayIndexOutOfBoundsException`.
3. La **longitud** es pregunta amb `length` (sense parèntesis) i les places acabades de crear s'omplin amb els valors per defecte (`0`, `false`, `null`...).

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Array | Aparcament de dades del mateix tipus, grandària fixa |
> | Índex | Número de la plaça; comença en 0 |
> | `length` | Grandària de l'array (atribut, sense parèntesis) |
> | `ArrayIndexOutOfBoundsException` | Error per eixir-te de les places vàlides |
> | Valor per defecte | El que ocupa una plaça acabada de crear (`0`, `false`, `null`...) |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/04-arrays) · **Anterior:** [Índex de la unitat](/ApuntesProgramacion/va/04-arrays) · **Següent:** [02 · Recórrer arrays: for i for-each](/ApuntesProgramacion/va/04-arrays/02-recorrer-arrays)