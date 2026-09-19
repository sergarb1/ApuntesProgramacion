---
title: "03 · HashSet, TreeSet i LinkedHashSet: els conjunts"
description: "El porter sense duplicats, el que ordena sol i el que recorda l'ordre d'arribada: la família Set al complet 🚫🧭"
---

<p><small>El porter sense duplicats, el que ordena sol i el que recorda l'ordre d'arribada: la família Set al complet 🚫🧭</small></p>

> 🗺️ **Estàs en:** 📚 **U11 · Col·leccions, genèrics i mapes** → 03 · HashSet, TreeSet i LinkedHashSet

---

## 📬 La idea en una frase

> **HashSet és una discoteca que no deixa entrar ningú repetit; TreeSet és el mateix porter però amb brúixola (ordena sol); i LinkedHashSet té memòria de l'ordre d'arribada.**

Al punt 2 vas conéixer les llistes: ordre i duplicats benvinguts. Ara canvia el ball: hi ha problemes on els repetits sobren. Ahí entra la família `Set`, amb tres germans que compartixen la mania de no admetre duplicats però es diferencien en l'ordre.

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

Els seus avantatges: **O(1)** per a afegir, esborrar i comprovar pertinença, i elimina duplicats sense que ho hages de pensar. És la col·lecció més ràpida per a "ja ho tinc?".

### Un HashSet no té ordre

**HashSet no garanteix cap ordre**. Si fiques `{"roig", "verd", "blau"}`, en imprimir pot eixir `[blau, roig, verd]` o qualsevol altra combinació. No et fies de l'ordre, fia-te'n de `size()` i `contains()`.

```java
HashSet<String> colores = new HashSet<>();
colores.add("roig");
colores.add("verd");
colores.add("blau");
System.out.println(colores); // [roig, verd, blau]? Pot ser, pot ser que no...
```

---

## 🧭 TreeSet: l'organitzat

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

## 🧠 LinkedHashSet: el que recorda l'ordre d'arribada

LinkedHashSet és el germà de HashSet que **conserva l'ordre d'inserció**. Elimina duplicats com el porter de fitxers, però recorda qui va arribar primer, segon, tercer...

```java
import java.util.LinkedHashSet;

public class EjemploLinkedHashSet {
    public static void main(String[] args) {
        LinkedHashSet<String> colaDeEntrada = new LinkedHashSet<>();
        colaDeEntrada.add("Ana");
        colaDeEntrada.add("Bob");
        colaDeEntrada.add("Ana");   // duplicat: no entra
        colaDeEntrada.add("Carla");
        System.out.println(colaDeEntrada); // [Ana, Bob, Carla] - ordre d'arribada
    }
}
```

El seu ús estrella: **eliminar duplicats mantenint l'ordre de primera aparició**. Un clàssic dels exercicis i de les entrevistes.

```java
import java.util.ArrayList;
import java.util.LinkedHashSet;

ArrayList<Integer> lista = new ArrayList<>(java.util.Arrays.asList(3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5));
LinkedHashSet<Integer> sinRepetidos = new LinkedHashSet<>(lista);
System.out.println(sinRepetidos); // [3, 1, 4, 5, 9, 2, 6] - sense duplicats i en ordre d'arribada
```

Construir un `LinkedHashSet` a partir de la llista elimina els repetits; convertir-lo de nou en `ArrayList` et torna la llista neta. Dos línies i el problema dels duplicats desapareix.

> 💡 **Consell:** HashSet és el més ràpid (O(1)), TreeSet ordena (O(log n)) i LinkedHashSet recorda l'ordre (O(1) amb un poc més de memòria). Cadascun amb la seua superpotència.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** davant "sense duplicats i ordenats" pensa en TreeSet. Davant "sense duplicats però mantenint l'ordre d'arribada" pensa en LinkedHashSet. Davant "només sense duplicats" pensa en HashSet.

**Exercici: què ix per pantalla?**

```java
import java.util.TreeSet;

public class BeTheTree {
    public static void main(String[] args) {
        TreeSet<Integer> notas = new TreeSet<>();
        notas.add(7);
        notas.add(3);
        notas.add(9);
        notas.add(7);   // duplicat: no entra
        notas.add(1);

        System.out.println(notas.first() + " " + notas.last());
        System.out.println(notas.size());
    }
}
```

**Què imprimeix?**

- (A) 1 9 i 5
- (B) 3 9 i 4
- (C) 1 9 i 4
- (D) 1 7 i 4

<details>
<summary>🔄 Solució</summary>

La **C**. Els valors únics són `{1, 3, 7, 9}`: 4 elements (el 7 repetit no entra). Ordenats: primer el `1`, últim el `9`. `first()` = 1, `last()` = 9, `size()` = 4.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quants elements hi ha en un `HashSet` després d'afegir `a, b, a, c, b`?
2. Què diferencia `TreeSet` de `HashSet`?
3. Pot un `TreeSet` contindre un `null`? I un `HashSet`?
4. Quina col·lecció elimina duplicats **mantenint l'ordre d'inserció**?
5. Què torna `headSet("Bob")` en un TreeSet amb `{"Ana", "Bob", "Zara"}`?

<details>
<summary>🔄 Respostes</summary>

1. 3 (`a`, `b`, `c`). Els duplicats no entren.
2. `TreeSet` manté els elements ordenats automàticament (arbre roig-negre) a costa de ser més lent (O(log n) davant O(1)).
3. `TreeSet` no: necessita comparar per a ordenar i no pot comparar `null`. `HashSet` sí admet un únic `null`.
4. `LinkedHashSet`: elimina duplicats com HashSet però conserva l'ordre d'arribada.
5. `[Ana]`: tot el que va abans de "Bob" en l'ordre natural.

</details>

---

## ✅ Resum en 3 frases

1. **HashSet** és el porter sense duplicats: no admet repetits, no ordena res i és **O(1)** gràcies a `hashCode()` i `equals()`.
2. **TreeSet** ordena tot el que fiques automàticament i oferix extra (`first`, `last`, `headSet`, `subSet`), a canvi de ser més lent i no acceptar `null`.
3. **LinkedHashSet** conserva l'ordre d'inserció i és la solució estrella per a **eliminar duplicats mantenint l'ordre d'arribada**.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `Set` | Col·lecció sense duplicats |
> | `hashCode()` | "Número de calaix" que usa HashSet per a trobar elements |
> | Arbre roig-negre | Estructura interna de TreeSet que manté l'ordre |
> | Ordre natural | L'ordre per defecte del tipus (numèric, alfabètic) |
> | Ordre d'inserció | L'ordre en què es van afegir els elements |
> | O(1) / O(log n) | Instantani / logarítmic (ràpid encara que cresca) |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/11-colecciones) · **Anterior:** [02 · LinkedList: la conga line](/ApuntesProgramacion/va/11-colecciones/02-linkedlist) · **Següent:** [04 · Iterator i Collections](/ApuntesProgramacion/va/11-colecciones/04-iterator-collections)
