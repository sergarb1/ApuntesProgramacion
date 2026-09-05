---
title: Butlletí U07 — Extres
description: CodeWars i AceptaElReto per a anar més enllà de la unitat
---

# 📝 Butlletí U07 — Extres

> Exercicis de CodeWars i AceptaElReto amb pistes. La solució està amagada: resisteix-te fins a esgotar la teua pista.

---

## CodeWars

### 1. FIXME: Get Full Name

Et donen una classe `Dinglemouse` amb un mètode `getFullName()` que hauria de tornar `"Nom Cognom"`, però el resultat està al revés o incomplet. Arregla-la.

- [Enunciat en CodeWars](https://www.codewars.com/kata/597c684822bc9388f600010f)
- Dificultat: 7 kyu

**Pista:** fixa't en quins atributs existixen (`firstName` i `lastName`) i en com el mètode els concatena. La classe està feta per a rompre's: busca l'error de `this` o d'ordre.

<details>
<summary>🔄 Solució</summary>

```java
public class Dinglemouse {
    private final String firstName;
    private final String lastName;

    public Dinglemouse(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public String getFullName() {
        if (firstName.isEmpty() && lastName.isEmpty()) {
            return "";
        }
        if (firstName.isEmpty()) {
            return lastName;
        }
        if (lastName.isEmpty()) {
            return firstName;
        }
        return firstName + " " + lastName;
    }
}
```

La classe original fallava en construir el nom complet: els casos en què falta un nom o tots dos havien de tornar el que hi ha. El mètode correcte encadena els casos límit abans de juntar tots dos noms amb un espai.

</details>

---

### 2. Geometry Basics: Distance between points in 2D

Et donen una classe `Point` amb dos propietats (`x` i `y`) i has d'implementar el mètode `distanceBetweenPoints(Point a, Point b)` que torne la distància entre ells.

**Exemple:** `Point(3, 3)` i `Point(3, 3)` → `0`. `Point(1, 6)` i `Point(4, 2)` → `5`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/58dced7b702b805b200000be)
- Dificultat: 8 kyu

**Pista:** distància euclidiana `Math.sqrt(Math.pow(a.x - b.x, 2) + Math.pow(a.y - b.y, 2))`. Els objectes es passen com a paràmetre, com vam fer amb `Fraccio.sumar`.

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static double distanceBetweenPoints(Point a, Point b) {
        return Math.sqrt(Math.pow(a.x - b.x, 2) + Math.pow(a.y - b.y, 2));
    }
}

class Point {
    public double x;
    public double y;

    public Point(double x, double y) {
        this.x = x;
        this.y = y;
    }
}
```

El mètode rep dos objectes `Point` i llig els seus atributs (`a.x`, `b.x`...). És exactament el mateix patró de `sumar(Fraccio altra)`: un objecte treballa amb un altre. La fórmula de Pitàgores resolta per objectes.

</details>

---

### 3. Grasshopper — Personalized Message

Crea el mètode `greet(name, owner)` que torne `"Hello boss"` si `name` i `owner` són iguals, o `"Hello guest"` si són distints.

**Exemples:** `greet("Daniel", "Daniel")` → `"Hello boss"`, `greet("Greg", "Daniel")` → `"Hello guest"`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/5772da22b89313a4d50012f7)
- Dificultat: 8 kyu

**Pista:** compara `String` amb `.equals()`, mai amb `==`. Un `if`/`else` o un ternari.

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static String greet(String name, String owner) {
        return name.equals(owner) ? "Hello boss" : "Hello guest";
    }
}
```

Una línia amb el ternari i `.equals()`. Si uses `==` amb cadenes, els resultats seran imprevisibles: en Java els `String` es comparen amb `.equals()` perquè són objectes (encara que Java els done un tracte especial). La U08 t'explicarà per què.

</details>

---

### 4. Sleigh Authentication

