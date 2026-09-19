---
title: "06 · El diamant, mètodes genèrics i wildcards"
description: "El peresós oficial que inferix el tipus, mètodes amb el seu propi `<T>` i el principi PECS de Joshua Bloch 💎"
---

<p><small>El peresós oficial que inferix el tipus, mètodes amb el seu propi `<T>` i el principi PECS de Joshua Bloch 💎</small></p>

> 🗺️ **Estàs en:** 📚 **U11 · Col·leccions, genèrics i mapes** → 06 · El diamant, mètodes genèrics i wildcards

---

## 📬 La idea en una frase

> **El diamant `<>` t'estalvia repetir el tipus, un mètode genèric declara el seu propi `<T>` abans del retorn, i els wildcards (`? extends` / `? super`) resolen la invariància dels genèrics amb la regla PECS.**

Tres peces que completes el trencaclosques genèric: la primera t'estalvia teclejar, la segona et dona flexibilitat en utilitats i la tercera és la que cau en les entrevistes.

---

## 💎 L'operador diamant `<>`

Des de Java 7 no cal repetir el tipus dues vegades; el compilador l'inferix:

```java
// Antes de Java 7 (repetitivo):
Caja<String> caja1 = new Caja<String>();

// Desde Java 7 (el diamante <> al rescate):
Caja<String> caja2 = new Caja<>();  // "ja saps de què parle, no?"
```

> 💡 **Consell:** usa sempre el diamant. El compilador mira el costat esquerre i deduïx el dret: codi més net i zero repeticions.

## 🎩 Type erasure: el mag es porta els genèrics

Els genèrics SOLS existeixen en compilació. En generar el bytecode, el compilador **verifica** els tipus, **borra** la informació genèrica i **afig** els castings on calga:

```java
// En tu código fuente:
ArrayList<String> nombres = new ArrayList<>();

// En el bytecode tras compilar:
ArrayList nombres = new ArrayList();   // sin genéricos, con castings
```

Per això dos `ArrayList` de tipus diferents són la mateixa classe en temps d'execució, i per això no pots fer `new T()` ni `new T[]`: en runtime, `T` no existeix.

---

## 🧰 Mètodes genèrics

Un mètode pot declarar el seu propi `<T>` **abans del tipus de retorn**, sense que la classe siga genèrica. El compilador el deduïx dels arguments:

```java
public class Utilidades {

    // Declara <T> antes del tipo de retorno
    public static <T> void imprimir(T elemento) {
        System.out.println("Elemento: " + elemento);
    }

    // Con límite: T debe saber compararse (implementar Comparable)
    public static <T extends Comparable<T>> T maximo(T a, T b) {
        return a.compareTo(b) > 0 ? a : b;
    }
}

// Uso con inferencia:
Utilidades.imprimir(42);        // T = Integer
Utilidades.imprimir("Hola");    // T = String
Utilidades.maximo(5, 8);        // 8
Utilidades.maximo("gato", "perro"); // "perro"
```

El **límit** (`T extends Comparable<T>`) converteix la promesa genèrica en contracte: si la teua classe no sap comparar-se, el compilador no et deixa passar-la. I encara que quasi mai cal, existeix la sintaxi explícita `Utilidades.<String>maximo(...)` (sol eixir en exàmens).

---

## 🃏 Wildcards: el problema de la invariància

Moment incòmode: `List<Number>` NO accepta una `List<Integer>`, encara que un Integer siga un Number. Els genèrics són **invariants**. La solució és el comodí `?`:

### `? extends T`: per a LLEGIR (covariància)

```java
public static double sumar(List<? extends Number> numeros) {
    double total = 0.0;
    for (Number n : numeros) {
        total += n.doubleValue();   // llegir: sí
    }
    // numeros.add(42);             // 🚫 afegir: no (excepte null)
    return total;
}
// sumar(List.of(1, 2, 3)) i sumar(List.of(1.5, 2.5)) compilen ✅
```

### `? super T`: per a ESCRIURE (contravariància)

