---
title: "08 · Regex en acció: matches, replaceAll, split i validacions"
description: "Del motle al món real: valida correus i DNIs, neteja textos amb replaceAll, troceja amb split i extrau dades amb grups de captura 🧰🛠️"
---

<p><small>Del motle al món real: valida correus i DNIs, neteja textos amb replaceAll, troceja amb split i extrau dades amb grups de captura 🧰🛠️</small></p>

> 🗺️ **Estàs en:** 📁 **U12 · Fitxers i Expressions Regulars** → 08 · Regex en acció: matches, replaceAll, split i validacions

---

## 📬 La idea en una frase

> **Ací la regex deixa de ser teoria: valides un correu amb `matches()`, neteges espais amb `replaceAll()`, troceges una frase amb `split()` i extraus els camps d'un log amb grups de captura.**

El punt 7 et va donar el martell (`Pattern` i `Matcher`). Este punt és el taller: aplicacions reals que usaràs tots els dies. A més de `Pattern`/`Matcher`, la classe `String` té mètodes que accepten regex directament, i són els que més ràpid et faran la vida.

---

## 🎯 String.matches(): ¿complica TOT el string?

`matches()` torna `true` només si **tot** el text complica amb el patró. És la ferramenta perfecta per a validar.

```java
"123".matches("\\d+");          // true  (tot són dígits)
"Hola".matches("\\d+");         // false (no són dígits)
"12345678Z".matches("\\d{8}[A-Z]");  // true (8 dígits + majúscula)
"1234567Z".matches("\\d{8}[A-Z]");   // false (falten dígits)
```

> ⚠️ **Advertència:** `matches()` emparella **tot** el string. Per a buscar subcadenes dins d'un text usa `find()` (punt 7). Este error es cobra el seu preu en cada examen.

---

## 🧹 replaceAll(): netejar text en una línia

`replaceAll(regex, reemplaçament)` substituïx **totes** les coincidències del patró. `replaceFirst()` només la primera.

```java
String texto = "  Hola    mundo  de las   regex  ";

String limpio = texto.replaceAll("\\s+", " ").trim();
// "Hola mundo de las regex"

texto.replaceFirst("\\s+", " ").trim();
// "Hola    mundo  de las   regex"  (només el primer bloc d'espais)
```

El patró `"\\s+"` = "un o més espais" → el substituïx per un sol espai. Amb `.trim()` neteges els extrems. Resultat: text normalitzat en dues crides.

> 💡 **Consell:** els reemplaçaments també accepten grups: `"Hola Ana".replaceAll("Hola (\\w+)", "Adiós $1")` → `"Adiós Ana"`. El `$1` recupera el grup 1 en el reemplaçament.

---

## 🔪 split(): trocejar per patró

`split(regex)` dividix el string per les coincidències i torna un `String[]`.

```java
"a,b,c,d".split(",");        // ["a", "b", "c", "d"]
"a,b,c,d".split(",", 3);     // ["a", "b", "c,d"]  (amb límit)
"hola mundo  java".split("\\s+");  // ["hola", "mundo", "java"] (un o més espais)
"a1b22c333".split("\\d+");   // ["a", "b", "c", ""]
```

Fixa't en l'últim: si el string acaba amb dígits, `split` deixa una cadena buida al final. És un clàssic que mossega. I `split` amb un punt (`"."`) no troceja per punts, perquè `.` és "qualsevol caràcter": necessites `"\\."`.

---

## 🎫 Validacions de la vida real

Ací ho juntem tot: `matches()` + patrons compilats una vegada com a constants. El validador clàssic de correu, DNI i telèfon:

```java
import java.util.regex.Pattern;

public class ValidadorRegex {
    private static final Pattern PATRON_DNI = Pattern.compile("\\d{8}[A-Z]");
    private static final Pattern PATRON_EMAIL =
        Pattern.compile("[\\w.]+@[\\w.]+\\.[a-z]{2,}");
    private static final Pattern PATRON_TELEFONO =
        Pattern.compile("[679]\\d{8}");

    public static boolean esEmailValido(String email) {
        return PATRON_EMAIL.matcher(email.toLowerCase()).matches();
    }

    public static boolean esDNIValido(String dni) {
        return PATRON_DNI.matcher(dni).matches();
    }

    public static boolean esTelefonoValido(String telefono) {
        return PATRON_TELEFONO.matcher(telefono).matches();
    }

    public static void main(String[] args) {
        System.out.println(esEmailValido("user@example.com"));   // true
        System.out.println(esEmailValido("user@@example"));      // false
        System.out.println(esDNIValido("12345678Z"));            // true
        System.out.println(esDNIValido("12345678z"));            // false (minúscula)
        System.out.println(esTelefonoValido("612345678"));       // true
        System.out.println(esTelefonoValido("512345678"));       // false (comença per 5)
    }
}
```

> 📝 **Nota:** `[\\w.]+@[\\w.]+\\.[a-z]{2,}` es llig: "lletres/punts, una `@`, lletres/punts, un punt, i almenys 2 lletres". És un format **bàsic**: no comprova si el domini existix ni si l'adreça és real. I el DNI: la regex només verifica el **format** (8 dígits + lletra); per a validar la lletra de veritat caldria l'algoritme mòdul 23. Les regex validen forma, no veritat.

