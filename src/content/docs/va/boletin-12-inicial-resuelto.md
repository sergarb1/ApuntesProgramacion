---
title: "Butlletí 12 - Inicial Resolt: Fitxers i Expressions Regulars"
nav_order: 12
---
*Con soluciones. A aprender.*

---

## Ejercicio 1: Completa el código — leer archivo

```java
import java.io.*;
import java.nio.file.*;
import java.util.List;  // ¡este import falta!

public class Test {
    public static void main(String[] args) throws IOException {
        Path ruta = Paths.get("datos.txt");
        List<String> lineas = Files.readAllLines(ruta);
        for (String linea : lineas) {
            System.out.println(linea);
        }
    }
}
```

Falta `linea` en el `println` y también el `import java.util.List;`.

> **💡 Explicación:** `Files.readAllLines()` devuelve un `List<String>`, que necesita import. El for-each recorre cada línea y `linea` es la variable que contiene cada línea. Sin `import java.util.List;`, el compilador no sabe qué es `List` y se queja.

---

## Ejercicio 2: Escribe este programa — Hola mundo archivo

```java
import java.io.*;

public class HolaArchivo {
    public static void main(String[] args) {
        // Escribir
        try {
            FileWriter writer = new FileWriter("saludo.txt");
            writer.write("¡Hola, archivo!\n");
            writer.write("Esto es una segunda línea.\n");
            writer.close();
            System.out.println("Archivo escrito.");
        } catch (IOException e) {
            System.out.println("Error al escribir: " + e.getMessage());
        }

        // Leer
        try {
            BufferedReader reader = new BufferedReader(new FileReader("saludo.txt"));
            String linea = reader.readLine();
            while (linea != null) {
                System.out.println(linea);
                linea = reader.readLine();
            }
            reader.close();
        } catch (IOException e) {
            System.out.println("Error al leer: " + e.getMessage());
        }
    }
}
```

> **💡 Explicación:** `FileWriter` escribe caracteres en un archivo. Si el archivo no existe, lo crea. Si existe, lo sobrescribe. `BufferedReader` envuelve a `FileReader` para leer por líneas (más rápido). El bucle `while (linea != null)` es el estándar para leer archivos línea por línea. Siempre cierra los recursos con `close()` para evitar pérdidas de datos.

---

## Ejercicio 3: ¿Qué imprime? — el contador de líneas

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

**Solución:** Imprime `3`.

> **💡 Explicación:** El archivo tiene tres líneas: "linea1", "linea2", "linea3" (el último `\n` crea una línea adicional vacía, pero `readLine()` no la cuenta como línea porque devuelve `null` cuando no hay más). `readLine()` devuelve cada línea hasta que no quedan más, momento en que devuelve `null`. El contador se incrementa 3 veces. Nota: en realidad, si el archivo termina con `\n`, `readLine()` leería "linea3" y luego devolvería `null`, por lo que contaríamos 3 líneas. Si no hubiera `\n` al final, también serían 3.

---

## Ejercicio 4: Encuentra el error — archivo no cerrado

```java
FileWriter writer = new FileWriter("notas.txt");
writer.write("Esto es una nota importante.");
// falta: writer.close();
```

**Solución:** Falta `writer.close()`. Sin cerrar el archivo, los datos pueden no escribirse físicamente en el disco porque `FileWriter` usa un buffer interno.

> **💡 Explicación:** `FileWriter` no escribe directamente en el disco. Usa un buffer. Cuando haces `write()`, los datos se almacenan en el buffer. Si no llamas a `close()` o `flush()`, parte de los datos pueden perderse cuando el programa termina. Es como echar una carta al buzón pero no cerrar la puerta: el cartero puede no recogerla. Además, el sistema operativo mantiene el archivo bloqueado hasta que se cierre. **Siempre cierra los archivos** o usa try-with-resources (Java 7+).

---

## 🔗 Referencias para seguir practicando

- **CodeWars:** [Get the Middle Character](https://www.codewars.com/kata/56747fd5cb988479af000028) (7 kyu)
- **CodeWars:** [String repeat](https://www.codewars.com/kata/57a0e5c372292dd76d000d7e) (8 kyu)
- **AceptaElReto.com:** [140 - Suma de dígitos](https://www.aceptaelreto.com/problem/statement.php?id=140)
- **AceptaElReto.com:** [149 - San Fermines](https://www.aceptaelreto.com/problem/statement.php?id=149)