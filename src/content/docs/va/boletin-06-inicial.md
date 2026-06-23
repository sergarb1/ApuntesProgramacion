---
title: "Boletí 4 - Inicial: POO: Classes i Objectes"
nav_order: 10
---
Sense solucions. Les classes no es crearan soles. I si es crearen soles, probablement serien classes abstractes, però això és per a un altre butlletí.

---

## Exercici 1: Completa la classe Alumne

Falten algunes parts. Completa-les perquè funcione:

```java
public class Alumne {
    String nom;
    String cognoms;
    int edat;

    // Completa el constructor: ha de rebre nom, cognoms i edat
    public Alumne(String nom, String cognoms, int edat) {
        // Què va ací?
    }

    public void presentarSe() {
        System.out.println("Hola, soc " + nom + " " + cognoms);
    }

    public void cumpleAnys() {
        // Incrementa l'edat en 1
    }
}
```

---

## Exercici 2: Què imprimeix?

Sense executar, digues què ix:

```java
public class Comptador {
    int valor;

    public Comptador(int valorInicial) {
        valor = valorInicial;
    }

    public void incrementar() {
        valor++;
    }

    public void decrementar() {
        valor--;
    }

    public static void main(String[] args) {
        Comptador c = new Comptador(10);
        c.incrementar();
        c.incrementar();
        c.decrementar();
        c.incrementar();
        System.out.println("Valor final: " + c.valor);
    }
}
```

---

## Exercici 3: Troba l'error

```java
public class Producte {
    String nom;
    double preu;

    public Producte(String nom, double preu) {
        nom = nom;
        preu = preu;
    }

    public void mostrar() {
        System.out.println(nom + " costa " + preu + "€");
    }
}
```

Hi ha 1 error. Troba'l.

---

## Exercici 4: Escriu la classe Pel·lícula

Crea una classe `Pelicula` amb:
- Atributs: `String titol`, `String genere`, `int durada` (en minuts)
- Constructor que reba els tres paràmetres
- Mètode `void reproduir()` que imprimeixca "Reproduint [títol] ([gènere]) - [durada] min"
- Mètode `boolean esLlarga()` que torne `true` si la durada és major a 120 minuts

---

## Exercici 5: Constructor buit i setters

Què imprimeix aquest codi?

```java
public class Estudiant {
    String nom;
    double notaMitjana;

    public Estudiant() {
        this.nom = "Desconegut";
        this.notaMitjana = 5.0;
    }

    public Estudiant(String nom, double notaMitjana) {
        this.nom = nom;
        this.notaMitjana = notaMitjana;
    }

    public static void main(String[] args) {
        Estudiant e1 = new Estudiant();
        Estudiant e2 = new Estudiant("Carles", 8.5);
        System.out.println(e1.nom + " - " + e1.notaMitjana);
        System.out.println(e2.nom + " - " + e2.notaMitjana);
    }
}
```

---

## Exercici 6: AceptaElReto — 417 Nombres binomials

Resol el problema **417 — Nombres binomials** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=417).

Calcula el coeficient binomial "n sobre k". Tradicionalment es defineix com `n! / (k! * (n-k)!)`.

---

## Exercici 7: CodeWars — Return the day

Resol la kata **"Return the day"** (8 kyu) en CodeWars.

Crea una classe `DayOfWeek` amb un mètode estàtic `getDay(int n)` que torne el dia de la setmana corresponent.
