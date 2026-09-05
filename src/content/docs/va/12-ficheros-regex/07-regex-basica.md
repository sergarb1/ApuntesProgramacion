---
title: "07 · Expressions regulars: Pattern i Matcher"
description: "El motle, el text i l'infern de les contrabarres: aprèn a crear patrons amb Pattern i a buscar-los amb Matcher 🔍🧩"
---

<p><small>El motle, el text i l'infern de les contrabarres: aprèn a crear patrons amb Pattern i a buscar-los amb Matcher 🔍🧩</small></p>

> 🗺️ **Estàs en:** 📁 **U12 · Fitxers i Expressions Regulars** → 07 · Expressions regulars: Pattern i Matcher

---

## 📬 La idea en una frase

> **Una expressió regular (regex) és un patró que descriu un conjunt de cadenes: `"\\d+"` significa "un o més dígits". Amb `Pattern` la compiles i amb `Matcher` la busques dins d'un text.**

Fins ací guardaves dades en fitxers. Ara toca l'altra meitat de la unitat: **buscar patrons dins de text**. ¿Quantes vegades has volgut "trobar tots els números" o "comprovar que això pareix un correu"? Les expressions regulars són el llenguatge per a descriure eixes cerques. S'usen en quasi tots els llenguatges i, una vegada les aprens, no hi ha text que se't resista.

---

## ⚠️ L'infern de les contrabarres (llig-ho dues vegades)

En Java, les regex s'escriuen com a **cadenes** i, dins d'un `String`, la contrabarra `\` és un caràcter d'escapament. Per a escriure un `\d` de regex dins d'un `String` has de duplicar-la:

| El que vols en la regex | El que escrius en Java |
|---|---|
| `\d` (dígit) | `"\\d"` |
| `\.` (punt literal) | `"\\."` |
| `\s` (espai) | `"\\s"` |

> ⚠️ **Advertència:** si escrius `"\d"` Java intenta escapar la `d`, no sap què és i et dona un error de compilació (o pitjor, un comportament rar). L'"infern de les contrabarres" és la causa número 1 que una regex "no funcione" quan acabes de començar.

---

## 🔍 Pattern i Matcher: el motle i el text

El flux clàssic són dos passos:

- **`Pattern`**: l'expressió regular **compilada**. És el motle.
- **`Matcher`**: s'aplica a un **text concret** i va buscant coincidències. És el detector.

```java
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class PrimerRegex {
    public static void main(String[] args) {
        Pattern patron = Pattern.compile("\\d+");   // un o més dígits (el motle)
        Matcher matcher = patron.matcher("Hay 123 manzanas y 456 peras");

        while (matcher.find()) {
            System.out.println("Encontrado: " + matcher.group()
                + " (posición " + matcher.start() + "-" + matcher.end() + ")");
        }
    }
}
```

Eixida:

```
Encontrado: 123 (posición 4-7)
Encontrado: 456 (posición 21-24)
```

- `find()` avança buscant la següent coincidència i torna `true` mentre en trobe.
- `group()` torna el text que ha coincidit.
- `start()` i `end()` tornen on comença i acaba la coincidència.

> 💡 **Consell:** compila el `Pattern` **una sola vegada** fora de bucles i reutilitza'l. `Pattern.compile()` és car (analitza la regex i munta una màquina d'estats). Si el crides dins d'un bucle d'1 milió de línies, te'l faràs mirar.

---

## 🧩 La taula de símbols (la teua xulleta d'examen)

| Símbol | Significat | Exemple |
|---|---|---|
| `.` | Qualsevol caràcter (excepte salt de línia) | `c.sa` → "casa", "cose" |
| `\d` | Dígit (0-9) | `\d{3}` → "123" |
| `\D` | NO dígit | `\D+` → "Hola" |
| `\w` | Lletra, dígit o `_` | `\w+` → "Hola_123" |
| `\W` | NO `\w` | `\W` → ".", " " |
| `\s` | Espai en blanc | `\s+` → separadors |
| `\S` | NO espai | `\S+` → paraules |
| `*` | 0 o més vegades | `a*` → "", "a", "aa" |
| `+` | 1 o més vegades | `a+` → "a", "aa" |
| `?` | 0 o 1 vegada (opcional) | `colou?r` → "color", "colour" |
| `{n}` | Exactament n | `\d{3}` → tres dígits |
| `{n,m}` | Entre n i m | `\d{2,4}` → de 2 a 4 dígits |
| `[abc]` | Un del conjunt | `[aeiou]` → vocals |
| `[a-z]` | Rang | `[a-z]` → minúscules |
| `[^abc]` | Negació | `[^0-9]` → no dígits |
| `( )` | Grup de captura | `(\d+)-(\w+)` |
| `^` | Inici de línia | `^Hola` |
| `$` | Final de línia | `mundo$` |
| `\|` | OR lògic | `gato\|perro` |
| `\b` | Límit de paraula | `\bJava\b` no coincidix amb "JavaScript" |

> 📝 **Nota:** `\w` NO inclou accents ni `ñ` per defecte. Per a "pérez" o "muñoz" necessites `[a-zA-ZáéíóúüñÑ]` o la bandera `Pattern.UNICODE_CHARACTER_CLASS`. Cosa d'examen, apunta-t'ho.

---

## 🕵️ Grups de captura: els parèntesis que recorden

Els parèntesis `( )` no només agrupen: **capturen** el que coincidix per a poder extraure-ho després. És la base del punt 8, però convé vore-ho ja:

```java
Pattern patron = Pattern.compile("(\\w+): (\\d+) años");
Matcher matcher = patron.matcher("Juan: 28 años, María: 32 años");

