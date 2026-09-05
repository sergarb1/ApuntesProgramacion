---
title: "08 — Interfícies: el contracte que signes"
description: "implements, polimorfisme amb interfícies, mètodes default i la gran decisió abstract vs interface 🧬"
---

<p><small>implements, polimorfisme amb interfícies, mètodes default i la gran decisió abstract vs interface 🧬</small></p>

> 🗺️ **Estàs en:** 🧬 **U08 · Herència, Polimorfisme i Interfícies** → 08 · Interfícies: el contracte que signes

---

## 📬 La idea en una frase

> **Una interfície és un contracte: declara quins mètodes ha de tindre una classe (amb `implements`), sense dir com implementar-los, i permet que una classe signe diversos contractes alhora.**

Has firmat un contracte? "El treballador es compromet a: programar en Java, no dormir-se en les reunions..." però no diu COM. Una **interfície** en Java és això: un contracte.

---

## ✍️ Declarant i implementant

```java
public interface Reproducible {
    void reproducir();
    void pausar();
    void detener();
    int obtenerDuracion();
}

public class Cancion implements Reproducible {
    private String titulo;

    public Cancion(String titulo) {
        this.titulo = titulo;
    }

    @Override public void reproducir() { System.out.println("🎵 Reproduciendo: " + titulo); }
    @Override public void pausar() { System.out.println("⏸ Canción pausada"); }
    @Override public void detener() { System.out.println("⏹ Canción detenida"); }
    @Override public int obtenerDuracion() { return 240; }
}
```

Qualsevol classe que signe el contracte (amb `implements`) **HA** d'implementar tots eixos mètodes. El com és cosa seua.

> 📝 **Nota:** els mètodes d'una interfície són `public abstract` implícitament (no cal escriure-ho). I els seus atributs són `public static final`: constants, no estat.

---

## 🎭 Polimorfisme amb interfícies

Una interfície també pot ser el tipus d'una referència polimòrfica:

```java
import java.util.ArrayList;
import java.util.List;

public class Reproductor {
    public static void main(String[] args) {
        List<Reproducible> lista = new ArrayList<>();
        lista.add(new Cancion("Bohemian Rhapsody"));
        lista.add(new Pelicula("Inception"));

        for (Reproducible r : lista) {
            r.reproducir(); // no sap si és cançó o pel·lícula
        }
    }
}
```

El `Reproductor` només coneix el contracte `Reproducible`. Tant li fa si demà arriba un `Podcast` o un `Audiolibro`: mentre signen el contracte, entren en la llista sense tocar una línia. És el polimorfisme del punt 4, però amb contractes en comptes d'herència.

---

## 🏊 Múltiples interfícies

Ací està el gran avantatge sobre l'herència: una classe només estén **UNA** classe, però pot implementar **VARIES** interfícies:

```java
public interface Nadador { void nadar(); }
public interface Corredor { void correr(); }

public class Triatleta implements Nadador, Corredor {
    @Override public void nadar() { System.out.println("🏊 Nadando 1.5 km"); }
    @Override public void correr() { System.out.println("🏃 Corriendo 10 km"); }
}
```

Un `Triatleta` és nedador I corredor. Amb herència múltiple això seria el famós *problema del diamant*; amb interfícies, signar dos contractes no trenca res.

---

## 🩹 default Methods: pegats sense trencar res

Abans de Java 8, afegir un mètode a una interfície **trencava** totes les classes que la implementaven. Arribaren els mètodes `default`:

```java
public interface Volable {
    void volar();

    default void despegar() {
        System.out.println("🛫 Despegando...");
    }
}

public class Avion implements Volable {
    @Override public void volar() { System.out.println("✈️ Volando a 900 km/h"); }
    // despegar() ja ve implementada: no estàs obligat a tocar-la
}
```

Un mètode `default` és una implementació "per defecte": la classe pot usar-la tal qual o sobreescriure-la. És una evolució del contracte sense trencar els que ja van signar.

### I si dos interfícies tenen el mateix `default`?

Conflicte. La classe està obligada a sobreescriure i decidir:

```java
interface Guerrero { default void atacar() { System.out.println("Ataca con espada"); } }
interface Mago { default void atacar() { System.out.println("Lanza hechizo"); } }

class Personaje implements Guerrero, Mago {
    @Override
    public void atacar() {
        Guerrero.super.atacar();
        Mago.super.atacar();
        System.out.println("¡Y usa ambas!");
    }
}
```

Imprimeix: `Ataca con espada`, `Lanza hechizo`, `¡Y usa ambas!`. La sintaxi `Interfaz.super.metodo()` crida la implementació concreta de cada contracte.

---

## ⚖️ La gran decisió: abstract class vs interface

