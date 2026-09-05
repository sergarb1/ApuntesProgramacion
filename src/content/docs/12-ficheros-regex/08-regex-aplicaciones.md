---
title: "08 · Regex en acción: matches, replaceAll, split y validaciones"
description: "Del molde al mundo real: valida correos y DNIs, limpia textos con replaceAll, trocea con split y extrae datos con grupos de captura 🧰🛠️"
---

<p><small>Del molde al mundo real: valida correos y DNIs, limpia textos con replaceAll, trocea con split y extrae datos con grupos de captura 🧰🛠️</small></p>

> 🗺️ **Estás en:** 📁 **U12 · Ficheros y Expresiones Regulares** → 08 · Regex en acción: matches, replaceAll, split y validaciones

---

## 📬 La idea en una frase

> **Aquí la regex deja de ser teoría: validas un correo con `matches()`, limpias espacios con `replaceAll()`, troceas una frase con `split()` y extraes los campos de un log con grupos de captura.**

El punto 7 te dio el martillo (`Pattern` y `Matcher`). Este punto es el taller: aplicaciones reales que usarás todos los días. Además de `Pattern`/`Matcher`, la clase `String` tiene métodos que aceptan regex directamente, y son los que más rápido te harán la vida.

---

## 🎯 String.matches(): ¿cumple TODO el string?

`matches()` devuelve `true` solo si **todo** el texto cumple el patrón. Es la herramienta perfecta para validar.

```java
"123".matches("\\d+");          // true  (todo son dígitos)
"Hola".matches("\\d+");         // false (no son dígitos)
"12345678Z".matches("\\d{8}[A-Z]");  // true (8 dígitos + mayúscula)
"1234567Z".matches("\\d{8}[A-Z]");   // false (faltan dígitos)
```

> ⚠️ **Advertencia:** `matches()` empareja **todo** el string. Para buscar subcadenas dentro de un texto usa `find()` (punto 7). Este error se cobra su precio en cada examen.

---

## 🧹 replaceAll(): limpiar texto en una línea

`replaceAll(regex, reemplazo)` sustituye **todas** las coincidencias del patrón. `replaceFirst()` solo la primera.

```java
String texto = "  Hola    mundo  de las   regex  ";

String limpio = texto.replaceAll("\\s+", " ").trim();
// "Hola mundo de las regex"

texto.replaceFirst("\\s+", " ").trim();
// "Hola    mundo  de las   regex"  (solo el primer bloque de espacios)
```

El patrón `"\\s+"` = "uno o más espacios" → lo sustituye por un solo espacio. Con `.trim()` limpias los extremos. Resultado: texto normalizado en dos llamadas.

> 💡 **Consejo:** los reemplazos también aceptan grupos: `"Hola Ana".replaceAll("Hola (\\w+)", "Adiós $1")` → `"Adiós Ana"`. El `$1` recupera el grupo 1 en el reemplazo.

---

## 🔪 split(): trocear por patrón

`split(regex)` divide el string por las coincidencias y devuelve un `String[]`.

```java
"a,b,c,d".split(",");        // ["a", "b", "c", "d"]
"a,b,c,d".split(",", 3);     // ["a", "b", "c,d"]  (con límite)
"hola mundo  java".split("\\s+");  // ["hola", "mundo", "java"] (uno o más espacios)
"a1b22c333".split("\\d+");   // ["a", "b", "c", ""]
```

Fíjate en el último: si el string termina con dígitos, `split` deja una cadena vacía al final. Es un clásico que muerde. Y `split` con un punto (`"."`) no trocea por puntos, porque `.` es "cualquier carácter": necesitas `"\\."`.

---

## 🎫 Validaciones de la vida real

Aquí juntamos todo: `matches()` + patrones compilados una vez como constantes. El validador clásico de correo, DNI y teléfono:

```java
import java.util.regex.Pattern;

public class ValidadorRegex {
    private static final Pattern PATRON_DNI = Pattern.compile("\\d{8}[A-Z]");
    private static final Pattern PATRON_EMAIL =
        Pattern.compile("[\\w.]+@[\\w.]+\\.[a-z]{2,}");
    private static final Pattern PATRON_TELEFONO =
        Pattern.compile("[679]\\d{8}");

    public static boolean esEmailValido(String email) {
        return PATRON_EMAIL.matcher(email.toLowerCase()).matches();
    }

    public static boolean esDNIValido(String dni) {
        return PATRON_DNI.matcher(dni.toUpperCase()).matches();
    }

    public static boolean esTelefonoValido(String telefono) {
        return PATRON_TELEFONO.matcher(telefono).matches();
    }

    public static void main(String[] args) {
        System.out.println(esEmailValido("user@example.com"));   // true
        System.out.println(esEmailValido("user@@example"));      // false
        System.out.println(esDNIValido("12345678Z"));            // true
        System.out.println(esDNIValido("12345678z"));            // false (minúscula)
        System.out.println(esTelefonoValido("612345678"));       // true
        System.out.println(esTelefonoValido("512345678"));       // false (empieza por 5)
    }
}
```

> 📝 **Nota:** `[\\w.]+@[\\w.]+\\.[a-z]{2,}` se lee: "letras/puntos, una `@`, letras/puntos, un punto, y al menos 2 letras". Es un formato **básico**: no comprueba si el dominio existe ni si la dirección es real. Y el DNI: la regex solo verifica el **formato** (8 dígitos + letra); para validar la letra de verdad haría falta el algoritmo módulo 23. Las regex validan forma, no verdad.

