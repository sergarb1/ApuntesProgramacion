---
title: 05 — Casting i conversions
description: Apreta que cap, amb pèrdues i llàgrimes si no tries bé 🔄
---

<p><small>Apreta que cap, amb pèrdues i llàgrimes si no tries bé 🔄</small></p>

> 🗺️ **Estàs en:** 🔤 **U02 · Variables, Tipus i Operadors** → 05 · Casting i conversions

---

## 📬 La idea en una frase

> **El casting convertix un valor d'un tipus a un altre: la conversió implícita (widening) la fa Java sol i sense pèrdues, mentre que l'explícita (narrowing) la forces tu amb `(tipo)` i pots perdre dades pel camí.**

Al magatzem de la memòria tens caixes de tots els tamanys. A voltes necessites ficar el contingut d'una caixa gran en una de menuda... i això, o ho fas amb compte, o perds coses pel camí. Benvingut a l'art d'apretar.

---

## 🪜 Conversió implícita (widening): mudar-se a una caixa més gran

Quan el destí és una caixa **més gran**, Java ho fa sol, sense preguntar. És com canviar d'un pis a una mansió: et mudes i no perds res. Això s'anomena *widening* (eixamplar):

```java
int num = 100;
long numLong = num;        // Cap de sobres, sense pèrdues
double numDouble = num;    // 100 → 100.0, també sense problemes
```

La cadena natural d'eixamplament entre tipus numèrics és:

```
byte → short → int → long → float → double
```

Qualsevol tipus pot passar al que està a la seua dreta sense que es perda ni un bit. Java somriu i et deixa.

---

## 📉 Conversió explícita (narrowing): la maleta XXL en un Smart

Quan el destí és una caixa **més menuda**, Java es nega. Has d'empènyer a la força amb un casting explícit: poses el `(tipo)` davant i reses:

```java
double precio = 19.99;
int entero = (int) precio;    // Apretes 19.99 en un int
System.out.println(entero);   // 19 — els cèntims desapareixen en l'oblit
```

Això s'anomena *narrowing* (estrényer). Java t'obliga a escriure el `(tipo)` perquè és perillós: estàs dient "confia en mi, sé el que faig". I si t'equivoques, les dades es perden en silenci.

> 💡 **Detall pràctic:** el casting sobre un `double` **trunca**, no redoniga. `(int) 19.99` dona `19` i `(int) 19.5` també dona `19`. Si vols redonir, usa `Math.round()` (ho veuràs en el punt 7).

---

## 🪓 El truncament: el cèntim oblidat

L'exemple del preu és l'advertència clàssica:

```java
double precio = 9.99;
int precioEntero = (int) precio;
System.out.println(precioEntero);   // 9 — t'acaben de llevar 0.99€
```

No és redonir: és **tallar amb destral**. Java tira la part decimal sense mirar si era 0.1 o 0.9.

> ⚠️ **Advertència:** abans d'estrényer una caixa, pregunta't sempre: *cap el valor?* Si el número és major que el màxim de la caixa destí, no només perdràs decimals: el valor es **desbordarà** a una cosa completament absurda.

---

## 💥 El desbordament: quan apretes de més

Què passa si intentes ficar un elefant (300) en una caixa de llumins (byte, màxim 127)?

```java
int grande = 300;
byte pequeno = (byte) grande;
System.out.println(pequeno);   // 44 — ¡quaranta-quatre!?
```

D'on ix el 44? En binari, 300 és `100101100`. Un `byte` només guarda 8 bits, així que es truncaren els sobrants i es queda amb `00101100`, que és... 44. És com ficar un elefant en un Mini Cooper i que isca un gos salchicha: el resultat tècnicament és un animal, però no el que vas ficar.

> ⚠️ **Advertència:** el desbordament no dona error. Java no t'avisa. El programa seguix corrent amb un valor absurd. Per això el casting explícit és responsabilitat teua: comprova sempre que el valor cap.

---

## 🏫 Exemple guiat: el guarda del magatzem

