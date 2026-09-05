---
title: "U06 — Algorítmica II: Tècniques"
description: "Recursivitat, divide i venceràs, Quicksort i Mergesort: les tècniques que fan que el teu codi pense ⚡"
emoji: ⚡
---

<p><small>Recursivitat, divide i venceràs, Quicksort i Mergesort: les tècniques que fan que el teu codi pense ⚡</small></p>

> 🗺️ **El mapa del paquet:** 🚪 Benvinguda → ☕ U01 → 🔤 U02 → 🔀 U03 → 🅿️ U04 → 🧩 U05 → **⚡ ACÍ ETS (U06)** → 🏗️ U07 → 🔒 U08 → 🧬 U09 → 📚 U10 → 🗺️ U11 → 📁 U12 → 🗄️ U13 → 🌐 U14

---

Benvingut, valent explorador de la pila de crides. En la U05 vas dominar l'art de buscar i ordenar amb bucles: cerca lineal, binària, bombolla i inserció. Vas aprendre a mesurar algorismes amb Big O i a no usar mai bombolla en producció (ho vas prometre). Però els bucles es queden curts quan el problema és *inherentment* jeràrquic. I ací és on la programació es torna elegant.

Esta unitat és la que **et canvia la manera de pensar**. Faràs que una funció es crida a si mateixa (sense tornar-te boig), partiràs problemes per la meitat fins a fer-los trivials, i coneixeràs els dos reis de l'ordenació moderna: **Quicksort** i **Mergesort**. Quan acabes, veuràs recursivitat per tot arreu. És com aprendre una paraula nova: de sobte, la trobes en cada racó del codi.

Respira fons. I recorda: per a entendre la recursivitat, primer has d'entendre la recursivitat.

---

## 🎯 Objectiu de la unitat

En acabar, seràs capaç de:

- Escriure funcions **recursives** amb cas base i cas recursiu, i raonar sobre la **pila de crides**.
- Implementar els clàssics: **factorial**, **Fibonacci** (ingenu i amb memoització), **palíndroms** i **torres de Hanoi**.
- Aplicar l'estratègia **divide i venceràs**: dividir, conquistar i combinar.
- Implementar **Quicksort** entenent la partició, el pivot i les seues complexitats.
- Implementar **Mergesort** entenent la fusió i l'estabilitat.
- **Triar amb criteri** l'algorisme d'ordenació segons el context (mida, ordre previ, memòria, estabilitat).
- Reconéixer altres tècniques com els algorismes **voracos** (greedy) i el **backtracking**.

---

## 🗺️ Mapa de la unitat

| Punt | Què aprendràs | Dificultat |
|---|---|---|
| [01 · Recursivitat](/ApuntesProgramacion/va/06-algoritmica-tecnicas/01-recursividad) | Cas base, cas recursiu, la pila de crides i la por al `StackOverflowError` | Tots |
| [02 · Recursivitat: exemples clàssics](/ApuntesProgramacion/va/06-algoritmica-tecnicas/02-recursividad-ejemplos-clasicos) | Factorial, Fibonacci, palíndroms i torres de Hanoi | Tots |
| [03 · Divide i venceràs](/ApuntesProgramacion/va/06-algoritmica-tecnicas/03-divide-y-venceras) | Dividir, conquistar i combinar: el patró de Juli Cèsar | Tots |
| [04 · Quicksort](/ApuntesProgramacion/va/06-algoritmica-tecnicas/04-quicksort) | Partició, pivot, complexitats i per què és tan famós | Tots |
| [05 · Mergesort](/ApuntesProgramacion/va/06-algoritmica-tecnicas/05-mergesort) | Divisió per la meitat, fusió i estabilitat | Tots |
| [06 · Comparació: quan usar cada ordenació](/ApuntesProgramacion/va/06-algoritmica-tecnicas/06-comparacion-ordenacion) | Guia pràctica per a triar algorisme i què hi ha sota `Arrays.sort()` | Tots |
| [07 · Be the Code: quicksort des de zero](/ApuntesProgramacion/va/06-algoritmica-tecnicas/07-be-the-code-quicksort) | Implementar Quicksort i Mergesort pas a pas, sense mirar | ⭐⭐⭐ |
| [08 · Altres tècniques algorísmiques](/ApuntesProgramacion/va/06-algoritmica-tecnicas/08-otras-tecnicas-algoritmicas) | Algorismes voracos (greedy) i backtracking | ⭐⭐⭐ |
| [09 · Repàs interactiu](/ApuntesProgramacion/va/06-algoritmica-tecnicas/09-repaso-interactivo) | Sé el Código, Fireside, Laboratori, Crucigrama i més | Tots |

