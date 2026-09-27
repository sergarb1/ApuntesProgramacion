---
title: Butlletí U05 — Extres
description: CodeWars i AceptaElReto per a anar més enllà de la unitat
---

# 📝 Butlletí U05 — Extres

> Exercicis de CodeWars i AceptaElReto amb pistes. La solució està oculta: resisteix-te fins a esgotar la teua pista.

---

## CodeWars

### 1. L1: Set Alarm

Un booleà `employed` et diu si treballes i un altre, `vacation`, si estàs de vacances. Torna `true` **només** si treballes i no estàs de vacances.

**Exemples:** `setAlarm(true, false)` → `true`, `setAlarm(false, false)` → `false`, `setAlarm(true, true)` → `false`, `setAlarm(false, true)` → `false`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/568dcc3c7f12767a62000038)
- Dificultat: 8 kyu

**Pista:** una sola condició amb `&&` i un `!` davant de les vacances.

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static boolean setAlarm(boolean employed, boolean vacation) {
        return employed && !vacation;
    }
}
```

`employed && !vacation` és la traducció literal de «treballes i no estàs de vacances». Un `return` d'una línia, sense `if`: quan la condició ja és un `boolean`, el ternari o el `if` sobren.

</details>

---

### 2. Beginner Series #2 Clock

El rellotge marca `h` hores, `m` minuts i `s` segons des de la mitjanit. Escribeu el mètode `Past`, que torna eixe temps en **mil·lisegons**.

**Exemples:** `Past(0, 1, 1)` → `61000`, `Past(1, 0, 1)` → `3601000`, `Past(0, 0, 0)` → `0`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/55f9bca8ecaa9eac7100004a)
- Dificultat: 8 kyu

**Pista:** 1 hora = 3.600.000 ms, 1 minut = 60.000 ms i 1 segon = 1.000 ms. Suma les tres parts i multiplica al final.

<details>
<summary>🔄 Solució</summary>

```java
public class Clock {
    public static int Past(int h, int m, int s) {
        return (h * 60 * 60 + m * 60 + s) * 1000;
    }
}
```

`h * 60 * 60 + m * 60 + s` deixa tot en segons dins d'un parèntesi i un sol `* 1000` el converteix a mil·lisegons. El valor màxim possible (23:59:59 = 86.399 segons → 86.399.000 ms) cap sobrat en un `int`, que arriba fins a 2.147.483.647.

</details>

---

### 3. Volume of a Cuboid

El mètode `getVolumeOfCuboid` rep llargada, amplada i alçada d'una caixa i torna el seu volum.

**Exemples:** `(1, 2, 3)` → `6`, `(6, 2, 1)` → `12`, `(5, 3, 2)` → `30`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/58261acb22be6e2ed800003a)
- Dificultat: 8 kyu

**Pista:** el volum d'un paral·lelepípede és amplada × alçada × llargada. Un `return`, tres multiplicacions, ni un `if`.

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static int getVolumeOfCuboid(int length, int width, int height) {
        return length * width * height;
    }
}
```

El mètode més curt de tot el butlletí: rep tres entrades, torna una eixida. Fixa't en el patró de la signatura `public static` que ja és rutinari: sense `static`, CodeWars (igual que el teu `main`) no podria cridar-lo.

</details>

---

### 4. Drink about

Donada una edat, torna quina beguda correspon: menys de 14 → `"drink toddy"`, menys de 18 → `"drink coke"`, menys de 21 → `"drink beer"` i a partir de 21 → `"drink whisky"`.

**Exemples:** `10` → `"drink toddy"`, `15` → `"drink coke"`, `20` → `"drink beer"`, `30` → `"drink whisky"`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/56170e844da7c6f647000063)
- Dificultat: 8 kyu

