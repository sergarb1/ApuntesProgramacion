---
title: "04 · Iterator i Collections: recórrer i manipular"
description: "El camarer que recorre qualsevol col·lecció i esborra sense trencar res, i la navalla suïssa que ordena, barreja i consulta en una línia 🍽️🧰"
---

<p><small>El camarer que recorre qualsevol col·lecció i esborra sense trencar res, i la navalla suïssa que ordena, barreja i consulta en una línia 🍽️🧰</small></p>

> 🗺️ **Estàs en:** 📚 **U11 · Col·leccions, genèrics i mapes** → 04 · Iterator i Collections

---

## 📬 La idea en una frase

> **`Iterator` recorre qualsevol col·lecció i el seu `remove()` és l'única forma segura d'esborrar durant el recorregut; `Collections` és la navalla suïssa de mètodes `static` que fa en una línia el que tu tardaries en deu.**

En els punts anteriors vas recórrer llistes i conjunts amb `for-each` sense preguntar-te com funcionaven per dins. Eixe `for-each` té un superheroi treballant per davall: l'`Iterator`. I una vegada saps recórrer, toca manipular sense escriure bucles a mà: per a això està `Collections`, la germana de la classe `Arrays` que vas veure en la U05.

---

## 🍽️ Iterator: el camarer que pren nota

`Iterator` recorre una col·lecció **sense que sapies ni t'importe com està implementada per dins**. És com un camarer: «Què vol? I vosté? I vosté?»

```java
import java.util.ArrayList;
import java.util.Iterator;

public class EjemploIterator {
    public static void main(String[] args) {
        ArrayList<String> platos = new ArrayList<>();
        platos.add("Tortilla");
        platos.add("Paella");
        platos.add("Croquetas");

        Iterator<String> it = platos.iterator();
        while (it.hasNext()) {          // queda alguna cosa?
            String plato = it.next();   // dona-m'l
            System.out.println(plato);
        }
    }
}
```

El protocol del camarer:

| Mètode | Què fa |
|---|---|
| `hasNext()` | Hi ha més elements? (`boolean`) |
| `next()` | Torna el següent i avança |
| `remove()` | Esborra l'últim element tornat per `next()` |

> 💡 **Consell:** el `for-each` usa un `Iterator` per davall. Per això pots usar `for-each` amb qualsevol col·lecció: totes ho implementen. El for-each és l'atac; l'`Iterator` és l'eina amb superpoders (esborrar).

### 💥 La superpotència: esborrar durant el recorregut

Ací està la joia. **Mai** faces `lista.remove(elemento)` mentre uses un `for-each`:

```java
ArrayList<String> platos = new ArrayList<>();
platos.add("Tortilla");
platos.add("Paella");
platos.add("Croquetas");

// MAL: ConcurrentModificationException
for (String plato : platos) {
    if (plato.equals("Paella")) {
        platos.remove(plato);   // BOOM
    }
}
```

> ⚠️ **Advertència:** esborrar amb `lista.remove()` mentre un for-each recorre la llista llença `ConcurrentModificationException`. El for-each no sap que la llista ha canviat per davall i s'eixelebrix. Usa SEMPRE `iterator.remove()` si necessites esborrar durant el recorregut.

La forma correcta:

```java
Iterator<String> it = platos.iterator();
while (it.hasNext()) {
    String plato = it.next();
    if (plato.equals("Paella")) {
        it.remove(); // ESBORRA de la llista ORIGINAL, sense excepció
    }
}
// Ara platos = [Tortilla, Croquetas]
```

`it.remove()` esborra l'element que acabava de tornar `next()` de la col·lecció original. És l'única forma segura d'«esborrar mentre recorres».

---

## 🧰 Collections: l'aliat utilitari

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
| `sort(lista)` | Ordena la llista en el lloc |
| `reverse(lista)` | Li dona la volta |
| `shuffle(lista)` | Barreja a l'atzar |
| `max(lista)` / `min(lista)` | El major / el menor |
| `frequency(lista, e)` | Quantes vegades apareix `e` |
| `replaceAll(lista, viejo, nuevo)` | Substituïx totes les aparicions |
| `rotate(lista, k)` | Rota els elements `k` posicions |
| `binarySearch(lista, e)` | Busca (llista ordenada) |
| `copy(destino, origen)` | Copia una llista en una altra |

> 📝 **Nota:** `Collections.sort()` ordena la **llista original** (la modifica). Si no vols tocar la teua, copia-la abans: `ArrayList<String> copia = new ArrayList<>(lista);` i ordena la còpia.

