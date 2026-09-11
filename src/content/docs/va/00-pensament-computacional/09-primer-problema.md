---
title: "09 — El meu primer problema (pont cap a Java)"
description: "Resolem el nostre primer repte sense tocar Java 🌉☕"
---

<p><small>Resolem el nostre primer repte sense tocar Java 🌉☕</small></p>

> 🗺️ **Estás en:** 🧠 **U00 · Introducció al Pensament Computacional** → 09 · El meu primer problema (pont cap a Java)

---

Hem arribat al final d'esta Unitat 0! Després de desmuntar falsos mites, de barallar-nos amb la literalitat dels robots, d'aprendre a no tindre por al text roig i de posar a la IA a treballar com a tutor privat, arriba el moment de la veritat: **resoldre el nostre primer problema de programació real.** 🥳🎉

I el millor de tot? Anem a fer-ho **sense escriure ni una sola línia de Java encara**.

Per què? Perquè així comprovaràs en carn pròpia la gran lliçó d'esta unitat: **la part difícil de programar és pensar la lògica; traduir-ho a un llenguatge concret és només qüestió de sintaxi.** 🧠➡️⌨️

---

## 🥊 El Repte: El Comparador de Nombres

Imagina que ens demanen crear un programa súper senzill per a una aplicació:

> 📌 **Enunciat del problema:**

> *"Un programa ha de demanar dos nombres enters a l'usuari i indicar clarament per pantalla quin dels dos és el major, o si tots dos números són iguals."*

Sembla fàcil, veritat? Però abans d'obrir qualsevol editor de codi o començar a escriure parèntesis, aplicarem el nostre mètode de treball en 3 passos. 📄✍️

---

## 🧩 Pas 1: Descomposició i Entrenament de Dades (Inputs i Outputs)

Abans de pensar la lògica, un/a programador/a es pregunta: **Què necessite demanar (Inputs) i què he de tornar (Outputs)?**

* **📥 Dades d'entrada (Inputs):** Necessitem 2 nombres enters. Els direm el nombre A i nombre B.
* **📤 Dada d'eixida (Output):** Un missatge per pantalla que diga quin és el major o si són iguals.

---

## 👣 Pas 2: L'Algorisme en Pseudocodi (Lògica pura)

Ara escriurem la seqüència de passos en el nostre propi idioma, sense preocupar-nos per punts i comes o claus. Solament lògica!

```
1. Demanar a l'usuari el Número A.
2. Demanar a l'usuari el Número B.
3. Comparar els dos números:
   - SI el Número A és major que el Número B:
         Mostrar el missatge: "El Número A és el major".
   - SI NO, SI el Número B és major que el Número A:
         Mostrar el missatge: "El Número B és el major".
   - SI NO (si cap de les anteriors es compleix):
         Mostrar el missatge: "Tots dos números són iguals".
4. Fi del programa.
```

Mira este algorisme un segon. Té tot el sentit del món, veritat? **Això JA és programar.** Qualsevol persona, siga d'Ontinyent, de Tòquio o un robot de la NASA, entén perfectament esta lògica. 🚀✨

---

## 🧪 Pas 3: El testing de casos límit (Mentalitat de detectiu)

Abans de donar l'algorisme per bo, anem a fer-li el nostre "control de qualitat" provant diferents valors:

* 🟢 **Cas 1 (Normal):** A = 8, B = 3 ──► El programa diu *"A és el major"*. (Correcte! ✅)
* 🟢 **Cas 2 (Invers):** A = 2, B = 10 ──► El programa diu *"B és el major"*. (Correcte! ✅)
* 🟡 **Cas Límit (Igualtat):** A = 5, B = 5 ──► El programa comprova la primera opció (5 > 5? Fals), la segona (5 > 5? Fals) i cau en el *SI NO*, dient *"Tots dos números són iguals"*. (Correcte! ✅)

L'algorisme és 100% sòlid. Funciona en paper i funciona en el teu cap. 🏆

---

## 🌉 I ara... On està el pont cap a Java? ☕

