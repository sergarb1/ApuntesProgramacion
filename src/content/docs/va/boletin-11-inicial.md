---
title: "Boletín 10 - Inicial: Consola, Fitxers i Regex"
nav_order: 10
---
*Sense solucions. A donar-li al teclat.*

---

## Ejercicio 1: ¿Qué imprime? — printf con conversiones

```java
int entero = 42;
double decimal = 3.1416;
String texto = "Java";

System.out.printf("%d %f %s %n", entero, decimal, texto);
```

¿Qué imprime? ¿Qué hace `%n` al final?

---

## Ejercicio 2: Encuentra el error — IOException sin capturar

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

## Ejercicio 3: Completa el código — try-with-resources

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

## Ejercicio 4: Escribe este programa — guardar array en archivo

Crea un array de cadenas con 5 nombres de ciudades. Escribe cada nombre en una línea de un archivo llamado `ciudades.txt`, usando `BufferedWriter` y `try-with-resources`. No olvides el salto de línea.

---

## Ejercicio 5: ¿Qué imprime? — Scanner next vs nextLine

```java
import java.util.Scanner;

public class Test {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Palabra: ");
        String palabra = sc.next();
        System.out.print("Frase: ");
        String frase = sc.nextLine();
        System.out.println("[" + palabra + "] [" + frase + "]");
    }
}
```

Si el usuario introduce `Hola mundo` y pulsa Enter, luego `Esto es una frase` y pulsa Enter, ¿qué imprime exactamente? ¿Por qué `next()` y `nextLine()` se comportan distinto?

---

## Ejercicio 6: Encuentra el error — File.createNewFile sin comprobar

```java
File f = new File("documento.txt");
f.createNewFile();
FileWriter w = new FileWriter(f);
w.write("Contenido importante");
w.close();
```

¿Qué pasa si el archivo `documento.txt` ya existe? ¿Qué devuelve `createNewFile()`?

---

## Ejercicio 7: Escribe este programa — menú con Scanner y switch

Crea un programa que muestre un menú con estas opciones:

1. **Saludar** → imprime «¡Hola, programador!»
2. **Despedirse** → imprime «¡Hasta luego!»
3. **Cuenta atrás** → pide un número y cuenta desde ese número hasta 0
0. **Salir**

El menú debe repetirse hasta que el usuario elija 0. Usa `Scanner`, `switch` y `printf()` para formatear la salida.

---

## 🔗 Referències per seguir practicant

- **CodeWars:** [Get the Middle Character](https://www.codewars.com/kata/56747fd5cb988479af000028) (7 kyu)
- **CodeWars:** [String repeat](https://www.codewars.com/kata/57a0e5c372292dd76d000d7e) (8 kyu)
- **AceptaElReto.com:** [140 - Suma de dígitos](https://www.aceptaelreto.com/problem/statement.php?id=140)
- **AceptaElReto.com:** [149 - San Fermines](https://www.aceptaelreto.com/problem/statement.php?id=149)
