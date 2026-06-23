---
title: "Boletí 6 - Inicial: Herència i Polimorfisme"
nav_order: 6
---
Sense solucions. L'herència en Java és com la de veritat: de vegades et portes bé amb les subclasses, de vegades vols renegar de tot.

---

## Exercici 1: Què imprimeix? — La família musical

```java
class Music {
    void tocar() { System.out.println("El músic toca un instrument"); }
}
class Guitarrista extends Music {
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

## Exercici 2: Troba l'error — extends mal usat II

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

Este codi **no compila**. Per què?

---

## Exercici 3: Completa el codi — instanceof amb downcasting

Completa el següent programa perquè funcione correctament:

```java
Vehicle v = new Cotxe();
if (v ______ Cotxe) {
    ______ c = (______) v;
    c.conduir();
}
```

Declara les classes `Vehicle` (amb `moure()`) i `Cotxe` (amb `conduir()`).

---

## Exercici 4: Escriu este programa — l'herència de vehicles

Crea una jerarquia de 3 nivells usant `extends`:
- `Vehicle` (atribut: `String marca`)
- `Cotxe` (atribut: `int numPortes`)
- `Esportiu` (atribut: `int velocitatMaxima`)

En `main()`, crea un `Esportiu` de marca "Ferrari", 2 portes i 340 km/h.

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

---

## Exercici 6: Troba l'error — ClassCastException

```java
Animal a = new Gos();
Gat g = (Gat) a;
g.maullar();
```

Què ocorre en temps d'execució? Com ho arreglaries?

---

## Exercici 7: Escriu este programa — la granja polimòrfica

Crea una classe `Animal` amb mètode `ferSo()`. Crea `Vaca`, `Ovella` i `Gallina` que el sobreescriguen. En `main()`, crea un `ArrayList<Animal>` i recorre'l polimòrficament.

---

## 🔗 Referències per a seguir practicant

- **CodeWars:** [Is this a triangle?](https://www.codewars.com/kata/56606694ec01347ce800001b) (7 kyu)
- **CodeWars:** [Basic subclasses - Adam and Eve](https://www.codewars.com/kata/547274e24481cfc469000416) (8 kyu)
- **AceptaElReto.com:** [120 - Número de pares y nones](https://www.aceptaelreto.com/problem/statement.php?id=120)
- **AceptaElReto.com:** [154 - L'ascensor](https://www.aceptaelreto.com/problem/statement.php?id=154)
