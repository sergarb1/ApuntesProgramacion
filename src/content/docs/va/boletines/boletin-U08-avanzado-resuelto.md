---
title: Butlletí U08 — Avançat Resolt
description: Els mateixos exercicis que el butlletí avançat, amb solucions
---

# 📝 Butlletí U08 — Avançat (Resolt)

> Les solucions estan ocultes en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## ⭐ Exercici 1: Empleat amb validació

<details>
<summary>🔄 Solució</summary>

```java
public class Empleat {
    private String nom;
    private double salari;

    public Empleat(String nom, double salari) {
        this.nom = nom;
        setSalari(salari);
    }

    public String getNom() {
        return nom;
    }

    public double getSalari() {
        return salari;
    }

    public void setSalari(double salari) {
        if (salari >= 0) {
            this.salari = salari;
        } else {
            System.out.println("Salari invàlid.");
        }
    }

    public static void main(String[] args) {
        Empleat e = new Empleat("Laura", 1500);
        e.setSalari(-300);
        System.out.println(e.getNom() + ": " + e.getSalari());
    }
}
```

Eixida: `Salari invàlid.` i `Laura: 1500.0`. El truc: el constructor crida a `setSalari(salari)`, així la validació viu en un sol lloc i no hi ha dues còpies de la mateixa regla.

</details>

---

## ⭐ Exercici 2: Cercle encapsulat

<details>
<summary>🔄 Solució</summary>

```java
public class Cercle {
    private double radi;

    public Cercle(double radi) {
        setRadi(radi);
    }

    public double getRadi() {
        return radi;
    }

    public void setRadi(double radi) {
        if (radi > 0) {
            this.radi = radi;
        } else {
            System.out.println("Radi invàlid.");
        }
    }

    public double getArea() {
        return Math.PI * radi * radi;
    }

    public double getPerimetre() {
        return 2 * Math.PI * radi;
    }

    public static void main(String[] args) {
        Cercle c = new Cercle(5);
        System.out.println("Àrea: " + c.getArea());
        System.out.println("Perímetre: " + c.getPerimetre());
    }
}
```

`getArea()` i `getPerimetre()` són getters "calculats": no retornen un atribut, sinó un valor derivat d'ell. `Math.PI` és una constant estàtica, i els mètodes els crees tu amb `static` quan convé. Àrea del radi 5: ≈ 78.54, perímetre ≈ 31.42.

</details>

---

## ⭐⭐ Exercici 3: JavaBean Alumne

<details>
<summary>🔄 Solució</summary>

```java
public class Alumne {
    private String nom;
    private int edat;
    private double notaMitjana;

    public Alumne() {}

    public Alumne(String nom, int edat, double notaMitjana) {
        this.nom = nom;
        setEdat(edat);
        setNotaMitjana(notaMitjana);
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getEdat() {
        return edat;
    }

    public void setEdat(int edat) {
        if (edat >= 0 && edat <= 120) {
            this.edat = edat;
        } else {
            System.out.println("Edat invàlida.");
        }
    }

    public double getNotaMitjana() {
        return notaMitjana;
    }

    public void setNotaMitjana(double notaMitjana) {
        if (notaMitjana >= 0 && notaMitjana <= 10) {
            this.notaMitjana = notaMitjana;
        } else {
            System.out.println("Nota invàlida.");
        }
    }

    public static void main(String[] args) {
        Alumne a = new Alumne("Sara", 18, 7.5);
        a.setNotaMitjana(8.75);
        System.out.println(a.getNom() + ": " + a.getNotaMitjana());
    }
}
```

JavaBean: atributs privats, constructors (buit i amb dades) i getters/setters de tot. Els setters amb validació eviten estats impossibles (edat 250, nota 15). El constructor amb paràmetres reutilitza els setters per a no duplicar regles.

</details>

---

## ⭐⭐ Exercici 4: Hora immutable

<details>
<summary>🔄 Solució</summary>

```java
public class Hora {
    private final int hora;
    private final int minut;

    public Hora(int hora, int minut) {
        if (hora < 0 || hora > 23 || minut < 0 || minut > 59) {
            throw new IllegalArgumentException("Hora o minut invàlids.");
        }
        this.hora = hora;
        this.minut = minut;
    }

    public int getHora() {
        return hora;
    }

    public int getMinut() {
        return minut;
    }

    public String mostrar() {
        return String.format("%02d:%02d", hora, minut);
    }

    public static void main(String[] args) {
        Hora h = new Hora(9, 5);
        System.out.println(h.mostrar());
    }
}
```

Eixida: `09:05`. No necessita setters perquè és **immutable**: una vegada creada, el seu valor no canvia mai (els `final` ho garantixen). Canviar l'hora és crear una `Hora` nova. El constructor usa `throw` (vist en la U03) per als valors impossibles.

</details>

---

## ⭐⭐ Exercici 5: Què imprimeix? — el trencaclosques dels gats

<details>
<summary>🔄 Solució</summary>

Imprimix:

```
Bigotis (7 vides)
Garfield (8 vides)
Total: 2
```

`Bigotis` perd 2 vides (de 9 a 7), `Garfield` en perd 1 (de 9 a 8). `totalGats` és `static` i puja amb cada `new`, així que val 2. Les `vides` són de cada gat; el `totalGats`, de la classe. `toString()` és el mètode que Java crida en imprimir un objecte amb `System.out.println`.

</details>

---

## ⭐⭐ Exercici 6: Comptador d'usuaris

<details>
<summary>🔄 Solució</summary>

