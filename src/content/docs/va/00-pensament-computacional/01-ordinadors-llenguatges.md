---
title: "01 — Què és un ordinador i un llenguatge de programació"
description: "El primer pas: entendre amb qui anem a parlar 🖥️"
---

<p><small>El primer pas: entendre amb qui anem a parlar 🖥️</small></p>

> 🗺️ **Estás en:** 🧠 **U00 · Introducció al Pensament Computacional** → 01 · Què és un ordinador i un llenguatge de programació

---

Abans d'aprendre a pensar la lògica dels nostres programes, cal fer un pas enrere i entendre **on dimonis estem i amb qui anem a parlar**.

Quan la gent diu *"estic aprenent a programar"*, en realitat està aprenent a traduir idees humanes a un format que un conjunt de circuits electrònics puga executar. Però com es produeix eixa màgia? Ací tens els conceptes clau que necessites tindre clars abans de començar. 📌

---

## 🧠 1. Un ordinador és extraordinàriament ràpid, però absolutament ximple

Un ordinador no pensa, no té intuïció i no sap què vols fer. L'únic que entén la màquina a nivell de maquinari (hardware) és el codi màquina: una seqüència infinita de zeros i uns (0 i 1), conegut com a sistema binari.

* Els 0 i 1 representen, literalment, l'absència o el pas de corrent elèctric pels transistors del processador.
* Escriure un programa directament en zeros i uns és una tasca humana pràcticament impossible i dolorosa.

---

## 🗣️ 2. Què és un llenguatge de programació?

Un **llenguatge de programació** és el pont o la interfície entre el teu cervell i el processador. És un conjunt de regles, paraules clau i estructures creades per humans que ens permeten escriure instruccions de manera entenedora per a nosaltres, però que es poden traduir fàcilment a zeros i uns.

Hi ha dos grans tipus de llenguatges segons la seua proximitat a la màquina:

* **Llenguatges de baix nivell (ex: Assemblador):** Estan molt a prop del maquinari. Són ultra-ràpids, però extremadament difícils d'escriure i mantindre per a un humà.
* **Llenguatges d'alt nivell (ex: Java, Python, C#):** Utilitzen paraules en anglés (if, while, class), estructures lògiques complexes i símbols matemàtics. Són fàcils de llegir i escriure per a nosaltres, però la màquina no els entén directament.

---

## 🔄 3. El traductor: Compiladors vs. Intèrprets

Com que l'ordinador només entén binari i nosaltres escrivim en un llenguatge d'alt nivell, **necessitem un traductor**. Ací és on apareix la gran diferència en com s'executa el codi:

[📝 Codi Font (Java)] ──► [⚙️ TRADUCTOR / Compilador] ──► [🤖 Codi Màquina (0s i 1s)]

1. **Compilador (El traductor de llibres):** Agafa TOT el teu fitxer de codi font, el revisa sencer, comprova que no hi haja errors de sintaxi i genera un fitxer executable independent. Si hi ha un sol error, no tradueix res fins que ho corregeixes. *(Exemple: C, C++).*
2. **Intèrpret (El traductor en directe):** Llegeix el teu codi línia per línia i l'executa a l'acte. Si troba un error a la línia 50, executarà les primeres 49 línies i es pararà exactament en la 50. *(Exemple: Python, JavaScript).*

> ☕ **I Java?** Java utilitza un sistema híbrid molt especial. Primer es **compila** a un codi intermedi anomenat *Bytecode*, i després una "màquina virtual" (**JVM - Java Virtual Machine**) l'**interpreta** en qualsevol ordinador (Windows, Mac, Linux). Per això es diu que Java és *"Escriu-ho una vegada, executa-ho on vulgues"*.

---

## 🔤 4. Conceptes clau que escoltaràs cada dia

Per a no sonar com un estranger quan parlem del mòdul, guarda estos 5 termes al teu diccionari personal:

* **Codi Font (Source Code):** El text pla que tu escrius en el llenguatge de programació (els teus fitxers .java).
* **Sintaxi:** Les regles gramaticals del llenguatge. Si en valencià no pots dir *"casa la roja és"*, en Java no pots oblidar un punt i coma ; o una clau {}. Si et saltes la sintaxi, el compilador es queixarà en roig.
* **IDE (Entorn de Desenvolupament Integrat):** El programa o la "fàbrica" que utilitzem per a escriure codi (com VS Code, Eclipse o NetBeans). És com un processador de textos (estil Word), però dissenyat per a programar: remarca colors, avisa d'errors i té el botó d'executar integrat.
* **Algorisme:** La seqüència lògica i finita de passos que resol un problema (independentment del llenguatge que uses).
* **Execució / Run:** El moment en què li dius a l'ordinador *"Agafa el meu programa i fes el que posa ací"*.

---

## 💡 Idea clau per a recordar

> **El llenguatge de programació és només l'idioma de la conversa.**

> Aprendre la sintaxi de Java és fàcil (és com aprendre vocabulari). El repte real d'este curs no és memoritzar el diccionari, sinó saber **què dimonis vols dir-li a la màquina** per a resoldre un problema. I d'això tracta la resta d'esta Unitat 0! 🚀

---

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/00-pensament-computacional) · **Anterior:** [Índex de la unitat](/ApuntesProgramacion/va/00-pensament-computacional) · **Següent:** [02 · Programar no és memoritzar codi](/ApuntesProgramacion/va/00-pensament-computacional/02-no-memoritzar)
