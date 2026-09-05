---
title: "03 · El diamant `<>` i type erasure"
description: "El peresós oficial que inferix el tipus per tu i el mag que fa desaparéixer els genèrics en el bytecode 🎩"
---

<p><small>El peresós oficial que inferix el tipus per tu i el mag que fa desaparéixer els genèrics en el bytecode 🎩</small></p>

> 🗺️ **Estàs en:** 🗺️ **U11 · Genèrics i Mapes** → 03 · El diamant `<>` i type erasure

---

## 📬 La idea en una frase

> **El diamant `<>` t'estalvia repetir el tipus dos vegades, i el type erasure és el truc pel qual els genèrics només existixen en compilació: quan generes el bytecode, el compilador els borra i afig els castings per tu.**

Ja saps crear classes genèriques. Ara toca dominar els dos detalls que la gent sol repetir de memòria sense entendre: el `<>` de `new ArrayList<>()` i la famosa "type erasure". Els dos són germans: el primer t'estalvia teclejar, el segon és el perquè que Java funcione amb genèrics sense perdre velocitat.

---

## 💎 L'operador diamant `<>`: el peresós oficial

Des de Java 7, no cal repetir el tipus dues vegades. El compilador l'inferix per tu:

```java
// Antes de Java 7 (repetitivo):
Caja<String> caja1 = new Caja<String>();

// Desde Java 7 (el diamante <> al rescate):
Caja<String> caja2 = new Caja<>();
```

El `<>` és com l'"etcètera" dels genèrics: "ja saps de quin tipus estic parlant, no? Doncs això". El compilador mira el costat esquerre, `Caja<String>`, i deduïx que el costat dret també és `Caja<String>`.

> 💡 **Consell:** usa sempre l'operador diamant `<>`. El teu codi queda més net, més llegible i els teus companys d'equip t'ho agrairan. El compilador sap de quin tipus parles; no li faces repetir les coses.

---

## 🎩 Type erasure: el mag es porta els genèrics

Ací va el truc que ho explica tot: els genèrics SOLS existixen en temps de compilació. Quan el teu codi es convertix en bytecode, el compilador borra tota la informació de tipus genèrics. És com si un mag fera desaparéixer els `<String>` i `<Integer>`.

```java
// En tu código fuente:
ArrayList<String> nombres = new ArrayList<>();
ArrayList<Integer> numeros = new ArrayList<>();

// Después de compilar (en bytecode):
ArrayList nombres = new ArrayList();   // ambos son ArrayList simples
ArrayList numeros = new ArrayList();
```

A açò se li diu **type erasure**. El compilador fa tres coses:

1. **Verifica** que els tipus siguen correctes (ací no cola un `Integer` en una llista de Strings).
2. **Borra** la informació genèrica.
3. **Afig** els castings necessaris on calga.

És com un porter que revisa el teu DNI a la porta, però una vegada dins, tu no portes cap identificació. Per això dos `ArrayList` de tipus diferents són la mateixa classe en temps d'execució (ho comprovaràs en el Sé el Código).

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** gràcies al type erasure, els genèrics no existixen en runtime. Dos col·leccions amb tipus diferents són la mateixa classe de veritat.

**Exercici: el bessó perdut**

```java
import java.util.*;

public class BeTheErasure {
    public static void main(String[] args) {
        ArrayList<String> nombres = new ArrayList<>();
        ArrayList<Integer> numeros = new ArrayList<>();

        System.out.println(nombres.getClass() == numeros.getClass());
    }
}
```

**Què imprimeix?**

- (A) true
- (B) false
- (C) Error en temps d'execució
- (D) No compila

<details>
<summary>🔄 Solució</summary>

La **A**. `getClass()` torna la classe real de l'objecte en runtime, i gràcies al type erasure tant `nombres` com `numeros` són, de veritat, `java.util.ArrayList`. Els `<String>` i `<Integer>` només van viure en compilació. És la prova definitiva que "els genèrics són gratis": no afiguen classes ni ralentitzen res.

</details>

---

## 🤷 No hi ha preguntes tontes

> ❓ **Per què no puc fer `new T()` dins d'una classe genèrica?**

Perquè en temps de compilació, Java no sap què és `T`. No pot crear una instància d'alguna cosa que no coneix. És com demanar-li a un pastisser que faça "un pastís" però sense dir-li de què. Amb el type erasure, en runtime `T` ni tan sols existix.

---

> ❓ **I `new T[]`?**

Tampoc. Els arrays coneixen el seu tipus en temps d'execució, però els genèrics es borren (type erasure). Per això internament s'usa `Object[]` i es casteja. És una de les limitacions que veuràs si algun dia intentes crear un array de genèrics.

---

> ❓ **Els genèrics ralentitzen el meu programa?**

No. Java aplica **type erasure**: el compilador borra tota la informació genèrica i la convertix en castings normals. És només sucre sintàctic en compilació. En runtime, no hi ha genèrics i no hi ha cost extra.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Des de quina versió de Java existix l'operador diamant `<>`?
2. Què fa el compilador amb els genèrics en generar el bytecode?
3. Per què no pots escriure `new T()` en una classe genèrica?
4. En runtime, `ArrayList<String>` i `ArrayList<Integer>` són la mateixa classe?

<details>
<summary>🔄 Respostes</summary>

1. Des de Java 7. Abans calia repetir el tipus dues vegades.
2. Els borra: verifica els tipus, elimina la informació genèrica i afig els castings necessaris.
3. Perquè en compilació Java no sap què és `T`, i en runtime el type erasure l'ha borrat.
4. Sí, exactament. `getClass()` torna `java.util.ArrayList` en tots dos casos.

</details>

---

## ✅ Resum en 3 frases

1. El **diamant `<>`** (Java 7+) inferix el tipus del costat dret i t'estalvia repetir-lo: `new Caja<>()`.
2. El **type erasure** borra els genèrics en compilar: verifica, borra i afig castings.
3. Gràcies a això, **els genèrics són gratis**: no existixen en runtime, no ralentitzen res i per això no pots crear `new T()` ni arrays de genèrics.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Diamant | El `<>` que inferix el tipus i evita repetir-lo |
> | Inferència | Que el compilador deduïsca el tipus per tu |
> | Type erasure | El procés que borra els genèrics en compilar |
> | Bytecode | El codi que genera el compilador per a la JVM |
> | Raw type | `Caja` sense `< >`, només per a codi antic |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/11-genericos-mapas) · **Anterior:** [02 · La teua pròpia classe genèrica: `Caja<T>`](/ApuntesProgramacion/va/11-genericos-mapas/02-clases-genericas) · **Següent:** [04 · Mètodes genèrics: funcions per a tot tipus](/ApuntesProgramacion/va/11-genericos-mapas/04-metodos-genericos)