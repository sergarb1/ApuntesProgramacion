---
title: Butlletí U08 — Extres
description: CodeWars i AceptaElReto per a anar més enllà de la unitat
---

# 📝 Butlletí U08 — Extres

> Exercicis de CodeWars i AceptaElReto amb pistes. La solució està oculta: resisteix-te fins a esgotar la teua pista. Els `private`, els getters i el `static` són ací els protagonistes: encapsula, protegeix i compartix sense por.

---

## CodeWars

### 1. Playing with cubes II

Et donen un motle de classe `Cube` amb un atribut privat `side`. El teu treball: construir-la amb getter i setter, i dos constructors (un buit que inicialitza `side` a 0, i un altre que rep el costat).

**Exemple d'ús:**
```java
Cube c = new Cube(3);
c.getSide();  // 3
c.setSide(7);
c.getSide();  // 7
```

- [Enunciat a CodeWars](https://www.codewars.com/kata/55c0ac142326fdf18d0000af)
- Dificultat: 8 kyu

**Pista:** `side` ha de ser `private` (ningú el toca des de fora) i els únics portals són `getSide()` i `setSide()`. El constructor sense paràmetres posa `this.side = 0;`. Exactament el que has vist en la unitat: encapsulació pura.

<details>
<summary>🔄 Solució</summary>

```java
public class Cube {
    private int side;

    public Cube() {
        this.side = 0;
    }

    public Cube(int side) {
        this.side = side;
    }

    public int getSide() {
        return side;
    }

    public void setSide(int side) {
        this.side = side;
    }
}
```

L'atribut `side` és `private`: ningú pot fer `c.side = 9` des de fora. Els dos constructors donen dues maneres de nàixer (amb o sense valor), i el getter/setter són les úniques portes. El `this` del setter desambigua el paràmetre de l'atribut, com has vist en la unitat.

</details>

---

### 2. Classy Extentions

Crea la classe `Pet` amb un atribut privat `name` (String) i un mètode `speak()` que torne el nom de l'animal. Després crea la classe `Cat` que **hereta** de `Pet` i sobreescriu `speak()` perquè torne `"[name] meows."`.

**Exemples:**
```java
new Cat("Milo").speak();  // "Milo meows."
new Cat("Garfield").speak();  // "Garfield meows."
```

- [Enunciat a CodeWars](https://www.codewars.com/kata/55a14aa4817efe41c20000bc)
- Dificultat: 8 kyu

**Pista:** `name` és privat, així que `Cat` no pot llegir-lo directament: necessita un getter `getName()` en `Pet` (recorda: els privats no s'hereten, però existixen dins de l'objecte). `Cat extends Pet` i usa `super(nombre)` per a construir la part del pare.

<details>
<summary>🔄 Solució</summary>

```java
public class Pet {
    private String name;

    public Pet(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public String speak() {
        return name;
    }
}

public class Cat extends Pet {
    public Cat(String name) {
        super(name);
    }

    @Override
    public String speak() {
        return getName() + " meows.";
    }
}
```

Fixa't: `Cat` no toca `name` directament (és privat en `Pet`), usa `getName()`. Això és el triangle perfecte: **encapsulació** (privat + getter) + **herència** (`extends`) + **sobreescriptura** (`@Override`). L'herència la aprofundeixes en la U09, però ací ja la veus en acció.

</details>

---

### 3. Sleigh Authentication

Pare Noel té un mètode `authenticate(name, password)` i només admet dues credencials: el nom ha de ser `"Santa Claus"` i la contrasenya `"Ho Ho Ho!"`. Torna `true` només si totes dues coincideixen.

**Exemples:** `authenticate("Santa Claus", "Ho Ho Ho!")` → `true`, `authenticate("Santa", "Ho Ho Ho!")` → `false`.

- [Enunciat a CodeWars](https://www.codewars.com/kata/52adc142b2651f25a8000643)
- Dificultat: 8 kyu

**Pista:** els dos valors són constants: `private static final String NOM_VALID = "Santa Claus";`. Compara amb `.equals()`, mai amb `==`. I nota el `static`: el mètode no necessita objecte, és pura lògica de classe.

<details>
<summary>🔄 Solució</summary>

```java
public class Sleigh {
    private static final String NOM_VALID = "Santa Claus";
    private static final String PASSWORD_VALID = "Ho Ho Ho!";

    public boolean authenticate(String name, String password) {
        return NOM_VALID.equals(name) && PASSWORD_VALID.equals(password);
    }
}
```

Les constants `static final` són el secret de la casa: `static` (una sola còpia per a tota la classe, la vas vore en el punt 7) i `final` (ningú pot reassignar-les). El `authenticate` combina les dos comprovacions amb `&&`. El `.equals()` es crida sobre la constant, no sobre el paràmetre: així `null` mai trenca el mètode.

</details>

---

### 4. Object Oriented Piracy

Crea la classe `Ship` que rep un `draft` (calat) i un `crew` (tripulants). Implementa `isWorthIt()`: torna `true` si el calat total menys `1.5` per cada tripulant supera 20.

**Exemple:** `new Ship(15, 10).isWorthIt()` → `false` (`15 - 1.5*10 = 0`).

- [Enunciat a CodeWars](https://www.codewars.com/kata/54fe05c4762e2e3047000add)
- Dificultat: 8 kyu

**Pista:** guarda `draft` i `crew` en atributs `private final` (es fixen en el constructor i ja no canvien). El mètode combina tots dos: `return draft - 1.5 * crew > 20;`. El `1.5` mereix ser una constant amb nom.

<details>
<summary>🔄 Solució</summary>

```java
public class Ship {
    private static final double PES_TRIPULANT = 1.5;

    private final double draft;
    private final int crew;

    public Ship(double draft, int crew) {
        this.draft = draft;
        this.crew = crew;
    }

    public boolean isWorthIt() {
        return draft - PES_TRIPULANT * crew > 20;
    }
}
```

La classe és immutable: els atributs `final` es fixen en nàixer i ningú pot canviar-los (ni tan sols amb un setter, que ací no existix). La constant `static final` documenta el `1.5`. El vaixell "sap" si mereix la pena saquejar-lo sense que ningú llig les seues tripes: encapsulació i responsabilitat única.

</details>

---

## AceptaElReto

### 5. 117 — La festa avorrida

Tinín odia les festes, i cada persona que se li acosta es presenta amb el format `"Soc Lotari"`. Ajuda'l a respondre `"Hola, [nom]."` a cadascun. L'entrada comença amb un nombre que indica quantes persones hi ha, seguit d'una línia per persona. Escriu la solució amb una classe `Persona` que guarde el nom i un mètode `saludar()`.

**Entrada d'exemple:**
```
3
Soc Lotari
Soc Aldonça
Soc Ender
```

**Eixida d'exemple:**
```
Hola, Lotari.
Hola, Aldonça.
Hola, Ender.
```

- [Enunciat a AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=117)
- Dificultat: Fàcil

**Pista:** llig la línia, trau el `"Soc "` inicial (`linea.substring(4)` o `split(" ")[1]`), crea la `Persona` amb eixe nom i crida el seu `saludar()`. És una excusa perfecta per a una classe amb un atribut i un mètode, en comptes d'un main que ho fa tot.

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class Persona {
    private String nom;

    public Persona(String nom) {
        this.nom = nom;
    }

    public void saludar() {
        System.out.println("Hola, " + nom + ".");
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        sc.nextLine();  // consumix el salt de línia

        for (int i = 0; i < n; i++) {
            String linea = sc.nextLine();
            String nom = linea.substring(4);  // trau "Soc "
            Persona p = new Persona(nom);
            p.saludar();
        }
        sc.close();
    }
}
```

`Persona` encapsula el seu nom: `private` + constructor + un mètode que sap saludar. El `main` només s'encarrega de llegir i crear objectes. `linea.substring(4)` es salta els 4 primers caràcters (`"Soc "`). El `sc.nextLine()` extra després del `nextInt()` consumix l'Enter, el clàssic del Scanner que vas vore en la U02.

</details>

---

### 6. 117 bis — La festa avorrida amb comptador estàtic

Repte extra amb `static`: usa la classe `Persona` de l'exercici 5, però afig un atribut `private static int totalSaluts` que compte quantes persones ha saludat Tinín en total. Després de cada salut, mostra el total acumulat.

**Entrada d'exemple:**
```
2
Soc Lotari
Soc Ender
```

**Eixida d'exemple:**
```
Hola, Lotari. (saluts: 1)
Hola, Ender. (saluts: 2)
```

**Pista:** `static` significa "de la classe, no de l'objecte": tots els `Persona` compartixen `totalSaluts`. Instrumenta-ho dins de `saludar()` amb `totalSaluts++`. Així practiques que el comptador puja per a tots els objectes, com el `Contador` del butlletí inicial.

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class Persona {
    private static int totalSaluts = 0;

    private String nom;

    public Persona(String nom) {
        this.nom = nom;
    }

    public void saludar() {
        totalSaluts++;
        System.out.println("Hola, " + nom + ". (saluts: " + totalSaluts + ")");
    }

    public static int getTotalSaluts() {
        return totalSaluts;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        sc.nextLine();

        for (int i = 0; i < n; i++) {
            String linea = sc.nextLine();
            Persona p = new Persona(linea.substring(4));
            p.saludar();
        }
        sc.close();
    }
}
```

`totalSaluts` és `static`: hi ha una única còpia compartida per tota la classe, no una per objecte. Cada `saludar()` l'incrementa i, com que tots compartixen la mateixa variable, el comptador acumula de veritat. `getTotalSaluts()` és `static` perquè la pregunta "quants saluts en total?" se li fa a la classe, no a una persona concreta.

</details>

---

> 🧭 **I si et quedes amb ganes?** Quan domines l'encapsulació, torna als problemes d'unitats anteriors i reescriu-los amb classes ben blindades: un `Rectangle` amb la seua àrea com a mètode, un `Numero` amb la seua anàlisi com a mètode... El `private`, els getters i el `static` transformen un script solt en un disseny. El material no es perd: es reutilitza.