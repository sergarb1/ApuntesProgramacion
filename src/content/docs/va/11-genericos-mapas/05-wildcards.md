---
title: "05 · Wildcards: `? extends T` i `? super T`"
description: "Covariància i contravariància: el comodí ? i el principi PECS de Joshua Bloch 🃏"
---

<p><small>Covariància i contravariància: el comodí ? i el principi PECS de Joshua Bloch 🃏</small></p>

> 🗺️ **Estàs en:** 🗺️ **U11 · Genèrics i Mapes** → 05 · Wildcards: `? extends T` i `? super T`

---

## 📬 La idea en una frase

> **Un wildcard (`?`) significa "qualsevol tipus". `? extends T` servix per a LLEGIR d'una jerarquia (producer) i `? super T` per a ESCRIURE-hi (consumer). Regla PECS: Producer Extends, Consumer Super.**

Fins ací tot perfecte: `Caja<String>`, `ArrayList<Integer>`... Però arriba el moment incòmode: `List<Number>` NO accepta una `List<Integer>`. I tu juraries que un Integer és un Number. Doncs no: els genèrics són invariants. Per a escriure mètodes que accepten jerarquies senceres, necessites els wildcards.

---

## 😱 El problema: `List<Number>` no accepta `List<Integer>`

```java
import java.util.*;

public class Invariante {
    public static double sumar(List<Number> numeros) {
        double total = 0.0;
        for (Number n : numeros) {
            total += n.doubleValue();
        }
        return total;
    }

    public static void main(String[] args) {
        List<Integer> enteros = Arrays.asList(1, 2, 3);
        // System.out.println(sumar(enteros));  // 🚫 Error de compilación
    }
}
```

Per què falla? Perquè si `sumar` acceptara `List<Integer>`, res impediria que afegires un `Double` a eixa llista dins del mètode, i aleshores `enteros` ja no seria només d'Integers. Per a protegir-te d'eixe caos, els genèrics són **invariants**: `List<Integer>` NO és una `List<Number>`, punt. La solució és el comodí `?`.

---

## 🃏 `? extends T`: el comodí de lectura (covariància)

`List<? extends Number>` significa "una llista de Number o de qualsevol subclasse seua". Servix per a **llegir**: saps que dins hi ha Numbers (o alguna cosa més específica), però no pots afegir res perquè no saps el tipus exacte.

```java
import java.util.*;

public class Wildcards {

    // ? extends T → solo LEER: acepta Integer, Double, Number...
    public static double sumar(List<? extends Number> numeros) {
        double total = 0.0;
        for (Number n : numeros) {
            total += n.doubleValue();
        }
        // numeros.add(42);  // 🚫 Error: no puedes añadir nada (excepto null)
        return total;
    }
}

// Uso: ahora sí compila
List<Integer> enteros = Arrays.asList(1, 2, 3);
List<Double> dobles = Arrays.asList(1.5, 2.5, 3.5);
sumar(enteros);  // ✅
sumar(dobles);   // ✅
```

Fixa't en l'asimetria: pots **llegir** tots els elements com a `Number` (perquè qualsevol subtipus és un Number), però **no pots escriure** perquè no saps si la llista és d'Integers o de Doubles.

---

## 🃏 `? super T`: el comodí d'escriptura (contravariància)

`List<? super Integer>` significa "una llista de Integer o de qualsevol supertipus seu (Number, Object)". Servix per a **escriure**: com qualsevol cosa que fiques serà un Integer, i una llista de Integer/Number/Object accepta Integers, pots afegir sense por. Però en llegir, només saps que és `Object`.

```java
import java.util.*;

public class Wildcards {

    // ? super T → solo ESCRIBIR: acepta lista de Integer, Number, Object...
    public static void rellenar(List<? super Integer> lista) {
        lista.add(1);
        lista.add(2);
        lista.add(3);
        // Integer n = lista.get(0);  // 🚫 Error: solo sabes que es Object
        Object obj = lista.get(0);    // ✅ Ok
    }
}

// Uso:
List<Number> numeros = new ArrayList<>();
List<Object> objetos = new ArrayList<>();
rellenar(numeros);   // ✅ ? super Integer funciona con Number
rellenar(objetos);   // ✅ ? super Integer funciona con Object
```

