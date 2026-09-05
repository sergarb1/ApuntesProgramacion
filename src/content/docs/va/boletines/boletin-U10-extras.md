---
title: "Butlletí U10 — Extres"
description: "CodeWars i AceptaElReto per a anar més enllà de les col·leccions"
---

# 📝 Butlletí U10 — Extres

> Exercicis de CodeWars i AceptaElReto amb pistes. Les solucions estan amagades: esgota la teua pista abans de mirar-les.

---

## CodeWars

### 1. Convert a string to an array

Et donen una cadena de text separada per espais. Escriu una funció que la dividisca i torne un array de paraules.

**Exemple:** `"Robin Singh"` → `["Robin", "Singh"]`, i `"I love arrays they are my favorite"` → `["I", "love", "arrays", "they", "are", "my", "favorite"]`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/57e76bc428d6fbc2d500036d)
- Dificultat: 8 kyu

<details>
<summary>💡 Pista</summary>

El mètode `String.split(" ")` ja et torna un `String[]`. Però com que estem a la unitat de col·leccions: convertix-lo en una `List<String>` amb `Arrays.asList(...)` o guarda les paraules amb un bucle en un `ArrayList<String>`.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.List;

public class Kata {
    public static String[] stringToArray(String s) {
        return s.split(" ");
    }
}
```

O, pensant en col·leccions:

```java
import java.util.ArrayList;
import java.util.List;

public class Kata {
    public static List<String> stringToArray(String s) {
        List<String> palabras = new ArrayList<>();
        for (String palabra : s.split(" ")) {
            palabras.add(palabra);
        }
        return palabras;
    }
}
```

`split(" ")` part la cadena pels espais i torna un array. La versió amb `ArrayList` recorre eixe array i construïx la llista: la mateixa dada, vista des de la unitat de col·leccions.

</details>

---

### 2. Roman Numerals Encoder

Crea una funció que convertisca un número positiu (1 a 3999) en la seua representació en **nombres romans**.

**Exemple:** `182` → `"CLXXXII"`, `1990` → `"MCMXC"`, `1666` → `"MDCLXVI"`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/51b62bf6a9c58071c600002b)
- Dificultat: 6 kyu

<details>
<summary>💡 Pista</summary>

Prepara dos arrays paral·lels: els valors `{1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1}` i els seus símbols `{"M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"}`. Recorre'ls en ordre descendent i, mentre el número arribe al valor, resta i afig el símbol.

</details>

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static String solution(int n) {
        int[] valores = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
        String[] simbolos = {"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"};

        StringBuilder resultado = new StringBuilder();
        for (int i = 0; i < valores.length; i++) {
            while (n >= valores[i]) {
                resultado.append(simbolos[i]);
                n -= valores[i];
            }
        }
        return resultado.toString();
    }
}
```

El truc està en els símbols compostos (`CM` = 900, `IV` = 4): sense ells, no podries representar els residus del 4 i el 9. El `while` va restant el valor màxim possible amb cada símbol. És un clàssic d'arrays paral·lels i del patró "greedy".

</details>

---

### 3. Delete occurrences of an element if it occurs more than n times

Et donen una llista d'enters i un límit `n`. Torna una nova llista amb els mateixos elements, però cada valor només pot aparéixer com a màxim `n` voltes (es conserven les primeres `n` aparicions).

**Exemple:** `[1, 2, 3, 1, 2, 1, 2, 3]` amb `n = 2` → `[1, 2, 3, 1, 2, 3]`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/554ca54ffa7d91b236000023)
- Dificultat: 6 kyu

<details>
<summary>💡 Pista</summary>

Usa un `HashMap<Integer, Integer>` (el veuràs en la U11, però ja pots usar-lo) per a portar el compte de quantes voltes ha aparegut cada valor. Només afig l'element a la resposta si el seu comptador encara no ha arribat a `n`.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.*;

public class Kata {
    public static int[] deleteNth(int[] elements, int maxOcurrences) {
        Map<Integer, Integer> contador = new HashMap<>();
        List<Integer> resultado = new ArrayList<>();

        for (int e : elements) {
            int veces = contador.getOrDefault(e, 0);
            if (veces < maxOcurrences) {
                resultado.add(e);
                contador.put(e, veces + 1);
            }
        }

        int[] arr = new int[resultado.size()];
        for (int i = 0; i < arr.length; i++) {
            arr[i] = resultado.get(i);
        }
        return arr;
    }
}
```

El `HashMap` associa cada valor amb les voltes que ha aparegut. `getOrDefault(e, 0)` torna el compte actual (o 0 si és la primera volta). Si encara no has arribat al límit, afegixes l'element i puges el comptador. És la combinació perfecta de llistes (el resultat) i mapes (el compte).

</details>

---

### 4. Array.diff

Et donen dos arrays. Torna el primer array amb tots els valors que estaven en el segon **eliminats**.

**Exemple:** `[1, 2, 2, 2, 3]` i `[2]` → `[1, 3]`, i `[1, 2, 3]` i `[1, 2]` → `[3]`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/523f5d21c841566fde000009)
- Dificultat: 6 kyu

<details>
<summary>💡 Pista</summary>

Convertix el segon array en un `HashSet<Integer>` i recorre el primer amb un `for-each`: només afig al resultat els elements que `set.contains(...)` diga que NO estan.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.*;

public class Kata {
    public static int[] arrayDiff(int[] a, int[] b) {
        Set<Integer> aBorrar = new HashSet<>();
        for (int x : b) {
            aBorrar.add(x);
        }

        List<Integer> resultado = new ArrayList<>();
        for (int x : a) {
            if (!aBorrar.contains(x)) {
                resultado.add(x);
            }
        }

        int[] arr = new int[resultado.size()];
        for (int i = 0; i < arr.length; i++) {
            arr[i] = resultado.get(i);
        }
        return arr;
    }
}
```

