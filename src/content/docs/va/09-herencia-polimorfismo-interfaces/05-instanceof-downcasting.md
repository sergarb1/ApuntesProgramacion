---
title: "05 — instanceof i downcasting"
description: "Preguntar qui eres realment i baixar la referència amb cura per a no estavellar-te 🧬"
---

<p><small>Preguntar qui eres realment i baixar la referència amb cura per a no estavellar-te 🧬</small></p>

> 🗺️ **Estàs en:** 🧬 **U09 · Herència, Polimorfisme i Interfícies** → 05 · instanceof i downcasting

---

## 📬 La idea en una frase

> **`instanceof` pregunta "eres realment això?" i el downcasting `(Tipo)` baixa la referència; junts són segurs, per separat... perillosos.**

En el punt 4 vas vore que una referència `Animal` no pot cridar a `moverCola()` d'un `Perro`. Per a arribar a eixos mètodes específics necessites baixar la referència. I per a baixar sense estavellar-te, necessites preguntar abans.

---

## 🕵️ instanceof: "Qui eres realment?"

`instanceof` torna `true` si l'objecte és d'eixe tipus (o d'una subclasse):

```java
Animal a = new Perro();
if (a instanceof Perro) {
    System.out.println("¡Es un perro!");
}
```

> 💡 **Consell:** usa'l amb moderació. Si omplis el teu codi d'`instanceof`, alguna cosa estàs fent mal: el polimorfisme (punt 4) hauria de resoldre la majoria dels casos sense preguntar. `instanceof` és per a quan un objecte concret necessita un tracte que el polimorfisme no cobrix.

---

## 📉 Downcasting: baixar la referència

Pujar (upcasting) és gratuït i implícit: `Animal a = new Perro();`. Baixar (downcasting) és explícit i arriscat:

```java
Animal a = new Perro();
Perro p = (Perro) a;   // downcasting
p.moverCola();         // ✓ funciona
```

Però si t'equivoques de tipus:

```java
Animal a2 = new Gato();
Perro p2 = (Perro) a2;  // 💥 ClassCastException en runtime
```

Java no es deixa enganyar: l'objecte real és un `Gato`, i convertir-lo a `Perro` explota en temps d'execució. És com intentar fer parlar un gat en un concurs de gossos: el públic (la JVM) ho veu i munta un escàndol.

> ⚠️ **Advertència:** el downcasting **compila sempre** (el compilador no sap què hi ha dins de la variable), però pot fallar en runtime. L'única xarxa de seguretat és preguntar abans.

---

## 🛡️ El combo segur: instanceof + downcasting

La recepta que mai no falla:

```java
if (a instanceof Perro) {
    Perro p = (Perro) a;
    p.moverCola();
} else {
    System.out.println("No es un perro, no puedo hacerlo mover la cola.");
}
```

`instanceof` és la teua mirilla: si és un repartidor de pizzes, obri; si és un lleó, millor no.

### Exemple real: downcasting en una llista polimòrfica

```java
import java.util.ArrayList;

ArrayList<Empleado> plantilla = new ArrayList<>();
plantilla.add(new Programador("Ana"));
plantilla.add(new Disenador("Luis"));
plantilla.add(new Programador("Eva"));

for (Empleado e : plantilla) {
    if (e instanceof Programador) {
        ((Programador) e).escribirCodigo();
    } else if (e instanceof Disenador) {
        ((Disenador) e).disenar();
    }
}
```

Cada empleat rep el seu tracte especial només si realment és d'eixe tipus. Sense `instanceof`, no podries cridar a `escribirCodigo()` ni a `disenar()`.

---

## ✨ Bonus: pattern matching (Java 16+)

Des de Java 16 hi ha una versió més neta d'`instanceof` + casting en una sola línia:

```java
if (a instanceof Perro p) {
    p.moverCola();   // ja no fa falta el (Perro)
}
```

El compilador crea la variable `p` automàticament dins del bloc. Menys codi, mateix resultat, zero `ClassCastException` possible.

> 📝 **Nota:** en el teu IDE de classe, si uses una versió de Java anterior a la 16, queda't amb la forma clàssica. El patró no canvia el concepte: preguntar abans de baixar.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** el downcasting sense `instanceof` és jugar a la ruleta russa amb el teu programa. Pregunta sempre abans de baixar.

**Exercici: què ocorre ací?**

```java
Animal a = new Perro();
if (a instanceof Gato) {
    System.out.println("Es un gato");
} else {
    System.out.println("No es un gato");
}
```

<details>
<summary>🔄 Solució</summary>

Imprimeix **"No es un gato"**. L'objecte real és un `Perro`, així que `a instanceof Gato` és `false`. El programa ni tan sols intenta el downcasting: `instanceof` t'ha salvat del `ClassCastException`.

</details>

**Exercici: el jutge de la granja**

```java
ArrayList<Animal> granja = new ArrayList<>();
granja.add(new Perro());
granja.add(new Gato());
granja.add(new Vaca());

for (Animal a : granja) {
    if (a instanceof Perro) {
        System.out.println("El perro mueve la cola");
    } else if (a instanceof Gato) {
        System.out.println("El gato ronronea");
    } else {
        System.out.println("Alguien da leche");
    }
}
```

Quants `instanceof` són necessaris? Podries haver-ho fet sense cap?

<details>
<summary>🔄 Solució</summary>

Dos `instanceof` basten (el `else` final captura a `Vaca`). I sí, es podria haver resolt amb polimorfisme pur: un mètode `comportamientoEspecial()` en cada animal i un sol `for`. `instanceof` brilla quan el comportament és impossible de ficar en la superclasse (mètodes que només existixen en una subclasse, com `moverCola()`).

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què torna `instanceof` si l'objecte no és d'eixe tipus?
2. Quina excepció llança un downcasting mal fet?
3. Per què el combo `instanceof` + casting és segur?
4. Quan NO hauries d'usar `instanceof`?

<details>
<summary>🔄 Respostes</summary>

1. `false`.
2. `ClassCastException`, en temps d'execució.
3. Perquè `instanceof` garantix que l'objecte és d'eixe tipus (o subclasse) abans de convertir, així que el cast no pot fallar.
4. Quan el polimorfisme pot resoldre-ho amb un mètode sobreescrit: no preguntes el que la JVM ja sap.

</details>

---

## ✅ Resum en 3 frases

1. **`instanceof`** comprova el tipus real de l'objecte abans d'actuar.
2. El **downcasting** `(Tipo) ref` baixa la referència i només és segur després d'un `instanceof`.
3. Usa este combo **amb moderació**: el polimorfisme sol ser la solució més neta.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `instanceof` | Operador que comprova el tipus real d'un objecte |
> | Downcasting | Convertir una referència a un tipus més específic |
> | Upcasting | Convertir (implícit) a un tipus més general |
> | `ClassCastException` | Explosió en runtime per un cast impossible |
> | Pattern matching | `instanceof Perro p` (Java 16+): preguntar i baixar en un pas |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces) · **Anterior:** [04 · Polimorfisme: el camaleó de la POO](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/04-polimorfismo) · **Següent:** [06 · La classe Object: el besavi de tot](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/06-clase-object)