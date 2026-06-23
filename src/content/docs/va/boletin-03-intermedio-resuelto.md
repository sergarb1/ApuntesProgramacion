---
title: "Butlletí 3 - Intermedi Resolt: Estructures de Control"
nav_order: 9
---
Dificultat progressiva. Els ⭐ t'escalfen, els ⭐⭐ et fan pensar, els ⭐⭐⭐ et preparen per al món real (i per a ProgramaMe).

---

## ⭐ Exercici 1: El classificador de notes sarcàstic

Demana una nota (0-100) i classifica-la: 90+ "Sobresaliente", 70+ "Notable", 50+ "Aprobado", menys "Suspenso". Captura que la nota siga vàlida (0-100).

> **💡 Explicació:** Primer validem que la nota estiga entre 0 i 100. Després, amb `else if`, avaluem de major a menor. Si la nota és 85, no entra en `>= 90` però sí en `>= 70`. L'ordre és crucial: si posares `>= 50` abans que `>= 90`, un 95 també entraria en `>= 50`. Ves sempre del més específic al més general. Com en la vida: primer l'urgent, després l'important, després el que siga.

---

## ⭐ Exercici 2: Taula de multiplicar

Demana un nombre i mostra la seua taula de multiplicar de l'1 al 10 amb un `for`.

> **💡 Explicació:** El `for` va d'1 a 10. En cada volta, multiplica `n` per `i`. Simple, directe. És com quan eres xicotet i recitaves la taula del 7: "7 per 1 és 7, 7 per 2 és 14...". La diferència és que ara l'ordinador ho fa per tu i no s'equivoca (a menys que tu t'equivoques en programar-ho, clar).

---

## ⭐⭐ Exercici 3: Divisió segura amb try-catch

Demana dos nombres enters. Dividix el primer entre el segon. Captura `ArithmeticException` (divisió per zero) i `InputMismatchException` (no escriure un nombre).

> **💡 Explicació:** El bloc `try` conté el codi perillós. Si ocorre un `ArithmeticException` (divisió per zero) o un `InputMismatchException` (l'usuari escriu lletres), s'executa el `catch` corresponent. El `finally` s'executa sempre, hi haja error o no. És com l'assegurança de vida del teu programa: passe el que passe, es tanca el Scanner i es diu alguna cosa. Sense `try-catch`, si l'usuari dividix per zero, el programa mor amb un missatge roig d'error. Amb `try-catch`, el programa sobreviu i seguix avant com un heroi d'acció.

---

## ⭐⭐ Exercici 4: El triangle constructor

Dibuixa un triangle d'asteriscs amb bucles niats. L'usuari introduïx l'altura.

```
*
**
***
****
*****
```

> **💡 Explicació:** El bucle exterior (`i`) controla les files (d'1 a altura). El bucle interior (`j`) controla les columnes de cada fila: en la fila 1 imprimeix 1 asterisc, en la fila 2 imprimeix 2... Usem `print` (sense `ln`) perquè els asteriscs isquen en la mateixa línia. En acabar cada fila, fem un `println` buit per a saltar a la següent línia. Els bucles niats són como nines russes: un bucle dins d'un altre. L'interior dona voltes completes per cada volta de l'exterior.

---

## ⭐⭐ Exercici 5: Fibonacci amb for

Mostra els primers N nombres de Fibonacci. La seqüència comença: 0, 1, 1, 2, 3, 5, 8, 13...

> **💡 Explicació:** Fibonacci és la seqüència on cada nombre és la suma dels dos anteriors. Comencem amb a=0, b=1. En cada iteració, calculem c = a+b, mostrem c, i desplacem: a passa a ser b, b passa a ser c. És com una cursa de relleus: el valor es passa d'una variable a una altra. El bucle comença en 3 perquè ja hem imprès els dos primers (0 i 1). Este és l'exercici clàssic d'entrevista tècnica. Si el resols en la primera entrevista, l'entrevistador assenteix amb el cap. Si no el resols, et pregunten "i què tal se't dona treballar en equip?"

---

## ⭐⭐⭐ Exercici 6: AceptaElReto 340 — Juegos de naipes

Resol el problema **340 — Juegos de naipes** en AceptaElReto.

Donada una seqüència de cartes representades per nombres (1 a 10), determina quantes vegades cal ordenar-les perquè queden en ordre ascendent segons un algoritme específic de "col·locar la primera al final".

> **💡 Explicació:** El problema simula un joc de cartes on busques la carta 1, després la 2, etc. Vas passant cartes de la primera a l'última posició (com si passares d'una punta a una altra) fins que trobes la que busques. El `% n` fa que l'índex done la volta quan arriba al final (com una ruleta). És un exercici de lògica amb arrays i bucles. La dificultat està en entendre l'algoritme de cerca circular. No et preocupes si no ix a la primera: els jocs de naipes sempre han sigut complicats, fins i tot per als programadors.

---

## ⭐⭐⭐ Exercici 7: Excepció personalitzada

Crea `EdadInvalidaException` (excepció checked). Llança-la si l'edat és menor que 0 o major que 150. Crea un programa que la prove.

**Eixida:**
```
Error: Edad negativa: -5. ¿Eres viajero en el tiempo?
Error: 200 años? O eres inmortal o me tomas el pelo
Edad válida: 25
```

> **💡 Explicació:** Creem una excepció personalitzada heretant d'`Exception`. Li posem un constructor que cride a `super(mensaje)` perquè el missatge es guarde. Després, en `validarEdad`, llancem l'excepció amb `throw` quan l'edat és invàlida. Com és checked, qui cride al mètode ha de capturar-la amb `try-catch` o declarar-la amb `throws`. És com crear el teu propi tipus d'error: "açò no és un error qualsevol, és EL MEU error".

---

## ⭐⭐⭐ Exercici 8: AceptaElReto 100 — Kaprekar

Resol el problema **100 — Kaprekar** en AceptaElReto.

Donat un nombre de 4 dígits (no tots iguals), ordena'l ascendent i descendentment, resta, i repetix. Semple arribes a 6174 (la constant de Kaprekar). Compta quantes iteracions es necessiten.

> **💡 Explicació:** Kaprekar va descobrir que, per a qualsevol nombre de 4 dígits (no tots iguals), si ordenes els dígits de major a menor, restes l'ordre invers, i repetixes, sempre arribes a 6174 en pocs passos. El programa extrau els dígits, els ordena amb `Arrays.sort()`, construïx el nombre ascendent i descendent, resta, i repetix fins a arribar a 6174. És com un embut matemàtic: tots els camins porten a 6174. Este problema és un clàssic de les olimpíades de programació (ProgramaMe). Si el resols, ja pots posar "expert en Kaprekar" al teu LinkedIn.

---

## 📚 Referències

| Plataforma | Problema | Dificultat |
|---|---|---|
| AceptaElReto | 200 — Aburrimiento en las aulas | Mitjà |
| AceptaElReto | 340 — Juegos de naipes | Mitjà |
| AceptaElReto | 100 — Kaprekar | Difícil |
| AceptaElReto | 151 — ¿Es matriz identidad? | Mitjà |
| CodeWars | Century From Year (8 kyu) | Principiant |
| CodeWars | Cat years, Dog years (7 kyu) | Fàcil |
