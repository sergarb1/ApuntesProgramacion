---
title: "Butlletí U09 — Extres"
description: "CodeWars i AceptaElReto per a anar més enllà de la unitat"
---

# 📝 Butlletí U09 — Extres

> Exercicis de CodeWars i AceptaElReto amb pistes. Les solucions estan amagades: esgota la teua pista abans de mirar-les.

---

## CodeWars

### 1. Mexican Wave

Et donen una cadena. Has de tornar un array de cadenes on cada una té una sola lletra en majúscula: la de la posició `i`, avançant d'esquerra a dreta. Els espais se salten (no generen versió pròpia, però no canvien l'índex).

**Exemple:** `"gap"` → `["Gap", "gAp", "gaP"]`, i `"hello"` → `["Hello", "hEllo", "heLlo", "helLo", "hellO"]`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/58f5c63f1e26ecda7e000029)
- Dificultat: 6 kyu

<details>
<summary>💡 Pista</summary>

Recorre la cadena caràcter a caràcter amb un `for`. Si el caràcter és un espai, `continue`. Si no, construïx la versió en ona: `texto.substring(0, i) + Character.toUpperCase(c) + texto.substring(i + 1)`.

</details>

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static String[] wave(String str) {
        java.util.List<String> resultado = new java.util.ArrayList<>();
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            if (c == ' ') {
                continue;
            }
            String ola = str.substring(0, i) + Character.toUpperCase(c) + str.substring(i + 1);
            resultado.add(ola);
        }
        return resultado.toArray(new String[0]);
    }
}
```

L'ona es construïx amb tres trossos: l'anterior, la lletra en majúscula i el posterior. Els espais se salten però no desplacen l'índex, així que `"two words"` produïx una ona per lletra, no per paraula.

</details>

---

### 2. Delete occurrences of an element if it occurs more than n times

Et donen una llista d'enters i un límit `n`. Torna una nova llista amb els mateixos elements, però cada valor només pot aparéixer com a màxim `n` voltes (es conserven les primeres `n` aparicions).

**Exemple:** `[1, 2, 3, 1, 2, 1, 2, 3]` amb `n = 2` → `[1, 2, 3, 1, 2, 3]`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/554ca54ffa7d91b236000023)
- Dificultat: 6 kyu

<details>
<summary>💡 Pista</summary>

Usa un `HashMap<Integer, Integer>` (el veuràs en la U10, però ja pots usar-lo) per a portar el compte de quantes voltes ha aparegut cada valor. Només afig l'element a la resposta si el seu comptador encara no ha arribat a `n`.

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

El `HashMap` associa cada valor amb les voltes que ha aparegut. `getOrDefault(e, 0)` torna el compte actual (o 0 si és la primera volta). Si encara no has arribat al límit, afegixes l'element i puges el comptador. És la combinació perfecta d'arrays (recorregut) i col·leccions (el compte).

</details>

---

### 3. Roman Numerals Encoder

Crea una funció que convertisca un número positiu (1 a 3999) en la seua representació en **nombres romans**.

**Exemple:** `182` → `"CLXXXII"`, `1990` → `"MCMXC"`, `1666` → `"MDCLXVI"`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/51b62bf6a9c58071c600002b)
- Dificultat: 6 kyu

<details>
<summary>💡 Pista</summary>

Prepara dos arrays paral·lels: els valors `{1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1}` i els seus símbols `{"M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"}`. Recórre'ls en ordre descendent i, mentre el número arribe al valor, resta i afig el símbol.

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

El truc està en els símbols compostos (`CM` = 900, `IV` = 4): sense ells, no podries representar els residus del 4 i el 9. El `while` va restant el valor màxim possible amb cada símbol. És un clàssic d'arrays paral·lels.

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

### 5. 102 — Encriptació de missatges

Un missatge s'encripta desplaçant cada lletra un número fix de posicions en l'alfabet (xifrat Cèsar). Has d'implementar el programa que, donat un desplaçament i un text, torne el missatge encriptat, **envoltant al final de l'alfabet** (si et passes de la Z, tornes a la A).

**Entrada:** diversos casos. Cada cas: una línia amb el desplaçament seguit del text entre cometes. L'entrada acaba amb una línia amb `0` i un text buit.

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=102)
- Dificultat: ⭐⭐

<details>
<summary>💡 Pista</summary>

Convertix cada lletra a la seua posició amb `c - 'A'`, suma-li el desplaçament, aplica `% 26` per al wrap-around i torna a `char` amb `(char) ('A' + pos)`. Vigila que només encriptes lletres, no espais ni signes.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class Encriptacion {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (sc.hasNextInt()) {
            int desplazamiento = sc.nextInt();
            String texto = sc.nextLine().trim();
            if (desplazamiento == 0 && texto.isEmpty()) break;

            StringBuilder resultado = new StringBuilder();
            for (int i = 0; i < texto.length(); i++) {
                char c = texto.charAt(i);
                if (c >= 'A' && c <= 'Z') {
                    int pos = (c - 'A' + desplazamiento) % 26;
                    resultado.append((char) ('A' + pos));
                } else {
                    resultado.append(c);
                }
            }
            System.out.println(resultado);
        }
        sc.close();
    }
}
```

El wrap-around el fa el `% 26`: si estàs a la Z (pos 25) i sumes 3, `(25 + 3) % 26 = 2`, que és la C. Les lletres es tracten per separat dels espais i signes. La condició d'eixida usa el cas especial d'AceptaElReto: desplaçament 0 i text buit.

</details>

---

### 6. 341 — Matriu identitat

Una **matriu identitat** té uns a la diagonal principal i zeros a la resta. Donada la grandària d'una matriu i els seus valors, has de dir si és identitat o no.

**Entrada:** diversos casos. Cada cas: una línia amb la grandària `n`, seguida de `n` línies amb els `n` valors de cada fila. L'entrada acaba amb `0`.

**Exemple:**

```
2
1 0
0 1
3
1 0 0
0 1 0
0 0 1
0
```

**Eixida:**

```
SI
SI
```

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=341)
- Dificultat: ⭐⭐

<details>
<summary>💡 Pista</summary>

Recorre tota la matriu amb dos bucles i comprova: si `fila == columna` ha de valer 1, si no, ha de valer 0. En el moment que trobes un valor que no complixca la seua regla, el cas és "NO". Una matriu identitat de grandària 1 (només un `1`) també és identitat.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class MatrizIdentidad {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            int n = sc.nextInt();
            if (n == 0) break;

            int[][] matriz = new int[n][n];
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < n; j++) {
                    matriz[i][j] = sc.nextInt();
                }
            }

            boolean esIdentidad = true;
            for (int i = 0; i < n && esIdentidad; i++) {
                for (int j = 0; j < n; j++) {
                    if ((i == j && matriz[i][j] != 1) || (i != j && matriz[i][j] != 0)) {
                        esIdentidad = false;
                        break;
                    }
                }
            }

            System.out.println(esIdentidad ? "SI" : "NO");
        }
        sc.close();
    }
}
```

La condició del `if` resumix tota la regla en una línia: a la diagonal (`i == j`) exigixes 1, fora d'ella exigixes 0. En el moment que falla una casella, `esIdentidad = false` i el `break` talla el bucle interior; el `&& esIdentidad` de l'exterior talla també el de fora. Arrays 2D + bucles niats al servei del problema.

</details>

---

> 🧭 **I si et quedes amb ganes?** Quan domines arrays i col·leccions, torna als problemes d'unitats anteriors i resol-los guardant les dades en estructures: ja no caldrà demanar-ho tot pel teclat de colp. El material no es perd: es reutilitza.