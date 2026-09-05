---
title: "01 — Herència: quan els teus fills seguixen els teus passos"
description: "extends, què s'hereda i què no, IS-A vs HAS-A i l'arbre genealògic de les teues classes 🧬"
---

<p><small>extends, què s'hereda i què no, IS-A vs HAS-A i l'arbre genealògic de les teues classes 🧬</small></p>

> 🗺️ **Estàs en:** 🧬 **U08 · Herència, Polimorfisme i Interfícies** → 01 · Herència: quan els teus fills seguixen els teus passos

---

## 📬 La idea en una frase

> **L'herència permet que una classe filla obtinga els membres d'una classe pare amb `extends`, reutilitzant codi i afegint o millorant el que calga.**

Recordes quan vas heretar el nas de l'àvia o el geni per a enfadar els professors? Doncs en Java passa el mateix, però amb menys drama i més codi reutilitzable.

---

## 🧬 Què és l'herència?

L'herència és el mecanisme pel qual una classe _filla_ (subclasse) obté tots els membres d'una classe _pare_ (superclasse). I pot fer dues coses més: **afegir** els seus propis i **millorar** els existents.

```java
public class Animal {
    protected String nombre;
    protected int edad;

    public void hacerSonido() {
        System.out.println("Algún sonido genérico...");
    }
}

public class Perro extends Animal {
    public void hacerSonido() {
        System.out.println("¡Guau guau!");
    }

    public void moverCola() {
        System.out.println("*mueve la cola felizmente*");
    }
}
```

`Perro` ara té `nombre`, `edad`, `hacerSonido()` (millorat) i `moverCola()`. Cortesia de l'herència.

> 💡 **Consell:** codi reutilitzat, neurones estalviades. L'herència existix perquè NO hages de copiar i enganxar el mateix codi en 15 classes.

---

## 🔑 extends: "Sóc com tu, però amb millores"

La paraula clau és `extends` (la vas vore en la U07 per damunt, ara la domines):

```java
public class Coche extends Vehiculo {
    // Coche té TOT el de Vehiculo + el seu
}
```

Darrere de cada `extends` hi ha una pregunta: **realment és-un?** Si la resposta és sí, avant. Si és "té-un"... això és composició, i la veuràs en el punt 3.

### Què s'hereda i què no?

No tot viatja de pares a fills. Esta taula t'ho aclarix:

| Membre | ¿Ho hereta la filla? |
|---|---|
| `public` | ✅ Sí |
| `protected` | ✅ Sí |
| package-private (sense modificador) | ✅ Sí, si és al mateix paquet |
| `private` | ❌ No (però existix dins de l'objecte) |
| Constructors | ❌ No (s'invoquen amb `super()`, punt 2) |
| Mètodes `final` | ❌ No es poden sobreescriure |

> ⚠️ **Advertència:** els membres `private` no s'hereden, però continuen ahí, dins de l'objecte. La filla no pot tocar-los directament, però el pare els usa. És com els diners al compte dels teus pares: existixen, però no els toques.

---

## ⚖️ La regla d'or: IS-A vs HAS-A

- **IS-A** (és-un): relació d'herència. `Perro` IS-A `Animal`.
- **HAS-A** (té-un): relació de composició. `Coche` HAS-A `Motor`.

```java
public class Coche extends Vehiculo { }   // IS-A ✓
public class Coche { private Motor m; }   // HAS-A ✓
```

> 🎮 **¿Qui vol ser milionari? — Edició Java:**
> Quina és la relació correcta? a) `Cliente extends Persona`  b) `Cliente has-a Persona`  c) `Coche extends Rueda`
>
> **Resposta:** la a. `Cliente` IS-A `Persona`. `Coche` NO és una roda: té rodes (HAS-A). Si vas dubtar amb la c, repassa el teu vocabulari de cotxes.

---

## 🌳 Jerarquia de classes: l'arbre genealògic

