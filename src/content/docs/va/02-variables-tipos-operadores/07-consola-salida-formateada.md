---
title: "07 · Consola: eixida amb format i errors d'entrada"
description: "printf, String.format, NumberFormat i les fallades clàssiques del Scanner (i com no morir en l'intent) 🖨️"
---

<p><small>printf, String.format, NumberFormat i les fallades clàssiques del Scanner (i com no morir en l'intent) 🖨️</small></p>

> 🗺️ **Estàs en:** 🔤 **U02 · Variables, Tipus i Operadors** → 07 · Consola: eixida amb format i errors d'entrada

---

## 📬 La idea en una frase

> **`printf` i `String.format` donen format a la teua eixida (decimals, amplària, alineació) en una línia, i conéixer els errors típics del `Scanner` t'estalvia els bugs més odiats de la unitat.**

En el punt 6 vas aprendre a llegir del teclat. Ara donaràs bellesa al que escrius i, de passada, blindaràs els teus programes contra les fallades més típiques d'entrada. Amb això tanques el cercle de la consola.

---

## 🖨️ Eixida amb format: `System.out.printf`

`System.out.println` imprimeix tal qual. Per a controlar **com** es veu (decimals, amplària, farcit) tens `printf` (print formatted):

```java
String nom = "Ana";
int edat = 20;
double nota = 9.5;

System.out.printf("Nom: %s, Edat: %d, Nota: %.2f%n", nom, edat, nota);
// Nom: Ana, Edat: 20, Nota: 9,50
```

Cada `%alguna_cosa` és un **forat** que s'ompli amb el valor que li segueix, en ordre. Els especificadors bàsics:

| Especificador | Tipus | Exemple |
|---|---|---|
| `%s` | String | `"Hola %s"` → `"Hola Mario"` |
| `%d` | Enter | `"Edat: %d"` → `"Edat: 25"` |
| `%f` | Decimal | `"%.2f"` → `"19,99"` |
| `%c` | Caràcter | `"Inicial: %c"` |
| `%n` | Salt de línia | (independent del sistema) |
| `%b` | boolean | `"%b"` → `true` |

> 💡 **Consell:** `%n` per als salts de línia en `printf` (no `\n`): funciona igual a Windows, Linux i Mac. El `\n` també val, però `%n` és l'opció "oficial".

### Controlar els decimals i l'amplària

```java
double pi = Math.PI;
System.out.printf("2 decimals: %.2f%n", pi);   // 3,14
System.out.printf("4 decimals: %.4f%n", pi);   // 3,1416
System.out.printf("Amplària 10: %10.2f%n", pi); //       3,14
System.out.printf("Esquerra: %-10.2f%n", pi);  // 3,14
```

- `%.2f` → dos decimals.
- `%10.2f` → amplària mínima de 10 caràcters, alineat a la dreta.
- `%-10.2f` → el guió l'alinea a l'esquerra.

> ⚠️ **Advertència:** els decimals de `printf` utilitzen la **configuració regional** del teu sistema. En un ordinador amb locale espanyol, `%.2f` escriu `3,14` (coma); en un amb locale anglés, `3.14` (punt). No t'espantes si el resultat varia: és la màquina parlant en el seu idioma.

---

## 🧵 `String.format`: el mateix, però sense imprimir

A vegades no vols imprimir en el moment, sinó **construir un text** amb format per a utilitzar-lo després (guardar-lo, concatenar-lo...). `String.format` fa exactament el mateix que `printf`, però **torna** la cadena en comptes d'imprimir-la:

```java
String msg = String.format("Benvingut, %s. Tens %d missatges nous.", "Carles", 3);
System.out.println(msg);
// Benvingut, Carles. Tens 3 missatges nous.
```

> 💡 **Consell:** utilitza `String.format` quan vulgues un text amb format com a **valor** (per a guardar-lo o usar-lo diverses vegades), i `printf` quan només vulgues escriure'l en pantalla.

---

## 💶 Números grans: `NumberFormat`

Imprimir `1234567.89` sense format és lleig i difícil de llegir. `NumberFormat` aplica els separadors de milers i decimals del teu idioma:

```java
import java.text.NumberFormat;
import java.util.Locale;

NumberFormat nf = NumberFormat.getInstance(new Locale("es", "ES"));
System.out.println(nf.format(1234567.89));  // 1.234.567,89

NumberFormat moneda = NumberFormat.getCurrencyInstance(new Locale("es", "ES"));
System.out.println(moneda.format(12345.67));  // 12.345,67 €
```

- `getInstance(locale)` → format numèric amb separadors.
- `getCurrencyInstance(locale)` → format de moneda (amb el símbol €).

> 📝 **Nota:** el `Locale("es", "ES")` li diu "parla com a Espanya": punt per als milers, coma per als decimals. Si no li passes locale, utilitza el del teu sistema.

---

## 🚨 Errors clàssics del Scanner (i els seus remeis)

El `Scanner` és traïdor. Aquestes són les fallades que es repetixen en cada examen i en cada programa de pràctiques:

### 1. Oblidar el `import java.util.Scanner;`

Sense la línia d'import, Java no coneix la classe i et llança un error de compilació. És la fallada més ximple i la més comuna.

### 2. No tancar el Scanner: `sc.close()`

Deixar el `Scanner` obert és de mala educació (i en programes llargs, pot deixar recursos sense alliberar). Tanca sempre en acabar:

```java
Scanner sc = new Scanner(System.in);
// ... tot el teu codi ...
sc.close();
```

### 3. Demanar un tipus i escriure'n un altre: `InputMismatchException`

Si demanes un `int` i l'usuari escriu lletres, el programa **explota** amb `InputMismatchException`:

```java
int edat = sc.nextInt();   // l'usuari escriu "hola" → 💥 InputMismatchException
```

La solució robusta és **preguntar abans** amb `hasNextInt()` (o `hasNextDouble()`, `hasNext()`...):

```java
if (sc.hasNextInt()) {
    int edat = sc.nextInt();
} else {
    System.out.println("Això no és un número enter.");
    sc.next();   // descarta el text mal escrit
}
```

> ⚠️ **Advertència:** `hasNextInt()` **no consumix** la dada: només mira si el següent és un enter. Si no ho és, has de consumir el text brossa amb `sc.next()` abans de tornar a preguntar, o es quedarà allà per sempre.

### 4. El problema del `nextLine()` després del `nextInt()` (ja ho vas veure en el punt 6)

L'Enter residual es queda en el buffer. Després d'un número, posa un `nextLine()` buit abans de demanar text.

---

## 🏫 Exemple guiat: el validador que no es trenca

Un programa que demana una edat i no cau per molt que l'usuari escriga brossa:

```java
import java.util.Scanner;

public class EdatSegura {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int edat = -1;

        while (edat == -1) {
            System.out.print("Quants anys tens? ");
            if (sc.hasNextInt()) {
                edat = sc.nextInt();
            } else {
                System.out.println("Això no és un número enter, intenta-ho una altra vegada.");
                sc.next();
            }
        }

        System.out.printf("Genial, %d anys i llest per a programar.%n", edat);
        sc.close();
    }
}
```

El bucle `while` repetix la pregunta fins que l'usuari dona un enter. Amb `hasNextInt()` + `sc.next()` per a descartar la brossa, el programa és **a prova de bombes**.

---

## ⭐ Sé el Codi, my friend...

> 🕶️ **Don Tip:** la regla d'or: `printf` per a imprimir amb format, `String.format` per a guardar el text amb format, `hasNextInt()` abans de cada `nextInt()` si l'usuari pot equivocar-se.

**Exercici: el formatador misteriós**

Què imprimeix exactament aquest programa?

```java
public class Formatacio {
    public static void main(String[] args) {
        int hores = 5;
        double preu = 12.5;
        System.out.printf("Treball: %d hores a %.1f €/hora = %.2f €%n",
                hores, preu, hores * preu);
    }
}
```

<details>
<summary>🔄 Solució</summary>

Imprimeix:

```
Treball: 5 hores a 12,5 €/hora = 62,50 €
```

El `%d` ompli amb l'enter, `%.1f` amb un decimal, i `%.2f` amb dos. Els tres valors (`5`, `12.5` i `62.5`) es col·loquen en els forats en ordre. El `%n` afig el salt de línia final. (Els decimals amb coma o punt depenen del locale del sistema.)

</details>

---

## 🎯 Mini-chequeig

1. Quina diferència hi ha entre `System.out.printf` i `String.format`?
2. Quin especificador utilitzaries per a un `double` amb dos decimals?
3. Quina excepció llança `sc.nextInt()` si l'usuari escriu lletres?
4. Com evites que `sc.nextInt()` explote amb una entrada incorrecta?

<details>
<summary>🔄 Respostes</summary>

1. Tots dos apliquen el mateix format, però `printf` ho imprimeix en pantalla i `String.format` **torna** el text format per a utilitzar-lo com a valor.
2. `%.2f`.
3. `InputMismatchException`.
4. Comprovant abans amb `sc.hasNextInt()` i, si no és enter, descartant la brossa amb `sc.next()` abans de tornar a preguntar.

</details>

---

## ✅ Resum en 3 frases

1. **`printf` i `String.format`** donen format a l'eixida amb especificadors (`%d`, `%s`, `%.2f`) i control de decimals i amplària.
2. **`NumberFormat`** formateja números grans i monedes amb els separadors del teu idioma.
3. El `Scanner` es trenca amb `InputMismatchException` si l'usuari escriu malament: pregunta abans amb **`hasNextInt()`** i tanca sempre amb `sc.close()`.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `printf` | Imprimeix amb format (`%d`, `%s`, `%.2f`...) |
> | `String.format` | Torna un text amb format, sense imprimir-lo |
> | Especificador | El `%alguna_cosa` que marca on i com es col·loca un valor |
> | `NumberFormat` | Formateja números i monedes amb separadors locals |
> | `InputMismatchException` | Explosió en demanar un tipus i rebre'n un altre |
> | `hasNextInt()` | Pregunta si el que ve és un enter, sense consumir-lo |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/02-variables-tipos-operadores) · **Anterior:** [06 · Scanner: llegir pel teclat](/ApuntesProgramacion/va/02-variables-tipos-operadores/06-scanner-entrada-teclado) · **Següent:** [08 · Math.random() i números aleatoris](/ApuntesProgramacion/va/02-variables-tipos-operadores/08-math-random-aleatorios)