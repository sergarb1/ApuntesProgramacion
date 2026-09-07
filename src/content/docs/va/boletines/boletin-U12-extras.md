---
title: "Butlletí U12 — Extres"
description: "CodeWars i AceptaElReto per a anar més enllà de la programació funcional"
---

# 📝 Butlletí U12 — Extres

> Exercicis de CodeWars i AceptaElReto amb pistes. Les solucions estan amagades: esgota la teua pista abans de mirar-les.

---

## CodeWars

### 1. Enumerable Magic #1 - True for All?

Implementa la funció `all`: rep una llista i un `Predicate`, i torna `true` si el predicat és verdader per a **tots** els elements. Si la llista està buida, torna `true` (res no ha fallat la prova).

**Exemple:** `all([1, 2, 3, 4, 5], x -> x < 9)` → `true`, i `all([1, 2, 3, 4, 5], x -> x > 9)` → `false`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/54598d1fcbae2ae05200112c)
- Dificultat: 8 kyu

<details>
<summary>💡 Pista</summary>

Un `Stream` té l'operació terminal `allMatch(Predicate)` que fa exactament això: torna `true` si tots els elements complixen el predicat. I amb la llista buida ja torna `true` per si sola. Una sola línia de stream.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.List;
import java.util.function.Predicate;

public class Solution {
    public static boolean all(List<Integer> list, Predicate<Integer> predicate) {
        return list.stream().allMatch(predicate);
    }
}
```

`allMatch` és la terminal dels quantificadors: comprova si tots els elements complixen el predicat (l'`all` que demana la kata). El `Stream` fa el recorregut per tu, i el cas de la llista buida està resolt per disseny: si no hi ha elements, tècnicament cap no falla, així que torna `true`. És la versió funcional del "recorre i comprova".

</details>

---

### 2. Sorted? yes? no? how?

Reps un array de números. Torna `"yes, ascending"` si està ordenat de menor a major, `"yes, descending"` si està de major a menor, i `"no"` si no està ordenat.

**Exemple:** `[1, 2]` → `"yes, ascending"`, `[15, 7, 3]` → `"yes, descending"`, `[4, 2, 30]` → `"no"`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/580a4734d6df748060000045)
- Dificultat: 7 kyu

<details>
<summary>💡 Pista</summary>

Un array ordenat de menor a major complix que cada element és menor o igual que el següent. Això és un `allMatch` sobre les parelles consecutives: `IntStream.range(0, array.length - 1).allMatch(i -> array[i] <= array[i + 1])`. Fes el mateix per a l'ordre descendent.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.stream.IntStream;

public class Kata {
    public static String isSortedAndHow(int[] array) {
        boolean ascendente = IntStream.range(0, array.length - 1)
            .allMatch(i -> array[i] <= array[i + 1]);
        boolean descendente = IntStream.range(0, array.length - 1)
            .allMatch(i -> array[i] >= array[i + 1]);

        if (ascendente) return "yes, ascending";
        if (descendente) return "yes, descending";
        return "no";
    }
}
```

`IntStream.range(0, array.length - 1)` genera els índexs de 0 a n-2: cada un apunta a l'inici d'una parella `(array[i], array[i + 1])`. `allMatch` comprova que totes les parelles respecten l'ordre. És "ordenat" si totes les parelles van en la mateixa direcció. Un array d'un sol element complix les dos condicions alhora (no hi ha parelles), i l'`if` ascendent guanya: és correcte, un element està "ascendent".

</details>

---

### 3. Sum of odd numbers

Donat el triangle de números imparells consecutius:

```
             1
          3     5
       7     9    11
   13    15    17    19
21    23    25    27    29
```

Torna la suma de la fila `n` (començant per 1). **Exemple:** `n=1` → `1`, `n=2` → `8`, `n=3` → `27`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/55fd2d567d94ac3bc9000064)
- Dificultat: 7 kyu

