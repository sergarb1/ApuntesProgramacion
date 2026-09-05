---
title: "Butlletí U12 — Extres"
description: "CodeWars i AceptaElReto per a anar més enllà dels fitxers i les expressions regulars"
---

# 📝 Butlletí U12 — Extres

> Exercicis de CodeWars i AceptaElReto amb pistes. Les solucions estan amagades: esgota la teua pista abans de mirar-les.

---

## CodeWars

### 1. Regex validate PIN code

Crea una funció que valide un PIN: un `String` que és vàlid només si té **4 o 6 dígits exactes**.

**Exemple:** `"1234"` → `true`, `"12345"` → `false`, `"a234"` → `false`, `"123456"` → `true`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/55f8a9c06c018a0d6e000132)
- Dificultat: 7 kyu

<details>
<summary>💡 Pista</summary>

És la kata més regex de la unitat: un sol `matches()` amb el patró `\\d{4}|\\d{6}` ho resol. Recorda: `matches()` exigix que tot el string complica amb el patró, que és just el que demana un PIN.

</details>

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static boolean validatePin(String pin) {
        return pin.matches("\\d{4}|\\d{6}");
    }
}
```

`\\d{4}` és "exactament 4 dígits" i `\\d{6}` "exactament 6". El `|` els uneix: o 4 o 6. `matches()` comprova el string sencer, així que `"12345a"` no passa encara que tinga 5 dígits: hi ha una lletra al final.

</details>

---

### 2. Two to One

Et donen dos strings en minúscules amb lletres de la `a` a la `z`. Torna un únic string amb les lletres **distintes de tots dos, ordenades alfabèticament**.

**Exemple:** `"xyaabbbccccdefww"` i `"xxxxyyyyabklmopq"` → `"abcdefklmopqwxy"`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/5656b6906de340bd1b0000ac)
- Dificultat: 7 kyu

<details>
<summary>💡 Pista</summary>

Concatena els dos strings en un. Després recorre les lletres de la `a` a la `z` i, si el string concatenat conté eixa lletra (`indexOf`), afegix-la al resultat. L'ordre alfabètic eix gratis perquè recorres l'alfabet en ordre.

</details>

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static String longest(String s1, String s2) {
        String unidos = s1 + s2;
        StringBuilder resultado = new StringBuilder();

        for (char c = 'a'; c <= 'z'; c++) {
            if (unidos.indexOf(c) != -1) {
                resultado.append(c);
            }
        }
        return resultado.toString();
    }
}
```

La clau és invertir la pregunta: en comptes de filtrar els caràcters dels strings, recorres l'alfabet i preguntes "està esta lletra en la unió?". Amb `indexOf(c) != -1` saps si apareix. El `StringBuilder` acumula el resultat i l'ordre alfabètic és automàtic perquè la `a` es processa abans que la `b`.

</details>

---

### 3. Categorize New Member

El club de tenis classifica els seus nous socis. Un soci és **"Senior"** si té 55 anys o més **i** un hándicap major que 7; si no, és **"Open"**. Et donen un array de parells `[edat, hándicap]` i has de tornar un array amb la categoria de cadascun.

**Exemple:** `[[45, 12], [55, 21], [19, -2], [104, 20]]` → `["Open", "Senior", "Open", "Senior"]`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/5502c9e7b3216ec63c000020)
- Dificultat: 7 kyu

<details>
<summary>💡 Pista</summary>

Simple lògica booleana: `edad >= 55 && hándicap > 7`. Recorre l'array de parells i munta el resultat amb un ternari.

</details>

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static String[] openOrSenior(int[][] data) {
        String[] resultado = new String[data.length];

        for (int i = 0; i < data.length; i++) {
            resultado[i] = (data[i][0] >= 55 && data[i][1] > 7)
                ? "Senior" : "Open";
        }
        return resultado;
    }
}
```

Cada parell `data[i]` té l'edat en `[0]` i l'hándicap en `[1]`. El ternari decidix la categoria en una línia i guarda el resultat en la seua posició. És la lògica booleana pura de l'enunciat: les dues condicions amb `&&`.

</details>

---

### 4. Primes in numbers

Donat un número positiu `n`, torna la seua descomposició en factors primers amb el format `"(p1**exp1)(p2**exp2)"`. Si l'exponent és 1, s'escriu només `"(p)"`.

**Exemple:** `86240` → `"(2**5)(5)(7**2)(11)"`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/54d512e62a5e54c96200002e)
- Dificultat: 5 kyu

<details>
<summary>💡 Pista</summary>

Dividix per 2, després pels senars des de 3 fins a l'arrel quadrada de `n` (que es va reduint en dividir). Compta quantes voltes dividix cada divisor (l'exponent) i munta el string amb un `StringBuilder`.

</details>

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static String factors(int n) {
        StringBuilder sb = new StringBuilder();

        for (int i = 2; i * i <= n; i++) {
            int veces = 0;
            while (n % i == 0) {
                n /= i;
                veces++;
            }
            if (veces == 1) {
                sb.append("(").append(i).append(")");
            } else if (veces > 1) {
                sb.append("(").append(i).append("**").append(veces).append(")");
            }
        }
        if (n > 1) {
            sb.append("(").append(n).append(")");
        }
        return sb.toString();
    }
}
```

