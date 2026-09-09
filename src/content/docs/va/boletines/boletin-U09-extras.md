---
title: Butlletí U09 — Extres
description: CodeWars i AceptaElReto per a anar més enllà de la unitat
---

# 📝 Butlletí U09 — Extres

> Exercicis de CodeWars i AceptaElReto amb pistes. La solució està oculta: resisteix-te fins a esgotar la teua pista. CodeWars i AceptaElReto són els gimnasos on els programadors es repten cada dia: ací és on l'herència deixa de ser teoria i es converteix en reflexos.

---

## CodeWars

### 1. Thinkful — Object Drills: Quarks

Crea la classe `Quark` amb tres propietats: `color` (String), `flavor` (String) i `baryon_number` (sempre `1.0`). A més:
- Constructor que rep `color` i `flavor`.
- `interact(altre)` → intercanvia els colors dels dos quarks.

**Exemple:**
```java
Quark q1 = new Quark("red", "up");
Quark q2 = new Quark("blue", "strange");
q1.interact(q2);
q1.color;  // "blue"
q2.color;  // "red"
q1.baryon_number;  // 1.0
```

- [Enunciat a CodeWars](https://www.codewars.com/kata/5882b052bdeafec15e0000e6)
- Dificultat: 7 kyu

**Pista:** `baryon_number` és una constant que tots els quarks compartixen: `public final double baryon_number = 1.0;`. `interact()` usa una variable temporal per a intercanviar: `String temp = this.color; this.color = altre.color; altre.color = temp;`. El `this` desambigua qui és qui en l'intercanvi.

<details>
<summary>🔄 Solució</summary>

```java
public class Quark {
    public String color;
    public String flavor;
    public final double baryon_number = 1.0;

    public Quark(String color, String flavor) {
        this.color = color;
        this.flavor = flavor;
    }

    public void interact(Quark altre) {
        String temporal = this.color;
        this.color = altre.color;
        altre.color = temporal;
    }
}
```

La física de quarks aplicada: `baryon_number` és `final` perquè cap quark canvia el seu nombre bariònic (és una constant universal). `interact()` intercanvia els colors amb una variable temporal; sense ella, un dels dos colors es perdria. Este és el clàssic "swap" que ja vas vore amb variables, ara entre dos objectes.

</details>

---

### 2. Building blocks

Crea la classe `Block` que rep les tres dimensions (com `int[]` de 3 o com 3 enters) i els mètodes:
- `int getWidth()`, `int getLength()`, `int getHeight()`
- `int getVolume()` → `width * length * height`
- `int getSurfaceArea()` → `2 * (w*l + w*h + l*h)`

**Exemple:** `new Block(new int[]{2, 4, 6})` → volum 48, superfície `2*(2*4 + 2*6 + 4*6) = 88`.

- [Enunciat a CodeWars](https://www.codewars.com/kata/55b75fcf67e558d3750000a3)
- Dificultat: 7 kyu

**Pista:** guarda les tres dimensions en atributs privats en el constructor, i deixa que els getters les tornen. Per a la superfície, la fórmula és la suma de les tres cares per dos. El polimorfisme no apareix ací, però l'objecte amb estat i comportament sí: l'excusa perfecta per a repassar la U07 mentre penses en l'herència.

<details>
<summary>🔄 Solució</summary>

```java
public class Block {
    private final int width;
    private final int length;
    private final int height;

    public Block(int[] dimensions) {
        this.width = dimensions[0];
        this.length = dimensions[1];
        this.height = dimensions[2];
    }

    public int getWidth() {
        return width;
    }

    public int getLength() {
        return length;
    }

    public int getHeight() {
        return height;
    }

    public int getVolume() {
        return width * length * height;
    }

    public int getSurfaceArea() {
        return 2 * (width * length + width * height + length * height);
    }
}
```

L'objecte `Block` guarda el seu estat i l'exposa amb getters. Els atributs `final` es fixen en el constructor (un bloc no canvia de forma). El volum i la superfície són mètodes que calculen a partir de l'estat. És un objecte amb responsabilitat única: sap les seues dimensions i com mesurar-se. L'herència del curs arribarà quan vulgues especialitzar-lo en `Cub` o `Caixa` sense duplicar codi.

</details>

---

### 3. Basic subclasses — Adam and Eve

Segons el mite, Adam i Eva van ser els primers humans. El teu treball és "fer el treball de Déu": crear un mètode estàtic `create()` que torne un array de `Human` amb dos objectes: el primer un `Man` i el segon una `Woman`. Les dues classes hereten de `Human`, i cada humà té `name`, `sex` i la propietat `species` amb valor `"Human"`.

- [Enunciat a CodeWars](https://www.codewars.com/kata/547274e24481cfc469000416)
- Dificultat: 8 kyu

**Pista:** herència pura: `class Man extends Human` i `class Woman extends Human`. Cada subclasse crida `super(...)` per a omplir el nom i el sexe. L'array de retorn és de tipus `Human`, així que accepta les dues subclasses.

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

`Man` i `Woman` heretem tot de `Human` i només aporten el seu constructor amb el sexe fix. `create()` torna un array de `Human` (el tipus general) omplit amb les dues subclasses: polimorfisme de dalt a baix, com Adam i Eva al Paradís.

</details>

---

### 4. Object Oriented Piracy

Crea la classe `Ship` que rep un `draft` (calat) i un `crew` (tripulants). Implementa `isWorthIt()`: torna `true` si el calat total menys `1.5` per cada tripulant supera 20.

**Exemple:** `new Ship(15, 10).isWorthIt()` → `false` (`15 - 1.5*10 = 0`).

- [Enunciat a CodeWars](https://www.codewars.com/kata/54fe05c4762e2e3047000add)
- Dificultat: 8 kyu

**Pista:** guarda `draft` i `crew` en atributs `private final`. El mètode combina tots dos: `return draft - 1.5 * crew > 20;`. És la classe d'objecte simple que ja domines: una excusa per a repassar que l'estat viu en l'objecte, no en el main.

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

Cada `Ship` guarda el seu propi estat (`draft` i `crew`) i decideix per si mateix si mereix la pena. Els atributs `final` fan l'objecte immutable: es fixen en nàixer. La constant `static final` documenta el `1.5`. És el mateix patró d'objecte amb comportament que has practicat tota la unitat.

</details>

---

## AceptaElReto

### 5. 117 — La festa avorrida

Tinín odia les festes, i cada persona que se li acosta es presenta amb el format `"Soc Lotari"`. Ajuda'l a respondre `"Hola, [nom]."` a cadascun. L'entrada comença amb un nombre que indica quantes persones hi ha, seguit d'una línia per persona. Resol-lo amb una classe `Persona` que encapsule el nom i un mètode `saludar()`.

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

**Pista:** llig la línia i trau el `"Soc "` inicial amb `linea.substring(4)` o `split(" ")[1]`. Crea la `Persona` amb eixe nom i crida `saludar()`. És l'excusa perfecta per a vore que un objecte amb un mètode pot substituir un main que fa de tot.

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
        sc.nextLine();  // consumeix el salt de línia

        for (int i = 0; i < n; i++) {
            String linea = sc.nextLine();
            Persona p = new Persona(linea.substring(4));
            p.saludar();
        }
        sc.close();
    }
}
```

`Persona` encapsula el seu nom i sap saludar: el `main` només llig i crea objectes. `linea.substring(4)` es salta `"Soc "`. És la manera "orientada a objectes" de resoldre un problema que també podries fer amb un `String` solt: ací l'estat (el nom) i el comportament (`saludar()`) viuen junts en la classe.

</details>

---

### 6. 119 — Escuts de l'exèrcit romà

Un general divideix els seus legionaris en formacions **quadrades** (el més gran possible), repetint amb els que queden lliures fins a esgotar-los. Cada quadrat de costat `n` necessita escuts segons el perímetre més la cobertura: per a un quadrat de `n × n`, els escuts són `n² + 4n` (una base per soldat més el perímetre exterior). Donat el nombre de legionaris, calcula el mínim d'escuts necessaris.

**Entrada:** diversos casos de prova, cadascun amb el nombre de legionaris. Termina amb `0`.

**Entrada d'exemple:**
```
35
20
10
0
```

**Eixida d'exemple:**
```
71
44
26
```

- [Enunciat a AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=119)
- Dificultat: Fàcil/Mitjana

**Pista:** mentre queden legionaris, troba el major quadrat `n` tal que `n² <= restants` (prova `n` creixent o usa `Math.sqrt`). Suma els escuts d'eixe quadrat i resta `n²` dels restants. Encapsula la lògica en una classe `Formacio` amb mètodes com `majorQuadrat()` i `calcularEscuts()`.

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class Formacio {
    public static int escutsDeQuadrat(int costat) {
        return costat * costat + 4 * costat;
    }

    public static int majorQuadrat(int restants) {
        int n = (int) Math.sqrt(restants);
        return n * n;  // el major quadrat perfecte <= restants
    }

    public static int resoldre(int legionaris) {
        int escuts = 0;
        int restants = legionaris;

        while (restants > 0) {
            int quadrat = majorQuadrat(restants);
            int costat = (int) Math.sqrt(quadrat);
            escuts += escutsDeQuadrat(costat);
            restants -= quadrat;
        }
        return escuts;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        while (n != 0) {
            System.out.println(resoldre(n));
            n = sc.nextInt();
        }
        sc.close();
    }
}
```

Verifica-ho amb 35: el major quadrat és 25 (costat 5) → `25 + 20 = 45` escuts; queden 10, major quadrat 9 (costat 3) → `9 + 12 = 21`; queda 1 (costat 1) → `1 + 4 = 5`. Total `45 + 21 + 5 = 71` ✓. `Math.sqrt` et dona l'arrel; en truncar obtens el costat del major quadrat que cap. La classe agrupa els tres càlculs com a mètodes estàtics: pura lògica ben empaquetada.

</details>

---

> 🧭 **I si et quedes amb ganes?** Quan domines l'herència, torna als problemes d'unitats anteriors i reescriu-los amb jerarquies: un `Lector` abstracte, un `Solucionador` polimòrfic, figures que es calculen soles. El material no es perd: es reutilitza.