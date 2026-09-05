---
title: Butlletí U05 — Extres
description: CodeWars i AceptaElReto per a anar més enllà de la unitat
---

# 📝 Butlletí U05 — Extres

> Exercicis de CodeWars i AceptaElReto amb pistes. La solució està amagada: resistix fins a esgotar la teua pista.

---

## CodeWars

### 1. You only need one — Beginner

Et donen un array i un valor. Retorna `true` si l'array **conté** el valor.

**Exemples:** `{"a", "b", "c"}`, `"a"` → `true` · `{"a", "b", "c"}`, `"z"` → `false`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/57cc975ed542d3148f00015b)
- Dificultat: 8 kyu

**Pista:** un `for` que recórrega l'array i un `if` que retorne `true` si algun element és igual al valor. Després del bucle, `false`.

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static boolean check(Object[] a, Object x) {
        for (Object element : a) {
            if (element.equals(x)) {
                return true;
            }
        }
        return false;
    }
}
```

És la cerca lineal en la seua forma més pura: recórrer i retornar tan bon punt trobes. Per a objectes usem `.equals()` en comptes de `==`. La complexitat és O(n): pot ser que el trobes a la primera o al final.

</details>

---

### 2. Square(n) Sum

Et donen un array d'enters. Retorna la suma dels **quadrats** de cada nombre.

**Exemple:** `[1, 2, 2]` → `1 + 4 + 4 = 9`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/515e271a311df0350d00000f)
- Dificultat: 8 kyu

**Pista:** un acumulador `suma` i, dins del bucle, `suma += numero * numero;`.

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static int squareSum(int[] numeros) {
        int suma = 0;
        for (int numero : numeros) {
            suma += numero * numero;
        }
        return suma;
    }
}
```

`numero * numero` és el quadrat (evita `Math.pow`, que és més lent per a un enter). Un acumulador i un bucle: O(n). El mateix esquelet que "suma tots" però amb un xicotet càlcul dins.

</details>

---

### 3. Convert number to reversed array of digits

Et donen un nombre enter no negatiu. Retorna els seus dígits en un array d'enters, **en ordre invers**.

**Exemple:** `35231` → `[1, 3, 2, 5, 3]` · `0` → `[0]`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/5583090cbe83f4fd8c000051)
- Dificultat: 8 kyu

**Pista:** per a extraure dígits, `% 10` et dóna l'últim i `/ 10` se'l lleva. Amb això ja ixen invertits: el primer que traus és l'últim del nombre.

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static int[] digitize(long n) {
        String text = Long.toString(n);
        int[] resultat = new int[text.length()];

        for (int i = 0; i < resultat.length; i++) {
            resultat[i] = Character.getNumericValue(text.charAt(resultat.length - 1 - i));
        }
        return resultat;
    }
}
```

Una altra forma, sense convertir a text, si prefereixes `%` i `/`:

```java
public static int[] digitize(long n) {
    String text = String.valueOf(n);
    int[] resultat = new int[text.length()];
    for (int i = 0; i < text.length(); i++) {
        resultat[i] = (int) (n % 10);
        n /= 10;
    }
    return resultat;
}
```

Amb `% 10` i `/ 10`: l'últim dígit ix primer (ja ve invertit), i després de dividir entre 10 es repetix. El cas `0` → `[0]` funciona sol: `0 % 10 = 0`.

</details>

---

### 4. Count the divisors of a number

Compta quants divisors té un nombre `n` (positiu).

**Exemples:** `divisors(4)` → `3` (1, 2, 4) · `divisors(12)` → `6` (1, 2, 3, 4, 6, 12).

- [Enunciat en CodeWars](https://www.codewars.com/kata/542c0f198e077084c0000c2e)
- Dificultat: 7 kyu

**Pista:** un bucle de l'1 a `n` amb un `if (n % i == 0)` i un comptador. (Optimització opcional: només arribes a l'arrel quadrada i comptes de dos en dos.)

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static long numberOfDivisors(int n) {
        int comptador = 0;
        for (int i = 1; i <= n; i++) {
            if (n % i == 0) {
                comptador++;
            }
        }
        return comptador;
    }
}
```

Versió optimitzada (O(√n) en comptes d'O(n)):

```java
public static long numberOfDivisors(int n) {
    int comptador = 0;
    for (int i = 1; i * i <= n; i++) {
        if (n % i == 0) {
            comptador += (i * i == n) ? 1 : 2;
        }
    }
    return comptador;
}
```

La versió simple recorre de l'1 a n: si `n % i == 0`, és divisor. L'optimitzada s'aprofita que els divisors van en parelles: si `i` dividix `n`, llavors `n / i` també, excepte quan són el mateix (el cas del quadrat perfecte). D'O(n) a O(√n): Big O en acció.

</details>

---

## AceptaElReto

### 5. 185 — Potitos

Un pare li compra potets (bots de menjar per a bebé) al seu fill. A vegades el bebé li **dona la volta** al bot per a vore el revers, on es llig l'ingredient *que menys li agrada* (o "FIN" si no n'hi ha cap). El pare vol saber els ingredients que el bebé **odia**, per a deixar de comprar-los.

**Entrada:** diversos casos de prova. Cada cas comença amb `N` (nombre de potets). A continuació, `N` línies: cada una amb un ingredient `I` que li agrada, un guió `--`, i opcionalment un `FIN` o un ingredient que detesta. El cas `0` acaba.

**Exemple:**

