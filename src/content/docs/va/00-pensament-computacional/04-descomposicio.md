---
title: "04 — La descomposició"
description: "Divideix i venceràs: l'art de partir un elefant 🧱⛏️"
---

<p><small>Divideix i venceràs: l'art de partir un elefant 🧱⛏️</small></p>

> 🗺️ **Estás en:** 🧠 **U00 · Introducció al Pensament Computacional** → 04 · La descomposició

---

Quan et trobes davant d'un exercici de programació que ocupa mig foli d'enunciat, és completament normal que la teua primera reacció siga una mescla de suor freda, ganes de tancar el portàtil i ganes de demanar un canvi de cicle a un d'art Floral. 🌿🙈

El problema no és que l'exercici siga impossible. El problema és que el teu cervell està intentant processar **TOTA la complexitat de colp**. Vol resoldre el principi, el mig, el final, la interfície, els errors i la base de dades en el mateix segon.

Veurem la tècnica secreta (i mil·lenària) que fan servir els programadors de tot el planeta per a no col·lapsar: **Divideix i venceràs.** ⚔️👑

---

## 🐘 Com menjar-se un elefant? (A mossegades!)

Hi ha una pregunta clàssica de reflexió: *«Com et menges un elefant de 4 tones?»*

La resposta és evident: *«Mossegada a mossegada, lentament i sense pressa».* 🥩

En programació és exactament el mateix: **un problema gran només és una col·lecció de problemes xicotets disfressats.** Si intentes resoldre'l tot de colp, et bloquejaràs. Si el desmuntes en peces microscòpiques, veuràs que cada peça individual és tan senzilla que podries resoldre-la quasi sense pensar.

---

## 🏛️ L'art de la descomposició en sub-blocs

Imagina que el teu primer dia de pràctiques et diuen:

💬 *«Necessitem que faces una aplicació sencera per a gestionar una Biblioteca Municipal».*

Si intentes començar a programar això directament, la pantalla en blanc es riurà de tu a la cara. Com apliquem la descomposició? Dividint el "monstre" en blocs independents:

***[1. Gestió d'Usuaris 👤] 📖 ──► [2. Catàleg de Llibres 📚] 📍 ──► [3. Sistema de Préstecs 🔄] ⏱️ ──► [4. Devolucions i Penalitzacions ⏰] ──► [5. Cerca i filtres 🔍]***

Falta menys! Ara, en lloc de pensar en "TOTA la biblioteca", ens centrem **únicament** en el sub-bloc número 3: **El sistema de préstecs**.

Però espera, que encara el podem dividir més! Com és el procés d'un préstec pas a pas?

**[Préstec d'un Llibre] 📖**

```
│
├── 1. Identificar l'usuari (DNI) 🆔
├── 2. Identificar el llibre (Codi de barres) 🏷️
├── 3. Comprovar si l'usuari té multes pendents 🚫
├── 4. Comprovar si el llibre està disponible (no prestat) ❓
├── 5. Registrar la data de hui i la data límit 📅
└── 6. Canviar l'estat del llibre a "Prestat" ✅
```

MIRA AIXÒ! 🎉 La tasca gegant i aterridora de "Fer una Biblioteca" s'ha convertit en una llista d'accions tan simples com: *"Comprovar si un número és major que zero"* o *"Guardar un nom en un text"*.

**Felicitats! Ja estàs dissenyant l'arquitectura d'un programa sense haver tocat una sola línia de Java.** 👏🥳

---

## ⚠️ Les 3 regles d'or per a no morir en la divisió

1. **Mai no resolgues dos sub-problemes alhora 🚫:** Si estàs fabricant la part on l'usuari posa el seu DNI, NO penses encara en com s'imprimirà el tiquet en PDF. Una cosa rere l'altra!
2. **Si un sub-pas encara et sembla difícil, torna a dividir-lo ✂️:** Si el pas 3 (*Comprovar multes*) et sembla embolicat, divideix-lo en: 3a) Llegir multes de l'usuari, 3b) Sumar l'import total, 3c) Si és major que 0€, bloquejar el préstec.
3. **Celebra les xicotetes victòries 🥳:** Veure que el pas 1 (*Llegir el DNI*) funciona correctament et dona un xut de dopamina i seguretat per a afrontar el pas 2.

---

## 💡 Idea clau per a recordar

> **Davant d'un problema gran, no et bloqueges: esmola la tisora.**

> Si una tasca et fa por, és simplement perquè no l'has dividit en peces prou xicotetes. Fes els passos més i més xicotets fins que siguen ridículament fàcils de resoldre. ✂️🧩🚀

---

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/00-pensament-computacional) · **Anterior:** [03 · Primer pensem, després escrivim](/ApuntesProgramacion/va/00-pensament-computacional/03-pensar-abans) · **Següent:** [05 · Debugging i casos límit](/ApuntesProgramacion/va/00-pensament-computacional/05-debugging-casos-limit)