---

## 🧠 PECS: la mnemotècnia infalible

Joshua Bloch (l'autor de *Effective Java*) va resumir tot açò en quatre lletres que hauries de tatuar-te:

> - `? extends T` → **P**roducer **E**xtends: si el mètode SOLS produïx (llig/dona) dades, usa `extends`.
> - `? super T` → **C**onsumer **S**uper: si el mètode SOLS consumix (rep/escriu) dades, usa `super`.

El teu mètode llig de la col·lecció? → `? extends`. El teu mètode escriu en ella? → `? super`. Fa les dos coses? → no uses wildcard: usa `T` directament.

> ⚠️ **Advertència:** en els exàmens, la pregunta clàssica és "puc afegir un element a una `List<? extends Number>`?" La resposta és NO (excepte `null`). I "puc llegir amb tipus un element d'una `List<? super Integer>`?" Tampoc: només com a `Object`. PECS et salva de totes dos.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `?` significa "qualsevol tipus". `? extends Number` limita a Number i les seues subclasses, i és de només lectura.

**Exercici: el comodí que ho accepta tot**

```java
import java.util.*;

public class BeTheWildcard {
    public static void main(String[] args) {
        List<Integer> enteros = Arrays.asList(1, 2, 3);
        List<Double> dobles = Arrays.asList(1.5, 2.5, 3.5);
        printNumbers(enteros);  // ¿compila?
        printNumbers(dobles);   // ¿compila?
    }

    public static void printNumbers(List<? extends Number> lista) {
        for (Number n : lista) {
            System.out.print(n + " ");
        }
    }
}
```

**Quantes crides compilen?**

- (A) 0
- (B) 1
- (C) 2
- (D) Error en ambdues

<details>
<summary>🔄 Solució</summary>

La **C**. `List<? extends Number>` accepta qualsevol llista el tipus de la qual hereta de Number: tant `List<Integer>` com `List<Double>`. El mètode només llig (`for-each`), així que complix el costat "producer" de PECS sense problema. Imprimeix `1 2 3 1.5 2.5 3.5`.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què significa `? extends Number`?
2. Pots afegir un element a una `List<? extends Number>`?
3. Quin tipus pots llegir d'una `List<? super Integer>`?
4. Què diu la P de PECS?

<details>
<summary>🔄 Respostes</summary>

1. "Una llista de Number o de qualsevol subclasse seua" (només lectura).
2. No, excepte `null`: no saps el tipus exacte de la llista.
3. Només `Object`, perquè la llista podria ser de qualsevol supertipus de Integer.
4. Producer Extends: si el mètode produïx (llig) dades, usa `? extends`.

</details>

---

## ✅ Resum en 3 frases

1. Els genèrics són **invariants**: `List<Number>` no accepta `List<Integer>`. Els **wildcards** (`?`) resolen eixe problema.
2. `? extends T` és de **lectura** (covariància) i `? super T` d'**escriptura** (contravariància): mai totes dos.
3. El principi **PECS** de Joshua Bloch resum la regla: *Producer Extends, Consumer Super*.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Wildcard | El `?` dels genèrics: "qualsevol tipus" |
> | Covariància | `? extends T`: llegir d'una jerarquia |
> | Contravariància | `? super T`: escriure en una jerarquia |
> | Invariant | Que `List<Integer>` no és `List<Number>` |
> | PECS | Producer Extends, Consumer Super |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/11-genericos-mapas) · **Anterior:** [04 · Mètodes genèrics: funcions per a tot tipus](/ApuntesProgramacion/va/11-genericos-mapas/04-metodos-genericos) · **Següent:** [06 · HashMap: la guia telefònica](/ApuntesProgramacion/va/11-genericos-mapas/06-hashmap)