```
4
pollo--FIN
pescado--FIN
verdura--atun
pollo--FIN
0
```

**Eixida:**

```
atun
```

(L'únic detestat és `atun`; els altres no tenien revers o deien `FIN`.) Els ingredients detestats es mostren **ordenats alfabèticament** i **sense repetir**.

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=185)
- Dificultat: Fàcil

**Pista:** per a cada línia, separa amb `split("--")`. Si la segona part no és `"FIN"`, és un ingredient detestat: guarda'l. Al final, ordena'l (la bombolla del punt 4, però amb `String.compareTo` en comptes de `>`) i elimina els repetits.

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class Potitos {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        sc.nextLine();

        while (n != 0) {
            String[] odiats = new String[n];
            int quants = 0;

            for (int i = 0; i < n; i++) {
                String linea = sc.nextLine();
                String[] parts = linea.split("--");

                if (parts.length > 1 && !parts[1].equals("FIN")) {
                    odiats[quants] = parts[1];
                    quants++;
                }
            }

            for (int i = 0; i < quants - 1; i++) {
                for (int j = 0; j < quants - 1 - i; j++) {
                    if (odiats[j].compareTo(odiats[j + 1]) > 0) {
                        String temp = odiats[j];
                        odiats[j] = odiats[j + 1];
                        odiats[j + 1] = temp;
                    }
                }
            }

            StringBuilder eixida = new StringBuilder();
            for (int i = 0; i < quants; i++) {
                if (i == 0 || !odiats[i].equals(odiats[i - 1])) {
                    eixida.append(odiats[i]).append(" ");
                }
            }
            System.out.println(eixida.toString().trim());

            n = sc.nextInt();
            sc.nextLine();
        }
        sc.close();
    }
}
```

Dues idees de la U05 treballant alhora: la **bombolla** per a ordenar (adaptada a `String` amb `compareTo`) i la idea de recórrer per a **filtrar repetits** (comparant amb l'anterior una vegada ordenat). `split("--")` trosseja cada línia, i només els que tenen revers diferent de `FIN` entren en la llista d'odiats.

</details>

---

### 6. 100 — Constant de Kaprekar

Aplicant l'algoritme de Kaprekar (ordenar els dígits de major a menor, restar l'ordenat de menor a major, i repetir), tot nombre de 4 xifres (amb zeros a l'esquerra si cal) acaba en **6174**. Compta quantes iteracions necessita cada nombre de l'entrada.

**Entrada:** diversos nombres, un per línia, fins a un `0` final. El `6174` necessita `0` iteracions. Els nombres amb totes les xifres iguals (1111, 5555...) són el cas especial del problema: la resposta oficial és **8**.

**Exemple:**

```
6174
3524
1111
0
```

**Eixida:**

```
0
3
8
```

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=100)
- Dificultat: Fàcil

**Pista:** usa la teua bombolla per a ordenar els dígits extraïts amb `% 10` i `/ 10` en un `int[]` de 4 posicions. Reconstruïx el descendent (dígits de major a menor) i l'ascendent, resta'ls i compta amb un comptador fins a arribar a 6174. El problema complet, en el butlletí avançat.

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class Kaprekar {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int numero = sc.nextInt();

        while (numero != 0) {
            if (esRepdigit(numero)) {
                System.out.println(8);
                numero = sc.nextInt();
                continue;
            }

            int iteracions = 0;

            while (numero != 6174) {
                int[] digits = new int[4];

                for (int i = 3; i >= 0; i--) {
                    digits[i] = numero % 10;
                    numero /= 10;
                }

                for (int i = 0; i < digits.length - 1; i++) {
                    for (int j = 0; j < digits.length - 1 - i; j++) {
                        if (digits[j] > digits[j + 1]) {
                            int temp = digits[j];
                            digits[j] = digits[j + 1];
                            digits[j + 1] = temp;
                        }
                    }
                }

                int ascendent = 0;
                int descendent = 0;
                for (int i = 0; i < 4; i++) {
                    ascendent = ascendent * 10 + digits[i];
                    descendent = descendent * 10 + digits[3 - i];
                }

                numero = descendent - ascendent;
                iteracions++;
            }

            System.out.println(iteracions);
            numero = sc.nextInt();
        }
        sc.close();
    }

    static boolean esRepdigit(int n) {
        String s = String.format("%04d", n);
        char primera = s.charAt(0);
        for (char c : s.toCharArray()) {
            if (c != primera) return false;
        }
        return true;
    }
}
```

El mateix algoritme del butlletí avançat, ara en el seu format AceptaElReto (diversos casos fins al 0). Per a `3524`: dígits {3,5,2,4}, ordenats {2,3,4,5} → ascendent 2345, descendent 5432, resta 3087 (iteració 1); després {3,0,8,7} → 8730 − 0378 = 8352 (2); després 8532 − 2358 = 6174 (3). Els repdigits (1111, 5555...) es detecten abans d'entrar al bucle: la primera resta dóna 0 i, sense `esRepdigit`, el `while (numero != 6174)` es quedaria donant voltes per sempre. El problema demana `8` per a ells. La bombolla, una altra vegada, protagonista.

</details>

---

> 🧭 **¿I si et quedes amb ganes?** Quan domines cerques, bombolles i Big O, torna als problemes d'esta unitat amb el punt 9 com a examen. I en la U06 t'esperen les bèsties: QuickSort, MergeSort i la recursivitat. Ordenar un milió de dades en un sospir està a un pas.
