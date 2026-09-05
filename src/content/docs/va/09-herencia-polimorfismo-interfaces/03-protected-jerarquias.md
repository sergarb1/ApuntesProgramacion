---
title: "03 — protected i jerarquies de classes"
description: "El membre que només veu la família, arbres de classes i el perill de la classe base fràgil 🧬"
---

<p><small>El membre que només veu la família, arbres de classes i el perill de la classe base fràgil 🧬</small></p>

> 🗺️ **Estàs en:** 🧬 **U09 · Herència, Polimorfisme i Interfícies** → 03 · protected i jerarquies de classes

---

## 📬 La idea en una frase

> **`protected` és la visibilitat de la família: el membre el veuen les subclasses (i el mateix paquet). I les jerarquies de classes ben dissenyades són arbres, no boscos embullats.**

En la U08 vas vore els quatre nivells de visibilitat. Ací descobrixes el matís que només cobra sentit amb herència: `protected`.

---

## 🔐 protected: el secret que només la família veu

| Visibilitat | Mateixa classe | Mateix paquet | Subclasses (qualsevol paquet) | Tots |
|---|---|---|---|---|
| `private` | ✅ | ❌ | ❌ | ❌ |
| package-private | ✅ | ✅ | ❌ | ❌ |
| `protected` | ✅ | ✅ | ✅ | ❌ |
| `public` | ✅ | ✅ | ✅ | ✅ |

`protected` és el punt dolç: ni privat ni públic per a tot el món. És la porta amb **clau per a la família**:

```java
public class Animal {
    private String secreto;    // Només Animal
    protected String familia;  // Animal, les seues subclasses i el seu paquet
    public String nombre;      // Tots
}
```

> 💡 **Consell pràctic:** quan una classe base necessita que les filles lliguen un atribut o criden un mètode, declara'l `protected`. Quan les filles no han de tocar-lo, `private`. I si ningú ha d'heredar de la teua classe... `final`.

---

## 🌳 Dissenyant jerarquies sensates

Una jerarquia de classes és un arbre. Les regles d'un arbre sa:

1. **L'arrel és general, les fulles són específiques.** `Animal` al cim, `Perro` a la base.
2. **Cada nivell afig alguna cosa.** No crees una classe només per tindre una classe més.
3. **Poca profunditat.** 2 o 3 nivells són fàcils de mantindre; 7 nivells són 7 nivells de dolor.
4. **Tot hereta d'`Object`** (ho veuràs en el punt 6), encara que no l'escrigues.

```java
public class Empleado {
    protected String nombre;
    protected double salarioBase;

    public Empleado(String nombre, double salarioBase) {
        this.nombre = nombre;
        this.salarioBase = salarioBase;
    }

    public void mostrarInfo() {
        System.out.println(nombre + " cobra " + salarioBase + " €");
    }
}

public class Gerente extends Empleado {
    private double bono;

    public Gerente(String nombre, double salarioBase, double bono) {
        super(nombre, salarioBase);
        this.bono = bono;
    }

    public void mostrarInfo() {
        super.mostrarInfo();
        System.out.println("  i té un bo de " + bono + " €");
    }
}
```

Fixa't en el patró: el `Gerente` usa `super(...)` per a construir la part d'`Empleado` i `super.mostrarInfo()` per a estendre l'eixida. Eixe és el disseny net d'una jerarquia: cada classe s'encarrega del seu.

---

## 💥 El problema de la classe base fràgil

Ací va l'advertència seriosa. Imagina que tens un `Jarrón` amb un mètode `romper()` i un `JarrónChino` que el sobreescriu per a fer un ritual de rotura. Tot va bé... fins que algú afegix un mètode `caerAlSuelo()` a `Jarrón` que internament crida a `romper()`:

```java
public class Jarrón {
    public void romper() { System.out.println("¡Crac! Jarrón roto"); }

    public void caerAlSuelo() {
        System.out.println("¡Se cae!");
        romper();   // ¡sorpresa: pot cridar l'override de JarrónChino!
    }
}
```

Ara `JarrónChino` es comporta de forma inesperada cada vegada que cau al sòl, sense que ningú toquera el seu codi. Este és el **problema de la classe base fràgil** (fragile base class problem): canviar la classe pare pot trencar el comportament de les filles.

> ⚠️ **Advertència:** l'herència crea acoblament. Quan canvies `Jarrón`, TOTES les seues filles canvien amb tu, vullgues o no. És un superpoder amb efectes secundaris.

