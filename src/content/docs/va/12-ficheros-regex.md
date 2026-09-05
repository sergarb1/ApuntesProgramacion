---
title: "📁 Unitat 12: Fitxers i Expressions Regulars"
---
> 🗺️ **El mapa del paquet:** 🚪 Benvinguda → ☕ U01 → 🔤 U02 → 🔀 U03 → 🅿️ U04 → 🧩 U05 → ⚡ U06 → 🏗️ U07 → 🔒 U08 → 🧬 U09 → 📚 U10 → 🗺️ U11 → **📁 ACÍ ETS (U12)** → 🗄️ U13 → 🌐 U14

🎯 **Objectius d'aprenentatge**
- Llegir i escriure fitxers de text amb File, FileReader, FileWriter, BufferedReader
- Usar try-with-resources, NIO (Files/Paths) i serialització bàsica
- Crear i usar expressions regulars amb Pattern i Matcher
- Validar, buscar, reemplaçar i extraure parts de text amb regex

## Fitxers

### La Classe File

Abans de llegir o escriure, localitza el fitxer. `java.io.File` és el GPS:

```java
import java.io.File;

File f = new File("C:/datos/notas.txt");
System.out.println("¿Existe? " + f.exists());
System.out.println("¿Es archivo? " + f.isFile());
System.out.println("¿Es carpeta? " + f.isDirectory());
System.out.println("Tamaño: " + f.length() + " bytes");
System.out.println("Ruta absoluta: " + f.getAbsolutePath());
System.out.println("Nombre: " + f.getName());
```

> **💡 Consell:** Usa `/` o `\\` en Windows. `"C:/datos/notas.txt"` o `"C:\\datos\\notas.txt"`.

### Escriure: FileWriter

```java
import java.io.FileWriter;
import java.io.IOException;

FileWriter escritor = new FileWriter("salida.txt");
escritor.write("Primera línea.\n");
escritor.write("Segunda línea.\n");
escritor.close();

// Añadir al final (sin borrar):
FileWriter writer = new FileWriter("bitacora.txt", true);
```

> Sense `close()` o `flush()` les dades es queden al buffer intern sense escriure's.

### Llegir: FileReader + BufferedReader

`BufferedReader` embolica a `FileReader` per a llegir línies senceres d'una volta:

```java
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

BufferedReader lector = new BufferedReader(new FileReader("salida.txt"));
String linea = lector.readLine();
while (linea != null) {
    System.out.println(linea);
    linea = lector.readLine();
}
lector.close();
```

### ⭐ BE THE CODE, MY FRIEND: El Detectiu de Fitxers

> 🕶️ **Don Tip:** `File` representa rutes, no contingut. Per a llegir el contingut usa `Scanner`, `BufferedReader` o `Files.readAllLines()`.

```java
import java.io.*;

public class DetectiveDeArchivos {
    public static void main(String[] args) throws IOException {
        File f = new File("misterio.txt");
        if (!f.exists()) {
            System.out.println("Creando archivo...");
            FileWriter w = new FileWriter(f);
            w.write("Tres\npalabras\nmisteriosas\n");  w.close();
        }
        BufferedReader r = new BufferedReader(new FileReader(f));
        String s = "";
        String linea;
        while ((linea = r.readLine()) != null) {
            s = linea + " " + s;
        }
        r.close();
        System.out.println(s);
    }
}
```

> **⭐** Què imprimeix la **segona** vegada? (el fitxer ja existix)  
> **Resposta:** `misteriosas palabras Tres` — llig i concatena al revés.

### try-with-resources (Java 7+)

Els recursos es tanquen automàticament en eixir del bloc:

```java
try (BufferedReader br = new BufferedReader(new FileReader("salida.txt"))) {
    String linea;
    while ((linea = br.readLine()) != null) {
        System.out.println(linea);
    }
} catch (IOException e) {
    System.out.println("Error: " + e.getMessage());
}
// No hay br.close() — se cierra solo
```

### Scanner + File

```java
try (Scanner sc = new Scanner(new File("salida.txt"))) {
    while (sc.hasNextLine()) {
        System.out.println(sc.nextLine());
    }
}
```

> **Scanner vs BufferedReader:** Scanner és millor per a parsejar tokens (nextInt()); BufferedReader és més ràpid per a fitxers grans.