El `HashSet` convertix la cerca en O(1): preguntar "està este número per a esborrar?" és instantani encara que `b` siga enorme. Amb un array al seu lloc, cada `contains` seria un recorregut lineal complet. Per això esta kata es resol amb col·leccions, no amb més arrays.

</details>

---

## AceptaElReto

### 5. 158 — Els salts de Mario

Mario es troba sobre un mur i ha de saltar a una sèrie de murs successius. Compta **quants salts són cap amunt** (el mur següent està més alt) i **quants cap avall** (el mur següent està més baix). Si dos murs tenen la mateixa altura, el salt no és ni amunt ni avall.

**Entrada:** diversos casos de prova. Cada cas comença amb el nombre de murs `n`, seguit de `n` altures. Mario es troba sobre el primer.

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=158)
- Dificultat: ⭐⭐

<details>
<summary>💡 Pista</summary>

Guarda les altures en un `ArrayList<Integer>` i recorre amb un for clàssic des de l'índex 1: compara `alturas.get(i)` amb `alturas.get(i - 1)`. Més alt → puja++; més baix → baixa++.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.ArrayList;
import java.util.Scanner;

public class SaltosDeMario {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int casos = sc.nextInt();
        for (int c = 0; c < casos; c++) {
            int n = sc.nextInt();
            ArrayList<Integer> muros = new ArrayList<>();
            for (int i = 0; i < n; i++) {
                muros.add(sc.nextInt());
            }

            int sube = 0, baja = 0;
            for (int i = 1; i < muros.size(); i++) {
                if (muros.get(i) > muros.get(i - 1)) {
                    sube++;
                } else if (muros.get(i) < muros.get(i - 1)) {
                    baja++;
                }
            }
            System.out.println(sube + " " + baja);
        }
        sc.close();
    }
}
```

La llista guarda totes les altures del cas i el bucle compara cada mur amb l'anterior. Un salt cap amunt és `sube++`; cap avall, `baja++`; si són iguals, no es compta. `ArrayList` amb accés per índex al servei del clàssic de ProgramaMe.

</details>

---

### 6. 168 — La peça perduda

Un puzle té peces numerades de l'1 al `n`, però a la bossa falta una. Et donen el nombre total de peces `n` i els números de totes les que hi havia (no necessàriament en ordre). Digues **quina peça falta**.

**Entrada:** diversos casos. Cada cas: una línia amb `n`, i una altra amb `n - 1` números (els que hi ha a la bossa). L'entrada acaba amb `0`.

**Pista:** la numeració de les peces comença en 1.

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=168)
- Dificultat: ⭐⭐

<details>
<summary>💡 Pista</summary>

Fica tots els números de la bossa en un `HashSet<Integer>` i recorre de l'1 a `n`: la primera peça que no estiga al conjunt és la que falta.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.HashSet;
import java.util.Scanner;

public class PiezaPerdida {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            int n = sc.nextInt();
            if (n == 0) break;

            HashSet<Integer> bolsa = new HashSet<>();
            for (int i = 0; i < n - 1; i++) {
                bolsa.add(sc.nextInt());
            }

            for (int pieza = 1; pieza <= n; pieza++) {
                if (!bolsa.contains(pieza)) {
                    System.out.println(pieza);
                    break;
                }
            }
        }
        sc.close();
    }
}
```

El `HashSet` guarda les `n - 1` peces que hi ha. Després es comprova cada número de l'1 a `n` amb `contains`, que és O(1): la primera peça que no estiga al conjunt és la que falta. Sense ordenar res i sense un sol bucle de cerca lineal.

</details>

---

> 🧭 **I si et quedes amb ganes?** Quan domines llistes, conjunts i iteradors, torna als problemes d'unitats anteriors i resol-los guardant les dades en col·leccions: ja no caldrà demanar-ho tot pel teclat de colp. El material no es perd: es reutilitza.