---
title: Butlletí U06 — Avançat Resolt
description: Els mateixos exercicis que el butlletí avançat, amb solucions
---

# 📝 Butlletí U06 — Avançat (Resolt)

> Les solucions estan amagades. Intenta-ho de veritat abans de destapar-les.

---

## ⭐ Exercici 1: La biblioteca

<details>
<summary>🔄 Solució</summary>

```java
public class Llibre {
    String titol;
    String autor;
    int pagines;

    public Llibre(String titol, String autor, int pagines) {
        this.titol = titol;
        this.autor = autor;
        this.pagines = pagines;
    }

    void mostrarInfo() {
        System.out.println(titol + ", de " + autor + " (" + pagines + " pàgines)");
    }

    public static void main(String[] args) {
        Llibre quixot = new Llibre("El Quixot", "Miguel de Cervantes", 863);
        Llibre java = new Llibre("Java", "Sergi", 100);
        quixot.mostrarInfo();
        java.mostrarInfo();
    }
}
```

Tres atributs, tres assignacions amb `this`, un mètode que els combina. Dos llibres, dos objectes, dos eixides independents.

</details>

---

## ⭐ Exercici 2: El rectangle que raona

<details>
<summary>🔄 Solució</summary>

```java
public class Rectangle {
    double ample;
    double alt;

    public Rectangle(double ample, double alt) {
        this.ample = ample;
        this.alt = alt;
    }

    double calcularArea() {
        return ample * alt;
    }

    double calcularPerimetre() {
        return 2 * (ample + alt);
    }

    boolean esQuadrat() {
        return ample == alt;
    }

    public static void main(String[] args) {
        Rectangle quadrat = new Rectangle(4, 4);
        Rectangle rectangle = new Rectangle(5, 8);

        System.out.println("Quadrat: àrea " + quadrat.calcularArea()
                + ", perímetre " + quadrat.calcularPerimetre()
                + ", és quadrat? " + quadrat.esQuadrat());
        System.out.println("Rectangle: àrea " + rectangle.calcularArea()
                + ", perímetre " + rectangle.calcularPerimetre()
                + ", és quadrat? " + rectangle.esQuadrat());
    }
}
```

Eixida:

```
Quadrat: àrea 16.0, perímetre 16.0, és quadrat? true
Rectangle: àrea 40.0, perímetre 26.0, és quadrat? false
```

Tres mètodes que *tornen* valors. Fixa't: `esQuadrat()` convertix una comparació en un booleà d'un sol `return`. Objectes que raonen, no només que mostren.

</details>

---

## ⭐ Exercici 3: El compte bancari blindat

<details>
<summary>🔄 Solució</summary>

```java
public class CompteBancari {
    String titular;
    double saldo;

    public CompteBancari(String titular, double saldo) {
        this.titular = titular;
        this.saldo = saldo;
    }

    void ingressar(double quantitat) {
        this.saldo += quantitat;
    }

    void retirar(double quantitat) {
        if (quantitat <= this.saldo) {
            this.saldo -= quantitat;
        } else {
            System.out.println("Saldo insuficient");
        }
    }

    void mostrar() {
        System.out.println("Titular: " + titular + " | Saldo: " + saldo + " €");
    }

    public static void main(String[] args) {
        CompteBancari compte = new CompteBancari("Anna", 100);
        compte.retirar(30);
        compte.retirar(200);
        compte.mostrar();
    }
}
```

Eixida:

```
Saldo insuficient
Titular: Anna | Saldo: 70 €
```

L'`if` de `retirar` és el guardià: la retirada de 200 € es rebutja perquè supera el saldo, i el compte no queda mai en negatiu. Un objecte que es protegix a si mateix.

</details>

---

## ⭐⭐ Exercici 4: L'hora que es corregeix sola

<details>
<summary>🔄 Solució</summary>