**Pista:** són quatre `return` encadenats amb `if`, de l'edat més petita a la major, com la cascada de notes de la U04.

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static String peopleWithAgeDrink(int old) {
        if (old < 14) {
            return "drink toddy";
        }
        if (old < 18) {
            return "drink coke";
        }
        if (old < 21) {
            return "drink beer";
        }
        return "drink whisky";
    }
}
```

La mateixa cascada de rangs de sempre, però tornant en lloc d'imprimir. L'ordre importa: si comprovaras `old < 21` primer, un xiquet de 10 anys beuria cervesa.

</details>

---

## AceptaElReto

### 5. 116 — Hola món!

A la primera classe de qualsevol curs de programació s'hauria d'eixir havent escrit un «hola món». Doncs això: donat un nombre `n` (`0 ≤ n ≤ 5`), escriu `n` línies amb la cadena `Hola mundo.` (el text de l'eixida és exactament eixe, tal com demana el jutge).

**Exemple:**

```
3
```

**Eixida:**

```
Hola mundo.
Hola mundo.
Hola mundo.
```

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=116)
- Dificultat: Fàcil

**Pista:** un mètode `public static void imprimirHolaMundo(int n)` amb un `for` de `0` a `n - 1`, i un `main` que només llegeix i crida.

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class HolaMundo {
    public static void imprimirHolaMundo(int n) {
        for (int i = 0; i < n; i++) {
            System.out.println("Hola mundo.");
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        imprimirHolaMundo(n);
        sc.close();
    }
}
```

`imprimirHolaMundo(0)` no imprimeix res (el `for` no arranca) i `imprimirHolaMundo(5)` repeteix la línia cinc vegades. El mètode encapsula la repetició: el jutge demana un nombre, el teu mètode sap repetir. Programar en equip, amb un per àrea.

</details>

---

### 6. 115 — Número de Kaprekar

Un nombre és de *Kaprekar* si el seu quadrat pot partir-se en dos nombres que sumats tornen l'original, i el segon de la partida no pot ser zero. Per exemple: `9² = 81` → `8 + 1 = 9` (¡és Kaprekar!) i `703² = 494209` → `494 + 209 = 703`. En canvi, `100` no ho és: `10000` podria partir-se en `100 + 00`, però `00` val zero.

**Entrada:** diversos nombres (≥ 1 i < 65536) fins a un `0` que marca el final.

**Exemple:**

```
22222
75
99
100
0
```

**Eixida:**

```
SI
NO
SI
NO
```

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=115)
- Dificultat: Mitjà

**Pista:** embolica-ho tot en un `public static boolean esKaprekar(int n)`. El quadrat pot passar-se de `int` (usa `long`), i has de provar **tots** els talls possibles: `p = 10, 100, 1000, ...` fins a superar el quadrat, amb `izq = cuadrado / p` i `der = cuadrado % p`. Si `der != 0` i `izq + der == n`, has guanyat.

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class Kaprekar {
    public static boolean esKaprekar(int n) {
        long cuadrado = (long) n * n;
        for (long p = 10; p <= cuadrado * 10; p *= 10) {
            long izquierda = cuadrado / p;
            long derecha = cuadrado % p;
            if (derecha != 0 && izquierda + derecha == n) {
                return true;
            }
        }
        return false;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        while (n != 0) {
            System.out.println(esKaprekar(n) ? "SI" : "NO");
            n = sc.nextInt();
        }
        sc.close();
    }
}
```

Comprovem amb `9`: `cuadrado = 81`, amb `p = 10` → `izq = 8`, `der = 1`, i `8 + 1 = 9` → `SI`. Amb `100`: cap tall dona `100` sense que `der` siga `0` → `NO`. El tall extra `p <= cuadrado * 10` és el que permet que l'esquerra quede buida, just el que necessita el `1` (`1² = 1` → `0 + 1 = 1` → `SI`). Un `for` de talls i un `long` a salvaguarda de desbordaments: pur múscul d'esta unitat.

</details>

---

> 🧭 **I si et quedes amb ganes?** Amb els mètodes a la mà pots reescriure els teus programes de la U04 trossejant cada bloc en una funció amb nom. I si et ve de gust un repte de futur, la U08 t'ensenyarà a fer que un mètode es cride a ell mateix (recursió): el joc de la caixa russa del codi.
