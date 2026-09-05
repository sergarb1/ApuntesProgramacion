---
title: "08 — Be the Code: col·leccions en acció"
description: "Sé el Código pur: prediu l'eixida, caça el bug i decidix quina col·lecció encaixa abans que compile res 🧪"
---

<p><small>Sé el Código pur: prediu l'eixida, caça el bug i decidix quina col·lecció encaixa abans que compile res 🧪</small></p>

> 🗺️ **Estàs en:** 📚 **U10 · Col·leccions** → 08 · Be the Code: col·leccions en acció

---

## 📬 La idea en una frase

> **Només hi ha una forma de saber si domines les col·leccions: predir què fa un programa sense executar-lo, caçar el bug que s'amaga i triar la col·lecció adequada a ull.**

Els punts 1 a 7 et van donar les peces. Ara les mesclem totes: índexs que es desplacen, `remove` per valor o per índex, `HashSet` que ignora duplicats, `Iterator` que esborra sense trencar i `Collections` que ho remena tot. Posat les ulleres de la JVM.

---

## 🧪 Sé el Código: la llista que es desplaça

> *Eres la JVM. Executa este programa:*

```java
import java.util.ArrayList;

public class BeTheDomino {
    public static void main(String[] args) {
        ArrayList<String> lista = new ArrayList<>();
        lista.add("A");
        lista.add("B");
        lista.add("C");
        lista.add("D");
        lista.remove(1);          // adéu, "B"
        lista.add(1, "X");        // "X" empeny la resta
        lista.remove("D");        // adéu, "D" per objecte

        System.out.println(lista);
    }
}
```

**Què imprimeix?**

- (A) `[A, X, C, D]`
- (B) `[A, X, C]`
- (C) `[A, B, C]`
- (D) `[X, A, C]`

<details>
<summary>🔄 Solució</summary>

La **B**. `remove(1)` esborra la posició 1 ("B") → `[A, C, D]`. `add(1, "X")` inserix "X" a la posició 1 i desplaça els altres → `[A, X, C, D]`. `remove("D")` esborra l'objecte "D" → `[A, X, C]`. Els índexs són fitxes de dòmino: cada esborrat o inserció els mou tots.

</details>

---

## 🧪 Sé el Código: el porter i el duplicat

> *Eres el compilador. Açò compila i què fa?*

```java
import java.util.ArrayList;
import java.util.HashSet;

public class BeTheMix {
    public static void main(String[] args) {
        ArrayList<Integer> numeros = new ArrayList<>();
        numeros.add(2);
        numeros.add(3);
        numeros.add(2);
        numeros.add(5);

        HashSet<Integer> unicos = new HashSet<>(numeros);
        numeros.remove(Integer.valueOf(2));

        System.out.println(unicos.size() + " " + numeros.size());
    }
}
```

**Què imprimeix?**

- (A) `4 3`
- (B) `3 3`
- (C) `3 4`
- (D) `4 4`

<details>
<summary>🔄 Solució</summary>

La **B**. `new HashSet<>(numeros)` es construïx amb els valors de la llista: `{2, 3, 5}` (el 2 repetit no entra), així que `unicos.size()` = 3. Després `numeros.remove(Integer.valueOf(2))` esborra la **primera** aparició de l'objecte 2 → la llista queda `[3, 2, 5]`, amb `size()` = 3. Compte: el `HashSet` ja es va construir abans de l'esborrat, així que no se n'assabenta de res.

</details>

---

## 🧪 Sé el Código: el bucle que explota

> *Eres la JVM. Què passa ací?*

```java
import java.util.ArrayList;

public class BeTheBoom {
    public static void main(String[] args) {
        ArrayList<String> nombres = new ArrayList<>();
        nombres.add("Ana");
        nombres.add("Bob");
        nombres.add("Carla");
        nombres.add("David");

        for (String n : nombres) {
            if (n.startsWith("C")) {
                nombres.remove(n);
            }
        }
        System.out.println(nombres);
    }
}
```

**Què ocorre?**

- (A) Imprimeix `[Ana, Bob, David]`
- (B) Imprimeix `[Ana, Bob, Carla, David]`
- (C) Llança `ConcurrentModificationException`
- (D) Llança `ArrayIndexOutOfBoundsException`

<details>
<summary>🔄 Solució</summary>