| Aspecte | Classe abstracta | Interfície |
|---|---|---|
| Mètodes amb codi | Sí | Sí (default) |
| Atributs | Qualsevol | `public static final` |
| Herència múltiple | No (un `extends`) | Sí (varis `implements`) |
| Constructors | Sí | No |
| Estat (atributs d'instància) | Sí | No |
| Quan usar-la | Compartir codi + forçar mètodes en una família | Definir capacitats/contractes reutilitzables |

> 💡 **Consell:** usa **classe abstracta** per a "és-un" amb codi compartit (una família que compartix implementació). Usa **interfície** per a "pot-fer" (capacitats que no depenen de la jerarquia: `Pato implements Volable, Cantable`). Si pots, preferix la interfície: és més flexible.

---

## 🥊 EL RING: extends vs implements

Dos paraules clau discutixen sobre qui és més important.

**extends:** «Jo soc l'herència pura. Codi reutilitzat, una jerarquia clara. `Perro extends Animal`, `Coche extends Vehiculo`. ¡Soc la base de la POO!»

**implements:** «Sí, però amb mi no hi ha límits. Una classe implementa diverses interfícies. Amb `extends` només tens un pare. Jo et permeta ser varies coses alhora: `Serializable`, `Comparable`, `Cloneable`...»

**extends:** «Les meues classes poden tindre codi ja fet. Tu només declares mètodes buits. ¡Jo aporte implementació!»

**implements:** «Des de Java 8 tinc mètodes `default` i `static`. Mira: `default void log()` ja funciona. A més, soc més flexible: no imposo una jerarquia rígida.»

**extends:** «Val, però sense mi les interfícies no tindrien sentit. Una interfície no pot instanciar-se sola.»

**implements:** «I sense mi tindries herència múltiple, que és un caos. Mira el problema del diamant en C++.»

**extends:** «Ens necessitem.»

**implements:** «Sí. `extends` per a la jerarquia, `implements` per als contractes.»

> 🕶️ **Don Tip:** es poden combinar: `class Perro extends Animal implements Mascota, Jugable`. Primer el `extends` (un pare), després els `implements` (varis contractes).

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `implements` és un contracte: la classe es compromet a tindre TOTS els mètodes de la interfície. Res de "quasi tots".

**Exercici: compila?**

```java
public interface Cantante { void cantar(); }
public interface Bailarin { void bailar(); }

public class Artista implements Cantante, Bailarin {
    @Override public void cantar() { System.out.println("canta"); }
    // ¡FALTA bailar()!
}
```

<details>
<summary>🔄 Solució</summary>

**NO compila.** En implementar `Cantante` i `Bailarin`, `Artista` ha d'implementar `cantar()` I `bailar()`. Signar un contracte no admet clàusules "a mitges".

</details>

**Exercici: què imprimeix?**

```java
interface Guerrero { default void atacar() { System.out.println("Ataca con espada"); } }
interface Mago { default void atacar() { System.out.println("Lanza hechizo"); } }

class Personaje implements Guerrero, Mago {
    @Override
    public void atacar() {
        Guerrero.super.atacar();
        Mago.super.atacar();
        System.out.println("¡Y usa ambas!");
    }
}

public class Test {
    public static void main(String[] args) {
        new Personaje().atacar();
    }
}
```

<details>
<summary>🔄 Solució</summary>

```
Ataca con espada
Lanza hechizo
¡Y usa ambas!
```

El conflicte de `default` es resol sobreescrivint i cridant a cada `Interfaz.super.metodo()`. Sense eixe override, `Personaje` no compilaria.

</details>

**Exercici: la classe que implementa dos contractes**

```java
public interface Nadador { void nadar(); }
public interface Corredor { void correr(); }

public class Triatleta implements Nadador, Corredor {
    @Override public void nadar() { System.out.println("🏊 Nadando"); }
    @Override public void correr() { System.out.println("🏃 Corriendo"); }
}
```

Pots usar un `Triatleta` on s'espera un `Nadador`? I on s'espera un `Object`?

<details>
<summary>🔄 Solució</summary>

Sí a les dos. `Triatleta` IS-A `Nadador`, IS-A `Corredor` i IS-A `Object`. Les referències `Nadador n = new Triatleta()`, `Corredor c = new Triatleta()` i `Object o = new Triatleta()` són totes vàlides. Cada referència només exposa el seu propi contracte.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quina paraula usa una classe per a signar un contracte?
2. Quantes classes pot estendre i quantes interfícies pot implementar una classe?
3. Què són els mètodes `default` i per a què servixen?
4. Quan tries una interfície en comptes d'una classe abstracta?

<details>
<summary>🔄 Respostes</summary>

1. `implements`: `class Cancion implements Reproducible`.
2. Una sola classe (extends), però diverses interfícies (implements).
3. Mètodes amb implementació per defecte en una interfície: permeten evolucionar el contracte sense trencar les implementacions existents.
4. Quan definixes una capacitat ("pot-fer") reutilitzable, no una jerarquia amb codi compartit. I si necessites herència múltiple de contractes, la interfície és l'única via.

</details>

---

## ✅ Resum en 3 frases

1. Una **interfície** és un contracte: la classe que la implementa ha d'aportar tots els seus mètodes.
2. Les interfícies permeten **polimorfisme** i **múltiples contractes**, amb mètodes `default` per a evolucionar sense trencar res.
3. Regla pràctica: **classe abstracta** per a famílies amb codi compartit, **interfície** per a capacitats flexibles.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Interfície | Contracte de mètodes que la classe ha d'implementar |
> | `implements` | La paraula que signa el contracte |
> | Mètode `default` | Implementació per defecte que la classe pot heretar |
> | Contracte múltiple | Una classe pot implementar diverses interfícies |
> | `Interfaz.super.metodo()` | Com resoldre conflictes entre `default` |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/08-herencia-polimorfismo-interfaces) · **Anterior:** [07 · Classes abstractes](/ApuntesProgramacion/va/08-herencia-polimorfismo-interfaces/07-clases-abstractas) · **Següent:** [09 · Repàs interactiu](/ApuntesProgramacion/va/08-herencia-polimorfismo-interfaces/09-repaso-interactivo)