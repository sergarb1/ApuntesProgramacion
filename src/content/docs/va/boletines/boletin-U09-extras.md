---
title: Butlletí U09 — Extres
description: CodeWars i AceptaElReto per a anar més enllà de la unitat
---

# 📝 Butlletí U09 — Extres

> Exercicis de CodeWars i AceptaElReto amb pistes. La solució està amagada: resisteix-te fins a esgotar la teua pista. CodeWars i AceptaElReto són els gimnasos on els programadors es repte cada dia: ací és on l'herència deixa de ser teoria i es convertix en reflexos.

---

## CodeWars

### 1. Convert string to camel case

Et donen una cadena amb guions o guions baixos separant paraules. Torna la versió en **camelCase**: cada paraula comença en majúscula excepte la primera.

**Exemples:** `"the-stealth-warrior"` → `"theStealthWarrior"`, `"The_Stealth_Warrior"` → `"TheStealthWarrior"`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/517abf86da9663f1d2000003)
- Dificultat: 6 kyu

**Pista:** recorre els caràcters amb un `for` i porta una variable `boolean` que recorde si el caràcter anterior era un separador (`-` o `_`). Si ho era, el següent caràcter va en majúscula.

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static String toCamelCase(String s) {
        StringBuilder resultat = new StringBuilder();
        boolean capitalitzar = false;

        for (char c : s.toCharArray()) {
            if (c == '-' || c == '_') {
                capitalitzar = true;
            } else if (capitalitzar) {
                resultat.append(Character.toUpperCase(c));
                capitalitzar = false;
            } else {
                resultat.append(c);
            }
        }
        return resultat.toString();
    }
}
```

La bandera `capitalitzar` s'activa en vore un separador i es consumix en transformar la següent lletra. Un sol bucle, sense `split`: recórrer i recordar és suficient.

</details>

---

### 2. Counting Duplicates

Compta quants caràcters apareixen **més d'una vegada** en una cadena, sense distingir majúscules de minúscules.

**Exemples:** `"abcde"` → `0`, `"aabBcde"` → `2` (la `a` i la `b`), `"indivisibility"` → `1` (la `i`).

- [Enunciat en CodeWars](https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1)
- Dificultat: 6 kyu

**Pista:** convertix a minúscules i compta freqüències amb un `Map<Character, Integer>`; al final, compta quantes entrades tenen freqüència major que 1. (El `Map` s'estudia a fons en la U11, però ja pots usar-lo.)

<details>
<summary>🔄 Solució</summary>

```java
import java.util.HashMap;
import java.util.Map;

public class Kata {
    public static int duplicateCount(String text) {
        Map<Character, Integer> freqüències = new HashMap<>();

        for (char c : text.toLowerCase().toCharArray()) {
            freqüències.put(c, freqüències.getOrDefault(c, 0) + 1);
        }

        int repetits = 0;
        for (int freqüència : freqüències.values()) {
            if (freqüència > 1) {
                repetits++;
            }
        }
        return repetits;
    }
}
```

El `Map` guarda quantes vegades apareix cada caràcter. `getOrDefault(c, 0)` torna la freqüència actual o 0 si el caràcter encara no hi era. Després, basta comptar les que superen 1: `"aabBcde"` → la `a` (2) i la `b` (2) → `2`.

</details>

---

### 3. Human Readable Time

Et donen un número de **segons** (màxim 359999). Torna'l amb format `HH:MM:SS` amb zeros a l'esquerra.

**Exemples:** `makeReadable(0)` → `"00:00:00"`, `makeReadable(5)` → `"00:00:05"`, `makeReadable(86399)` → `"23:59:59"`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/52685f7382004e774f0001f7)
- Dificultat: 5 kyu

**Pista:** divisió entera i mòdul: hores = `segons / 3600`, minuts = `(segons % 3600) / 60`, segons = `segons % 60`. Formata amb `String.format("%02d:%02d:%02d")`.

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static String makeReadable(int seconds) {
        int hores = seconds / 3600;
        int minuts = (seconds % 3600) / 60;
        int segons = seconds % 60;
        return String.format("%02d:%02d:%02d", hores, minuts, segons);
    }
}
```

El `%02d` ompli amb zeros a l'esquerra fins a dos dígits. Per a `86399`: `23`, `59`, `59` → `"23:59:59"`. És el mateix raonament d'unitats, desenes i centenes que ja uses en dividir.

</details>

---

### 4. Basic subclasses — Adam and Eve

Segons el mite, Adam i Eva van ser els primers humans. El teu treball és "fer el treball de Déu": crear un mètode estàtic `create()` que torne un array d'`Human` amb dos objectes: el primer un `Man` i el segon una `Woman`. Ambdues classes hereden d'`Human`, i cada humà té `name`, `sex` i la propietat `species` amb valor `"Human"`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/547274e24481cfc469000416)
- Dificultat: 8 kyu

**Pista:** herència pura: `class Man extends Human` i `class Woman extends Human`. Cada subclasse crida a `super(...)` per a omplir el nom i el sexe. L'array de retorn és de tipus `Human`, així que accepta les dos subclasses.

<details>
<summary>🔄 Solució</summary>

