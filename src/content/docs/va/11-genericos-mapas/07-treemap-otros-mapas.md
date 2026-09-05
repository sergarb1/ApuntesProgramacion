---
title: "07 · TreeMap, LinkedHashMap i altres mapes"
description: "L'ordenat de sèrie, el que recorda l'ordre d'arribada i els mètodes de navegació 🌳"
---

<p><small>L'ordenat de sèrie, el que recorda l'ordre d'arribada i els mètodes de navegació 🌳</small></p>

> 🗺️ **Estàs en:** 🗺️ **U11 · Genèrics i Mapes** → 07 · TreeMap, LinkedHashMap i altres mapes

---

## 📬 La idea en una frase

> **`HashMap` és rapidíssim però no ordena, `TreeMap` ordena les claus automàticament (O(log n)) i `LinkedHashMap` recorda l'ordre d'inserció. Triaràs segons el que necessites.**

En el punt 6 vas conéixer el rei de la velocitat. Però a vegades la velocitat no basta: necessites que les claus isquen ordenades, o que es respecte l'ordre en què les vas ficar. Ací estan els seus dos cosins, amb els seus superpoders i les seues debilitats.

---

## 🌳 TreeMap: l'ordenat de sèrie

`TreeMap` és un mapa ordenat per clau. Internament usa un arbre roig-negre, que és com una biblioteca que es reordena sola cada vegada que afegixes un llibre.

```java
import java.util.TreeMap;

TreeMap<String, Integer> ordenado = new TreeMap<>();
ordenado.put("Zara", 30);
ordenado.put("Ana", 25);
ordenado.put("Bob", 35);
System.out.println(ordenado);  // {Ana=25, Bob=35, Zara=30} — orden alfabético

// Métodos de navegación extra
ordenado.firstKey();    // "Ana" — la primera clave
ordenado.lastKey();     // "Zara" — la última clave
ordenado.headMap("Bob");  // {Ana=25} — entradas antes de "Bob"
ordenado.subMap("Ana", "Zara"); // {Ana=25, Bob=35} — entre claves
```

La gràcia està en els mètodes de navegació: `firstKey`, `lastKey`, `headMap`, `subMap`... són la raó de ser del TreeMap. Amb un HashMap, per a "les claus que van abans que Bob" hauríes de copiar i ordenar a mà.

> ⚠️ **Advertència:** TreeMap NO admet una clau `null` (no sap comparar-la amb res). I les claus han de ser comparables: per això `String` i `Integer` funcionen, i les classes teues sense `Comparable` fallen en temps d'execució.

---

## 🔗 LinkedHashMap: el que recorda l'ordre d'arribada

`LinkedHashMap` és un HashMap que, a més, manté l'ordre d'inserció. És com un HashMap amb memòria del que vas anar ficant.

```java
import java.util.LinkedHashMap;

LinkedHashMap<String, Integer> conMemoria = new LinkedHashMap<>();
conMemoria.put("Zara", 30);
conMemoria.put("Ana", 25);
conMemoria.put("Bob", 35);
System.out.println(conMemoria);  // {Zara=30, Ana=25, Bob=35} — orden de inserción
```

Quan l'uses? Quan vols la velocitat del HashMap però necessites saber "en quin ordre va arribar cada cosa": un historial, una llista de "l'últim vist"... Recorda: **ordre d'inserció**, no ordre natural.

---

## ⚖️ La família al complet

| Mapa | Ordre | Velocitat | Clau `null`? |
|---|---|---|---|
| `HashMap` | Cap | O(1) | Sí (una) |
| `TreeMap` | Natural (per clau) | O(log n) | No |
| `LinkedHashMap` | D'inserció | O(1) | Sí (una) |

**Regla pràctica:** velocitat i no t'importa l'ordre? → `HashMap`. Claus sempre ordenades o navegació (`firstKey`, `headMap`...)? → `TreeMap`. Velocitat però respectant l'ordre d'arribada? → `LinkedHashMap`.

---

## 🥊 EL RING: HashMap vs TreeMap