```java
public class Hora {
    int hora;
    int minut;
    int segon;

    public Hora(int hora, int minut, int segon) {
        if (hora < 0 || hora > 23) {
            hora = 0;
        }
        if (minut < 0 || minut > 59) {
            minut = 0;
        }
        if (segon < 0 || segon > 59) {
            segon = 0;
        }
        this.hora = hora;
        this.minut = minut;
        this.segon = segon;
    }

    void incrementarSegon() {
        segon++;
        if (segon == 60) {
            segon = 0;
            minut++;
            if (minut == 60) {
                minut = 0;
                hora++;
                if (hora == 24) {
                    hora = 0;
                }
            }
        }
    }

    void mostrar() {
        String h = hora < 10 ? "0" + hora : "" + hora;
        String m = minut < 10 ? "0" + minut : "" + minut;
        String s = segon < 10 ? "0" + segon : "" + segon;
        System.out.println(h + ":" + m + ":" + s);
    }

    public static void main(String[] args) {
        Hora h = new Hora(23, 59, 59);
        h.incrementarSegon();
        h.mostrar();
    }
}
```

Eixida: `00:00:00`

Tres nivells de validació en el constructor i tres arrossegaments encadenats en `incrementarSegon()`. De 23:59:59 passa a 00:00:00: l'hora es corregeix sola perquè cada unitat sap quan reinicia i avisa la següent.

</details>

---

## ⭐⭐ Exercici 5: Què imprimeix? — el ball de referències

<details>
<summary>🔄 Solució</summary>

Imprimeix:

```
a.x = 10
c.x = 99
```

**Primera part:** `b = a` copia la *referència*, no l'objecte. `b.x = 10` modifica el mateix objecte que veu `a`, així que `a.x` també és 10.

**Segona part:** en cridar `cambiar(c)`, el paràmetre `p` rep una *còpia* de la referència. `p.x = 99` modifica l'objecte original (per això `c.x` és 99). Però `p = new Punto(50, 50)` només reassigna la còpia local: l'objecte de `c` no canvia i el nou `Punto` es perd en acabar el mètode. En Java les referències es passen per valor.

</details>

---

## ⭐⭐ Exercici 6: El correu que s'encadena

<details>
<summary>🔄 Solució</summary>

```java
public class Email {
    String remitent;
    String destinatari;
    String assumpte;

    public Email(String remitent, String destinatari, String assumpte) {
        this.remitent = remitent;
        this.destinatari = destinatari;
        this.assumpte = assumpte;
    }

    public Email(String remitent, String destinatari) {
        this(remitent, destinatari, "(sense assumpte)");
    }

    public Email(String remitent) {
        this(remitent, "(sense destí)");
    }

    void mostrar() {
        System.out.println("De: " + remitent + " | Per a: " + destinatari + " | Assumpte: " + assumpte);
    }

    public static void main(String[] args) {
        Email complet = new Email("anna@gmail.com", "lluis@gmail.com", "Tasca Java");
        Email mig = new Email("anna@gmail.com", "lluis@gmail.com");
        Email curt = new Email("anna@gmail.com");

        complet.mostrar();
        mig.mostrar();
        curt.mostrar();
    }
}
```

Eixida:

```
De: anna@gmail.com | Per a: lluis@gmail.com | Assumpte: Tasca Java
De: anna@gmail.com | Per a: lluis@gmail.com | Assumpte: (sense assumpte)
De: anna@gmail.com | Per a: (sense destí) | Assumpte: (sense assumpte)
```

Els dos constructors curts deleguen en el llarg amb `this(...)`. L'assignació completa s'escriu **una sola vegada**; els valors per defecte s'omplin en l'encadenament. Això és sobrecàrrega sense duplicar codi.

</details>

---

## ⭐⭐ Exercici 7: La fracció que es simplifica

<details>
<summary>🔄 Solució</summary>

