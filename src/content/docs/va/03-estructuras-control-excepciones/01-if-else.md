---
title: "01 — if, else if i else: el semàfor del codi"
description: Quan el teu programa aprén a decidir (i a prendre's els semàfors seriosament) 🚦
---

<p><small>Quan el teu programa aprén a decidir (i a prendre's els semàfors seriosament) 🚦</small></p>

> 🗺️ **Estàs en:** 🔀 **U03 · Estructures de Control i Excepcions** → 01 · if, else if i else

---

## 📬 La idea en una frase

> **`if` és el semàfor del codi: si la condició és `true`, deixa passar al bloc; si és `false`, el redirigix al `else` (o es queda esperant).**

En la U02 els teus programes jutjaven amb operadors relacionals i ternaris, però eixa justícia durava una línia. Ara arriba la justícia de debò: blocs sencers de codi que s'executen o no segons el que decidisca Java.

---

## 🚦 El semàfor: if i else

L'estructura bàsica és esta:

```java
if (condicio) {
    // codi que s'executa si condicio és true
} else {
    // codi que s'executa si condicio és false
}
```

```java
int edat = 17;

if (edat >= 18) {
    System.out.println("Pots votar.");
} else {
    System.out.println("Encara no pots votar.");
}
```

> ⚠️ **Advertència:** el `else` és **opcional**. Un `if` sol, sense `else`, és perfectament legal: si la condició falla, Java continua com si res.

---

## 🔀 else if: quan hi ha més de dos camins

I si el semàfor té tres colors? Ací entra el `else if`, que s'encadena:

```java
int nota = 7;

if (nota >= 9) {
    System.out.println("Excel·lent");
} else if (nota >= 7) {
    System.out.println("Notable");
} else if (nota >= 5) {
    System.out.println("Aprovat");
} else {
    System.out.println("Suspés");
}
```

Java avalua les condicions **en ordre, de dalt a baix**. Tan bon punt una dona `true`, s'executa el seu bloc i **es salta la resta**. El `else` final atrapa tots els que no entraren.

> 💡 **Detall pràctic:** l'ordre importa. Si començares per `nota >= 5`, la nota 7 entraria en l'"Aprovat" i mai no arribaria al "Notable". Ordena les condicions de la més exigent a la més permissiva.

---

## 🪆 If anidats: semàfors dins de semàfors

Un `if` pot viure dins d'un altre. Útil quan vols decidir *dins* d'una decisió:

```java
int edat = 20;
boolean teCarnet = true;

if (edat >= 18) {
    if (teCarnet) {
        System.out.println("Pots conduir.");
    } else {
        System.out.println("Et falta el carnet.");
    }
} else {
    System.out.println("Encara no pots conduir.");
}
```

> ⚠️ **Advertència:** no convertixques els teus programes en les Torres Kio. Més de 3 nivells d'anidament és senyal que estàs fent les coses estrany: en la U05 aprendràs a aplanar-ho.

---

## 🎚️ El ternari: el if de butxaca

Del punt 4 de la U02 el coneixes com "un if-else en una línia". Ací està el seu moment de glòria:

```java
int edat = 21;
String missatge = (edat >= 18) ? "Major d'edat" : "Menor d'edat";
System.out.println(missatge);
```

La regla d'or: ternari per a **assignar un valor** en una línia; `if`/`else` quan el bloc és llarg o fa més que assignar.

```java
// ✅ Bé: ternari per a triar valor
double preuFinal = (dia.equals("divendres")) ? preu * 0.9 : preu;

// ✅ Bé: if quan hi ha diverses línies per branca
if (saldo < 0) {
    System.out.println("Estàs en números rojos.");
    System.out.println("Revisa les teues despeses.");
} else {
    System.out.println("Saldo sa.");
}
```

---

## 🏫 Exemple guiat: la discoteca municipal

Anem a muntar el control d'accés d'una discoteca amb entrada reduïda:

```java
public class Discoteca {
    public static void main(String[] args) {
        int edat = 16;
        boolean acompanyat = true;

        if (edat >= 18) {
            System.out.println("Entra, major d'edat.");
        } else if (edat >= 16 && acompanyat) {
            System.out.println("Entra, però amb el teu acompanyant.");
        } else {
            System.out.println("Ho sent, torna en uns quants anys.");
        }
    }
}
```

Eixida:

```
Entra, però amb el teu acompanyant.
```

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** quan veges una cadena d'`if`/`else if`, pregunta't sempre: *l'ordre és de la condició més estricta a la més laxa?* Eixe és el 90% dels bugs d'esta unitat.

**Exercici: el semàfor confús**

Sense executar, calcula què imprimix este programa:

```java
public class Semafor {
    public static void main(String[] args) {
        int nota = 8;
        String resultat;

        if (nota >= 5) {
            resultat = "Aprovat";
        } else if (nota >= 7) {
            resultat = "Notable";
        } else if (nota >= 9) {
            resultat = "Excel·lent";
        } else {
            resultat = "Suspés";
        }

        System.out.println(resultat);
    }
}
```

<details>
<summary>🔄 Solució</summary>

Imprimix **`Aprovat`**. L'ordre està invertit: com que el primer `if` demana `nota >= 5` i 8 ho complix, Java entra ací i no mira les altres condicions, encara que 8 també compliria `nota >= 7` i `nota >= 9`. Les condicions correctes anirien de la més exigent (9) a la més permissiva (5). La lliçó: **el primer `if` que es complix guanya**, encara que no siga el que volies.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què fa Java si un `if` és `false` i no hi ha `else`?
2. En quin ordre has d'encadenar les condicions d'un `else if`?
3. Quan prefereixes un ternari a un `if`/`else`?
4. Què imprimiria `String s = 5 > 3 ? "A" : "B";`?

<details>
<summary>🔄 Respostes</summary>

1. Seguix executant la següent línia: l'`if` s'ignora en silenci.
2. De la més **exigent** a la més **permissiva**, perquè el primer `true` es queda amb la decisió.
3. Quan només vols **assignar un valor** en una línia i les dues branques són curtes.
4. **`"A"`** — perquè 5 > 3 és `true`.

</details>

---

## ✅ Resum en 3 frases

1. `if` / `else if` / `else` són el **semàfor** del codi: executen un bloc o un altre segons una condició booleana.
2. Les condicions s'avaluen **en ordre** i guanya la primera que done `true`, així que ordena de la més estricta a la més laxa.
3. El **ternari** resumeix un if-else de dos valors en una línia, però per a blocs llargs usa l'`if` clàssic.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Condició | Expressió booleana que decidix: `edat >= 18` |
> | Branca | Cada un dels camins possibles (`if`, `else`) |
> | Anidar | Ficar un `if` dins d'un altre `if` |
> | Ternari | `condició ? valor1 : valor2`, un if-else en una línia |
> | Curtcircuit | Java deixa d'avaluar quan la primera condició ja decidix |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/03-estructuras-control-excepciones) · **Anterior:** [Índex de la unitat](/ApuntesProgramacion/va/03-estructuras-control-excepciones) · **Següent:** [02 · switch](/ApuntesProgramacion/va/03-estructuras-control-excepciones/02-switch)
