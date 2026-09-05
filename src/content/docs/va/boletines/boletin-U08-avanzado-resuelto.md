---
title: Butlletí U08 — Avançat Resolt
description: Els mateixos exercicis que el butlletí avançat, amb solucions
---

# 📝 Butlletí U08 — Avançat (Resolt)

> Les solucions estan amagades en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## ⭐ Exercici 1: Interfície FiguraGeometrica

<details>
<summary>🔄 Solució</summary>

```java
import java.util.ArrayList;

public interface FiguraGeometrica {
    double calcularArea();
    double calcularPerimetre();
}

class Cercle implements FiguraGeometrica {
    private double radi;

    public Cercle(double radi) {
        this.radi = radi;
    }

    @Override
    public double calcularArea() {
        return Math.PI * radi * radi;
    }

    @Override
    public double calcularPerimetre() {
        return 2 * Math.PI * radi;
    }
}

class Rectangle implements FiguraGeometrica {
    private double ample, alt;

    public Rectangle(double ample, double alt) {
        this.ample = ample;
        this.alt = alt;
    }

    @Override
    public double calcularArea() {
        return ample * alt;
    }

    @Override
    public double calcularPerimetre() {
        return 2 * (ample + alt);
    }
}

class TriangleRectangle implements FiguraGeometrica {
    private double base, altura;

    public TriangleRectangle(double base, double altura) {
        this.base = base;
        this.altura = altura;
    }

    @Override
    public double calcularArea() {
        return base * altura / 2;
    }

    @Override
    public double calcularPerimetre() {
        double hipotenusa = Math.sqrt(base * base + altura * altura);
        return base + altura + hipotenusa;
    }
}

public class TestFigures {
    public static void main(String[] args) {
        ArrayList<FiguraGeometrica> figures = new ArrayList<>();
        figures.add(new Cercle(5));
        figures.add(new Rectangle(4, 3));
        figures.add(new TriangleRectangle(3, 4));

        for (FiguraGeometrica f : figures) {
            System.out.println("Àrea: " + f.calcularArea()
                    + ", perímetre: " + f.calcularPerimetre());
        }
    }
}
```

La interfície és el contracte: `ArrayList<FiguraGeometrica>` accepta qualsevol classe que signe el contracte, i cadascuna calcula la seua àrea i el seu perímetre a la seua manera. Polimorfisme amb interfícies en estat pur.

</details>

---

## ⭐ Exercici 2: Jerarquia d'Empleats

<details>
<summary>🔄 Solució</summary>

```java
public class Empleat {
    protected String nom;
    protected double salariBase;

    public Empleat(String nom, double salariBase) {
        this.nom = nom;
        this.salariBase = salariBase;
    }

    public String getNom() {
        return nom;
    }

    public double calcularSalari() {
        return salariBase;
    }
}

class Gerent extends Empleat {
    private double bo;

    public Gerent(String nom, double salariBase, double bo) {
        super(nom, salariBase);
        this.bo = bo;
    }

    @Override
    public double calcularSalari() {
        return salariBase + bo;
    }
}

class Venedor extends Empleat {
    private double comissio;
    private int vendesRealitzades;

    public Venedor(String nom, double salariBase,
                   double comissio, int vendesRealitzades) {
        super(nom, salariBase);
        this.comissio = comissio;
        this.vendesRealitzades = vendesRealitzades;
    }

    @Override
    public double calcularSalari() {
        return salariBase + comissio * vendesRealitzades;
    }
}

public class Nomina {
    public static void main(String[] args) {
        Empleat[] plantilla = {
            new Gerent("Anna", 2000, 500),
            new Venedor("Lluís", 1200, 20, 15)
        };

        for (Empleat e : plantilla) {
            System.out.println(e.getNom() + " cobra "
                    + e.calcularSalari() + " €");
        }
    }
}
```

L'array és d'`Empleat`, però cada objecte executa el seu propi `calcularSalari()`: el gerent amb el bo, el venedor amb les comissions. `protected` permet que les subclasses lliguen `salariBase` sense necessitat d'un getter.

</details>

---

## ⭐⭐ Exercici 3: Sistema de pagaments amb interfície

<details>
<summary>🔄 Solució</summary>

