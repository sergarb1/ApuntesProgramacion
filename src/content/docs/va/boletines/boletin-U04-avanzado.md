---
title: Butlletí U04 — Avançat
description: Exercicis de dificultat progressiva per a exprimir la unitat
---

# 📝 Butlletí U04 — Avançat

> Dificultat progressiva. ⭐ per a calfar, ⭐⭐ per a pensar, ⭐⭐⭐ per a concursar. Cada exercici inclou una pista (resistix a mirar-la).

---

## ⭐ Exercici 1: Què imprimeix? — la binària amb historial

Sense executar, escriu l'eixida exacta d'este programa:

```java
public class BinariaHistorial {
    public static void main(String[] args) {
        int[] dades = {2, 4, 6, 8, 10, 12, 14, 16};
        int objectiu = 10;
        int esquerra = 0;
        int dreta = dades.length - 1;

        while (esquerra <= dreta) {
            int mig = esquerra + (dreta - esquerra) / 2;
            System.out.println("Prove l'índex " + mig);

            if (dades[mig] == objectiu) {
                System.out.println("Trobat en " + mig);
                break;
            } else if (dades[mig] < objectiu) {
                esquerra = mig + 1;
            } else {
                dreta = mig - 1;
            }
        }
    }
}
```

**Pista:** escriu en una taula cada volta amb els seus `esquerra`, `dreta`, `mig` i què decidix. Només són 3 o 4 línies de traça.

---

## ⭐ Exercici 2: El buscador binari amb historial

Escriu un mètode `public static int cercaBinaria(int[] dades, int objectiu)` com el de la teoria, però que **cada vegada que prove un índex, el mostre per pantalla**: `Provant l'índex X`. Al final retorna l'índex o `-1`.

Prova amb `int[] dades = {1, 3, 5, 7, 9, 11, 13, 15, 17, 19}` i `objectiu = 7`.

**Pista:** el `System.out.println` va dins del `while`, just després de calcular `mig` i abans de comparar.

---

## ⭐⭐ Exercici 3: La bombolla amb recompte (i flag)

Escriu un programa anomenat `BombollaRecompte` que òrdene `int[] dades = {9, 3, 7, 1, 5}` amb bombolla i **compte els intercanvis**, igual que en l'inicial. Però a més, afegix el flag `boolean hiHaIntercanvi` amb el seu `break` per a no fer passades inútils.

Mostra al final l'array ordenat i `Intercanvis: X`.

**Pista:** el flag es reinicia a `false` al principi de cada passada i es posa a `true` dins del `if`. Després de la passada: `if (!hiHaIntercanvi) break;`.

---

## ⭐⭐ Exercici 4: La inserció descendent

Modifica l'ordenació per inserció perquè òrdene **de major a menor**. Escriu un mètode `public static void ordenarDescendent(int[] dades)`.

Prova amb `int[] notes = {6, 9, 3, 8, 5}` i mostra el resultat.

**Pista:** només canvia un signe: en la condició del `while`, els majors han de lliscar cap a la dreta. Pensa quin és ara l'"ordre correcte".

---

## ⭐⭐ Exercici 5: L'analista de complexitat

Digues la complexitat Big O de cada mètode i justifica breument:

```java
public class Analista {

    public static int metodeA(int[] dades) {
        int total = 0;
        for (int num : dades) {
            total += num;
        }
        return total;
    }

    public static int metodeB(int[] dades) {
        int parells = 0;
        for (int i = 0; i < dades.length; i++) {
            for (int j = i + 1; j < dades.length; j++) {
                if (dades[i] == dades[j]) {
                    parells++;
                }
            }
        }
        return parells;
    }

    public static int metodeC(int[] dades, int objectiu) {
        int esquerra = 0;
        int dreta = dades.length - 1;
        while (esquerra <= dreta) {
            int mig = esquerra + (dreta - esquerra) / 2;
            if (dades[mig] == objectiu) return mig;
            if (dades[mig] < objectiu) esquerra = mig + 1;
            else dreta = mig - 1;
        }
        return -1;
    }
}
```

