---
title: "Butlletí 4 - Intermedi: Algorítmica I"
nav_order: 4
---
Exercicis de dificultat progressiva. Els ⭐ són per a escalfar, ⭐⭐ per a pensar, ⭐⭐⭐ per a competir.

---

## ⭐⭐ Exercici 1: Moure zeros al final

Escriu un mètode `public static void moverCeros(int[] arr)` que moga tots els zeros de l'array al final, mantenint l'ordre relatiu dels no zeros. Fes-ho **in-place**, sense crear un array nou.

Exemple: `[0, 1, 0, 3, 12]` → `[1, 3, 12, 0, 0]`

Pista: usa un índex `posicionNoCero` que avance només quan trobes un número distint de zero. Intercanvia o desplaça segons el valor.

---

## ⭐⭐ Exercici 2: El número que falta

Donat un array de N enters únics que conté números del 0 al N (és a dir, té N+1 números possibles però només N elements), troba el número que falta.

Exemple: `[3, 0, 1]` falta el 2. `[9,6,4,2,3,5,7,0,1]` falta el 8.

Escriu el mètode `public static int numeroFaltante(int[] arr)`.

Pista: suma tots els números de l'array. Després suma tots els números de 0 a N (que és `arr.length`). La diferència és el número que falta.

---

## ⭐⭐ Exercici 3: Primer caràcter no repetit

Escriu un mètode `public static char primerNoRepetido(String s)` que torne el primer caràcter de la cadena que no es repetix en cap altra posició. Si tots es repetixen o la cadena està buida, torna `' '` (espai).

Exemple: `"amor a roma"` — la 'a' es repetix, la 'm' es repetix, la 'o' es repetix, la 'r' es repetix... l'espai es repetix. En este cas, no hi ha caràcters no repetits, torna `' '`.

Exemple: `"programacion"` — la 'p' no es repetix → torna `'p'`.

Pista: pots usar un array de 26 enters (un per lletra) per a comptar freqüències, o un array de 256 per a tot l'ASCII.

---

## ⭐⭐⭐ Exercici 4: Anagrames

Dos strings són anagrames si conten els mateixos caràcters amb la mateixa freqüència. Escriu `public static boolean sonAnagramas(String a, String b)` que torne `true` si ho són.

Exemples:
- `"listen"` i `"silent"` → `true`
- `"java"` i `"avaj"` → `true`
- `"hola"` i `"halo"` → `true`
- `"hola"` i `"adios"` → `false`

Pista: converteix-los a arrays de char, ordena'ls amb `Arrays.sort()`, i compara'ls. O compta freqüències amb un array de 26 enters.

---

## ⭐⭐⭐ Exercici 5: Ordenar 0s, 1s i 2s (Dutch National Flag)

Donat un array que conté només 0, 1 i 2 ordena'l **in-place** en una sola passada (complexitat O(n)). Escriu `public static void ordenarColores(int[] arr)`.

Exemple: `[0, 2, 1, 2, 0, 1, 0]` → `[0, 0, 0, 1, 1, 2, 2]`

Pista: usa tres punters: `izquierdo` (per a 0s), `derecho` (per a 2s) i `actual` (que recorre l'array). Intercanvia segons el valor trobat. Este algorisme es diu "Dutch National Flag" i el va inventar Edsger Dijkstra. Si el resols, tens nivell d'entrevista tècnica a Google.

---

## ⭐⭐⭐ Exercici 6: CodeWars — Disemvowel Trolls

Resol la kata **"Disemvowel Trolls"** (7 kyu) en [CodeWars](https://www.codewars.com/kata/52fba66badcd10859f00097e).

Elimina totes les vocals (a, e, i, o, u) d'un string donat. El input pot tindre majúscules i minúscules. Per exemple, `"This website is for losers LOL!"` → `"Ths wbst s fr lsrs LL!"`.

---

## ⭐⭐⭐ Exercici 7: AceptaElReto — 219 La loteria

Resol el problema **219 — La loteria** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=219).

Donat un array de números de loteria, compta quantes "inversions" hi ha: parells de posicions (i, j) on i < j però el número en i és major que el de j. En altres paraules, compta quants parells estan desordenats.

Pista: pots fer-ho amb dos bucles niats (complexitat O(n²)), però per a valors grans necessitaries merge sort (O(n log n)). Comença per la versió simple.

---

## 📚 Referències

| Plataforma | Problema | Dificultat |
|---|---|---|
| AceptaElReto | 151 — ¿Es matriz identidad? | Mitjà |
| AceptaElReto | 219 — La loteria | Mitjà |
| AceptaElReto | 340 — Jocs de naips | Mitjà |
| CodeWars | Vowel Count (7 kyu) | Fàcil |
| CodeWars | Disemvowel Trolls (7 kyu) | Fàcil |
| CodeWars | You're a square! (7 kyu) | Fàcil |