```java
public interface Pagable {
    boolean procesarPagament(double quantitat);
}

class TarjetaCredito implements Pagable {
    private double limit;
    private double saldoUsat;

    public TarjetaCredito(double limit, double saldoUsat) {
        this.limit = limit;
        this.saldoUsat = saldoUsat;
    }

    @Override
    public boolean procesarPagament(double quantitat) {
        if (quantitat + saldoUsat <= limit) {
            saldoUsat += quantitat;
            return true;
        }
        return false;
    }
}

class PayPal implements Pagable {
    private double saldo;

    public PayPal(double saldo) {
        this.saldo = saldo;
    }

    @Override
    public boolean procesarPagament(double quantitat) {
        if (quantitat <= saldo) {
            saldo -= quantitat;
            return true;
        }
        return false;
    }
}

class TransferenciaBancaria implements Pagable {
    private double saldo;

    public TransferenciaBancaria(double saldo) {
        this.saldo = saldo;
    }

    @Override
    public boolean procesarPagament(double quantitat) {
        if (quantitat + 1 <= saldo) {
            saldo -= (quantitat + 1);
            return true;
        }
        return false;
    }
}

public class TestPagaments {
    public static void main(String[] args) {
        Pagable tarjeta = new TarjetaCredito(1000, 0);
        System.out.println(tarjeta.procesarPagament(500));  // true
        System.out.println(tarjeta.procesarPagament(600));  // false

        Pagable paypal = new PayPal(200);
        System.out.println(paypal.procesarPagament(150));   // true
        System.out.println(paypal.procesarPagament(100));   // false
    }
}
```

Tres formes de pagar, un sol contracte. Cada classe guarda la seua lògica d'aprovació i el seu saldo intern: la interfície només exigix el mètode. La transferència descompta a més la seua comissió fixa d'1 €, que és la "taxa" del banc.

</details>

---

## ⭐⭐ Exercici 4: Interfícies múltiples: Volador i Nedador

<details>
<summary>🔄 Solució</summary>

```java
import java.util.ArrayList;

public interface Volador {
    void volar();
}

public interface Nedador {
    void nadar();
}

class Ànec implements Volador, Nedador {
    @Override
    public void volar() {
        System.out.println("L'ànec vola en formació en V");
    }

    @Override
    public void nadar() {
        System.out.println("L'ànec nada tranquil·lament a l'estany");
    }
}

class Avió implements Volador {
    @Override
    public void volar() {
        System.out.println("L'avió vola a 900 km/h");
    }
}

class Peix implements Nedador {
    @Override
    public void nadar() {
        System.out.println("El peix nada contra corrent");
    }
}

public class TestAnimals {
    public static void main(String[] args) {
        ArrayList<Volador> voladors = new ArrayList<>();
        voladors.add(new Ànec());
        voladors.add(new Avió());

        for (Volador v : voladors) {
            v.volar();
        }

        ArrayList<Nedador> nedadors = new ArrayList<>();
        nedadors.add(new Ànec());
        nedadors.add(new Peix());

        for (Nedador n : nedadors) {
            n.nadar();
        }
    }
}
```

L'`Ànec` és el campió: firma dos contractes alhora. A la llista de `Volador` es comporta com a volador; a la de `Nedador`, com a nedador. Una classe, dos personalitats, zero conflictes: eixe és el poder de les interfícies davant de l'herència única.

</details>

---

## ⭐⭐ Exercici 5: Downcasting segur

<details>
<summary>🔄 Solució</summary>

```java
import java.util.ArrayList;

public class Empleat {
    protected String nom;

    public Empleat(String nom) {
        this.nom = nom;
    }

    public void mostrarInfo() {
        System.out.println("Empleat: " + nom);
    }
}

class Programador extends Empleat {
    public Programador(String nom) {
        super(nom);
    }

    public void escriureCodi() {
        System.out.println(nom + " escriu codi Java");
    }
}

class Dissenyador extends Empleat {
    public Dissenyador(String nom) {
        super(nom);
    }

    public void dissenyar() {
        System.out.println(nom + " dissenya la interfície");
    }
}

public class Empresa {
    public static void main(String[] args) {
        ArrayList<Empleat> plantilla = new ArrayList<>();
        plantilla.add(new Programador("Anna"));
        plantilla.add(new Dissenyador("Lluís"));
        plantilla.add(new Programador("Eva"));

        for (Empleat e : plantilla) {
            e.mostrarInfo();
            if (e instanceof Programador) {
                ((Programador) e).escriureCodi();
            } else if (e instanceof Dissenyador) {
                ((Dissenyador) e).dissenyar();
            }
        }
    }
}
```

