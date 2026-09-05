---
title: "01 · La clase File: tu explorador de archivos"
description: "El GPS que localiza archivos sin leer su contenido: existe, es archivo, es carpeta, cuánto pesa y qué hay dentro 🗂️📍"
---

<p><small>El GPS que localiza archivos sin leer su contenido: existe, es archivo, es carpeta, cuánto pesa y qué hay dentro 🗂️📍</small></p>

> 🗺️ **Estás en:** 📁 **U12 · Ficheros y Expresiones Regulares** → 01 · La clase File: tu explorador de archivos

---

## 📬 La idea en una frase

> **`File` no es el contenido de un archivo: es la tarjeta de visita que te dice dónde está, cómo se llama, cuánto pesa y si existe. Antes de leer o escribir, pregúntale al GPS.**

En la U11 guardabas tus datos en memoria: listas, mapas, objetos... todo vivo mientras el programa corre. Pero ¿y si quieres saber si un archivo existe antes de abrirlo? ¿Y si necesitas recorrer las carpetas de tu disco? Ahí entra la clase `File`. No lee ni escribe nada: solo explora y describe. Es el portero del edificio de los ficheros.

---

## 🗂️ File: el GPS de tus archivos

La clase `File` (en `java.io`) representa una **ruta** en tu sistema: un archivo o una carpeta. Lo más importante que debes grabar a fuego: **`new File("ruta")` no crea nada**. Solo crea el objeto que representa esa ruta. Crear el archivo de verdad es otra historia (lo verás en el punto 2).

```java
import java.io.File;

File f = new File("C:/datos/notas.txt");
System.out.println("¿Existe? " + f.exists());            // true o false
System.out.println("¿Es archivo? " + f.isFile());        // ¿es un fichero y no una carpeta?
System.out.println("¿Es carpeta? " + f.isDirectory());   // ¿es un directorio?
System.out.println("Tamaño: " + f.length() + " bytes");  // peso en bytes
System.out.println("Ruta absoluta: " + f.getAbsolutePath()); // la dirección completa
System.out.println("Nombre: " + f.getName());            // solo el nombre con extensión
```

> 💡 **Consejo:** en Windows usa `/` o `\\`. Escribe `"C:/datos/notas.txt"` o `"C:\\datos\\notas.txt"`. Con una sola `\` Java cree que empiezas un carácter especial (`\n`, `\t`...) y te vas a liar. Esto se pone interesante con las regex en el punto 7: las contrabarras se duplican por todas partes.

### El repertorio imprescindible

| Método | Qué te dice |
|---|---|
| `exists()` | ¿Existe la ruta? |
| `isFile()` | ¿Es un archivo (y no una carpeta)? |
| `isDirectory()` | ¿Es una carpeta? |
| `length()` | Tamaño en bytes |
| `getName()` | Nombre del archivo (sin la ruta) |
| `getAbsolutePath()` | Ruta completa |
| `getParent()` | La carpeta que lo contiene |
| `listFiles()` | Los archivos y carpetas que hay dentro (si es un directorio) |
| `createNewFile()` | Crea el archivo vacío (devuelve `false` si ya existe) |
| `mkdir()` / `mkdirs()` | Crea la carpeta (con `mkdirs`, crea también las intermedias) |

> ⚠️ **Advertencia:** `File` **no lee contenido**. Le preguntas *"¿existe? ¿cuánto pesa? ¿es carpeta?"* y te contesta. Para leer lo de dentro, ya llegarán `FileReader`, `BufferedReader`, `Scanner` y `Files.readAllLines()` en los próximos puntos. Cada uno a su oficio.

---

## 📁 Recorrer una carpeta con listFiles

`listFiles()` te devuelve un array con todo lo que hay dentro de una carpeta. Perfecto para el "explorador de archivos" casero:

```java
import java.io.File;

