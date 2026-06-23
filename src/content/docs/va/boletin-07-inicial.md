---
title: "Boletí 5 - Inicial: Visibilitat, Encapsulació i Static"
nav_order: 13
---
Sense solucions. private no vol dir que sigues tímit, vol dir que protegeixes les teues dades. I static no és electricitat estàtica, és memòria compartida.

---

## Exercici 1: Troba l'error de visibilitat (la nevera)

Quines línies d'este codi donen error de compilació i per què?

```java
public class Nevera {
    public String marca;
    protected int capacitatLitres;
    double temperatura;
    private String codiDesbloqueig;

    public void mostrarInfo() {
        System.out.println(marca);
        System.out.println(capacitatLitres);
        System.out.println(temperatura);
        System.out.println(codiDesbloqueig);
    }
}

public class Amic {
    public void obrirNevera() {
        Nevera n = new Nevera();
        System.out.println(n.marca);
        System.out.println(n.capacitatLitres);
        System.out.println(n.temperatura);
        System.out.println(n.codiDesbloqueig);
    }
}
```

---

## Exercici 2: Completa els getters i setters de la classe Producte

Completa la classe `Producte` amb encapsulació real:

```java
public class Producte {
    private String nom;
    private double preu;
    private int stock;

    public String getNom() { // què va ací? }
    public void setNom(String nom) { // què va ací? }
    public double getPreu() { // què va ací? }
    public void setPreu(double preu) { // què va ací? }
    public int getStock() { // què va ací? }
    public void setStock(int stock) { // què va ací? }
    public boolean vendre(int quantitat) { // què va ací? }
}
```

---

## Exercici 3: Què imprimeix? Static vs instància II

Sense executar, digues què imprimeix. Pista: té truc amb el static.

```java
public class Universitat {
    public static String nomUniversitat = "UAX";
    public String nomAlumne;

    public Universitat(String nomAlumne) {
        this.nomAlumne = nomAlumne;
    }

    public static void main(String[] args) {
        Universitat u1 = new Universitat("Anna");
        Universitat u2 = new Universitat("Lluís");
        u1.mostrar();
        u2.mostrar();
        Universitat.nomUniversitat = "UPM";
        u1.mostrar();
        u2.mostrar();
    }
}
```

---

## Exercici 4: Escriu la classe utilitària MathUtils

Crea una classe `MathUtils` amb constructor privat i mètodes estàtics:
- `int maxim(int a, int b)` — torna el major de dos nombres
- `int minim(int a, int b)` — torna el menor de dos nombres
- `boolean esParell(int n)` — torna true si n és parell

---

## Exercici 5: Escriu la classe AppConfig

Crea una classe `AppConfig` amb constants `static final`:
- `NOM_APP = "MiAplicacio"`
- `VERSIO = "2.0.0"`
- `MAX_INTENTS = 3`

A més, un atribut `private static int usuarisConnectats` amb getter i mètodes per a incrementar/decrementar. No es pot instanciar la classe.

---

## Exercici 6: AceptaElReto — 117 Trobar el major

Resol el problema **117 — Trobar el major** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=117).

Llig nombres fins que s'introduïsca un nombre igual a l'anterior. En eixe moment, imprimeix quants nombres es van llegir en total.

---

## Exercici 7: CodeWars — Opposite number

Resol la kata **"Opposite number"** (8 kyu) en CodeWars.

Completa el mètode `opposite` que rep un nombre i torna el seu oposat (negatiu si és positiu, positiu si és negatiu).

```java
public class OppositeNumber {
    public static int opposite(int number) {
        // el teu codi ací
    }
}
```