`instanceof` és la mirilla: abans de baixar la referència, preguntes si l'objecte real és d'eixe tipus. Sense el cast, no podries cridar a `escriureCodi()` ni a `dissenyar()`; sense l'`instanceof`, arriscaries un `ClassCastException`. Mai no baixes sense preguntar.

</details>

---

## ⭐⭐ Exercici 6: Calculadora de figures amb classe abstracta

<details>
<summary>🔄 Solució</summary>

```java
import java.util.ArrayList;

public abstract class Figura {
    protected String color;

    public Figura(String color) {
        this.color = color;
    }

    public abstract double calcularArea();
    public abstract double calcularPerimetre();

    public void mostrarColor() {
        System.out.println("Color: " + color);
    }
}

class Cercle extends Figura {
    private double radi;

    public Cercle(String color, double radi) {
        super(color);
        this.radi = radi;
    }

    @Override
    public double calcularArea() {
        return Math.PI * radi * radi;
    }

    @Override
    public double calcularPerimetre() {
        return 2 * Math.PI * radi;
    }
}

class Rectangle extends Figura {
    private double ample, alt;

    public Rectangle(String color, double ample, double alt) {
        super(color);
        this.ample = ample;
        this.alt = alt;
    }

    @Override
    public double calcularArea() {
        return ample * alt;
    }

    @Override
    public double calcularPerimetre() {
        return 2 * (ample + alt);
    }
}

public class TestFigures {
    public static void main(String[] args) {
        ArrayList<Figura> figures = new ArrayList<>();
        figures.add(new Cercle("roig", 3));
        figures.add(new Rectangle("blau", 4, 2));

        for (Figura f : figures) {
            f.mostrarColor();
            System.out.println("Àrea: " + f.calcularArea());
        }
    }
}
```

`Figura` aporta el color (concret) i obliga a l'àrea i al perímetre (abstractes). Les subclasses només implementen l'obligatori. `mostrarColor()` s'hereta tal qual: codi compartit on toca, contracte on toca.

</details>

---

## ⭐⭐⭐ Exercici 7: Sistema de notificacions polimòrfic

<details>
<summary>🔄 Solució</summary>

```java
import java.util.ArrayList;
import java.util.List;

public interface Notificable {
    void enviar(String missatge);
    String getEstat();
}

class EmailNotificacio implements Notificable {
    private String direccio;
    private boolean enviat;

    public EmailNotificacio(String direccio) {
        this.direccio = direccio;
    }

    @Override
    public void enviar(String missatge) {
        System.out.println("Enviant email a " + direccio + ": " + missatge);
        enviat = true;
    }

    @Override
    public String getEstat() {
        return enviat ? "Enviat" : "Pendent";
    }
}

class SMSNotificacio implements Notificable {
    private String telefon;
    private boolean enviat;

    public SMSNotificacio(String telefon) {
        this.telefon = telefon;
    }

    @Override
    public void enviar(String missatge) {
        System.out.println("Enviant SMS a " + telefon + ": " + missatge);
        enviat = true;
    }

    @Override
    public String getEstat() {
        return enviat ? "Enviat" : "Pendent";
    }
}

class PushNotificacio implements Notificable {
    private String dispositiuId;
    private boolean enviat;

    public PushNotificacio(String dispositiuId) {
        this.dispositiuId = dispositiuId;
    }

    @Override
    public void enviar(String missatge) {
        System.out.println("Enviant push a " + dispositiuId + ": " + missatge);
        enviat = true;
    }

    @Override
    public String getEstat() {
        return enviat ? "Enviat" : "Pendent";
    }
}

public class GestorNotificacions {
    public static void enviarTotes(List<Notificable> notificacions, String missatge) {
        for (Notificable n : notificacions) {
            n.enviar(missatge);
        }
    }

    public static void main(String[] args) {
        ArrayList<Notificable> notificacions = new ArrayList<>();
        notificacions.add(new EmailNotificacio("ana@mail.com"));
        notificacions.add(new SMSNotificacio("600123456"));
        notificacions.add(new PushNotificacio("dev-001"));

        enviarTotes(notificacions, "Examen de Java el dilluns");
    }
}
```

