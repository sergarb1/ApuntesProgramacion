---
title: "05 · NIO: Files y Paths (la forma moderna)"
description: "Leer, escribir y consultar archivos en una línea: la API NIO llegó para que el viejo File parezca del siglo pasado ⚡🗃️"
---

<p><small>Leer, escribir y consultar archivos en una línea: la API NIO llegó para que el viejo File parezca del siglo pasado ⚡🗃️</small></p>

> 🗺️ **Estás en:** 📁 **U12 · Ficheros y Expresiones Regulares** → 05 · NIO: Files y Paths (la forma moderna)

---

## 📬 La idea en una frase

> **`Path` es la ruta moderna y `Files` su navaja suiza: `readAllLines`, `write`, `readString`... cosas que con `File` costaban cinco líneas y con NIO son una.**

Desde Java 7 existe la API **NIO** (New I/O) en `java.nio.file`. Es el reemplazo moderno de la clase `File`: `Path` para representar rutas y `Files` para hacer todo lo demás. ¿Leer un archivo entero en una lista de líneas? Una línea de código. ¿Escribir una lista en un archivo? Otra. El viejo `File` sigue funcionando, pero cuando veas esto ya no querrás volver.

---

## 🗃️ Path y Paths: el nuevo File

`Path` es la ruta (como `File`, pero más ligera y pensada para componerse). Se crea con la clase `Paths`:

```java
import java.nio.file.Path;
import java.nio.file.Paths;

Path ruta = Paths.get("C:/datos/notas.txt");
Path relativa = Paths.get("notas.txt");              // relativa al directorio de trabajo
Path combinada = Paths.get("datos", "sub", "f.txt"); // con separadores a prueba de SO
```

