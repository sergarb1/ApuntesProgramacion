---
title: "06 — Comparació: quan usar cada ordenació"
description: La taula de decisió definitiva per a triar algorisme com un professional ⚖️
---

<p><small>La taula de decisió definitiva per a triar algorisme com un professional ⚖️</small></p>

> 🗺️ **Estàs en:** ⚡ **U05 · Algorítmica II: Tècniques** → 06 · Comparació: quan usar cada ordenació

---

## 📬 La idea en una frase

> **No existix el "millor algorisme d'ordenació": existix el millor per al teu cas concret, i triar-lo bé és tan important com saber implementar-lo.**

Ja has vist Quicksort i Mergesort, i en la U04 vas sobreviure a bombolla i inserció. Ara toca la pregunta d'examen, d'entrevista i de la vida real: *quin use?* La resposta sempre comença igual: *depén*.

---

## 🧭 La taula de decisió

| Situació | Tria |
|---|---|
| Array xicotet (< 50 elements) | Tant se val, usa `Arrays.sort()` |
| Array gran amb dades a l'atzar | **Quicksort** (anirà genial en promig) |
| Array gran, quasi ordenat o amb molts duplicats | **Mergesort** o Quicksort amb mediana de tres |
| Necessites estabilitat (ordre relatiu) | **Mergesort** |
| La memòria és justa (sistema encastat, mòbil) | **Quicksort** (O(log n) vs O(n)) |
| No et paguen per pensar | `Arrays.sort()` i a seguir amb la teua vida |
| L'array és enorme i les dades estan en disc | Mergesort extern (el de les bases de dades) |

> [!WARNING]
> Mai, baix cap concepte, uses **Bombolla (Bubble Sort)** en producció. És O(n²), lent, i els teus companys t'odiaran. És com usar un caragol per a repartir pizzes: existix, però no hauria.

---

## 🥊 El duel dels titans

| | Quicksort | Mergesort |
|---|---|---|
| Complexitat mitjana | O(n log n) | O(n log n) |
| Pitjor cas | O(n²) (evitable amb bon pivot) | O(n log n) sempre |
| Memòria extra | O(log n) | O(n) |
| Estable | No | Sí |
| Treball principal | En la **partició** | En la **fusió** |
| Ideal quan | Velocitat i poca memòria | Estabilitat i garanties |

**En resum:** Quicksort és el velocista amb mal geni; Mergesort és el maratonià fiable. Quicksort sol guanyar en velocitat pràctica amb arrays grans en memòria; Mergesort guanya quan no et pots permetre un mal dia.

---

## 🕵️ Què fa Java per dins?

En Java, `Arrays.sort()` no és un algorisme, són dos segons el tipus:

- Per a **tipus primitius** (`int[]`, `double[]`...): usa **Dual-Pivot Quicksort**, una versió millorada amb dos pivots que reduïx el pitjor cas i accelera el promig.
- Per a **objectes** (`String[]`, `ArrayList`...): usa **TimSort**, una mescla de Mergesort i Insertion Sort. Estable, i rapidíssima amb dades quasi ordenades.

Per això "usa `Arrays.sort()`" és quasi sempre la resposta correcta: Java ja va triar bé per tu.

---

## 📊 Rendiment en la pràctica

| Algorisme | n=10 | n=100 | n=1.000 | n=10.000 | n=100.000 | n=1.000.000 |
|---|---|---|---|---|---|---|
| Quicksort | ~0 ms | ~0 ms | ~0 ms | ~1 ms | ~15 ms | ~120 ms |
| Mergesort | ~0 ms | ~0 ms | ~0 ms | ~2 ms | ~20 ms | ~150 ms |
| Bombolla (per a plorar) | ~0 ms | ~1 ms | ~100 ms | ~10.000 ms | no esperes | no esperes |

Els temps són orientatius i depenen del maquinari, però la *tendència* és el que importa: amb 10.000 elements, Quicksort i Mergesort continuen en "mil·lisegons" mentre bombolla ja se n'ha anat a prendre un cafè. Amb 100.000, bombolla ni es presenta.

---

## 🧠 La lògica que hi ha darrere

Recorda la regla d'or de la complexitat: **O(n log n) quasi sempre guanya a O(n²)**, i la diferència es nota brutalment quan `n` creix. Per a un milió d'elements:

- O(n log n): ~20 milions d'operacions → un obrir i tancar d'ulls.
- O(n²): ~1 bilió d'operacions → l'ordinador demana la jubilació.

Així que la decisió no és "quin algorisme?", sinó "què necessite garantir?". I això, amic meu, és pensament d'enginyer: tria la ferramenta pel **context**, no per la costum.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quin algorisme triaries per a ordenar 10.000 ints a l'atzar en un servidor amb RAM de sobres?
2. I si necessites estabilitat per a una ordenació per dos criteris?
3. Què usa `Arrays.sort()` per a primitius? I per a objectes?
4. Quant li costa a bombolla ordenar un milió d'elements?

<details>
<summary>🔄 Respostes</summary>

1. **Quicksort** (o `Arrays.sort()` directament): dades a l'atzar, gran, sense restricció de memòria.
2. **Mergesort** (o TimSort via `Arrays.sort()` sobre objectes): necessita mantindre l'ordre relatiu.
3. **Dual-Pivot Quicksort** per a primitius i **TimSort** per a objectes.
4. **O(n²)** → ~1 bilió d'operacions. Que criden l'assegurança.

</details>

---

## ✅ Resum en 3 frases

1. No hi ha un "millor" algorisme universal: la tria depén de la **mida**, l'**ordre inicial**, la **memòria** i l'**estabilitat** que necessites.
2. **Quicksort** guanya en velocitat pràctica i memòria; **Mergesort** guanya en garanties i estabilitat.
3. En Java, `Arrays.sort()` ja tria bé per tu: **Dual-Pivot Quicksort** per a primitius i **TimSort** per a objectes.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Dual-Pivot Quicksort | Quicksort amb dos pivots (Java, primitius) |
> | TimSort | Mescla de Mergesort i Insertion Sort (Java, objectes) |
> | Estabilitat | Conservar l'ordre dels elements iguals |
> | Ordre inicial | Com arriben les dades: a l'atzar, ordenades, quasi ordenades |
> | Mergesort extern | Ordenació de dades que no caben en RAM (bases de dades) |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/05-algoritmica-tecnicas) · **Anterior:** [05 · Mergesort](/ApuntesProgramacion/va/05-algoritmica-tecnicas/05-mergesort) · **Següent:** [07 · Be the Code: quicksort des de zero](/ApuntesProgramacion/va/05-algoritmica-tecnicas/07-be-the-code-quicksort)
