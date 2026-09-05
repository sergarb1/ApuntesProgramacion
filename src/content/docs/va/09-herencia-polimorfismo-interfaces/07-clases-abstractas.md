---
title: "07 — Classes abstractes"
description: "Esbossos que no s'instancien, mètodes abstractes que obliguen i el patró template method 🧬"
---

<p><small>Esbossos que no s'instancien, mètodes abstractes que obliguen i el patró template method 🧬</small></p>

> 🗺️ **Estàs en:** 🧬 **U09 · Herència, Polimorfisme i Interfícies** → 07 · Classes abstractes

---

## 📬 La idea en una frase

> **Una classe abstracta és un esbós: no es pot instanciar, definix mètodes obligatoris (abstractes) i compartix codi concret amb les seues filles.**

Imagina "A la venda: esbós de cadira". No pots seure't en un esbós, oi? Doncs això són les classes abstractes: plànols incomplets perquè *altres* els complenten.

---

## 🎨 Què és una classe abstracta?

Una classe que **NO pot instanciar-se**. Pot tindre mètodes abstractes (sense implementació) i mètodes concrets (amb implementació):

```java
public abstract class Animal {
    protected String nombre;

    public abstract void hacerSonido();   // sense claus: obliga les filles

    public void dormir() {                 // amb claus: codi compartit
        System.out.println(nombre + " está durmiendo... Zzz");
    }
}
```

> ⚠️ **Advertència:** `new Animal()` és un **error de compilació**. No pots crear un "animal genèric"; només pots crear animals concrets que complenten l'esbós.

---

## 📋 You MUST: implementar els mètodes abstractes

Si una classe **concreta** estén una abstracta, està OBLIGADA a implementar tots els seus mètodes abstractes:

```java
public class Perro extends Animal {
    @Override
    public void hacerSonido() {
        System.out.println("¡Guau!");
    }
}

public abstract class Pajaro extends Animal {
    // No està obligada: Pajaro també és abstracta i pot deixar el mètode sense implementar
}
```

La regla és la llei dels contractes: **o implementes tot, o et declares abstracte tu també.** No hi ha terme mitjà.

### abstract vs concrete

| Classe abstracta | Classe concreta |
|---|---|
| No pots crear objectes directament | Pots crear objectes |
| Pot tindre mètodes abstractes | Tots implementats |
| Concepte general | Alguna cosa específica |
| `abstract class` | Només `class` |

---

## 📐 Exemple: figures geomètriques

```java
public abstract class Figura {
    protected String color;

    public Figura(String color) {
        this.color = color;
    }

    public abstract double calcularArea();
    public abstract double calcularPerimetro();

    public void mostrarColor() {
        System.out.println("Color: " + color);
    }
}

public class Circulo extends Figura {
    private double radio;

    public Circulo(String color, double radio) {
        super(color);
        this.radio = radio;
    }

    @Override public double calcularArea() { return Math.PI * radio * radio; }
    @Override public double calcularPerimetro() { return 2 * Math.PI * radio; }
}

public class Rectangulo extends Figura {
    private double ancho, alto;

    public Rectangulo(String color, double ancho, double alto) {
        super(color);
        this.ancho = ancho;
        this.alto = alto;
    }

    @Override public double calcularArea() { return ancho * alto; }
    @Override public double calcularPerimetro() { return 2 * (ancho + alto); }
}
```

`Figura` definix **què** tenen totes les figures (color, àrea, perímetre) i delega **com** es calculen a cadascuna. El polimorfisme del punt 4 fa la resta: `ArrayList<Figura>` amb cercles i rectangles, i `calcularArea()` funciona sol.

---

## 🏗️ Constructors en classes abstractes

Sí, les abstractes poden tindre constructors. Es criden amb `super()`, igual que en qualsevol herència:

```java
public abstract class Animal {
    protected String nombre;

    public Animal(String nombre) {
        this.nombre = nombre;
        System.out.println("Constructor de Animal");
    }
}

public class Perro extends Animal {
    public Perro(String nombre) {
        super(nombre);
    }
}
```

No pots instanciar `Animal`, però el seu constructor **sí s'executa** quan crees un `Perro` (recorda la cadena de constructors del punt 2). El constructor de l'abstracta inicialitza la part comuna.

---

## 🧩 Template Method: les abstractes en acció

