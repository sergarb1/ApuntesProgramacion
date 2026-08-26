---
title: "02 — Classes i objectes: el tallagalletas i les galetes"
description: "El motle, la galeta, `new` i la teua primera classe: ja no escrius receptes, fornegis 🍪"
---

<p><small>El motle, la galeta, `new` i la teua primera classe: ja no escrius receptes, fornegis 🍪</small></p>

> 🗺️ **Estàs en:** 🏗️ **U06 · POO: Classes i Objectes** → 02 · Classes i objectes: el tallagalletas i les galetes

---

## 📬 La idea en una frase

> **Una classe és el tallagalletas (el motle) i un objecte és la galeta que fas amb ell: un sol motle, milions de galetes, i cada una amb el seu propi sabor.**

En el punt 1 vas vore que una classe és un disseny. Ara toca la pregunta del milió: i què faig amb un disseny? L'use per a **fabricar coses**. I en Java, la fàbrica es diu `new`.

---

## 🍪 El tallagalletas i la galeta

Imagina la cuina de la teua àvia. Té un tallagalletas amb forma d'estrela. Eixe tallagalletas és **la classe**: definix la forma de totes les galetes, però ell mateix no és una galeta. Pots usar-lo mil vegades i cada galeta serà distinta: unes amb pepitas de xocolate, altres de vainilla, altres que la teua cosina es menja a mig fer.

En programació:

- **Classe** = el tallagalletas. Definix *quins atributs* i *quins mètodes* tindran totes les seues galetes.
- **Objecte** = la galeta. Una cosa concreta, amb els seus propis valors, vivint en la memòria.

Així que d'un sol motle ixen infinites galetes, totes amb la mateixa forma però cada una amb la seua pròpia vida.

---

## 🔨 La teua primera classe

Escrivim el tallagalletas `Galleta`:

```java
public class Galleta {
    String sabor;
    boolean tieneChocolate;

    void comer() {
        System.out.println("Ñam, galleta sabor " + sabor);
    }
}
```

Això només definix el motle. Per ara, **no existix cap galeta en memòria**. És un fitxer al disc esperant que algú l'use.

> 📝 **Nota:** la classe porta `public class Galleta` i el fitxer es diu `Galleta.java`. El nom de la classe i del fitxer han de coincidir. És la primera regla no escrita de Java... val, escrita.

---

## 🏭 `new`: la màquina de galetes

Per a fabricar galetes (objectes) a partir del motle uses l'operador `new`:

```java
public class Pasteleria {
    public static void main(String[] args) {
        Galleta g1 = new Galleta();          // Primera galeta
        g1.sabor = "Chocolate";
        g1.tieneChocolate = true;

        Galleta g2 = new Galleta();          // Segona galeta (mateix motle)
        g2.sabor = "Vainilla";
        g2.tieneChocolate = false;

        g1.comer();   // "Ñam, galleta sabor Chocolate"
        g2.comer();   // "Ñam, galleta sabor Vainilla"
    }
}
```

Desgranem la línia estrella: `Galleta g1 = new Galleta();`

1. `Galleta g1` — declara una variable que apuntarà a una galeta.
2. `new Galleta()` — fabrica la galeta en memòria (i crida al seu constructor, que veuràs en el punt 4).
3. `=` — connecta la variable `g1` amb la galeta acabada de fornejar.

Després, amb `g1.sabor = "Chocolate"` i `g1.comer()`, li dius a *eixa* galeta concreta quin sabor té i que es menge. La `g2` no s'assabenta de res: és una altra galeta amb la seua pròpia vida.

> 💡 **Tip:** el punt (`.`) és la mà que estens a l'objecte. `g1.comer()` significa "escolta, galeta g1, executa el teu mètode comer". `g1.sabor` significa "dona'm el sabor de la galeta g1".

---

## 🥊 Classe vs objecte: el ring

**Classe:** — Jo soc el motle, el plànol, la idea platònica. Sense mi no existiries. Definisc quins atributs i mètodes tenen els objectes. Soc la creadora!

**Objecte:** — Sí, però jo soc qui realment fa coses. Tu ets només un fitxer `.java` al disc. Jo ocupe memòria, tinc estat, puc canviar els meus atributs. Sense mi el teu codi no serveix per a res.

