---
title: Butlletí U05 — Avançat
description: Exercicis intermedis de recursivitat, divide i venceràs i ordenació per a suar el stack
---

# 📝 Butlletí U05 — Avançat

> La zona intermèdia: ací ja no n'hi ha prou amb copiar el patró, cal pensar. Cada exercici porta la seua **Pista** per quan portes 10 minuts donant-li voltes.

---

## Exercici 1: ⭐ Fibonacci amb el comptador xafarder

Crea un programa `FiboContador` que calcule l'enèssim Fibonacci amb la versió ingènua recursiva PERÒ que a més compte **quantes crides fa en total**.

```java
static long crides;   // variable estàtica que suma 1 en cada crida
static long fibo(int n)
```

Prova'l amb `fibo(30)`. Quantes crides fa? I quantes en faria si només sumares els índexs `fibo(30) + fibo(29) + ... + 1`?

**Pista:** suma 1 a `crides` com a primera línia del mètode, abans de qualsevol cas base.

---

## Exercici 2: ⭐⭐ Què imprimeix? — l'arbre de crides

Sense executar, escriu l'eixida exacta i l'**ordre de les crides** (qui crida a qui):

```java
public class ArbreRare {
    static void pintar(int n) {
        if (n == 0) return;
        System.out.println("baixe " + n);
        pintar(n - 1);
        System.out.println("puge " + n);
    }

    public static void main(String[] args) {
        pintar(3);
    }
}
```

**Pista:** el `System.out.println` de després de la crida recursiva no s'executa fins que eixa crida acaba. Dibuixa la pila amb llapis i paper.

---

## Exercici 3: ⭐⭐ El palíndrom rebel

Amplia el palíndrom perquè **ignore espais, signes i majúscules**:

- `"Anita lava la tina"` → true
- `"Dábale arroz a la zorra el abad"` → true
- `"No soy un palíndromo"` → false

```java
static boolean esPalindromoFrase(String s, int inicio, int fin)
```

**Pista:** en lloc de comparar directament `s.charAt(inicio)`, salta't els caràcters que no siguen lletres avançant `inicio` o retrocedint `fin` dins del mateix mètode. Usa `Character.isLetter()` i `Character.toLowerCase()`.

---

## Exercici 4: ⭐⭐ La potència exprés (divide i venceràs)

Escriu un programa `PotenciaRapida` amb un mètode recursiu `static long potenciaRapida(int base, int exponente)` que calcule `base^exponente` en **O(log n)**:

```
potenciaRapida(b, e):
  si e == 0 → 1
  meitat = potenciaRapida(b, e / 2)
  si e és parell  → meitat * meitat
  si e és senar → meitat * meitat * b
```

Prova'l amb `potenciaRapida(2, 20)` → 1048576. Quantes crides fa comparat amb `potencia(2, 20)` del butlletí inicial?

**Pista:** ull amb l'arredoniment: quan `e` és senar, `e / 2` es queda amb la part entera i per això multipliques per `b` una vegada més.

---

## Exercici 5: ⭐⭐⭐ Quicksort amb mediana de tres

Millora el Quicksort de la unitat: en lloc d'agafar el primer element com a pivot, tria la **mediana de tres** (primer, mitjà i últim) per a evitar el pitjor cas amb arrays quasi ordenats.

```java
static void quicksort(int[] arr, int inicio, int fin)
```

Prova'l amb l'array ja ordenat `{1, 2, 3, 4, 5, 6, 7, 8}`. Quantes particions fa la teua versió amb mediana de tres?

**Pista:** `int medio = (inicio + fin) / 2;` compara `arr[inicio]`, `arr[medio]` i `arr[fin]` i col·loca el del mig en `arr[inicio]` (intercanviant-los) abans de particionar amb la tècnica de la unitat.

---

## Exercici 6: ⭐⭐⭐ Mergesort amb el comptador de comparacions

Modifica el Mergesort de la unitat perquè compte **quantes comparacions** fa la fusió en total, i mostra el nombre al final.

```java
static long comparacions;   // suma 1 en cada comparació de la fusió
```

Prova'l amb `{9, 8, 7, 6, 5, 4, 3, 2, 1}` (el pitjor cas visual). Quantes comparacions? I amb `{1, 2, 3, 4, 5, 6, 7, 8, 9}`?

**Pista:** en la fusió, suma 1 en cada `while` que compara dos elements. En els bucles on una llista ja s'ha acabat, també hi ha comparacions contra el final de l'array: conta-les amb la mateixa variable.

---

## Exercici 7: ⭐⭐⭐ Les torres de Hanói amb comptador

Implementa les Torres de Hanói recursives de la unitat i afig un **comptador de moviments**:

```java
static int moviments;
static void hanoi(int n, char origen, char destino, char auxiliar)
```

Cada vegada que es mova un disc, imprimix `"Mueve disco X de ORIGEN a DESTINO"` i suma 1 al comptador. Al final, imprimix el total. Prova'l amb 3, 4 i 8 discos.

**Pista:** amb `n` discos el mínim de moviments és `2^n - 1`. Si el teu comptador amb 8 discos no dona 255, alguna cosa estàs movent de més.

---

## Exercici 8: ⭐⭐⭐ CodeWars — Sort Numbers

Resol la kata **"Sort Numbers"** (7 kyu) en [CodeWars](https://www.codewars.com/kata/5174a4c0f2769dd8b1000003).

Crea el mètode `public static int[] sortArray(int[] nums)` que torne l'array ordenat de menor a major. Si `nums` és `null` o està buit, torna un array buit.

**Pista:** fes un mètode `int[] copia` (per a no mutar l'original) i ordena-la amb `Arrays.sort()`. O, si tens ganes, implementa el teu propi Mergesort sobre la còpia.

---

## Exercici 9: ⭐⭐⭐ AceptaElReto — 104 Mòbils

Resol el problema **"Mòbils" (104)** de [AceptaElReto](https://aceptaelreto.com/problem/statement.php?id=104).

Un mòbil penja d'una barra amb dos pesos `pi` i `pd` a distàncies `di` i `dd`. Està equilibrat si `pi * di == pd * dd` i a més les dues subbarres (que poden contindre altres mòbils) també ho estan. Un pes `0` significa que dalt penja un altre mòbil, que es descriu a continuació. Torna `SI` si el mòbil està equilibrat i `NO` en cas contrari.

**Pista:** no hi ha cas base amb `n`: els mòbils es lliguen recursivament. Llig `pi di pd dd`; si `pi == 0`, cal llegir (i comprovar) un submòbil complet abans de continuar; si `pd == 0`, un altre. Recorda que **ambdós** submòbils han d'estar equilibrats, no només la barra.