public class Explorador {
    public static void main(String[] args) {
        File carpeta = new File("C:/datos");
        if (carpeta.exists() && carpeta.isDirectory()) {
            File[] contenidos = carpeta.listFiles();
            for (File item : contenidos) {
                String tipo = item.isDirectory() ? "[CARPETA] " : "[ARCHIVO] ";
                System.out.println(tipo + item.getName() + " (" + item.length() + " bytes)");
            }
        } else {
            System.out.println("Esa ruta no es una carpeta existente.");
        }
    }
}
```

Recuerda comprobar `exists()` e `isDirectory()` antes de `listFiles()`: si la ruta no existe, `listFiles()` devuelve `null` y el `for-each` te estalla en la cara.

---

## 📝 La ruta no es el contenido

Un error típico de novato es creer que `new File("notas.txt")` "crea" el archivo o que al construir un `File` ya "lees" algo. No:

```java
File f = new File("notas.txt");   // Solo representa la ruta. No existe nada nuevo en disco.
boolean creado = f.createNewFile();  // ESTO sí intenta crearlo. Devuelve false si ya existía.
```

`createNewFile()` crea un archivo **vacío** y devuelve `true` si lo ha creado, o `false` si ya existía. Si la carpeta no existe, lanza `IOException`. El patrón habitual: comprueba `exists()` antes de decidir qué hacer.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** File representa rutas, no contenido. Para leer el contenido usa `Scanner`, `BufferedReader` o `Files.readAllLines()`. El GPS no te cuenta lo que hay dentro del edificio: solo te lleva a la puerta.

**Ejercicio: el detective de archivos**

```java
import java.io.*;

public class DetectiveDeArchivos {
    public static void main(String[] args) throws IOException {
        File f = new File("misterio.txt");
        if (!f.exists()) {
            System.out.println("Creando archivo...");
            FileWriter w = new FileWriter(f);
            w.write("Tres\npalabras\nmisteriosas\n");
            w.close();
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

**¿Qué imprime la PRIMERA vez? ¿Y la SEGUNDA vez (cuando el archivo ya existe)?**

<details>
<summary>🔄 Solución</summary>

La **primera** vez: el archivo no existe, así que se crea con las palabras "Tres", "palabras" y "misteriosas". Luego se lee y se concatena **al revés**: `misteriosas palabras Tres`.

La **segunda** vez: el archivo ya existe (`exists()` es `true`), así que no se recrea y se lee lo mismo → vuelve a imprimir `misteriosas palabras Tres`.

La trampa está en el `if (!f.exists())`: la primera ejecución "crea el archivo", pero las siguientes no. El contenido no cambia nunca, así que la salida es siempre la misma.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Crea algo `new File("notas.txt")` en el disco?
2. ¿Qué método devuelve `true` si una ruta es una carpeta?
3. ¿Qué devuelve `createNewFile()` si el archivo ya existe?
4. ¿Para qué sirve `length()`?

<details>
<summary>🔄 Respuestas</summary>

1. No. Solo crea un objeto que representa la ruta. Para crear el archivo, `createNewFile()` (o un `FileWriter`, punto 2).
2. `isDirectory()`.
3. `false` (el archivo ya existía, no ha creado nada nuevo).
4. Para saber el tamaño del archivo en bytes. Sirve para decidir si te da pereza leerlo entero.

</details>

---

## ✅ Resumen en 3 frases

1. **`File`** es un GPS de rutas: te dice si existen, si son archivo o carpeta, cuánto pesan y qué contienen (`listFiles()`), pero **no lee contenido**.
2. `new File("ruta")` **no crea nada**: crea el objeto que representa la ruta. Para crear, `createNewFile()`, `mkdir()`/`mkdirs()` o un `FileWriter`.
3. Antes de operar con una ruta, comprueba `exists()` e `isFile()`/`isDirectory()`: los métodos devuelven `false` o `null` si la ruta no es la esperada.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `File` | Objeto que representa una ruta (archivo o carpeta) en el sistema |
> | Ruta | La "dirección" de un archivo: `C:/datos/notas.txt` |
> | Ruta relativa | Dirección desde el directorio de trabajo (`"notas.txt"`) |
> | Ruta absoluta | Dirección completa desde la raíz del disco |
> | `listFiles()` | Devuelve los archivos/carpetas que hay dentro de un directorio |

📁 [Volver al índice de la unidad](/ApuntesProgramacion/12-ficheros-regex) · **Anterior:** — · **Siguiente:** [02 · Escribir y leer texto: FileWriter, FileReader y BufferedReader](/ApuntesProgramacion/12-ficheros-regex/02-escribir-leer-texto)