---
title: Butlletí U07 — Inicial Resolt
description: Els mateixos exercicis que el butlletí inicial, amb solucions
---

# 📝 Butlletí U07 — Inicial (Resolt)

> Les solucions estan amagades en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## Exercici 1: El gos que parla

<details>
<summary>🔄 Solució</summary>

```java
public class Gos {
    String nom;
    int edat;

    public Gos(String nom, int edat) {
        this.nom = nom;
        this.edat = edat;
    }

    void lladrar() {
        System.out.println("¡Guau guau! Soc " + nom);
    }

    public static void main(String[] args) {
        Gos toby = new Gos("Toby", 3);
        toby.lladrar();
    }
}
```

Eixida: `¡Guau guau! Soc Toby`

El constructor amb `this` col·loca el nom i l'edat en l'objecte acabat de nàixer. El mètode `lladrar()` no rep res: usa l'atribut `nom` que ja va quedar guardat.

</details>

---

## Exercici 2: El telèfon amb bateria

<details>
<summary>🔄 Solució</summary>

```java
public class Telefon {
    String marca;
    int bateria;

    public Telefon(String marca, int bateria) {
        this.marca = marca;
        this.bateria = bateria;
    }

    void trucar() {
        System.out.println("Trucant... (bateria al " + bateria + "%)");
    }

    void carregar(int minuts) {
        this.bateria += minuts;
    }

    public static void main(String[] args) {
        Telefon mobil = new Telefon("Nokia", 50);
        mobil.trucar();
        mobil.carregar(30);
        mobil.trucar();
    }
}
```

Eixida:

```
Trucant... (bateria al 50%)
Trucant... (bateria al 80%)
```

`carregar(int minuts)` modifica l'atribut amb `this.bateria += minuts;`. El mateix objecte conserva la bateria entre trucades: això és tindre estat.

</details>

---

## Exercici 3: L'estudiant amb nota

<details>
<summary>🔄 Solució</summary>

```java
public class Estudiant {
    String nom;
    double nota;

    public Estudiant(String nom, double nota) {
        this.nom = nom;
        this.nota = nota;
    }

    void mostrarEstat() {
        if (nota >= 5) {
            System.out.println(nom + " ha aprovat");
        } else {
            System.out.println(nom + " ha suspés");
        }
    }

    public static void main(String[] args) {
        Estudiant anna = new Estudiant("Anna", 8.5);
        Estudiant lluis = new Estudiant("Lluís", 3.0);
        anna.mostrarEstat();
        lluis.mostrarEstat();
    }
}
```

Eixida:

```
Anna ha aprovat
Lluís ha suspés
```

El mètode mescla dos mons: usa els atributs de l'objecte (`nom`, `nota`) amb la lògica de decisió (`if`/`else`) que vas aprendre en la U03. Dos objectes, dos estats, una classe.

</details>

---

## Exercici 4: La pel·lícula en cartellera

<details>
<summary>🔄 Solució</summary>

```java
public class Pelicula {
    String titol;
    String genere;

    public Pelicula(String titol, String genere) {
        this.titol = titol;
        this.genere = genere;
    }

    void mostrarCartellera() {
        System.out.println("Ara en cinemes: " + titol + " (" + genere + ")");
    }

    public static void main(String[] args) {
        Pelicula p = new Pelicula("El curs de Java", "Terror");
        p.mostrarCartellera();
    }
}
```

Eixida: `Ara en cinemes: El curs de Java (Terror)`

El mateix patró que el gos i el telèfon: atributs, constructor amb `this`, mètode que els usa. A aquestes alçades ja hauries de notar que totes les classes fàcils s'assemblen.

</details>

---

## Exercici 5: La persona educada

<details>
<summary>🔄 Solució</summary>

```java
public class Persona {
    String nom;
    int edat;

    public Persona(String nom, int edat) {
        this.nom = nom;
        this.edat = edat;
    }

    void presentarSe() {
        System.out.println("Hola, soc " + nom + " i tinc " + edat + " anys.");
    }

    public static void main(String[] args) {
        Persona anna = new Persona("Anna", 25);
        anna.presentarSe();
    }
}
```

Eixida: `Hola, soc Anna i tinc 25 anys.`

Ací és on `this` demostra el seu valor: sense `this`, `nom = nom` assignaria el paràmetre al paràmetre i l'atribut quedaria en `null`. Amb `this`, l'atribut rep el valor del paràmetre.

</details>

---

## Exercici 6: El cercle calculador

<details>
<summary>🔄 Solució</summary>

```java
public class Cercle {
    double radi;

    public Cercle(double radi) {
        this.radi = radi;
    }

    double calcularArea() {
        return Math.PI * this.radi * this.radi;
    }

    public static void main(String[] args) {
        Cercle c = new Cercle(2.5);
        System.out.println("Àrea: " + c.calcularArea());
    }
}
```

Eixida: `Àrea: 19.634954084936208`

Este mètode no és `void`: usa `return` per a tornar l'àrea. Els mètodes que *calculen* tornen un valor; els que només *mostren* són `void`. Eixa distinció és la meitat de la batalla d'esta unitat.

</details>

---

## Exercici 7: El videojoc jugable

<details>
<summary>🔄 Solució</summary>

```java
public class Videojoc {
    String titol;
    int horesJugades;

    public Videojoc(String titol, int horesJugades) {
        this.titol = titol;
        this.horesJugades = horesJugades;
    }

    void jugar(int hores) {
        this.horesJugades += hores;
    }

    void mostrar() {
        System.out.println(titol + " - " + horesJugades + " hores");
    }

    public static void main(String[] args) {
        Videojoc joc = new Videojoc("Minecraft", 10);
        joc.jugar(5);
        joc.mostrar();
    }
}
```

Eixida: `Minecraft - 15 hores`

El mètode `jugar(int hores)` és un *setter* informal: modifica l'estat de l'objecte. L'objecte no és una caixa estàtica: els seus atributs canvien amb els mètodes. Això és la vida d'un objecte.

</details>

---

## Exercici 8: Què imprimeix? — el taller de cotxes

<details>
<summary>🔄 Solució</summary>

Imprimeix:

```
Seat va a 150 km/h
Ford va a 90 km/h
```

Hi ha **dos** objectes (`c1` i `c2`), cada un amb la seua pròpia `velocidad`. `c1.acelerar(30)` suma 30 a la velocitat de `c1` (120 + 30 = 150) però no toca la de `c2`. Quan `c2.mostrar()` corre, la seua velocitat continua sent 90. Els atributs d'un objecte són privats d'eixe objecte.

</details>

---

## Exercici 9: CodeWars — Object Oriented Piracy

<details>
<summary>🔄 Solució</summary>

```java
public class Ship {
    private final double draft;
    private final int crew;

    public Ship(double draft, int crew) {
        this.draft = draft;
        this.crew = crew;
    }

    public boolean isWorthIt() {
        return draft - (crew * 1.5) > 20;
    }
}
```

El constructor guarda `draft` i `crew` amb `this`, i `isWorthIt()` aplica la fórmula: cada membre de la tripulació reduïx el calat útil en 1.5 peus. Si el que queda supera 20, el vaixell val la pena. Objecte + operacions de la U02, resolt.

</details>
