---
title: "02 · Escribir y leer texto: FileWriter, FileReader y BufferedReader"
description: "El lápiz que no olvida y el lector que no se atraganta: escribe archivos con FileWriter y léelos línea a línea con BufferedReader ✍️📖"
---

<p><small>El lápiz que no olvida y el lector que no se atraganta: escribe archivos con FileWriter y léelos línea a línea con BufferedReader ✍️📖</small></p>

> 🗺️ **Estás en:** 📁 **U12 · Ficheros y Expresiones Regulares** → 02 · Escribir y leer texto: FileWriter, FileReader y BufferedReader

---

## 📬 La idea en una frase

> **`FileWriter` es el lápiz que escribe caracteres en un archivo y `FileReader` el lector que los recupera; con `BufferedReader` encima, leer línea a línea es coser y cantar.**

En el punto 1 `File` solo te decía si el archivo existía y cuánto pesaba. Ahora toca lo bueno: **escribir** contenido y **leerlo**. Para escribir tienes `FileWriter`; para leer, `FileReader`. Y si encima envuelves el lector con `BufferedReader`, podrás leer archivos enteros línea a línea sin despeinarte.

---

## ✍️ Escribir con FileWriter

`FileWriter` escribe **caracteres** en un archivo. Si el archivo no existe, lo crea; si existe, lo **sobrescribe** por defecto.

```java
import java.io.FileWriter;
import java.io.IOException;

public class EscribirTexto {
    public static void main(String[] args) throws IOException {
        FileWriter escritor = new FileWriter("salida.txt");
        escritor.write("Primera línea.\n");
        escritor.write("Segunda línea.\n");
        escritor.close();
    }
}
```

¿Quieres **añadir al final** sin borrar lo anterior? Pásale un segundo argumento `true` (modo *append*):

```java
FileWriter writer = new FileWriter("bitacora.txt", true);  // añade al final
```

> ⚠️ **Advertencia:** sin `close()` o `flush()`, los datos se quedan atrapados en el buffer interno y pueden perderse. Es como escribir una carta y no cerrar el sobre: el cartero no la recoge. Lo verás a fondo en el punto 3 con `try-with-resources`.

---

## 📖 Leer con FileReader + BufferedReader

`FileReader` lee caracteres sueltos, que es incómodo. La solución: envuelves el `FileReader` con un `BufferedReader` y usas `readLine()`, que te devuelve una línea entera de golpe (y `null` cuando se acaba el archivo).

```java
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class LeerTexto {
    public static void main(String[] args) throws IOException {
        BufferedReader lector = new BufferedReader(new FileReader("salida.txt"));
        String linea = lector.readLine();
        while (linea != null) {
            System.out.println(linea);
            linea = lector.readLine();
        }
        lector.close();
    }
}
```

El patrón `while ((linea = lector.readLine()) != null)` es el pan de cada día de Java: lee una línea, comprueba que no es `null`, la procesa y repite. Cuando `readLine()` devuelve `null`, el archivo se ha terminado.

> 📝 **Nota:** la lectura con `Scanner` por teclado la viste en la U02 (punto 6). Aquí el `Scanner` reaparece en el punto 4, pero leyendo archivos.

---

## 🚨 ¿Y si el archivo no existe al leer?

Lanzas un `FileReader` sobre un archivo que no existe y... `FileNotFoundException`. Es hija de `IOException`, así que tienes dos caminos:

1. **Declarar** la excepción en la firma: `throws IOException` (lo que hemos hecho arriba).
2. **Capturarla** con `try-catch` y hacer algo sensato, como avisar al usuario:

```java
try {
    BufferedReader lector = new BufferedReader(new FileReader("no_existe.txt"));
    String linea;
    while ((linea = lector.readLine()) != null) {
        System.out.println(linea);
    }
    lector.close();
} catch (IOException e) {
    System.out.println("Error al leer: " + e.getMessage());
}
```