### PrintWriter

Igual que `System.out` però escrivint en fitxers:

```java
try (PrintWriter pw = new PrintWriter(new FileWriter("formato.txt"))) {
    pw.println("Línea con salto automático");
    pw.printf("PI vale %.4f%n", Math.PI);
}
```

### NIO: Files i Paths

API moderna des de Java 7. `Path` és com `File` però amb esteroides:

```java
import java.nio.file.*;
import java.util.List;

Path ruta = Paths.get("C:/datos/notas.txt");
List<String> lineas = Files.readAllLines(ruta);       // llegir
Files.write(ruta, List.of("Línea 1", "Línea 2"));     // escriure
```

### ⭐ BE THE CODE, MY FRIEND: NIO en Acció

> 🕶️ **Don Tip:** NIO usa `Path` i `Files`. Són més moderns i tenen mètodes útils com `Files.walk()` per a recórrer arbres.

```java
import java.nio.file.*;
import java.util.*;

public class BeTheNIO {
    public static void main(String[] args) throws IOException {
        Path p = Paths.get("nums.txt");
        Files.write(p, List.of("3", "7", "2", "9", "5"));
        List<String> l = Files.readAllLines(p);
        int suma = 0;
        for (String s : l) { suma += Integer.parseInt(s); }
        Files.write(p, List.of("Total: " + suma));
        System.out.println(Files.readString(p));
    }
}
```

> **⭐** Què imprimeix? **Resposta:** `Total: 26` — suma els números i sobreescriu.

### Serialització: ObjectOutputStream

Guardar objectes sencers en fitxers amb `Serializable`:

```java
import java.io.*;

class Persona implements Serializable {
    String nombre; int edad;
    Persona(String n, int e) { this.nombre = n; this.edad = e; }
}

public class GuardandoObjetos {
    public static void main(String[] args) throws Exception {
        Persona p = new Persona("Luis", 25);

        try (ObjectOutputStream oos = new ObjectOutputStream(
                new FileOutputStream("persona.obj"))) {
            oos.writeObject(p);
        }

        try (ObjectInputStream ois = new ObjectInputStream(
                new FileInputStream("persona.obj"))) {
            Persona recuperada = (Persona) ois.readObject();
            System.out.println(recuperada.nombre + " tiene " + recuperada.edad);
        }
    }
}
```

> La classe ha d'implementar `Serializable`. Si té camps no serialitzables → `NotSerializableException`.

### ❓ No Hi Ha Preguntes Tontes! (Fitxers)

> **Q:** File crea el fitxer?  
> **A:** No. `new File("ruta")` sols representa la ruta, no crea res.
>
> **Q:** Què passa si el fitxer no existix en llegir?  
> **A:** `FileNotFoundException`. Usa `f.exists()` o try-catch.
>
> **Q:** Quina diferència hi ha entre File, FileReader i FileWriter?  
> **A:** `File` → l'adreça. `FileReader` → per a LLEGIR. `FileWriter` → per a ESCRIURE.
>
> **Q:** Què passa si no tanque un fitxer?  
> **A:** Les dades poden perdre's (buffer sense buidar) i el SO reté recursos.

---

## Expressions Regulars

Una expressió regular (regex) és un **patró de cerca** que descriu un conjunt de cadenes.

> **⚠️ En Java les contrabarres es dupliquen:** `\d` → `"\\d"`, `\.` → `"\\."`. És l'infern de les contrabarres.

### Pattern i Matcher

- `Pattern`: l'expressió regular compilada (el motle)
- `Matcher`: s'aplica a un text concret buscant coincidències

```java
import java.util.regex.*;

Pattern patron = Pattern.compile("\\d+");  // un o més dígits
Matcher matcher = patron.matcher("Hay 123 manzanas y 456 peras");

while (matcher.find()) {
    System.out.println("Encontrado: " + matcher.group()
        + " (" + matcher.start() + "-" + matcher.end() + ")");
}
// Encontrado: 123 (4-7), Encontrado: 456 (21-24)
```

> Compila el `Pattern` una sola vegada i reutilitza'l. `Pattern.compile()` és car.

### Símbols Regex

