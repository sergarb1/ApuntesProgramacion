---
title: Butlletí U08 — Inicial Resolt
description: Els mateixos exercicis que el butlletí inicial, amb solucions
---

# 📝 Butlletí U08 — Inicial (Resolt)

> Les solucions estan amagades en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## Exercici 1: Què imprimeix? — La família musical

<details>
<summary>🔄 Solució</summary>

Imprimeix **"El baixista toca el baix"**.

`Baixista` té la seua pròpia versió de `tocar()`. Java busca el mètode començant per la classe més específica (`Baixista`) i el troba ahí mateix: mai no puja a `Guitarrista` ni a `Instrumentista`. Eixe és el *dynamic dispatch*: el mètode es resol segons el tipus real de l'objecte, no segons el tipus de la referència.

</details>

---

## Exercici 2: Troba l'error — extends mal usat

<details>
<summary>🔄 Solució</summary>

L'error és que `Gos` no crida al constructor d'`Animal`. Quan una classe filla no posa `super(...)`, Java intenta cridar a `super()` sense paràmetres. Però `Animal` només té `Animal(String)`, així que el compilador no troba el constructor buit: **error de compilació**.

```java
public class Gos extends Animal {
    private String raça;

    public Gos(String especie, String raça) {
        super(especie);   // la clau!
        this.raça = raça;
    }
}
```

Pensa en `super()` com cridar a papà perquè configure la seua part abans que tu configures la teua. Si papà necessita una espècie per a construir-se, tu l'hi has de passar. És com construir una casa sense fonaments: el constructor del pare és la base.

</details>

---

## Exercici 3: Completa el codi — el gat que crida el seu pare

<details>
<summary>🔄 Solució</summary>

La paraula és **`super`**:

```java
public class Gat extends Animal {
    @Override
    public void ferSo() {
        super.ferSo();   // primer el del pare
        System.out.println("¡MIAU!");
    }

    public static void main(String[] args) {
        Gat g = new Gat();
        g.ferSo();
    }
}
```

Eixida:

```
Algun so genèric...
¡MIAU!
```

`super.ferSo()` executa la versió d'`Animal` i després el `Gat` afig el seu. Sense el `super`, el mètode estaria sobreescrit per complet i la línia del pare no eixiria mai.

</details>

---

## Exercici 4: Escriu este programa — l'herència de vehicles

<details>
<summary>🔄 Solució</summary>

```java
public class Vehicle {
    protected String marca;

    public Vehicle(String marca) {
        this.marca = marca;
    }
}

public class Cotxe extends Vehicle {
    protected int numPortes;

    public Cotxe(String marca, int numPortes) {
        super(marca);
        this.numPortes = numPortes;
    }
}

public class Esportiu extends Cotxe {
    private int velocitatMaxima;

    public Esportiu(String marca, int numPortes, int velocitatMaxima) {
        super(marca, numPortes);
        this.velocitatMaxima = velocitatMaxima;
    }

    public static void main(String[] args) {
        Esportiu e = new Esportiu("Ferrari", 2, 340);
        System.out.println(e.marca + " amb " + e.numPortes
                + " portes i " + e.velocitatMaxima + " km/h");
    }
}
```

L'herència en cadena: `Esportiu` → `Cotxe` → `Vehicle`. Cada constructor crida al del seu pare amb `super(...)`. Per això `marca` (de `Vehicle`) i `numPortes` (de `Cotxe`) són accessibles en `Esportiu` gràcies a `protected`.

</details>

---

## Exercici 5: Què imprimeix? — Polimorfisme amb referències

<details>
<summary>🔄 Solució</summary>

Imprimeix:

```
Y
C
C
```

El tipus de la **referència** (X, X, Y) no importa. El que importa és el tipus **real** de l'objecte (Y, C, C). Java sempre executa el mètode més específic de l'objecte real. És com portar la jaqueta del teu pare: per fora pareixes el teu pare (la referència), però per dins ets tu (l'objecte). Quan parles, se sent la teua veu, no la del teu pare. Dynamic binding en tot el seu esplendor.

</details>

---

## Exercici 6: Escriu este programa — la granja polimòrfica

<details>
<summary>🔄 Solució</summary>

```java
import java.util.ArrayList;

public class Animal {
    public void ferSo() { System.out.println("..."); }
}

class Vaca extends Animal {
    @Override public void ferSo() { System.out.println("Muuuu"); }
}

class Ovella extends Animal {
    @Override public void ferSo() { System.out.println("Beeee"); }
}

class Gallina extends Animal {
    @Override public void ferSo() { System.out.println("Cloc cloc"); }
}

public class Granja {
    public static void main(String[] args) {
        ArrayList<Animal> animals = new ArrayList<>();
        animals.add(new Vaca());
        animals.add(new Ovella());
        animals.add(new Gallina());

        for (Animal a : animals) {
            a.ferSo();
        }
    }
}
```

Eixida:

```
Muuuu
Beeee
Cloc cloc
```

Un sol `ArrayList<Animal>` i un sol bucle: cada animal executa la seua pròpia versió gràcies al polimorfisme. Sense ell, tindries tres llistes separades. Això és el que fa que el polimorfisme valga el seu pes en or.

</details>

---

## Exercici 7: Troba l'error — @Override que no ho és

<details>
<summary>🔄 Solució</summary>

La línia que **no compila** és:

```java
@Override
public void nedar() { }   // ✗ ERROR: Animal no té nedar()
```

`@Override` li diu al compilador: "verifica que realment estic sobreescrivint un mètode del pare". Com que `Animal` no té `nedar()`, el compilador t'avisa en l'acte. L'altra línia (`ferSo()`) sí que és un override vàlid. Eixe avís a temps és el regal de `@Override`: si escrius malament un nom de mètode, te n'assabenta el compilador, no un bug raríssim a mitjanit.

</details>

---

## Exercici 8: Escriu este programa — el gos ben heretat

<details>
<summary>🔄 Solució</summary>

```java
public class Gos extends Animal {
    public Gos(String nom, int edat) {
        super(nom, edat);
    }

    public void lladrar() {
        System.out.println(nom + " diu: ¡Guau!");
    }

    public static void main(String[] args) {
        Gos g = new Gos("Firulais", 3);
        g.lladrar();
    }
}
```

Eixida: `Firulais diu: ¡Guau!`

`Gos` pot usar `nom` i `edat` perquè estan declarats com a `protected` en `Animal`: l'herència els posa a disposició de tota la família. Si foren `private`, ni `Gos` els veuria. És com l'herència familiar: el que és privat a casa dels avis, no ho veuen ni els néts.

</details>

---

## Exercici 9: Què imprimeix? — la cadena de constructors

<details>
<summary>🔄 Solució</summary>

Imprimeix:

```
Avi
Pare
Fill
```

En crear un `Fill` s'executen **tots** els constructors de la cadena, del més general al més específic. Com que cada constructor crida a `super()` (o Java el posa automàticament), primer es construïx `Avi`, després `Pare` i per últim `Fill`. Els fonaments abans que el teulada, sempre.

</details>