---
title: "Boletín U12 — Inicial Resuelto"
description: "Los mismos ejercicios que el boletín inicial, con soluciones"
---

# 📝 Boletín U12 — Inicial (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## Ejercicio 1: Encuentra el error — IOException sin capturar

<details>
<summary>🔄 Solución</summary>

`FileWriter` lanza `IOException` (por ejemplo, si no hay permiso de escritura o la carpeta no existe). El `main` no la declara con `throws` ni la captura con `try-catch`, así que el compilador se queja.

Las **dos formas** de solucionarlo:

1. Declarar la excepción en la firma:
```java
public static void main(String[] args) throws IOException {
    FileWriter writer = new FileWriter("salida.txt");
    writer.write("Hola mundo");
    writer.close();
}
```

2. Capturarla con `try-catch`:
```java
public static void main(String[] args) {
    try (FileWriter writer = new FileWriter("salida.txt")) {
        writer.write("Hola mundo");
    } catch (IOException e) {
        System.out.println("Error: " + e.getMessage());
    }
}
```

La versión con `try-with-resources` es la moderna: cierra el archivo solo y captura el error. Las excepciones comprobadas de `java.io` no se pueden ignorar: o las declaras o las capturas.

</details>

---

## Ejercicio 2: Completa el código — try-with-resources

<details>
<summary>🔄 Solución</summary>

```java
import java.io.*;
import java.nio.file.*;

public class Lector {
    public static void main(String[] args) {
        Path ruta = Paths.get("datos.txt");

        try (BufferedReader reader = Files.newBufferedReader(ruta)) {
            String linea;
            while ((linea = reader.readLine()) != null) {
                System.out.println(linea);
            }
        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
```

Los huecos: `BufferedReader` y `linea`. `Files.newBufferedReader(Path)` te devuelve directamente un `BufferedReader` sin pasar por `FileReader` (la forma NIO del punto 5). El bucle lee línea a línea hasta que `readLine()` devuelve `null`, y el `try-with-resources` cierra el archivo al salir.

</details>

---

## Ejercicio 3: Escribe este programa — guardar ciudades en un archivo

<details>
<summary>🔄 Solución</summary>

```java
import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class Ciudades {
    public static void main(String[] args) {
        String[] ciudades = {"Valencia", "Madrid", "Barcelona", "Sevilla", "Bilbao"};

        try (BufferedWriter bw = Files.newBufferedWriter(Paths.get("ciudades.txt"))) {
            for (String ciudad : ciudades) {
                bw.write(ciudad);
                bw.newLine();
            }
            System.out.println("Ciudades guardadas.");
        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
```

`Files.newBufferedWriter(Path)` te da un `BufferedWriter` listo para usar (la forma NIO del punto 5). Se recorre el array y cada ciudad se escribe con su `newLine()`. El `try-with-resources` cierra el archivo solo.

</details>

---

## Ejercicio 4: Encuentra el error — File.createNewFile sin comprobar

<details>
<summary>🔄 Solución</summary>

Si `documento.txt` **ya existe**, `createNewFile()` devuelve `false` (no crea nada nuevo, no lanza error) y el `FileWriter` **sobrescribe** el contenido igualmente. El código funciona, pero sin enterarte de si el archivo ya estaba.

`createNewFile()` devuelve:
- `true` si ha creado el archivo.
- `false` si ya existía.

El patrón profesional es comprobarlo:

```java
File f = new File("documento.txt");
if (f.createNewFile()) {
    System.out.println("Archivo creado.");
} else {
    System.out.println("El archivo ya existía.");
}
```

Si la carpeta no existe, `createNewFile()` lanza `IOException`, así que también va con `try-catch` o `throws`.

</details>

---

## Ejercicio 5: ¿Qué imprime? — el contador de líneas

<details>
<summary>🔄 Solución</summary>

Imprime **`3`**.

El archivo tiene tres líneas: "linea1", "linea2" y "linea3". El último `\n` **no** crea una cuarta línea: cuando `readLine()` no encuentra más texto, devuelve `null` (no una línea vacía) y el `while` termina. El contador se incrementa 3 veces.

Detalle: el código del `while` descarta la línea (`r.readLine()` a secas) porque solo quiere contar. Si además quisieras el contenido, tendrías que guardarla en una variable.

</details>

---

## Ejercicio 6: Escribe este programa — el diario personal

<details>
<summary>🔄 Solución</summary>

```java
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Scanner;

public class Diario {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("¿Qué has aprendido hoy? ");
        String entrada = sc.nextLine();

        try (FileWriter fw = new FileWriter("diario.txt", true)) {
            fw.write(LocalDate.now() + ": " + entrada + "\n");
            System.out.println("Anotado en el diario.");
        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }
        sc.close();
    }
}
```

El segundo argumento `true` del `FileWriter` activa el modo *append*: añade al final sin borrar lo anterior. `LocalDate.now()` da la fecha actual del sistema. Cada ejecución suma una entrada nueva al diario.

</details>

---

## Ejercicio 7: ¿Qué imprime? — matches() vs find()

<details>
<summary>🔄 Solución</summary>

Imprime:

```
false
true
Número: 123
```

- `"abc123".matches("\\d+")` → **`false`**: `matches()` exige que **todo** el string sean dígitos, y hay letras por el medio.
- `"abc123".matches("\\w+")` → **`true`**: letras y dígitos son `\w`, y todo el string lo cumple.
- El `Matcher` con `find()` busca **subcadenas**: encuentra "123" dentro del texto y lo imprime.

La diferencia clave: `matches()` = patrón completo; `find()` = buscar dentro. Es el error más repetido de la unidad.

</details>

---

## Ejercicio 8: Escribe este programa — contar palabras con split

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class ContarPalabras {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Escribe una frase: ");
        String frase = sc.nextLine().trim();

        String[] palabras = frase.split("\\s+");
        System.out.println("La frase tiene " + palabras.length + " palabras.");
        sc.close();
    }
}
```

`split("\\s+")` trocea por "uno o más espacios", así que los espacios dobles no cuentan como separadores vacíos. El `.trim()` quita los espacios de los extremos antes de trocear (si no, una frase que empiece con espacio generaría una palabra vacía al principio).

</details>

---

## Ejercicio 9: Escribe este programa — contar dígitos con Matcher

<details>
<summary>🔄 Solución</summary>

```java
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ContarDigitos {
    public static void main(String[] args) {
        String frase = "En 2026 hay 12 unidades";

        Pattern patron = Pattern.compile("\\d");
        Matcher matcher = patron.matcher(frase);

        int contador = 0;
        while (matcher.find()) {
            contador++;
        }
        System.out.println("Dígitos: " + contador);
    }
}
```

Salida: `Dígitos: 6` — el `2026` aporta 4 dígitos y el `12` otros 2: `4 + 2 = 6`.

El patrón `\\d` encuentra cada dígito individual y `find()` avanza de uno en uno mientras haya coincidencias. El contador suma cada hallazgo. Con la frase del enunciado, `"En 2026 hay 12 unidades"`, el resultado es exactamente `6`.

</details>