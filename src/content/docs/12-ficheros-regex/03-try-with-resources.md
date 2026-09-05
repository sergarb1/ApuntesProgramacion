---
title: "03 · try-with-resources: cerrar sin llorar"
description: "La puerta que se cierra sola: deja que Java llame a close() por ti, aunque salte una excepción en mitad del camino 🔒🚪"
---

<p><small>La puerta que se cierra sola: deja que Java llame a close() por ti, aunque salte una excepción en mitad del camino 🔒🚪</small></p>

> 🗺️ **Estás en:** 📁 **U12 · Ficheros y Expresiones Regulares** → 03 · try-with-resources: cerrar sin llorar

---

## 📬 La idea en una frase

> **En vez de acordarte de cerrar cada archivo, le dices a Java "cierra esto cuando acabes, pase lo que pase" y él lo hace solo.**

En el punto 2 viste que sin `close()` los datos pueden perderse. Pero acordarte de cerrar, y encima cuando hay excepciones por el medio, es un dolor. Desde Java 7 existe el `try-with-resources`: abres los recursos dentro de los paréntesis del `try` y Java los cierra automáticamente al salir del bloque, tanto si todo va bien como si salta una excepción.

---

## 🔒 El try-with-resources en acción

Mira qué limpio queda el lector del punto 2 sin `close()` manual:

```java
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class LectorLimpio {
    public static void main(String[] args) {
        try (BufferedReader br = new BufferedReader(new FileReader("salida.txt"))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                System.out.println(linea);
            }
        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }
        // No hay br.close(). Se cierra solo.
    }
}
```

Lo que pasa por debajo: al salir del bloque `try` (con éxito o con excepción), Java llama a `close()` sobre cada recurso que declaraste entre paréntesis. Es el `finally` que te ahorra escribir.

> 💡 **Consejo:** fíjate que el `catch` sigue existiendo. El `try-with-resources` cierra los recursos, pero no traga las excepciones: tú decides cómo gestionarlas.

---

## 🧹 Varios recursos a la vez

¿Leer de un archivo y escribir en otro? Declara los dos recursos separados por `;` y Java los cierra **en orden inverso** al declararlos:

```java
import java.io.*;

public class Copiador {
    public static void main(String[] args) {
        try (BufferedReader br = new BufferedReader(new FileReader("origen.txt"));
             PrintWriter pw = new PrintWriter(new FileWriter("copia.txt"))) {

            String linea;
            while ((linea = br.readLine()) != null) {
                pw.println(linea);
            }
            System.out.println("Copia terminada.");
        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
```

Es el patrón estándar para copiar archivos: lee línea a línea y escríbela en el destino. Y si uno de los dos no se puede abrir, no pasa nada: Java intenta cerrar los que sí se abrieron.

---

## 🤔 ¿Qué recursos valen?

Solo valen los que implementan `AutoCloseable` (o su hija `Closeable`). Las clases de ficheros que hemos visto (`FileReader`, `FileWriter`, `BufferedReader`, `PrintWriter`, `ObjectInputStream`...) la implementan. En general: si la clase tiene `close()`, casi seguro sirve.

> ⚠️ **Advertencia:** `Scanner` también es `AutoCloseable`, así que puedes hacer `try (Scanner sc = new Scanner(new File(...)))`. Ojo, no lo uses para cerrar un `Scanner` que lee del teclado en un programa largo: al cerrarlo, cierras también la entrada estándar y a partir de ahí todo `nextLine()` te da errores. Para el teclado, un `Scanner` normal y un `close()` al final.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `try-with-resources` no es solo para ficheros: sirve para cualquier recurso que haya que liberar. Si tu clase necesita limpiarse al terminar, que implemente `AutoCloseable` y la metes entre los paréntesis.

**Ejercicio: el diario que no olvida (modo append)**

```java
import java.io.*;
import java.time.LocalDate;

public class Diario {
    public static void main(String[] args) {
        try (FileWriter fw = new FileWriter("diario.txt", true)) {
            fw.write(LocalDate.now() + ": Hoy he aprendido try-with-resources.\n");
        } catch (IOException e) {
            System.out.println("No pude escribir el diario: " + e.getMessage());
        }
    }
}
```

**¿Qué pasa si ejecutas el programa dos veces? ¿Y qué hace el `LocalDate.now()`?**

<details>
<summary>🔄 Solución</summary>

Ejecutado **dos veces**, el archivo `diario.txt` tendrá **dos líneas** con la fecha de hoy. El modo *append* (`true`) añade al final sin borrar lo anterior, así que cada ejecución suma una entrada. Perfecto para un diario de verdad.

`LocalDate.now()` devuelve la fecha actual del sistema (por ejemplo, `2026-09-06`), en formato ISO. Es la forma moderna de pedir "qué día es hoy" sin liarte con `Date` y `Calendar`.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué hace Java al salir del bloque de un `try-with-resources`?
2. ¿En qué orden se cierran varios recursos declarados en el `try`?
3. ¿Qué interfaz debe implementar un recurso para poder usarlo en `try-with-resources`?
4. ¿El `try-with-resources` elimina la necesidad de `catch`?

<details>
<summary>🔄 Respuestas</summary>

1. Llama a `close()` sobre todos los recursos declarados, tanto si todo fue bien como si hubo excepción.
2. En orden inverso al que se declararon.
3. `AutoCloseable` (o su subinterfaz `Closeable`).
4. No. El `try-with-resources` cierra los recursos, pero las excepciones hay que capturarlas o declararlas igualmente.

</details>

---

## ✅ Resumen en 3 frases

1. **`try-with-resources`** declara los recursos entre paréntesis del `try` y Java los cierra solo al salir, con éxito o con excepción: adiós al `close()` olvidado.
2. Puedes abrir **varios recursos a la vez** (separados por `;`) y se cierran en orden inverso.
3. Solo valen recursos que implementen **`AutoCloseable`**/**`Closeable`**, que es el caso de todas las clases de ficheros de Java.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `try-with-resources` | Bloque `try` que cierra sus recursos automáticamente |
> | `AutoCloseable` | Interfaz con `close()` que marca un recurso como "liberable" |
> | `Closeable` | Subinterfaz de `AutoCloseable`, la que usan los streams clásicos |
> | Recurso | Algo que se debe liberar: archivo, conexión, scanner... |
> | *Append* | Añadir al final de un archivo (segundo argumento `true` de `FileWriter`) |

📁 [Volver al índice de la unidad](/ApuntesProgramacion/12-ficheros-regex) · **Anterior:** [02 · Escribir y leer texto: FileWriter, FileReader y BufferedReader](/ApuntesProgramacion/12-ficheros-regex/02-escribir-leer-texto) · **Siguiente:** [04 · PrintWriter y Scanner + File](/ApuntesProgramacion/12-ficheros-regex/04-printwriter-scanner-file)