| Símbol | Significat | Exemple |
|---|---|---|
| `.` | Qualsevol caràcter (ex. salt) | `c.sa` → "casa", "cose" |
| `\d` | Dígit (0-9) | `\d{3}` → "123" |
| `\D` | NO dígit | `\D+` → "Hola" |
| `\w` | Lletra, dígit o `_` | `\w+` → "Hola_123" |
| `\W` | NO `\w` | `\W` → ".", " " |
| `\s` | Espai en blanc | `\s+` → separadors |
| `\S` | NO espai | `\S+` → paraules |
| `*` | 0 o més vegades | `a*` → "", "a", "aa" |
| `+` | 1 o més vegades | `a+` → "a", "aa" |
| `?` | 0 o 1 vegada (opcional) | `colou?r` → "color", "colour" |
| `{n}` | Exactament n | `\d{3}` |
| `{n,m}` | Entre n i m | `\d{2,4}` |
| `[abc]` | Un del conjunt | `[aeiou]` → vocals |
| `[a-z]` | Rang | `[a-z]` → minúscules |
| `[^abc]` | Negació | `[^0-9]` → no dígits |
| `( )` | Grup de captura | `(\d+)-(\w+)` |
| `^` | Inici de línia | `^Hola` |
| `$` | Final de línia | `mundo$` |
| `\|` | OR lògic | `gato\|perro` |
| `\b` | Límit de paraula | `\bJava\b` ≠ "JavaScript" |

### String.matches(), replaceAll(), split()

Mètodes de `String` que accepten regex directament:

```java
String texto = "  Hola    mundo  de las   regex  ";

// matches() → true només si TOT el string coincidix
"123".matches("\\d+");               // true
"Hola".matches("\\d+");              // false

// replaceAll() → reemplaça totes les coincidències
String limpio = texto.replaceAll("\\s+", " ").trim();
// "Hola mundo de las regex"

// replaceFirst() → només la primera coincidència
texto.replaceFirst("\\s+", " ").trim();

// split() → dividix pel patró
"a,b,c,d".split(",");                // [a, b, c, d]
"a,b,c,d".split(",", 3);             // [a, b, c,d] (amb límit)
```

> `matches()` emparella **tot** el string. Per a buscar subcadenes usa `find()`.

### Validació: Email, Teléfon, DNI

```java
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
        return PATRON_DNI.matcher(dni.toUpperCase()).matches();
    }
    public static boolean esTelefonoValido(String telefono) {
        return PATRON_TELEFONO.matcher(telefono).matches();
    }

    public static void main(String[] args) {
        System.out.println(esEmailValido("user@example.com"));   // true
        System.out.println(esEmailValido("user@@example"));      // false
        System.out.println(esDNIValido("12345678Z"));            // true
        System.out.println(esDNIValido("12345678z"));            // false
        System.out.println(esTelefonoValido("612345678"));       // true
        System.out.println(esTelefonoValido("512345678"));       // false
    }
}
```

> Per a validar DNI espanyol de veritat necessites comprovar la lletra mòdul 23. La regex sols verifica format.

### Grups de Captura

Els parèntesis `()` capturen allò que coincidix per a extraure-ho després:

```java
String texto = "Juan: 28 años, María: 32 años";
Pattern patron = Pattern.compile("(\\w+): (\\d+) años");
Matcher matcher = patron.matcher(texto);

while (matcher.find()) {
    System.out.println(matcher.group(1) + " tiene " + matcher.group(2) + " años");
}
// Juan tiene 28 años, María tiene 32 años
```

> Per a agrupar sense capturar (més eficient): `(?:patron)`.

### Regex Amb Flags

```java
Pattern p1 = Pattern.compile("java", Pattern.CASE_INSENSITIVE);
Pattern p2 = Pattern.compile("^\\d+", Pattern.MULTILINE);
Pattern p3 = Pattern.compile(".*", Pattern.DOTALL);
Pattern p4 = Pattern.compile("java", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE);
Pattern p5 = Pattern.compile("(?i)java");  // flag inline
```

### ⭐ BE THE CODE, MY FRIEND: Processant Un Log

> 🕶️ **Don Tip:** Les regex es proven amb `matches()` (tot el string) o `find()` (subcadena). `group()` extrau el capturat amb parèntesis.

