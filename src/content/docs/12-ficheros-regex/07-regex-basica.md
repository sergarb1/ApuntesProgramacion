---
title: "07 · Expresiones regulares: Pattern y Matcher"
description: "El molde, el texto y el infierno de las contrabarras: aprende a crear patrones con Pattern y a buscarlos con Matcher 🔍🧩"
---

<p><small>El molde, el texto y el infierno de las contrabarras: aprende a crear patrones con Pattern y a buscarlos con Matcher 🔍🧩</small></p>

> 🗺️ **Estás en:** 📁 **U12 · Ficheros y Expresiones Regulares** → 07 · Expresiones regulares: Pattern y Matcher

---

## 📬 La idea en una frase

> **Una expresión regular (regex) es un patrón que describe un conjunto de cadenas: `"\\d+"` significa "uno o más dígitos". Con `Pattern` la compilas y con `Matcher` la buscas dentro de un texto.**

Hasta aquí guardabas datos en archivos. Ahora toca la otra mitad de la unidad: **buscar patrones dentro de texto**. ¿Cuántas veces has querido "encontrar todos los números" o "comprobar que esto parece un correo"? Las expresiones regulares son el lenguaje para describir esas búsquedas. Se usan en casi todos los lenguajes y, una vez las aprendes, no hay texto que se te resista.

---

## ⚠️ El infierno de las contrabarras (léelo dos veces)

En Java, las regex se escriben como **cadenas** y, dentro de un `String`, la contrabarra `\` es un carácter de escape. Para escribir un `\d` de regex dentro de un `String` tienes que duplicarla:

| Lo que quieres en la regex | Lo que escribes en Java |
|---|---|
| `\d` (dígito) | `"\\d"` |
| `\.` (punto literal) | `"\\."` |
| `\s` (espacio) | `"\\s"` |

> ⚠️ **Advertencia:** si escribes `"\d"` Java intenta escapar la `d`, no sabe qué es y te da un error de compilación (o peor, un comportamiento raro). El "infierno de las contrabarras" es la causa número 1 de que una regex "no funcione" cuando acabas de empezar.

---

## 🔍 Pattern y Matcher: el molde y el texto

El flujo clásico son dos pasos:

- **`Pattern`**: la expresión regular **compilada**. Es el molde.
- **`Matcher`**: se aplica a un **texto concreto** y va buscando coincidencias. Es el detector.

```java
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class PrimerRegex {
    public static void main(String[] args) {
        Pattern patron = Pattern.compile("\\d+");   // uno o más dígitos (el molde)
        Matcher matcher = patron.matcher("Hay 123 manzanas y 456 peras");

        while (matcher.find()) {
            System.out.println("Encontrado: " + matcher.group()
                + " (posición " + matcher.start() + "-" + matcher.end() + ")");
        }
    }
}
```

Salida:

```
Encontrado: 123 (posición 4-7)
Encontrado: 456 (posición 21-24)
```

- `find()` avanza buscando la siguiente coincidencia y devuelve `true` mientras encuentre.
- `group()` devuelve el texto que ha coincidido.
- `start()` y `end()` devuelven dónde empieza y acaba la coincidencia.

> 💡 **Consejo:** compila el `Pattern` **una sola vez** fuera de bucles y reutilízalo. `Pattern.compile()` es caro (analiza la regex y monta una máquina de estados). Si lo llamas dentro de un bucle de 1 millón de líneas, te lo harás mirar.

---

## 🧩 La tabla de símbolos (tu chuleta de examen)

| Símbolo | Significado | Ejemplo |
|---|---|---|
| `.` | Cualquier carácter (excepto salto de línea) | `c.sa` → "casa", "cose" |
| `\d` | Dígito (0-9) | `\d{3}` → "123" |
| `\D` | NO dígito | `\D+` → "Hola" |
| `\w` | Letra, dígito o `_` | `\w+` → "Hola_123" |
| `\W` | NO `\w` | `\W` → ".", " " |
| `\s` | Espacio en blanco | `\s+` → separadores |
| `\S` | NO espacio | `\S+` → palabras |
| `*` | 0 o más veces | `a*` → "", "a", "aa" |
| `+` | 1 o más veces | `a+` → "a", "aa" |
| `?` | 0 o 1 vez (opcional) | `colou?r` → "color", "colour" |
| `{n}` | Exactamente n | `\d{3}` → tres dígitos |
| `{n,m}` | Entre n y m | `\d{2,4}` → de 2 a 4 dígitos |
| `[abc]` | Uno del conjunto | `[aeiou]` → vocales |
| `[a-z]` | Rango | `[a-z]` → minúsculas |
| `[^abc]` | Negación | `[^0-9]` → no dígitos |
| `( )` | Grupo de captura | `(\d+)-(\w+)` |
| `^` | Inicio de línea | `^Hola` |
| `$` | Final de línea | `mundo$` |
| `\|` | OR lógico | `gato\|perro` |
| `\b` | Límite de palabra | `\bJava\b` no coincide con "JavaScript" |

> 📝 **Nota:** `\w` NO incluye tildes ni `ñ` por defecto. Para "pérez" o "muñoz" necesitas `[a-zA-ZáéíóúüñÑ]` o la bandera `Pattern.UNICODE_CHARACTER_CLASS`. Cosa de examen, apuntátelo.

---

## 🕵️ Grupos de captura: los paréntesis que recuerdan

Los paréntesis `( )` no solo agrupan: **capturan** lo que coincide para poder extraerlo después. Es la base del punto 8, pero conviene verlo ya:

```java
Pattern patron = Pattern.compile("(\\w+): (\\d+) años");
Matcher matcher = patron.matcher("Juan: 28 años, María: 32 años");

