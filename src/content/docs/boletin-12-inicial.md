---
title: "Boletín 12 - Inicial: Ficheros y Regex"
nav_order: 12
---
*Sin soluciones. A darle al teclado.*

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

Este código no compila. ¿Por qué? ¿Qué dos formas hay de solucionarlo?

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

## Ejercicio 3: Escribe este programa — guardar array en archivo

Crea un array de cadenas con 5 nombres de ciudades. Escribe cada nombre en una línea de un archivo llamado `ciudades.txt`, usando `BufferedWriter` y `try-with-resources`. No olvides el salto de línea.

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

## 🔗 Referencias para seguir practicando

- **CodeWars:** [Get the Middle Character](https://www.codewars.com/kata/56747fd5cb988479af000028) (7 kyu)
- **CodeWars:** [String repeat](https://www.codewars.com/kata/57a0e5c372292dd76d000d7e) (8 kyu)
- **AceptaElReto.com:** [140 - Suma de dígitos](https://www.aceptaelreto.com/problem/statement.php?id=140)
- **AceptaElReto.com:** [149 - San Fermines](https://www.aceptaelreto.com/problem/statement.php?id=149)