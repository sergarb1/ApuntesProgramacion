---
title: Butlletí U07 — Extres
description: CodeWars i AceptaElReto per a anar més enllà de la unitat
---

# 📝 Butlletí U07 — Extres

> Exercicis de CodeWars i AceptaElReto amb pistes. La solució està oculta: resisteix fins a esgotar la teua pista.

---

## CodeWars

### 1. Remove String Spaces

Et donen una cadena i has de llevar-li tots els espais en blanc.

**Exemples:** `"8 j 8   mBliB8g  imjB8B8  jl  B"` → `"8j8mBliB8gimjB8B8jlB"`, `"8aaaaa dddd r     "` → `"8aaaaaddddr"`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/57eae20f5500ad98e50002c5)
- Dificultat: 8 kyu

**Pista:** el mètode `String.replace(" ", "")` canvia totes les aparicions d'un text per un altre. Llevar els espais és reemplaçar-los per "res".

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static String noSpace(final String x) {
        return x.replace(" ", "");
    }
}
```

`replace(" ", "")` recorre tota la cadena i substituïx cada espai per la cadena buida. Sense bucles, sense condicions: un sol mètode estàtic resolt amb el material de cadenes de la U05.

</details>

---

### 2. String repeat

Et donen un número `repeat` i una cadena `string`. Retorna la cadena repetida eixe número de vegades.

**Exemples:** `repeatStr(6, "I")` → `"IIIIII"`, `repeatStr(5, "Hello")` → `"HelloHelloHelloHelloHello"`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/57a0e5c372292dd76d000d7e)
- Dificultat: 8 kyu

**Pista:** un `for` que vaja sumant la cadena a un acumulador tantes vegades com indique `repeat`. (O el mètode `string.repeat(repeat)`, si t'agrada l'atall.)

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static String repeatStr(final int repeat, final String string) {
        return string.repeat(repeat);
    }
}
```

O, a l'antiga:

```java
public class Kata {
    public static String repeatStr(final int repeat, final String string) {
        StringBuilder resultat = new StringBuilder();
        for (int i = 0; i < repeat; i++) {
            resultat.append(string);
        }
        return resultat.toString();
    }
}
```

`String.repeat(repeat)` és el mètode modern, directe i sense bucles. Si prefereixes entendre la mecànica, el `for` amb `StringBuilder` (vist en la U05) fa exactament el mateix: acumular la cadena `repeat` vegades.

</details>

---

### 3. Convert boolean values to strings 'Yes' or 'No'

Completa el mètode `boolToWord(boolean b)` perquè retorne `"Yes"` si és `true` i `"No"` si és `false`.

**Exemples:** `boolToWord(true)` → `"Yes"`, `boolToWord(false)` → `"No"`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/53369039d7ab3ac506000467)
- Dificultat: 8 kyu

**Pista:** un `if`/`else` que retorne una cadena o l'altra, o l'operador ternari vist en la U03: `return b ? "Yes" : "No";`.

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static String boolToWord(boolean b) {
        return b ? "Yes" : "No";
    }
}
```

Un ternari en una sola línia: si `b` és `true` retorna `"Yes"`, si no `"No"`. Decidir amb elegància, just l'esperit de les estructures de control de la U03 aplicat a un mètode estàtic.

</details>

---

### 4. Find the smallest integer in the array

Et donen un array d'enters. Retorna el número més xicotet.

**Exemple:** `[34, 15, 88, 2]` → `2`, `[34, -345, -1, 100]` → `-345`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/55a2d7ebe362935a210000b2)
- Dificultat: 8 kyu

**Pista:** recorre l'array i ves guardant en una variable el mínim trobat fins ara. Comença amb `args[0]` com a primer candidat.

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static int findSmallestInt(int[] args) {
        int minim = args[0];
        for (int i = 1; i < args.length; i++) {
            if (args[i] < minim) {
                minim = args[i];
            }
        }
        return minim;
    }
}
```

La idea del "mínim acumulat": comences assumint que el primer és el menor i, si apareix un de més xicotet, actualitzes. És el mateix raonament que el `Validador` del butlletí avançat, ara aplicat a números. `Math.min` seria l'atall, però este `for` ensenya la mecànica.

</details>

---

## AceptaElReto