> 💡 **Consejo:** el camino 2 es el profesional: no dejas que el programa muera por un archivo que falta. El camino 1 es rápido para practicar. En el punto 3 verás la combinación definitiva.

---

## 🧱 ¿Y por qué BufferedReader y no FileReader a secas?

`FileReader` te da caracteres de uno en uno. Para leer frases necesitas montar un bucle de acumulación. `BufferedReader` te da **líneas enteras** y además es más rápido en archivos grandes porque **lee en bloques** y guarda lo sobrante en su buffer. El patrón "envolver" (`new BufferedReader(new FileReader(...))`) es típico de Java: una clase que añade superpoderes a otra.

| Tarea | Herramienta |
|---|---|
| Escribir caracteres | `FileWriter` |
| Escribir añadiendo al final | `FileWriter(path, true)` |
| Leer caracteres | `FileReader` |
| Leer líneas enteras (recomendado) | `BufferedReader` envolviendo `FileReader` |
| Formatear y escribir con `println`/`printf` | `PrintWriter` (punto 4) |

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** el trío clásico para leer archivos de texto en Java es `BufferedReader` + `FileReader`. El bucle `while ((linea = lector.readLine()) != null)` es el estándar que verás en miles de proyectos.

**Ejercicio: el contador que no miente**

```java
import java.io.*;

public class ContadorLineas {
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

**¿Qué imprime? ¿Cuenta las líneas de verdad?**

<details>
<summary>🔄 Solución</summary>

Imprime **3**.

El archivo se crea con "linea1", "linea2" y "linea3", cada una con su `\n`. El `readLine()` devuelve cada línea y cuando llega al final devuelve `null`, y ahí se acaba el `while`. El último `\n` no crea una "cuarta línea": `readLine()` devuelve `null` cuando no queda más texto, no una línea vacía.

Detalle fino: el código en el `while` ni siquiera guarda la línea. Solo la descarta (`r.readLine()` a secas) para contar. A veces no necesitas el contenido, solo saber cuántas líneas hay.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué hace `FileWriter` con un archivo que ya existe por defecto?
2. ¿Cómo añades texto al final de un archivo sin borrar lo anterior?
3. ¿Qué devuelve `readLine()` cuando el archivo se ha terminado?
4. ¿Por qué se envuelve `FileReader` con `BufferedReader`?

<details>
<summary>🔄 Respuestas</summary>

1. Lo sobrescribe desde cero.
2. `new FileWriter("bitacora.txt", true)`: el segundo argumento `true` activa el modo *append*.
3. `null`. Por eso el bucle `while ((linea = lector.readLine()) != null)` funciona.
4. Para leer líneas enteras con `readLine()` (y para ser más rápido en archivos grandes gracias a su buffer).

</details>

---

## ✅ Resumen en 3 frases

1. **`FileWriter`** escribe caracteres en un archivo (lo crea si no existe y lo sobrescribe si existe); con el argumento `true` añade al final.
2. **`FileReader`** + **`BufferedReader`** leen archivos de texto línea a línea con `readLine()`, que devuelve `null` al final.
3. Sin `close()` (o `flush()`) los datos se quedan en el buffer: **cierra siempre** o usa `try-with-resources` (punto 3).

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `FileWriter` | Escribe caracteres en un archivo |
> | `FileReader` | Lee caracteres de un archivo |
> | `BufferedReader` | Lector con buffer que permite `readLine()` |
> | `readLine()` | Devuelve la siguiente línea o `null` si no queda ninguna |
> | *Append* | Añadir al final del archivo sin borrar lo anterior |
> | `FileNotFoundException` | Se lanza al leer un archivo que no existe |

📁 [Volver al índice de la unidad](/ApuntesProgramacion/12-ficheros-regex) · **Anterior:** [01 · La clase File: tu explorador de archivos](/ApuntesProgramacion/12-ficheros-regex/01-clase-file) · **Siguiente:** [03 · try-with-resources: cerrar sin llorar](/ApuntesProgramacion/12-ficheros-regex/03-try-with-resources)