---

## 🕵️ El processador de logs (grups de captura + fitxers)

L'aplicació estrella: llegir un log i extraure'n els camps amb grups. Recorda del punt 2 com llegir fitxers, i ací li sumes la regex:

```java
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ProcesadorLog {
    public static void main(String[] args) throws Exception {
        Pattern patron = Pattern.compile(
            "\\[(ERROR|INFO|WARN)\\]\\s+" +
            "(\\d{4}-\\d{2}-\\d{2})\\s+" +
            "(\\d{2}:\\d{2}:\\d{2})\\s+-\\s+(.*)");

        Path entrada = Paths.get("app.log");
        Path salida = Paths.get("errores.txt");

        try (BufferedReader br = Files.newBufferedReader(entrada);
             PrintWriter pw = new PrintWriter(Files.newBufferedWriter(salida))) {

            String linea;
            while ((linea = br.readLine()) != null) {
                Matcher matcher = patron.matcher(linea);
                if (matcher.find()) {
                    String nivel = matcher.group(1);
                    String fecha = matcher.group(2);
                    String hora = matcher.group(3);
                    String mensaje = matcher.group(4);
                    System.out.printf("[%s] %s a las %s: %s%n", nivel, fecha, hora, mensaje);
                    if (nivel.equals("ERROR")) {
                        pw.println(fecha + " " + hora + " " + mensaje);
                    }
                }
            }
        }
        System.out.println("Errores extraídos a " + salida);
    }
}
```

Amb una sola regex traus el nivell, la data, l'hora i el missatge de cada línia. I si la línia és un `ERROR`, l'escrius en un fitxer a part. Regex + fitxers: la unitat sencera en un programa.

> 💡 **Consell:** per a un log enorme no uses `Files.readAllLines` (punt 5): carrega tot en memòria. Llig **línia a línia** amb `BufferedReader` i aplica el `Matcher` a cadascuna. Memòria constant, tant se val que el log pese 2 GB.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cada parèntesi captura una part. `(.*)` al final captura "tot el que quede": és el clàssic per a la resta de la línia. Si una línia no coincidix, `find()` torna `false` i no passa res: el bucle seguix.

**Exercici: el formatejador de dates**

```java
public class FormateadorFechas {
    public static void main(String[] args) {
        String fecha = "15/03/2024";
        String convertida = fecha.replaceAll("(\\d{2})/(\\d{2})/(\\d{4})", "$3-$2-$1");
        System.out.println(convertida);
    }
}
```

**Què imprimeix? I què passa si la data ve amb guions `15-03-2024`?**

<details>
<summary>🔄 Solució</summary>

Imprimeix **`2024-03-15`**: passa de `dd/mm/aaaa` a `aaaa-mm-dd`.

Els grups capturen el dia (`$1`), el mes (`$2`) i l'any (`$3`), i el reemplaçament `$3-$2-$1` els reordena. Eixe és el truc per a reordenar parts de text amb regex sense tocar res més.

I la trampa: amb `15-03-2024` **no coincidix res** (el patró espera `/`, no `-`), així que `replaceAll` no toca el string i torna `15-03-2024` tal qual. Per a suportar tots dos separadors hauríes d'usar `[\\/\\-]` o dues crides. Les regex són literals: no endevinen, compleixen ordres.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quin mètode de `String` valida que TOT el text complica amb un patró?
2. Com lleves els espais dobles d'un text amb una línia?
3. Què torna `"a,b,c".split(",")`?
4. En `replaceAll("(\\w+)@(\\w+)", "$2@$1")`, què fa `$2`?

<details>
<summary>🔄 Respostes</summary>

1. `matches()`.
2. `texto.replaceAll("\\s+", " ").trim()`.
3. Un `String[]` amb `["a", "b", "c"]`.
4. Recupera el segon grup de captura (el que va coincidir amb el segon parèntesi) i el col·loca en el reemplaçament: intercanvia les dues parts.

</details>

---

## ✅ Resum en 3 frases

1. **`matches()`** valida que tot el text complica amb el patró (correus, DNIs, telèfons); **`replaceAll`** neteja i reordena text; **`split`** troceja pel patró.
2. Els **grups de captura** extrauen parts (`group(n)` en Java, `$n` en els reemplaçaments) i són la base per a processar logs i CSV.
3. Per a fitxers grans, aplica la regex **línia a línia** amb `BufferedReader` (no carregues el fitxer sencer en memòria).

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `matches()` | ¿Tot el string complica amb el patró? |
> | `replaceAll()` | Substituïx totes les coincidències |
> | `replaceFirst()` | Substituïx només la primera |
> | `split()` | Troceja el string pel patró |
> | `$n` | Grup `n` en un reemplaçament de `replaceAll` |
> | Validar | Comprovar el format d'una dada (no la seua veracitat) |

📁 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/12-ficheros-regex) · **Anterior:** [07 · Expressions regulars: Pattern i Matcher](/ApuntesProgramacion/va/12-ficheros-regex/07-regex-basica) · **Següent:** [09 · Repàs interactiu](/ApuntesProgramacion/va/12-ficheros-regex/09-repaso-interactivo)