### ⚠️ Els mètodes que modifiquen la teua llista

Gairebé tots els mètodes de `Collections` que comencen amb un verb («sort», «shuffle», «reverse», «rotate»...) **modifiquen la llista que els pases**. No tornen una de nova: canvien l'original.

```java
ArrayList<Integer> nums = new ArrayList<>();
nums.add(3);
nums.add(1);
nums.add(2);

Collections.sort(nums);      // nums ARA és [1, 2, 3]
System.out.println(nums);    // [1, 2, 3] - l'original, modificada
```

> ⚠️ **Advertència:** si necessites conservar la llista original, fes sempre una còpia abans: `new ArrayList<>(lista)`. És l'error típic de qui ordena sense voler la seua llista de la compra.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `it.remove()` esborra l'últim element tornat per `next()`. Mai crides a `remove()` sense un `next()` just abans. I recorda: els mètodes `static` de `Collections` van a per l'original.

**Exercici 1: què imprimeix (o què llença)?**

```java
import java.util.ArrayList;

public class BeTheIterator {
    public static void main(String[] args) {
        ArrayList<String> nombres = new ArrayList<>();
        nombres.add("Ana");
        nombres.add("Bob");
        nombres.add("Carla");

        for (String n : nombres) {
            if (n.equals("Bob")) {
                nombres.remove(n);
            }
        }
        System.out.println(nombres);
    }
}
```

**Què passa?**

- (A) Imprimeix `[Ana, Carla]`
- (B) Imprimeix `[Ana, Bob, Carla]`
- (C) Llença `ConcurrentModificationException`
- (D) No compila

<details>
<summary>🔄 Solució</summary>

La **C**. El `for-each` usa un `Iterator` intern. En esborrar amb `nombres.remove(n)` mentre l'iterador recorre la llista, la col·lecció canvia «per l'esquena» i l'iterador llença `ConcurrentModificationException`. La solució: recórrer amb `Iterator` explícit i usar `it.remove()`.

</details>

**Exercici 2: Collections en acció**

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

La **C**. `sort` → `{1, 3, 5, 8}`. `reverse` → `{8, 5, 3, 1}`. `get(1)` = 5. Dos mètodes `static` en dues línies i ja tens la llista manipulada. Sense bucles a mà.

</details>

---

## 🎯 Mini-chequeig

Posa't a prova en 30 segons (les respostes estan amagades):

1. Quina excepció llença esborrar amb `lista.remove()` dins d'un `for-each`?
2. Com s'esborra un element mentre es recorre amb `Iterator`?
3. `Collections.sort()` modifica la llista original?
4. Quin mètode de `Collections` torna l'element major segons l'ordre natural?

<details>
<summary>🔄 Respostes</summary>

1. `ConcurrentModificationException`. El for-each no detecta que la llista ha canviat i s'eixelebrix.
2. Amb `it.remove()` just després de `it.next()`. Esborra l'últim element tornat, de la col·lecció original.
3. Sí. Modifica la llista en el lloc. Si vols conservar la teua, copia-la primer amb `new ArrayList<>(lista)`.
4. `Collections.max(lista)`. Torna el major segons l'ordre natural del tipus.

</details>

---

## ✅ Resum en 3 frases

1. **Iterator** recorre qualsevol col·lecció amb `hasNext()` / `next()`, i el seu `remove()` és l'única forma segura d'**esborrar durant el recorregut**.
2. **Collections** és la navalla suïssa estàtica: `sort`, `reverse`, `shuffle`, `max`, `min`, `frequency`...
3. La majoria dels mètodes de `Collections` **modifiquen la llista original**: fes-te una còpia abans si la necessites intacta.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Iterador | Objecte que recorre una col·lecció sense exposar la seua estructura |
> | `ConcurrentModificationException` | Error en modificar la col·lecció mentre es recorre |
> | Classe utilitària | Classe de mètodes `static` que no s'instància |
> | Modificar en el lloc | Canviar la pròpia col·lecció (no una còpia) |
> | `shuffle` | Barrejar a l'atzar |
> | `frequency` | Comptar aparicions |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/11-colecciones) · **Anterior:** [03 · HashSet, TreeSet i LinkedHashSet](/ApuntesProgramacion/va/11-colecciones/03-conjuntos-sets) · **Següent:** [05 · Classes genèriques: la teua `Caja<T>`](/ApuntesProgramacion/va/11-colecciones/05-clases-genericas)
