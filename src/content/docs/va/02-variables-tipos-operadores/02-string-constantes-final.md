---
title: 02 â€” String, constants i final
description: La caixa mÃ gica del text i les caixes amb superglue ðŸ”¤
---

<p><small>La caixa mÃ gica del text i les caixes amb superglue ðŸ”¤</small></p>

> ðŸ—ºï¸ **EstÃ s en:** ðŸ”¤ **U02 Â· Variables, Tipus i Operadors** â†’ 02 Â· String, constants i final

---

## ðŸ“¬ La idea en una frase

> **`String` Ã©s una classe (no un primitiu) que guarda text, Ã©s immutable com una foto, i `final` Ã©s el superglue que convertix qualsevol caixa en una constant que no es pot tocar.**

En el punt 1 vas vore les 8 caixes primitives. PerÃ² els programes tambÃ© guarden text: noms, missatges, contrasenyes... Per a aixÃ² existix `String`. I quan vulgues que un valor no canvie mai, el declares `final`. Anem a les dos.

---

## ðŸ”¤ String: la caixa mÃ gica que no Ã©s una caixa

`String` **no Ã©s primitiu**: Ã©s una **classe**. PerÃ² es comporta tan natural que pareix primitiu. Ã‰s com un amic que encaixa tan bÃ© en el teu grup que jurares que Ã©s de la famÃ­lia.

```java
String saludo = "Hola, DAM";           // La forma normal
String nombre = new String("Ana");     // TambÃ© es pot crear aixÃ­ (usa un constructor)
```

Fixa't en la segona lÃ­nia: `new String(...)` Ã©s un **constructor**. Encara no estudies POO a fons (aixÃ² arriba en la U06), perÃ² ja pots instanciar objectes de classes predefinides com `String`. La primera lÃ­nia Ã©s una drecera que Java et dona per a no escriure `new String(...)` cada volta.

> ðŸ’¡ **Detall prÃ ctic:** `String` va amb **cometes dobles** `"..."`. Les cometes simples `'...'` sÃ³n nomÃ©s per a `char`, un Ãºnic carÃ cter.

---

## ðŸ§Š La immutabilitat: no toques, que es trenca

Els `String` sÃ³n **immutables**: una volta creats, no es poden canviar. Quan fas aixÃ²:

```java
String texto = "Hola";
texto = texto + " mundo";    // Java NO modifica "Hola"
```

...en realitat Java tira el `"Hola"` a la brossa i crea un `"Hola mundo"` nou. El text original seguix ahÃ­, congelat, per sempre. Ã‰s com si cada volta que volgueres posar un cartell nou hagueres de cremar l'anterior.

> âš ï¸ **AdvertÃ¨ncia:** esta immutabilitat Ã©s la raÃ³ per la qual comparar `String` amb `==` Ã©s perillÃ³s. Comparar amb `==` pregunta *"sÃ³n el mateix objecte?"*, no *"tenen el mateix text?"*. Per a comparar contingut usa `.equals()`.

---

## ðŸ§² `==` vs `.equals()`: la trampa clÃ ssica

```java
String a = "Hello";
String b = "Hello";
String c = new String("Hello");

System.out.println(a == b);       // true
System.out.println(a == c);       // false
System.out.println(a.equals(c));  // true
```

Per quÃ¨ `a == b` dona `true` i `a == c` dona `false`, si els tres textos sÃ³n "Hello"?

- `a` i `b` apunten al **mateix objecte** en el "pool de Strings": Java reutilitza literals iguals.
- `c` es va crear amb `new String(...)`, aixÃ­ que Ã©s un objecte **nou i distint**.
- `==` compara **referÃ¨ncies** (sÃ³n la mateixa caixa?); `.equals()` compara **contingut** (tenen el mateix dins?).

> âš ï¸ **AdvertÃ¨ncia:** regla d'or: **els `String` sempre es comparen amb `.equals()`**. Si uses `==`, tard o d'hora et mossegarÃ  en un examen.

---

## ðŸ”’ Constants amb `final`: caixes amb superglue

Les constants es declaren amb `final`. Una volta que fiques alguna cosa ahÃ­ dins, no ix ni amb palanca:

```java
final double IVA = 0.21;
final int MAXIMO_INTENTOS = 3;
final String NOMBRE_APP = "GestiÃ³n DAM";

IVA = 0.10;  // ERROR de compilaciÃ³: Â¡no pots reasignar una constant!
```

Per convenciÃ³, les constants s'escriuen **EN_MAJÃšSCULES_AMB_GUIONS_BAIXOS**, com si estigueren cridant "Â¡SOC IMMUTABLE!". AixÃ² li diu a qualsevol programador (inclÃ²s el teu jo del futur) que eixe valor no s'ha de tocar.

