---
title: "04 — Getters i setters"
description: "El porter de la discoteca: llegir i modificar atributs privats amb nom, ordre i validació 🚪"
---

<p><small>El porter de la discoteca: llegir i modificar atributs privats amb nom, ordre i validació 🚪</small></p>

> 🗺️ **Estàs en:** 🔒 **U08 · Visibilitat, Encapsulació i Static** → 04 · Getters i setters

---

## 📬 La idea en una frase

> **Un getter llig un atribut privat i un setter el modifica, i tots dos tenen noms amb una convenció estricta. Són els porters de la teua discoteca: deixen entrar a qui volen i tiren els que van borratxos.**

Els atributs són `private`, però llavors... com llig el món la teua classe? Com canvia l'edat d'un `Estudiante`? Ací entren els **getters** (per a llegir) i els **setters** (per a escriure). I no, no valen noms inventats: Java i els seus frameworks esperen una convenció.

---

## 🏷️ La convenció de noms (memoritza-la)

| Tipus d'atribut | Getter | Setter |
|---|---|---|
| `String nombre` | `getNombre()` | `setNombre(String n)` |
| `boolean activo` | `isActivo()` | `setActivo(boolean a)` |
| `int cantidad` | `getCantidad()` | `setCantidad(int c)` |

Regles d'or:

- El getter es diu `get` + atribut en majúscula inicial. Amb `boolean`, s'usa `is` en comptes de `get`.
- El setter es diu `set` + atribut en majúscula inicial i rep el valor com a paràmetre.
- Retornen/reben **exactament el tipus de l'atribut**.

```java
public class Estudiante {
    private String nombre;
    private boolean matriculado;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean isMatriculado() {
        return matriculado;
    }

    public void setMatriculado(boolean matriculado) {
        this.matriculado = matriculado;
    }
}
```

> 📝 **Nota:** `this` (el punt 5 de la U07) resol el lío que paràmetre i atribut es diguen igual. `this.nombre` és l'atribut; `nombre` a seques és el paràmetre. Sense `this`, t'assignaries el paràmetre a si mateix i l'atribut es quedaria amb el seu valor per defecte.

---

## 🚪 El setter com a porter: validar

Un setter no és només "escriure". És la **frontera on valides**. Exemple clàssic:

```java
public class Termometro {
    private double temperatura;

    public double getTemperatura() {
        return temperatura;
    }

    public void setTemperatura(double temperatura) {
        if (temperatura < -273.15) {
            System.out.println("Impossible: això està per davall del zero absolut.");
        } else {
            this.temperatura = temperatura;
        }
    }
}
```

Si algú intenta `termometro.setTemperatura(-500)`, el setter el frena: el termòmetre mai no mostrarà una temperatura impossible. Sense el setter, l'atribut `public` hauria acceptat eixe -500 sense dir res.

> ⚠️ **Advertència:** un setter que no valida és un porter adormit: deixa passar a qualsevol. Si el teu setter accepta edats negatives, en la pràctica és com si l'atribut fóra `public`.

---

## 🔒 Getter sense setter: atributs immutables

I si vols que alguna cosa es lligca però **no es puga canviar**? Doncs poses getter i t'estalvies el setter. Punt. Així aconseguixes atributs de només lectura:

```java
public class Tarjeta {
    private String numero;
    private int pin;

    public Tarjeta(String numero, int pin) {
        this.numero = numero;
        this.pin = pin;
    }

    public String getNumero() {
        return numero;
    }

    public int getPin() {
        return pin;
    }
    // Sense setters: el número i el pin es fixen en nàixer i mai no canvien.
}
```

> 💡 **Detall pràctic:** els atributs que es fixen en el constructor i no han de canviar (un DNI, un id, un pin) només porten getter. És la forma elegant de dir "això és de només lectura".

---

## 🤷 No hi ha preguntes tontes

> ❓ **Per què tant de rotllo amb els noms? No puc dir als meus mètodes `leerEdad()` i `ponerEdad()`?**

Pots, i funcionarien. Però la convenció `getX()` / `setX()` és la que esperen els frameworks (i, de pas, els examinadors). Quan en la U14 veges com es serialitzen objectes a JSON, entendràs per què dir-se de la manera estàndard estalvia maldecaps.

> ❓ **El setter sempre ha de validar amb `println`?**

No. Una altra opció molt comuna és **llançar una excepció** (`IllegalArgumentException`) quan el valor és invàlid, perquè el programa que crida s'assabente del problema. Això ho veuràs bé en la U03 amb `try`/`catch` i en els butlletins avançats.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** pensa en el setter com un porter de discoteca: no deixa entrar els borratxos (valors invàlids). Un bon setter convertix l'error d'un usuari (o del teu futur jo) en una cosa controlada, no en un objecte trencat.

**Exercici: l'edat vigilada**

Escriu tu (mentalment, o en paper) una classe `Persona` amb:

- Atribut privat `int edad`.
- Constructor que rep `edad`.
- Getter `getEdad()`.
- Setter `setEdad(int edad)` que **rebutge** edats negatives i majors de 120.

Què imprimiria este codi?

```java
Persona p = new Persona(25);
p.setEdad(-5);
System.out.println(p.getEdad());
```

<details>
<summary>🔄 Solució</summary>

Imprimiria **`25`**: el setter rebutja `-5` i l'atribut es queda amb el valor que ja tenia. Dissenyar bé la frontera fa que els errors no entren. Un setter així:

```java
public void setEdad(int edad) {
    if (edad >= 0 && edad <= 120) {
        this.edad = edad;
    } else {
        System.out.println("Edat impossible, es manté l'anterior.");
    }
}
```

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Com es diu el getter de `boolean activo`?
2. Per a què servix validar en un setter?
3. Quan uses un atribut només amb getter i sense setter?
4. Què fa `this` en `this.nombre = nombre`?

<details>
<summary>🔄 Respostes</summary>

1. `isActivo()`: amb `boolean`, la convenció usa `is` en comptes de `get`.
2. Perquè l'objecte mai no accepte valors impossibles: la validació ocorre a la frontera, no en el codi de fora.
3. Quan l'atribut es fixa en nàixer (constructor) i no ha de canviar: DNI, pin, id... Només lectura.
4. Desambigua: `this.nombre` és l'atribut de la classe i `nombre` a seques és el paràmetre del mètode.

</details>

---

## ✅ Resum en 3 frases

1. **Getter** llig un atribut privat; **setter** el modifica, amb noms `getX()`/`setX()` (i `isX()` per a booleans).
2. El setter és la **frontera de validació**: rebutja valors impossibles perquè l'objecte mai no es trenque.
3. **Sense setter** aconsegueixes atributs de només lectura, perfectes per a dades que no han de canviar.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Getter | Mètode que retorna el valor d'un atribut (`getEdad()`) |
> | Setter | Mètode que modifica un atribut, validant (`setEdad(int)`) |
> | `is` | Prefix del getter quan l'atribut és `boolean` |
> | Només lectura | Atribut amb getter però sense setter |
> | `this` | Referència a l'objecte actual, desambigua atribut vs paràmetre |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/08-visibilidad-encapsulacion-static) · **Anterior:** [03 · Encapsulació: el pilar de la POO](/ApuntesProgramacion/va/08-visibilidad-encapsulacion-static/03-encapsulacion) · **Següent:** [05 · Atributs static](/ApuntesProgramacion/va/08-visibilidad-encapsulacion-static/05-atributos-static)