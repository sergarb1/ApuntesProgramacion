---
title: "08 · Map vs List vs Set: tria la teua estructura"
description: "Les tres famílies del paquet java.util i les preguntes que decidixen abans d'escriure codi ⚖️"
---

<p><small>Les tres famílies del paquet java.util i les preguntes que decidixen abans d'escriure codi ⚖️</small></p>

> 🗺️ **Estàs en:** 🗺️ **U11 · Genèrics i Mapes** → 08 · Map vs List vs Set: tria la teua estructura

---

## 📬 La idea en una frase

> **Abans d'escriure codi, pregunta't: necessite associar clau-valor? m'importa l'ordre? pot haver-hi duplicats? Amb eixes respostes tries Map, List o Set sense dubtar.**

En la U10 vas dominar les llistes i els conjunts. En els punts 6 i 7, els mapes. Ara toca el tancament de les tres famílies: saber quina usar en cada situació. No hi ha estructura "millor": hi ha una estructura per a cada problema. Este punt és la teua brúixola definitiva.

---

## ⚖️ La comparativa definitiva

| Característica | List | Set | Map |
|---|---|---|---|
| Què guarda? | Elements ordenats per posició | Elements únics | Parells clau → valor |
| Duplicats? | Sí | No | Claus no, valors sí |
| Ordre? | D'inserció | Depén (Hash/Tree) | Depén (Hash/Tree) |
| Accés | Per índex | Per element | Per clau |
| Nulls? | Sí | HashSet: 1, TreeSet: 0 | HashMap: 1 clau, TreeMap: 0 |
| Implementació principal | `ArrayList` | `HashSet` | `HashMap` |

**La gran diferència:** List i Set guarden elements solts; Map guarda parelles. Si la teua dada necessita una "clau" per a buscar-la després (un DNI, un nom, una paraula), és un Map. Si només necessites una col·lecció de coses, és List o Set.

---

## 🧭 L'arbre de decisions

```
¿Tens parelles clau → valor?
├── Sí → ¿Necessites ordre per clau?
│        ├── Sí → TreeMap
│        └── No → ¿Ordre d'arribada?
│                 ├── Sí → LinkedHashMap
│                 └── No → HashMap
└── No → ¿M'importa l'ordre?
         ├── No → ¿Duplicats?
         │        ├── No → HashSet
         │        └── Sí → ArrayList
         └── Sí → ¿Quin ordre?
                  ├── Natural → ¿Duplicats?
                  │        ├── No → TreeSet
                  │        └── Sí → ArrayList + sort
                  └── D'arribada → ¿Duplicats?
                           ├── No → LinkedHashSet
                           └── Sí → ArrayList
```

Ho veus? La primera pregunta és la nova d'esta unitat: **necessites associar?** Si la resposta és sí, entres en el món dels mapes i només decidixes entre ordre natural, ordre d'arribada o velocitat pura. Si és no, tornes a la lògica de la U10.

---

## 💡 La regla pràctica

- Una llista de coses que recorres per posició? → `ArrayList`
- Coses sense repetir i no t'importa l'ordre? → `HashSet`
- Coses sense repetir i sempre ordenades? → `TreeSet`
- Associar una cosa amb una altra i buscar per clau? → `HashMap`
- Claus ordenades o navegació (`firstKey`, `headMap`)? → `TreeMap`
- Velocitat però respectant l'ordre d'arribada? → `LinkedHashMap`

**La regla d'or:** la dada es busca només pel seu contingut? → Set. Per una posició? → List. Per una clau diferent d'ella mateixa? → Map. Eixa última frase separa el que memoritza de qui entén.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** la resposta correcta a "quina és la millor estructura?" sempre és "depén". En una entrevista, eixa resposta amb arguments val or.

**Exercici: quina estructura usaríes?**

Per a cada escenari, tria l'estructura i justifica-la en una línia:

1. Associar cada alumne (pel seu nom) amb la seua nota d'examen.
2. Les notes de la classe, per a recórrer-les moltes vegades per posició.
3. Els DNI dels matriculats, sense repetir i en ordre alfabètic.
4. Saber si una paraula ja ha eixit en un sorteig, amb 100.000 paraules.
5. El nombre de vegades que apareix cada lletra en un text, mostrades en ordre alfabètic.

<details>
<summary>🔄 Solucions</summary>

1. **`HashMap<String, Integer>`** — clau = nom, valor = nota. Cerca directa per alumne.
2. **`ArrayList<Integer>`** — accés per índex O(1) i duplicats permesos.
3. **`TreeSet<String>`** — sense duplicats i ordre natural automàtic.
4. **`HashSet<String>`** — `contains` en O(1) per a la pregunta "ja ha eixit?".
5. **`TreeMap<Character, Integer>`** — freqüència per lletra amb les claus ordenades soles.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què guarda un Map que no guarden ni List ni Set?
2. Quina estructura per a claus ordenades amb navegació?
3. Pot un Map tindre valors duplicats?
4. Quina és la primera pregunta de l'arbre de decisions?

<details>
<summary>🔄 Respostes</summary>

1. Parelles clau → valor; les claus són úniques.
2. `TreeMap` (ordre natural) o `LinkedHashMap` (ordre d'arribada).
3. Sí: les claus són úniques, però els valors poden repetir-se.
4. "Tens parelles clau → valor?" — si la resposta és sí, és un Map.

</details>

---

## ✅ Resum en 3 frases

1. **List** guarda elements per posició (duplicats sí), **Set** guarda únics (ordre segons la implementació) i **Map** associa claus úniques amb valors.
2. La primera pregunta és **"necessites associar clau → valor?"**: si és sí, és un Map; si és no, List o Set.
3. En una entrevista, "quina és la millor estructura?" es respon sempre amb arguments, no amb un nom.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `List` | Col·lecció ordenada per posició, amb duplicats |
> | `Set` | Col·lecció sense duplicats |
> | `Map` | Associació clau → valor |
> | Clau única | El que fa que un Map siga un Map |
> | O(1) / O(log n) | Instantani / logarítmic (ràpid encara que cresca) |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/11-genericos-mapas) · **Anterior:** [07 · TreeMap, LinkedHashMap i altres mapes](/ApuntesProgramacion/va/11-genericos-mapas/07-treemap-otros-mapas) · **Següent:** [09 · Repàs interactiu](/ApuntesProgramacion/va/11-genericos-mapas/09-repaso-interactivo)