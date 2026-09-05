---
title: "02 — LinkedList: la conga line"
description: "La llista que encadena els seus elements com una conga: rapidíssima al principi i al final, i perfecta per a cues i piles 🎉"
---

<p><small>La llista que encadena els seus elements com una conga: rapidíssima al principi i al final, i perfecta per a cues i piles 🎉</small></p>

> 🗺️ **Estàs en:** 📚 **U10 · Col·leccions** → 02 · LinkedList: la conga line

---

## 📬 La idea en una frase

> **LinkedList encadena els seus elements com una conga: cadascun sap qui va davant i qui darrere, i és rapidíssima per a afegir o esborrar al principi i al final.**

Al punt 1 vas vore `ArrayList`, la llista de tots els dies. Ara toca conéixer la seua cosina, que resol un problema diferent: ficar i traure gent pels extrems sense que res es descoloque. És la col·lecció perfecta per a cues i piles.

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

## 🛒 Cues i piles: les dos disfresses de LinkedList

LinkedList és camaleònica: segons quins mètodes uses, es comporta com una cua o com una pila.

**Cua (FIFO):** el primer que arriba és el primer que ix. Com la fila del supermercat.

```java
LinkedList<String> cola = new LinkedList<>();
cola.addLast("Ana");     // Ana es posa al final
cola.addLast("Bob");     // Bob darrere d'Ana
cola.addLast("Carla");   // Carla darrere de Bob
String atendido = cola.removeFirst(); // "Ana" - la primera que va arribar
```

**Pila (LIFO):** l'últim que entra és el primer que ix. Com la pila de plats: el de dalt de tot és el que agafes.

```java
LinkedList<String> pila = new LinkedList<>();
pila.addFirst("plat 1");  // base
pila.addFirst("plat 2");
pila.addFirst("plat 3");  // l'últim apilat
String quito = pila.removeFirst(); // "plat 3" - l'últim que va entrar
```

> ⚠️ **Advertència:** quan la cua està buida, `removeFirst()` i `getFirst()` llancen una `NoSuchElementException`. Pregunta abans amb `isEmpty()`, o usa `peek()` i `poll()`, que tornen `null` en comptes d'explotar.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `addLast` + `removeFirst` = cua FIFO. `addFirst` + `removeFirst` = pila LIFO. Triar els mètodes, no la classe.

**Exercici: el que es cola a la conga**

```java
import java.util.LinkedList;

public class BeTheConga {
    public static void main(String[] args) {
        LinkedList<String> conga = new LinkedList<>();
        conga.addLast("Ana");
        conga.addLast("Bob");
        conga.addFirst("Carlos");   // es cola
        conga.removeLast();

        System.out.println(conga.getFirst());
    }
}
```

**Què imprimeix?**

- (A) Ana
- (B) Bob
- (C) Carlos
- (D) Error d'execució

<details>
<summary>🔄 Solució</summary>

La **C**. `addLast("Ana")` → `[Ana]`, `addLast("Bob")` → `[Ana, Bob]`, `addFirst("Carlos")` → `[Carlos, Ana, Bob]`. `removeLast()` trau Bob → `[Carlos, Ana]`. `getFirst()` torna Carlos. La conga queda tallada pel principi, no pel final.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quina col·lecció usaríes per a una cua de supermercat?
2. Què fa `removeFirst()` sobre una llista buida si uses `peek()`/`poll()` en el seu lloc?
3. Quina és la diferència clau de rendiment entre `LinkedList` i `ArrayList`?
4. Amb `addFirst` + `removeFirst`, estàs simulant una cua o una pila?

<details>
<summary>🔄 Respostes</summary>

1. `LinkedList`, amb els seus mètodes `addLast` i `removeFirst`: la cua FIFO del supermercat.
2. `peek()` torna `null` sense tocar la llista; `poll()` torna `null` i no llança excepció. `removeFirst()` directe sobre buida llança `NoSuchElementException`.
3. `LinkedList` brilla afegint/esborrant als extrems; `ArrayList` brilla amb l'accés aleatori `get(i)`, que va directe a l'índex.
4. Una pila (LIFO): l'últim que entra és el primer que ix.

</details>

---

## ✅ Resum en 3 frases

1. **LinkedList** encadena els seus elements (la conga): cadascun sap qui va davant i darrere.
2. És **rapidíssima al principi i al final**, i per això és la reina de les **cues (FIFO)** i les **piles (LIFO)**.
3. Per a accés aleatori freqüent (`get(i)`), guanya `ArrayList`: `LinkedList` ha de saltar d'anella en anella.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Llista enllaçada | Elements encadenats que saben qui va davant i darrere |
> | FIFO | First In, First Out: la cua del supermercat |
> | LIFO | Last In, First Out: la pila de plats |
> | `peek()` | Mirar el primer sense traure'l |
> | `poll()` | Traure el primer sense llançar excepció si està buida |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/10-colecciones) · **Anterior:** [01 · ArrayList i el Java Collections Framework](/ApuntesProgramacion/va/10-colecciones/01-arraylist-jcf) · **Següent:** [03 · HashSet: el porter sense duplicats](/ApuntesProgramacion/va/10-colecciones/03-hashset)