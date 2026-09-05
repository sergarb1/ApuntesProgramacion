---
title: "04 — Polimorfisme: el camaleó de la POO"
description: "Dynamic binding, referències polimòrfiques, col·leccions i paràmetres que canvien de forma 🧬"
---

<p><small>Dynamic binding, referències polimòrfiques, col·leccions i paràmetres que canvien de forma 🧬</small></p>

> 🗺️ **Estàs en:** 🧬 **U08 · Herència, Polimorfisme i Interfícies** → 04 · Polimorfisme: el camaleó de la POO

---

## 📬 La idea en una frase

> **El polimorfisme fa que un mateix mètode es comporte de forma diferent segons l'objecte real que l'invoque, decidint-ho la JVM en temps d'execució.**

Polimorfisme (_poly_ = moltes, _morphé_ = formes): un mateix mètode es comporta diferent segons l'objecte que l'invoque. Com un comandament universal on el mateix botó "PLAY" funciona en Netflix, Spotify i la teua torradora.

---

## 🎭 El mateix mètode, diferents comportaments

```java
public class Animal {
    public void hacerSonido() { System.out.println("..."); }
}

public class Perro extends Animal {
    @Override
    public void hacerSonido() { System.out.println("¡Guau!"); }
}

public class Gato extends Animal {
    @Override
    public void hacerSonido() { System.out.println("¡Miau!"); }
}
```

I ara la màgia:

```java
Animal a;
a = new Perro(); a.hacerSonido(); // ¡Guau!
a = new Gato();  a.hacerSonido(); // ¡Miau!
```

La variable `a` és de tipus `Animal`, però apunta a objectes diferents. S'executa sempre el mètode de l'**objecte real**, no el del tipus de la variable.

---

## 🔮 Dynamic binding: la decisió en runtime

El compilador i la JVM fan treballs distints:

> **Compilador:** "¿`Animal` té `hacerSonido()`? Sí. Endavant."
> **JVM (runtime):** "L'objecte és un `Perro`. Execute el de `Perro`."

Això és **dynamic binding** (o late binding): el *què* es pot cridar ho decidix el compilador; el *com* s'executa ho decidix la JVM quan el programa corre. Eixa separació és la que fa possible el polimorfisme.

> 💡 **Detall pràctic:** si Java resolguera els mètodes en compilació (static binding), cridar a `a.hacerSonido()` sempre executaria la versió d'`Animal`. El polimorfisme existix perquè la decisió s'ajorna fins al moment just.

---

## 🔗 Referències polimòrfiques

Pots guardar un objecte específic en una variable de tipus més general:

```java
Animal miMascota = new Perro();  // ✓
Animal tuMascota = new Gato();   // ✓
```

Però la variable només "veu" els mètodes del tipus de la referència:

```java
Animal a = new Perro();
a.hacerSonido();   // ✓
a.moverCola();     // ✗ Animal no tiene moverCola()
```

> ⚠️ **Advertència:** el compilador és conservador: si la variable és `Animal`, només deixa cridar mètodes d'`Animal`, encara que per dins hi haja un `Perro`. Per a accedir a `moverCola()` necessites el punt 5 (downcasting).

---

## 📚 Polimorfisme amb col·leccions

Ací és on el polimorfisme paga el lloguer:

```java
import java.util.ArrayList;

ArrayList<Animal> animales = new ArrayList<>();
animales.add(new Perro());
animales.add(new Gato());
animales.add(new Vaca());

for (Animal a : animales) {
    a.hacerSonido();  // cada u el seu
}
// ¡Guau! / ¡Miau! / ¡Muuu!
```

Una sola llista, un sol bucle. Sense polimorfisme necessitaries tres llistes separades (i una bicicleta per a portar-les).

---

## 🧑‍⚕️ Polimorfisme amb paràmetres

Un mètode que accepta el tipus general funciona amb qualsevol subclasse:

```java
public class Veterinario {
    public void vacunar(Animal a) {
        System.out.print("Vacunando a: ");
        a.hacerSonido();
    }
}

Veterinario vet = new Veterinario();
vet.vacunar(new Perro()); // Vacunando a: ¡Guau!
vet.vacunar(new Gato());  // Vacunando a: ¡Miau!
```

I pots anar més lluny: una classe que gestiona una col·lecció polimòrfica:

```java
public class Zoologico {
    private ArrayList<Animal> animales = new ArrayList<>();

    public void agregarAnimal(Animal a) {
        animales.add(a);
    }

    public void hacerDesfile() {
        for (Animal a : animales) {
            System.out.print(a.getClass().getSimpleName() + " dice: ");
            a.hacerSonido();
        }
    }
}
```

Afegir un `Gato` o un `Perro` no requerix canviar **ni una sola línia** del `Zoologico`. Això és disseny a prova de futur: el codi s'obri a noves classes sense tocar-se.

