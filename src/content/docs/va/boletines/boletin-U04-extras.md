---
title: "Butlletí U04 — Extres"
description: "CodeWars i AceptaElReto per a anar més enllà dels arrays"
---

# 📝 Butlletí U04 — Extres

> Exercicis de CodeWars i AceptaElReto amb pistes. Les solucions estan amagades: esgota la teua pista abans de mirar-les.

---

## CodeWars

### 1. Convert number to reversed array of digits

Et donen un número enter no negatiu. Torna els seus dígits en un array d'enters, **en ordre invers**.

**Exemple:** `35231` → `[1, 3, 2, 5, 3]` · `0` → `[0]`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/5583090cbe83f4fd8c000051)
- Dificultat: 8 kyu

<details>
<summary>💡 Pista</summary>

Per a extraure dígits, `% 10` et dona l'últim i `/ 10` se'l treu. Amb això ja eixen invertits: el primer que traus és l'últim del número.

</details>

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static int[] digitize(long n) {
        String texto = Long.toString(n);
        int[] resultado = new int[texto.length()];

        for (int i = 0; i < resultado.length; i++) {
            resultado[i] = Character.getNumericValue(texto.charAt(resultado.length - 1 - i));
        }
        return resultado;
    }
}
```

Una altra forma, sense convertir a text, si prefereixes `%` i `/`:

```java
public static int[] digitize(long n) {
    String texto = String.valueOf(n);
    int[] resultado = new int[texto.length()];
    for (int i = 0; i < texto.length(); i++) {
        resultado[i] = (int) (n % 10);
        n /= 10;
    }
    return resultado;
}
```

Amb `% 10` i `/ 10`: l'últim dígit eix primer (ja ve invertit), i després de dividir entre 10 es repetix. El cas `0` → `[0]` funciona sol: `0 % 10 = 0`.

</details>

---

### 2. Find the smallest integer in the array

Et donen un array d'enters. Torna l'enter **més menut**.

**Exemples:** `[78, 56, 232, 12, 11, 43]` → `11` · `[34, -345, -1, 100]` → `-345`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/55a2d7ebe362935a210000b2)
- Dificultat: 8 kyu

<details>
<summary>💡 Pista</summary>

El patró del mínim: comença assumint que el primer és el mínim i compara amb cada un. Ací l'array mai no està buit.

</details>

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static int findSmallestInt(int[] args) {
        int minimo = args[0];
        for (int i = 1; i < args.length; i++) {
            if (args[i] < minimo) {
                minimo = args[i];
            }
        }
        return minimo;
    }
}
```

El mateix esquelet que el "màxim acumulat", però al revés. Com l'array mai no està buit, pots usar `args[0]` com a punt de partida sense por.

</details>

---

### 3. Count by X

Torna un array amb els **primers `n` múltiples** de `x`.

**Exemples:** `countBy(2, 5)` → `[2, 4, 6, 8, 10]` · `countBy(1, 10)` → `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/5513795bd3fafb56c200049e)
- Dificultat: 8 kyu

<details>
<summary>💡 Pista</summary>

Crea l'array amb `new int[n]` i ompli amb un `for`: la plaça `i` guarda `x * (i + 1)`.

</details>

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static int[] countBy(int x, int n) {
        int[] resultado = new int[n];
        for (int i = 0; i < n; i++) {
            resultado[i] = x * (i + 1);
        }
        return resultado;
    }
}
```

Saps la grandària per endavant (`n`), així que no cal el patró de dues passades: un sol `for` crea i ompli. El `(i + 1)` és perquè els múltiples comencen en `x * 1`, no en `x * 0`.

</details>

---

### 4. Take a Ten Minute Walk

Vius en una ciutat en graella. Et donen un array de direccions (`'n'`, `'s'`, `'e'`, `'w'`). Torna `true` si el passeig dura **exactament 10 minuts** (una illa per minut) **i et deixa al punt de partida**.

**Exemples:** `['n','s','n','s','n','s','n','s','n','s']` → `true` · `['n','n','n','s','n','s','n','s','n','s']` → `false`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/54da539698eb8f52b900053b)
- Dificultat: 6 kyu

