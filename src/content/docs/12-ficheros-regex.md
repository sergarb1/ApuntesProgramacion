---
title: "📁 Unidad 12: Ficheros y Expresiones Regulares"
---
> 🗺️ **El mapa del paquete:** 🚪 Bienvenida → ☕ U01 → 🔤 U02 → 🔀 U03 → 🅿️ U04 → 🧩 U05 → ⚡ U06 → 🏗️ U07 → 🔒 U08 → 🧬 U09 → 📚 U10 → 🗺️ U11 → **📁 AQUÍ ESTÁS (U12)** → 🗄️ U13 → 🌐 U14

🎯 **Objetivos de aprendizaje**
- Leer y escribir archivos de texto con File, FileReader, FileWriter, BufferedReader
- Usar try-with-resources, NIO (Files/Paths) y serialización básica
- Crear y usar expresiones regulares con Pattern y Matcher
- Validar, buscar, reemplazar y extraer partes de texto con regex

## Ficheros

### La Clase File

Antes de leer o escribir, localiza el archivo. `java.io.File` es el GPS:

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

> **💡 Consejo:** Usa `/` o `\\` en Windows. `"C:/datos/notas.txt"` o `"C:\\datos\\notas.txt"`.

### Escribir: FileWriter

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

> Sin `close()` o `flush()` los datos se quedan en el buffer interno sin escribirse.

### Leer: FileReader + BufferedReader

`BufferedReader` envuelve a `FileReader` para leer líneas enteras de golpe:

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

### ⭐ BE THE CODE, MY FRIEND: el detective de archivos

> 🕶️ **Don Tip:** `File` representa rutas, no contenido. Para leer el contenido usa `Scanner`, `BufferedReader` o `Files.readAllLines()`.

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

> **⭐** ¿Qué imprime la **segunda** vez? (el archivo ya existe)  
> **Respuesta:** `misteriosas palabras Tres` — lee y concatena al revés.

### try-with-resources (Java 7+)

Los recursos se cierran automáticamente al salir del bloque:

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

> **Scanner vs BufferedReader:** Scanner es mejor para parsear tokens (nextInt()); BufferedReader es más rápido para archivos grandes.

### PrintWriter

Igual que `System.out` pero escribiendo en archivos:

```java
try (PrintWriter pw = new PrintWriter(new FileWriter("formato.txt"))) {
    pw.println("Línea con salto automático");
    pw.printf("PI vale %.4f%n", Math.PI);
}
```

### NIO: Files y Paths

API moderna desde Java 7. `Path` es como `File` pero con esteroides:

```java
import java.nio.file.*;
import java.util.List;

Path ruta = Paths.get("C:/datos/notas.txt");
List<String> lineas = Files.readAllLines(ruta);       // leer
Files.write(ruta, List.of("Línea 1", "Línea 2"));     // escribir
```

### ⭐ BE THE CODE, MY FRIEND: NIO en Acción

> 🕶️ **Don Tip:** NIO usa `Path` y `Files`. Son más modernos y tienen métodos útiles como `Files.walk()` para recorrer árboles.

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

> **⭐** ¿Qué imprime? **Respuesta:** `Total: 26` — suma los números y sobrescribe.

### Serialización: ObjectOutputStream

Guardar objetos enteros en archivos con `Serializable`:

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

> La clase debe implementar `Serializable`. Si tiene campos no serializables → `NotSerializableException`.

### ❓ ¡No hay preguntas tontas! (ficheros)

> **Q:** ¿File crea el archivo?  
> **A:** No. `new File("ruta")` solo representa la ruta, no crea nada.
>
> **Q:** ¿Qué pasa si el archivo no existe al leer?  
> **A:** `FileNotFoundException`. Usa `f.exists()` o try-catch.
>
> **Q:** ¿Qué diferencia hay entre File, FileReader y FileWriter?  
> **A:** `File` → la dirección. `FileReader` → para LEER. `FileWriter` → para ESCRIBIR.
>
> **Q:** ¿Qué pasa si no cierro un archivo?  
> **A:** Los datos pueden perderse (buffer sin vaciar) y el SO retiene recursos.

