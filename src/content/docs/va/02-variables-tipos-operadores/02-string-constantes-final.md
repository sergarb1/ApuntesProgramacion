---
title: 02 — String, constants i final
description: La caixa màgica del text i les caixes amb superglue 🔤
---

<p><small>La caixa màgica del text i les caixes amb superglue 🔤</small></p>

> 🗺️ **Estàs en:** 🔤 **U02 · Variables, Tipus i Operadors** → 02 · String, constants i final

---

## 📬 La idea en una frase

> **`String` és una classe (no un primitiu) que guarda text, és immutable com una foto, i `final` és el superglue que convertix qualsevol caixa en una constant que no es pot tocar.**

En el punt 1 vas vore les 8 caixes primitives. Però els programes també guarden text: noms, missatges, contrasenyes... Per a això existix `String`. I quan vulgues que un valor no canvie mai, el declares `final`. Anem a les dos.

---

## 🔤 String: la caixa màgica que no és una caixa

`String` **no és primitiu**: és una **classe**. Però es comporta tan natural que pareix primitiu. És com un amic que encaixa tan bé en el teu grup que jurares que és de la família.

```java
String saludo = "Hola, DAM";           // La forma normal
String nombre = new String("Ana");     // També es pot crear així (usa un constructor)
```

Fixa't en la segona línia: `new String(...)` és un **constructor**. Encara no estudies POO a fons (això arriba en la U06), però ja pots instanciar objectes de classes predefinides com `String`. La primera línia és una drecera que Java et dona per a no escriure `new String(...)` cada volta.

> 💡 **Detall pràctic:** `String` va amb **cometes dobles** `"..."`. Les cometes simples `'...'` són només per a `char`, un únic caràcter.

---

## 🧊 La immutabilitat: no toques, que es trenca

Els `String` són **immutables**: una volta creats, no es poden canviar. Quan fas això:

```java
String texto = "Hola";
texto = texto + " mundo";    // Java NO modifica "Hola"
```

...en realitat Java tira el `"Hola"` a la brossa i crea un `"Hola mundo"` nou. El text original seguix ahí, congelat, per sempre. És com si cada volta que volgueres posar un cartell nou hagueres de cremar l'anterior.

> ⚠️ **Advertència:** esta immutabilitat és la raó per la qual comparar `String` amb `==` és perillós. Comparar amb `==` pregunta *"són el mateix objecte?"*, no *"tenen el mateix text?"*. Per a comparar contingut usa `.equals()`.

---

## 🧲 `==` vs `.equals()`: la trampa clàssica

```java
String a = "Hello";
String b = "Hello";
String c = new String("Hello");

System.out.println(a == b);       // true
System.out.println(a == c);       // false
System.out.println(a.equals(c));  // true
```

Per què `a == b` dona `true` i `a == c` dona `false`, si els tres textos són "Hello"?

- `a` i `b` apunten al **mateix objecte** en el "pool de Strings": Java reutilitza literals iguals.
- `c` es va crear amb `new String(...)`, així que és un objecte **nou i distint**.
- `==` compara **referències** (són la mateixa caixa?); `.equals()` compara **contingut** (tenen el mateix dins?).

> ⚠️ **Advertència:** regla d'or: **els `String` sempre es comparen amb `.equals()`**. Si uses `==`, tard o d'hora et mossegarà en un examen.

---

## 🔒 Constants amb `final`: caixes amb superglue

Les constants es declaren amb `final`. Una volta que fiques alguna cosa ahí dins, no ix ni amb palanca:

```java
final double IVA = 0.21;
final int MAXIMO_INTENTOS = 3;
final String NOMBRE_APP = "Gestión DAM";

IVA = 0.10;  // ERROR de compilació: ¡no pots reasignar una constant!
```

Per convenció, les constants s'escriuen **EN_MAJÚSCULES_AMB_GUIONS_BAIXOS**, com si estigueren cridant "¡SOC IMMUTABLE!". Això li diu a qualsevol programador (inclòs el teu jo del futur) que eixe valor no s'ha de tocar.

