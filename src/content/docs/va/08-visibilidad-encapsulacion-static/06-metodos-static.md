---
title: "06 — Mètodes static i el main"
description: "Cridar mètodes sense crear objectes, la classe Math, i per què main és el primer a arribar a la festa 🎉"
---

<p><small>Cridar mètodes sense crear objectes, la classe Math, i per què main és el primer a arribar a la festa 🎉</small></p>

> 🗺️ **Estàs en:** 🔒 **U08 · Visibilitat, Encapsulació i Static** → 06 · Mètodes static i el main

---

## 📬 La idea en una frase

> **Un mètode `static` es diu usant la classe, sense crear objectes; no té `this` i no pot tocar atributs d'instància. I `main` és estàtic perquè és el primer a arribar a una festa on encara no existix cap objecte.**

Si els atributs `static` són el grup de WhatsApp, els mètodes `static` són el número d'atenció al client: no necessites parlar amb un empleat concret, crides al número general i llest.

---

## 📞 El telèfon de la classe

Un mètode estàtic es declara amb `static` i s'invoca usant el **nom de la classe**:

```java
public class UtilidadesMatematicas {
    public static int sumar(int a, int b) {
        return a + b;
    }

    public static double media(double a, double b) {
        return (a + b) / 2;
    }
}
```

```java
int resultado = UtilidadesMatematicas.sumar(5, 3);  // Sense new, sense objecte.
double med = UtilidadesMatematicas.media(10, 20);
```

Compara-ho amb un mètode d'instància, que exigix un objecte:

```java
String texto = "Hola";
int longitud = texto.length();   // length() NO és static: necessite l'objecte texto.
```

Eixa és la gran diferència pràctica: **static → classe; sense static → objecte**.

---

## 🚫 El que un mètode estàtic NO pot fer

Regles d'or que salven exàmens:

1. **No pot accedir a atributs d'instància** (no sap de quin objecte parla).
2. **No té `this`** (no hi ha "jo" perquè no hi ha objecte).
3. Només pot cridar **directament** a altres mètodes estàtics.

```java
public class Prueba {
    int x = 1;
    static int y = 1;

    public void incrementarX() { x++; }          // Mètode d'instància
    public static void incrementarY() { y++; }   // Mètode estàtic
}
```

`incrementarY()` pot tocar `y` (estàtic) però no `x`: no sap quin `x` agarrar. `incrementarX()` pot tocar `x` perquè es diu sobre un objecte concret.

> ⚠️ **Advertència:** el clàssic del novell és ficar `System.out.println(nombreDeInstancia)` dins d'un mètode `static` i esperar que funcione. El compilador et dirà *"non-static variable cannot be referenced from a static context"*. Ara ja saps per què.

---

## 🧮 La classe Math: la fàbrica de mètodes estàtics

`java.lang.Math` és la classe utilitària per excel·lència. TOTS els seus mètodes són estàtics. No pots (ni vols) fer `new Math()`:

```java
double max = Math.max(10, 20);       // 20.0
double raiz = Math.sqrt(25);         // 5.0
double potencia = Math.pow(2, 10);   // 1024.0
double absoluto = Math.abs(-7);      // 7.0
double random = Math.random();       // Aleatori en [0.0, 1.0)
```

La uses des del primer dia del curs, i ara entens **per què** funciona sense `new`: són mètodes estàtics. I de pas, `Integer.parseInt("42")` també ho és.

> 📝 **Nota:** `Math` té el constructor **privat**. Ningú no pot instanciar-la. És com una estàtua: per a admirar-la, no per a fer-li clons. Les classes així es diuen *utilitàries* i les muntes tu en el punt 7.

---

## 🎉 Per què `main` és static

`main` és el mètode que ho arranca tot:

```java
public static void main(String[] args)
```