Ací ve la màgia! A partir de la pròxima unitat, l'única cosa que farem serà **aprendre com es diuen en Java eixes mateixes instruccions que tu ja has pensat**:

* Per a demanar dades, aprendrem a usar una eina de Java anomenada Scanner.
* Per a comparar i prendre decisions (SI... SI NO), aprendrem la paraula reservada if i else.
* Per a mostrar missatges per pantalla, usarem una instrucció anomenada System.out.println().

| 🧠 LA TEUA LÒGICA (Unitat 0) | ☕ LA TRADUCCIÓ A JAVA (Unitat 1) |
| --- | --- |
| SI el Número A és major que el B... | if (numeroA > numeroB) { |
| Mostrar "A és el major" | System.out.println("A és el major"); |
| FI DEL SI | } |

Veus com no era tan fosc ni tan difícil? La lògica ja la tens; ara només aprendrem el "diccionari" de Java per a dir-li-ho a la màquina! 📖☕

---

## 💡 Idea clau per a tancar la Unitat 0

> **Ja saps pensar com un programador/a.**

> Ara que tens el mètode, la mentalitat i el protocol per a no bloquejar-te, obrim la porta a la Unitat 1. Benvingut/da al món real de Java! 🚀☕💻

---

# 🐛 Glossari

Per a tancar la unitat i que no et sonen a "xinés" les paraules que el professorat i el sector utilitzen diàriament, ací tens la teua guia ràpida de consulta:

## 💻 Termes tècnics d'Infraestructura

* **Codi Font (Source Code):** El text que tu escrius en el llenguatge de programació (fitxers .java). És el "manuscrit" que nosaltres podem llegir i editar.
* **Sintaxi:** Les regles gramaticals d'un llenguatge. Si et saltes un punt i coma ; o una clau {}, el compilador no entendre res i et donarà un error de sintaxi.
* **Compilador:** El programa traductor que agafa el teu codi font i el converteix en instruccions que el processador puga executar.
* **IDE (*Integrated Development Environment*):** El programa que utilitzes per a escriure codi (com *Eclipse*, *NetBeans* o *VS Code*). És com un "Word per a programadors", amb colors, autocompletat i botó d'executar.

## 🧠 Termes de lògica i procés

* **Algorisme:** La seqüència ordenada, finita i sense ambigüitats de passos que resol un problema.
* **Pseudocodi:** Cal escriure la lògica d'un algorisme en el teu propi idioma (valencià/castellà) abans de traduir-lo a Java.
* **Descomposició:** La tècnica de dividir un problema gran i complex en sub-problemes molt més xicotets i fàcils de resoldre.
* **Abstracció:** El procés de filtrar i ignorar els detalls irrellevants d'un problema per a centrar-te només en les dades essencials.

## 🐛 Termes de gestió d'errors i control

* **Bug:** Un error o falla en la lògica o en l'execució d'un programa.
* **Debugging (o Depuració):** El procés de buscar, aïllar i corregir un *bug* en el teu codi.
* **Stack Trace:** La muntanya de text roig que apareix a la consola quan el programa falla. Et diu quin error hi ha hagut i en quina línia exacta ha passat.
* **Casos límit (*Edge Cases*):** Les situacions o dades extremades (valors zero, nombres negatius, edats exactes) on el programa té més risc de fallar si no s'ha provat bé.

## 🤖 Termes de treball i metodologia

* **Miratge de la comprensió:** La falsa sensació de saber fer un exercici només per haver vist o llegit com el resolia una altra persona.
* **Tutor Socràtic (amb IA):** Utilitzar la intel·ligència artificial fent-li preguntes perquè t'ajude a pensar, en lloc de demanar-li que et faça el codi directe.
* **Entrada/Eixida (*Input/Output* o I/O):** Les dades que el programa rep de l'usuari (Input) i els resultats que el programa mostra per pantalla (Output).

---

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/00-pensament-computacional) · **Anterior:** [08 · Com utilitzarem la IA](/ApuntesProgramacion/va/00-pensament-computacional/08-ia-tutor) · **Següent:** **[U01 · Introducció a Java](/ApuntesProgramacion/va/01-introduccion)**
