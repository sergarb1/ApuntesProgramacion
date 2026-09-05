---
title: "09 · Repaso interactivo: domina ficheros y regex"
description: "El cierre práctico de la unidad, con un close() que va a doler, una regex que va a fallar y un objeto que va a viajar en el tiempo 😈"
---

<p><small>El cierre práctico de la unidad, con un close() que va a doler, una regex que va a fallar y un objeto que va a viajar en el tiempo 😈</small></p>

> 🗺️ **Estás en:** 📁 **U12 · Ficheros y Expresiones Regulares** → 09 · Repaso interactivo

---

## 📬 La idea en una frase

> **En este punto no aprendemos nada nuevo: lo convertimos todo en práctica. Y, como siempre, algo no va a funcionar.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaban de darte este programa para ejecutar:*

```java
import java.io.*;
import java.util.regex.*;

public class Misterio {
    public static void main(String[] args) throws Exception {
        File f = new File("datos.txt");
        if (!f.exists()) {
            FileWriter w = new FileWriter(f);
            w.write("Ana;20\nBob;35\nCarla;28");
            w.close();
        }

        Pattern patron = Pattern.compile("(\\w+);(\\d+)");
        BufferedReader r = new BufferedReader(new FileReader(f));
        String linea;
        int suma = 0;
        while ((linea = r.readLine()) != null) {
            Matcher m = patron.matcher(linea);
            if (m.matches()) {
                suma += Integer.parseInt(m.group(2));
            }
        }
        r.close();
        System.out.println("Suma: " + suma);
    }
}
```

**¿Qué imprimes por pantalla? Elige sabiamente:**

1. **`Suma: 83`** → La regex captura nombre y edad, y se suman 20 + 35 + 28. ✅
2. **`Suma: 0`** → `m.matches()` no encuentra nada porque el patrón no cuadra con las líneas. ❌
3. **`Suma: 83` pero solo la primera vez** → El archivo se crea la primera ejecución, pero la suma es la misma siempre. ❌

> <details>
> <summary>🔄 Solución</summary>
>
> La opción **1**. El archivo se crea con tres líneas del formato `Nombre;edad`. La regex `(\\w+);(\\d+)` captura el nombre (grupo 1) y la edad (grupo 2), y como `matches()` exige que **toda** la línea cuadre (y cuadra), suma `20 + 35 + 28 = 83`. Da igual cuántas veces lo ejecutes: el archivo ya existe y la salida es siempre la misma.
>
> </details>

---

## 🔥 Fireside Chat: File vs Path

> *Dos generaciones de la API de ficheros se encuentran frente a la máquina de café.*

**File:** — Llevo aquí desde Java 1.0. Toda una vida localizando archivos: `exists()`, `isFile()`, `length()`... Soy el clásico.

**Path:** — Y yo llegué en Java 7 con toda la modernidad: `Paths.get(...)`, y mi compañero `Files` hace `readAllLines`, `write` y `readString` en una línea.

**File:** — ¿Y para qué me necesitas a mí entonces? Vamos a ver, yo tengo `listFiles()` para recorrer carpetas.

**Path:** — Yo tengo `Files.walk()` que recorre **árboles enteros** recursivamente y te los da en un `Stream`. Con filtro, encima.

**File:** — Vale, pero sigues dependiendo de mí en algunos sitios... y de `FileReader`, `FileWriter` y compañía para leer y escribir.

**Path:** — Cierto, el trío `FileWriter`/`FileReader`/`BufferedReader` es eterno y funciona de maravilla. La familia de `java.io` no va a desaparecer. Pero para lo moderno, `Files` y `Paths` son mi liga.

> La lección: **`java.io` (File, FileReader, FileWriter, BufferedReader) sigue siendo válida y la usarás toda tu vida. `java.nio.file` (Paths, Files) es la forma moderna y preferida en código nuevo.** Saber las dos te hace flexible; saber solo una, limitado.

---

## 🕵️ ¿Quién soy?

Adivina qué concepto de la unidad soy:

1. **Soy el GPS que localiza archivos, pero no leo contenido.**
2. **Soy el lector que te da líneas enteras y nunca se atraganta.**
3. **Soy el bloque que cierra los archivos por ti, pase lo que pase.**
4. **Soy la interfaz-marca que permite guardar un objeto en un archivo.**
5. **Soy el molde compilado de una expresión regular.**
6. **Soy el método que exige que TODO el string cumpla el patrón.**

<details>
<summary>🔄 Respuestas</summary>

1. **`File`** — representa rutas, no contenido.
2. **`BufferedReader`** — `readLine()` sin parpadeos.
3. **`try-with-resources`** — cierra automáticamente al salir del bloque.
4. **`Serializable`** — sin métodos, solo la marca para congelar objetos.
5. **`Pattern`** — la regex compilada; `Matcher` es quien busca.
6. **`matches()`** — del `String`, valida todo el texto.