### 5. 155 — Perímetre d'un rectangle

Diversos rectangles es col·loquen un a continuació de l'altre, tots recolzats sobre la mateixa base horitzontal. Donat el número de rectangles i l'ample i l'alt de cada un, calcula el **perímetre** de la figura resultant.

**Entrada:** diversos casos de prova. Cada cas és una línia amb un número N (el número de rectangles) seguit de N parelles `ample alt`. L'entrada acaba amb `0`.

**Exemple:**

```
2 2 2 1
3 1 1 1 1 1 1
0
```

**Eixida:**

```
12
8
```

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=155)
- Dificultat: Fàcil

**Pista:** el perímetre de la figura és `2 * (sumaAmples + sumaAlts) - 2 * suma(altCompartit entre rectangles veïns)`, on l'alt compartit entre dos veïns és el **menor** dels seus alts (`Math.min`). Els costats interns es resten perquè no formen part del perímetre exterior.

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class PerimetreRectangle {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            int n = sc.nextInt();
            if (n == 0) break;

            int sumaAmples = 0;
            int sumaAlts = 0;
            int[] alts = new int[n];
            int compartit = 0;

            for (int i = 0; i < n; i++) {
                int ample = sc.nextInt();
                int alt = sc.nextInt();
                sumaAmples += ample;
                sumaAlts += alt;
                alts[i] = alt;
            }

            for (int i = 0; i < n - 1; i++) {
                compartit += Math.min(alts[i], alts[i + 1]);
            }

            System.out.println(2 * (sumaAmples + sumaAlts) - 2 * compartit);
        }
        sc.close();
    }
}
```

Primer acumulem amples i alts i guardem els alts en un array. Després, per cada parella de veïns restem el doble del seu alt compartit (`Math.min`): eixa paret queda dins de la figura i no compta en el perímetre. Verifica-ho amb `2 2 2 1`: `2 * (4 + 3) - 2 * 1 = 14 - 2 = 12`.

</details>

---

### 6. 171 — Abadies de pedra

Als Picos de Europa hi ha muntanyes en fila, i una **abadia** (construïda al cim d'una muntanya) només pot veure el mar si **no hi ha cap muntanya a la seua dreta que siga més alta o igual**. Donat el número de muntanyes i les seues altures, compta quantes abadies veuen el mar.

**Entrada:** diversos casos de prova. Cada cas: una línia amb N (número de muntanyes) seguida d'una altra línia amb les N altures. L'entrada acaba amb `0`.

**Exemple:**

```
3
3 1 2
0
```

**Eixida:**

```
2
```

(La d'altura 3 veu el mar: a la seua dreta hi ha 1 i 2, totes dues més baixes. La d'altura 1 no: la tapa la de 2. L'última, d'altura 2, sempre veu el mar.)

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=171)
- Dificultat: Fàcil

**Pista:** recorre les muntanyes **de dreta a esquerra** portant l'altura màxima vista fins ara. Una muntanya veu el mar si la seua altura és **major** que eixe màxim; llavors la comptes i actualitzes el màxim. L'última muntanya sempre veu el mar.

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class AbadiesPedra {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            int n = sc.nextInt();
            if (n == 0) break;

            int[] altures = new int[n];
            for (int i = 0; i < n; i++) {
                altures[i] = sc.nextInt();
            }

            int maxVist = 0;
            int abadies = 0;

            for (int i = n - 1; i >= 0; i--) {
                if (altures[i] > maxVist) {
                    abadies++;
                    maxVist = altures[i];
                }
            }

            System.out.println(abadies);
        }
        sc.close();
    }
}
```

La clau és anar **de dreta a esquerra**: la muntanya més a la dreta no té res davant i sempre compta. Després, cada muntanya veu el mar només si supera tot el que ja hem vist per la seua dreta (`maxVist`). Per a `3 1 2`: la 2 compta (màx. 2), la 1 no, la 3 sí (3 > 2) → `2`. Arrays + el patró del màxim, en una sola passada.

</details>

---

> 🧭 **I si et quedes amb ganes?** Quan domines l'encapsulació podràs tornar als problemes de les unitats anteriors (com San Fermines o la suma sentinella) i reescriure les seues solucions amb classes ben blindades i mètodes `static` utilitaris. El material no es perd: es reutilitza.