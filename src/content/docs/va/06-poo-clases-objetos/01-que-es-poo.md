---
title: "01 — Què és la POO"
description: "Quan el teu codi deixa de ser una recepta i es convertix en un món de coses que parlen entre elles 🏗️"
---

<p><small>Quan el teu codi deixa de ser una recepta i es convertix en un món de coses que parlen entre elles 🏗️</small></p>

> 🗺️ **Estàs en:** 🏗️ **U06 · POO: Classes i Objectes** → 01 · Què és la POO

---

## 📬 La idea en una frase

> **La POO és escriure codi com funciona el món real: en comptes d'una llista d'instruccions, models *coses* amb les seues dades (atributs) i els seus comportaments (mètodes).**

Fins ara els teus programes eren com una **recepta de cuina**: fes això, després això, després l'altre. Molt ordenat, però molt rígid. Si vols representar dos estudiants, dos cotxes o dos galetes... comences a copiar i enganxar variables com un boig. I quan el programa creix, la recepta es convertix en un caos.

La POO arriba per a posar ordre: en lloc de variables soltes, agrupes les dades *de la mateixa cosa* juntament amb el que eixa cosa *sap fer*. Un gos no és només un `String nombre` i un `int edad` solts per ahí: és un **objecte** que té nom, edat, i sap lladrar.

---

## 📜 De la recepta al món real

Imagina que has de gestionar les dades d'un estudiant sense POO:

```java
String nombre1 = "Ana";
int edad1 = 20;
double nota1 = 8.5;

String nombre2 = "Luis";
int edad2 = 19;
double nota2 = 6.0;
```

Amb dos estudiants, ja són sis variables. Amb cinquanta, és la pitjor malson de la teua vida. Les dades de cada persona estan **desconnectades**: no hi ha res que diga "nombre1, edad1 i nota1 van junts perquè són Ana".

Amb POO agrupes tot això en una peça:

```java
public class Estudiante {
    String nombre;
    int edad;
    double nota;
}
```

I cada estudiant és un **objecte** amb les seues tres dades dins, ben lligades. Ja no tens variables soltes: tens *persones*.

> 💡 **Tip:** quan veges codi ple de `nombre1`, `nombre2`, `nombre3`, fa olor que dins vol nàixer una classe. Eixe olfacte s'entrena, i esta unitat és el teu gimnàs.

---

## 🧩 Els dos ingredients: atributs i mètodes

Tota classe es construïx amb dos ingredients:

- **Atributs (o propietats):** les dades que descriuen la cosa. El color del cotxe, l'edat del gos, el saldo del compte.
- **Mètodes (o comportaments):** el que la cosa *sap fer*. Accelerar, lladrar, retirar diners.

```java
public class Perro {
    // Atributs
    String nombre;
    int edad;

    // Mètodes
    void ladrar() {
        System.out.println(nombre + ": ¡Guau!");
    }
}
```

> 📝 **Nota:** encara no executem res. Esta classe és només el *disseny*. Que existisca `Perro` no significa que existisca un gos. Això arribarà en el punt 2 amb `new`.

---

## 🏛️ Els quatre pilars (una promo, no el capítol)

La POO es recolza en quatre pilars. En esta unitat toquem el primer a fons i fem la promo dels altres:

1. **Abstracció:** et quedes amb el que és important d'una cosa i t'oblides del soroll. Un gat en un programa és `nombre`, `edad` i `maullar()`, no els seus bigotis.
2. **Encapsulació (U07):** cada objecte protegix les seues dades i decidix qui pot tocar-les. Com un compte bancari: el saldo no està tirat al carrer.
3. **Herència (U08):** una classe pot "heretar" d'una altra. Un `Perro` és un `Animal` i, a més, lladra.
4. **Polimorfisme (U08):** el mateix missatge, distintes respostes. Tots els animals "fan so"; el gos lladra i el gat miola.

