---
title: "Butlletí U11 — Extres"
description: "CodeWars i AceptaElReto per a anar més enllà dels genèrics i els mapes"
---

# 📝 Butlletí U11 — Extres

> Exercicis de CodeWars i AceptaElReto amb pistes. Les solucions estan amagades: esgota la teua pista abans de mirar-les.

---

## CodeWars

### 1. Counting sheep...

Et donen un array d'ovelles on algunes poden faltar del seu lloc. `true` significa que hi ha ovella present; `null` o `false`, que està buit. Compta quantes ovelles hi ha presents.

**Exemple:** `{true, true, true, false, true, true, true, true, true, false, true, false}` → `11`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/54edbc7200b811e956000556)
- Dificultat: 8 kyu

<details>
<summary>💡 Pista</summary>

Recorre l'array i compta els `true` amb un `if` o amb un for-each. Si el vols esprémer amb la unitat: guarda els presents en un `ArrayList<Boolean>` filtrant els `null`, i al final torna la seua grandària.

</details>

<details>
<summary>🔄 Solució</summary>

```java
public class Counter {
    public int countSheeps(Boolean[] arrayOfSheeps) {
        int ovejas = 0;
        for (Boolean b : arrayOfSheeps) {
            if (b != null && b) {
                ovejas++;
            }
        }
        return ovejas;
    }
}
```

El `b != null && b` és important: la kata fica `null` en l'array i un `boolean` amb valor `null` explotaria si només feres `b == true`. Amb el curtcircuit `&&`, si `b` és `null`, la segona part ni s'avalua.

</details>

---

### 2. Counting Duplicates

Escriu una funció que torne quants caràcters **distints** (lletres i dígits, sense distingir majúscules) apareixen més d'una vegada en una cadena.

**Exemple:** `"abcde"` → `0`, `"aabbcde"` → `2` (a i b), `"indivisibility"` → `1` (la i), `"aA11"` → `2` (a i 1).

- [Enunciat en CodeWars](https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1)
- Dificultat: 6 kyu

<details>
<summary>💡 Pista</summary>

Usa un `HashMap<Character, Integer>` per a comptar quantes vegades apareix cada caràcter (amb `toLowerCase()` primer i `getOrDefault` en comptar). Després compta quantes claus tenen un valor major que 1.

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

Dos passades sobre el mateix mapa: primer es compten freqüències amb `getOrDefault` (el patró estrella de la unitat), i després es recorren els **valors** amb `values()` comptant quants superen 1. `toLowerCase()` unifica 'A' i 'a'. Este és l'ús de mapa més típic que existix en les katas.

</details>

---

### 3. Find the unique number

Tens un array de números on tots són iguals excepte un. Troba el número únic.

**Exemple:** `[ 1, 1, 1, 2, 1, 1 ]` → `2`, i `[ 0, 0, 0.55, 0, 0 ]` → `0.55`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/585d7d5adb20cf33cb000235)
- Dificultat: 6 kyu

<details>
<summary>💡 Pista</summary>

Compta les aparicions de cada número amb un `HashMap<Double, Integer>`. Després recorre `entrySet()` i torna la clau el valor de la qual siga 1. Alternativa tramposa: mira els tres primers números per a saber quin és el repetit.

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

El `HashMap` agrupa per valor: tots els repetits cauen en una clau amb comptador alt i l'únic solitari té comptador 1. Recórrer `entrySet()` i tornar la clau amb `getValue() == 1` és directe. L'alternativa (comparar els tres primers) evita el mapa, però esta versió t'entrena en freqüències, que és just el que toca esta unitat.

</details>

---

### 4. Who likes it?

Implementa la funció `likes` que rep un array de noms de gent a la qual li agrada un ítem i torna el text de la forma:

- `[]` → `"no one likes this"`
- `["Peter"]` → `"Peter likes this"`
- `["Jacob", "Alex"]` → `"Jacob and Alex like this"`
- `["Max", "John", "Mark"]` → `"Max, John and Mark like this"`
- `["Alex", "Jacob", "Mark", "Max"]` → `"Alex, Jacob and 2 others like this"`

