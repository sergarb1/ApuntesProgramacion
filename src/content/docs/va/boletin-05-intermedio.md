---
title: "Boletí 5 - Intermedi: Algorísmica II: Tècniques Avançades"
nav_order: 3
---
Exercicis de dificultat progressiva. Els ⭐ són per a escalfar, ⭐⭐ per a pensar, ⭐⭐⭐ per a concursar. Si la recursivitat et sembla un bucle sense fi, espera a fer aquests exercicis. Bé, en realitat SÍ que és un bucle sense fi, però controlat.

---

## ⭐ Exercici 1: MCD per Euclides recursiu

Implementa l'algoritme d'Euclides per a calcular el màxim comú divisor de dos nombres enters **de forma recursiva**. Sense trampes: res de bucles, res de `Math.min()` anant cap enrere. Hi ha d'haver una crida a si mateix.

L'algoritme d'Euclides diu:
- Si `b == 0`, el MCD és `a`.
- Si no, el MCD de `a` i `b` és el MCD de `b` i `a % b`.

```java
public static int mcd(int a, int b) {
    // el teu codi ací
}
```

Exemple: `mcd(48, 18)` → 6. `mcd(100, 25)` → 25.

---

## ⭐ Exercici 2: Comptar ocurrències recursiu

Donat un array d'enters i un nombre objectiu, compta quantes vegades apareix eixe nombre en l'array **usant recursivitat**. Sense bucles, sense streams, sense trampes.

```java
public static int contarOcurrencies(int[] arr, int objectiu, int index) {
    // el teu codi ací
}
```

Exemple: `contarOcurrencies(new int[]{1, 2, 3, 2, 4, 2, 5}, 2, 0)` → 3.

---

## ⭐⭐ Exercici 3: Invertir nombre recursiu

Donat un nombre enter positiu, torna el seu invers. Es a dir, 1234 es converteix en 4321. **Sense convertir a String.** Tot amb operacions matemàtiques i recursivitat.

```java
public static int invertirNombre(int n) {
    // el teu codi ací
}
```

Exemple: `invertirNombre(1234)` → 4321. `invertirNombre(700)` → 7.

---

## ⭐⭐ Exercici 4: Combinacions d'un array (backtracking)

Donat un array d'enters i un nombre `k`, genera **totes les combinacions possibles** de grandària `k` dels elements de l'array. L'ordre dels elements dins de cada combinació no importa, i no hi ha d'haver combinacions repetides.

```java
public static List<List<Integer>> combinacions(int[] arr, int k) {
    // el teu codi ací
}
```

Exemple: `combinacions(new int[]{1, 2, 3}, 2)` torna `[[1,2], [1,3], [2,3]]`.

---

## ⭐⭐⭐ Exercici 5: N-Reines (backtracking)

El clàssic dels clàssics. Col·loca N reines en un tauler de N×N de manera que cap s'amenace entre si. Dos reines s'amenacen si estan en la mateixa fila, columna o diagonal.

```java
public static boolean resoldre(int[][] tauler, int col) {
    // el teu codi ací
}
```

---

## ⭐⭐⭐ Exercici 6: CodeWars — Tribonacci Sequence

Resol la kata **"Tribonacci Sequence"** (6 kyu) en CodeWars.

El Fibonacci s'ha quedat obsolet. Ara toca el Tribonacci: igual però sumant els tres últims en lloc de dos. Reps un array `signature` de 3 nombres i un `n` que indica quants elements ha de tindre la seqüència resultant.

```java
public double[] tribonacci(double[] s, int n) {
    // el teu codi ací
}
```

---

## ⭐⭐⭐ Exercici 7: AceptaElReto — 140 Suma de dígits

Resol el problema **140 — Suma de dígits** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=140).

Donat un nombre, suma els seus dígits. Si el resultat té més d'un dígit, torna a sumar. Repeteix fins a obtindre un sol dígit. Es la "rel digital" o "suma de dígits recursiva".

---

## 📚 Referències

| Plataforma | Problema | Dificultat |
|---|---|---|
| CodeWars | Tribonacci Sequence | 6 kyu |
| CodeWars | Sum of Digits / Digital Root | 6 kyu |
| AceptaElReto | 140 — Suma de dígits | Fàcil |
| AceptaElReto | 162 — Suma de dígits | Fàcil |