**Pista:** compte bucles: un → O(n), dos anidats → O(n²). El que partix el segment per la mitat en cada volta és O(log n). El `j = i + 1` no el salva de ser O(n²): seguix sent quasi n × n.

---

## ⭐⭐ Exercici 6: El caçador de parelles

Escriu un mètode `public static boolean existeixParella(int[] dades, int sumaObjectiu)` que retorne `true` si existixen **dos elements distints** de l'array la suma dels quals siga `sumaObjectiu`.

Prova amb `int[] preus = {10, 3, 7, 5, 12}`:

- `existeixParella(preus, 17)` → `true` (10 + 7)
- `existeixParella(preus, 25)` → `false`

**Pista:** dos bucles anidats amb `j = i + 1` (per a no provar un element amb si mateix). Dins: `if (dades[i] + dades[j] == sumaObjectiu) return true;`. Al final, `return false;`.

---

## ⭐⭐ Exercici 7: El detectiu d'inversions

Una **inversió** és una parella de posicions `(i, j)` amb `i < j` on `dades[i] > dades[j]` (estan desordenades). Escriu un mètode `public static int contarInversions(int[] dades)` que les compte.

Prova amb `int[] dades = {2, 4, 1, 3}` → hi ha 3 inversions: (2,1), (4,1), (4,3).

**Pista:** el patró de doble bucle amb `j = i + 1` una altra vegada, però ara el `if` compara `dades[i] > dades[j]` i suma 1 al comptador.

---

## ⭐⭐⭐ Exercici 8: CodeWars — Ones and Zeros

Resol la kata **"Ones and Zeros"** (7 kyu) en [CodeWars](https://www.codewars.com/kata/578553c3a1b8d5c40300037c).

Et donen un array d'enters (només 0 i 1) que representa un nombre en binari. Retorna el seu valor decimal.

**Exemple:** `[1, 0, 1, 1]` → `11` (1·8 + 0·4 + 1·2 + 1·1).

**Pista:** recorre l'array d'esquerra a dreta acumulant `valor = valor * 2 + digit`. Eixe és l'algoritme per a convertir de binari a decimal sense usar `Math.pow`.

---

## ⭐⭐⭐ Exercici 9: AceptaElReto — 100 Constant de Kaprekar

Resol el problema **100 — Constant de Kaprekar** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=100).

L'algoritme de Kaprekar: donat un nombre de 4 xifres, ordena els seus dígits de major a menor i de menor a major, resta tots dos, i repetix amb el resultat. Al final sempre s'arriba a **6174** (o al propi 6174) i, si el nombre té totes les xifres iguals (com 1111), la diferència dóna 0.

L'entrada du diversos nombres (poden tindre menys de 4 xifres: cal completar amb zeros a l'esquerra). Per a cada un, mostra **quantes iteracions** calen per a arribar a 6174. El 6174 necessita 0 iteracions. **Compte amb els repdigits** (1111, 5555...): la primera resta dóna 0 i el bucle mai no arribaria a 6174; el problema oficial demana **8** per a ells. L'0 d'entrada acaba el programa.

**Pista:** per a ordenar els dígits, extrau-los en un `int[]` de 4 posicions amb `% 10` i `/ 10`, ordena'l amb bombolla (¡reutilitza la U04!), i reconstrueix el nombre major (dígits en ordre descendent) i el menor (ascendent). Compta les iteracions amb un comptador.

---

## 📚 Referències

| Plataforma | Problema | Dificultat |
|---|---|---|
| AceptaElReto | 100 — Constant de Kaprekar | Fàcil |
| AceptaElReto | 185 — Potitos | Fàcil |
| CodeWars | Find the smallest integer in the array (8 kyu) | Principiant |
| CodeWars | Ones and Zeros (7 kyu) | Aficionat |
| CodeWars | You only need one (8 kyu) | Principiant |
