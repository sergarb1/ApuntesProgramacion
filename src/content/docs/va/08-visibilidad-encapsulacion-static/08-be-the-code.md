---
title: "08 — Be the Code: encapsula la teua classe"
description: "El repte guiat: convertix una classe sense blindar en una ben encapsulada amb getters i setters 🔨"
---

<p><small>El repte guiat: convertix una classe sense blindar en una ben encapsulada amb getters i setters 🔨</small></p>

> 🗺️ **Estàs en:** 🔒 **U08 · Visibilitat, Encapsulació i Static** → 08 · Be the Code: encapsula la teua classe

---

## 📬 La idea en una frase

> **Ací no aprenem res de nou: posem en pràctica tot el dels punts 1 al 7 convertint, pas a pas, una classe que és una porta oberta en una classe amb cadenat, porter i alarma.**

És l'hora de ser tu el codi. La U07 ja et va ensenyar a dissenyar una classe; ara toca el treball fi: **blinda-la**. Agafem una classe que viola totes les regles i la transformem en una classe professional.

---

## 🏚️ El punt de partida: la classe del caos

Este és el codi que "funciona" però hauria de fer-te vergonya aliena:

```java
public class CuentaBancaria {
    public double saldo;
    public String titular;
    public int numeroIngresos;

    public CuentaBancaria(String titular, double saldoInicial) {
        saldo = saldoInicial;
        numeroIngresos = 0;
    }

    public void ingresar(double cantidad) {
        saldo = saldo + cantidad;
        numeroIngresos++;
    }
}
```

Què falla? Tot: atributs `public`, sense validació, sense getters... Anem a convertir-lo en una classe que respira seguretat. **Pas a pas, sense saltar-te'n cap.**

---

## 🧰 Pas 1: atributs privats

Regla número u de la casa: els atributs van amb `private`. Sense excepcions.

```java
public class CuentaBancaria {
    private double saldo;
    private String titular;
    private int numeroIngresos;
    ...
}
```

Si algú intenta `cuenta.saldo = 1000` des de fora, el compilador li diu que no. Però... i si algú legítimament vol saber el saldo o canviar el titular? Això ho resolen els passos 2 i 3.

---

## 🧰 Pas 2: getters per a llegir

Un getter retorna el valor de l'atribut, seguint la convenció `get` + nom:

```java
public double getSaldo() {
    return saldo;
}

public String getTitular() {
    return titular;
}

public int getNumeroIngresos() {
    return numeroIngresos;
}
```

Ara el món pot *llegir* el saldo, però no *tocar-lo*.

> 💡 **Detall pràctic:** fixa't que `numeroIngresos` té getter però no setter: ningú no l'ha de posar a mà, només `ingresar()` l'incrementa. Només lectura, com ha de ser.

---

## 🧰 Pas 3: setter per al que es pot canviar

El titular sí que pot canviar (un banc actualitza titulars, què li farem). Afegim el setter amb la seua validació:

```java
public void setTitular(String titular) {
    if (titular != null && !titular.trim().isEmpty()) {
        this.titular = titular;
    } else {
        System.out.println("Titular invàlid.");
    }
}
```

Fixa't en l'ordre del `if`: primer la condició de validesa, i dins del `else` l'avís. El `this` desambigua (paràmetre vs atribut, del punt 5 de la U07).

---

## 🧰 Pas 4: validar també en els mètodes

Un setter és un porter, però els mètodes `ingresar()` també han de ser-ho. Ara mateix el codi accepta ingressos negatius (un "ingrés" de -50 euros!). Ho arreglem:

```java
public void ingresar(double cantidad) {
    if (cantidad > 0) {
        saldo = saldo + cantidad;
        numeroIngresos++;
    } else {
        System.out.println("No es poden ingressar quantitats negatives.");
    }
}
```

L'estat del compte ja no pot ser impossible: ni saldo negatiu per la via ràpida ni ingressos fantasma.

---

## 🧰 Pas 5: el toc final, constants

Podem rematar amb una constant de classe. Imaginem que el banc només permet un màxim d'ingressos al dia per l'app:

```java
public class CuentaBancaria {
    public static final int MAX_INGRESOS_DIA = 10;
    private double saldo;
    private String titular;
    private int numeroIngresos;
    ...
}
```

I en `ingresar()` afegim la comprovació:

```java
if (numeroIngresos >= MAX_INGRESOS_DIA) {
    System.out.println("Límit diari assolit.");
    return;
}
```

---

## 🏆 La classe final (compara-la amb la del caos)

```java
public class CuentaBancaria {
    public static final int MAX_INGRESOS_DIA = 10;

    private double saldo;
    private String titular;
    private int numeroIngresos;

    public CuentaBancaria(String titular, double saldoInicial) {
        setTitular(titular);
        saldo = saldoInicial;
        numeroIngresos = 0;
    }

    public double getSaldo() {
        return saldo;
    }

    public String getTitular() {
        return titular;
    }

    public int getNumeroIngresos() {
        return numeroIngresos;
    }

    public void setTitular(String titular) {
        if (titular != null && !titular.trim().isEmpty()) {
            this.titular = titular;
        } else {
            System.out.println("Titular invàlid.");
        }
    }

    public void ingresar(double cantidad) {
        if (numeroIngresos >= MAX_INGRESOS_DIA) {
            System.out.println("Límit diari assolit.");
            return;
        }
        if (cantidad > 0) {
            saldo = saldo + cantidad;
            numeroIngresos++;
        } else {
            System.out.println("No es poden ingressar quantitats negatives.");
        }
    }
}
```

Del caos a la fortalesa: `private` en tot, getters, setters amb validació, mètodes porters i una constant. **Això és encapsular.**

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Per què `numeroIngresos` no té setter?
2. Què fa `setTitular()` si li passes un text buit?
3. Quants passos cal seguir per a blindar la classe?
4. Per a què servix la constant `MAX_INGRESOS_DIA`?

<details>
<summary>🔄 Respostes</summary>

1. Perquè ningú no l'ha de fixar a mà: només `ingresar()` l'incrementa. Getter per a llegir, res per a escriure.
2. El rebutja i mostra "Titular invàlid.", deixant l'atribut com estava.
3. Cinc: atributs privats, getters, setter, validació en mètodes i constants. Tots importen.
4. Per a posar un límit global al negoci en un únic lloc, llegible i a prova de "números màgics".

</details>

---

## ✅ Resum en 3 frases

1. Encapsular una classe és un **procés en passos**: `private`, getters, setters, validació i constants.
2. Cada setter i cada mètode són una **frontera** que decidix què entra i què ix de l'objecte.
3. Al final tens una classe que **es protegeix sola**: l'error del món exterior no pot trencar-la.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Refactoritzar | Millorar el codi sense canviar el seu comportament |
> | Blindar | Convertir atributs `public` en `private` amb control d'accés |
> | Frontera | Mètode públic que valida el que entra |
> | Només lectura | Getter sense setter: es llig però no s'escriu |
> | Número màgic | Literal sense nom: es convertix en constant |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/08-visibilidad-encapsulacion-static) · **Anterior:** [07 · Constants de classe: static final](/ApuntesProgramacion/va/08-visibilidad-encapsulacion-static/07-constantes-static-final) · **Següent:** [09 · Repàs interactiu](/ApuntesProgramacion/va/08-visibilidad-encapsulacion-static/09-repaso-interactivo)