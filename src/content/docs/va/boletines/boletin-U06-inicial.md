---
title: Butlletí U06 — Inicial
description: Exercicis bàsics de POO, Classes i Objectes
---

# 📝 Butlletí U06 — Inicial

> Sense solucions. Sense presses. Obri l'IDE, encén la fàbrica de galetes i fes que els teus objectes nasquen, parlen i funcionen. Ningú no naix sabent quan cal usar `this`.

---

## Exercici 1: El gos que parla

Escriu una classe `Gos` amb dos atributs: `String nom` i `int edat`. Inclou un mètode `void lladrar()` que imprimisca `"¡Guau guau! Soc [nom]"`. Després, en un `main`, crea un gos anomenat `Toby` de 3 anys i fes que lladre.

Pista: recorda que els atributs s'inicialitzen en el constructor amb `this`.

---

## Exercici 2: El telèfon amb bateria

Escriu una classe `Telefon` amb els atributs `String marca` i `int bateria`. Inclou un mètode `void trucar()` que imprimisca `"Trucant... (bateria al X%)"` i un altre `void carregar(int minuts)` que puge la bateria en els minuts rebuts. Crea en el `main` un `Telefon` de marca `"Nokia"` amb bateria inicial `50`, truca-hi i carrega'l `30` minuts.

Pista: `carregar(int minuts)` modifica l'atribut `bateria`: `this.bateria += minuts;`.

---

## Exercici 3: L'estudiant amb nota

Escriu una classe `Estudiant` amb els atributs `String nom` i `double nota`. Inclou un mètode `void mostrarEstat()` que imprimisca `"[nom] ha aprovat"` si la nota és major o igual que 5, o `"[nom] ha suspés"` si és menor. Crea en el `main` dos estudiants (una amb nota 8.5 i un altre amb nota 3) i mostra'n l'estat.

Pista: dins de `mostrarEstat()` pots usar `if`/`else` amb `this.nota`.

---

## Exercici 4: La pel·lícula en cartellera

Escriu una classe `Pelicula` amb els atributs `String titol` i `String genere`. Inclou un mètode `void mostrarCartellera()` que imprimisca `"Ara en cinemes: [titol] ([genere])"`. Crea en el `main` una pel·lícula `"El curs de Java"` de gènere `"Terror"` i mostra-la en cartellera.

Pista: el constructor rep els dos valors i els assigna amb `this`.

---

## Exercici 5: La persona educada

Escriu una classe `Persona` amb els atributs `String nom` i `int edat`. Usa un constructor amb paràmetres. Afegeix un mètode `void presentar-se()` que imprimisca `"Hola, soc [nom] i tinc [edat] anys."`. Crea en el `main` a `"Anna"` de 25 anys i fes que es presente.

Pista: esta és la classe amb què entendràs per què `this` separa l'atribut del paràmetre.

---

## Exercici 6: El cercle calculador

Escriu una classe `Cercle` amb l'atribut `double radi`. Inclou un mètode `double calcularArea()` que torne l'àrea (`π * radi²`). Usa `Math.PI` per a π. Crea en el `main` un cercle de radi `2.5` i mostra'n l'àrea.

Pista: dins del mètode, `return Math.PI * this.radi * this.radi;`.

---

## Exercici 7: El videojoc jugable

Escriu una classe `Videojoc` amb els atributs `String titol` i `int horesJugades`. Inclou un mètode `void jugar(int hores)` que sume les hores a `horesJugades` i un altre `void mostrar()` que imprimisca `"[titol] - X hores"`. Crea en el `main` un joc amb 10 hores, juga'n 5 més i mostra'l.

Pista: suma les hores a l'atribut: `this.horesJugades += hores;`.

---

## Exercici 8: Què imprimeix? — el taller de cotxes

Sense executar, escriu l'eixida exacta d'este programa:

```java
public class Taller {
    public static void main(String[] args) {
        Coche c1 = new Coche("Seat", 120);
        Coche c2 = new Coche("Ford", 90);
        c1.acelerar(30);
        c1.mostrar();
        c2.mostrar();
    }
}

class Coche {
    String marca;
    int velocidad;

    public Coche(String marca, int velocidad) {
        this.marca = marca;
        this.velocidad = velocidad;
    }

    void acelerar(int inc) {
        velocidad += inc;
    }

    void mostrar() {
        System.out.println(marca + " va a " + velocidad + " km/h");
    }
}
```

Pista: quants objectes hi ha? Cada un guarda la seua pròpia `velocidad`; accelerar el `c1` no toca el `c2`.

---

## Exercici 9: CodeWars — Object Oriented Piracy

Resol la kata **"Object Oriented Piracy"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/54fe05c4762e2e3047000add).

Crea la classe `Ship` amb un constructor que reba `draft` (calat en peus) i `crew` (tripulació), i un mètode `boolean isWorthIt()` que torne `true` si `draft - (crew * 1.5) > 20`.

Pista: guarda `draft` i `crew` en atributs amb `this` i usa els operadors `-` i `*` de la U02 dins de `isWorthIt()`.