---

## Expresiones regulares

Una expresión regular (regex) es un **patrón de búsqueda** que describe un conjunto de cadenas.

> **⚠️ En Java las contrabarras se duplican:** `\d` → `"\\d"`, `\.` → `"\\."`. Es el "infierno de las contrabarras".

### Pattern y Matcher

- `Pattern`: la expresión regular compilada (el molde)
- `Matcher`: se aplica a un texto concreto buscando coincidencias

```java
import java.util.regex.*;

Pattern patron = Pattern.compile("\\d+");  // uno o más dígitos
Matcher matcher = patron.matcher("Hay 123 manzanas y 456 peras");

while (matcher.find()) {
    System.out.println("Encontrado: " + matcher.group()
        + " (" + matcher.start() + "-" + matcher.end() + ")");
}
// Encontrado: 123 (4-7), Encontrado: 456 (21-24)
```

> Compila el `Pattern` una sola vez y reutilízalo. `Pattern.compile()` es caro.

### Símbolos Regex

| Símbolo | Significado | Ejemplo |
|---|---|---|
| `.` | Cualquier carácter (ex. salto) | `c.sa` → "casa", "cose" |
| `\d` | Dígito (0-9) | `\d{3}` → "123" |
| `\D` | NO dígito | `\D+` → "Hola" |
| `\w` | Letra, dígito o `_` | `\w+` → "Hola_123" |
| `\W` | NO `\w` | `\W` → ".", " " |
| `\s` | Espacio en blanco | `\s+` → separadores |
| `\S` | NO espacio | `\S+` → palabras |
| `*` | 0 o más veces | `a*` → "", "a", "aa" |
| `+` | 1 o más veces | `a+` → "a", "aa" |
| `?` | 0 o 1 vez (opcional) | `colou?r` → "color", "colour" |
| `{n}` | Exactamente n | `\d{3}` |
| `{n,m}` | Entre n y m | `\d{2,4}` |
| `[abc]` | Uno del conjunto | `[aeiou]` → vocales |
| `[a-z]` | Rango | `[a-z]` → minúsculas |
| `[^abc]` | Negación | `[^0-9]` → no dígitos |
| `( )` | Grupo de captura | `(\d+)-(\w+)` |
| `^` | Inicio de línea | `^Hola` |
| `$` | Final de línea | `mundo$` |
| `\|` | OR lógico | `gato\|perro` |
| `\b` | Límite de palabra | `\bJava\b` ≠ "JavaScript" |

### String.matches(), replaceAll(), split()

Métodos de `String` que aceptan regex directamente:

```java
String texto = "  Hola    mundo  de las   regex  ";

// matches() → true solo si TODO el string coincide
"123".matches("\\d+");               // true
"Hola".matches("\\d+");              // false

// replaceAll() → reemplaza todas las coincidencias
String limpio = texto.replaceAll("\\s+", " ").trim();
// "Hola mundo de las regex"

// replaceFirst() → solo la primera coincidencia
texto.replaceFirst("\\s+", " ").trim();

// split() → divide por el patrón
"a,b,c,d".split(",");                // [a, b, c, d]
"a,b,c,d".split(",", 3);             // [a, b, c,d] (con límite)
```

> `matches()` empareja **todo** el string. Para buscar subcadenas usa `find()`.

### Validación: correo, teléfono y DNI

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

> Para validar DNI español de verdad necesitas comprobar la letra módulo 23. La regex solo verifica formato.

### Grupos de captura

Los paréntesis `()` capturan lo que coincide para extraerlo después:

```java
String texto = "Juan: 28 años, María: 32 años";
Pattern patron = Pattern.compile("(\\w+): (\\d+) años");
Matcher matcher = patron.matcher(texto);

while (matcher.find()) {
    System.out.println(matcher.group(1) + " tiene " + matcher.group(2) + " años");
}
// Juan tiene 28 años, María tiene 32 años
```