<details>
<summary>💡 Pista</summary>

Porta dos comptadors: un per a nord/sud i un altre per a est/oest. Si el passeig no dura 10 minuts, ja pots tornar `false` sense comptar res.

</details>

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static boolean isValid(char[] walk) {
        if (walk.length != 10) {
            return false;
        }

        int x = 0, y = 0;
        for (char c : walk) {
            if (c == 'n') y++;
            if (c == 's') y--;
            if (c == 'e') x++;
            if (c == 'w') x--;
        }

        return x == 0 && y == 0;
    }
}
```

Nord puja `y`, sud el baixa; est puja `x`, oest el baixa. Si al final tots dos comptadors tornen a 0, ets on vas començar. És un array recorregut una sola volta, amb la suma com a testimoni. O(n), com ha de ser.

</details>

---

## AceptaElReto

### 5. 171 — Abadies de pedra

Una serralada té una sèrie de muntanyes, cada una amb la seua altura. Es pot construir una **abadia** sobre una muntanya si és **més alta que totes les que té a la dreta** (cap al mar). Compta quantes muntanyes complixen la condició.

**Entrada:** diversos casos de prova. Cada cas comença amb `N` (nombre de muntanyes), seguit de `N` altures en la mateixa línia. Un `0` acaba l'entrada.

**Exemple:**

```
3
5 3 4
4
2 3 4 1
0
```

**Eixida:**

```
2
2
```

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=171)
- Dificultat: Fàcil

<details>
<summary>💡 Pista</summary>

Recorre l'array **de dreta a esquerra** guardant l'altura màxima vista. L'última muntanya sempre val. Quan una muntanya supere la màxima vista fins ara, és una abadia nova.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class Abadias {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();

        while (n != 0) {
            int[] montanas = new int[n];
            for (int i = 0; i < n; i++) {
                montanas[i] = sc.nextInt();
            }

            int abadias = 0;
            int maxVista = -1;
            for (int i = n - 1; i >= 0; i--) {
                if (montanas[i] > maxVista) {
                    abadias++;
                    maxVista = montanas[i];
                }
            }

            System.out.println(abadias);
            n = sc.nextInt();
        }
        sc.close();
    }
}
```

La clau és recórrer cap arrere: la muntanya veu el mar si és més alta que **tot** el que té a la dreta, i la màxima vista ho resumix tot. Amb `5 3 4`: el 4 val, el 3 no (hi ha un 4 més alt), el 5 val → 2. És un array + recorregut en el sentit correcte.

</details>

---

### 6. 369 — Comptant en la sorra

Un xiquet escriu els números en la sorra amb marques de compte: l'`1` el escriu com `1`, el `2` com `11`, el `3` com `111`... És a dir, cada número es representa amb tants uns com val. Donat un número, escriu-lo com ho faria el xiquet.

**Entrada:** diversos números, un per línia, fins a un `0` final.

**Exemple:**

```
1
5
3
0
```

**Eixida:**

```
1
11111
111
```

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=369)
- Dificultat: Fàcil

<details>
<summary>💡 Pista</summary>

Un bucle que afija `'1'` a un `StringBuilder` tantes voltes com indique el número. No cal array: és la prova que de vegades n'hi ha prou amb saber quantes voltes repetir.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class ContandoEnLaArena {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();

        while (n != 0) {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < n; i++) {
                sb.append('1');
            }
            System.out.println(sb);
            n = sc.nextInt();
        }
        sc.close();
    }
}
```

Cada número `n` es convertix en `n` uns. El bucle és el mateix que usaríes per a omplir un array, però ací l'"array" és un `StringBuilder` que creix. El `0` marca el final de l'entrada, com sempre en AceptaElReto.

</details>

---

> 🧭 **I si et quedes amb ganes?** Quan domines l'aparcament sencer —crear, recórrer, ordenar, buscar, invertir i compactar—, torna a estos problemes amb el punt 9 com a examen. I en la U05 t'esperen els algoritmes: cerca binària, bombolla i Big O. Els arrays que has après hui són la matèria primera de tot el que ve.