---
title: "03 — HashSet: el porter sense duplicats"
description: "La discoteca de Java: no deixa entrar ningú que ja estiga dins, i és O(1) per a preguntar ja ho tinc? 🚫"
---

<p><small>La discoteca de Java: no deixa entrar ningú que ja estiga dins, i és O(1) per a preguntar ja ho tinc? 🚫</small></p>

> 🗺️ **Estàs en:** 📚 **U10 · Col·leccions** → 03 · HashSet: el porter sense duplicats

---

## 📬 La idea en una frase

> **HashSet és una discoteca: no deixa entrar ningú que ja estiga dins. Sense duplicats, sense ordre i O(1) per a la pregunta del milió: ja ho tinc?**

Al punt 2 vas conéixer les llistes: ordre i duplicats benvinguts. Ara canvia el ball: hi ha problemes on els repetits sobren i l'ordre no importa. Ahí apareix el porter més eficient de Java.

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

## 🎲 Un HashSet no té ordre

Això és important: **HashSet no garantix cap ordre**. Si fiques `{"roig", "verd", "blau"}`, en imprimir pot eixir `[blau, roig, verd]`, `[verd, roig, blau]` o qualsevol altra combinació. No et fies de l'ordre, fia-te'n de `size()` i `contains()`.

```java
HashSet<String> colores = new HashSet<>();
colores.add("roig");
colores.add("verd");
colores.add("blau");
System.out.println(colores); // [roig, verd, blau]? Pot ser, pot ser que no...
```

> 💡 **Consell:** si et dona igual l'ordre i només vols saber quins elements hi ha sense repetir, HashSet és la teua col·lecció. Si a més els vols ordenats, mira el punt 4 (TreeSet).

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

1. Quants elements hi ha en un `HashSet` després d'afegir `a, b, a, c, b`?
2. `HashSet` garantix algun ordre en imprimir?
3. Quins mètodes usa HashSet per dins per a saber si un element ja hi és?
4. Quina és la complexitat de `contains()` en un `HashSet`?

<details>
<summary>🔄 Respostes</summary>

1. 3 (`a`, `b`, `c`). Els duplicats no entren.
2. No. Cap. Si necessites ordre, mira TreeSet (punt 4) o LinkedHashSet (també al punt 4).
3. `hashCode()` per a trobar el "calaix" i `equals()` per a confirmar si hi ha un element igual dins.
4. O(1) en el cas normal. Eixa és la seua gran avantatge davant de recórrer una llista.

</details>

---

## ✅ Resum en 3 frases

1. **HashSet** és el porter sense duplicats: no admet repetits i no ordena res.
2. És **O(1)** per a afegir, esborrar i comprovar pertinença: la resposta ràpida a "ja ho tinc?".
3. Es recolza en **`hashCode()` i `equals()`**: si sobreescrius `equals()` en una classe, sobreescriu també `hashCode()`, o HashSet s'ho passarà malament.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `Set` | Col·lecció sense duplicats |
> | `hashCode()` | "Número de calaix" que usa HashSet per a trobar elements |
> | `equals()` | Comparació d'igualtat entre objectes |
> | O(1) | Cost constant: instantani encara que hi haja un milió d'elements |
> | Duplicat | Element igual a un altre segons `equals()` |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/10-colecciones) · **Anterior:** [02 · LinkedList: la conga line](/ApuntesProgramacion/va/10-colecciones/02-linkedlist) · **Següent:** [04 · TreeSet i LinkedHashSet: l'ordenat i el que recorda](/ApuntesProgramacion/va/10-colecciones/04-treeset-linkedhashset)