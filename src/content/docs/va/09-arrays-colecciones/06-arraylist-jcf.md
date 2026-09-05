---
title: "06 — ArrayList i el Java Collections Framework"
description: "L'aparcament que creix sol: ArrayList, la família java.util i per què no pot guardar int a palpes 🅿️📈"
---

<p><small>L'aparcament que creix sol: ArrayList, la família java.util i per què no pot guardar int a palpes 🅿️📈</small></p>

> 🗺️ **Estàs en:** 📚 **U09 · Arrays i Col·leccions** → 06 · ArrayList i el Java Collections Framework

---

## 📬 La idea en una frase

> **ArrayList és un array amb superpoders: creix sol, s'encongix sol i porta mètodes llestos (`add`, `get`, `remove`, `contains`...) en comptes d'obligar-te a escriure cada bucle a mà.**

Va arribar el moment que els arrays estaven esperant: l'aparcament s'ha quedat petit i necessites alguna cosa que cresca. Ací comença la segona meitat de la unitat i, probablement, la ferramenta que més usaràs en la teua vida com a programador o programadora.

---

## 🅿️ El problema: el teu array s'ha quedat sense places

Has creat un array de 10 places. Han arribat 11 gats. Què fas?

```java
String[] gatos = new String[10]; // 10 places, 11 gats... mal assumpte
```

Amb un array clàssic hauríes de crear-ne un de nou, copiar-ho tot i afegir el que falta. És com aparcar al carrer perquè l'aparcament està ple:

```java
String[] gatosMasGrande = new String[gatos.length + 1];
System.arraycopy(gatos, 0, gatosMasGrande, 0, gatos.length);
gatosMasGrande[gatosMasGrande.length - 1] = "Bigotes Jr.";
gatos = gatosMasGrande; // Ara apunta al nou array
```

Funciona, però és tediós. I si a més has d'esborrar un element del mig, és pitjor. Necessites alguna cosa que cresca i s'encongisca sola.

---

## 🎓 El Java Collections Framework (JCF)

Per a això existix el **JCF**: una família de classes i interfícies en `java.util` que gestionen grups d'objectes com si foren de goma. L'arbre de la família comença així:

```
Collection (interfície)
├── List        → ArrayList, LinkedList (ordenats, permeten duplicats)
├── Set         → HashSet, TreeSet (sense duplicats)
└── Queue       → cues (FIFO)
```

Totes compartixen mètodes bàsics: `add`, `remove`, `contains`, `size`, `isEmpty`, `clear`. Aprendre un és aprendre l'esquelet de tots. La interfície `List` és la que més usaràs.

> 💡 **Consell:** declara les teues variables amb la interfície, no amb la classe: `List<String> gatos = new ArrayList<>();`. Així, si demà necessites una `LinkedList`, canvies una línia. Ho veuràs al punt 7.

---

## 🅿️📈 ArrayList: l'aparcament que creix sol

ArrayList és un array "de goma": quan s'ompli, en crea un de més gran per dins i copia les dades. Tu no te n'assabentes de res.

```java
import java.util.ArrayList;

public class EjemploArrayList {
    public static void main(String[] args) {
        ArrayList<String> gatos = new ArrayList<>();
        gatos.add("Bigotes");                    // [Bigotes]
        gatos.add("Garfield");                   // [Bigotes, Garfield]
        gatos.add("Misifú");                     // [Bigotes, Garfield, Misifú]
        gatos.remove(1);                         // [Bigotes, Misifú] - adéu, Garfield
        String primero = gatos.get(0);           // "Bigotes"
        int cuantos = gatos.size();              // 2
        boolean hay = gatos.contains("Misifú");  // true
        int pos = gatos.indexOf("Bigotes");      // 0
        System.out.println(gatos);
    }
}
```

El repertori de mètodes imprescindibles:

| Mètode | Què fa |
|---|---|
| `add(e)` | Afig al final |
| `add(i, e)` | Insereix a la posició `i` (desplaça la resta) |
| `get(i)` | Torna l'element de la posició `i` |
| `set(i, e)` | Substituïx l'element de la posició `i` |
| `remove(i)` | Esborra per índex |
| `remove(objeto)` | Esborra la primera aparició d'eixe objecte |
| `size()` | Nombre d'elements (NO `length`) |
| `contains(e)` | Hi és? |
| `indexOf(e)` | Posició de la primera aparició |
| `isEmpty()` | Està buida? |
| `clear()` | Ho esborra tot |

> ⚠️ **Advertència:** ArrayList usa `size()`, no `length`. Array usa `length`, no `size()`. String usa `length()`, no `length` ni `size()`. Cadascun té la seua forma de preguntar com de gran és. És una trampa en el 90% dels exàmens.

### Recórrer un ArrayList

Amb for-each (el preferit per a llegir):

```java
for (String gato : gatos) {
    System.out.println("Miau: " + gato);
}
```

O amb for clàssic, que també funciona perquè `List` té índexs:

```java
for (int i = 0; i < gatos.size(); i++) {
    System.out.println(i + ": " + gatos.get(i));
}
```

Fixa't: `gatos.size()` dins de la condició s'avalua en cada volta. Funciona, encara que per rendiment se sol guardar en una variable si no canvia.

---

## 🚫 ArrayList NO guarda primitius

No pots fer `ArrayList<int>`. Els genèrics (`<...>`) només funcionen amb objectes. Per a números uses les classes **wrapper**:

```java
ArrayList<Integer> numeros = new ArrayList<>();
numeros.add(42);               // autoboxing: int → Integer
int n = numeros.get(0);        // unboxing: Integer → int
```

Des de Java 5, l'**autoboxing/unboxing** és automàtic: fiques un `int` i Java l'embolica en un `Integer` sense que tu ho notes. Però per dins seguix havent-hi objectes.

> 📝 **Nota:** el mateix amb la resta de primitius: `boolean` → `Boolean`, `double` → `Double`, `char` → `Character`... Si necessites saber més sobre genèrics i wrappers, la U10 els estira a fons.

### El truc de remove amb números

`remove(1)` i `remove(Integer.valueOf(1))` NO fan el mateix:

```java
ArrayList<Integer> nums = new ArrayList<>();
nums.add(10);
nums.add(20);
nums.add(30);
nums.remove(1);                // esborra per ÍNDEX: se'n va el 20
// nums.remove(Integer.valueOf(20)); // això esborra l'OBJECTE 20
```

Si vols esborrar el número 20, has de passar-li el wrapper. Si li passes un `int`, ho interpreta com a índex. És l'error clàssic dels novells amb `ArrayList<Integer>`.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** ArrayList usa arrays per dins. Quan s'ompli, en crea un de nou i copia. Cada operació té el seu cost, però tu no has de pensar-hi.

**Exercici: l'ArrayList misteriós**

```java
import java.util.ArrayList;

public class BeTheList {
    public static void main(String[] args) {
        ArrayList<Integer> lista = new ArrayList<>();
        lista.add(10);
        lista.add(20);
        lista.add(30);
        lista.add(1, 15);
        lista.remove(Integer.valueOf(20));

        for (Integer n : lista) {
            System.out.print(n + " ");
        }
    }
}
```

**Què imprimeix?**

- (A) 10 20 30
- (B) 10 15 30
- (C) 10 15 20 30
- (D) 10 15

<details>
<summary>🔄 Solució</summary>

La **B**. S'afig 15 a l'índex 1 → `{10, 15, 20, 30}`. Després s'esborra l'**objecte** `Integer(20)` (no l'índex) → `{10, 15, 30}`. El for-each imprimeix `10 15 30`. Si hagueren sigut `lista.remove(2)`, el resultat hauria sigut el mateix per casualitat, però per un motiu diferent.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quin mètode usa ArrayList per a saber la seua grandària: `length`, `length()` o `size()`?
2. Per què no es pot fer `ArrayList<int>`?
3. Què esborra `lista.remove(2)` en un `ArrayList<Integer>`: l'índex 2 o el número 2?
4. Per a què servix declarar `List<String> x = new ArrayList<>()` en comptes de `ArrayList<String> x`?

<details>
<summary>🔄 Respostes</summary>

1. `size()`. És un mètode, amb parèntesis. El `length` sense parèntesis és dels arrays.
2. Perquè els genèrics només accepten objectes, i `int` és un primitiu. Usa `Integer` i deixa que l'autoboxing faça la seua màgia.
3. L'índex 2 (esborra el tercer element). Per a esborrar el número 2, usa `remove(Integer.valueOf(2))`.
4. Per a poder canviar la implementació (a `LinkedList`, per exemple) sense tocar la resta del codi. Es programa contra la interfície.

</details>

---

## ✅ Resum en 3 frases

1. **ArrayList** és una llista dinàmica: creix sol, s'encongix sol i porta mètodes (`add`, `get`, `remove`, `contains`, `size`) per a no reinventar la roda.
2. Pertany al **Java Collections Framework** (`java.util`), una família de llistes, conjunts i cues amb mètodes comuns.
3. No guarda **primitius**: usa les classes wrapper (`Integer`, `Double`...) amb autoboxing automàtic, i compte amb la diferència entre `remove(índex)` i `remove(objecte)`.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | JCF | La família de col·leccions de `java.util` |
> | `List` | Col·lecció ordenada amb índexs i duplicats permesos |
> | Wrapper | Classe que embolica un primitiu (`Integer` embolica `int`) |
> | Autoboxing | Passar de primitiu a wrapper automàticament |
> | Unboxing | Passar de wrapper a primitiu automàticament |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/09-arrays-colecciones) · **Anterior:** [05 · Arrays i mètodes](/ApuntesProgramacion/va/09-arrays-colecciones/05-arrays-metodos) · **Següent:** [07 · LinkedList, HashSet i TreeSet](/ApuntesProgramacion/va/09-arrays-colecciones/07-linkedlist-hashset)