> ðŸ’¡ **Detall prÃ ctic:** per quÃ¨ usar constants i no escriure el nÃºmero directament? PerquÃ¨ si l'IVA canvia demÃ , edites **una lÃ­nia**, no les 50 on vas usar el 0.21. AixÃ² Ã©s el que s'anomena *mantindre el codi*.

---

## ðŸ« Exemple guiat: la factura que no es pot tocar

Anem a muntar un mini-programa que calcula el preu final d'un producte amb IVA. La mÃ gia: l'IVA Ã©s `final` i el nom de l'app tambÃ©.

```java
public class Factura {
    public static void main(String[] args) {
        final double IVA = 0.21;
        final String NOMBRE_APP = "Factura Express";

        double precioBase = 50.0;
        double ivaAplicado = precioBase * IVA;
        double precioFinal = precioBase + ivaAplicado;

        System.out.println(NOMBRE_APP + " â€” precio base: " + precioBase + "â‚¬");
        System.out.println("IVA (" + (IVA * 100) + "%): " + ivaAplicado + "â‚¬");
        System.out.println("Total: " + precioFinal + "â‚¬");
    }
}
```

Eixida:

```
Factura Express â€” precio base: 50.0â‚¬
IVA (21.0%): 10.5â‚¬
Total: 60.5â‚¬
```

---

## â­ SÃ© el CÃ³digo, my friend...

> ðŸ•¶ï¸ **Don Tip:** quan vages `==` amb dos `String`, sospita. Pregunta't primer: *estan comparant referÃ¨ncies o contingut?*

**Exercici: QuÃ¨ imprimix este embolic de Strings?**

Sense executar, digues quÃ¨ imprimix exactament este codi:

```java
String x = "Java";
String y = "Java";
String z = new String("Java");
System.out.println(x == y);
System.out.println(x == z);
System.out.println(x.equals(z));
```

<details>
<summary>ðŸ”„ SoluciÃ³</summary>

Imprimix `true`, `false` i `true`.

- `x == y` â†’ **true**: els dos literals apunten al mateix objecte del pool de Strings.
- `x == z` â†’ **false**: `z` Ã©s un objecte nou creat amb `new`, no compartix referÃ¨ncia.
- `x.equals(z)` â†’ **true**: el contingut Ã©s el mateix. `equals` compara text, no referÃ¨ncies.

ClÃ ssic d'examen. Si l'encertes a la primera, esta unitat la portes bÃ©.

</details>

---

## ðŸŽ¯ Mini-chequeig

1. Ã‰s `String` un tipus primitiu? Per quÃ¨?
2. QuÃ¨ significa que un `String` siga immutable?
3. QuÃ¨ passa si intentes reasignar una variable declarada com `final`?
4. Per quÃ¨ es comparen els `String` amb `.equals()` i no amb `==`?

<details>
<summary>ðŸ”„ Respostes</summary>

1. **No**, Ã©s una **classe**. Es comporta com primitiu perÃ² tÃ© mÃ¨todes i es crea amb `new` (encara que Java et dona la drecera dels literals).
2. Que una volta creat, el seu valor **no es pot modificar**: cada "canvi" crea un String nou.
3. Error de **compilaciÃ³**. `final` Ã©s el superglue: el que entra, no ix.
4. PerquÃ¨ `==` compara **referÃ¨ncies** (mateix objecte?) i `.equals()` compara **contingut** (mateix text?), que Ã©s el que normalment vols.

</details>

---

## âœ… Resum en 3 frases

1. `String` Ã©s una **classe** que guarda text entre cometes dobles i Ã©s **immutable**: cada canvi crea un objecte nou.
2. Els `String` es comparen amb **`.equals()`**, mai amb `==` (que nomÃ©s compara referÃ¨ncies i et dona sorpreses).
3. `final` convertix una variable en **constant** (per convenciÃ³, en MAJÃšSCULES), i el compilador s'enfada si intentes canviar-la.

> ðŸ› **Vocabulari rÃ pid**
>
> | Terme | Idea general |
> |---|---|
> | `String` | Classe de Java que guarda cadenes de text |
> | Immutable | Que no es pot modificar una volta creat |
> | `final` | Modificador que convertix una variable en constant |
> | Constructor | El mecanisme que crea un objecte (`new String(...)`) |
> | Pool de Strings | Zona on Java reutilitza literals iguals |
> | `.equals()` | MÃ¨tode que compara el contingut de dos objectes |

ðŸ“š [Tornar a l'Ã­ndex de la unitat](/ApuntesProgramacion/va/02-variables-tipos-operadores) Â· **Anterior:** [01 Â· Variables i tipus primitius](/ApuntesProgramacion/va/02-variables-tipos-operadores/01-variables-tipos-primitivos) Â· **SegÃ¼ent:** [03 Â· Operadors aritmÃ¨tics](/ApuntesProgramacion/va/02-variables-tipos-operadores/03-operadores-aritmeticos)