Has de completar la classe `Sleigh` amb un mètode `authenticate(name, password)` que torne `true` només si `name` és `"Santa Claus"` i `password` és `"Ho Ho Ho!"`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/52adc142b2651f25a8000643)
- Dificultat: 8 kyu

**Pista:** torna `name.equals("Santa Claus") && password.equals("Ho Ho Ho!")`. Una altra vegada `.equals()`, i el `&&` de la U03.

<details>
<summary>🔄 Solució</summary>

```java
public class Sleigh {
    public boolean authenticate(String name, String password) {
        return name.equals("Santa Claus") && password.equals("Ho Ho Ho!");
    }
}
```

Un mètode d'una sola línia: dos comparacions amb `.equals()` unides per `&&`. És una d'eixes katas trampa: sembla trivial, però molts cauen usant `==` i fallen els tests. Objectes per tot arreu.

</details>

---

## AceptaElReto

### 5. 148 — Nochevieja

Ramón es passa el dia de cap d'any contant els minuts que falten per a mitjanit. Per a cada hora de l'entrada (format `HH:MM`), digues quants minuts falten per a les `00:00`. L'entrada acaba amb `00:00`, que no es processa.

**Entrada:**

```
23:45
21:30
00:01
00:00
```

**Eixida:**

```
15
150
1439
```

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=148)
- Dificultat: Fàcil

**Pista:** separa l'hora i el minut amb `split(":")`. Els minuts que falten són `(23 - hora) * 60 + (60 - minut)`. Escriu una classe `Hora` amb un mètode `minutsFinsMitjanit()` i veuràs com de natural queda.

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class Nochevieja {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String linea = sc.next();

        while (!linea.equals("00:00")) {
            String[] parts = linea.split(":");
            int hora = Integer.parseInt(parts[0]);
            int minut = Integer.parseInt(parts[1]);
            System.out.println((23 - hora) * 60 + (60 - minut));
            linea = sc.next();
        }
        sc.close();
    }
}
```

Per a `23:45`: `(23-23)*60 + (60-45)` = 15. Per a `21:30`: `2*60 + 30` = 150. El `while` es deté amb la línia `00:00` perquè es compara amb `.equals()` (és un `String`, recorda). La versió amb classe `Hora` és un bon exercici voluntari.

</details>

---

### 6. 117 — La fiesta aburrida

Tinín odia saludar desconeguts. L'entrada comença amb un nombre N (quanta gent hi ha) i després N línies amb el format `"Soy Lotario"`. Per a cada una, imprimix `"Hola, Lotario."`.

**Entrada:**

```
3
Soy Lotario
Soy Aldonza
Soy Ender
```

**Eixida:**

```
Hola, Lotario.
Hola, Aldonza.
Hola, Ender.
```

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=117)
- Dificultat: Fàcil

**Pista:** `split(" ")` sobre cada línia i agafa la segona part (índex 1). Pots modelar cada persona com un objecte d'una classe `Persona` amb el nom i un mètode `saludar()`.

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class FiestaAburrida {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        sc.nextLine();

        for (int i = 0; i < n; i++) {
            String linea = sc.nextLine();
            String nom = linea.split(" ")[1];
            System.out.println("Hola, " + nom + ".");
        }
        sc.close();
    }
}
```

`split(" ")` partix `"Soy Lotario"` en `["Soy", "Lotario"]` i l'índex 1 és el nom. El `sc.nextLine()` després del `nextInt()` consumix el salt de línia sobrant. Una versió amb classe `Persona` i el seu mètode `saludar()` és el repte extra ideal per a esta unitat.

</details>

---

> 🧭 **I si et quedes amb ganes?** Quan domines les classes, el pas natural és protegir les seues dades: això és l'**encapsulació** de la U08. I si vols vore objectes que es creen i destrueixen sols, espera't als arrays de la U04 i les col·leccions de la U10, on crearàs desenes d'objectes en un bucle.