---

## 🚫 Els atributs NO són polimòrfics

Punt important per a l'examen: la màgia només funciona amb **mètodes**. Els atributs es resolen pel tipus de la **referència**, no de l'objecte:

```java
class A { int x = 1; }
class B extends A { int x = 2; }

A ref = new B();
System.out.println(ref.x);   // 1, NO 2
```

`ref.x` torna `1` perquè els atributs no participen en el dynamic binding. Només els mètodes. Els atributs "oculten" (shadowing), no sobreescriuen.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** el compilador mira el tipus de la variable; la JVM mira el tipus real de l'objecte. Ahí està la màgia.

**Exercici: què imprimeix?**

```java
class A { void saluda() { System.out.println("Hola desde A"); } }
class B extends A { void saluda() { System.out.println("Hola desde B"); } }
class C extends B { void saluda() { System.out.println("Hola desde C"); } }

public class Test {
    public static void main(String[] args) {
        A ref1 = new B();
        A ref2 = new C();
        B ref3 = new C();
        ref1.saluda();
        ref2.saluda();
        ref3.saluda();
    }
}
```

<details>
<summary>🔄 Solució</summary>

```
Hola desde B
Hola desde C
Hola desde C
```

Només importa el tipus real de l'objecte (`B`, `C`, `C`). El tipus de la referència (`A`, `A`, `B`) no decidix res en runtime.

</details>

**Exercici: compila?**

```java
class Vehiculo { void mover() { System.out.println("Vehículo se mueve"); } }

class Coche extends Vehiculo {
    void mover() { System.out.println("Coche acelera"); }
    void abrirPuertas() { System.out.println("Puertas abiertas"); }
}

public class Test {
    public static void main(String[] args) {
        Vehiculo v = new Coche();
        v.mover();
        // v.abrirPuertas();   <- ¿compila?
    }
}
```

<details>
<summary>🔄 Solució</summary>

`v.mover()` imprimeix **"Coche acelera"**. La línia comentada **NO compila**: el compilador només mira el tipus de la referència (`Vehiculo`), i `Vehiculo` no té `abrirPuertas()`.

</details>

**Exercici: què imprimeix `o`?**

```java
interface Volable { void volar(); }
class Pajaro implements Volable {
    public void volar() { System.out.println("Vuela"); }
}
class Aguila extends Pajaro {
    public void volar() { System.out.println("Vuela alto"); }
}

public class Test {
    public static void main(String[] args) {
        Volable v = new Aguila();
        Pajaro p = new Aguila();
        Object o = new Aguila();
        v.volar();
        p.volar();
        // o.volar() no compila: Object no tiene volar()
    }
}
```

<details>
<summary>🔄 Solució</summary>

`v.volar()` i `p.volar()` imprimeixen **"Vuela alto"**: el tipus de la referència no importa, només l'objecte real. `o.volar()` ni tan sols compila perquè `Object` no coneix `volar()` (encara que en runtime l'objecte sí que el tinga). El polimorfisme actua dins dels límits que el compilador permet.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què és el dynamic binding?
2. `Animal a = new Perro();` — quins mètodes pots cridar amb `a`?
3. Per què no necessites canviar el `Zoologico` en afegir un animal nou?
4. Els atributs són polimòrfics?

<details>
<summary>🔄 Respostes</summary>

1. Que el mètode a executar es decidix en runtime segons el tipus real de l'objecte, no en compilació.
2. Només els d'`Animal` (`hacerSonido()`). Per a `moverCola()` necessites downcasting (punt 5).
3. Perquè `agregarAnimal` accepta `Animal` (o qualsevol subclasse) i el bucle usa polimorfisme.
4. No. Els mètodes són polimòrfics; els atributs es resolen pel tipus de la referència.

</details>

---

## ✅ Resum en 3 frases

1. **Polimorfisme** = un mètode, moltes formes: la JVM tria la implementació de l'objecte real.
2. Les **referències polimòrfiques** (`Animal a = new Perro()`) permeten col·leccions i paràmetres flexibles.
3. Els **mètodes** són polimòrfics; els **atributs**, no.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Polimorfisme | Un mateix mètode es comporta segons l'objecte real |
> | Dynamic binding | Decisió del mètode en temps d'execució |
> | Referència polimòrfica | Variable de tipus general apuntant a un objecte específic |
> | Override | La ferramenta que canvia el comportament |
> | Shadowing | Ocultar un atribut de la superclasse (els atributs no són polimòrfics) |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/08-herencia-polimorfismo-interfaces) · **Anterior:** [03 · protected i jerarquies de classes](/ApuntesProgramacion/va/08-herencia-polimorfismo-interfaces/03-protected-jerarquias) · **Següent:** [05 · instanceof i downcasting](/ApuntesProgramacion/va/08-herencia-polimorfismo-interfaces/05-instanceof-downcasting)