> 📖 **Flux de lectura:** els 8 primers punts són teoria i pràctica en progressió. El 9 és l'aterratge final: llig-lo just després del 8 i abans d'obrir els butlletins.

---

## 📝 Butlletins de la unitat

> Practica amb els parells del curs: comença sempre pel resolt per a vore l'estil i després intenta el per-resoldre.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/va/boletines/boletin-u06-inicial-resuelto" class="elink">✅ Inicial resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u06-inicial" class="elink">🟢 Inicial per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u06-avanzado-resuelto" class="elink">💪 Avançat resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u06-avanzado" class="elink">⭐ Avançat per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u06-extras" class="elink">🔥 Extres</a>
</div>

---

## ✅ Criteris d'avaluació coberts (RA2 + RA6)

**RA2: Escriu i prova programes senzills, reconeixent i aplicant els fonaments de la programació orientada a objectes.**

**RA6: Escriu programes que manipulen informació, seleccionant i utilitzant tipus avançats de dades.**

| CE | Criteri | On es cobreix |
|---|---|---|
| RA2 b) | S'han escrit programes simples. | ✅ Tots |
| RA2 e) | S'han escrit crides a mètodes estàtics. | ✅ Punts 1-7 |
| RA2 f) | S'han utilitzat paràmetres en la crida a mètodes. | ✅ Punts 1-8 |
| RA2 i) | S'ha utilitzat l'entorn integrat de desenvolupament en la creació i compilació de programes simples. | ✅ Tots |
| RA6 a) | S'han escrit programes que utilitzen arrays. | ✅ Punts 3-8 |
| RA6 b) | S'han reconegut les llibreries de classes relacionades amb tipus avançats de dades. | ✅ Punts 4, 5 i 6 |

> 📌 La recursivitat dels punts 1 i 2 és la llavor de les **estructures jeràrquiques** (arbres, grafs) que exploraràs amb més profunditat en el mòdul d'Estructures de Dades. I la tria justificada d'algorisme del punt 6 és, directament, un RA6 en estat pur: *seleccionar* el tipus de processament adequat a les dades.

---

## 🚪 Per on comence?

- Vens de la U05 i estàs fresc de Big O? → Arranca en el [punt 1](/ApuntesProgramacion/va/06-algoritmica-tecnicas/01-recursividad). Només necessites el que vas vore en Fonaments.
- El que t'agrada és vore el resultat i no les tripes? → Salta al [punt 4](/ApuntesProgramacion/va/06-algoritmica-tecnicas/04-quicksort) i al [punt 5](/ApuntesProgramacion/va/06-algoritmica-tecnicas/05-mergesort) i torna després a la teoria de la recursivitat.
- Et flipen els reptes? → Fes el [punt 7](/ApuntesProgramacion/va/06-algoritmica-tecnicas/07-be-the-code-quicksort) sense mirar el codi dels punts 4 i 5. Patix amb honor.
- Vens a repassar? → Fes el [Repàs interactiu](/ApuntesProgramacion/va/06-algoritmica-tecnicas/09-repaso-interactivo) i després els [butlletins](/ApuntesProgramacion/va/boletines/boletin-u06-inicial).

**📍 Primer punt:** [01 · Recursivitat](/ApuntesProgramacion/va/06-algoritmica-tecnicas/01-recursividad)  
**⏭️ En acabar la unitat, continua en [U07 · POO: Classes i Objectes](/ApuntesProgramacion/va/07-poo-clases-objetos).**