`enviarTotes` no sap (ni li importa) quin tipus concret hi ha a la llista: només coneix el contracte `Notificable`. Afegir un quart canal de notificació no obliga a tocar ni una línia del gestor. Disseny obert al canvi, que és el premi del polimorfisme.

</details>

---

## ⭐⭐⭐ Exercici 8: Template method — les begudes

<details>
<summary>🔄 Solució</summary>

```java
public abstract class Beguda {
    public final void preparar() {
        bullirAigua();
        prepararIngredient();
        servirEnTassa();
        afegirExtres();
    }

    private void bullirAigua() { System.out.println("Bullint aigua..."); }
    private void servirEnTassa() { System.out.println("Servint en tassa..."); }

    protected abstract void prepararIngredient();
    protected abstract void afegirExtres();
}

class Te extends Beguda {
    @Override
    protected void prepararIngredient() {
        System.out.println("Posant la bosseta de te...");
    }

    @Override
    protected void afegirExtres() {
        System.out.println("Afegint llima...");
    }
}

class Cafe extends Beguda {
    @Override
    protected void prepararIngredient() {
        System.out.println("Abocant el cafè mòlt...");
    }

    @Override
    protected void afegirExtres() {
        System.out.println("Afegint sucre...");
    }
}

public class Cafeteria {
    public static void main(String[] args) {
        Beguda b1 = new Te();
        Beguda b2 = new Cafe();
        b1.preparar();
        b2.preparar();
    }
}
```

L'esquelet (`preparar()`) és `final`: ningú no pot reordenar els passos. Les subclasses només personalitzen els dos detalls variables. El template method garantix que l'algoritme sempre s'execute en l'ordre correcte, passe el que passe.

</details>

---

## ⭐⭐⭐ Exercici 9: El gran repte — vehicles amb combustible

<details>
<summary>🔄 Solució</summary>

```java
import java.util.ArrayList;

public abstract class Vehicle {
    protected String matricula;
    protected int combustible;

    public Vehicle(String matricula, int combustible) {
        this.matricula = matricula;
        this.combustible = combustible;
    }

    public abstract void moure();
}

class Cotxe extends Vehicle {
    private static final int DESPESA = 5;

    public Cotxe(String matricula, int combustible) {
        super(matricula, combustible);
    }

    @Override
    public void moure() {
        if (combustible >= DESPESA) {
            combustible -= DESPESA;
            System.out.println("Cotxe " + matricula + " avança (combustible: " + combustible + ")");
        } else {
            System.out.println("Sense combustible");
        }
    }
}

class Moto extends Vehicle {
    private static final int DESPESA = 3;

    public Moto(String matricula, int combustible) {
        super(matricula, combustible);
    }

    @Override
    public void moure() {
        if (combustible >= DESPESA) {
            combustible -= DESPESA;
            System.out.println("Moto " + matricula + " avança (combustible: " + combustible + ")");
        } else {
            System.out.println("Sense combustible");
        }
    }
}

class Camio extends Vehicle {
    private static final int DESPESA = 10;
    private int càrrega;

    public Camio(String matricula, int combustible, int càrrega) {
        super(matricula, combustible);
        this.càrrega = càrrega;
    }

    @Override
    public void moure() {
        if (combustible >= DESPESA) {
            combustible -= DESPESA;
            System.out.println("Camió " + matricula + " amb càrrega " + càrrega
                    + " avança (combustible: " + combustible + ")");
        } else {
            System.out.println("Sense combustible");
        }
    }
}

public class Circuit {
    public static void main(String[] args) {
        ArrayList<Vehicle> vehicles = new ArrayList<>();
        vehicles.add(new Cotxe("1234ABC", 12));
        vehicles.add(new Moto("5678DEF", 8));
        vehicles.add(new Camio("9999ZZZ", 25, 3000));

        for (Vehicle v : vehicles) {
            int moviments = 0;
            while (v.combustible > 0) {
                v.moure();
                moviments++;
            }
            System.out.println("Moviments: " + moviments);
        }
    }
}
```

Cada subclasse definix la seua despesa amb una constant i el seu `moure()`. El `main` usa només `Vehicle`: el `while` pregunta per l'atribut `protected` i el polimorfisme fa la resta. Si demà arriba una `Bicicleta` (despesa 0), entra sense tocar el circuit. L'abstracció paga la casa.

</details>