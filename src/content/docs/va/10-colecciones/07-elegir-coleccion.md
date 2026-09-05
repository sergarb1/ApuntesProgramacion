---
title: "07 — Triar la col·lecció adequada"
description: "ArrayList, LinkedList, HashSet, TreeSet o LinkedHashSet: les tres preguntes que decidixen abans d'escriure la primera línia ⚖️"
---

<p><small>ArrayList, LinkedList, HashSet, TreeSet o LinkedHashSet: les tres preguntes que decidixen abans d'escriure la primera línia ⚖️</small></p>

> 🗺️ **Estàs en:** 📚 **U10 · Col·leccions** → 07 · Triar la col·lecció adequada

---

## 📬 La idea en una frase

> **Abans d'escriure codi, pregunta't tres coses: m'importa l'ordre? pot haver-hi duplicats? necessite velocitat? Amb estes tres respostes tries la col·lecció sense dubtar.**

En els punts 1 a 4 vas vore les col·leccions per separat. Ara toca la part que separa el novell del que sap: **triar**. No hi ha una col·lecció "millor": hi ha una col·lecció per a cada problema. Este punt és la teua brúixola.

---

## 🧭 L'arbre de decisions

Tres preguntes i ja està:

```
Importa l'ordre?
├── No → Duplicats?
│        ├── No → HashSet
│        └── Sí → ArrayList
└── Sí → Quin ordre?
         ├── Ordre natural (ordenat) → Duplicats?
         │        ├── No → TreeSet
         │        └── Sí → ArrayList + Collections.sort()
         └── Ordre d'arribada → Duplicats?
                  ├── No → LinkedHashSet
                  └── Sí → ArrayList (o LinkedList)
```

Veus el patró? Quan l'ordre no importa, guanya `HashSet` (sense duplicats) o `ArrayList` (amb duplicats). Quan sí que importa, tries entre `TreeSet` (ordre natural), `LinkedHashSet` (ordre d'arribada) o llistes.

---

## ⚖️ La comparativa definitiva

| Col·lecció | Ordre | Duplicats | Accés/inserció | El que val |
|---|---|---|---|---|
| `ArrayList` | Per índex | Permesos | `get(i)` rapidíssim | Llista de tots els dies |
| `LinkedList` | Per inserció | Permesos | Ràpida al principi/final | Cues, piles |
| `HashSet` | Cap | No | O(1) | "Ja ho tinc?", eliminar duplicats |
| `TreeSet` | Ordre natural | No | O(log n) | Elements sempre ordenats |
| `LinkedHashSet` | D'arribada | No | O(1) | Duplicats fora, ordre d'arribada dins |

**La regla d'or:** saps quants elements necessites i no canviarà? → array (U04). Llista que creix i accés per índex? → ArrayList. Cua o pila? → LinkedList. Sense duplicats i no t'importa l'ordre? → HashSet. Sense duplicats i ordenats? → TreeSet. Sense duplicats però mantenint l'ordre d'arribada? → LinkedHashSet.

---

## 🐢 La taula de costos

Quan el rendiment importa, esta taula et salva:

| Operació | ArrayList | LinkedList | HashSet | TreeSet |
|---|---|---|---|---|
| `get(i)` | **O(1)** | O(n) | — | — |
| `add` al final | O(1)* | **O(1)** | O(1) | O(log n) |
| `add` al principi | O(n) | **O(1)** | — | — |
| `contains(e)` | O(n) | O(n) | **O(1)** | O(log n) |
| `remove` per valor | O(n) | O(n) | **O(1)** | O(log n) |

> 💡 **Consell:** el `*` d'`ArrayList` significa "quasi O(1)": a voltes s'ompli i ha de copiar-se sencer a un array més gran. Per això és molt ràpid, però no instantani al 100%.

---

## 🥊 EL RING: ArrayList vs LinkedList

Dos veterans discuteixen davant la màquina de cafè.

**ArrayList:** — Jo vaig directe a l'índex. `get(5000)` i ja està. Tu has de saltar d'anella en anella 5.000 voltes.

**LinkedList:** — Cert, però jo afig i esborre al principi sense moure ningú. Tu, quan lleves el primer, desplaces 10.000 elements una posició.

**ArrayList:** — Sí, però per a recórrer soc un luxe: un array contigu, la CPU se'l menja.

**LinkedList:** — I per a cues i piles soc el rei: `addLast` + `removeFirst` i llest. Com faríes tu una cua?

**ArrayList:** — Val, per a cues i piles eres tu. Per a la resta, jo. Tregua?

**LinkedList:** — Tregua. Cadascun a la seua trinxera.

> La lliçó: **accés aleatori freqüent? → ArrayList. Afegir/esborrar als extrems o simular cua/pila? → LinkedList.** La resta del temps, la llista de tots els dies.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** la resposta correcta a "quina és la millor col·lecció?" és sempre "depèn". En una entrevista, eixa resposta amb arguments val or.

**Exercici: quina col·lecció usaríes?**

Per a cada escenari, tria la col·lecció i justifica-la en una línia:

1. La llista de notes de la teua classe, que recorreràs moltes voltes per índex.
2. Una cua de persones esperant per a entrar a una sala.
3. Els DNI dels alumnes matriculats, sense repetir i en ordre alfabètic.
4. L'historial de visites d'una web, sense repetir i en ordre d'arribada.
5. Saber si un número de loteria ja ha eixit, amb 100.000 números.

<details>
<summary>🔄 Solucions</summary>

1. **ArrayList** — accés per índex O(1) i duplicats permesos (dos alumnes poden tindre la mateixa nota).
2. **LinkedList** — FIFO amb `addLast` i `removeFirst`.
3. **TreeSet** — sense duplicats i ordre natural (alfabètic) automàtic.
4. **LinkedHashSet** — sense duplicats però conservant l'ordre d'arribada.
5. **HashSet** — `contains` en O(1) per a la pregunta "ja ho tinc?".

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quina col·lecció per a eliminar duplicats mantenint l'ordre d'arribada?
2. Quina col·lecció per a una cua FIFO?
3. Quina col·lecció dona els elements sempre ordenats i sense duplicats?
4. Quina és la pregunta més important abans de triar col·lecció?

<details>
<summary>🔄 Respostes</summary>

1. `LinkedHashSet`.
2. `LinkedList`, amb `addLast` i `removeFirst`.
3. `TreeSet`.
4. "M'importa l'ordre?" — d'ací eixen totes les altres (duplicats i velocitat).

</details>

---

## ✅ Resum en 3 frases

1. **No hi ha col·lecció millor: hi ha col·lecció adequada.** Les tres preguntes (ordre, duplicats, velocitat) ho decidixen tot.
2. **Llistes** per a ordre + duplicats, **Sets** per a sense duplicats, **LinkedList** per a cues i piles.
3. En una entrevista, "quina és la millor col·lecció?" es respon sempre amb arguments, no amb un nom.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Ordre natural | L'ordre per defecte del tipus (numèric, alfabètic) |
> | Ordre d'arribada | L'ordre d'inserció |
> | O(1) | Instantani (constant) |
> | O(n) | Lineal: depén de la grandària |
> | O(log n) | Logarítmic: ràpid encara que cresca la col·lecció |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/10-colecciones) · **Anterior:** [06 · La classe Collections: la navalla suïssa](/ApuntesProgramacion/va/10-colecciones/06-collections) · **Següent:** [08 · Be the Code: col·leccions en acció](/ApuntesProgramacion/va/10-colecciones/08-be-the-code)