> Para agrupar sin capturar (más eficiente): `(?:patron)`.

### Regex con flags

```java
Pattern p1 = Pattern.compile("java", Pattern.CASE_INSENSITIVE);
Pattern p2 = Pattern.compile("^\\d+", Pattern.MULTILINE);
Pattern p3 = Pattern.compile(".*", Pattern.DOTALL);
Pattern p4 = Pattern.compile("java", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE);
Pattern p5 = Pattern.compile("(?i)java");  // flag inline
```

### ⭐ BE THE CODE, MY FRIEND: procesando un log

> 🕶️ **Don Tip:** Las regex se prueban con `matches()` (todo el string) o `find()` (subcadena). `group()` extrae lo capturado con paréntesis.

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

> Cada paréntesis captura una parte: nivel, fecha, hora y mensaje. Para un log de 2 GB leerías línea a línea con `BufferedReader`.

### ❓ ¡No hay preguntas tontas! (Regex)

> **Q:** ¿Por qué `"abc123".matches("\\d+")` devuelve `false`?  
> **A:** `matches()` empareja **todo** el string. Usa `find()` para subcadenas.
>
> **Q:** ¿Cómo hago un punto literal?  
> **A:** Escápalo: `"\\."`.
>
> **Q:** ¿Puedo procesar 1M líneas con la misma regex?  
> **A:** Sí, compila el `Pattern` una vez fuera del bucle y reutiliza el matcher.
>
> **Q:** ¿Se pueden validar HTML con regex?  
> **A:** No. HTML no es un lenguaje regular. Usa un parser.
>
> **Q:** ¿`\w` incluye tildes?  
> **A:** No por defecto. Usa `[a-zA-ZáéíóúüñÑ]` o `Pattern.UNICODE_CHARACTER_CLASS`.

### Resumen rápido: regex

```
Pattern p = Pattern.compile("regex");   ← compilar
Matcher m = p.matcher(texto);          ← aplicar
m.find() → boolean                      ← buscar coincidencia
m.group() / m.group(n) → String         ← obtener match / grupo
texto.matches("regex")                  ← ¿todo coincide?
texto.replaceAll("regex", "nuevo")      ← reemplazar todas
texto.split("regex")                    ← dividir por patrón

\d → dígito    \w → letra/_    \s → espacio    . → cualquier char
* → 0+         + → 1+          ? → 0-1         {n} → exactamente n
[abc] → conjunto   () → grupo de captura
```

---

## Ejercicios propuestos

### Ejercicio 1: El diario personal
Escribe en `diario.txt` con fecha y texto. Abre en modo append cada ejecución sin borrar lo anterior.

### Ejercicio 2: El contador de líneas
Lee un archivo con `BufferedReader` y muestra cuántas líneas, palabras y caracteres tiene.

### Ejercicio 3: validador de contraseñas
Valida: mínimo 8 caracteres, una mayúscula, una minúscula, un dígito, un carácter especial (`@#$%^&+=`).

### Ejercicio 4: extractor de URLs
Extrae URLs (http/https) separando protocolo, dominio y ruta con grupos de captura.

### Ejercicio 5: formateador de fechas
Convierte `dd/mm/aaaa` a `aaaa-mm-dd` con `replaceAll()` y grupos de captura.

### Ejercicio 6: cifrado César
Lee `mensaje.txt`, desplaza cada carácter +3 posiciones, escribe en `mensaje_cifrado.txt`.

### Ejercicio 7: analizador de logs
Dado `[NIVEL] timestamp - mensaje: detalle`, cuenta mensajes por nivel y muestra los ERROR.

---

**RAs trabajados en esta unidad:**
- **RA5** - Entrada/Salida: ficheros
- **RA6** - Tipos avanzados: Expresiones regulares

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
