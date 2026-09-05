---
title: "07 — Triar l'algoritme adequat"
description: La taula de decisió del bon programador, per a no usar una excavadora com a cullereta 🧠
---

<p><small>La taula de decisió del bon programador, per a no usar una excavadora com a cullereta 🧠</small></p>

> 🗺️ **Estàs en:** 🧩 **U05 · Algorítmica I: Fonaments** → 07 · Triar l'algoritme adequat

---

## 📬 La idea en una frase

> **El millor algoritme no és el més famós ni el més ràpid en teoria: és el que encaixa amb la mida de les teues dades, el seu ordre inicial i el que necessites. Triar bé és la mitat de la faena.**

Per a obrir una nou faries servir una excavadora? Doncs això. Hi ha qui clava una cerca binària en un array de 5 elements, i qui ordena un milió de dades amb bombolla. Els dos estan malament: un malgasta esforç, l'altre malgasta el seu temps de vida. Triar l'algoritme adequat és part de l'ofici.

---

## 📋 La taula de resum

| Algoritme | Complexitat | Quan usar-lo? | Quan NO? |
|---|---|---|---|
| Cerca lineal | O(n) | Arrays xicotets o desordenats | Arrays grans i ordenats (la binària guanya) |
| Cerca binària | O(log n) | Arrays grans **ordenats**, amb moltes cerques | Arrays desordenats (escombraria sense avís!) |
| Bombolla | O(n²) | Aprendre i arrays molt xicotets (< 50) | Qualsevol cosa que merega la pena |
| Inserció | O(n²) / O(n) | Arrays xicotets o **quasi ordenats** | Arrays grans i desordenats |

---

## 🧮 La pregunta clau: ¿ordenar abans de buscar?

Val, la cerca binària és rapidíssima... però exigix un array ordenat. I ordenar també costa. Llavors: mereix la pena ordenar primer?

La regla del bon administrador:

- Si **ordenes una vegada i busques moltes vegades** → ordena amb alguna cosa decent (en la U06 veuràs com) i després usa binària. La inversió s'amortitza.
- Si **busques una sola vegada** en un array desordenat → cerca lineal directa. Ordenar només per a una cerca és regar el jardí amb xampany.

I una curiositat: per a arrays **molt xicotets** (menys de ~50 elements), la cerca lineal sol guanyar fins i tot amb dades ordenades, perquè la sobrecàrrega de la binària no compensa. La teoria importa, però el context mana.

---

## 🏫 Exemple guiat: el catàleg de la botiga

Tens una botiga amb `notes` de clients i vols saber la nota de "Lluís". El catàleg està en un `int[] notes` amb els valors desordenats i només preguntaràs una vegada. Què uses?

```java
public class Botiga {
    // Una sola cerca sobre dades desordenades → cerca lineal
    public static int buscarNota(int[] notes, int objectiu) {
        for (int i = 0; i < notes.length; i++) {
            if (notes[i] == objectiu) {
                return i;
            }
        }
        return -1;
    }

    public static void main(String[] args) {
        int[] notes = {7, 9, 5, 8, 6, 4};
        int posicio = buscarNota(notes, 8);
        System.out.println("El 8 està en la posició " + posicio);
    }
}
```

I si la teua botiga rebera **milers de consultes al dia** sobre el mateix catàleg? Llavors mereix la pena ordenar l'array una vegada (costa O(n²) amb el que saps hui, però en la U06 aprendràs més ràpid) i usar cerca binària en cada consulta. **Ordenar una vegada, buscar mil.**

---

## 📊 Regles d'or per a decidir

1. **És xicotet (< 50)?** → Qualsevol val: usa lineal o inserció per simplicitat.
2. **És gran i desordenat?** → No uses bombolla ni inserció. Espera a la U06 (QuickSort, MergeSort).
3. **És gran i ordenat?** → Cerca binària, sense pensar-ho.
4. **Està quasi ordenat?** → Inserció arrasa: O(n) en la pràctica.
5. **Vaig a buscar moltes vegades?** → Inverteix en ordenar bé i busca amb binària.
6. **Vaig a buscar una sola vegada?** → Lineal directa, sense drames.

