---
title: "04 · PrintWriter i Scanner + File"
description: "El sergent que formata l'eixida i el pop que tokenitza l'entrada: PrintWriter per a escriure bonic i Scanner per a llegir fitxers a trossos 🖨️🦑"
---

<p><small>El sergent que formata l'eixida i el pop que tokenitza l'entrada: PrintWriter per a escriure bonic i Scanner per a llegir fitxers a trossos 🖨️🦑</small></p>

> 🗺️ **Estàs en:** 📁 **U12 · Fitxers i Expressions Regulars** → 04 · PrintWriter i Scanner + File

---

## 📬 La idea en una frase

> **`PrintWriter` escriu en fitxers amb la comoditat de `System.out` (`println`, `printf`) i `Scanner` llig fitxers trocejant-los en tokens (`nextInt`, `nextLine`, `useDelimiter`).**

En la U02 vas vore `System.out.printf` i `Scanner` pel teclat (punts 6 i 7). Ara tots dos tornen, però apuntant a **fitxers** en comptes de a la consola. `PrintWriter` escriu amb format; `Scanner` + `File` llig fitxers com si estigueres llegint del teclat, amb el seu `hasNextLine`, `nextInt` i companyia.

---

## 🖨️ PrintWriter: System.out, però en un fitxer

`PrintWriter` té `println()`, `print()` i `printf()`: exactament els mètodes de la consola, però escrivint en un fitxer.

```java
import java.io.PrintWriter;
import java.io.FileWriter;

public class Informe {
    public static void main(String[] args) throws Exception {
        try (PrintWriter pw = new PrintWriter(new FileWriter("informe.txt"))) {
            pw.println("=== Informe de ventas ===");
            pw.printf("Total: %10.2f €%n", 1234.5678);
            pw.printf("Producto: %-12s Unidades: %d%n", "Camiseta", 42);
            pw.printf("Producto: %-12s Unidades: %d%n", "Chaqueta", 7);
        }
    }
}
```

El `%n` és el salt de línia portable (no uses `\n` en `printf`, que en Windows no encerta). Si necessites repassar els formats de `printf` (`%d`, `%f`, `%s`, `%-10s`...), torna a la U02, punt 7.

> 📝 **Nota:** el `printf` amb `%10.2f` es veu bé en la consola, però en un fitxer que s'òbriga amb un altre programa, compte amb els espais: no tots els editors els respecten igual.

---

## 🦑 Scanner + File: llegir fitxers a trossos

`Scanner` pot llegir d'un fitxer igual que llig del teclat. Embolica un `File` i a jugar amb `hasNextLine()` / `nextLine()`, o amb `hasNextInt()` / `nextInt()` per a dades soltes.

```java
import java.io.File;
import java.util.Scanner;

public class LeerConScanner {
    public static void main(String[] args) throws Exception {
        try (Scanner sc = new Scanner(new File("notas.txt"))) {
            while (sc.hasNextLine()) {
                System.out.println(sc.nextLine());
            }
        }
    }
}
```

¿Fitxers amb números separats per espais? `nextInt()` te'ls va servint sense que tu et fiques en el lio de les línies:

```java
// datos.txt → "10 20 30 40"
try (Scanner sc = new Scanner(new File("datos.txt"))) {
    int suma = 0;
    while (sc.hasNextInt()) {
        suma += sc.nextInt();
    }
    System.out.println("Suma: " + suma);  // Suma: 100
}
```

> ⚠️ **Advertència:** al punt 3 ho comentàvem: un `Scanner` en `try-with-resources` és fantàstic per a fitxers. No ho faces amb un `Scanner` del teclat dins d'un programa llarg: al tancar-lo tanques `System.in` i tot el que vinga després de llegir del teclat es romp.

---

## 🪓 useDelimiter: tallar on tu digues

Per defecte `Scanner` troceja per espais i salts de línia. Però si el teu fitxer separa els camps amb `;`, li dius amb `useDelimiter()` on tallar:

```java
import java.io.File;
import java.util.Scanner;

public class LeeCSV {
    public static void main(String[] args) throws Exception {
        // datos.csv → "Ana;25;DAM" ... "Bob;22;DAW"
        try (Scanner sc = new Scanner(new File("datos.csv"))) {
            sc.useDelimiter(";|\\R");   // talla per ';' o per salt de línia
            while (sc.hasNext()) {
                String nombre = sc.next();
                int edad = sc.nextInt();
                String ciclo = sc.next();
                System.out.printf("%-8s %2d años %s%n", nombre, edad, ciclo);
            }
        }
    }
}
```

