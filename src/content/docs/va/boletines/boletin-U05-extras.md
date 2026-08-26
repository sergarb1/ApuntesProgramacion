---
title: Butlletí U05 — Extres
description: Katas de CodeWars i problemes d'AceptaElReto sobre recursivitat i ordenació per als valents
---

# 📝 Butlletí U05 — Extres

> T'has quedat amb ganes de més? Esta secció és per als que volen arribar a l'examen amb el stack templat: 4 katas de CodeWars i 2 problemes d'AceptaElReto. Cada pista està amagada al seu desplegable per a no espatlar el misteri.

---

## 🥋 CodeWars

> Regista't a [CodeWars](https://www.codewars.com), tria Java i resol les katas per ordre. Comencen assequibles i pugen de nivell.

---

### Kata 1: Factorial (7 kyu)

En [CodeWars](https://www.codewars.com/kata/54ff0d1f355cfd20e60001fc).

En matemàtiques, el factorial d'un enter no negatiu `n`, denotat `n!`, és el producte de tots els enters positius menors o iguals que `n`:

```
n! = 1 * 2 * 3 * ... * n
```

Amb la convenció que `0! = 1`. Implementa `public static long factorial(int n)` amb recursivitat.

<details>
<summary>💡 Pista</summary>

Cas base `n <= 1` → 1; cas recursiu `n * factorial(n - 1)`.

</details>

---

### Kata 2: Descending Order (7 kyu)

En [CodeWars](https://www.codewars.com/kata/5467e4d82edf8bbf40000155).

Agafa un nombre no negatiu i torna el **nombre major possible** reordenant els seus dígits de major a menor. Exemples:

- `42145` → `54421`
- `145263` → `654321`
- `123456789` → `987654321`

<details>
<summary>💡 Pista</summary>

Convertix el nombre a `String`, passa a un array de `char` o `int`, ordena'l descendent i reconstruïx el nombre amb `Long.parseLong`. Este exercici et demana ordenar, no recursivitat: usa el que has aprés.

</details>

---

### Kata 3: Are the numbers in order? (7 kyu)

En [CodeWars](https://www.codewars.com/kata/56b7f2f3f18876033f000307).

Escriu `public static boolean isAscOrder(int[] arr)` que torne `true` si els nombres estan **estrictament en ordre ascendent** (cada un major que l'anterior) i `false` en cas contrari.

- `[1, 2, 3, 4]` → true
- `[1, 4, 13, 97, 508, 717]` → true
- `[1, 3, 2]` → false
- `[9, 5, 5]` → false (no és estrictament ascendent)

<details>
<summary>💡 Pista</summary>

Un sol `for` amb `i` de 1 fins al final comparant `arr[i - 1] >= arr[i]` → si alguna vegada es complix, torna `false` al moment.

</details>

---

### Kata 4: Tribonacci Sequence (6 kyu)

En [CodeWars](https://www.codewars.com/kata/556deca17c58da83c00002db).

Igual que Fibonacci però amb tres nombres d'arrancada: cada terme és la suma dels tres anteriors. El firmant sempre dona una llavor `double[] signature` de 3 elements i un nombre `n`. Torna els primers `n` termes:

- `{1, 1, 1}, 10` → `{1, 1, 1, 3, 5, 9, 17, 31, 57, 105}`
- `{0, 0, 1}, 10` → `{0, 0, 1, 1, 2, 4, 7, 13, 24, 44}`
- `{1, 1, 1}, 1` → `{1}` (recorda: si `n < 3`, només tornes els que demane)

<details>
<summary>💡 Pista</summary>

Si `n < 3`, torna un subarray amb els primers `n` de la llavor. Si no, crea un `double[n]`, copia la llavor al principi i ompli de `i = 3` endavant amb `arr[i] = arr[i-1] + arr[i-2] + arr[i-3]`. Pots fer-ho iteratiu; el "truc del tribonacci" no necessita recursivitat.

</details>

---

## 🏆 AceptaElReto

> Dos problemes del concurs [ProgramaMe](https://aceptaelreto.com). El primer és un clàssic absolut de la recursivitat; el segon, un sudorífer d'ordenació.

---

### Repre 1: Mòbils (104)

En [AceptaElReto](https://aceptaelreto.com/problem/statement.php?id=104).

Un mòbil penjant es descriu amb quatre enters: `pi di pd dd` (pes i distància esquerres, pes i distància dretes). La barra està equilibrada si `pi * di == pd * dd`. Un pes `0` indica que dalt penja un altre mòbil, que es descriu a continuació en l'entrada. Has de dir `SI` si el mòbil complet està equilibrat (barra I submòbils) i `NO` en cas contrari. L'entrada acaba amb `0 0 0 0`.

<details>
<summary>💡 Pista</summary>

No hi ha comptador de casos: els mòbils es lliguen **recursivament**. Crea un mètode que lligca una barra i torne el pes total del mòbil si està equilibrat, o `-1` si no. Quan un pes és 0, crida al mètode per a llegir el submòbil. Un submòbil desequilibrat (torna `-1`) contamina tota la cadena cap amunt.

</details>

---

### Repre 2: Tortetes (143)

En [AceptaElReto](https://aceptaelreto.com/problem/statement.php?id=143).

Tens una pila de tortetes amb mides diferents. Amb una espàtula pots donar la volta a les `k` tortetes superiors (invertir l'ordre de les primeres `k`). Troba el mínim nombre de voltes per a ordenar-les de major (dalt) a menor (baix). L'entrada acaba amb `0`. Per a cada cas, imprimix quantes voltes necessites.

<details>
<summary>💡 Pista</summary>

Voraç (greedy): busca la torteta més gran que no estiga al seu lloc. Si no està dalt, dona-li la volta fins a la seua posició (invertir `k` on `k` és la seua posició) per a pujar-la. Després invertix tota la part sense ordenar per a baixar-la al seu lloc. Cada torteta queda fixada per sempre: eixe és el famós "flip-sort". Amb 2 voltes per torteta mal col·locada et val.

</details>