> ⚠️ **Advertència:** la tria de l'algoritme també dependrà d'altres factors que veuràs més avant: l'**estabilitat** (mantindre l'ordre dels iguals?), la **memòria** disponible i si les dades caben en memòria. Per ara, amb estes regles d'or sobreviu a qualsevol examen i a quasi qualsevol app.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** abans d'escriure una línia, pregunta't: *quina mida té el meu array? Està ordenat? Quantes vegades faré esta operació?* Tres preguntes, tres respostes, i l'algoritme es tria sol.

**Exercici: el cap de magatzem**

Per a cada escenari, tria l'algoritme més adequat i justifica en una línia:

1. Un array de **8** notes desordenat, buscar la nota d'un alumne una sola vegada.
2. Una agenda de **10.000** contactes ordenada alfabèticament, on buscaràs noms constantment.
3. Un array de **60.000** mesuraments desordenats que cal deixar ordenats de menor a major.
4. Un array de **200** nombres ja quasi ordenats (només un parell de despistats fora de lloc).

<details>
<summary>🔄 Solució</summary>

1. **Cerca lineal**: array xicotet, una sola cerca, i a més està desordenat. La binària ni es planteja.
2. **Cerca binària**: està ordenat i busques moltes vegades: O(log n) en cada consulta.
3. **Ni bombolla ni inserció**: amb 60.000 elements, O(n²) és un martiri. Toca esperar a la U06 (QuickSort/MergeSort, O(n log n)).
4. **Inserció**: amb dades quasi ordenades és O(n) en la pràctica, molt millor que la bombolla.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quan guanya la cerca lineal a la binària encara que l'array estiga ordenat?
2. Quan mereix la pena ordenar abans de buscar?
3. Quin algoritme tries per a un array quasi ordenat?
4. Quina regla d'or usaries per a un array de 100.000 elements desordenat?

<details>
<summary>🔄 Respostes</summary>

1. Amb arrays **molt xicotets** (< ~50) o quan només vas a buscar **una vegada**: la sobrecàrrega de la binària no compensa.
2. Quan **ordenes una vegada i busques moltes vegades**; la inversió s'amortitza amb les consultes.
3. **Inserció** — és O(n) en la pràctica amb dades quasi ordenades.
4. No usar bombolla ni inserció: el seu O(n²) seria un calvari. Espera a la U06 per a ordenar com cal.

</details>

---

## ✅ Resum en 3 frases

1. L'algoritme adequat depén de la **mida**, l'**ordre inicial** i la **freqüència de les operacions**.
2. **Ordenar una vegada i buscar moltes** amortitza la inversió; buscar una sola vegada no mereix ordenar.
3. Regla ràpida: xicotet o desordenat → lineal; gran i ordenat → binària; quasi ordenat → inserció; gran i desordenat → espera a la U06.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Context | Mida, ordre inicial i freqüència d'ús de les teues dades |
> | Amortitzar | Recuperar una inversió inicial amb l'ús repetit |
> | Sobrecàrrega | El cost fix extra d'un algoritme sofisticat en dades xicotetes |
> | Trade-off | Compromís: guanyar en alguna cosa pagant alguna cosa a canvi |
> | Estabilitat | Mantindre l'ordre relatiu dels elements iguals |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/05-algoritmica-fundamentos) · **Anterior:** [06 · Complexitat algorísmica: Big O](/ApuntesProgramacion/va/05-algoritmica-fundamentos/06-complejidad-big-o) · **Següent:** [08 · Be the Code: cerca binària des de zero](/ApuntesProgramacion/va/05-algoritmica-fundamentos/08-be-the-code)