`\\R` és el "qualsevol salt de línia" de Java (punt 7, quan veges regex, això et sonarà). Amb `";|\\R"` li dius: talla per punt i coma o per salt de línia. El resultat és un fitxer CSV llegit sense despeinar-te.

---

## 🆚 Scanner vs BufferedReader: quin use?

| Criteri | `Scanner` | `BufferedReader` |
|---|---|---|
| Llegir per línies | `nextLine()` | `readLine()` |
| Llegir números | `nextInt()` directe | Has de convertir a mà |
| Delimitadors personalitzats | `useDelimiter()` | No |
| Velocitat en fitxers enormes | Suficient | Millor (buffer més eficient) |
| El millor per a | Parsejar dades soltes i tokens | Llegir fitxers de text línia a línia |

> 💡 **Consell:** ¿fitxer de configuració amb números i paraules? `Scanner`. ¿Log de 2 GB que cal recórrer sencer? `BufferedReader`. Per a processar logs amb regex ja ho veuràs al punt 8.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `PrintWriter` i `Scanner` són la parella de moda per a "llegir, transformar i escriure": lliges amb `Scanner`, transformes, i escrius amb `PrintWriter` formatat. El `printf` de `PrintWriter` és el mateix de sempre, però amb destinació de fitxer.

**Exercici: el full de càlcul que es fa sol**

```java
import java.io.*;
import java.util.Scanner;

public class NotasMedias {
    public static void main(String[] args) throws Exception {
        try (Scanner sc = new Scanner(new File("alumnos.txt"))) {
            sc.useDelimiter(";|\\R");
            PrintWriter pw = new PrintWriter(new FileWriter("medias.txt"));
            while (sc.hasNext()) {
                String nombre = sc.next();
                int n1 = sc.nextInt();
                int n2 = sc.nextInt();
                double media = (n1 + n2) / 2.0;
                pw.printf("%s: %.1f%n", nombre, media);
            }
            pw.close();
        }
        System.out.println("Hecho.");
    }
}
```

**El fitxer `alumnos.txt` conté `"Ana;7;9\nBob;5;6"`. Què contindrà `medias.txt`?**

<details>
<summary>🔄 Solució</summary>

`medias.txt` contindrà:

```
Ana: 8.0
Bob: 5.5
```

El `useDelimiter(";|\\R")` talla per `;` o per salt de línia, així que els camps eixen nets: nom, nota1, nota2. La mitjana d'Ana és `(7+9)/2.0 = 8.0`; la de Bob, `(5+6)/2.0 = 5.5`. Fixa't en el `2.0` en comptes de `2`: sense el `.0`, `(7+9)/2` faria divisió entera i donaria `8` en comptes de `8.0`.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quin mètode de `PrintWriter` et permet formatejar amb `%d`, `%f`, `%s`?
2. Com lliges un fitxer amb `Scanner` en comptes de pel teclat?
3. Per a què servix `useDelimiter(";")`?
4. Què torna `hasNextInt()` quan el fitxer s'ha quedat sense números?

<details>
<summary>🔄 Respostes</summary>

1. `printf()` (o `format()`), igual que `System.out.printf`.
2. `new Scanner(new File("ruta.txt"))` en comptes de `new Scanner(System.in)`.
3. Per a canviar el separador per defecte (espais) per un altre, ací el `;`. Útil per a CSVs.
4. `false`. Per això el `while (sc.hasNextInt())` es deté quan ja no queden números.

</details>

---

## ✅ Resum en 3 frases

1. **`PrintWriter`** escriu en fitxers amb `println`, `print` i `printf`: la comoditat de la consola amb destinació de fitxer.
2. **`Scanner` + `File`** llig fitxers a tokens (`nextInt`, `nextLine`), i amb **`useDelimiter`** pots tallar per `;`, comes o el que necessites.
3. Regla ràpida: **`Scanner`** per a parsejar dades soltes, **`BufferedReader`** per a fitxers grans línia a línia, i tots dos dins de **`try-with-resources`**.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `PrintWriter` | Escriptor amb `println`/`printf` sobre fitxers |
> | `useDelimiter()` | Canvia el separador amb què `Scanner` troceja |
> | Token | Cada trosset en què `Scanner` talla l'entrada |
> | `\\R` | "Qualsevol salt de línia" en regex de Java |
> | CSV | Fitxer de valors separats per comes (o per `;`) |

📁 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/12-ficheros-regex) · **Anterior:** [03 · try-with-resources: tancar sense plorar](/ApuntesProgramacion/va/12-ficheros-regex/03-try-with-resources) · **Següent:** [05 · NIO: Files i Paths (la forma moderna)](/ApuntesProgramacion/va/12-ficheros-regex/05-nio-files-paths)