**Classe:** — Ah sí? I quants de tu existeixen? Pots tindre milers d'objectes creats a partir de mi. Jo soc únic, tu eres una còpia. Soc original, eres reproduïble!

**Objecte:** — Exacte. Perquè tu eres el plànol, però jo soc l'edifici construït. Ningú viu en un plànol. Quan executes el programa, el que treballa soc jo.

**Classe:** — Val, ens necessitem. Sense classe no hi ha objecte. Sense objecte, la classe és només teoria.

**Objecte:** — Tracte fet.

> 🕶️ **Don Tip:** la classe definix el **QUÈ** (atributs) i el **CÓM** (mètodes). L'objecte és el **QUI** (la instància concreta que executa i té valors propis).

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** compta cada `new` com una galeta nova. Cada `new` = un objecte nou en memòria, encara que siga del mateix motle.

**Exercici: quantes galetes hi ha?**

Sense executar, respon: quants objectes de la classe `Galleta` existixen en memòria al final d'este `main`?

```java
public class Pasteleria2 {
    public static void main(String[] args) {
        Galleta g1 = new Galleta();
        Galleta g2 = new Galleta();
        Galleta g3 = g1;
        g1.comer();
    }
}
```

<details>
<summary>🔄 Solució</summary>

**2 objectes.** `g1` i `g2` són dues galetes distintes. `g3 = g1` no crea una tercera galeta: fa que `g3` *apunte a la mateixa* que `g1`. Dos noms, una galeta. Això es diu **àlies** i ho destripem en el punt 6. Per ara, memoritza: **cada `new` fabrica un objecte; copiar una variable no fabrica res**.

</details>

---

## ❓ No Hi Ha Preguntes Tontes!

> **Q:** Per què cal escriure `new`? No podria Java crear l'objecte sol?
>
> **A:** No, perquè `new` és el "permís de construcció". Sense `new`, només declares una variable (com `Galleta g;`), però no hi ha galeta a la safata, només un forat buit. Fins que no faces `new`, l'objecte no existix.

> **Q:** I per què `String nombre = "Ana";` no porta `new`?
>
> **A:** Perquè Java és un amor amb `String`. És tan comú que et deixa crear-lo amb cometes directament (un literal). És una drecera: darrere del teló, Java ho tracta quasi com si tinguera `new`. Però això és un privilegi de `String` (i dels arrays), no una norma general. Tu, amb les teues classes, hauràs d'usar `new` com tothom.

> **Q:** Puc tindre diverses classes en un mateix fitxer `.java`?
>
> **A:** Pots, però només **una** pot ser `public` i ha de coincidir amb el nom del fitxer. Les altres van sense `public`. Per a començar, un fitxer = una classe pública. Simple i net.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què és la classe en l'analogia del tallagalletas?
2. Quin operador fabrica objectes en memòria?
3. Quants objectes crea este codi: `Galleta a = new Galleta(); Galleta b = new Galleta();`?
4. Per a què servix el punt (`.`) entre l'objecte i el membre?

<details>
<summary>🔄 Respostes</summary>

1. La classe és el **tallagalletas** (el motle); l'objecte és la galeta.
2. `new`.
3. **2 objectes**, un per cada `new`.
4. Per a **accedir** a un atribut (`g.sabor`) o invocar un mètode (`g.comer()`) d'eixe objecte concret.

</details>

---

## ✅ Resum en 3 frases

1. La **classe** és el motle que definix atributs i mètodes; l'**objecte** és la galeta concreta, amb els seus propis valors, vivint en memòria.
2. Els objectes es fabriquen amb **`new`**, i cada `new` crea una instància independent encara que use el mateix motle.
3. Amb el **punt** (`.`) accedeixes als atributs i invoques els mètodes d'un objecte concret.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Classe | El motle / tallagalletas. Definix atributs i mètodes |
> | Objecte | La galeta. Instància concreta amb valors propis |
> | Instanciar | Crear un objecte a partir d'una classe amb `new` |
> | Instància | Sinònim d'objecte creat |
> | Membre | Qualsevol atribut o mètode d'una classe |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/06-poo-clases-objetos) · **Anterior:** [01 · Què és la POO](/ApuntesProgramacion/va/06-poo-clases-objetos/01-que-es-poo) · **Següent:** [03 · Atributs i mètodes](/ApuntesProgramacion/va/06-poo-clases-objetos/03-atributos-metodos)