> 💡 **Detall pràctic:** per què usar constants i no escriure el número directament? Perquè si l'IVA canvia demà, edites **una línia**, no les 50 on vas usar el 0.21. Això és el que s'anomena *mantindre el codi*.

---

## 🏫 Exemple guiat: la factura que no es pot tocar

Anem a muntar un mini-programa que calcula el preu final d'un producte amb IVA. La màgia: l'IVA és `final` i el nom de l'app també.

```java
public class Factura {
    public static void main(String[] args) {
        final double IVA = 0.21;
        final String NOMBRE_APP = "Factura Express";

        double precioBase = 50.0;
        double ivaAplicado = precioBase * IVA;
        double precioFinal = precioBase + ivaAplicado;

        System.out.println(NOMBRE_APP + " — precio base: " + precioBase + "€");
        System.out.println("IVA (" + (IVA * 100) + "%): " + ivaAplicado + "€");
        System.out.println("Total: " + precioFinal + "€");
    }
}
```

Eixida:

```
Factura Express — precio base: 50.0€
IVA (21.0%): 10.5€
Total: 60.5€
```

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** quan vages `==` amb dos `String`, sospita. Pregunta't primer: *estan comparant referències o contingut?*

**Exercici: Què imprimix este embolic de Strings?**

Sense executar, digues què imprimix exactament este codi:

```java
String x = "Java";
String y = "Java";
String z = new String("Java");
System.out.println(x == y);
System.out.println(x == z);
System.out.println(x.equals(z));
```

<details>
<summary>🔄 Solució</summary>

Imprimix `true`, `false` i `true`.

- `x == y` → **true**: els dos literals apunten al mateix objecte del pool de Strings.
- `x == z` → **false**: `z` és un objecte nou creat amb `new`, no compartix referència.
- `x.equals(z)` → **true**: el contingut és el mateix. `equals` compara text, no referències.

Clàssic d'examen. Si l'encertes a la primera, esta unitat la portes bé.

</details>

---

## 🎯 Mini-chequeig

1. És `String` un tipus primitiu? Per què?
2. Què significa que un `String` siga immutable?
3. Què passa si intentes reasignar una variable declarada com `final`?
4. Per què es comparen els `String` amb `.equals()` i no amb `==`?

<details>
<summary>🔄 Respostes</summary>

1. **No**, és una **classe**. Es comporta com primitiu però té mètodes i es crea amb `new` (encara que Java et dona la drecera dels literals).
2. Que una volta creat, el seu valor **no es pot modificar**: cada "canvi" crea un String nou.
3. Error de **compilació**. `final` és el superglue: el que entra, no ix.
4. Perquè `==` compara **referències** (mateix objecte?) i `.equals()` compara **contingut** (mateix text?), que és el que normalment vols.

</details>

---

## ✅ Resum en 3 frases

1. `String` és una **classe** que guarda text entre cometes dobles i és **immutable**: cada canvi crea un objecte nou.
2. Els `String` es comparen amb **`.equals()`**, mai amb `==` (que només compara referències i et dona sorpreses).
3. `final` convertix una variable en **constant** (per convenció, en MAJÚSCULES), i el compilador s'enfada si intentes canviar-la.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `String` | Classe de Java que guarda cadenes de text |
> | Immutable | Que no es pot modificar una volta creat |
> | `final` | Modificador que convertix una variable en constant |
> | Constructor | El mecanisme que crea un objecte (`new String(...)`) |
> | Pool de Strings | Zona on Java reutilitza literals iguals |
> | `.equals()` | Mètode que compara el contingut de dos objectes |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/02-variables-tipos-operadores) · **Anterior:** [01 · Variables i tipus primitius](/ApuntesProgramacion/va/02-variables-tipos-operadores/01-variables-tipos-primitivos) · **Següent:** [03 · Operadors aritmètics](/ApuntesProgramacion/va/02-variables-tipos-operadores/03-operadores-aritmeticos)