---
title: "03 — Encapsulació: el pilar de la POO"
description: "Atributs privats, accés controlat i el patró JavaBeans: la recepta perquè la teua classe mai no es trenque 📦"
---

<p><small>Atributs privats, accés controlat i el patró JavaBeans: la recepta perquè la teua classe mai no es trenque 📦</small></p>

> 🗺️ **Estàs en:** 🔒 **U07 · Visibilitat, Encapsulació i Static** → 03 · Encapsulació: el pilar de la POO

---

## 📬 La idea en una frase

> **Encapsular és amagar les dades (atributs `private`) i oferir mètodes controlats (`public`) per a accedir-hi. És el pilar que sosté tota la POO.**

Ja tens la ferramenta (`private`) i ara toca l'estratègia completa. Encapsulació = **privacitat + control**. No basta amagar: cal decidir com s'entra i com s'ix.

---

## 📦 La fórmula de l'encapsulació

La recepta té tres passos:

1. Els teus **atributs** són `private`. Ningú no els toca directament.
2. Controles l'accés amb **getters i setters** `public` (els veuràs en detall en el punt 4).
3. Dins dels setters i mètodes, **valides** perquè l'objecte mai no tinga un estat impossible.

Exemple de vida (o de mort), un banc que no vol fer fallida:

```java
public class CuentaBancaria {
    private double saldo;

    public void ingresar(double cantidad) {
        if (cantidad > 0) {
            this.saldo += cantidad;
        }
    }

    public void retirar(double cantidad) {
        if (cantidad > 0 && cantidad <= saldo) {
            this.saldo -= cantidad;
        } else {
            System.out.println("No tens tants diners, amic.");
        }
    }

    public double getSaldo() {
        return saldo;
    }
}
```

El saldo és `private`: **ningú** no pot fer `cuenta.saldo = -1000` des de fora. L'única manera de canviar-lo és passar per `ingresar()` i `retirar()`, que són els porters que validen.

> ⚠️ **Advertència:** si fas els atributs `public`, estàs renunciant a l'encapsulació. És com portar la cartera oberta al metro: tard o d'hora, algú fica mà.

---

## 🎁 Els avantatges (o per què no dormiràs pitjor)

* **Control:** valides i filtres. Res d'edats negatives ni saldos inventats.
* **Mantenibilitat:** canvies la implementació interna i el codi client ni s'assabenta.
* **Seguretat:** ningú no deixa el teu objecte en un estat inconsistent.
* **Baix acoblament:** cada classe va a la seua. No es fiquen unes en els assumptes d'unes altres.

> 💡 **Detall pràctic:** l'encapsulació et permet canviar com funciona un mètode per dins (per exemple, que `getSaldo()` calcule en comptes de guardar) sense que la resta del programa es trenque. Eixa llibertat val or en projectes grans.

---

## 🧬 La convenció JavaBeans: el protocol

JavaBeans és una convenció (no obligatòria, però sí sensata) que diu que una classe "ben educada":

1. És **pública**.
2. Té **constructor sense arguments**.
3. Els seus **atributs són privats**.
4. Exposa **getters i setters públics**.
5. (Opcional) implementa `Serializable`.

No et deixes enganyar pel nom: no és una llibreria màgica, és un **estil**. Moltes ferramentes i frameworks (i exàmens) esperen que les teues classes el seguixen. El punt 4 t'ensenya la convenció de noms exacta.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** quan una classe "ho deixa passar tot", sol ser perquè el seu autor va confiar massa que els altres escriurien bé. No confies mai: *valida sempre a la frontera*.

**Exercici: el guardiola que perd diners**

Esta classe pretén estar encapsulada, però amaga un fallo gros:

```java
public class Hucha {
    private int cantidad;

    public void anadir(int monedas) {
        cantidad = cantidad + monedas;
    }

    public int getCantidad() {
        return cantidad;
    }
}
```

**Preguntes (sense executar):**

1. Què passa si algú crida `hucha.anadir(-50)`?
2. Què li faltaria a `anadir()` per a estar ben blindada?
3. I si volguérem que ningú no poguera llegir la quantitat directament i només mostrara un missatge?

<details>
<summary>🔄 Solució</summary>

1. El guardiola quedaria amb `cantidad = -50`: has ficat diners negatius en un guardiola. Impossible en la vida real, permés en el codi.
2. Validar abans de sumar: `if (monedas > 0) { cantidad += monedas; }`. Mai no acceptes diners negatius.
3. És decisió de disseny: podries tindre `getCantidad()` públic i, si només vols mostrar, un mètode `mostrarCantidad()` que imprimisca. Encapsular és decidir exactament això: què es veu, què es canvia i com.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quins són els 3 passos de l'encapsulació?
2. Què és el patró JavaBeans i per a què servix?
3. Per què `CuentaBancaria` no deixa fer `saldo = -1000`?
4. Què guanyes en mantenibilitat en encapsular?

<details>
<summary>🔄 Respostes</summary>

1. Atributs `private`, accés controlat amb mètodes `public` (getters/setters) i validació a la frontera.
2. Una convenció d'estil: classe pública, constructor sense args, atributs privats i getters/setters públics. És el "protocol" que esperen moltes ferramentes.
3. Perquè el saldo és `private`: des de fora és impossible tocar-lo. Només `ingresar()` i `retirar()` el modifiquen, i eixos mètodes validen.
4. Pots canviar com funciona la teua classe per dins sense que el codi de fora es trenque ni s'assabente.

</details>

---

## ✅ Resum en 3 frases

1. **Encapsular** = atributs `private` + mètodes `public` controlats + validació.
2. Dona **control, mantenibilitat, seguretat i baix acoblament**.
3. El **patró JavaBeans** és la convenció estàndard que seguiran les teues classes a partir d'ara.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Encapsulació | Amagar dades i controlar l'accés a elles |
> | Estat | El conjunt de valors dels atributs d'un objecte |
> | JavaBeans | Convenció: classe pública, atributs privats, getters/setters |
> | Acoblament | Quant depenen unes classes d'unes altres |
> | Frontera | Els mètodes públics per on entra i ix la informació |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static) · **Anterior:** [02 · public, private i protected](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static/02-public-private-protected) · **Següent:** [04 · Getters i setters](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static/04-getters-setters)