```java
public class Usuari {
    private static int comptador = 0;
    private int id;

    public Usuari() {
        comptador++;
        id = comptador;
    }

    public int getId() {
        return id;
    }

    public static int getTotalUsuaris() {
        return comptador;
    }

    public static void main(String[] args) {
        Usuari u1 = new Usuari();
        Usuari u2 = new Usuari();
        Usuari u3 = new Usuari();
        Usuari u4 = new Usuari();
        Usuari u5 = new Usuari();
        System.out.println("Últim id: " + u5.getId());
        System.out.println("Total: " + Usuari.getTotalUsuaris());
    }
}
```

Eixida: `Últim id: 5` i `Total: 5`. El patró "comptador + id": `comptador` (estàtic) puja en cada constructor i l'objecte es guarda el seu número com a `id`. `getTotalUsuaris()` és `static` perquè la pregunta se li fa a la classe, no a un usuari concret.

</details>

---

## ⭐⭐⭐ Exercici 7: La classe utilitària OperacionsArray

<details>
<summary>🔄 Solució</summary>

```java
public class OperacionsArray {
    private OperacionsArray() {}

    public static int suma(int[] numeros) {
        int suma = 0;
        for (int numero : numeros) {
            suma += numero;
        }
        return suma;
    }

    public static double mitjana(double[] numeros) {
        double suma = 0;
        for (double numero : numeros) {
            suma += numero;
        }
        return numeros.length > 0 ? suma / numeros.length : 0;
    }

    public static int maxim(int[] numeros) {
        int max = numeros[0];
        for (int i = 1; i < numeros.length; i++) {
            if (numeros[i] > max) {
                max = numeros[i];
            }
        }
        return max;
    }

    public static boolean estaOrdenat(int[] numeros) {
        for (int i = 1; i < numeros.length; i++) {
            if (numeros[i] < numeros[i - 1]) {
                return false;
            }
        }
        return true;
    }

    public static void main(String[] args) {
        System.out.println("Suma: " + OperacionsArray.suma(new int[]{3, 1, 4, 1, 5}));
        System.out.println("Màxim: " + OperacionsArray.maxim(new int[]{3, 1, 4, 1, 5}));
        System.out.println("Ordenat: " + OperacionsArray.estaOrdenat(new int[]{1, 2, 3}));
    }
}
```

Constructor privat + tot `static` = classe utilitària, com `Math`. `estaOrdenat` retorna `false` en seguint que trobe una parella fora d'orde (`return` primerenc). El `for...each` de la U04 es pot usar ja: recorre sense índex.

</details>

---

## ⭐⭐⭐ Exercici 8: Validador de dades

<details>
<summary>🔄 Solució</summary>

```java
public class Validador {
    private Validador() {}

    public static boolean esEmailValid(String email) {
        if (email == null) {
            return false;
        }
        int arrova = email.indexOf('@');
        if (arrova < 1) {
            return false;
        }
        if (email.indexOf('@', arrova + 1) != -1) {
            return false;
        }
        return email.indexOf('.', arrova + 1) != -1;
    }

    public static boolean esEdatValida(int edat) {
        return edat >= 0 && edat <= 120;
    }

    public static boolean esTextNoBuit(String text) {
        return text != null && !text.trim().isEmpty();
    }

    public static void main(String[] args) {
        System.out.println(Validador.esEmailValid("ana@mail.com"));
        System.out.println(Validador.esEmailValid("ana@"));
        System.out.println(Validador.esEdatValida(-5));
        System.out.println(Validador.esEdatValida(200));
        System.out.println(Validador.esTextNoBuit("  "));
    }
}
```

Eixida: `true`, `false`, `false`, `false`, `false`. `esEmailValid` exigix: alguna cosa abans de la `@`, una sola `@`, i un `.` després. `indexOf('@', pos)` busca des de `pos` endavant. Cada condició fallida ix amb `false` a l'instant: sense `else` encadenats.

</details>

---

## ⭐⭐⭐ Exercici 9: El gran repte — refactoritza el banc

<details>
<summary>🔄 Solució</summary>

```java
public class CompteBancari {
    public static final String NOM_BANC = "Banc DAM";

    private String titular;
    private double saldo;

    public CompteBancari(String titular, double saldo) {
        this.titular = titular;
        if (saldo >= 0) {
            this.saldo = saldo;
        } else {
            System.out.println("Saldo inicial invàlid.");
        }
    }

    public String getTitular() {
        return titular;
    }

    public double getSaldo() {
        return saldo;
    }

    public void retirar(double quantitat) {
        if (quantitat <= 0) {
            System.out.println("Quantitat invàlida.");
            return;
        }
        if (quantitat > saldo) {
            System.out.println("Saldo insuficient.");
            return;
        }
        saldo = saldo - quantitat;
    }

    public void ingressar(double quantitat) {
        if (quantitat <= 0) {
            System.out.println("Quantitat invàlida.");
            return;
        }
        saldo = saldo + quantitat;
    }

    public static void main(String[] args) {
        CompteBancari compte = new CompteBancari("Ana", 100);
        compte.ingressar(50);
        compte.retirar(400);
        System.out.println("Saldo: " + compte.getSaldo());
    }
}
```

Eixida: `Saldo insuficient.` i `Saldo: 150.0`. El constructor corregit usa `this` (el bug original assignava el paràmetre a si mateix). Sense setter de saldo, només `ingressar` i `retirar` poden tocar-lo, i totes dues validen. La constant dona identitat al banc. El compte ja no pot quedar en negatiu ni en valors arbitraris.

</details>