Este és el patró que fa que les classes abstractes valguen el seu pes en or. Definixes l'**esquelet d'un algoritme** i deixes que les subclasses ompliguen els detalls:

```java
public abstract class Bebida {
    public final void preparar() {          // final: ningú pot canviar l'esquelet
        hervirAgua();
        prepararIngrediente();
        servirEnTaza();
        anadirExtras();
    }

    private void hervirAgua() { System.out.println("Hirviendo agua..."); }
    private void servirEnTaza() { System.out.println("Sirviendo en taza..."); }

    protected abstract void prepararIngrediente();
    protected abstract void anadirExtras();
}

public class Te extends Bebida {
    @Override protected void prepararIngrediente() { System.out.println("Poniendo la bolsita de té..."); }
    @Override protected void anadirExtras() { System.out.println("Añadiendo limón..."); }
}
```

La màgia: `Te` només implementa les dos parts variables, i `preparar()` (que és `final`) ja sap l'ordre complet. Les subclasses no poden desordenar l'algoritme, només personalitzar-lo. Eixe és el **template method pattern**.

> 💡 **Detall pràctic:** fixa't que els mètodes abstractes són `protected`: només la família ha d'implementar-los. L'esquelet `public final` és l'únic que el món exterior pot cridar.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** els mètodes abstractes són contractes: la subclasse HA d'implementar-los. Si no, no compila. Usa'ls per a "forçar" comportament.

**Exercici: compila?**

```java
public abstract class A { public abstract void metodo(); }
public class B extends A { }
```

<details>
<summary>🔄 Solució</summary>

**NO compila.** `B` és concreta i ha d'implementar `metodo()`. Solució: `public class B extends A { public void metodo() { } }` o declarar `B` com `abstract`.

</details>

**Exercici: quines línies donen error?**

```java
public abstract class A { public abstract void metodo(); }
public class B extends A { public void metodo() { } }

A a = new A();  // ¿error?
B b = new B();  // ¿error?
```

<details>
<summary>🔄 Solució</summary>

`new A()` → **ERROR**: no pots instanciar una classe abstracta. `new B()` → **OK**: `B` va implementar `metodo()` i és concreta.

</details>

**Exercici: el gat persa**

```java
abstract class Animal { abstract void hablar(); }
abstract class Mamifero extends Animal { void hablar() { System.out.println("Mamífero raro"); } }
class Gato extends Mamifero { void hablar() { System.out.println("Miau"); } }
class GatoPersa extends Gato { }

public class Test {
    public static void main(String[] args) {
        Animal a = new GatoPersa();
        a.hablar();
    }
}
```

<details>
<summary>🔄 Solució</summary>

Imprimeix **"Miau"**. `GatoPersa` hereta el `hablar()` de `Gato` (que sobreescriu el de `Mamifero`), i `Animal a` resol en runtime l'objecte real: dynamic binding de principi a fi.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Pots fer `new` sobre una classe abstracta?
2. Què està obligada a fer una subclasse concreta?
3. Pot una classe abstracta tindre mètodes concrets i constructors?
4. Què garantix el `final` en el mètode `preparar()` del template method?

<details>
<summary>🔄 Respostes</summary>

1. No: `new Animal()` és un error de compilació.
2. Implementar TOTS els mètodes abstractes de la superclasse (o declarar-se abstracta).
3. Sí: codi compartit i constructors que s'executen via `super()`.
4. Que cap subclasse pot reordenar o saltar-se passos de l'algoritme: només ompli les parts abstractes.

</details>

---

## ✅ Resum en 3 frases

1. Una **classe abstracta** és un esbós no instanciable amb mètodes abstractes (obligatoris) i concrets (compartits).
2. Les subclasses **concretes** han d'implementar tots els mètodes abstractes; les abstractes poden deixar el deute pendent.
3. El **template method** definix l'esquelet `final` d'un algoritme i delega els detalls variables a les subclasses.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Classe abstracta | Classe que no pot instanciar-se |
> | Mètode abstracte | Mètode sense implementació que obliga les filles |
> | Subclasse concreta | Subclasse que implementa tots els abstractes |
> | Template method | Esquelet d'algoritme amb parts que les filles omplen |
> | `abstract` | Modificador que marca classes i mètodes sense acabar |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces) · **Anterior:** [06 · La classe Object: el besavi de tot](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/06-clase-object) · **Següent:** [08 · Interfícies: el contracte que signes](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/08-interfaces)