Dues implementacions de Map s'enfronten davant la màquina de cafè.

**HashMap:** — Jo soc el rei de la velocitat. O(1) en `get` i `put`. No m'importa l'ordre, m'importa la rapidesa.

**TreeMap:** — Sí, però jo mantinc les claus ordenades automàticament. Si necessites recórrer-les en ordre alfabètic, soc el teu únic amic.

**HashMap:** — ¿Ordenat? Això costa. Jo soc O(1) en tot. ¡Soc imbatible en rendiment!

**TreeMap:** — Cert, però puc navegar: `firstKey()`, `lastKey()`, `subMap()`, `headMap()`. Tu, per a tot això, has de copiar i ordenar.

**HashMap:** — Si no necessites ordre, per què pagar el cost? La majoria dels casos usen HashMap.

**TreeMap:** — I quan necessiten ordre, ahí estic jo. I no soc tan lent: O(log n) continua sent molt ràpid per a la majoria dels casos.

**HashMap:** — Tregua. Cadascú al seu lloc.

**TreeMap:** — Fet.

> La lliçó: **velocitat? → HashMap. ordre natural? → TreeMap. ordre d'inserció? → LinkedHashMap.** Cadascú té el seu superpoder, i la resposta a "quin és millor?" sempre és "depén".

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** TreeMap ordena per clau en el moment del `put`. No ordenes tu: ell ordena sol.

**Exercici: la biblioteca que s'ordena sola**

```java
import java.util.TreeMap;

public class BeTheTreeMap {
    public static void main(String[] args) {
        TreeMap<String, Integer> m = new TreeMap<>();
        m.put("Zara", 30);
        m.put("Ana", 25);
        m.put("Bob", 35);

        System.out.println(m.firstKey());
        System.out.println(m.headMap("Bob"));
    }
}
```

**Què imprimeix?**

- (A) Zara / {Zara=30}
- (B) Ana / {Ana=25}
- (C) Ana / {Ana=25, Bob=35}
- (D) Zara / {Zara=30, Ana=25}

<details>
<summary>🔄 Solució</summary>

La **B**. `firstKey()` torna la primera clau en ordre natural: "Ana". `headMap("Bob")` torna les entrades amb claus estrictament menors que "Bob": només `{Ana=25}`. Ull: "Bob" no entra en el seu propi `headMap`.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quin mapa ordena les claus automàticament?
2. Quin mapa manté l'ordre d'inserció?
3. Quin mètode torna les entrades amb clau menor que una donada?
4. Pot un TreeMap tindre una clau `null`?

<details>
<summary>🔄 Respostes</summary>

1. `TreeMap` (ordre natural de la clau).
2. `LinkedHashMap` (ordre d'inserció).
3. `headMap(clau)`.
4. No. TreeMap no sap comparar `null` amb res; HashMap sí admet una clau `null`.

</details>

---

## ✅ Resum en 3 frases

1. **`TreeMap`** ordena les claus automàticament i oferix navegació (`firstKey`, `lastKey`, `headMap`, `subMap`) a canvi d'O(log n).
2. **`LinkedHashMap`** manté l'ordre d'inserció amb la mateixa velocitat quasi O(1) d'un HashMap.
3. **Regla d'or:** velocitat → `HashMap`; ordre natural → `TreeMap`; ordre d'arribada → `LinkedHashMap`.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `TreeMap` | Mapa ordenat per clau (arbre roig-negre) |
> | Arbre roig-negre | Estructura interna que manté l'ordre en O(log n) |
> | `LinkedHashMap` | Mapa que recorda l'ordre d'inserció |
> | `headMap` / `subMap` | Subconjunts d'entrades per rang de claus |
> | O(log n) | Logarítmic: ràpid encara que cresca el mapa |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/11-genericos-mapas) · **Anterior:** [06 · HashMap: la guia telefònica](/ApuntesProgramacion/va/11-genericos-mapas/06-hashmap) · **Següent:** [08 · Map vs List vs Set: tria la teua estructura](/ApuntesProgramacion/va/11-genericos-mapas/08-elegir-estructura-datos)