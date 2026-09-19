---
title: "Butlletí U11 — Extres"
description: "CodeWars i AceptaElReto per a anar més enllà de les col·leccions, els genèrics i els mapes"
---

# 📝 Butlletí U11 — Extres

> Exercicis de CodeWars i AceptaElReto amb pistes. Les solucions estan amagades: agota la teua pista abans de mirar-les.

---

## CodeWars

### 1. Convert a string to an array

Et donen una cadena de text separada per espais. Escriu una funció que la dividisca i torne un array de paraules.

**Exemple:** `"Robin Singh"` → `["Robin", "Singh"]`, i `"I love arrays they are my favorite"` → `["I", "love", "arrays", "they", "are", "my", "favorite"]`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/57e76bc428d6fbc2d500036d)
- Dificultat: 8 kyu

<details>
<summary>💡 Pista</summary>

El mètode `String.split(" ")` ja et torna un `String[]`. Però com que estem en la unitat de col·leccions: converteix-lo en una `List<String>` amb `Arrays.asList(...)` o guarda les paraules amb un bucle en un `ArrayList<String>`.

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

`split(" ")` parteix la cadena pels espais i torna un array. La versió amb `ArrayList` recorre eixe array i construïx la llista: el mateix datum, vist des de la unitat de col·leccions.

</details>

---

### 2. Counting Duplicates

Escriu una funció que torne quants caràcters **distints** (lletres i dígits, sense distingir majúscules) apareixen més d'una vegada en una cadena.

**Exemple:** `"abcde"` → `0`, `"aabbcde"` → `2` (a i b), `"indivisibility"` → `1` (la i), `"aA11"` → `2` (a i 1).

- [Enunciat en CodeWars](https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1)
- Dificultat: 6 kyu

<details>
<summary>💡 Pista</summary>

Usa un `HashMap<Character, Integer>` per a contar quantes vegades apareix cada caràcter (amb `toLowerCase()` primer i `getOrDefault` al comptar). Després conta quantes claus tenen un valor major que 1.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.HashMap;
import java.util.Map;

public class CountingDuplicates {
    public static int duplicateCount(String text) {
        HashMap<Character, Integer> contador = new HashMap<>();
        for (char c : text.toLowerCase().toCharArray()) {
            contador.put(c, contador.getOrDefault(c, 0) + 1);
        }

        int repetidos = 0;
        for (int veces : contador.values()) {
            if (veces > 1) {
                repetidos++;
            }
        }
        return repetidos;
    }
}
```

Dos passades sobre el mateix mapa: primer es compten freqüències amb `getOrDefault` (el patró estrella de la unitat), i després es recorren els **valors** amb `values()` comptant quants superen 1. `toLowerCase()` unifica 'A' i 'a'. Este és l'ús de mapa més típic que existeix en les kates.

</details>

---

### 3. Find the unique number

Tens un array de números on tots són iguals excepte un. Troba el número únic.

**Exemple:** `[ 1, 1, 1, 2, 1, 1 ]` → `2`, i `[ 0, 0, 0.55, 0, 0 ]` → `0.55`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/585d7d5adb20cf33cb000235)
- Dificultat: 6 kyu

<details>
<summary>💡 Pista</summary>

Conta les aparicions de cada número amb un `HashMap<Double, Integer>`. Després recorre `entrySet()` i torna la clau el valor de la qual siga 1. Alternativa tramposa: mira els tres primers números per a saber quin és el repetit.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.HashMap;
import java.util.Map;

public class Kata {
    public static double findUniq(double[] arr) {
        HashMap<Double, Integer> contador = new HashMap<>();
        for (double d : arr) {
            contador.put(d, contador.getOrDefault(d, 0) + 1);
        }

        for (Map.Entry<Double, Integer> e : contador.entrySet()) {
            if (e.getValue() == 1) {
                return e.getKey();
            }
        }
        return -1;
    }
}
```

El `HashMap` agrupa per valor: tots els repetits cauen en una clau amb comptador alt i l'únic solitari té comptador 1. Recórrer `entrySet()` i tornar la clau amb `getValue() == 1` és directe. La pista alternativa (comparar els tres primers) evita el mapa, però esta versió t'entrena en freqüències, que és just el que toca esta unitat.