```java
public static void rellenar(List<? super Integer> lista) {
    lista.add(1);
    lista.add(2);          // escriure: sí
    // Integer n = lista.get(0);  // 🚫 llegir tipat: no, només com a Object
}
// rellenar(new ArrayList<Number>()) i rellenar(new ArrayList<Object>()) compilen ✅
```

### 🧠 PECS: la mnemotècnia infalible

Joshua Bloch (autor de *Effective Java*) ho va resumir en quatre lletres:

> - **P**roducer **E**xtends: si el mètode només **produïx** (llig) dades, usa `? extends`.
> - **C**onsumer **S**uper: si el mètode només **consumeix** (escriu) dades, usa `? super`.
> - Fa les dos coses? → no uses wildcard: usa `T` directament.

> ⚠️ **Advertència:** pregunta clàssica d'examen: "puc afegir a una `List<? extends Number>`?" NO (excepte `null`). "Puc llegir tipat d'una `List<? super Integer>`?" Tampoc: només com a `Object`. PECS et salva de totes dos.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** gràcies al type erasure, els genèrics no existeixen en runtime: `nombres.getClass() == numeros.getClass()` és `true` encara que un siga `ArrayList<String>` i l'altre `ArrayList<Integer>`.

**Exercici: el comodí que ho accepta tot**

```java
import java.util.*;

public class BeTheWildcard {
    public static void main(String[] args) {
        printNumbers(Arrays.asList(1, 2, 3));      // ¿compila?
        printNumbers(Arrays.asList(1.5, 2.5, 3.5)); // ¿compila?
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

La **C**. `List<? extends Number>` accepta qualsevol llista el tipus de la qual hereta de Number: tant `List<Integer>` com `List<Double>`. El mètode només llig (for-each), així que compleix el costat "producer" de PECS sense problema. Imprimeix `1 2 3 1.5 2.5 3.5`.

</details>

---

## 🤷 No hi ha preguntes tontes

> ❓ **Els genèrics ralentitzen el meu programa?**

No. El **type erasure** els converteix en castings normals en compilar: és només sucre sintàctic. En runtime no hi ha genèrics ni cost extra.

---

> ❓ **Per què no puc fer `new T()`?**

Perquè en compilació Java no sap què és `T` i en runtime ja s'ha borrat. És com demanar-li a un pastisser "un pastís" sense dir-li de què.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Des de quina versió de Java existeix l'operador diamant `<>`?
2. On es declara el `<T>` d'un mètode genèric?
3. Què significa `? extends Number` i per a què servix?
4. Què diu la C de PECS?

<details>
<summary>🔄 Respostes</summary>

1. Des de Java 7.
2. Abans del tipus de retorn: `public static <T> void imprimir(T x)`.
3. "Una llista de Number o de qualsevol subclasse seua", de només lectura (covariància).
4. Consumer Super: si el mètode escriu en la col·lecció, usa `? super`.

</details>

---

## ✅ Resum en 3 frases

1. El **diamant `<>`** (Java 7+) inferix el tipus del costat dret, i el **type erasure** borra els genèrics en compilar: per això són gratis i no existeixen en runtime.
2. Un **mètode genèric** declara `<T>` abans del retorn i pot dur un **límit** (`T extends Comparable<T>`) que actua com a contracte.
3. Els **wildcards** resolen la invariància: `? extends` per a llegir, `? super` per a escriure, i **PECS** (*Producer Extends, Consumer Super*) per a recordar-ho.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Diamant | El `<>` que inferix el tipus i evita repetir-lo |
> | Type erasure | Procés que borra els genèrics en compilar |
> | Límit (bound) | Restricció: `T extends Comparable<T>` |
> | Wildcard | El `?`: "qualsevol tipus" |
> | Covariància / Contravariància | `? extends` (llegir) / `? super` (escriure) |
> | PECS | Producer Extends, Consumer Super |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/11-colecciones) · **Anterior:** [05 · Classes genèriques: la teua `Caja<T>`](/ApuntesProgramacion/va/11-colecciones/05-clases-genericas) · **Següent:** [07 · HashMap: la guia telefònica](/ApuntesProgramacion/va/11-colecciones/07-hashmap)
