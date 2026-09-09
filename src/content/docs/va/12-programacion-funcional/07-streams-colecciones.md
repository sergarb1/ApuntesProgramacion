---
title: "07 · Del stream a la col·lecció: toList, Collectors, groupingBy"
description: "`toList()`, `Collectors.toMap` i `groupingBy`: del flux a llistes, conjunts i mapes 🗂️"
---

<p><small>`toList()`, `Collectors.toMap` i `groupingBy`: del flux a llistes, conjunts i mapes 🗂️</small></p>

> 🗺️ **Estàs en:** 🎯 **U12 · Programació Funcional** → 07 · Del stream a la col·lecció: toList, Collectors, groupingBy

---

## 📬 La idea en una frase

> **Un stream no guarda res, així que al final del pipeline toca aterrar: `toList()` o els `Collectors` converteixen el flux en llistes, conjunts, Strings i, amb `groupingBy`, en mapes agrupats per una clau.**

La cinta transportadora està molt bé per a processar, però al final els paquets han d'anar a algun lloc. La terminal `collect` (del punt 6) és la porta d'eixida, i hui coneixes la seua maleta: `Collectors`, la classe amb les receptes per a empaquetar de totes les formes imaginables.

---

## 📥 `toList()`: l'eixida ràpida (Java 16+)

Des de Java 16 existeix `toList()` directe sobre el stream: la forma més curta d'aterrar en una llista.

```java
List<String> palabras = List.of("hola", "mundo", "hola", "adios");
List<String> unicas = palabras.stream()
    .distinct()
    .toList();                       // [hola, mundo, adios]
```

> ⚠️ **Advertència:** `toList()` torna una llista **immutable**: no pots fer `add`, `remove` ni reordenar-la. Si necessites modificar-la, usa `collect(Collectors.toList())`, que torna un `ArrayList` de tota la vida.

---

## 🗂️ Els `Collectors` de tota la vida

La classe `Collectors` (en `java.util.stream`) té receptes per a cada tipus d'aterratge:

```java
import java.util.*;
import java.util.stream.*;

List<String> palabras = List.of("hola", "mundo", "hola", "adios");

List<String> lista = palabras.stream().collect(Collectors.toList());       // ArrayList
Set<String> conjunto = palabras.stream().collect(Collectors.toSet());      // HashSet sense duplicats
String frase = palabras.stream().collect(Collectors.joining(", "));        // "hola, mundo, hola, adios"
long cuantos = palabras.stream().collect(Collectors.counting());           // 4
```

`joining(", ")` és el favorit per a traure un `String` llegible: unix els elements amb el separador que li passes. Ideal per a depurar pipelines en dos línies.

---

## 🗺️ `groupingBy`: agrupar com en una taula

El rei d'este punt. **`Collectors.groupingBy(funció)`** agrupa els elements segons la clau que torna la funció i et dona un `Map<clau, List<valor>>`.

```java
import java.util.*;
import java.util.stream.*;

public class Agrupando {
    public static void main(String[] args) {
        List<String> palabras = List.of("hola", "adios", "hola", "mar", "mundo");

        Map<Character, List<String>> porLetra = palabras.stream()
            .collect(Collectors.groupingBy(p -> p.charAt(0)));

        System.out.println(porLetra);
        // {a=[adios], h=[hola, hola], m=[mar, mundo]}
    }
}
```

És l'equivalent a la sentència SQL `GROUP BY`: en comptes de recórrer a mà i muntar el `HashMap` de la U11 amb `getOrDefault`, declares la clau i Java agrupa. Per dins està usant un `HashMap`, però tu no ho veus: el `Collectors` el munta per tu.

---

## 🗺️ `toMap`: d'elements a entrades

`Collectors.toMap(clau, valor)` converteix cada element en una entrada de mapa. Té un tercer argument: la **funció de fusió**, que decideix què fer quan dos elements volen la mateixa clau.