Una classe pot heredar d'una altra que al seu torn hereta d'una altra. Així es formen les jerarquies:

```java
public class Animal { }
public class Mamifero extends Animal { }
public class Canino extends Mamifero { }
public class Perro extends Canino { }
```

`Perro` hereta de `Canino`, que hereta de `Mamifero`, que hereta de `Animal`. Cada generació aporta el seu:

```
       Animal
         │
     ┌───┴───┐
  Mamifero   Ave
     │
  Canino
     │
   Perro
```

> 📝 **Nota:** com més amunt en l'arbre, més general és la classe; com més avall, més específica. `Animal` no sap bordar; `Perro` no sap volar. Cadascú al seu nivell.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** quan una classe hereta, s'emporta TOT el accessible. Pregunta't sempre què veu la filla abans d'escriure `extends`.

**Exercici: l'examen de visibilitat**

```java
public class Animal {
    private String idSecreto = "X-123";
    protected String nombre = "Animal";
    public int edad = 5;
}

public class Perro extends Animal {
    public void mostrar() {
        System.out.println(idSecreto); // ¿compila?
        System.out.println(nombre);    // ¿compila?
        System.out.println(edad);      // ¿compila?
    }
}
```

**Preguntes (sense executar):**

1. Quina de les tres línies compila?
2. Què passaria si `idSecreto` fóra `protected` en comptes de `private`?

<details>
<summary>🔄 Solució</summary>

1. `idSecreto` **NO** compila (és `private`: només `Animal` el veu). `nombre` **sí** (és `protected`). `edad` **sí** (és `public`).
2. Llavors `Perro` el veuria sense problema. `protected` és el "secret de família" del qual parlaràs en el punt 3.

</details>

**Exercici: què imprimeix?**

```java
class Abuelo { void decir() { System.out.println("Abuelo"); } }
class Padre extends Abuelo { void decir() { System.out.println("Padre"); } }
class Hijo extends Padre { void decir() { System.out.println("Hijo"); } }

public class Test {
    public static void main(String[] args) {
        new Hijo().decir();
    }
}
```

<details>
<summary>🔄 Solució</summary>

Imprimeix **"Hijo"**. Java busca el mètode des de la classe més específica cap amunt: troba `decir()` en `Hijo` i ahí es queda. Mai no puja a `Padre` ni a `Abuelo`.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quina paraula clau uses perquè `Perro` herede d'`Animal`?
2. S'hereden els atributs `private`? I els `protected`?
3. És `Coche extends Rueda` bona idea? Per què?
4. Què significa que una jerarquia de classes és un "arbre genealògic"?

<details>
<summary>🔄 Respostes</summary>

1. `extends`: `public class Perro extends Animal { }`.
2. `private` no s'hereden; `protected` sí (i també `public`).
3. No: `Coche` no és una roda, té rodes. Seria HAS-A (composició), no IS-A.
4. Que cada nivell és més específic: `Perro` hereta de `Canino`, que hereta de `Mamifero`, que hereta de `Animal`.

</details>

---

## ✅ Resum en 3 frases

1. **L'herència** amb `extends` permet que una subclasse reutilitze i millore els membres de la seua superclasse.
2. Només s'hereda el **accessible** (`public`, `protected` i package-private); els `private` i els constructors no.
3. Abans d'heredar, pregunta: **és-un?** Si és "té-un", usa composició.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Superclasse | La classe pare, la general |
> | Subclasse | La classe filla, l'específica |
> | `extends` | La paraula que establix l'herència |
> | IS-A | Relació d'herència (Perro és-un Animal) |
> | HAS-A | Relació de composició (Coche té-un Motor) |
> | Jerarquia | L'arbre de classes de general a específic |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/08-herencia-polimorfismo-interfaces) · **Anterior:** — · **Següent:** [02 · super i @Override](/ApuntesProgramacion/va/08-herencia-polimorfismo-interfaces/02-super-override)