`Paths.get(...)` con varios argumentos construye la ruta usando el separador del sistema operativo (en Windows `\`, en Linux `/`). Es la forma de no liarte con barras.

> 💡 **Consejo:** los métodos de `Path` (`getFileName()`, `getParent()`, `exists()`, `isDirectory()`...) son los mismos conceptos de `File`. La diferencia grande está en `Files`, la clase estática que hace el trabajo pesado.

---

## ⚡ Files: la navaja suiza

La clase estática `Files` es donde vive la magia. Estos son los métodos que usarás el 90% del tiempo:

```java
import java.nio.file.*;
import java.util.List;

public class NioFacil {
    public static void main(String[] args) throws Exception {
        Path ruta = Paths.get("notas.txt");

        // Escribir una lista de líneas (sobrescribe)
        Files.write(ruta, List.of("Línea 1", "Línea 2", "Línea 3"));

        // Leer todo el archivo en una lista de líneas
        List<String> lineas = Files.readAllLines(ruta);
        for (String linea : lineas) {
            System.out.println(linea);
        }

        // Leer todo el archivo como un único String
        String contenido = Files.readString(ruta);

        // Otras consultas útiles
        System.out.println("¿Existe? " + Files.exists(ruta));
        System.out.println("¿Es archivo? " + Files.isRegularFile(ruta));
        System.out.println("Tamaño: " + Files.size(ruta) + " bytes");
    }
}
```

> ⚠️ **Advertencia:** `Files.write` y `readAllLines` cargan el archivo entero en memoria. Para archivos gigantes usa `Files.newBufferedReader(ruta)` (como en el punto 2, pero sin `FileReader` en medio) y lee línea a línea.

---

## 📋 Otras joyas de Files

| Método | Qué hace |
|---|---|
| `Files.readAllLines(ruta)` | Todo el archivo como `List<String>` |
| `Files.write(ruta, lista)` | Escribe una lista de líneas (sobrescribe) |
| `Files.readString(ruta)` | Todo el archivo como un único `String` |
| `Files.writeString(ruta, texto)` | Escribe un `String` |
| `Files.newBufferedReader(ruta)` | `BufferedReader` directo sobre un `Path` |
| `Files.newBufferedWriter(ruta)` | `BufferedWriter` directo sobre un `Path` |
| `Files.copy(origen, destino)` | Copia un archivo |
| `Files.move(origen, destino)` | Mueve (o renombra) |
| `Files.delete(ruta)` | Borra (lanza excepción si no existe) |
| `Files.deleteIfExists(ruta)` | Borra si existe, sin excepción |
| `Files.walk(ruta)` | Recorre recursivamente todo un árbol de archivos |
| `Files.lines(ruta)` | Un `Stream<String>` línea a línea (para archivos grandes) |

La pareja `Files.walk` + filtro es la forma elegante de "busca todos los `.java` en una carpeta y sus subcarpetas":

```java
import java.nio.file.*;
import java.util.stream.Stream;

try (Stream<Path> rutas = Files.walk(Paths.get("src"))) {
    rutas.filter(p -> p.toString().endsWith(".java"))
         .forEach(System.out::println);
}
```

> 📝 **Nota:** no pasa nada si el `Stream` te abruma: es la U05 con esteroides. Lo importante ahora es el patrón: `Files.walk` te da todas las rutas y tú filtras la que te interesa.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** NIO usa `Path` y `Files`. Son más modernos y tienen métodos útiles como `Files.walk()` para recorrer árboles. Cuando veas código nuevo de Java, el 80% de las veces usa NIO.

**Ejercicio: Be the NIO**

```java
import java.nio.file.*;
import java.util.*;

public class BeTheNIO {
    public static void main(String[] args) throws Exception {
        Path p = Paths.get("nums.txt");
        Files.write(p, List.of("3", "7", "2", "9", "5"));
        List<String> l = Files.readAllLines(p);
        int suma = 0;
        for (String s : l) {
            suma += Integer.parseInt(s);
        }
        Files.write(p, List.of("Total: " + suma));
        System.out.println(Files.readString(p));
    }
}
```

**¿Qué imprime?**

<details>
<summary>🔄 Solución</summary>

Imprime **`Total: 26`**.

Paso a paso:
1. `Files.write` crea `nums.txt` con las líneas `3`, `7`, `2`, `9`, `5`.
2. `readAllLines` las lee y el bucle las convierte a `int` y las suma: `3+7+2+9+5 = 26`.
3. `Files.write` **sobrescribe** el archivo con una sola línea: `Total: 26`.
4. `Files.readString` lee todo el archivo y `println` lo imprime: `Total: 26`.

Fíjate en que el segundo `Files.write` no añade: sobrescribe. Si quisieras añadir, tendrías `Files.write(p, lista, StandardOpenOption.APPEND)`.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Con qué clase creas un `Path`?
2. ¿Qué método de `Files` lee un archivo entero como `List<String>`?
3. ¿Qué método de `Files` recorre un árbol de carpetas recursivamente?
4. ¿`Files.write` añade al final o sobrescribe?

<details>
<summary>🔄 Respuestas</summary>

1. Con `Paths` (`Paths.get(...)`). El plural tiene razón de ser: `Path` es la ruta, `Paths` la fábrica.
2. `Files.readAllLines(ruta)`.
3. `Files.walk(ruta)`, que devuelve un `Stream<Path>` con todo lo que hay debajo.
4. Sobrescribe. Para añadir, `Files.write(ruta, lista, StandardOpenOption.APPEND)`.

</details>

---

## ✅ Resumen en 3 frases

1. **`Path`** (creado con `Paths.get`) es la ruta moderna y **`Files`** la clase estática que hace el trabajo: `readAllLines`, `write`, `readString`, `copy`, `move`, `delete`, `walk`.
2. Leer o escribir un archivo completo son **operaciones de una línea**, sin `close()` porque NIO se encarga.
3. `Files` carga todo en memoria: para archivos enormes usa `Files.newBufferedReader` o `Files.lines` y procesa en streaming.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | NIO | "New I/O": la API moderna de entrada/salida de `java.nio.file` |
> | `Path` | La ruta moderna (el `File` nuevo) |
> | `Paths` | Fábrica de `Path` |
> | `Files` | Clase estática con las operaciones sobre rutas |
> | `Stream` | Secuencia de datos sobre la que puedes filtrar, transformar y recorrer |

📁 [Volver al índice de la unidad](/ApuntesProgramacion/12-ficheros-regex) · **Anterior:** [04 · PrintWriter y Scanner + File](/ApuntesProgramacion/12-ficheros-regex/04-printwriter-scanner-file) · **Siguiente:** [06 · Serialización: guardar objetos con ObjectOutputStream](/ApuntesProgramacion/12-ficheros-regex/06-serializacion)