</details>

---

## AceptaElReto

### 4. 152 — Va de modes...

Donat un conjunt de números, la **moda** és el valor (o valors) que més es repetix. Et demanen calcular la moda de cada distribució.

**Entrada:** diversos casos de prova. Cada cas comença amb un número que indica quants valors té el conjunt (mai major de 25.000). En la següent línia es donen els valors separats per espais. L'entrada acaba quan el primer número és 0.

**Eixida:** per a cada cas, la moda (es garanteix que només n'hi ha una).

**Exemple:** `1 2 2 3 3 3 4 4 4 4 5` → `4`, i `1 8 9 6 3 2 1 5 4 7 9 6 3 2 1 4 7` → `1`.

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=152)
- Dificultat: ⭐⭐

<details>
<summary>💡 Pista</summary>

Conta cada número amb un `HashMap<Integer, Integer>` (el patró `getOrDefault`). Després recorre `entrySet()` guardant el número amb major comptador. No cal ordenar res: el mapa fa la feina.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class VaDeModas {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            int n = sc.nextInt();
            if (n == 0) break;

            HashMap<Integer, Integer> frec = new HashMap<>();
            for (int i = 0; i < n; i++) {
                int valor = sc.nextInt();
                frec.put(valor, frec.getOrDefault(valor, 0) + 1);
            }

            int moda = 0, maxVeces = 0;
            for (Map.Entry<Integer, Integer> e : frec.entrySet()) {
                if (e.getValue() > maxVeces) {
                    maxVeces = e.getValue();
                    moda = e.getKey();
                }
            }
            System.out.println(moda);
        }
        sc.close();
    }
}
```

El problema clàssic de les freqüències amb mapa: una passada per a contar (`getOrDefault`), una altra sobre `entrySet()` per a trobar el màxim. Com que es garanteix una única moda, no cal gestionar empats. Esta és la plantilla que usaràs en desenes de problemes de concursos.

</details>

---

### 5. 416 — Michael J. Fox i el Pato Donald

En un grup de persones, cal comprovar si **dues persones fan els anys el mateix dia**. Et donen les dates de naixement de cada una en format `dia/mes/any`.

**Entrada:** diversos casos de prova en dues línies cada un. La primera línia té el nombre de persones del grup; la segona, les seues dates de naixement separades per espais. L'entrada acaba amb un `0`.

**Eixida:** `SI` si hi ha algun aniversari repetit (mateix dia i mes) i `NO` en cas contrari.

**Exemple:** `9/6/1961 22/10/1938 31/5/1961 20/4/1964` → `NO`, i `9/6/1961 22/10/1938 31/5/1961 20/4/1964 9/6/1934` → `SI`.

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=416)
- Dificultat: ⭐⭐

<details>
<summary>💡 Pista</summary>

Fica cada data en un `HashSet<String>`. Si `add` torna `false`, eixa data ja hi era: n'hi ha de repetida. Recorda que l'any no compta: talla la data en `dia/mes` amb `split("/")`.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.HashSet;
import java.util.Scanner;

public class Cumpleanos {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            int n = sc.nextInt();
            if (n == 0) break;

            HashSet<String> fechas = new HashSet<>();
            boolean repetido = false;

            for (int i = 0; i < n; i++) {
                String fecha = sc.next();
                String diaMes = fecha.split("/")[0] + "/" + fecha.split("/")[1];
                if (!fechas.add(diaMes)) {
                    repetido = true;
                }
            }
            System.out.println(repetido ? "SI" : "NO");
        }
        sc.close();
    }
}
```

El truc del `HashSet`: `add()` torna `false` si l'element ja hi era, així que no necessites `contains` per separat. Es guarda només `dia/mes` (sense l'any) perquè dues persones fan els anys el mateix dia encara que hagin nascut en anys distints. Detectar duplicats en O(1) és el superpoder del Set, germà menut del mapa d'esta unitat.

</details>

---

> 🧭 **I si et quedes amb ganes?** Quan domines llistes, conjunts, genèrics i mapes, torna als problemes de unitats anteriors i resol-los guardant les dades en col·leccions: el comptador de notes, el buscador de noms... Tot el que abans era un array paral·lel ara és un mapa. El material no es perd: es reutilitza.