> ⚠️ **Advertència:** no t'estresses amb els pilars 2, 3 i 4. Esta unitat et dona els fonaments; els altres els alcem en la U07 i la U08. Ací mana l'abstracció i el naixement de les classes.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** quan veges una classe, pregunta't sempre dues coses: *quines dades té?* (atributs) i *què sap fer?* (mètodes). Si saps respondre, ja has entès el 80% de la POO.

**Exercici: classifica**

Sense executar res, decidix per a cada un d'estos si és un **atribut** o un **mètode** d'una classe `Videojuego`:

1. `String titulo;`
2. `void pausar() { ... }`
3. `int nivelMaximo;`
4. `double calcularPuntuacion() { ... }`
5. `boolean estaInstalado;`

<details>
<summary>🔄 Solució</summary>

1. **Atribut** — el títol és una dada que descriu el joc.
2. **Mètode** — pausar és una cosa que el joc *sap fer*.
3. **Atribut** — el nivell màxim és una dada.
4. **Mètode** — calcular la puntuació és un comportament (a més retorna un `double`).
5. **Atribut** — si està instal·lat o no és una dada (un `boolean`).

La regla d'or: **atribut = substantiu (dada), mètode = verb (acció)**. Si el pots conjugar ("pausar", "calcular"), és mètode. Si el pots descriure ("títol", "nivell"), és atribut.

</details>

---

## ❓ No Hi Ha Preguntes Tontes!

> **Q:** Val, però jo ja sé fer programes amb variables i bucles. De veritat necessite tot este rotllo?
>
> **A:** Per a un programa de 30 línies, no. Per a qualsevol cosa que vaja a créixer, sí. Els bucles i variables continuen estant (no els abandonem, els usem *dins* dels mètodes), però la POO et dona una forma d'organitzar el codi que escala. Ningú no escriu un programa d'empresa amb una sola llista d'instruccions. Bé, ningú *sa*.

> **Q:** La POO és només cosa de Java?
>
> **A:** No. És una *forma de pensar* que usen quasi tots els llenguatges moderns: Python, JavaScript, C++, C#... Cada un amb el seu accent, però la idea és la mateixa: modelar el món en objectes. Aprendre-la ací et servix per a tots.

> **Q:** Què passa amb el `main` que porte escrivint des de la U01? Ara no servix?
>
> **A:** El `main` continua sent la porta d'entrada: el que hi ha dins de `main` és la "recepta" que arranca la pel·lícula. El que canvia és que ara, dins d'eixe `main`, en comptes de variables soltes crearàs objectes. El `main` continua sent el director; només canvia el repartiment.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quins dos ingredients formen una classe?
2. Quin pilar de la POO consistix a "quedar-te amb el que és important"?
3. Un `String color;` dins d'una classe és atribut o mètode?
4. En quines unitats es veuen l'encapsulació i l'herència?

<details>
<summary>🔄 Respostes</summary>

1. **Atributs** (les dades) i **mètodes** (els comportaments).
2. L'**abstracció**.
3. **Atribut** — és una dada (un substantiu), no una acció.
4. L'**encapsulació** en la U07 i l'**herència** (i el polimorfisme) en la U08.

</details>

---

## ✅ Resum en 3 frases

1. La **POO** modela el món real en objectes amb **atributs** (dades) i **mètodes** (comportaments), en comptes d'una llista d'instruccions.
2. La **classe** és el disseny de la cosa; encara no hi ha cap "cosa" real fins que no la instancies.
3. Els quatre pilars són **abstracció, encapsulació, herència i polimorfisme**; en esta unitat cimentem el primer.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | POO | Paradigma que organitza el codi en objectes |
> | Atribut | Dada que descriu la cosa: `color`, `edat` |
> | Mètode | Comportament que la cosa sap fer: `acelerar()` |
> | Abstracció | Quedar-te amb l'essencial i oblidar el soroll |
> | Procedural | Estil antic: una recepta d'instruccions en ordre |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/06-poo-clases-objetos) · **Anterior:** [Índex de la unitat](/ApuntesProgramacion/va/06-poo-clases-objetos) · **Següent:** [02 · Classes i objectes: el tallagalletas i les galetes](/ApuntesProgramacion/va/06-poo-clases-objetos/02-clases-objetos)