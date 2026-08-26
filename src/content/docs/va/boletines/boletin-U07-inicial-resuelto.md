---
title: Butlletí U07 — Inicial Resolt
description: Els mateixos exercicis que el butlletí inicial, amb solucions
---

# 📝 Butlletí U07 — Inicial (Resolt)

> Les solucions estan ocultes en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## Exercici 1: La casa de cristall

<details>
<summary>🔄 Solució</summary>

```java
public class Persona {
    private String nom;
    private int edat;

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
        this.edat = edat;
    }

    public static void main(String[] args) {
        Persona p = new Persona();
        p.setNom("Anna");
        p.setEdat(25);
        System.out.println(p.getNom() + " té " + p.getEdat() + " anys.");
    }
}
```

Els atributs passen a `private` i tot l'accés es fa amb getters i setters. El `this` en els setters desambiguïx: el paràmetre s'assigna a l'atribut, no a si mateix.

</details>

---

## Exercici 2: El cotxe del veïnat

<details>
<summary>🔄 Solució</summary>

```java
public class Cotxe {
    private String marca;
    private double velocitat;

    public Cotxe(String marca) {
        this.marca = marca;
        this.velocitat = 0;
    }

    public String getMarca() {
        return marca;
    }

    public double getVelocitat() {
        return velocitat;
    }

    public void setVelocitat(double velocitat) {
        if (velocitat >= 0 && velocitat <= 200) {
            this.velocitat = velocitat;
        } else {
            System.out.println("Velocitat invàlida.");
        }
    }

    public static void main(String[] args) {
        Cotxe c = new Cotxe("Seat");
        c.setVelocitat(-50);
        c.setVelocitat(120);
        System.out.println("Velocitat: " + c.getVelocitat());
    }
}
```

Eixida: `Velocitat invàlida.` (pel -50) i després `Velocitat: 120.0`. El setter valida abans de tocar l'atribut: és la frontera que protegix l'estat de l'objecte.

</details>

---

## Exercici 3: El termòmetre amb cervell

<details>
<summary>🔄 Solució</summary>

```java
public class Termometre {
    private double temperatura;

    public Termometre() {
        temperatura = 20.0;
    }

    public double getTemperatura() {
        return temperatura;
    }

    public void setTemperatura(double temperatura) {
        if (temperatura >= -273.15 && temperatura <= 100.0) {
            this.temperatura = temperatura;
        } else {
            System.out.println("Temperatura fora de rang.");
        }
    }

    public static void main(String[] args) {
        Termometre t = new Termometre();
        t.setTemperatura(-500);
        t.setTemperatura(36.5);
        System.out.println("Temperatura: " + t.getTemperatura());
    }
}
```

Eixida: `Temperatura fora de rang.` i després `Temperatura: 36.5`. El setter convertix la classe en un "termòmetre amb cervell": no accepta qualsevol número, només valors físicament possibles.

</details>

---

## Exercici 4: Getter sense setter

<details>
<summary>🔄 Solució</summary>

```java
public class Configuracio {
    private String idioma;

    public Configuracio(String idioma) {
        this.idioma = idioma;
    }

    public String getIdioma() {
        return idioma;
    }

    public static void main(String[] args) {
        Configuracio config = new Configuracio("es");
        System.out.println("Idioma: " + config.getIdioma());
    }
}
```

No té setter perquè l'idioma és una decisió d'una sola vegada: es tria en el constructor i prou. Si algú intentàs `config.idioma = "va"` des de fora, **no compilaria**: `idioma` és `private`, i fora de la classe no es pot tocar. Obligar que el canvi passe per un setter (o que no existisca) és l'essència de l'encapsulació.

</details>

---

## Exercici 5: El comptador de la classe

<details>
<summary>🔄 Solució</summary>

```java
public class Comptador {
    public static int total = 0;

    public Comptador() {
        total++;
    }

    public static void main(String[] args) {
        Comptador c1 = new Comptador();
        Comptador c2 = new Comptador();
        Comptador c3 = new Comptador();
        System.out.println("Total: " + Comptador.total);
    }
}
```

`total` val **3**. És `static`: una sola còpia compartida per tota la classe. Cada `new` crida al constructor i l'incrementa; com que els tres objectes compartixen la mateixa variable, el comptador conta els tres. No és 1 perquè no hi ha una còpia per objecte: n'hi ha una única de classe.

</details>

---

## Exercici 6: La calculadora sense piles

<details>
<summary>🔄 Solució</summary>

```java
public class Utilitats {
    public static int sumar(int a, int b) {
        return a + b;
    }

    public static int restar(int a, int b) {
        return a - b;
    }

    public static void main(String[] args) {
        System.out.println(Utilitats.sumar(5, 3));
        System.out.println(Utilitats.restar(10, 4));
    }
}
```

Eixida: `8` i `6`. Com que els mètodes són `static`, es diuen amb el nom de la classe (`Utilitats.sumar`), sense `new` i sense objecte. És el mateix patró que ja uses amb `Math.sqrt` o `Integer.parseInt`.

</details>

---

## Exercici 7: Les constants del barri

<details>
<summary>🔄 Solució</summary>

```java
public class Constants {
    public static final double IVA = 0.21;
    public static final int MAX_INTENTS_LOGIN = 3;
    public static final String NOM_APP = "GestioCurs";

    public static void main(String[] args) {
        System.out.println("IVA: " + Constants.IVA);
        System.out.println("Màxim intents: " + Constants.MAX_INTENTS_LOGIN);
        System.out.println("App: " + Constants.NOM_APP);
        // Constants.IVA = 0.5; // Error de compilació
    }
}
```

En intentar `Constants.IVA = 0.5;` el compilador ho **prohibix**: `final` significa que el valor no es pot reassignar després de la seua declaració. Les constants són a prova de bombes, per això van en MAJÚSCULES amb `_`: tothom sap que no es toquen.

</details>

---

## Exercici 8: Què imprimeix? — el trencaclosques estàtic

<details>
<summary>🔄 Solució</summary>

Imprimix **`1 2 2`**.

`Trencaclosques.s` és `static`: una sola còpia compartida. Amb el primer `new`, `s` passa a 1 i `t1.i` es copia eixe 1. Amb el segon `new`, `s` passa a 2 i `t2.i` es copia eixe 2. Al final, `t1.i` = 1, `t2.i` = 2 i `Trencaclosques.s` = 2. L'estàtic puja per a tots; el d'instància es congela amb el valor que tenia la classe en el moment de nàixer.

</details>

---

## Exercici 9: CodeWars — Square(n) Sum

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static int squareSum(int[] n) {
        int suma = 0;
        for (int i = 0; i < n.length; i++) {
            suma += n[i] * n[i];
        }
        return suma;
    }
}
```

Per a `[1, 2, 2]` → `1 + 4 + 4 = 9`. El bucle recorre cada element i acumula `n[i] * n[i]`. Nota el `static`: CodeWars exigix el mètode estàtic per a poder cridar-lo sense crear objectes, just el que acabeu de practicar.

</details>