Este mini-programa recorre tota la cadena de conversions, perquè vages quan Java t'acompanya i quan t'obliga a firmar:

```java
public class CadenaDeCajas {
    public static void main(String[] args) {
        int a = 10;
        double b = a;            // implícita: int → double, sense llàgrimes
        int c = (int) b;         // explícita: double → int, forçada
        byte d = (byte) c;       // explícita: int → byte, cap de sobres

        System.out.println(b);   // 10.0
        System.out.println(c);   // 10
        System.out.println(d);   // 10
    }
}
```

I ara la part dolenta:

```java
public class Perdidas {
    public static void main(String[] args) {
        double nota = 9.9;
        int notaEntera = (int) nota;    // 9 — adéu, dècimes
        int enorme = 400;
        byte pequeno = (byte) enorme;   // desbordament silenciós
        System.out.println(notaEntera); // 9
        System.out.println(pequeno);    // -112 (¡ni tan sols és 400!)
    }
}
```

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** el casting amb `(tipo)` pot truncar i desbordar. Comprova sempre si el valor cap abans de forçar-lo.

**Exercici: seguix el guarda**

Sense executar, determina què imprimix este programa:

```java
int a = 10;
double b = a;
int c = (int) b;
byte d = (byte) c;
System.out.println(d);

int grande = 300;
byte pequeno = (byte) grande;
System.out.println(pequeno);
```

<details>
<summary>🔄 Solució</summary>

Imprimix `10` i `44`.

- El primer bloc és una cadena de conversions sense pèrdua: `10` → `10.0` → `10` → `10`. Imprimix **10**.
- El segon és el desbordament clàssic: 300 no cap en un `byte` (tope 127), es truncaren els bits sobrants i queda **44**. Com ficar un elefant en un Mini i que isca un gos salchicha.

</details>

---

## 🎯 Mini-chequeig

1. Per què `long x = 100000;` compila sense casting i `int y = (int) 100000.5;` sí que necessita el `(int)`?
2. Quant val `(int) 7.99`? I `(int) 7.1`?
3. Què passa si convertixes `300` a `byte`?
4. És el truncament el mateix que redonir?

<details>
<summary>🔄 Respostes</summary>

1. Perquè `100000` (un `int`) cap en un `long` sense pèrdues: és conversió **implícita**. Ficar un `double` amb decimals en un `int` és **estrényer** (narrowing), i Java t'obliga a escriure-ho amb `(int)`.
2. `(int) 7.99` → **7** i `(int) 7.1` → **7**. Trunca, no redoniga: la part decimal es tira sencera.
3. Es **desborda** silenciosament i val **44**, sense error ni avís.
4. **No.** El truncament talla la part decimal sempre; redonir puja o baixa segons el valor.

</details>

---

## ✅ Resum en 3 frases

1. La conversió **implícita** (widening) cap a caixes més grans la fa Java sol i sense pèrdues.
2. La conversió **explícita** (narrowing) la forces amb `(tipo)` i pot **truncar** els decimals o **desbordar** el valor.
3. Abans d'estrényer, comprova sempre que el valor cap: Java no t'avisarà de les pèrdues.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Casting | Convertir un valor d'un tipus a un altre |
> | Widening | Eixamplar: a caixa més gran, sense pèrdues, automàtic |
> | Narrowing | Estrényer: a caixa més menuda, amb `(tipo)` i possibles pèrdues |
> | Truncament | Tallar la part decimal, sense redonir |
> | Desbordament | El valor no cap i es convertix en una cosa absurda en silenci |
> | `(int)` | El casting que força un valor decimal a enter |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/02-variables-tipos-operadores) · **Anterior:** [04 · Relacionals, lògics i ternari](/ApuntesProgramacion/va/02-variables-tipos-operadores/04-operadores-relacionales-logicos) · **Següent:** [06 · Scanner: llegir pel teclat](/ApuntesProgramacion/va/02-variables-tipos-operadores/06-scanner-entrada-teclado)