<details>
<summary>💡 Pista</summary>

El primer número de la fila `n` és `n * n - n + 1` (fila 3: 9 - 3 + 1 = 7). Després hi ha `n` imparells consecutius, separats de 2 en 2. Genera la fila amb `IntStream.range(0, n).map(i -> primer + 2 * i)` i suma-los amb `.sum()`.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.stream.IntStream;

public class Kata {
    public static int rowSumOddNumbers(int n) {
        int primerImpar = n * n - n + 1;
        return IntStream.range(0, n)
            .map(i -> primerImpar + 2 * i)
            .sum();
    }
}
```

`IntStream.range(0, n)` genera els `n` números de la fila i `map` els convertix en imparells consecutius des de `primerImpar` (fila 3: 7, 9, 11). `.sum()` és la terminal que suma un `IntStream`. El resultat coincidix amb `n * n * n` (¡la suma de la fila n és sempre el cub de n!), però esta versió t'entrena a construir i sumar streams, que és el que toca la unitat.

</details>

---

### 4. Two Oldest Ages

Implementa `twoOldestAges`: rep un array d'edats (sempre amb almenys 2 elements) i torna un array amb les **dos edats més altes**, en el format `[segona més alta, la més alta]`.

**Exemple:** `[1, 2, 10, 8]` → `[8, 10]`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/511f11d355fe575d2c000001)
- Dificultat: 7 kyu

<details>
<summary>💡 Pista</summary>

Ordena l'array de menor a major amb `Arrays.stream(ages).sorted()` i salta't tots menys els dos últims: `skip(ages.length - 2)`. El stream resultant té exactament les dos edats més altes en l'ordre demanat. Recull amb `.toArray()`.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Arrays;

public class Kata {
    public static int[] twoOldestAges(int[] ages) {
        return Arrays.stream(ages)
            .sorted()
            .skip(ages.length - 2)
            .toArray();
    }
}
```

`Arrays.stream(ages)` convertix l'array en un `IntStream`, `sorted()` l'ordena de menor a major, i `skip(ages.length - 2)` se salta tots els elements menys els dos últims. En estar ordenats, eixos dos últims són la segona més alta i la més alta, en eixe ordre. `.toArray()` recull el flux de tornada en un array. Quatre operacions per a un problema que a mà demanaria dos variables i un bucle.

</details>

---

## AceptaElReto

### 5. 219 — La loteria de la penya Atlètica

La penya atlètica només compra dècims amb **números parells**. Et donen una llista de dècims de cada administració i has de dir quants en pot comprar.

**Entrada:** el primer número indica quants casos de prova hi ha. Cada cas són dos línies: el número de dècims `n` i la llista de `n` números (entre 0 i 99.999).

**Eixida:** per a cada cas, quants dècims són parells.

**Exemple:** `10` i `1 2 3 4 5 6 7 8 9 10` → `5`.

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=219)
- Dificultat: ⭐

<details>
<summary>💡 Pista</summary>

Llig els `n` números en un array i compta els parells amb un stream: `Arrays.stream(decimos).filter(d -> d % 2 == 0).count()`. El `filter` amb un `Predicate` i la terminal `count` és la plantilla de "quants complixen".

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Arrays;
import java.util.Scanner;

public class Loteria {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int casos = sc.nextInt();