</details>

---

## 🤬 CONRAD VS EL MUNDO: "No cerré el archivo"

> *CONRAD, nuestro compilador cascarrabias, opina sobre los clásicos del novato.*

**CONRAD:** — ¡OTRA VEZ! Llega un alumno y me dice: *CONRAD, mi archivo se ha quedado a medias*. Y yo: vale, ¿a ver tu código? *Pues mira, escribo con FileWriter...* ¡Y NO CIERRAS! ¡Claro que se queda a medias! Los datos viven en el buffer hasta que llega el `close()`. ¿Te gusta escribir cartas y no cerrar el sobre? Pues eso. Desde Java 7 tienes `try-with-resources` para cerrar sin llorar. ¡ÚSALO!

*Y luego está el de la regex.* Escribe `"abc123".matches("\\d+")` y se sorprende de que dé `false`. ¡Pero si hay letras por el medio! `matches()` exige que TODO el string sean dígitos. Para buscar subcadenas, `find()`. ¡Lleva toda la unidad diciéndolo!

*Y el de la serialización:* guarda un objeto, cambia la clase añadiendo un campo, y se queja de que al leerle salta `InvalidClassException`. ¡Pues claro! Pusiste el `serialVersionUID` y se lo agradeciste con una mala cara... Pónselo fijo y deja de llorar.

**La lección:** el trío sagrado de la unidad: **¿cierro los recursos con `try-with-resources`? ¿uso `find()` para buscar y `matches()` solo para validar todo el string? ¿mi clase tiene `Serializable` y un `serialVersionUID` fijo?** El 90% de los sustos de esta unidad se arreglan con esas tres preguntas. El compilador no te odia: te está pasando las respuestas del examen.

---

## 🎮 El juego de las decisiones

Elige la respuesta correcta para cada decisión (respuestas al final):

1. `new File("notas.txt")` ... ¿qué hace en el disco?
   - a) Crea el archivo vacío   b) Nada, solo representa la ruta
2. ¿Qué método de `String` devuelve `true` solo si TODO el texto es un correo válido?
   - a) `matches()`   b) `find()`
3. ¿Qué lanza leer con `FileReader` un archivo que no existe?
   - a) `FileNotFoundException`   b) `NullPointerException`
4. ¿Qué método de `Files` (NIO) lee un archivo completo como `List<String>`?
   - a) `Files.readAllLines()`   b) `Files.readString()`
5. Para añadir al final de un archivo con `FileWriter` sin borrar lo anterior...
   - a) `new FileWriter("f.txt", true)`   b) `new FileWriter("f.txt", false)`

<details>
<summary>🔄 Soluciones</summary>

1. **b)** — `new File("ruta")` no crea nada: solo el objeto que representa la ruta. Para crear, `createNewFile()` o un `FileWriter`.
2. **a)** — `matches()` valida el string entero. `find()` busca subcadenas dentro del texto.
3. **a)** — `FileNotFoundException`, una hija de `IOException`.
4. **a)** — `readAllLines` devuelve `List<String>`; `readString` devuelve un único `String`.
5. **a)** — el segundo argumento `true` activa el modo *append*.

</details>

---

## ⚡ Laboratorio de tortura: el validador que no valida

> **Duración estimada:** 30 minutos
> **Herramienta:** tu IDE y un archivo nuevo

**El escenario:** copia este programa y haz que funcione. Te dicen que tiene **2 errores de compilación y 1 error de lógica**... pero, ¿y si te lo dicen mal? Tu tarea: hacer que compile, que ejecute y que **toda** la salida sea correcta, contando tú los errores reales.

```java
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validador {
    public static void main(String[] args) {
        String[] correos = {"ana@example.com", "bob@@example", "carla@site.es"};

        Pattern patron = Pattern.compile("[\\w.]+@[\\w.]+\\.[a-z]{2,}")

        int validos = 0;
        for (String c : correos) {
            Matcher m = patron.matcher(c);
            if (m.find()) {
                System.out.println(c + " → válido");
                validos++;
            } else {
                System.out.println(c + " → inválido");
            }
        }
        System.out.println("Válidos: " + validos)
    }
}
```

**Fallo intencionado:** el número de errores del enunciado está mal a propósito. La trampa es tu confianza en el enunciado.

**Tu tarea:** conseguir que compile, que ejecute y que **toda** la salida sea correcta. Si el resultado no cuadra, diagnostica.

**Pistas para cuando te frustres (no antes):**