while (matcher.find()) {
    System.out.println(matcher.group(1) + " tiene " + matcher.group(2) + " años");
}
// Juan tiene 28 años
// María tiene 32 años
```

- `group(0)` (o `group()`) és tota la coincidència.
- `group(1)`, `group(2)`... són els parèntesis en ordre d'obertura.
- Si agrupes sense voler capturar (per rendiment): `(?:...)`.

---

## 🚩 Les banderes (flags)

`Pattern.compile` accepta un segon argument amb banderes:

```java
Pattern p1 = Pattern.compile("java", Pattern.CASE_INSENSITIVE);              // Java, JAVA, java...
Pattern p2 = Pattern.compile("^\\d+", Pattern.MULTILINE);                    // ^ a l'inici de cada línia
Pattern p3 = Pattern.compile(".*", Pattern.DOTALL);                          // el . també captura salts
Pattern p4 = Pattern.compile("java", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE);  // combinades
Pattern p5 = Pattern.compile("(?i)java");                                    // flag inline: (?i) = case-insensitive
```

`(?i)` dins de la pròpia regex fa el mateix que la bandera, sense segon argument. Les banderes es combinen amb `|`.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** les regex es proven amb `matches()` (tot el string) o `find()` (subcadena). `group()` extrau el capturat amb parèntesis. Si la teua regex no troba res, revisa les contrabarres abans que la lògica.

**Exercici: el caçador d'ànecs**

```java
import java.util.regex.*;

public class CazadorPatos {
    public static void main(String[] args) {
        String texto = "Hay 3 patos, luego 45 patos, y al final 678 patos";
        Pattern patron = Pattern.compile("\\d+ patos");
        Matcher matcher = patron.matcher(texto);

        int total = 0;
        while (matcher.find()) {
            String grupo = matcher.group();                // "3 patos", "45 patos"...
            String numero = grupo.split(" ")[0];           // "3", "45"...
            total += Integer.parseInt(numero);
        }
        System.out.println("Patos totales: " + total);
    }
}
```

**Què imprimeix? I si canvies `matcher.find()` per `matcher.matches()`?**

<details>
<summary>🔄 Solució</summary>

Imprimeix **`Patos totales: 726`** (`3 + 45 + 678`).

`find()` va saltant de coincidència en coincidència: primer "3 patos", després "45 patos", després "678 patos". De cada grup s'extrau la part numèrica amb `split(" ")` i s'acumula.

I ull amb la segona pregunta (trampa): amb `matches()`, la resposta seria **cap coincidència** (o `false`). `matches()` exigix que **tot** el string complica amb el patró, i ací hi ha més text al voltant. Per a buscar subcadenes usa sempre `find()`. És l'error més repetit de la unitat.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Com escrius en Java la regex `\d`?
2. Què torna `matcher.find()`?
3. Quin mètode de `Matcher` et dona el text que ha coincidit?
4. Per què convé compilar el `Pattern` fora d'un bucle?

<details>
<summary>🔄 Respostes</summary>

1. `"\\d"`. Dins d'un `String`, la contrabarra es duplica.
2. `true` si troba una coincidència (i avança a la següent). `false` quan no en queden.
3. `group()` (o `group(0)`), i `group(n)` per al grup de captura `n`.
4. Perquè `Pattern.compile()` és car: analitza la regex i munta la màquina de cerca. Reutilitzar el `Pattern` és gratis i molt més ràpid.

</details>

---

## ✅ Resum en 3 frases

1. Una **regex** descriu un conjunt de cadenes amb símbols (`\d`, `\w`, `+`, `{n}`, `[a-z]`...), i en Java les contrabarres es **dupliquen** (`"\\d"`).
2. **`Pattern.compile`** compila la regex (el motle) i **`matcher.find()`** busca coincidències en un text: `group()`, `start()` i `end()` et donen els detalls.
3. `matches()` exigix que **tot** el string complica amb el patró; `find()` busca subcadenes. No els confongues: és l'error número 1.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Regex | Patró de cerca que descriu un conjunt de cadenes |
> | `Pattern` | La regex compilada (el motle) |
> | `Matcher` | El buscador aplicat a un text concret |
> | `find()` | Busca la següent coincidència |
> | `group()` | El text que ha coincidit |
> | Grup de captura | Parèntesis que "recorden" part de la coincidència |
> | Metacaràcter | Símbol amb significat especial en una regex (`.`, `+`, `\d`...) |

📁 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/12-ficheros-regex) · **Anterior:** [06 · Serialització: guardar objectes amb ObjectOutputStream](/ApuntesProgramacion/va/12-ficheros-regex/06-serializacion) · **Següent:** [08 · Regex en acció: matches, replaceAll, split i validacions](/ApuntesProgramacion/va/12-ficheros-regex/08-regex-aplicaciones)