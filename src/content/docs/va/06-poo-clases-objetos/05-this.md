---
title: "05 — La paraula clau this"
description: "L'objecte cridant «¡parle de mi, no d'un altre!» per a desambiguar i encadenar constructors 🗣️"
---

<p><small>L'objecte cridant «¡parle de mi, no d'un altre!» per a desambiguar i encadenar constructors 🗣️</small></p>

> 🗺️ **Estàs en:** 🏗️ **U06 · POO: Classes i Objectes** → 05 · La paraula clau this

---

## 📬 La idea en una frase

> **`this` és l'objecte parlant de si mateix: servix per a desambiguar entre atribut i paràmetre, per a cridar un altre constructor, i per a passar-te a tu mateix com a argument.**

Tens un problema clàssic: el paràmetre es diu igual que l'atribut. `nombre` ací, `nombre` allà... a quin et referixes? Java necessita que li dones una pista, i eixa pista es diu `this`.

---

## 🔍 Desambiguar: atribut vs paràmetre

Quan el paràmetre d'un mètode (o constructor) es diu igual que un atribut, hi ha un **xoc de noms**. Sense `this`, Java dona preferència al paràmetre (el més pròxim), així que l'atribut es queda sense tocar:

```java
public class Persona {
    String nombre;
    int edad;

    public Persona(String nombre, int edad) {
        // Sense this: "nombre" és el paràmetre, l'atribut es queda amb el seu valor per defecte
        nombre = nombre;   // ❌ no fa res útil
        this.nombre = nombre;   // ✅ atribut = paràmetre
        this.edad = edad;       // ✅ atribut = paràmetre
    }
}
```

`this.nombre` significa **"l'atribut `nombre` d'ESTE objecte"**; `nombre` a secas (a la dreta) és el paràmetre. El `this.` és la mà que assenyala: *"parle del meu, no del teu"*.

> ⚠️ **Advertència:** si no hi ha xoc de noms, `this` és opcional. Pots escriure `acelerar(int inc) { velocidad += inc; }` sense `this`, perquè `velocidad` només pot ser l'atribut. Però quan hi ha ambigüitat, `this` és obligatori si vols tocar l'atribut.

---

## 🔗 Cridar un altre constructor: `this(...)`

`this` també servix per a cridar un constructor des d'un altre constructor de la mateixa classe. Útil per a no repetir codi:

```java
public class Galleta {
    String forma;
    boolean tieneChocolate;

    public Galleta() {
        this("redonda", false);   // "crida l'altre constructor"
    }

    public Galleta(String forma, boolean tieneChocolate) {
        this.forma = forma;
        this.tieneChocolate = tieneChocolate;
    }
}
```

Ara `new Galleta()` i `new Galleta("redonda", false)` fan el mateix, però el codi només està escrit una vegada. Una regla d'or:

> 💡 **Tip:** el `this(...)` que crida un altre constructor **ha de ser la primera instrucció** del constructor. Java no deixa que faces altres coses abans. És la presentació abans de la festa: primer crides l'altre constructor i després ja fas les teues coses.

---

## 📦 Passar-te a tu mateix com a argument

`this` també pot viatjar: passes l'objecte actual com a argument a un altre mètode. És la manera que té un objecte de dir: *"escolta, passa'm a mi mateix"*.

```java
public class Cliente {
    String nombre;

    void presentarse() {
        System.out.println("Hola, soy " + nombre);
    }
}

public class Sala {
    void recibir(Cliente c) {
        c.presentarse();
    }
}
```

```java
Cliente ana = new Cliente();
ana.nombre = "Ana";
Sala sala = new Sala();
sala.recibir(ana);   // des de fora, passes la variable
```

Dins de la pròpia classe `Cliente` podries fer `sala.recibir(this)` per a passar-te a tu mateix sense tindre la variable a mà. Este cas et sonarà "rar" ara, però és la llavor de patrons que veuràs en mòduls més avançats. Per ara, memoritza la idea: **`this` és la referència a l'objecte actual**.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** per a decidir si cal `this`, pregunta't: *hi ha un paràmetre o variable local amb el mateix nom que l'atribut?* Si sí, `this.` assenyala l'atribut. Si no, no el necessites.

**Exercici: compila o no?**

Estes dues línies estan dins d'un constructor `Persona(String nombre)`. Una funciona i l'altra és una pèrdua de temps. Quina i per què?

```java
nombre = nombre;        // línia A
this.nombre = nombre;   // línia B
```

<details>
<summary>🔄 Solució</summary>

La **línia B** és la que fa alguna cosa: `this.nombre = nombre` copia el paràmetre en l'atribut. La **línia A** (`nombre = nombre`) assigna el paràmetre... al paràmetre: l'atribut es queda amb el seu valor per defecte (`null`). És com intentar omplir el teu got abocant l'aigua del teu got en el teu got: les ganes no falten, però el resultat és zero.

</details>

---

## ❓ No Hi Ha Preguntes Tontes!

> **Q:** `this` és una paraula reservada, no? Puc usar-la fora d'una classe?
>
> **A:** No. `this` fora d'una classe és com demanar una pizza en una ferreteria: no té sentit. Només existix dins del context d'un objecte, és a dir, dins de mètodes no estàtics i constructors d'una classe.

> **Q:** I què passa amb els mètodes `static`? Ahí puc usar `this`?
>
> **A:** No, i eixe és el clàssic dels exàmens. Els mètodes `static` no pertanyen a un objecte concret, així que no hi ha "este objecte" al qual assenyalar. Usar `this` en un `static` és error de compilació. Els `static` tenen la seua pròpia unitat: la U07.

> **Q:** Per què en el punt 3 vaig escriure mètodes sense `this` i funcionaven?
>
> **A:** Perquè no hi havia ambigüitat. En `int volumen() { return ancho * alto * profundo; }` no hi ha cap paràmetre anomenat `ancho`, així que Java només pot referir-se a l'atribut. `this` és el que parla en veu alta quan hi ha dos persones anomenades igual a la sala.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què significa `this.nombre`?
2. Quan és obligatori usar `this`?
3. Quina regla ha de complir el `this(...)` que crida un altre constructor?
4. Puc usar `this` dins d'un mètode `static`?

<details>
<summary>🔄 Respostes</summary>

1. L'**atribut `nombre` de l'objecte actual**.
2. Quan hi ha un **xoc de noms**: un paràmetre o variable local amb el mateix nom que l'atribut.
3. Ha de ser la **primera instrucció** del constructor.
4. **No.** Els mètodes `static` no pertanyen a un objecte, així que no hi ha "este objecte" al qual assenyalar.

</details>

---

## ✅ Resum en 3 frases

1. **`this`** és la referència a l'objecte actual: `this.nombre` parla de l'atribut, `nombre` a secas del paràmetre.
2. **`this(...)`** encadena constructors de la mateixa classe i ha d'anar sempre primer.
3. No cal `this` sense ambigüitat, i està **prohibit** dins de mètodes `static`.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `this` | La referència a l'objecte actual |
> | Desambiguar | Deixar clar a quin `nombre` et referixes |
> | Xoc de noms | Paràmetre i atribut amb el mateix nom |
> | `this(...)` | Crida a un altre constructor de la mateixa classe |
> | `static` | Context sense objecte (no admet `this`) |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/06-poo-clases-objetos) · **Anterior:** [04 · Constructors](/ApuntesProgramacion/va/06-poo-clases-objetos/04-constructores) · **Següent:** [06 · Referències, null i memòria](/ApuntesProgramacion/va/06-poo-clases-objetos/06-referencias-memoria)