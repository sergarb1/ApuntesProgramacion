---
title: "08 — Iterator i la classe Collections"
description: "El cambrer que pren nota un a un i la navalla suïssa de les col·leccions: sort, max, min i companyia 🍽️"
---

<p><small>El cambrer que pren nota un a un i la navalla suïssa de les col·leccions: sort, max, min i companyia 🍽️</small></p>

> 🗺️ **Estàs en:** 📚 **U09 · Arrays i Col·leccions** → 08 · Iterator i la classe Collections

---

## 📬 La idea en una frase

> **`Iterator` recorre qualsevol col·lecció sense que t'importe com està feta per dins (i permet esborrar durant el recorregut); `Collections` aporta els mètodes estàtics per a ordenar, remenar i consultar les teues col·leccions.**

Dues ferramentes tanquen el cercle de les col·leccions: una per a **recórrer** amb seguretat (i esborrar sense morir en l'intent) i una altra per a **manipular** llistes i conjunts amb un sol mètode. Anem a per elles.

---

## 🍽️ Iterator: el cambrer que pren nota

`Iterator` recorre una col·lecció **sense que sàpigues ni t'importe com està implementada per dins**. És com un cambrer: "Què vol? I vosté? I vosté?"

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
            String plato = it.next();   // dona-me'l
            System.out.println(plato);
        }
    }
}
```

El protocol del cambrer:

| Mètode | Què fa |
|---|---|
| `hasNext()` | Hi ha més elements? (`boolean`) |
| `next()` | Torna el següent i avança |
| `remove()` | Esborra l'últim element tornat per `next()` |

> 💡 **Consell:** el `for-each` usa un `Iterator` per darrere. Per això pots usar `for-each` amb qualsevol col·lecció: totes l'implementen. El for-each és la drecera; l'`Iterator` és la ferramenta amb superpoders (esborrar).

### El superpoder: esborrar durant el recorregut

Ací està la joia. **Mai** no faces `lista.remove(elemento)` mentre uses un `for-each`:

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

> ⚠️ **Advertència:** esborrar amb `lista.remove()` mentre un for-each recorre la llista llança `ConcurrentModificationException`. El for-each no sap que la llista ha canviat per darrere i es torna boig. Usa SEMPRE `iterator.remove()` si necessites esborrar durant el recorregut.

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

`it.remove()` esborra l'element que acaba de tornar `next()` de la col·lecció original. És l'única forma segura d'"esborrar mentre recórres".

---

## 🧰 Collections: l'amic utilitari

Igual que `Arrays` era la navalla suïssa dels arrays, `Collections` ho és de les col·leccions. Mètodes estàtics (de la U07) que fan en una línia el que tu tardaries en 10:

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

1. Quina excepció llança esborrar amb `lista.remove()` dins d'un `for-each`?
2. Com s'esborra un element mentre es recorre amb `Iterator`?
3. `Collections.sort()` modifica la llista original?
4. Quin mètode de `Collections` torna l'element major segons l'ordre natural?

<details>
<summary>🔄 Respostes</summary>

1. `ConcurrentModificationException`. El for-each no detecta que la llista ha canviat i es torna boig.
2. Amb `it.remove()` just després de `it.next()`. Esborra l'últim element tornat, de la col·lecció original.
3. Sí. Modifica la llista al lloc. Si vols conservar la teua, copia-la primer amb `new ArrayList<>(lista)`.
4. `Collections.max(lista)`. Torna el major segons l'ordre natural del tipus.

</details>

---

## ✅ Resum en 3 frases

1. **Iterator** recorre qualsevol col·lecció amb `hasNext()` / `next()`, i el seu `remove()` és l'única forma segura d'**esborrar durant el recorregut**.
2. Esborrar amb `lista.remove()` dins d'un `for-each` llança `ConcurrentModificationException`: error d'examen garantit.
3. **Collections** és la navalla suïssa estàtica: `sort`, `reverse`, `shuffle`, `max`, `min`, `frequency`... i tots modifiquen o consulten la col·lecció original.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Iterador | Objecte que recorre una col·lecció sense exposar la seua estructura |
> | `ConcurrentModificationException` | Error en modificar la col·lecció mentre es recorre |
> | Modificar al lloc | Canviar la pròpia col·lecció (no una còpia) |
> | Ordre natural | L'ordre per defecte del tipus (numèric, alfabètic) |
> | Classe utilitària | Classe de mètodes estàtics que no s'instancia |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/09-arrays-colecciones) · **Anterior:** [07 · LinkedList, HashSet i TreeSet](/ApuntesProgramacion/va/09-arrays-colecciones/07-linkedlist-hashset) · **Següent:** [09 · Repàs interactiu](/ApuntesProgramacion/va/09-arrays-colecciones/09-repaso-interactivo)