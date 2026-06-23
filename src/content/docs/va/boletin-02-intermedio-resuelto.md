---
title: "Butlletí 2 - Intermedi Resolt: Variables i Operadors"
nav_order: 6
---
De menys a més. De ⭐ a ⭐⭐⭐. De "açò és pa sucat amb oli" a "açò ja no és un entrepà".

---

## ⭐ Exercici 1: Parell o senar?

Demana un número a l'usuari i determina si és parell o senar usant l'operador `%`.

> **💡 Explicació:** `num % 2` et dona el residu de dividir el número entre 2. Si és 0, és parell. Si és 1, és senar. No hi ha misteri. És l'operació més usada en programació després de sumar. El `%` ix a tot arreu: per a saber si alguna cosa és parell, per a cicles, per a jocs, per a rellotges. Sense ell, no hi hauria videojocs (bé, sí, però serien més difícils de programar).

---

## ⭐ Exercici 2: Constant del mal

Declara `final double PRECIO_BASE = 100;` i `final double IVA = 0.21`. Calcula el preu final. Després intenta modificar `IVA` després. Quin error dona?

> **💡 Explicació:** En descomentar `IVA = 0.10`, el compilador diu: "No puc assignar un valor a una variable final". `final` és com un contracte firmat: no pots canviar d'opinió. És útil per a valors que no han de canviar mai: l'IVA, el nom de la teua app, el nombre d'intents màxims. Si algú intenta canviar-los, el compilador es planta. Millor que discutir amb un programador que canvia l'IVA a mitat de facturació.

---

## ⭐⭐ Exercici 3: Dau trucat

Genera 10 números aleatoris entre 1 i 6. Compta quants 6 han eixit i mostra el resultat.

> **💡 Explicació:** `Math.random()` torna un número entre 0.0 i 0.999999... Multipliques per 6, obtens entre 0.0 i 5.999999. El `(int)` trunca els decimals i et dona 0-5. Sumes 1 i obtens 1-6. El bucle es repeteix 10 vegades. Cada volta que ix un 6, increments el comptador. És com si llançares un dau físic 10 vegades i anotares quants 6 traus. La probabilitat és baixa (1/6 per tirada), així que el normal és que isquen entre 1 i 2 sisos. Si etixen 7, el dau està trucat (o tens una sort increïble).

---

## ⭐⭐ Exercici 4: Any de traspàs

Demana un any a l'usuari. Determina si és de traspàs: divisible entre 4 I (no entre 100 O sí entre 400).

> **💡 Explicació:** La regla de l'any de traspàs és: divisible entre 4, però si és divisible entre 100 NO és de traspàs, a menys que també siga divisible entre 400. 1900 no va ser de traspàs (divisible entre 100 però no entre 400). 2000 sí (divisible entre 400). 2024 sí (divisible entre 4 però no entre 100). Els operadors lògics `&&` (AND) i `||` (OR) combinats amb `%` permeten expressar esta regla en una sola línia. És com la lija fina de la programació: condicions precises per a resultats exactes. Els parèntesis són importants: sense ells, la precedència podria donar un resultat incorrecte.

---

## ⭐⭐ Exercici 5: Nom al revés

Demana a l'usuari el seu nom. Mostra: longitud, versió en majúscules, primera lletra i última lletra.

> **💡 Explicació:** `length()` torna quants caràcters té el String. `toUpperCase()` el converteix a majúscules. `charAt(0)` torna el primer caràcter (els Strings comencen en 0, com els arrays). `charAt(nombre.length() - 1)` torna l'últim. Fixat que els mètodes de String es criden SOBRE l'objecte, no són estàtics. L'objecte és `nombre`, i li preguntes: "oi, tu, quant mesura?". `String` és una classe amb molts mètodes útils. Aprén a usar-los i t'estalviaràs reinventar la roda cada dos per tres.

---

## ⭐⭐⭐ Exercici 6: AceptaElReto 152 — Números de parells

Resol el problema **152 — Números de parells** (també conegut com "Va de modes...") en AceptaElReto.

Donada una llista de números, determina si la quantitat de parells és major que la de senars.

> **💡 Explicació:** El problema va llegint casos fins a trobar un 0 (que marca el final). Cada cas comença amb N (quants números venen). Després llegim N números. Per cada un, mirem si és parell o senar amb `% 2` i comptem. Al final comparem els comptadors. És una versió ampliada de l'exercici 1, però amb lectura de dades i múltiples casos. La gràcia està en manejar correctament la lectura quan no saps quants casos hi ha. `while (sc.hasNextInt())` i `break` quan veus un 0.

---

## ⭐⭐⭐ Exercici 7: L'enigma del ++

Sense executar, determina el resultat de:

```java
int a = 2;
int b = a++ * 3 + --a;
System.out.println("a = " + a + ", b = " + b);
```

**Solució:**
```
a = 2, b = 7
```

**Pas a pas:**
1. `a = 2`
2. `a++` → POST: usa a (2), després a = 3. L'expressió `a++` val **2**.
3. `--a` → PRE: a val 3, decrementa a **2**, després usa a (2). Val **2**.
4. `b = 2 * 3 + 2` = 6 + 2 = 7
5. `a` va quedar en 2 (va pujar a 3 amb `a++`, va baixar a 2 amb `--a`)

> **💡 Explicació:** `a++` (post-increment) primer USA el valor i després incrementa. `--a` (pre-decrement) primer decrementa i després USA. Per això el valor final de `a` és 2 (va pujar i baixar com un io-io). I `b` és 7. Estos enigmes són el terror dels exàmens i l'alegria dels professors malvats. El meu consell: en la vida real, no mescles `++` i `--` en expressions complicades. Usa'ls en línies separades. El teu jo del futur t'ho agrairà.

---

## ⭐⭐⭐ Exercici 8: AceptaElReto 140 — Suma de dígits

Resol el problema **140 — Suma de dígits** en AceptaElReto.

Donat un número, suma els seus dígits. Després suma els dígits del resultat, i així fins que quede un sol dígit. Mostra el procés.

> **💡 Explicació:** Per a extraure els dígits d'un número, usem `n % 10` (obtenim l'últim dígit) i `n / 10` (llevem l'últim dígit). Repetim fins que n siga 0. Sumem tots els dígits. Si la suma té més d'un dígit (>= 10), repetim el procés. És com quan doblegues un paper una vegada i una altra fins que no pots més: el número es va reduint fins a un sol dígit. Exemple: 123 → 1+2+3 = 6. 987 → 9+8+7 = 24 → 2+4 = 6. És l'"arrel digital" d'un número. Molt usat en numerologia i en exàmens de programació.

---

## 📚 Referències

| Plataforma | Problema | Dificultat |
|---|---|---|
| AceptaElReto | 149 — San Fermines | Fàcil |
| AceptaElReto | 152 — Números de parells | Fàcil |
| AceptaElReto | 140 — Suma de dígits | Mitjà |
| CodeWars | Even or Odd (8 kyu) | Principiant |
| CodeWars | Opposite number (8 kyu) | Principiant |