```java
List<String> palabras = List.of("hola", "mundo", "hola", "adios");

// paraula → longitud
Map<String, Integer> longitudes = palabras.stream()
    .collect(Collectors.toMap(p -> p, String::length, (a, b) -> a));
// {adios=5, hola=4, mundo=5}

// primera lletra → primera paraula que la complisca
Map<Character, String> representantes = palabras.stream()
    .collect(Collectors.toMap(p -> p.charAt(0), p -> p, (a, b) -> a));
// {a=adios, h=hola, m=mundo}
```

Sense la funció de fusió `(a, b) -> a`, un `"hola"` duplicat provocaria una `IllegalStateException`: dos elements volent la mateixa clau i ningú resolent el conflicte. Amb `(a, b) -> a` li dius "queda't amb el primer".

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `groupingBy` admet un segon argument, el "collector aigües avall": `groupingBy(clau, Collectors.counting())` et dona `Map<clau, Long>` amb quants elements hi ha en cada grup. El comptador de freqüències de la U11 en una sola línia.

**Exercici: el comptador de grups**

```java
import java.util.*;
import java.util.stream.*;

public class Grupos {
    public static void main(String[] args) {
        List<String> palabras = List.of("sol", "mar", "sol", "luna", "mar", "sol");
        Map<String, Long> conteo = palabras.stream()
            .collect(Collectors.groupingBy(p -> p, Collectors.counting()));
        System.out.println(conteo);
    }
}
```

**Què imprimeix?**

- (A) `{sol=3, mar=2, luna=1}`
- (B) `{sol=1, mar=1, luna=1}`
- (C) `{sol=1, mar=1, sol=1, luna=1, mar=1, sol=1}`
- (D) `{sol=6}`

<details>
<summary>🔄 Solució</summary>

La **A**. `groupingBy(p -> p, Collectors.counting())` agrupa les paraules per elles mateixes (cada paraula és la seua pròpia clau) i el collector aigües avall `counting()` compta quantes vegades apareix cada una: `sol` apareix 3 vegades, `mar` 2 i `luna` 1. Les claus del mapa són úniques (eixa és la regla d'or dels mapes de la U11), així que la C és impossible: no pot haver-hi dos entrades amb la mateixa clau. La B seria el resultat sense `counting()` (grups d'un element) i la D confon el total amb el grup.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què torna `toList()`?
2. Què fa `Collectors.groupingBy(...)`?
3. Per a què serveix el tercer argument de `toMap`?
4. Què torna `Collectors.joining(", ")`?

<details>
<summary>🔄 Respostes</summary>

1. Una `List` immutable amb els elements del stream.
2. Agrupa els elements per la clau que torna la funció i dona un `Map<clau, List<valor>>`.
3. La **funció de fusió**: resol què fer quan dos elements volen la mateixa clau (per exemple, `(a, b) -> a` es queda amb el primer).
4. Un `String` amb els elements units per la coma i un espai.

</details>

---

## ✅ Resum en 3 frases

1. `toList()` i els `Collectors` converteixen el flux en **col·leccions reals**: llistes, conjunts, Strings i mapes.
2. `groupingBy` agrupa els elements per una clau i torna un `Map<clau, List<valor>>`; amb `counting()` com a segon argument, compta cada grup.
3. `toMap` converteix cada element en una entrada clau-valor i necessita una **funció de fusió** quan pot haver-hi claus repetides.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `toList()` | Recull el stream en una llista immutable (Java 16+) |
> | `Collectors.toList()` / `toSet()` | Recullen en llista o conjunt modificables |
> | `groupingBy` | Agrupa per una clau en un `Map` |
> | Collector aigües avall | Segon argument que processa cada grup (`counting()`) |
> | `toMap` | Convertix cada element en una entrada clau-valor |
> | Fusió (merge) | Funció que resol què fer amb claus repetides |
> | `joining` | Unix els elements en un `String` |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/12-programacion-funcional) · **Anterior:** [06 · Operacions terminals: collect, reduce, count, forEach](/ApuntesProgramacion/va/12-programacion-funcional/06-streams-terminales) · **Següent:** [08 · Optional: el que accepta l'absència](/ApuntesProgramacion/va/12-programacion-funcional/08-optional)