> ❓ **Llavors l'herència és dolenta?**
>
> No! És una ferramenta. Ben usada és perfecta per a relacions IS-A clares. El problema és usar-la quan una simple composició bastaria. La regla moderna: **preferix composició sobre herència**, i usa herència només per a "és-un" reals.

---

## 🧩 Composició: "tindre" en comptes de "ser"

```java
// HERÈNCIA: un cotxe ÉS UN vehicle
public class Coche extends Vehiculo { }

// COMPOSICIÓ: un cotxe TÉ UN motor
public class Coche {
    private Motor motor;
    private Rueda[] ruedas;
}
```

Per què preferir composició de vegades?

1. **Menys acoblament:** canviar la classe de la part no trenca la que la conté.
2. **Més flexible:** pots canviar les parts en temps d'execució.
3. **Evites jerarquies profundes:** 5 nivells d'herència = 5 nivells de dolor.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `protected` no és "públic per als amics": és una visibilitat formal que el compilador controla. Usa-la amb intenció, no per peresa.

**Exercici: l'arbre que no compila**

```java
public class SerVivo {
    protected int energia;

    public SerVivo(int energia) {
        this.energia = energia;
    }
}

public class Animal extends SerVivo {
    protected String nombre;

    public Animal(String nombre, int energia) {
        super(energia);
        this.nombre = nombre;
    }
}

public class Perro extends Animal {
    public Perro(String nombre, int energia) {
        super(nombre, energia);
    }

    public void ladrar() {
        System.out.println(nombre + " ladra con energía " + energia);
    }
}
```

**Pregunta:** per què `Perro` pot usar `nombre` i `energia` encara que no les declare? I què passaria si `energia` fóra `private`?

<details>
<summary>🔄 Solució</summary>

`Perro` usa `nombre` (declarat en `Animal`) i `energia` (declarat en `SerVivo`) perquè tots dos són `protected`: l'herència els posa a disposició de tota la cadena. Si `energia` fóra `private`, `Perro` no podria llegir-lo directament; hauria de passar per un getter de `SerVivo`.

</details>

**Exercici: el gerro que cau**

Amb el codi de `Jarrón` i `JarrónChino` de dalt, què imprimiria si fas `new JarrónChino().caerAlSuelo()` sabent que `JarrónChino` sobreescriu `romper()` per a cridar "¡LAMENTO MILENARIO!"?

<details>
<summary>🔄 Solució</summary>

```
¡Se cae!
¡LAMENTO MILENARIO!
```

El mètode `caerAlSuelo()` està en `Jarrón`, però en cridar a `romper()` usa l'override de `JarrónChino` (polimorfisme). Un canvi en la base va alterar el comportament de la filla sense tocar el seu codi: la classe base fràgil en acció.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Qui veu un membre `protected`?
2. Quants nivells de profunditat suggerix el curs per a una jerarquia?
3. Què és el problema de la classe base fràgil?
4. Quan usaríes composició en comptes d'herència?

<details>
<summary>🔄 Respostes</summary>

1. La pròpia classe, les classes del mateix paquet i totes les seues subclasses (estiguen on estiguen). El món exterior, no.
2. 2 o 3 nivells. Més profunditat = més acoblament i més dolor.
3. Que en canviar la superclasse, les subclasses es comporten de forma inesperada perquè hereden eixos canvis.
4. Quan la relació és "té-un" (HAS-A), quan necessites flexibilitat o quan la jerarquia es faria massa profunda.

</details>

---

## ✅ Resum en 3 frases

1. **`protected`** és la visibilitat familiar: subclasses i paquet el veuen; el món, no.
2. Les **jerarquies sanes** són poc profundes, cada nivell aporta alguna cosa i l'arrel és general.
3. L'herència **acobla**; el problema de la classe base fràgil avisa que canviar el pare té conseqüències. Composició sobre herència quan hi haja dubte.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `protected` | Visible per a la classe, el paquet i les subclasses |
> | Jerarquia de classes | Arbre d'herència del general a l'específic |
> | Classe base fràgil | Canvis en la superclasse que trenquen subclasses sense avisar |
> | Acoblament | Quant depenen unes classes d'unes altres |
> | Composició | "Tindre" (HAS-A) en comptes de "ser" (IS-A) |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces) · **Anterior:** [02 · super i @Override](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/02-super-override) · **Següent:** [04 · Polimorfisme: el camaleó de la POO](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/04-polimorfismo)