1. ¿Compila? *no → mira los `;` y los imports.*
   <details><summary>¿Y si sigo atascado?</summary>Falta un `;` tras el `Pattern.compile(...)` y otro al final del `println`. Los imports están bien.</details>
2. ¿Ya compila? *entonces mira el resultado.*
   <details><summary>¿Y si sigo atascado?</summary>El código usa `find()`. ¿Cuantos correos crees que deberían pasar la validación? Vuelve a mirar qué significa `find()` frente a `matches()`.</details>
3. ¿Crees que hay un error de lógica? *Vuelve a leer el código con calma y no te fíes del enunciado.*
   <details><summary>Solución final</summary>

Los **errores de compilación**:

1. Falta el `;` al final de `Pattern.compile("[\\w.]+@[\\w.]+\\.[a-z]{2,}")`.
2. Falta el `;` al final del `System.out.println("Válidos: " + validos)`.

El **error de lógica**: no existe. El enunciado decía "2 errores de compilación y 1 de lógica", pero solo hay 2 faltas de `;` y ninguna lógica rota. Esa era la trampa: tu confianza en el enunciado.

Salida correcta:

```
ana@example.com → válido
bob@@example → inválido
carla@site.es → válido
Válidos: 2
```

Con `find()`, "bob@@example" NO pasa: el patrón `[\\w.]+@[\\w.]+\\.[a-z]{2,}` necesita letras, una `@`, más letras, un punto y al menos dos letras. "bob@@example" tiene dos `@` seguidas y ningún punto, así que no hay subcadena que cumpla el patrón.

La lección real: **lee el código, no el enunciado**. Cuenta, verifica y confía en el compilador, no en la leyenda.

   </details>

---

## 🏆 Logros de esta unidad

| Logro | Cómo conseguirlo |
|---|---|
| 🏅 **El Explorador** | Listar el contenido de una carpeta con `File.listFiles()` distinguiendo archivos y carpetas |
| 🏅 **El Copión** | Copiar un archivo de texto línea a línea con `BufferedReader` + `PrintWriter` y `try-with-resources` |
| 🏅 **El Sargento** | Formatear una tabla alineada en un archivo con `PrintWriter.printf` |
| 🏅 **El Maletero** | Guardar y recuperar una `ArrayList` de objetos con la serialización |
| 🏅 **El Detective** | Extraer nivel, fecha y mensaje de un log con una regex y grupos de captura |
| 🏅 **El Portero** | Validar correos, DNIs o teléfonos con `matches()` y patrones compilados |

---

## 🧠 Atrévete a pensar

1. **Sin ejecutar:** ¿qué imprime este programa?

```java
import java.io.*;

public class Acertijo {
    public static void main(String[] args) throws Exception {
        try (FileWriter fw = new FileWriter("nums.txt")) {
            fw.write("5\n10\n15\n");
        }
        try (BufferedReader br = new BufferedReader(new FileReader("nums.txt"))) {
            int suma = 0;
            String linea;
            while ((linea = br.readLine()) != null) {
                suma += Integer.parseInt(linea);
            }
            System.out.println(suma);
        }
    }
}
```

2. **El limpiador:** tienes `String texto = "Hola    mundo    Java"` y quieres dejarlo en una sola línea de `String[]` con las tres palabras. ¿Qué escribes?
3. **El detective del log:** una línea de log es `[ERROR] 2026-09-06 10:30:45 - Conexión fallida: server=db01`. ¿Qué grupo captura `server=db01` con el patrón del punto 8? ¿Coincide con `matches()` o solo con `find()`?
4. **Verdadero o falso:** "`Files.readAllLines` es la mejor opción para un archivo de 2 GB".

<details>
<summary>💡 Soluciones</summary>

1. **`30`**. `5 + 10 + 15`. El `try-with-resources` del `FileWriter` escribe las tres líneas y cierra; el del `BufferedReader` las lee y suma. Fíjate que el `FileWriter` sin `try-with-resources` habría podido dejarte la mitad sin escribir.
2. `texto.split("\\s+")` → `["Hola", "mundo", "Java"]`. El `\\s+` corta por "uno o más espacios", justo lo que sobraba.
3. `server=db01` está en el **grupo 4** (`(.*)`, "todo lo que quede"). Y ojo: con `matches()` no coincidiría porque el patrón espera `[NIVEL]` al principio... ¡pero la línea SÍ empieza por `[ERROR]`! Aun así, `matches()` exige que la **línea entera** cuadre con el patrón completo (que lo hace). En realidad aquí cuadraría; la diferencia con `find()` es que `find()` no requiere empezar por el principio del texto. Recuerda: `matches()` = patrón completo, `find()` = búsqueda de subcadena.
4. **Falso.** `readAllLines` carga todo en memoria. Para 2 GB usa `BufferedReader` o `Files.lines(...)` y procesa en streaming, línea a línea.

