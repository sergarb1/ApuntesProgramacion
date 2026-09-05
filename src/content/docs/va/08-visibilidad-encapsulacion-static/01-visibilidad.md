---
title: "01 — Visibilitat: l'art de no ensenyar-ho tot"
description: "Viure en una casa de vidre està fatal: el teu codi també mereix portes, claus i cadenats 🏠"
---

<p><small>Viure en una casa de vidre està fatal: el teu codi també mereix portes, claus i cadenats 🏠</small></p>

> 🗺️ **Estàs en:** 🔒 **U08 · Visibilitat, Encapsulació i Static** → 01 · Visibilitat: l'art de no ensenyar-ho tot

---

## 📬 La idea en una frase

> **Si tot en la teua classe és `public`, qualsevol persona (o tu mateix dins d'un any) pot trencar els teus objectes. La visibilitat és l'art de decidir què mostra la teua classe i què es queda a casa.**

En la U07 vas construir classes amb atributs i mètodes. Però hi ha una pregunta que no et vas fer: *i si algú li posa `edad = -666` al meu objecte Persona?* Si tot és públic, qualsevol pot fer-ho des de qualsevol lloc. I ací és on comença esta unitat: en el moment en què el teu codi necessita **portes**.

---

## 🏠 El problema de la casa de vidre

Imagina que vius en una casa de vidre. Qualsevol pot veure-ho tot: la teua roba interior, la teua col·lecció de cromos, eixa caixa de galetes buida que guardes "per si de cas". Incòmode, oi? Doncs el mateix passa amb els teus objectes si tot és públic:

```java
Persona p = new Persona();
p.edad = -666;          // Edat negativa... Això no té sentit.
p.saldo = 999999999;    // I a més et multipliques el saldo per zero.
```

El teu objecte queda fet un desastre. Ningú no ha comès un error greu: el problema és que **la teua classe ho permetia**. No vas posar cadenat. La visibilitat és exactament això: decidir quines parts de la teua classe són d'accés públic i quines estan fora de la vista de tot el món.

> ⚠️ **Advertència:** un atribut `public` és com deixar la porta de casa teua oberta amb un cartell que diu "Passeu i toqueu-ho tot". Tard o d'hora, algú ho farà.

---

## 🚪 Per què importa la visibilitat

Val, i per què no ho deixem tot `public` i tan contents? Per tres motius que en el món laboral són or pur:

1. **Control:** decidixes què pot llegir-se, què pot modificar-se i què ni es toca. Res d'edats negatives ni saldos impossibles.
2. **Seguretat:** ningú no pot deixar el teu objecte en un estat inconsistent (per exemple, un compte amb saldo negatiu).
3. **Mantenibilitat:** si canvies per dins com es calcula alguna cosa, el codi de fora no s'assabenta. Els canvis interns no trenquen els teus usuaris.

En els pròxims punts veuràs les ferramentes exactes (modificadors, getters i setters, `static`). Però primer necessites el concepte: **la teua classe és una caixa, i tu decidixes qui té la clau**.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** la visibilitat no és un caprici: és el contracte que la teua classe firma amb la resta del món. Abans d'escriure `public` en un atribut, pregunta't: *de veritat vull que qualsevol el puga canviar?*

**Exercici: el supermercat sense portes**

Ací tens una classe de la U07 escrita "a la bruta", amb tot públic:

```java
public class Carrito {
    public String cliente;
    public int total;          // en cèntims
    public int articulos;
}

public class Supermercado {
    public static void main(String[] args) {
        Carrito c = new Carrito();
        c.cliente = "Pepita";
        c.total = -5000;       // Una compra negativa? És clar!
        c.articulos = -3;      // -3 articles, genial.
    }
}
```

**Preguntes (sense executar):**

1. Què té de rar `c.total = -5000`?
2. Quins danys col·laterals tindria que un `main` de qualsevol classe poguera fer això en un programa de veritat?
3. Qui hauria d'impedir-ho: el `main` o la pròpia classe `Carrito`?

<details>
<summary>🔄 Solució</summary>

1. Un total de -5000 cèntims és impossible en la realitat: ningú no et paga per emportar-te la compra. L'atribut accepta qualsevol valor perquè és `public` i no hi ha filtre.
2. En un programa gran, un altre company (o tu dins de tres mesos) podria ficar valors impossibles, trencar la lògica de preus i fer que el bug apareguera a quilòmetres del lloc on es va originar. Trobar-lo costaria hores.
3. La pròpia classe. Ella és la que coneix les seues regles (un total no pot ser negatiu), així que ella ha de blindar-se. Això és la **encapsulació** dels punts 3 i 4.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quin problema té que tots els atributs d'una classe siguen `public`?
2. Què guanyes en amagar la implementació interna de la teua classe?
3. Qui és el responsable que una classe no accepte valors impossibles?
4. Per què és important la visibilitat per al manteniment del codi?

<details>
<summary>🔄 Respostes</summary>

1. Qualsevol classe pot modificar els atributs directament i deixar l'objecte en un estat impossible (edats negatives, saldos inventats...).
2. Control, seguretat i mantenibilitat: pots canviar com funciona per dins sense que el codi de fora s'assabente ni es trenque.
3. La pròpia classe. És la que coneix les seues regles de negoci, així que és la que ha de validar i amagar.
4. Perquè els canvis interns no trenquen el codi que usa la classe: el "contracte" públic es manté estable.

</details>

---

## ✅ Resum en 3 frases

1. La **visibilitat** decidix quines parts de la teua classe pot veure i usar la resta del món.
2. Amb tot `public`, qualsevol codi pot trencar els teus objectes amb valors impossibles.
3. Amagar dades et dona **control, seguretat i mantenibilitat**: els tres superpoders del programador que no plora debuggejant.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Visibilitat | Què es veu d'una classe des de fora |
> | `public` | Visible per a tots, absolutament tots |
> | Atribut | La "caixa" de dades de la classe (ex. `edad`) |
> | Estat inconsistent | Un objecte amb valors impossibles (ex. `edad = -5`) |
> | Contracte públic | El que la teua classe promet al món exterior |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/08-visibilidad-encapsulacion-static) · **Anterior:** [Índex de la unitat](/ApuntesProgramacion/va/08-visibilidad-encapsulacion-static) · **Següent:** [02 · public, private i protected](/ApuntesProgramacion/va/08-visibilidad-encapsulacion-static/02-public-private-protected)