```java
public class Human {
    private String name;
    private String sex;
    protected String species = "Human";

    public Human(String name, String sex) {
        this.name = name;
        this.sex = sex;
    }

    public String getName() {
        return name;
    }

    public String getSex() {
        return sex;
    }

    public String getSpecies() {
        return species;
    }
}

class Man extends Human {
    public Man(String name) {
        super(name, "man");
    }
}

class Woman extends Human {
    public Woman(String name) {
        super(name, "woman");
    }
}

public class God {
    public static Human[] create() {
        return new Human[] { new Man("Adam"), new Woman("Eve") };
    }
}
```

`Man` i `Woman` hereden tot d'`Human` i només aporten el seu constructor amb el sexe fix. `create()` torna un array d'`Human` (el tipus general) ple amb les dos subclasses: polimorfisme de dalt a baix, com Adam i Eva al Paradís.

</details>

---

## AceptaElReto

### 5. 100 — Constant de Kaprekar

El matemàtic Kaprekar va descobrir que, aplicant a qualsevol número de 4 dígits (amb almenys dos de diferents) la rutina *ordena els dígits de major a menor, resta-li l'ordenat de menor a major*, sempre s'arriba al número **6174** en 7 voltes com a molt. Per exemple, `3524`: `5432 - 2345 = 3087`, `8730 - 0378 = 8352`, `8532 - 2358 = 6174` (3 voltes).

**Entrada:** la primera línia és el número de casos de prova. Cada cas és un número de 4 dígits.

**Eixida:** per a cada cas, les voltes fins a arribar a 6174. Per als *repdigits* (les 4 xifres iguals, com `1111`) escriu `8`. Per al propi `6174`, escriu `0`.

**Entrada d'exemple:**

```
5
3524
1111
1121
6174
1893
```

**Eixida d'exemple:**

```
3
8
5
0
7
```

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=100)
- Dificultat: Fàcil/Mitjana

**Pista:** passa el número a cadena amb `String.format("%04d", n)` per a mantindre els 4 dígits amb zeros. Ordena els caràcters amb `Arrays.sort` per a obtindre el menor; el major és el mateix array recorregut al revés. Repeteix fins a arribar a 6174.

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Arrays;
import java.util.Scanner;

public class Kaprekar {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int casos = sc.nextInt();

        for (int i = 0; i < casos; i++) {
            int n = sc.nextInt();
            System.out.println(voltesKaprekar(n));
        }
        sc.close();
    }

    static int voltesKaprekar(int n) {
        if (n == 6174) {
            return 0;
        }

        String s = String.format("%04d", n);
        if (s.charAt(0) == s.charAt(1)
                && s.charAt(1) == s.charAt(2)
                && s.charAt(2) == s.charAt(3)) {
            return 8;
        }

        int voltes = 0;
        while (n != 6174) {
            char[] asc = String.format("%04d", n).toCharArray();
            Arrays.sort(asc);
            int menor = Integer.parseInt(new String(asc));

            char[] desc = new char[4];
            for (int j = 0; j < 4; j++) {
                desc[j] = asc[3 - j];
            }
            int major = Integer.parseInt(new String(desc));

            n = major - menor;
            voltes++;
        }
        return voltes;
    }
}
```

Per a `3524`: els dígits ordenats donen `2345` (menor) i `5432` (major), es resten i es repetix fins a arribar a `6174`. El `String.format("%04d", ...)` conserva els zeros inicials (el `0378` de l'exemple). Verifica-ho amb `1121`: `5` voltes, tal com promet l'enunciat.

</details>

---

### 6. 369 — Contant en la sorra

Molts abans de la base 2 i dels números romans, els primers humans comptaven fent solcs en la sorra. Et demanen la "base 1": representar cada número com a tants **uns** com valga.

**Entrada:** diversos números majors que 0 i mai majors que 1.000, cadascun en una línia. L'entrada acaba amb un `0`, que no ha de processar-se.

**Eixida:** per a cada número, la seua codificació en base 1 (eixa quantitat d'`1` seguits).

**Entrada d'exemple:**

```
1
4
6
0
```

**Eixida d'exemple:**

```
1
1111
111111
```

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=369)
- Dificultat: Fàcil

**Pista:** un `StringBuilder` i un bucle que afija `'1'` tantes vegades com el número. El patró de lectura "llegir fins a 0" és el sentinella que ja coneixes dels butlletins anteriors.

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class ContantSorra {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            int n = sc.nextInt();
            if (n == 0) {
                break;
            }

            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < n; i++) {
                sb.append('1');
            }
            System.out.println(sb);
        }
        sc.close();
    }
}
```

El bucle exterior llig fins que arriba el `0` sentinella. Per cada número, el bucle interior fabrica una cadena de `n` uns. `StringBuilder` evita crear cadenes noves en cada concatenació: és el patró eficient per a acumular caràcters.

</details>

---

> 🧭 **¿I si et quedes amb ganes?** Quan domines l'herència, torna als problemes de les unitats anteriors i reescriu-los amb jerarquies: un `Lector` abstracte, un `Solucionador` polimòrfic, figures que es calculen soles. El material no es perd: es reutilitza.