- [Enunciat en CodeWars](https://www.codewars.com/kata/5266876b8f4bf2da9b000362)
- Dificultat: 6 kyu

<details>
<summary>💡 Pista</summary>

Cada grandària d'array té la seua plantilla. Guarda les plantilles en un `Map<Integer, String>` on la clau és el nombre de noms i el valor la plantilla amb `%s`. Després usa `String.format()` per a omplir-la.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.HashMap;
import java.util.Map;

public class Solution {
    public static String whoLikesIt(String... names) {
        int n = names.length;
        String texto;

        switch (n) {
            case 0:  texto = "no one likes this"; break;
            case 1:  texto = names[0] + " likes this"; break;
            case 2:  texto = names[0] + " and " + names[1] + " like this"; break;
            case 3:  texto = names[0] + ", " + names[1] + " and " + names[2] + " like this"; break;
            default: texto = names[0] + ", " + names[1] + " and " + (n - 2) + " others like this"; break;
        }
        return texto;
    }
}
```

I la versió amb mapes (la que demana la pista):

```java
import java.util.HashMap;
import java.util.Map;

public class Solution {
    public static String whoLikesIt(String... names) {
        int n = names.length;
        Map<Integer, String> plantillas = new HashMap<>();
        plantillas.put(0, "no one likes this");
        plantillas.put(1, "%s likes this");
        plantillas.put(2, "%s and %s like this");
        plantillas.put(3, "%s, %s and %s like this");

        if (n <= 3) {
            return String.format(plantillas.get(n), (Object[]) names);
        }
        return names[0] + ", " + names[1] + " and " + (n - 2) + " others like this";
    }
}
```

El `Map<Integer, String>` associa cada grandària amb la seua plantilla, i `String.format` ompli els `%s`. La clau és la grandària de l'array: un cas perfecte de "associar una dada amb una altra", que és la definició mateixa d'un mapa.

</details>

---

## AceptaElReto

### 5. 152 — Va de modes...

Donat un conjunt de números, la **moda** és el valor (o valors) que més es repetix. Et demanen calcular la moda de cada distribució.

**Entrada:** diversos casos de prova. Cada cas comença amb un número que indica quants valors té el conjunt (mai major de 25.000). En la següent línia es donen els valors separats per espais. L'entrada acaba quan el primer número és 0.

**Eixida:** per a cada cas, la moda (es garantix que només n'hi ha una).

**Exemple:** `1 2 2 3 3 3 4 4 4 4 5` → `4`, i `1 8 9 6 3 2 1 5 4 7 9 6 3 2 1 4 7` → `1`.

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=152)
- Dificultat: ⭐⭐

<details>
<summary>💡 Pista</summary>

Compta cada número amb un `HashMap<Integer, Integer>` (el patró `getOrDefault`). Després recorre `entrySet()` guardant el número amb major comptador. No cal ordenar res: el mapa fa el treball.

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

El problema clàssic de les freqüències amb mapa: una passada per a comptar (`getOrDefault`), una altra sobre `entrySet()` per a trobar el màxim. Com es garantix una única moda, no cal gestionar empats. Esta és la plantilla que usaràs en desenes de problemes de concursos.

</details>

---

### 6. 416 — Michael J. Fox i el Pato Donald

En un grup de persones, cal comprovar si **dos persones compleixen anys el mateix dia**. Et donen les dates de naixement de cada una en format `dia/mes/any`.

**Entrada:** diversos casos de prova en dos línies cada un. La primera línia té el nombre de persones del grup; la segona, les seues dates de naixement separades per espais. L'entrada acaba amb un `0`.

**Eixida:** `SI` si hi ha algun aniversari repetit (mateix dia i mes) i `NO` en cas contrari.

**Exemple:** `9/6/1961 22/10/1938 31/5/1961 20/4/1964` → `NO`, i `9/6/1961 22/10/1938 31/5/1961 20/4/1964 9/6/1934` → `SI`.

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=416)
- Dificultat: ⭐⭐

<details>
<summary>💡 Pista</summary>

Fica cada data en un `HashSet<String>`. Si `add` torna `false`, eixa data ja estava: n'hi ha de repetida. Recorda que l'any no compta: retalla la data en `dia/mes` amb `split("/")`.

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

El truc del `HashSet`: `add()` torna `false` si l'element ja estava, així que no necessites `contains` per separat. Es guarda només `dia/mes` (sense l'any) perquè dos persones compleixen el mateix dia encara que hagen nascut en anys diferents. Detectar duplicats en O(1) és el superpoder del Set, germà xicotet del mapa d'esta unitat.

</details>

---

> 🧭 **I si et quedes amb ganes?** Quan domines genèrics i mapes, torna als problemes d'unitats anteriors i reescriu-los amb `HashMap` i classes genèriques: el comptador de notes, el buscador de noms... Tot el que abans era un array paral·lel ara és un mapa. El material no es perd: es reutilitza.