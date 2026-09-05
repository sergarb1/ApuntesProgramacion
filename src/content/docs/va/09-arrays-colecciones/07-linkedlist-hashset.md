---
title: "07 — LinkedList, HashSet i TreeSet"
description: "La conga line, el porter sense duplicats i l'organitzat: tres col·leccions per a tres problemes diferents 🎉"
---

<p><small>La conga line, el porter sense duplicats i l'organitzat: tres col·leccions per a tres problemes diferents 🎉</small></p>

> 🗺️ **Estàs en:** 📚 **U09 · Arrays i Col·leccions** → 07 · LinkedList, HashSet i TreeSet

---

## 📬 La idea en una frase

> **ArrayList no és l'única llista: LinkedList encadena elements com una conga, HashSet no deixa entrar duplicats i TreeSet els guarda ja ordenats. Cada problema té la seua col·lecció.**

Al punt 6 vas conéixer la família. Ara toca conéixer els cosins: dues llistes/col·leccions que resolen problemes que `ArrayList` no resol del tot bé. Triar la col·lecció adequada és una de les senyals que deixes de ser novell.

---

## 🎉 LinkedList: la conga line

LinkedList és una **llista enllaçada**: cada element sap qui va davant i qui darrere, com en una conga. Per a recórrer-la per índex cal saltar d'element en element (és més lenta que `ArrayList` en això), però és rapidíssima per a afegir o esborrar **al principi** i al final.

```java
import java.util.LinkedList;

public class EjemploLinkedList {
    public static void main(String[] args) {
        LinkedList<String> cola = new LinkedList<>();
        cola.addLast("Persona 1");   // al final
        cola.addLast("Persona 2");
        cola.addFirst("Colado");     // es cola al principi
        String primero = cola.removeFirst(); // "Colado" - se'n va
        System.out.println(cola);    // [Persona 1, Persona 2]
    }
}
```

Els seus mètodes propis (encara que `add`, `remove`, `get` també funcionen):

| Mètode | Què fa |
|---|---|
| `addFirst(e)` / `addLast(e)` | Afig al principi / al final |
| `removeFirst()` / `removeLast()` | Trau i torna el primer / l'últim |
| `getFirst()` / `getLast()` | Mira el primer / l'últim sense traure'l |
| `peek()` | Mira el primer sense traure'l (no llança si està buida) |
| `poll()` | Trau el primer (no llança si està buida) |

> 💡 **Consell:** usa `LinkedList` quan necessites una **cua** (FIFO: el primer que arriba és el primer que ix) o una **pila** (LIFO), o quan vages a afegir/esborrar molt al principi. Per a accés aleatori freqüent (`get(i)`), `ArrayList` és millor: va directe a l'índex.

---

## 🚫 HashSet: el porter que no deixa duplicats

HashSet és com una discoteca: **no deixa entrar ningú que ja estiga dins**. No importa l'ordre, només l'exclusivitat.

```java
import java.util.HashSet;

public class EjemploHashSet {
    public static void main(String[] args) {
        HashSet<String> invitados = new HashSet<>();
        invitados.add("Ana");
        invitados.add("Bob");
        invitados.add("Ana"); // No passa res, Ana ja està
        System.out.println(invitados.size()); // 2, no 3
        System.out.println(invitados.contains("Bob")); // true
    }
}
```

Com sap si un element ja hi és? Usa `hashCode()` i `equals()`. Primer calcula el `hashCode()` de l'element per a trobar el "calaix" i després comprova amb `equals()` si ja n'hi ha un d'igual dins.

> ⚠️ **Advertència:** si sobreescrius `equals()` en una classe, SOBREESCRIU `hashCode()`. Sempre. Si dos objectes són iguals segons `equals()`, han de tindre el mateix `hashCode()`. Si no, HashSet s'ho passarà malament. Repetix: **sempre**.

### Operacions típiques amb HashSet

```java
HashSet<String> set = new HashSet<>();
set.add("roig");
set.add("verd");
set.add("blau");
set.remove("roig");
set.contains("verd");   // true
set.isEmpty();          // false
set.size();             // 2
set.clear();            // ho buida tot
```

Els seus avantatges: **O(1)** per a afegir, esborrar i comprovar pertinença, i elimina duplicats sense que ho hagis de pensar. És la col·lecció més ràpida per a "ja ho tinc?".

---

## 📚 TreeSet: l'organitzat

TreeSet és un HashSet que **s'ordena sol**. Internament usa un arbre roig-negre (no necessites saber més, només que ordena). Tot el que fiques es col·loca automàticament al seu lloc.

```java
import java.util.TreeSet;

public class EjemploTreeSet {
    public static void main(String[] args) {
        TreeSet<String> ordenado = new TreeSet<>();
        ordenado.add("Zara");
        ordenado.add("Ana");
        ordenado.add("Bob");
        System.out.println(ordenado); // [Ana, Bob, Zara] - ordre alfabètic

        System.out.println(ordenado.first());      // "Ana"
        System.out.println(ordenado.last());       // "Zara"
        System.out.println(ordenado.headSet("Bob")); // [Ana]
    }
}
```