while (matcher.find()) {
    System.out.println(matcher.group(1) + " tiene " + matcher.group(2) + " años");
}
// Juan tiene 28 años
// María tiene 32 años
```

- `group(0)` (o `group()`) es toda la coincidencia.
- `group(1)`, `group(2)`... son los paréntesis en orden de apertura.
- Si agrupas sin querer capturar (por rendimiento): `(?:...)`.

---

## 🚩 Las banderas (flags)

`Pattern.compile` acepta un segundo argumento con banderas:

```java
Pattern p1 = Pattern.compile("java", Pattern.CASE_INSENSITIVE);              // Java, JAVA, java...
Pattern p2 = Pattern.compile("^\\d+", Pattern.MULTILINE);                    // ^ al inicio de cada línea
Pattern p3 = Pattern.compile(".*", Pattern.DOTALL);                          // el . también captura saltos
Pattern p4 = Pattern.compile("java", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE);  // combinadas
Pattern p5 = Pattern.compile("(?i)java");                                    // flag inline: (?i) = case-insensitive
```

`(?i)` dentro de la propia regex hace lo mismo que la bandera, sin segundo argumento. Las banderas se combinan con `|`.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** las regex se prueban con `matches()` (todo el string) o `find()` (subcadena). `group()` extrae lo capturado con paréntesis. Si tu regex no encuentra nada, revisa las contrabarras antes que la lógica.

**Ejercicio: el cazador de patos**

```java
import java.util.regex.*;

public class CazadorPatos {
    public static void main(String[] args) {
        String texto = "Hay 3 patos, luego 45 patos, y al final 678 patos";
        Pattern patron = Pattern.compile("\\d+ patos");
        Matcher matcher = patron.matcher(texto);

        int total = 0;
        while (matcher.find()) {
            String grupo = matcher.group();                // "3 patos", "45 patos"...
            String numero = grupo.split(" ")[0];           // "3", "45"...
            total += Integer.parseInt(numero);
        }
        System.out.println("Patos totales: " + total);
    }
}
```

**¿Qué imprime? ¿Y si cambias `"\\d+ patos"` por `"\\d+ patos"` con `matches()`?**

<details>
<summary>🔄 Solución</summary>

Imprime **`Patos totales: 726`** (`3 + 45 + 678`).

`find()` va saltando de coincidencia en coincidencia: primero "3 patos", luego "45 patos", luego "678 patos". De cada grupo se extrae la parte numérica con `split(" ")` y se acumula.

Y ojo con la segunda pregunta (trampa): con `matches()`, la respuesta sería **ninguna coincidencia** (o `false`). `matches()` exige que **todo** el string cumpla el patrón, y aquí hay más texto alrededor. Para buscar subcadenas usa siempre `find()`. Es el error más repetido de la unidad.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Cómo escribes en Java la regex `\d`?
2. ¿Qué devuelve `matcher.find()`?
3. ¿Qué método de `Matcher` te da el texto que ha coincidido?
4. ¿Por qué conviene compilar el `Pattern` fuera de un bucle?

<details>
<summary>🔄 Respuestas</summary>

1. `"\\d"`. Dentro de un `String`, la contrabarra se duplica.
2. `true` si encuentra una coincidencia (y avanza a la siguiente). `false` cuando no quedan.
3. `group()` (o `group(0)`), y `group(n)` para el grupo de captura `n`.
4. Porque `Pattern.compile()` es caro: analiza la regex y monta la máquina de búsqueda. Reutilizar el `Pattern` es gratis y muy más rápido.

</details>

---

## ✅ Resumen en 3 frases

1. Una **regex** describe un conjunto de cadenas con símbolos (`\d`, `\w`, `+`, `{n}`, `[a-z]`...), y en Java las contrabarras se **duplican** (`"\\d"`).
2. **`Pattern.compile`** compila la regex (el molde) y **`matcher.find()`** busca coincidencias en un texto: `group()`, `start()` y `end()` te dan los detalles.
3. `matches()` exige que **todo** el string cumpla el patrón; `find()` busca subcadenas. No los confundas: es el error número 1.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Regex | Patrón de búsqueda que describe un conjunto de cadenas |
> | `Pattern` | La regex compilada (el molde) |
> | `Matcher` | El buscador aplicado a un texto concreto |
> | `find()` | Busca la siguiente coincidencia |
> | `group()` | El texto que ha coincidido |
> | Grupo de captura | Paréntesis que "recuerdan" parte de la coincidencia |
> | Metacaracter | Símbolo con significado especial en una regex (`.`, `+`, `\d`...) |

📁 [Volver al índice de la unidad](/ApuntesProgramacion/12-ficheros-regex) · **Anterior:** [06 · Serialización: guardar objetos con ObjectOutputStream](/ApuntesProgramacion/12-ficheros-regex/06-serializacion) · **Siguiente:** [08 · Regex en acción: matches, replaceAll, split y validaciones](/ApuntesProgramacion/12-ficheros-regex/08-regex-aplicaciones)