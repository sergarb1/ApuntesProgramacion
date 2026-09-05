---
title: "04 · PrintWriter y Scanner + File"
description: "El sargento que formatea la salida y el pulpo que tokeniza la entrada: PrintWriter para escribir bonito y Scanner para leer archivos a pedazos 🖨️🦑"
---

<p><small>El sargento que formatea la salida y el pulpo que tokeniza la entrada: PrintWriter para escribir bonito y Scanner para leer archivos a pedazos 🖨️🦑</small></p>

> 🗺️ **Estás en:** 📁 **U12 · Ficheros y Expresiones Regulares** → 04 · PrintWriter y Scanner + File

---

## 📬 La idea en una frase

> **`PrintWriter` escribe en archivos con la comodidad de `System.out` (`println`, `printf`) y `Scanner` lee archivos troceándolos en tokens (`nextInt`, `nextLine`, `useDelimiter`).**

En la U02 viste `System.out.printf` y `Scanner` por teclado (puntos 6 y 7). Ahora los dos vuelven, pero apuntando a **archivos** en lugar de a la consola. `PrintWriter` escribe con formato; `Scanner` + `File` lee archivos como si estuvieras leyendo del teclado, con su `hasNextLine`, `nextInt` y compañía.

---

## 🖨️ PrintWriter: System.out, pero en un archivo

`PrintWriter` tiene `println()`, `print()` y `printf()`: exactamente los métodos de la consola, pero escribiendo en un archivo.

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

El `%n` es el salto de línea portable (no uses `\n` en `printf`, que en Windows no pilla). Si necesitas repasar los formatos de `printf` (`%d`, `%f`, `%s`, `%-10s`...), vuelve a la U02, punto 7.

> 📝 **Nota:** el `printf` con `%10.2f` se ve bien en la consola, pero en un archivo que vaya a abrirse con otro programa, cuidado con los espacios: no todos los editores los respetan igual.

---

## 🦑 Scanner + File: leer archivos a pedazos

`Scanner` puede leer de un archivo igual que lee del teclado. Envuelve un `File` y a jugar con `hasNextLine()` / `nextLine()`, o con `hasNextInt()` / `nextInt()` para datos sueltos.

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

¿Archivos con números separados por espacios? `nextInt()` te los va sirviendo sin que tú te metas en el lío de las líneas:

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

> ⚠️ **Advertencia:** en el punto 3 lo comentábamos: un `Scanner` en `try-with-resources` es fantástico para archivos. No lo hagas con un `Scanner` del teclado dentro de un programa largo: al cerrarlo cierras `System.in` y todo lo que venga después de leer del teclado se rompe.

---

## 🪓 useDelimiter: cortar donde tú digas

Por defecto `Scanner` trocea por espacios y saltos de línea. Pero si tu archivo separa los campos con `;`, le dices con `useDelimiter()` dónde cortar:

```java
import java.io.File;
import java.util.Scanner;

public class LeeCSV {
    public static void main(String[] args) throws Exception {
        // datos.csv → "Ana;25;DAM" ... "Bob;22;DAW"
        try (Scanner sc = new Scanner(new File("datos.csv"))) {
            sc.useDelimiter(";|\\R");   // corta por ';' o por salto de línea
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

`\\R` es el "cualquier salto de línea" de Java (punto 7, cuando veas regex, esto te sonará). Con `";|\\R"` le dices: corta por punto y coma o por salto de línea. El resultado es un archivo CSV leído sin despeinarte.

---

## 🆚 Scanner vs BufferedReader: ¿cuál uso?

| Criterio | `Scanner` | `BufferedReader` |
|---|---|---|
| Leer por líneas | `nextLine()` | `readLine()` |
| Leer números | `nextInt()` directo | Tienes que convertir a mano |
| Delimitadores personalizados | `useDelimiter()` | No |
| Velocidad en archivos enormes | Suficiente | Mejor (buffer más eficiente) |
| Lo mejor para | Parsear datos sueltos y tokens | Leer archivos de texto línea a línea |

> 💡 **Consejo:** ¿archivo de configuración con números y palabras? `Scanner`. ¿Log de 2 GB que hay que recorrer entero? `BufferedReader`. Para procesar logs con regex ya lo verás en el punto 8.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `PrintWriter` y `Scanner` son la pareja de moda para "leer, transformar y escribir": lees con `Scanner`, transformas, y escribes con `PrintWriter` formateado. El `printf` de `PrintWriter` es el mismo de siempre, pero con destino de archivo.

**Ejercicio: la hoja de cálculo que se hace sola**

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

**El archivo `alumnos.txt` contiene `"Ana;7;9\nBob;5;6"`. ¿Qué contendrá `medias.txt`?**

<details>
<summary>🔄 Solución</summary>

`medias.txt` contendrá:

```
Ana: 8.0
Bob: 5.5
```

El `useDelimiter(";|\\R")` corta por `;` o por salto de línea, así que los campos salen limpios: nombre, nota1, nota2. La media de Ana es `(7+9)/2.0 = 8.0`; la de Bob, `(5+6)/2.0 = 5.5`. Fíjate en el `2.0` en vez de `2`: sin el `.0`, `(7+9)/2` haría división entera y daría `8` en vez de `8.0`.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué método de `PrintWriter` te permite formatear con `%d`, `%f`, `%s`?
2. ¿Cómo lees un archivo con `Scanner` en lugar de por teclado?
3. ¿Para qué sirve `useDelimiter(";")`?
4. ¿Qué devuelve `hasNextInt()` cuando el archivo se ha quedado sin números?

<details>
<summary>🔄 Respuestas</summary>

1. `printf()` (o `format()`), igual que `System.out.printf`.
2. `new Scanner(new File("ruta.txt"))` en lugar de `new Scanner(System.in)`.
3. Para cambiar el separador por defecto (espacios) por otro, aquí el `;`. Útil para CSVs.
4. `false`. Por eso el `while (sc.hasNextInt())` se detiene cuando ya no quedan números.

</details>

---

## ✅ Resumen en 3 frases

1. **`PrintWriter`** escribe en archivos con `println`, `print` y `printf`: la comodidad de la consola con destino de archivo.
2. **`Scanner` + `File`** lee archivos a tokens (`nextInt`, `nextLine`), y con **`useDelimiter`** puedes cortar por `;`, comas o lo que necesites.
3. Regla rápida: **`Scanner`** para parsear datos sueltos, **`BufferedReader`** para archivos grandes línea a línea, y ambos dentro de **`try-with-resources`**.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `PrintWriter` | Escritor con `println`/`printf` sobre archivos |
> | `useDelimiter()` | Cambia el separador con el que `Scanner` trocea |
> | Token | Cada pedacito en que `Scanner` corta la entrada |
> | `\\R` | "Cualquier salto de línea" en regex de Java |
> | CSV | Archivo de valores separados por comas (o por `;`) |

📁 [Volver al índice de la unidad](/ApuntesProgramacion/12-ficheros-regex) · **Anterior:** [03 · try-with-resources: cerrar sin llorar](/ApuntesProgramacion/12-ficheros-regex/03-try-with-resources) · **Siguiente:** [05 · NIO: Files y Paths (la forma moderna)](/ApuntesProgramacion/12-ficheros-regex/05-nio-files-paths)