Mètodes extra útils:

| Mètode | Què fa |
|---|---|
| `first()` / `last()` | El menor / el major |
| `headSet(e)` | Tot el que va abans de `e` |
| `tailSet(e)` | Tot el que va després (inclòs) de `e` |
| `subSet(a, b)` | El tros entre `a` i `b` |
| `floor(e)` / `ceiling(e)` | El major ≤ e / el menor ≥ e |

> 📝 **Nota:** TreeSet **no admet `null`**. Per a ordenar necessita comparar elements, i com compares `null` amb alguna cosa? HashSet, en canvi, admet un únic `null`. Detall d'examen assegurat.

---

## ⚖️ La comparativa definitiva

| Col·lecció | Ordre | Duplicats | Accés/inserció | El que val |
|---|---|---|---|---|
| `ArrayList` | Per índex | Permesos | `get(i)` rapidíssim | Llista de tots els dies |
| `LinkedList` | Per inserció | Permesos | Ràpida al principi/final | Cues, piles |
| `HashSet` | Cap | No | O(1) | "Ja ho tinc?", eliminar duplicats |
| `TreeSet` | Ordre natural | No | O(log n) | Elements sempre ordenats |

**La regla d'or:** saps quants elements necessites i no canviarà? → array. Llista que creix i accés per índex? → ArrayList. Cua o pila? → LinkedList. Sense duplicats i no t'importa l'ordre? → HashSet. Sense duplicats i ordenats? → TreeSet.

> 💡 **Consell:** necessites eliminar duplicats però **mantenint l'ordre d'arribada**? Usa `LinkedHashSet`, el germà de HashSet que conserva l'ordre d'inserció. Un clàssic als exercicis.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cada col·lecció resol un problema diferent. Abans d'escriure codi, pregunta't: m'importa l'ordre? pot haver-hi duplicats? necessite velocitat?

**Exercici: el porter de la festa**

```java
import java.util.HashSet;

public class BeTheSet {
    public static void main(String[] args) {
        HashSet<Integer> numeros = new HashSet<>();
        numeros.add(3);
        numeros.add(1);
        numeros.add(4);
        numeros.add(1);   // duplicat: no entra
        numeros.add(5);
        numeros.add(3);   // duplicat: no entra

        System.out.println(numeros.size());
        System.out.println(numeros.contains(4));
    }
}
```

**Què imprimeix?**

- (A) 6 i true
- (B) 4 i true
- (C) 4 i false
- (D) 5 i true

<details>
<summary>🔄 Solució</summary>

La **B**. Els valors únics són `{1, 3, 4, 5}`: 4 elements. El `4` sí que hi és (`contains` → true). Els `add(1)` i `add(3)` repetits s'ignoren silenciosament. Compte: HashSet no garantix un ordre concret en imprimir, per això el `size()` és el fiable.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quina col·lecció usaríes per a una cua de supermercat?
2. Quants elements hi ha en un `HashSet` després d'afegir `a, b, a, c, b`?
3. Què diferencia `TreeSet` de `HashSet`?
4. Pot un `TreeSet` contindre un `null`? I un `HashSet`?

<details>
<summary>🔄 Respostes</summary>

1. `LinkedList`, pels seus mètodes `addLast` i `removeFirst`: la cua FIFO del supermercat.
2. 3 (`a`, `b`, `c`). Els duplicats no entren.
3. `TreeSet` manté els elements ordenats automàticament (arbre roig-negre) a costa de ser més lent (O(log n) davant O(1)).
4. `TreeSet` no: necessita comparar per a ordenar i no pot comparar `null`. `HashSet` sí admet un únic `null`.

</details>

---

## ✅ Resum en 3 frases

1. **LinkedList** encadena elements (la conga): rapidíssima per a afegir/esborrar al principi i per a simular cues i piles.
2. **HashSet** és el porter sense duplicats: no admet repetits, no ordena, i és O(1) en les seues operacions bàsiques.
3. **TreeSet** ordena tot el que fiques automàticament i oferix extra (`first`, `last`, `headSet`), a canvi de ser més lent i no acceptar `null`.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Llista enllaçada | Elements encadenats que saben qui va davant i darrere |
> | FIFO | First In, First Out: la cua del supermercat |
> | LIFO | Last In, First Out: la pila de plats |
> | `hashCode()` | "Número de calaix" que usa HashSet per a trobar elements |
> | Arbre roig-negre | Estructura interna de TreeSet que manté l'ordre |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/09-arrays-colecciones) · **Anterior:** [06 · ArrayList i el Java Collections Framework](/ApuntesProgramacion/va/09-arrays-colecciones/06-arraylist-jcf) · **Següent:** [08 · Iterator i la classe Collections](/ApuntesProgramacion/va/09-arrays-colecciones/08-iterator-collections)