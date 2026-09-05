---
title: Butlletí U09 — Inicial
description: Exercicis bàsics d'Herència, Polimorfisme i Interfícies
---

# 📝 Butlletí U09 — Inicial

> Sense solucions. Sense presses. Obri l'IDE, dona-li la mà a la primera superclasse i fes que `extends` deixe de semblar màgia. L'herència en Java és com la de veritat: de vegades et portes genial amb les subclasses, de vegades vols renegar de tot. Però ningú no naix sabent usar `super`.

---

## Exercici 1: Què imprimeix? — La família musical

```java
class Instrumentista {
    void tocar() { System.out.println("L'instrumentista toca un instrument"); }
}

class Guitarrista extends Instrumentista {
    void tocar() { System.out.println("El guitarrista toca la guitarra"); }
}

class Baixista extends Guitarrista {
    void tocar() { System.out.println("El baixista toca el baix"); }
}

public class Banda {
    public static void main(String[] args) {
        Baixista b = new Baixista();
        b.tocar();
    }
}
```

Què imprimeix? Per què?

---

## Exercici 2: Troba l'error — extends mal usat

```java
public class Animal {
    private String especie;

    public Animal(String especie) {
        this.especie = especie;
    }
}

public class Gos extends Animal {
    private String raça;

    public Gos(String raça) {
        this.raça = raça;
    }
}
```

Este codi **no compila**. Per què? Explica l'error i corregeix-lo.

---

## Exercici 3: Completa el codi — el gat que crida el seu pare

```java
public class Animal {
    public void ferSo() {
        System.out.println("Algun so genèric...");
    }
}

public class Gat extends Animal {
    @Override
    public void ferSo() {
        ________.ferSo();   // primer el del pare
        System.out.println("¡MIAU!");
    }
}
```

Quina paraula falta al buit perquè `Gat` primer execute el so d'`Animal` i després el seu "¡MIAU!"? Escriu a més un `main` que cree un `Gat` i crida a `ferSo()`.

---

## Exercici 4: Escriu este programa — l'herència de vehicles

Crea una jerarquia de 3 nivells usant `extends`:

- `Vehicle` (atribut: `String marca`)
- `Cotxe` (atribut: `int numPortes`)
- `Esportiu` (atribut: `int velocitatMaxima`)

Cada classe ha de tindre un constructor que reba els seus atributs i use `super`. En `main()`, crea un `Esportiu` de marca "Ferrari", 2 portes i 340 km/h. Imprimeix els seus atributs.

---

## Exercici 5: Què imprimeix? — Polimorfisme amb referències

```java
class X {
    void missatge() { System.out.println("X"); }
}

class Y extends X {
    void missatge() { System.out.println("Y"); }
}

class Z extends Y { }

public class Test {
    public static void main(String[] args) {
        X ref1 = new Y();
        X ref2 = new Z();
        Y ref3 = new Z();

        ref1.missatge();
        ref2.missatge();
        ref3.missatge();
    }
}
```

Què imprimeix cada crida? Per què el tipus de la referència no decidix res?

---

## Exercici 6: Escriu este programa — la granja polimòrfica

Crea una classe `Animal` amb mètode `ferSo()`. Crea `Vaca`, `Ovella` i `Gallina` que el sobreescriguen. En `main()`, crea un `ArrayList<Animal>`, fica una vaca, una ovella i una gallina, recorre'l amb un for-each cridant a `ferSo()`.

```java
// Eixida esperada:
// Muuuu
// Beeee
// Cloc cloc
```

---

## Exercici 7: Troba l'error — @Override que no ho és

```java
public class Animal {
    public void ferSo() {
        System.out.println("...");
    }
}

public class Peix extends Animal {
    @Override
    public void ferSo() { }   // ¿compila?

    @Override
    public void nedar() { }   // ¿compila?
}
```

Una de les dos línies amb `@Override` impedix compilar. Quina i per què? Què t'avisa el compilador en l'instant en què escrius eixa línia?

---

## Exercici 8: Escriu este programa — el gos ben heretat

Parteix d'esta classe base:

```java
public class Animal {
    protected String nom;
    protected int edat;

    public Animal(String nom, int edat) {
        this.nom = nom;
        this.edat = edat;
    }
}
```

Escriu una classe `Gos extends Animal` amb:

- Constructor que use `super(nom, edat)`.
- Mètode `lladrar()` que imprimisca `nom + " diu: ¡Guau!"`.
- Un `main` que cree un `Gos("Firulais", 3)` i crida a `lladrar()`.

Respon: per què `Gos` pot usar `nom` i `edat` encara que no les declare?

---

## Exercici 9: Què imprimeix? — la cadena de constructors

```java
class Avi {
    public Avi() { System.out.println("Avi"); }
}

class Pare extends Avi {
    public Pare() { System.out.println("Pare"); }
}

class Fill extends Pare {
    public Fill() { System.out.println("Fill"); }
}

public class Test {
    public static void main(String[] args) {
        new Fill();
    }
}
```

Què imprimeix i per què en eixe ordre?