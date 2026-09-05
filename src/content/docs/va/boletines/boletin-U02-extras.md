---
title: Butlletí U02 — Extres
description: CodeWars i AceptaElReto per a anar més enllà de la unitat
---

# 📝 Butlletí U02 — Extres

> Exercicis de CodeWars i AceptaElReto amb pistes. La solució està oculta: resisteix-te fins a esgotar la teua pista.

---

## CodeWars

### 1. Keep Hydrated!

Nathan beu aigua, però no sempre prou. Li han donat `time` en hores i vol saber quants litres d'aigua ha de beure. La regla: beu 0.5 litres per hora. Retorna el nombre de litres **redonit cap avall**.

**Exemple:** amb `time = 6.7`, beu `3` litres (3.35 → 3).

- [Enunciat en CodeWars](https://www.codewars.com/kata/582cb0224e56e068d2000030)
- Dificultat: 8 kyu

**Pista:** multiplica `time * 0.5` i trunca el resultat amb `(int)`. El truncament i el "redoniment cap avall" són el mateix ací... per una volta.

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static int Liters(double time) {
        return (int) (time * 0.5);
    }
}
```

`6.7 * 0.5 = 3.35`, i `(int)` trunca a 3. El truncament del casting és exactament el "redoniment cap avall" que demana l'enunciat.

</details>

---

### 2. Opposite number

Escriu una funció que reba un nombre i retorne el seu oposat (el mateix nombre amb el signe canviat).

**Exemples:** `1` → `-1`, `14` → `-14`, `-34` → `34`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/56dec885c54a926dcd001095)
- Dificultat: 8 kyu

**Pista:** l'operador unari `-` invertix el signe de qualsevol nombre: `-numero`. O multiplica'l per `-1`.

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static int opposite(int number) {
        return -number;
    }
}
```

L'operador unari `-` del punt 3 invertix el signe. Un sol caràcter i el problema està resolt.

</details>

---

### 3. MakeUpperCase

Escriu una funció que convertisca un String a majúscules.

**Exemple:** `"hello"` → `"HELLO"`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/57a0556c7cb1f31ab3000ad7)
- Dificultat: 8 kyu

**Pista:** recordes el mètode de `String` del punt 8 que posa tot en majúscules? És la primera ferramenta de la caixa.

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static String makeUpperCase(String str) {
        return str.toUpperCase();
    }
}
```

`toUpperCase()` del punt 8. Directe de la caixa de ferramentes.

</details>

---

### 4. Count of positives / sum of negatives

Donat un array d'enters, retorna un array de dos elements: el **nombre de números positius** en el primer forat i la **suma dels negatius** en el segon. Si l'array està buit, retorna un array buit.

**Exemple:** `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, -11, -12, -13, -14, -15]` → `[10, -65]`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/571effabb625ed9b0600107a)
- Dificultat: 7 kyu

**Pista:** no cal ni bucles fins que arribes a la U04, però pots declarar `int[] resultat = new int[2];` i usar un bucle `for...each` (ja l'has vist en classe) per a comptar positius i sumar negatius amb `if`. Ací l'important és recordar com accedir als forats d'un array.

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static int[] countPositivesSumNegatives(int[] input) {
        if (input == null || input.length == 0) {
            return new int[0];
        }

        int positius = 0;
        int sumaNegatius = 0;

        for (int numero : input) {
            if (numero > 0) {
                positius++;
            } else if (numero < 0) {
                sumaNegatius += numero;
            }
        }

        return new int[]{positius, sumaNegatius};
    }
}
```

El comptador usa `++`, la suma acumulada usa `+=`, i el `if` decidix amb operadors relacionals. Un repàs perfecte de la unitat (el `for...each` complet el veuràs en la U04).

</details>

---

### 5. Get the Middle Character

Donada una paraula, retorna el caràcter (o els dos caràcters) del centre.

**Exemples:** `"test"` → `"es"`, `"testing"` → `"t"`, `"middle"` → `"dd"`, `"A"` → `"A"`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/56747fd5cb988479af000028)
- Dificultat: 7 kyu

