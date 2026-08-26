---
title: Butlletí U03 — Extres
description: CodeWars i AceptaElReto per a anar més enllà de la unitat
---

# 📝 Butlletí U03 — Extres

> Exercicis de CodeWars i AceptaElReto amb pistes. La solució està oculta: resisteix-te fins a esgotar la teua pista.

---

## CodeWars

### 1. Return Negative

Et donen un nombre i has de retornar-lo negatiu. Però compte: si el nombre ja és negatiu, deixa'l com està.

**Exemples:** `1` → `-1`, `-14` → `-14`, `34` → `-34`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/55685cd7ad70877c23000102)
- Dificultat: 8 kyu

**Pista:** un ternari decidix: si és major que 0, canvia el signe (`-num`); si no, retorna'l tal qual.

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static int makeNegative(int num) {
        return num > 0 ? -num : num;
    }
}
```

Un ternari amb la condició `num > 0`. Si és positiu, l'operador unari `-` el fa negatiu; si ja era negatiu (o zero), es queda igual. Decidir amb una línia: pura U03.

</details>

---

### 2. Sum of positive

Et donen un array d'enters. Retorna la suma de tots els **positius**.

**Exemple:** `[1, -4, 7, 12]` → `1 + 7 + 12 = 20`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/5715eaedb436cf5606000381)
- Dificultat: 8 kyu

**Pista:** recorre l'array amb un `for` i, amb un `if`, suma només els nombres majors que 0.

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static int sum(int[] arr) {
        int suma = 0;
        for (int numero : arr) {
            if (numero > 0) {
                suma += numero;
            }
        }
        return suma;
    }
}
```

El bucle recorre cada nombre i l'`if` filtra els positius abans de sumar-los. El `for...each` és una drecera que ja coneixes; l'`if` dins del bucle és l'essència de les estructures de control.

</details>

---

### 3. Grasshopper — Summation

Escriu un programa que calcule la suma de tots els nombres des d'1 fins a `n`.

**Exemples:** `summation(2)` → `3` (1 + 2), `summation(8)` → `36` (1 + 2 + ... + 8).

- [Enunciat en CodeWars](https://www.codewars.com/kata/55d24f55d7dd296eb9000030)
- Dificultat: 8 kyu

**Pista:** un `for` que acumule de l'1 al `n` en una variable `suma`. (O la fórmula matemàtica `n * (n + 1) / 2`, si et va la drecera.)

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static int summation(int n) {
        int suma = 0;
        for (int i = 1; i <= n; i++) {
            suma += i;
        }
        return suma;
    }
}
```

Amb bucles: `suma += i` acumula cada volta. Amb la fórmula directa: `return n * (n + 1) / 2;`, que dona el mateix resultat sense ni un bucle. Les dues són vàlides; el bucle és el que practiquem ací.

</details>

---

### 4. Sum without highest and lowest number

Suma tots els nombres d'un array **excepte** el més alt i el més baix. Si l'array està buit, és `null` o té un sol element, retorna `0`.

**Exemple:** `[6, 2, 1, 8, 10]` → `2 + 6 + 8 = 16`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/576b93db112df076d900060c)
- Dificultat: 7 kyu

**Pista:** recorre l'array una vegada per a acumular la suma i, en el mateix bucle, rastreja el mínim i el màxim amb dos `if`. Al final: `suma - minimo - maximo`.

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static int sum(int[] numeros) {
        if (numeros == null || numeros.length <= 1) {
            return 0;
        }

        int suma = 0;
        int minimo = Integer.MAX_VALUE;
        int maximo = Integer.MIN_VALUE;

        for (int numero : numeros) {
            suma += numero;
            if (numero < minimo) minimo = numero;
            if (numero > maximo) maximo = numero;
        }

        return suma - minimo - maximo;
    }
}
```

El truc: `Integer.MAX_VALUE` i `Integer.MIN_VALUE` com a "infinits" inicials, perquè el primer nombre de l'array sempre els supere. Un sol bucle fa tres coses (sumar, buscar mínim, buscar màxim) i la resta final lleva els extrems. Tres decisions en un sol recorregut: pura múscul d'esta unitat.

</details>

---

## AceptaElReto

### 5. 149 — San Fermines

Als sanfermines, els moços volen saber la velocitat màxima dels braus per a saber si eixir corrent o volar. Donat un nombre de braus i la velocitat de cada un, digues quina és la màxima.

**Entrada:** diversos casos de prova fins al final de l'entrada (EOF). Cada cas: un nombre N i a continuació les N velocitats.

**Exemple:**

```
3
10 20 15
5
50 12 90 7 25
```

**Eixida:**

```
20
90
```

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=149)
- Dificultat: Fàcil

**Pista:** un `while (sc.hasNextInt())` llig fins al final de l'entrada. Dins, un `for` recorre les velocitats i un `if` va guardant el màxim.

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class SanFermines {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (sc.hasNextInt()) {
            int n = sc.nextInt();
            int max = 0;

            for (int i = 0; i < n; i++) {
                int velocitat = sc.nextInt();
                if (velocitat > max) {
                    max = velocitat;
                }
            }

            System.out.println(max);
        }
        sc.close();
    }
}
```

El `while (sc.hasNextInt())` és el patró "llegir fins al final". L'`if` dins del `for` compara cada velocitat amb el màxim acumulat. En acabar el bucle, `max` és la resposta. Bucles i decisions treballant en equip.

</details>

---

### 6. 340 — Següent amb mateix nombre de xifres

Donat un nombre natural N, troba el següent nombre que tinga el **mateix nombre de xifres** que N. Si no existix (perquè N és l'últim amb eixe nombre de xifres), mostra `MENSAJE`.

**Entrada:** diversos casos separats per espais, que acaba amb un `0`.

**Exemples:**

```
1 → 2
9 → MENSAJE
99 → MENSAJE
100 → 101
```

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=340)
- Dificultat: Mitjà

**Pista:** compta les xifres de N amb un `while (copia > 0) { cifras++; copia /= 10; }`. Si N és `9`, `99`, `999`... (tots nous), no hi ha següent. En la resta de casos, la resposta és `N + 1`.

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class SeguentCifres {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();

        while (n != 0) {
            int copia = n;
            int cifres = 0;

            while (copia > 0) {
                cifres++;
                copia /= 10;
            }

            int ultimAmbEixeTamany = (int) Math.pow(10, cifres) - 1;

            if (n == ultimAmbEixeTamany) {
                System.out.println("MENSAJE");
            } else {
                System.out.println(n + 1);
            }

            n = sc.nextInt();
        }
        sc.close();
    }
}
```

Dos bucles: el interior compta les xifres dividint entre 10 (`while (copia > 0)`), i l'exterior llig casos fins al 0 sentinella. Si N és 9, 99 o 999 (el `10^cifres - 1`), no existix següent i toca "MENSAJE". En qualsevol altre cas, sumar 1 no canvia el nombre de xifres... llevat dels de tots nous, que ja caçàrem abans.

</details>

---

> 🧭 **I si et quedes amb ganes?** Quan domines els bucles i les condicions podràs tornar als problemes de la U02 (com Nochevieja o Quina banda del carrer?) i resoldre'ls amb `for` i `switch` per a fer solucions més elegants. El material no es perd: es reutilitza.