</details>

---

## 🧩 Crucigrama de bits

```
Horizontal:
1. Interfaz-marca para guardar objetos en archivos (11 letras)
3. Método de String que valida que TODO el texto cumpla el patrón (7 letras)
5. Clase que envuelve FileReader para leer líneas enteras (15 letras)
6. API moderna de ficheros: Files y Paths (3 letras)
7. Lo que devuelve readLine() cuando se acaba el archivo (4 letras)

Vertical:
2. Bloque que cierra recursos automáticamente (16 letras)
4. Clase que representa una ruta sin leer contenido (4 letras)
```

<details>
<summary>📝 Soluciones</summary>

**Horizontal:** 1. SERIALIZABLE · 3. MATCHES · 5. BUFFEREDREADER · 6. NIO · 7. NULL
**Vertical:** 2. TRYWITHRESOURCES · 4. FILE

</details>

---

## 💬 Preguntas de entrevista de trabajo

> Preguntas reales que te harían para programador Java junior.

1. **"Explícame, como si yo fuera tu abuela, la diferencia entre `File`, `FileReader` y `FileWriter`."**
2. **"¿Qué es `try-with-resources` y por qué deberías usarlo siempre con ficheros?"**
3. **"¿Cuál es la diferencia entre `find()` y `matches()` en una regex?"**
4. **"¿Cómo guardarías y recuperarías una lista de objetos en un archivo?"**
5. **"¿Qué es el 'infierno de las contrabarras' en las regex de Java?"**
6. **"¿Cuándo usarías `BufferedReader` en vez de `Scanner`, y al revés?"**

---

## 🤷 No hay preguntas tontas

> ❓ **¿`File` y `Path` son lo mismo?**

Casi. Ambos representan rutas. `File` es de la API antigua (`java.io`) y `Path` de la moderna (`java.nio.file`). `Path` + `Files` es lo recomendado en código nuevo, pero `File` sigue funcionando y lo verás en proyectos antiguos. Saber los dos es ser un programador completo.

---

> ❓ **¿Puedo guardar cualquier objeto con la serialización?**

Solo si su clase (y todas sus clases de atributos) implementan `Serializable`. Si no, `NotSerializableException`. Y la serialización es de Java a Java: si otro programa (Python, JavaScript) tiene que leer tus datos, usa texto, CSV o JSON.

---

> ❓ **¿Se pueden validar documentos HTML con regex?**

No. HTML no es un lenguaje regular: tiene etiquetas anidadas que las regex no pueden rastrear. Para eso existen los *parsers*. Las regex son para texto plano con patrones, no para árboles de etiquetas. Esa pregunta se la hacen todos, y la respuesta es la misma: "no".

---

> ❓ **¿`\w` reconoce las tildes y la ñ?**

No por defecto. `\w` es `[a-zA-Z0-9_]`. Para "pérez" o "muñoz" usa `[a-zA-ZáéíóúüñÑ]` o la bandera `Pattern.UNICODE_CHARACTER_CLASS`.

---

## 🎬 Poscréditos

La programadora termina su gestor de contactos: guarda cada contacto con `Serializable`, los carga al arrancar con `ObjectInputStream`, valida el correo de cada uno con una regex compilada y escribe un informe bonito con `PrintWriter.printf`. Funciona. Hasta que intenta leer el archivo desde otra máquina y le sale `ClassNotFoundException`.

Se acerca CONRAD, el compilador cascarrabias, con su taza humeante.

**CONRAD:** — ¿Has visto? La serialización guarda los datos, pero el archivo se la trae floja: solo sirve para el mismo programa con la misma clase. Cuando quieras que tus datos los entienda cualquier sistema, tendrás que irte de viaje: guardarlos en una base de datos.

**Programadora:** — ¿Una base de datos? ¿Y cómo conecto Java con una?

**CONRAD:** — *asiente* Con JDBC: una conexión, un `Statement`, y tus datos dejan de estar en un archivo para vivir en tablas con consultas. Tú suelta el `FileWriter` y ve preparando el SQL.

**PROXIMAMENTE EN U13:** Conexión a bases de datos con JDBC. El momento en que tus programas aprenden a hablar con un gestor de bases de datos relacional. 🗄️

---

📁 [Volver al índice de la unidad](/ApuntesProgramacion/12-ficheros-regex) · **Anterior:** [08 · Regex en acción: matches, replaceAll, split y validaciones](/ApuntesProgramacion/12-ficheros-regex/08-regex-aplicaciones) · **Siguiente:** **[U13 · Conexión a BD con JDBC](/ApuntesProgramacion/13-conexion-bases-datos)**