**Pista:** usa `length()` i `substring()` del punt 9. Si la longitud és parell, retorna els dos caràcters centrals; si és senar, només un.

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static String getMiddle(String word) {
        int longitud = word.length();
        int mig = longitud / 2;

        if (longitud % 2 == 0) {
            return word.substring(mig - 1, mig + 1);
        }
        return word.substring(mig, mig + 1);
    }
}
```

`longitud / 2` et dona el centre. Si la longitud és parell, el centre està repartit entre dos lletres (`"test"` → mig 2 → `substring(1, 3)` = `"es"`); si és senar, el centre és una sola lletra. `%` per a saber si és parell o senar, `length` per a mesurar i `substring` per a tallar: el trio de ferramentes d'esta unitat.

</details>

---

## AceptaElReto

### 6. 148 — Cap d'any

El 31 de desembre, els més impacients miren el rellotge i conten quants segons falten per a les 12 de la nit. Donat un instant amb format `HH:MM:SS`, calcula els segons que falten per a mitjanit.

**Entrada:** un nombre amb el total de casos, i en cada línia una hora amb format `HH:MM:SS` (amb dos dígits per camp, però els zeros a l'esquerra poden ometre's).

**Exemple:**

```
3
00:00:00
23:59:59
05:30:00
```

**Eixida:**

```
86400
1
66600
```

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=148)
- Dificultat: Fàcil

**Pista:** el dia té 86400 segons. Convertix l'hora a segons totals (`hora * 3600 + minut * 60 + segon`) i resta-ho de 86400. Per a separar els camps, llig amb `nextInt()` i descarta els dos punts amb `next()`, o usa `Scanner.useDelimiter(":")`. El truc està en `split(":")`... o en llegir directament.

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class CapAny {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int casos = sc.nextInt();

        for (int i = 0; i < casos; i++) {
            String hora = sc.next();
            String[] parts = hora.split(":");
            int h = Integer.parseInt(parts[0]);
            int m = Integer.parseInt(parts[1]);
            int s = Integer.parseInt(parts[2]);

            int segonsTranscorreguts = h * 3600 + m * 60 + s;
            int segonsFalten = 86400 - segonsTranscorreguts;
            System.out.println(segonsFalten);
        }
        sc.close();
    }
}
```

Lectura alternativa sense `split`: declarar el `Scanner` amb `useDelimiter("\\s*:\\s*")` i llegir tres `nextInt()` seguits. La lògica és la mateixa: hora a segons, resta-ho de 86400 (els segons que té el dia). Per a `00:00:00` falten 86400; per a `23:59:59`, 1. Pura aritmètica de la unitat.

</details>

---

### 7. 217 — Quin costat del carrer?

En el carrer principal de Donya Lita les cases es distribuïxen en dos costats: els números senars van en un costat i els parells en l'altre. Donat un número de casa, digues en quin costat està.

**Entrada:** el número 0 indica la fi de l'entrada (no cal processar-lo). Per a cada número de casa (positiu), mostra:

```
ESQUERRA
```

o

```
DRETA
```

segons corresponga. El criteri és simple: un número de casa és `ESQUERRA` si és parell i `DRETA` si és senar (o al revés, segons el carrer; llig bé l'enunciat original).

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=217)
- Dificultat: Fàcil

**Pista:** quin operador et diu si un nombre és parell o senar? El `%` del punt 3. El bucle acaba quan lliges un 0, amb un `while`.

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class CostatCarrer {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int numero = sc.nextInt();

        while (numero != 0) {
            String costat = numero % 2 == 0 ? "ESQUERRA" : "DRETA";
            System.out.println(costat);
            numero = sc.nextInt();
        }
        sc.close();
    }
}
```

L'operador mòdul `%` decidix: reste 0 és parell, reste 1 és senar. El `while` repetix fins a llegir el 0 sentinella. La lògica sencera del problema és un sol ternari.

</details>

---

> 🧭 **I si et quedes amb ganes?** Quan domines les estructures de control (U03) podràs tornar a estos problemes amb `for` i `switch` per a fer solucions més elegants. El material no es perd: es reutilitza.