---

## 🕵️ El procesador de logs (grupos de captura + ficheros)

La aplicación estrella: leer un log y extraer sus campos con grupos. Recuerda del punto 2 cómo leer archivos, y aquí le sumas la regex:

```java
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ProcesadorLog {
    public static void main(String[] args) throws Exception {
        Pattern patron = Pattern.compile(
            "\\[(ERROR|INFO|WARN)\\]\\s+" +
            "(\\d{4}-\\d{2}-\\d{2})\\s+" +
            "(\\d{2}:\\d{2}:\\d{2})\\s+-\\s+(.*)");

        Path entrada = Paths.get("app.log");
        Path salida = Paths.get("errores.txt");

        try (BufferedReader br = Files.newBufferedReader(entrada);
             PrintWriter pw = new PrintWriter(Files.newBufferedWriter(salida))) {

            String linea;
            while ((linea = br.readLine()) != null) {
                Matcher matcher = patron.matcher(linea);
                if (matcher.find()) {
                    String nivel = matcher.group(1);
                    String fecha = matcher.group(2);
                    String hora = matcher.group(3);
                    String mensaje = matcher.group(4);
                    System.out.printf("[%s] %s a las %s: %s%n", nivel, fecha, hora, mensaje);
                    if (nivel.equals("ERROR")) {
                        pw.println(fecha + " " + hora + " " + mensaje);
                    }
                }
            }
        }
        System.out.println("Errores extraídos a " + salida);
    }
}
```

Con una sola regex sacas el nivel, la fecha, la hora y el mensaje de cada línea. Y si la línea es un `ERROR`, la escribes en un archivo aparte. Regex + ficheros: la unidad entera en un programa.

> 💡 **Consejo:** para un log enorme no uses `Files.readAllLines` (punto 5): carga todo en memoria. Lee **línea a línea** con `BufferedReader` y aplica el `Matcher` a cada una. Memoria constante, da igual que el log pese 2 GB.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cada paréntesis captura una parte. `(.*)` al final captura "todo lo que quede": es el clásico para el resto de la línea. Si una línea no coincide, `find()` devuelve `false` y no pasa nada: el bucle sigue.

**Ejercicio: el formateador de fechas**

```java
public class FormateadorFechas {
    public static void main(String[] args) {
        String fecha = "15/03/2024";
        String convertida = fecha.replaceAll("(\\d{2})/(\\d{2})/(\\d{4})", "$3-$2-$1");
        System.out.println(convertida);
    }
}
```

**¿Qué imprime? ¿Y qué pasa si la fecha viene con guiones `15-03-2024`?**

<details>
<summary>🔄 Solución</summary>

Imprime **`2024-03-15`**: pasa de `dd/mm/aaaa` a `aaaa-mm-dd`.

Los grupos capturan el día (`$1`), el mes (`$2`) y el año (`$3`), y el reemplazo `$3-$2-$1` los reordena. Ese es el truco para reordenar partes de texto con regex sin tocar nada más.

Y la trampa: con `15-03-2024` **no coincide nada** (el patrón espera `/`, no `-`), así que `replaceAll` no toca el string y devuelve `15-03-2024` tal cual. Para soportar ambos separadores tendrías que usar `[\\/\\-]` o dos llamadas. Las regex son literales: no adivinan, cumplen órdenes.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué método de `String` valida que TODO el texto cumpla un patrón?
2. ¿Cómo quitas los espacios dobles de un texto con una línea?
3. ¿Qué devuelve `"a,b,c".split(",")`?
4. En `replaceAll("(\\w+)@(\\w+)", "$2@$1")`, ¿qué hace `$2`?

<details>
<summary>🔄 Respuestas</summary>

1. `matches()`.
2. `texto.replaceAll("\\s+", " ").trim()`.
3. Un `String[]` con `["a", "b", "c"]`.
4. Recupera el segundo grupo de captura (lo que coincidió con el segundo paréntesis) y lo coloca en el reemplazo: intercambia las dos partes.

</details>

---

## ✅ Resumen en 3 frases

1. **`matches()`** valida que todo el texto cumpla el patrón (correos, DNIs, teléfonos); **`replaceAll`** limpia y reordena texto; **`split`** trocea por el patrón.
2. Los **grupos de captura** extraen partes (`group(n)` en Java, `$n` en los reemplazos) y son la base para procesar logs y CSV.
3. Para ficheros grandes, aplica la regex **línea a línea** con `BufferedReader` (no cargues el archivo entero en memoria).

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `matches()` | ¿Todo el string cumple el patrón? |
> | `replaceAll()` | Sustituye todas las coincidencias |
> | `replaceFirst()` | Sustituye solo la primera |
> | `split()` | Trocea el string por el patrón |
> | `$n` | Grupo `n` en un reemplazo de `replaceAll` |
> | Validar | Comprobar el formato de un dato (no su veracidad) |

📁 [Volver al índice de la unidad](/ApuntesProgramacion/12-ficheros-regex) · **Anterior:** [07 · Expresiones regulares: Pattern y Matcher](/ApuntesProgramacion/12-ficheros-regex/07-regex-basica) · **Siguiente:** [09 · Repaso interactivo](/ApuntesProgramacion/12-ficheros-regex/09-repaso-interactivo)