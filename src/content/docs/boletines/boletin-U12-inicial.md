---
title: "Boletín U12 — Inicial"
description: "Ejercicios básicos de Ficheros y Regex: File, FileWriter, BufferedReader, try-with-resources y las primeras expresiones regulares"
---

# 📝 Boletín U12 — Inicial

> Sin soluciones. Sin prisas. Abre el IDE, crea tu primer archivo con `FileWriter` y haz que `readLine()` deje de parecer magia. El disco es tuyo y los datos esperan. Empieza suave, que los ficheros muerden poco a poco.

---

## Ejercicio 1: Encuentra el error — IOException sin capturar

```java
import java.io.*;

public class Test {
    public static void main(String[] args) {
        FileWriter writer = new FileWriter("salida.txt");
        writer.write("Hola mundo");
        writer.close();
    }
}
```

Este código **no compila**. ¿Por qué? ¿Qué dos formas hay de solucionarlo?

---

## Ejercicio 2: Completa el código — try-with-resources

Completa el siguiente programa para que lea un archivo y muestre su contenido:

```java
import java.io.*;
import java.nio.file.*;

public class Lector {
    public static void main(String[] args) {
        Path ruta = Paths.get("datos.txt");

        try (______ reader = Files.newBufferedReader(ruta)) {  // ¿qué tipo?
            String linea;
            while ((linea = reader.readLine()) != null) {
                System.out.println(______);  // ¿qué va aquí?
            }
        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
```

---

## Ejercicio 3: Escribe este programa — guardar ciudades en un archivo

Crea un array de cadenas con 5 nombres de ciudades. Escribe cada nombre en una línea de un archivo llamado `ciudades.txt`, usando `BufferedWriter` y `try-with-resources`. No olvides el salto de línea.

Pista: `BufferedWriter` tiene `write(...)` y `newLine()`.

---

## Ejercicio 4: Encuentra el error — File.createNewFile sin comprobar

```java
File f = new File("documento.txt");
f.createNewFile();
FileWriter w = new FileWriter(f);
w.write("Contenido importante");
w.close();
```

¿Qué pasa si el archivo `documento.txt` ya existe? ¿Qué devuelve `createNewFile()`?

---

## Ejercicio 5: ¿Qué imprime? — el contador de líneas

```java
import java.io.*;

public class Test {
    public static void main(String[] args) throws IOException {
        File f = new File("datos.txt");
        FileWriter w = new FileWriter(f);
        w.write("linea1\nlinea2\nlinea3\n");
        w.close();

        BufferedReader r = new BufferedReader(new FileReader(f));
        int contador = 0;
        while (r.readLine() != null) {
            contador++;
        }
        r.close();
        System.out.println(contador);
    }
}
```

¿Qué imprime? ¿El último `\n` cuenta como una línea más?

---

## Ejercicio 6: Escribe este programa — el diario personal

Escribe un programa que añada una línea a `diario.txt` con la fecha de hoy y el texto que el usuario introduzca por teclado. Cada ejecución debe **añadir al final sin borrar** lo anterior.

Pista: `new FileWriter("diario.txt", true)` y para la fecha `java.time.LocalDate.now()`.

---

## Ejercicio 7: ¿Qué imprime? — matches() vs find()

```java
import java.util.regex.*;

public class Test {
    public static void main(String[] args) {
        String texto = "abc123";

        System.out.println(texto.matches("\\d+"));
        System.out.println(texto.matches("\\w+"));

        Pattern p = Pattern.compile("\\d+");
        Matcher m = p.matcher(texto);
        while (m.find()) {
            System.out.println("Número: " + m.group());
        }
    }
}
```

¿Qué imprime cada línea? ¿Por qué `matches("\\d+")` da `false` pero `find()` sí encuentra algo?

---

## Ejercicio 8: Escribe este programa — contar palabras con split

Pide al usuario una frase por teclado y muestra cuántas palabras tiene, ignorando los espacios dobles.

Pista: `frase.split("\\s+")` trocea por "uno o más espacios". Cuidado con el `.trim()`.

---

## Ejercicio 9: Escribe este programa — contar dígitos con Matcher

Escribe un programa que cuente cuántos **dígitos** hay en una frase. Por ejemplo, `"En 2026 hay 12 unidades"` → `6` dígitos (`2`, `0`, `2`, `6`, `1` y `2`).

Pista: compila `Pattern.compile("\\d")`, usa `matcher.find()` en un bucle y lleva un contador.