El `while` intern dividix mentre el divisor encaixe i compta les repeticions: eixe és l'exponent. El bucle només arriba a l'arrel de `n` (i `n` es va reduint), així que l'`if (n > 1)` final arreplega l'últim factor primer que queda. El `StringBuilder` evita concatenar cadenes en cada volta, que seria lent.

</details>

---

## AceptaElReto

### 5. 108 — Formigues

Sobre una barra de longitud `L` cm hi ha `n` formigues. Cada formiga es mou a 1 cm/s cap a l'extrem que li toque (l'enunciat et dona les posicions). Quan dues formigues es creuen, totes dues canvien de sentit. Calcula, per a cada cas de prova, el **temps mínim** i el **temps màxim** que tarden a caure totes de la barra.

**Entrada:** diversos casos de prova. Cada cas comença amb `L` i `n`, seguit de les `n` posicions de les formigues.

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=108)
- Dificultat: ⭐⭐

<details>
<summary>💡 Pista</summary>

Quan dues formigues es creuen i canvien de sentit, és **com si s'ignoraren**: la posició de les formigues és indistinguible. Així que cada formiga cau en `min(pos, L - pos)` o `max(pos, L - pos)`. El temps mínim és el major dels mínims; el màxim, el major dels màxims.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class Hormigas {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (sc.hasNextInt()) {
            int L = sc.nextInt();
            int n = sc.nextInt();
            int minTiempo = 0, maxTiempo = 0;

            for (int i = 0; i < n; i++) {
                int pos = sc.nextInt();
                int haciaIzq = pos;
                int haciaDer = L - pos;
                minTiempo = Math.max(minTiempo, Math.min(haciaIzq, haciaDer));
                maxTiempo = Math.max(maxTiempo, Math.max(haciaIzq, haciaDer));
            }

            System.out.println(minTiempo + " " + maxTiempo);
        }
        sc.close();
    }
}
```

El truc conceptual: quan dues formigues es creuen, totes dues giren, però com que són indistinguibles, l'efecte és el mateix que si passaren de llarg. Cada formiga tarda `pos` o `L - pos` segons el costat cap on vaja. Per al mínim total, cada formiga tria el seu costat més pròxim i el temps és el major d'eixos mínims; per al màxim, el pitjor cas.

</details>

---

### 6. 140 — Suma de dígits

Donat un número positiu, calcula la suma dels seus dígits. L'entrada és una seqüència de números que acaba amb `-1`.

**Exemple:** `123` → `123: 6`, `55` → `55: 10`, `1000` → `1000: 1`.

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=140)
- Dificultat: ⭐

<details>
<summary>💡 Pista</summary>

Pots extraure els dígits amb `% 10` i `/ 10` en un bucle mentre el número siga major que 0. O, més en l'esperit d'esta unitat, convertir el número a `String` i recórrer-lo amb un `charAt`, sumant `c - '0'`.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class SumaDigitos {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            int n = sc.nextInt();
            if (n == -1) break;

            int suma = 0;
            String texto = String.valueOf(n);
            for (int i = 0; i < texto.length(); i++) {
                suma += texto.charAt(i) - '0';
            }

            System.out.println(n + ": " + suma);
        }
        sc.close();
    }
}
```

Convertir el número a `String` permet tractar els dígits com a caràcters: `charAt(i) - '0'` convertix el caràcter `'3'` en el número `3` (perquè els codis ASCII dels dígits són consecutius). Sense operacions aritmètiques de `%` i `/`: la versió "d'unitat de regex" d'un clàssic.

</details>

---

> 🧭 **I si et quedes amb ganes?** Quan domines els fitxers i les regex, torna als problemes d'unitats anteriors i resol-los llegint les dades des d'un fitxer en comptes de demanar-les pel teclat, o validant l'entrada amb un `matches()`. El material no es perd: es reutilitza.