        while (casos-- > 0) {
            int n = sc.nextInt();
            int[] decimos = new int[n];
            for (int i = 0; i < n; i++) {
                decimos[i] = sc.nextInt();
            }

            long comprables = Arrays.stream(decimos)
                .filter(d -> d % 2 == 0)
                .count();

            System.out.println(comprables);
        }
        sc.close();
    }
}
```

L'entrada es llig en un array (llegir dins d'una lambda seria un efecte secundari lleig) i el stream fa el treball: `filter(d -> d % 2 == 0)` deixa passar els parells i `count()` els compta. Fixa't que `count()` torna `long`: el problema accepta l'eixida encara que la variable siga `long`. És el mateix patró que `filter(...).count()` de la unitat, aplicat a un problema de concurs real.

</details>

---

### 6. 105 — Vendes

El bar de Javier obri tots els dies menys els dilluns. Apunta la caixa de cada dia de la setmana (dimarts, dimecres, dijous, divendres, dissabte i diumenge). Ha de dir: el **dia de més vendes**, el **dia de menys vendes** (o `EMPATE` si hi ha empat en el màxim o el mínim), i si les **vendes del diumenge superen la mitjana setmanal** (`SI` o `NO`).

**Entrada:** diversos casos de prova. Cada cas són 6 números (les vendes de dimarts a diumenge). El programa acaba quan el primer número del cas és `-1`.

**Eixida:** per a cada cas, `DIA_MAX DIA_MIN SI/NO`.

**Exemple:** `185.50 250.36 163.45 535.20 950.22 450.38` → `SABADO JUEVES SI`.

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=105)
- Dificultat: ⭐⭐

<details>
<summary>💡 Pista</summary>

Guarda els 6 valors en un `double[]`. Amb streams: `Arrays.stream(ventas).max()`, `.min()` i `.average()` et donen les tres dades (totes tornen `OptionalDouble`, aterra amb `orElse(0)`). Per a saber el dia, busca l'índex del màxim/mínim; i compta quants valors coincidixen amb el màxim/mínim: si n'hi ha més d'un, és `EMPATE`.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.*;
import java.util.stream.*;

public class Ventas {
    static final String[] DIAS = {"MARTES", "MIERCOLES", "JUEVES", "VIERNES", "SABADO", "DOMINGO"};

    static int indiceDe(double[] ventas, double valor) {
        return IntStream.range(0, ventas.length)
            .filter(i -> ventas[i] == valor)
            .findFirst()
            .orElse(-1);
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            double[] ventas = new double[6];
            ventas[0] = sc.nextDouble();
            if (ventas[0] == -1) break;
            for (int i = 1; i < 6; i++) {
                ventas[i] = sc.nextDouble();
            }

            double max = Arrays.stream(ventas).max().orElse(0);
            double min = Arrays.stream(ventas).min().orElse(0);
            double media = Arrays.stream(ventas).average().orElse(0);

            long vecesMax = Arrays.stream(ventas).filter(v -> v == max).count();
            long vecesMin = Arrays.stream(ventas).filter(v -> v == min).count();

            String diaMax = vecesMax > 1 ? "EMPATE" : DIAS[indiceDe(ventas, max)];
            String diaMin = vecesMin > 1 ? "EMPATE" : DIAS[indiceDe(ventas, min)];
            String domingo = ventas[5] > media ? "SI" : "NO";

            System.out.println(diaMax + " " + diaMin + " " + domingo);
        }
        sc.close();
    }
}
```

El problema sencer és un desfilament de streams: `max()` i `min()` per als extrems, `average()` per a la mitjana (els tres tornen `OptionalDouble` perquè l'array podria estar buit; `orElse(0)` aterra). El `filter(...).count()` compta quants dies empaten amb el màxim/mínim, i `indiceDe` usa `IntStream.range` + `findFirst` per a localitzar el dia exacte. La mitjana es compara amb les vendes del diumenge (`ventas[5]`, l'últim índex). El `EMPATE` de l'enunciat ix de `vecesMax > 1` / `vecesMin > 1`. Este és el problema de la unitat: quasi tot, amb streams.

</details>

---

> 🧭 **¿I si et quedes amb ganes?** Quan domines lambdes i streams, torna als problemes d'unitats anteriors i reescriu-los amb pipelines: el comptador de freqüències de la U11 amb `groupingBy`, els bucles de la U05 amb `filter` + `reduce`, l'agenda de la U11 amb `Collectors.toMap`... Tot el que abans era un bucle ara és una declaració. El material no es perd: es reutilitza.