```java
public class Fraccio {
    int numerador;
    int denominador;

    public Fraccio(int numerador, int denominador) {
        if (denominador == 0) {
            denominador = 1;
        }
        this.numerador = numerador;
        this.denominador = denominador;
    }

    Fraccio sumar(Fraccio altra) {
        int num = this.numerador * altra.denominador + altra.numerador * this.denominador;
        int den = this.denominador * altra.denominador;
        return new Fraccio(num, den);
    }

    void simplificar() {
        int mcd = mcd(Math.abs(numerador), Math.abs(denominador));
        numerador /= mcd;
        denominador /= mcd;
    }

    int mcd(int a, int b) {
        while (b != 0) {
            int resto = a % b;
            a = b;
            b = resto;
        }
        return a == 0 ? 1 : a;
    }

    void mostrar() {
        System.out.println(numerador + "/" + denominador);
    }

    public static void main(String[] args) {
        Fraccio unMig = new Fraccio(1, 2);
        Fraccio unTerç = new Fraccio(1, 3);
        Fraccio suma = unMig.sumar(unTerç);
        suma.simplificar();
        suma.mostrar();
    }
}
```

Eixida: `5/6`

`sumar(Fraccio altra)` usa `this` per al primer sumand i `altra.` per al segon, i torna una **fracció nova** (no toca cap de les dos). `simplificar()` sí que modifica l'objecte (per això és `void`). Euclides amb mòduls troba el MCD en poques voltes.

</details>

---

## ⭐⭐⭐ Exercici 8: CodeWars — Building blocks

<details>
<summary>🔄 Solució</summary>

```java
public class Block {
    private int width;
    private int length;
    private int height;

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

    public static void main(String[] args) {
        Block bloque = new Block(new int[]{2, 4, 6});
        System.out.println("Volum: " + bloque.getVolume());
        System.out.println("Superfície: " + bloque.getSurfaceArea());
    }
}
```

Eixida:

```
Volum: 48
Superfície: 88
```

Els getters tornen cada atribut, i els dos mètodes calculats combinen els tres. La superfície és cada parell de cares multiplicat i sumat, tot per dos. La kata accepta també tres enters per separat en el constructor.

</details>

---

## ⭐⭐⭐ Exercici 9: AceptaElReto — 100 Constante de Kaprekar

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Arrays;
import java.util.Scanner;

public class Kaprekar {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int casos = sc.nextInt();

        for (int i = 0; i < casos; i++) {
            int numero = sc.nextInt();
            System.out.println(iteracions(numero));
        }
        sc.close();
    }

    static int iteracions(int numero) {
        if (numero == 6174) {
            return 0;
        }
        if (esRepdigit(numero)) {
            return 8;
        }

        int voltes = 0;
        int actual = numero;
        while (actual != 6174) {
            actual = pasKaprekar(actual);
            voltes++;
        }
        return voltes;
    }

    static boolean esRepdigit(int numero) {
        String s = String.format("%04d", numero);
        char primera = s.charAt(0);
        for (char c : s.toCharArray()) {
            if (c != primera) {
                return false;
            }
        }
        return true;
    }

    static int pasKaprekar(int numero) {
        String s = String.format("%04d", numero);
        char[] asc = s.toCharArray();
        Arrays.sort(asc);
        char[] desc = new char[4];
        for (int i = 0; i < 4; i++) {
            desc[i] = asc[3 - i];
        }

        int major = Integer.parseInt(new String(desc));
        int menor = Integer.parseInt(new String(asc));
        return major - menor;
    }
}
```

Per a 3524, el `while` dona: 3524 → 3087 → 8352 → 6174, tres voltes. `%04d` ompli amb zeros a l'esquerra (necessari per a nombres com 3087). `esRepdigit` torna `false` en trobar un dígit distint. Este és un problema magnífic per a provar la teua classe `Numero` amb mètodes separats.

</details>

---

> 📚 **Vols més?** Revisa el butlletí d'**extres** d'esta unitat: té quatre katas de CodeWars (inclosa una de depuració d'una classe) i dos problemes d'AceptaElReto.