Per què és estàtic? Perquè quan comença el programa **encara no existix cap objecte**. Algú ha d'arrancar la festa abans que arribe ningú. Si `main` fóra d'instància, la JVM necessitaria un objecte per a cridar-lo... i per a crear eixe objecte necessitaria un programa en marxa. Peix que es mossega la cua. Per això `main` és el primer a arribar i obri la porta ell mateix.

---

## 🤷 No hi ha preguntes tontes

> ❓ **Puc cridar a un mètode estàtic des d'un objecte? Com `miObjeto.metodoEstatico()`?**

Tècnicament sí: Java t'ho permet. Però és com cridar a ta mare pel cognom: funciona, però queda rar. La convenció és usar la classe: `Clase.metodoEstatico()`. De fet, alguns IDEs et mostren una warning per fer-ho.

> ❓ **Els mètodes estàtics són més ràpids?**

Un poquet: no necessiten la referència a l'objecte. Però la diferència és tan xicoteta que en el 99,9% dels casos no la notaràs. No t'obsessiones amb la velocitat: preocupa't que el teu codi tinga sentit.

> ❓ **Puc posar-li `static` a tot i estalviar-me crear objectes?**

Pots, però aleshores no estàs fent POO: estàs fent "programació estàtica a la bruta". És com usar un tornavís per a clavar un clau: pots, però per a això existix el martell. Usa `static` per al que és de la classe, no per a tot.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** el truc per a no liar-te és preguntar sempre: *este mètode necessita saber de quin objecte parla?* Si la resposta és no, pot ser `static`.

**Exercici: la calculadora de la classe**

Funciona este codi? Si no, per què?

```java
public class Calculadora {
    private String marca;

    public static int sumar(int a, int b) {
        System.out.println(marca);  // Què passa ací?
        return a + b;
    }
}
```

<details>
<summary>🔄 Solució</summary>

**No compila.** El mètode `sumar()` és estàtic i intenta llegir `marca`, que és un atribut d'instància. Un mètode estàtic no té objecte, així que no sap quina `marca` imprimir. El compilador ho prohibix amb: *"non-static variable marca cannot be referenced from a static context"*. Si `marca` fóra `static` (compartida per la classe), sí que funcionaria.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Com es diu a un mètode estàtic?
2. Pot un mètode estàtic accedir a atributs d'instància?
3. Per què `main` és estàtic?
4. Què diferencia `Math.sqrt(9)` de `texto.length()`?

<details>
<summary>🔄 Respostes</summary>

1. Amb el nom de la classe: `UtilidadesMatematicas.sumar(5, 3)`. Sense crear objectes.
2. No: no té `this` i no sap de quin objecte parla.
3. Perquè quan arranca el programa no existix cap objecte encara: algú ha d'obrir la porta.
4. `Math.sqrt` és estàtic (es diu sobre la classe) i `length()` és d'instància (es diu sobre l'objecte `texto`).

</details>

---

## ✅ Resum en 3 frases

1. Els mètodes `static` es diuen amb la **classe**, sense `new`, i no poden tocar atributs d'instància ni usar `this`.
2. `Math` és la classe utilitària per excel·lència: tot estàtic, constructor privat.
3. `main` és estàtic perquè **és el primer a arribar**: quan arranca, no hi ha objectes encara.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Mètode estàtic | Mètode de la classe: `Clase.metodo()` |
> | Mètode d'instància | Mètode de l'objecte: `objeto.metodo()` |
> | `this` | Referència a l'objecte actual (no existix en estàtics) |
> | Classe utilitària | Només mètodes estàtics, sense objectes |
> | Context estàtic | "El món de la classe": sense objectes a la vista |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/08-visibilidad-encapsulacion-static) · **Anterior:** [05 · Atributs static](/ApuntesProgramacion/va/08-visibilidad-encapsulacion-static/05-atributos-static) · **Següent:** [07 · Constants de classe: static final](/ApuntesProgramacion/va/08-visibilidad-encapsulacion-static/07-constantes-static-final)