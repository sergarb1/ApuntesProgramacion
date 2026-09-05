---
title: "04 — TreeSet i LinkedHashSet: l'ordenat i el que recorda"
description: "TreeSet ordena tot el que fiques i LinkedHashSet conserva l'ordre d'arribada: dos cosins de HashSet amb memòria i brúixola 🧭"
---

<p><small>TreeSet ordena tot el que fiques i LinkedHashSet conserva l'ordre d'arribada: dos cosins de HashSet amb memòria i brúixola 🧭</small></p>

> 🗺️ **Estàs en:** 📚 **U10 · Col·leccions** → 04 · TreeSet i LinkedHashSet: l'ordenat i el que recorda

---

## 📬 La idea en una frase

> **TreeSet és un HashSet que s'ordena sol (com si tinguera brúixola), i LinkedHashSet és un HashSet amb memòria: conserva l'ordre en què van arribar els elements.**

Al punt 3 vas conéixer el porter que no deixa duplicats. Ara toquen els seus dos cosins, que hereten eixa mania de no admetre repetits però li afigen una superpotència a cadascun: ordre automàtic (TreeSet) i memòria de l'ordre d'arribada (LinkedHashSet).

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

LinkedHashSet és el germà de HashSet que **conserva l'ordre d'inserció**. Elimina duplicats com el porter del punt 3, però recorda qui va arribar primer, segon, tercer...

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

1. Què diferencia `TreeSet` de `HashSet`?
2. Pot un `TreeSet` contindre un `null`? I un `HashSet`?
3. Quina col·lecció elimina duplicats **mantenint l'ordre d'inserció**?
4. Què torna `headSet("Bob")` en un TreeSet amb `{"Ana", "Bob", "Zara"}`?

<details>
<summary>🔄 Respostes</summary>

1. `TreeSet` manté els elements ordenats automàticament (arbre roig-negre) a costa de ser més lent (O(log n) davant O(1)).
2. `TreeSet` no: necessita comparar per a ordenar i no pot comparar `null`. `HashSet` sí admet un únic `null`.
3. `LinkedHashSet`: elimina duplicats com HashSet però conserva l'ordre d'arribada.
4. `[Ana]`: tot el que va abans de "Bob" en l'ordre natural.

</details>

---

## ✅ Resum en 3 frases

1. **TreeSet** ordena tot el que fiques automàticament i oferix extra (`first`, `last`, `headSet`, `subSet`), a canvi de ser més lent i no acceptar `null`.
2. **LinkedHashSet** conserva l'ordre d'inserció i és la solució estrella per a **eliminar duplicats mantenint l'ordre d'arribada**.
3. Tots dos són `Set`: no admeten duplicats. La diferència amb HashSet està en l'ordre que guarden (cap, natural o d'arribada).

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Arbre roig-negre | Estructura interna de TreeSet que manté l'ordre |
> | Ordre natural | L'ordre per defecte del tipus (numèric, alfabètic) |
> | Ordre d'inserció | L'ordre en què es van afegir els elements |
> | `headSet(e)` / `tailSet(e)` | Elements abans / després de `e` |
> | O(log n) | Cost logarítmic: ràpid, però més lent que O(1) |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/10-colecciones) · **Anterior:** [03 · HashSet: el porter sense duplicats](/ApuntesProgramacion/va/10-colecciones/03-hashset) · **Següent:** [05 · Iterator: el cambrer que pren nota](/ApuntesProgramacion/va/10-colecciones/05-iterator)