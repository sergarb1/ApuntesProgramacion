---
title: "05 — Iterator: el cambrer que pren nota"
description: "Recorre qualsevol col·lecció sense que t'importe la seua estructura, i el seu remove() és l'única forma segura d'esborrar mentre avances 🍽️"
---

<p><small>Recorre qualsevol col·lecció sense que t'importe la seua estructura, i el seu remove() és l'única forma segura d'esborrar mentre avances 🍽️</small></p>

> 🗺️ **Estàs en:** 📚 **U10 · Col·leccions** → 05 · Iterator: el cambrer que pren nota

---

## 📬 La idea en una frase

> **`Iterator` recorre qualsevol col·lecció sense que t'importe com està feta per dins, i el seu `remove()` és l'única forma segura d'esborrar durant el recorregut sense que explote res.**

En els punts anteriors vas recórrer llistes i conjunts amb `for-each` sense preguntar-te com funcionaven per dins. Eixe `for-each` té un superheroi treballant per darrere: l'`Iterator`. Hui el coneixeràs en persona, i descobriràs el seu superpoder.

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

---

## 💥 El superpoder: esborrar durant el recorregut

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

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `it.remove()` esborra l'últim element tornat per `next()`. Mai no crides `remove()` sense un `next()` just abans.

**Exercici: què imprimeix (o què llança)?**

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

**Què ocorre?**

- (A) Imprimeix `[Ana, Carla]`
- (B) Imprimeix `[Ana, Bob, Carla]`
- (C) Llança `ConcurrentModificationException`
- (D) No compila

<details>
<summary>🔄 Solució</summary>

La **C**. El `for-each` usa un `Iterator` intern. En esborrar amb `nombres.remove(n)` mentre l'iterador recorre la llista, la col·lecció canvia "per l'esquena" i l'iterador llança `ConcurrentModificationException`. La solució: recórrer amb `Iterator` explícit i usar `it.remove()`.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quina excepció llança esborrar amb `lista.remove()` dins d'un `for-each`?
2. Com s'esborra un element mentre es recorre amb `Iterator`?
3. Quin mètode de l'`Iterator` torna el següent element?
4. Per què el `for-each` funciona amb qualsevol col·lecció?

<details>
<summary>🔄 Respostes</summary>

1. `ConcurrentModificationException`. El for-each no detecta que la llista ha canviat i es torna boig.
2. Amb `it.remove()` just després de `it.next()`. Esborra l'últim element tornat, de la col·lecció original.
3. `next()`.
4. Perquè el `for-each` usa un `Iterator` per darrere, i totes les col·leccions del JCF l'implementen.

</details>

---

## ✅ Resum en 3 frases

1. **Iterator** recorre qualsevol col·lecció amb `hasNext()` / `next()`, sense exposar la seua estructura interna.
2. El seu `remove()` és l'única forma segura d'**esborrar durant el recorregut**.
3. Esborrar amb `lista.remove()` dins d'un `for-each` llança `ConcurrentModificationException`: error d'examen garantit.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Iterador | Objecte que recorre una col·lecció sense exposar la seua estructura |
> | `ConcurrentModificationException` | Error en modificar la col·lecció mentre es recorre |
> | `hasNext()` | Queden més elements? |
> | `next()` | Torna el següent i avança |
> | `remove()` | Esborra l'últim element tornat per `next()` |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/10-colecciones) · **Anterior:** [04 · TreeSet i LinkedHashSet: l'ordenat i el que recorda](/ApuntesProgramacion/va/10-colecciones/04-treeset-linkedhashset) · **Següent:** [06 · La classe Collections: la navalla suïssa](/ApuntesProgramacion/va/10-colecciones/06-collections)