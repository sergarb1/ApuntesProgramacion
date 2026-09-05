---
title: "06 — La classe Collections: la navalla suïssa"
description: "Mètodes estàtics que fan en una línia el que tu tardaries en deu: sort, reverse, shuffle, max, min i companyia 🧰"
---

<p><small>Mètodes estàtics que fan en una línia el que tu tardaries en deu: sort, reverse, shuffle, max, min i companyia 🧰</small></p>

> 🗺️ **Estàs en:** 📚 **U10 · Col·leccions** → 06 · La classe Collections: la navalla suïssa

---

## 📬 La idea en una frase

> **`Collections` és la navalla suïssa de les col·leccions: mètodes estàtics (`sort`, `reverse`, `shuffle`, `max`, `min`, `frequency`...) que fan en una línia el que tu tardaries en deu.**

Al punt 5 vas vore com recórrer col·leccions sense morir en l'intent. Ara toca manipular-les sense escriure un sol bucle a mà. Igual que `Arrays` era la navalla suïssa dels arrays (ho vas vore en la U04), `Collections` ho és de les col·leccions. Mètodes estàtics (de la U08) que fan en una línia el que tu tardaries en 10.

---

## 🧰 Collections: l'amic utilitari

```java
import java.util.ArrayList;
import java.util.Collections;

public class EjemploCollections {
    public static void main(String[] args) {
        ArrayList<String> lista = new ArrayList<>();
        lista.add("Zara");
        lista.add("Ana");
        lista.add("Bob");

        Collections.sort(lista);        // [Ana, Bob, Zara]
        Collections.reverse(lista);     // [Zara, Bob, Ana]
        Collections.shuffle(lista);     // ordre aleatori
        String max = Collections.max(lista);    // "Zara" (ordre alfabètic)
        String min = Collections.min(lista);    // "Ana"
        int veces = Collections.frequency(lista, "Ana"); // quantes vegades apareix
        Collections.replaceAll(lista, "Ana", "Ana María");
        Collections.rotate(lista, 2);   // rota 2 posicions
    }
}
```

El repertori essencial:

| Mètode | Què fa |
|---|---|
| `sort(lista)` | Ordena la llista al lloc |
| `reverse(lista)` | Li dona la volta |
| `shuffle(lista)` | Mescla a l'atzar |
| `max(lista)` / `min(lista)` | El major / el menor |
| `frequency(lista, e)` | Quantes vegades apareix `e` |
| `replaceAll(lista, vell, nou)` | Substituïx totes les aparicions |
| `rotate(lista, k)` | Rota els elements `k` posicions |
| `binarySearch(lista, e)` | Busca (llista ordenada) |
| `copy(destí, origen)` | Copia una llista en una altra |

> 📝 **Nota:** `Collections.sort()` ordena la **llista original** (la modifica). Si no vols tocar la teua, copia-la abans: `ArrayList<String> copia = new ArrayList<>(lista);` i ordena la còpia.

---

## ⚠️ Els mètodes que modifiquen la teua llista

Quasi tots els mètodes de `Collections` que comencen amb un verb ("sort", "shuffle", "reverse", "rotate"...) **modifiquen la llista que els passes**. No tornen una de nova: canvien la original.

```java
ArrayList<Integer> nums = new ArrayList<>();
nums.add(3);
nums.add(1);
nums.add(2);

Collections.sort(nums);      // nums ARA és [1, 2, 3]
System.out.println(nums);    // [1, 2, 3] - la original, modificada
```

> ⚠️ **Advertència:** si necessites conservar la llista original, fes sempre una còpia abans: `new ArrayList<>(lista)`. És l'error típic de qui ordena sense voler la seua llista de la compra.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** els mètodes estàtics de `Collections` són potents però van a per l'original: `sort`, `shuffle` i `reverse` modifiquen la teua llista. Copia-te-la abans si la necessites intacta.

**Exercici: Collections en acció**

```java
import java.util.*;

public class BeTheCollections {
    public static void main(String[] args) {
        ArrayList<Integer> nums = new ArrayList<>();
        nums.add(5);
        nums.add(1);
        nums.add(8);
        nums.add(3);

        Collections.sort(nums);
        Collections.reverse(nums);

        System.out.println(nums.get(1));
    }
}
```

**Què imprimeix?**

- (A) 1
- (B) 3
- (C) 5
- (D) 8

<details>
<summary>🔄 Solució</summary>

La **C**. `sort` → `{1, 3, 5, 8}`. `reverse` → `{8, 5, 3, 1}`. `get(1)` = 5. Dos mètodes estàtics en dos línies i ja tens la llista manipulada. Sense bucles a mà.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. `Collections.sort()` modifica la llista original?
2. Quin mètode de `Collections` torna l'element major segons l'ordre natural?
3. Quin mètode mescla una llista a l'atzar?
4. Com comptes quantes vegades apareix un element en una llista amb `Collections`?

<details>
<summary>🔄 Respostes</summary>

1. Sí. Modifica la llista al lloc. Si vols conservar la teua, copia-la primer amb `new ArrayList<>(lista)`.
2. `Collections.max(lista)`. Torna el major segons l'ordre natural del tipus.
3. `Collections.shuffle(lista)`.
4. `Collections.frequency(lista, e)`.

</details>

---

## ✅ Resum en 3 frases

1. **Collections** és la navalla suïssa estàtica: `sort`, `reverse`, `shuffle`, `max`, `min`, `frequency`...
2. La majoria dels seus mètodes **modifiquen la llista original**: copia-te-la abans si la necessites intacta.
3. És la germana de la classe `Arrays` (vista en la U04), però aplicada a col·leccions: mateixa idea, altres paràmetres.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Classe utilitària | Classe de mètodes estàtics que no s'instancia |
> | Modificar al lloc | Canviar la pròpia col·lecció (no una còpia) |
> | Ordre natural | L'ordre per defecte del tipus (numèric, alfabètic) |
> | `shuffle` | Mesclar a l'atzar |
> | `frequency` | Comptar aparicions |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/10-colecciones) · **Anterior:** [05 · Iterator: el cambrer que pren nota](/ApuntesProgramacion/va/10-colecciones/05-iterator) · **Següent:** [07 · Triar la col·lecció adequada](/ApuntesProgramacion/va/10-colecciones/07-elegir-coleccion)