La **C**. El `for-each` recorre amb un `Iterator` intern. Quan `remove("Carla")` canvia la llista per l'esquena, l'iterador ho detecta i llança `ConcurrentModificationException`. La solució correcta: `Iterator<String> it = nombres.iterator();` i esborrar amb `it.remove()`.

</details>

---

## 🧪 Sé el Código: Collections ho remena tot

> *Eres la JVM. Quina és l'última línia?*

```java
import java.util.*;

public class BeTheShuffle {
    public static void main(String[] args) {
        ArrayList<Integer> nums = new ArrayList<>();
        nums.add(4);
        nums.add(2);
        nums.add(6);
        nums.add(1);

        Collections.sort(nums);
        Collections.reverse(nums);
        int max = Collections.max(nums);
        int veces = Collections.frequency(nums, 6);

        System.out.println(nums.get(0) + " " + max + " " + veces);
    }
}
```

**Què imprimeix?**

- (A) `6 6 1`
- (B) `1 6 1`
- (C) `6 1 1`
- (D) `6 6 0`

<details>
<summary>🔄 Solució</summary>

La **A**. `sort` → `[1, 2, 4, 6]`. `reverse` → `[6, 4, 2, 1]`. `max` = 6 (el major). `frequency` de 6 = 1 (apareix una volta). `get(0)` = 6. Eixida: `6 6 1`.

</details>

---

## 🧪 Sé el Código: tria la col·lecció

> *Eres la persona que decidix. Per a cada escenari, una línia: quina col·lecció i per què.*

1. Guardar les matrícules dels cotxes d'un aparcament, **sense repetir** i sense que importe l'ordre.
2. Simular la **fila** de la cafeteria a l'hora del pati.
3. Ordenar per nota una llista d'alumnes (la nota pot repetir-se).
4. Eliminar duplicats d'una llista **conservant l'ordre d'arribada**.

<details>
<summary>🔄 Solucions</summary>

1. **HashSet** — no admet duplicats i `contains` és O(1) per a saber si ja està aparcat.
2. **LinkedList** — FIFO amb `addLast` i `removeFirst`.
3. **ArrayList** + `Collections.sort()` — es pot ordenar amb notes repetides.
4. **LinkedHashSet** — elimina repetits i recorda l'ordre d'inserció.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. `lista.remove(1)` amb `lista.add(1, "X")` després: què passa amb els elements que estaven a partir de l'índex 1?
2. Què llança esborrar amb `lista.remove()` dins d'un `for-each`?
3. `Collections.sort()` torna una llista nova o ordena la que li passes?
4. Quina col·lecció dona `size()` = 3 si fiques `{2, 3, 2, 5}`?

<details>
<summary>🔄 Respostes</summary>

1. `remove(1)` esborra la posició 1 i desplaça els següents cap a l'esquerra; `add(1, "X")` inserix a la posició 1 i desplaça els següents cap a la dreta. Els índexs es mouen com fitxes de dòmino.
2. `ConcurrentModificationException`. El `for-each` recorre amb un `Iterator` intern que detecta el canvi.
3. Ordena la que li passes: la modifica al lloc. Per a conservar la teua, copia-la abans.
4. `HashSet` (o `LinkedHashSet`): el 2 repetit només entra una volta → `{2, 3, 5}`.

</details>

---

## ✅ Resum en 3 frases

1. **Be the Code** és llegir codi com el llig la JVM: sense executar, sense endevinar, amb les regles al cap.
2. Les trampes favorites: `remove(índex)` vs `remove(objecte)`, esborrar durant un `for-each` i confiar en l'ordre d'un `HashSet`.
3. Si predius correctament l'eixida d'estos cinc programes, domines la unitat.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Desplaçar índexs | Efecte dòmino en inserir o esborrar en una llista |
> | `remove(objecte)` | Esborra la primera aparició d'eixe objecte |
> | `remove(índex)` | Esborra la posició indicada |
> | `ConcurrentModificationException` | Boom en modificar mentre es recorre |
> | Be the Code | Llegir codi i predir la seua eixida sense executar-lo |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/10-colecciones) · **Anterior:** [07 · Triar la col·lecció adequada](/ApuntesProgramacion/va/10-colecciones/07-elegir-coleccion) · **Següent:** [09 · Repàs interactiu](/ApuntesProgramacion/va/10-colecciones/09-repaso-interactivo)