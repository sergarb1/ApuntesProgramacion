---
title: Butlletí U03 — Avançat
description: Exercicis de dificultat progressiva per a exprimir la unitat
---

# 📝 Butlletí U03 — Avançat

> Dificultat progressiva. ⭐ per a escalfar, ⭐⭐ per a pensar, ⭐⭐⭐ per a concursar. Cada exercici inclou una pista (resisteix-te a mirar-la).

---

## ⭐ Exercici 1: La calculadora de notes

Escriu un programa que convertisca una nota numèrica (`double nota`) en la seua qualificació textual usant `if`/`else if`:

- `>= 9` → "Excel·lent"
- `>= 7` → "Notable"
- `>= 5` → "Aprovat"
- `>= 0` → "Suspés"
- Qualsevol altre valor (negatiu o major que 10) → "Nota invàlida"

Usa `double nota = 8.7;` i mostra el resultat. Fixa't en l'ordre: el cas invàlid s'ha de comprovar abans que els rangs.

**Pista:** un `if` inicial per al cas invàlid (`nota < 0 || nota > 10`) i després la cascada de rangs de dalt a baix.

---

## ⭐ Exercici 2: El menú que no es rendix

Escriu un programa que mostre un menú de dues opcions (1. Jugar, 2. Eixir) amb `do-while` i repetisca la pregunta fins que l'usuari escriga 1 o 2. Usa `Scanner`. Al final mostra "Has triat l'opció X.".

**Pista:** `do { ... } while (opcio != 1 && opcio != 2);`. El `do-while` garantix que el menú es mostre almenys una vegada.

---

## ⭐⭐ Exercici 3: Què imprimeix? — la piràmide

Sense executar, escriu l'eixida exacta:

```java
public class Piramide {
    public static void main(String[] args) {
        for (int fila = 1; fila <= 4; fila++) {
            for (int col = 1; col <= fila; col++) {
                System.out.print("*");
            }
            System.out.println();
        }
    }
}
```

**Pista:** el bucle interior depén de `fila`: la fila 1 imprimix 1 asterisc, la fila 2 en imprimix 2... Quants asteriscs en total?

---

## ⭐⭐ Exercici 4: L'escala de nombres

Escriu un programa que imprimisca esta escala de nombres (bucles anidats):

```
1
1 2
1 2 3
1 2 3 4
```

**Pista:** bucle exterior de l'1 al 4 (les files) i bucle interior que imprimix de l'1 al número de fila, amb `print` per a no saltar de línia i un `println()` buit al final de cada fila.

---

## ⭐⭐⭐ Exercici 5: Què imprimeix? — break, continue i l'etiqueta

Sense executar, escriu l'eixida exacta:

```java
public class Escapista {
    public static void main(String[] args) {
        exterior:
        for (int i = 1; i <= 4; i++) {
            for (int j = 1; j <= 3; j++) {
                if (j == 2 && i >= 3) {
                    continue exterior;
                }
                if (i * j >= 8) {
                    break exterior;
                }
                System.out.print(i + "" + j + " ");
            }
        }
    }
}
```

**Pista:** fes una taula de parells `(i, j)`. El `continue exterior` salta a la següent `i`; el `break exterior` apaga tots els bucles. Comprova parell a parell fins on arriba.

---

## ⭐⭐ Exercici 6: Caçador de primers

Escriu un programa que imprimisca tots els nombres primers de l'1 al 50, cada un en la seua línia. Reutilitza la lògica del detectiu de divisors (`for` + `break`) dins d'un altre `for`.

**Pista:** anida dos bucles: un que recórrega de l'1 al 50 i un altre interior que busque divisors. Usa un booleà `esPrimer` que es pose a `false` amb `break` si apareix un divisor.

---

## ⭐⭐ Exercici 7: La suma sentinella

Escriu un programa que sume nombres enters introduïts per l'usuari fins que escriga `0`. Mostra la suma final. Usa `while` i un sentinella.

**Pista:** `while (numero != 0) { suma += numero; numero = sc.nextInt(); }`. El 0 no es suma: és el senyal de parada.

---

## ⭐⭐⭐ Exercici 8: CodeWars — Categorize New Member

Resol la kata **"Categorize New Member"** (7 kyu) en [CodeWars](https://www.codewars.com/kata/5502c9e7b3216ec63c0001aa).

Completa el mètode `public static String[] openOrSenior(int[][] data)` que rep parells `{edat, handicap}` i retorna `"Senior"` si el membre té almenys 55 anys I un handicap major que 7; si no, `"Open"`.

**Pista:** recorre l'array amb un `for` i decidix cada cas amb una condició combinada (`&&`): `data[i][0] >= 55 && data[i][1] > 7`.

---

## ⭐⭐⭐ Exercici 9: AceptaElReto — 156 Ascensor

Resol el problema **156 — Ascensor** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=156).

Un ascensor partix de la planta 0. Donat un nombre de visites i les plantes de cada visita, calcula la distància total recorreguda. El valor `0` indica el final de l'entrada (no es processa). Usa `Math.abs()` per a les distàncies.

**Exemple:**

```
5
5 1 10 4 2
0
```

Distància: |0-5| + |5-1| + |1-10| + |10-4| + |4-2| = 5 + 4 + 9 + 6 + 2 = **26**.

**Pista:** un `while` que llegixca el nombre de visites i trenque amb `break` si és 0; dins, un `for` que acumule `Math.abs(pis - pisActual)` i actualitze `pisActual`.

---

## 📚 Referències

| Plataforma | Problema | Dificultat |
|---|---|---|
| AceptaElReto | 156 — Ascensor | Fàcil |
| AceptaElReto | 149 — San Fermines | Fàcil |
| AceptaElReto | 340 — Següent amb mateix nombre de xifres | Mitjà |
| CodeWars | Even or Odd (8 kyu) | Principiant |
| CodeWars | Categorize New Member (7 kyu) | Aficionat |
| CodeWars | Return Negative (8 kyu) | Principiant |
