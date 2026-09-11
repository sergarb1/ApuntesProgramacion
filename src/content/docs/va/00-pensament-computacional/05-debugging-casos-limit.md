---
title: "05 — Debugging i casos límit"
description: "El text roig és el teu amic i el detectiu mai no prova només el bonic 🚨🕵️"
---

<p><small>El text roig és el teu amic i el detectiu mai no prova només el bonic 🚨🕵️</small></p>

> 🗺️ **Estás en:** 🧠 **U00 · Introducció al Pensament Computacional** → 05 · Debugging i casos límit

---

Arriba el moment inevitable de la vida de qualsevol persona que programa: fas clic en el botó verd d'executar el programa i, en lloc de funcionar com la seda, la pantalla s'il·lumina amb un text roig fosc que sembla cridar-te: *«Has fracassat en la vida! Tanca el portàtil i fuig al camp a cuidar ovelles!»* 🐑🏃💨

Tranquil·litat! Cal desmuntar el drama des del minut 1: **un error en el teu codi no és una vergonya, ni un atac personal, ni un senyal que no vals per a la informàtica.**

En programació, els errors tenen un nom tàctic —**bugs** 🐛— i l'art de trobar-los i corregir-los es diu **debugging** (o desinsectació mental). Aprendrem a mirar els errors als ulls sense entrar en pànic. 👁️🛑

---

## 🔴 1. El canvi de xip: El text roig és el teu amic

Per a un humà normal, una llum roja gegant significa: *«PERILL! HO HAS FET MALAMENT!»*. Però per a un programador o programadora, **el text roig és un assistent ultra-eficient que parla amb tu gratis.** 🤖💬

**Pensa-ho així:** la màquina podria simplement quedar-se en silenci, petar o dir-te un "No funciona" i deixar-te a les fosques. Però no! Et dona una **stack trace** (la famosa muntanya de lletres rojes) que et diu dues coses d'or pur:

1. **Què ha passat? 🧐** *(Ex. T'has oblidat de tancar un parèntesi, o has intentat dividir per zero).*
2. **En quina línia exacta ha passat?** 📍 (Ex. Al fitxer Main.java, a la línia 24).

> ❌ **El que veu el teu cervell en pànic:** *"FATAL ERROR SYSTEM CRASH DIE DIE DIE BLA BLA BLA"* 😱

> **🟢 El que diu el missatge en realitat:** "Hola! A la línia 24 has escrit num2 en lloc de num1. De res, campió!" 👍

---

## 🧪 2. Pensar com un programador: Provar els casos límit

Un altre error de principiant és provar el programa NOMÉS amb les dades "boniques" i dir: *«Ja funciona!»*.

Imagina este programa súper senzill:

> *"Un programa que indica si una persona és major d'edat (edat mínima: 18 anys)."*

Si el proves posant un **20**, el programa diu "Major d'edat" i tu te'n vas a fer un café tan content/a ☕. Però un bon programador té una **ment de detectiu maliciós** i es pregunta: *«I com podria fer petar jo açò?»* 😈

Cal provar SEMPRE els **casos límit (edge cases)**:

* 🎯 **El límit exacte (18 anys):** El teu programa diu que té 18 és major d'edat o s'ha quedat fora per un error de > en lloc de >=?
* 🎯 **El límit inferior (17 anys):** Diu correctament que és menor?
* 🎯 **El límit zero (0 anys):** Què fa el programa?
* 💣 **El cas "Gamberro" (-5 anys o 200 anys):** Té sentit que algú tinga -5 anys? O hauries de comprovar que l'edat siga un número vàlid abans de fer res?

Provar els casos que ningú s'espera és la diferència entre un programa d'aficionat i un programa professional! 🛡️✨

---

## 💡 Idea clau per a recordar

> **Els errors no són el final del camí, són el mapa.**

> Un programa que falla no és un fracàs; és simplement un trencaclosques que t'està donant les pistes exactes per a ser resolt. Abraça el text roig! 🔴🧩🔎

---

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/00-pensament-computacional) · **Anterior:** [04 · La descomposició](/ApuntesProgramacion/va/00-pensament-computacional/04-descomposicio) · **Següent:** [06 · El protocol de pau](/ApuntesProgramacion/va/00-pensament-computacional/06-protocol-pau)