```java
import java.util.regex.*;
import java.util.*;

public class ProcesadorLog {
    public static void main(String[] args) {
        String log = """
            [ERROR] 2024-03-15 10:30:45 - Usuario no encontrado: id=42
            [INFO]  2024-03-15 10:31:02 - Sesión iniciada: user=admin
            [WARN]  2024-03-15 10:32:10 - Memoria baja: 128MB disponible
            [ERROR] 2024-03-15 10:33:00 - Connection timeout: server=db01
            """;

        Pattern patron = Pattern.compile(
            "\\[(ERROR|INFO|WARN)\\]\\s+" +
            "(\\d{4}-\\d{2}-\\d{2})\\s+" +
            "(\\d{2}:\\d{2}:\\d{2})\\s+-\\s+(.*)");

        Matcher matcher = patron.matcher(log);
        List<String> errores = new ArrayList<>();

        while (matcher.find()) {
            String nivel = matcher.group(1);
            String fecha = matcher.group(2);
            String hora = matcher.group(3);
            String mensaje = matcher.group(4);
            System.out.printf("[%s] %s a las %s: %s%n", nivel, fecha, hora, mensaje);
            if (nivel.equals("ERROR")) errores.add(mensaje);
        }
        System.out.println("\nErrores: " + errores.size());
        for (String e : errores) System.out.println("  ❌ " + e);
    }
}
```

> Cada parèntesi captura una part: nivell, data, hora i missatge. Per a un log de 2 GB llegiries línia a línia amb `BufferedReader`.

### ❓ No Hi Ha Preguntes Tontes! (Regex)

> **Q:** Per què `"abc123".matches("\\d+")` retorna `false`?  
> **A:** `matches()` emparella **tot** el string. Usa `find()` per a subcadenes.
>
> **Q:** Com faig un punt literal?  
> **A:** Escapa'l: `"\\."`.
>
> **Q:** Puc processar 1M línies amb la mateixa regex?  
> **A:** Sí, compila el `Pattern` una vegada fora del bucle i reutilitza el matcher.
>
> **Q:** Es poden validar HTML amb regex?  
> **A:** No. HTML no és un llenguatge regular. Usa un parser.
>
> **Q:** `\w` inclou accents?  
> **A:** No per defecte. Usa `[a-zA-ZáéíóúüñÑ]` o `Pattern.UNICODE_CHARACTER_CLASS`.

### Resum Ràpid: Regex

```
Pattern p = Pattern.compile("regex");   ← compilar
Matcher m = p.matcher(texto);          ← aplicar
m.find() → boolean                      ← buscar coincidència
m.group() / m.group(n) → String         ← obtindre match / grup
texto.matches("regex")                  ← tot coincidix?
texto.replaceAll("regex", "nuevo")      ← reemplaçar totes
texto.split("regex")                    ← dividir per patró

\d → dígit    \w → lletra/_    \s → espai    . → qualsevol char
* → 0+         + → 1+          ? → 0-1         {n} → exactament n
[abc] → conjunt   () → grup de captura
```

---

## Exercicis Proposats

### Exercici 1: El diari personal
Escriu en `diari.txt` amb data i text. Obri en mode append cada execució sense esborrar l'anterior.

### Exercici 2: El comptador de línies
Llig un fitxer amb `BufferedReader` i mostra quantes línies, paraules i caràcters té.

### Exercici 3: Validador de contrasenyes
Valida: mínim 8 caràcters, una majúscula, una minúscula, un dígit, un caràcter especial (`@#$%^&+=`).

### Exercici 4: Extractador d'URLs
Extrau URLs (http/https) separant protocol, domini i ruta amb grups de captura.

### Exercici 5: Formatejador de dates
Convertix `dd/mm/aaaa` a `aaaa-mm-dd` amb `replaceAll()` i grups de captura.

### Exercici 6: Xifrat Cèsar
Llig `missatge.txt`, desplaça cada caràcter +3 posicions, escriu en `missatge_xifrat.txt`.

### Exercici 7: Analitzador de logs
Donat `[NIVELL] timestamp - missatge: detall`, compta missatges per nivell i mostra els ERROR.

---

**RAs treballats en esta unitat:**
- **RA5** - Entrada/Eixida: fitxers
- **RA6** - Tipus avançats: Expressions regulars

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
