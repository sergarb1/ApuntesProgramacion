---
title: "Boletín 10 - Inicial Resuelto: Consola y Ficheros"
nav_order: 10
---
*Con soluciones. A aprender.*

---

## Ejercicio 1: ¿Qué imprime? — printf()

```java
String nombre = "Ana";
int edad = 20;
double nota = 9.5;

System.out.printf("Nombre: %s, Edad: %d, Nota: %.2f%n", nombre, edad, nota);
```

**Solución:** Imprime `Nombre: Ana, Edad: 20, Nota: 9.50` y un salto de línea.

> **💡 Explicación:** `printf()` no es `println()`: no añade salto de línea automático. Por eso se usa `%n` al final, que es el salto de línea independiente de plataforma. `%s` para String, `%d` para entero, `%.2f` para decimal con 2 dígitos. El `%n` es como un `\n` pero más educado: sabe si estás en Windows (salto con \r\n) o Linux (solo \n).

---

## Ejercicio 2: Encuentra el error — nextInt() + nextLine()

```java
Scanner sc = new Scanner(System.in);
System.out.print("Edad: ");
int edad = sc.nextInt();           // lee "25" y deja el "\n" sin consumir
System.out.print("Nombre: ");
String nombre = sc.nextLine();     // se traga el "\n" que quedó
System.out.println(nombre + " tiene " + edad + " años.");
sc.close();
```

**Solución:** `nextInt()` NO consume el salto de línea. Cuando el usuario escribe `25` y pulsa Enter, en el buffer queda `25\n`. `nextInt()` consume `25` y deja `\n`. Luego `nextLine()` consume ese `\n` y devuelve una cadena vacía. El programa imprime ` tiene 25 años.` (nombre vacío).

Para arreglarlo: añade un `sc.nextLine()` extra después del `nextInt()` para consumir el salto de línea.

```java
int edad = sc.nextInt();
sc.nextLine();  // consume el \n pendiente
String nombre = sc.nextLine();
```

> **💡 Explicación:** Es el error más famoso de Java con Scanner. Siempre que uses `nextInt()`, `nextDouble()` o `next()` y luego `nextLine()`, necesitas un `nextLine()` extra para limpiar el buffer. O mejor: usa siempre `nextLine()` y convierte con `Integer.parseInt()`, que es más seguro.

---

## Ejercicio 3: Completa el código — leer archivo

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

## Ejercicio 4: Escribe este programa — Hola mundo archivo

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

**Solución:** Imprime `3`.

> **💡 Explicación:** El archivo tiene tres líneas: "linea1", "linea2", "linea3" (el último `\n` crea una línea adicional vacía, pero `readLine()` no la cuenta como línea porque devuelve `null` cuando no hay más). `readLine()` devuelve cada línea hasta que no quedan más, momento en que devuelve `null`. El contador se incrementa 3 veces. Nota: en realidad, si el archivo termina con `\n`, `readLine()` leería "linea3" y luego devolvería `null`, por lo que contaríamos 3 líneas. Si no hubiera `\n` al final, también serían 3.

---

## Ejercicio 6: Encuentra el error — archivo no cerrado

```java
FileWriter writer = new FileWriter("notas.txt");
writer.write("Esto es una nota importante.");
// falta: writer.close();
```

**Solución:** Falta `writer.close()`. Sin cerrar el archivo, los datos pueden no escribirse físicamente en el disco porque `FileWriter` usa un buffer interno.

> **💡 Explicación:** `FileWriter` no escribe directamente en el disco. Usa un buffer. Cuando haces `write()`, los datos se almacenan en el buffer. Si no llamas a `close()` o `flush()`, parte de los datos pueden perderse cuando el programa termina. Es como echar una carta al buzón pero no cerrar la puerta: el cartero puede no recogerla. Además, el sistema operativo mantiene el archivo bloqueado hasta que se cierre. **Siempre cierra los archivos** o usa try-with-resources (Java 7+).

---

## Ejercicio 7: Escribe este programa — Scanner que suma números

```java
import java.util.Scanner;

public class SumaNumeros {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int suma = 0;
        int num;

        System.out.println("Introduce números enteros (0 para terminar):");
        do {
            System.out.print("Número: ");
            num = sc.nextInt();
            suma += num;
        } while (num != 0);

        System.out.printf("La suma total es: %d%n", suma);
        sc.close();
    }
}
```

> **💡 Explicación:** El bucle `do-while` asegura que se pida al menos un número. Cuando el usuario introduce 0, el bucle termina. `suma += num` acumula todos los números, incluido el 0 final (que no afecta a la suma). `printf()` con `%d` formatea el entero. Es un programa simple pero que combina todas las piezas: Scanner, bucle, acumulación y salida formateada.

---

## 🔗 Referencias para seguir practicando

- **CodeWars:** [Get the Middle Character](https://www.codewars.com/kata/56747fd5cb988479af000028) (7 kyu)
- **CodeWars:** [String repeat](https://www.codewars.com/kata/57a0e5c372292dd76d000d7e) (8 kyu)
- **AceptaElReto.com:** [140 - Suma de dígitos](https://www.aceptaelreto.com/problem/statement.php?id=140)
- **AceptaElReto.com:** [149 - San Fermines](https://www.aceptaelreto.com/problem/statement.php?id=149)
