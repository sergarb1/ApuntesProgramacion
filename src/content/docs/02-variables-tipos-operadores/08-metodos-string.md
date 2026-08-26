---
title: 08 — Métodos útiles de String
description: La caja de herramientas para manipular texto 🪄
---

<p><small>La caja de herramientas para manipular texto 🪄</small></p>

> 🗺️ **Estás en:** 🔤 **U02 · Variables, Tipos y Operadores** → 08 · Métodos útiles de String

---

## 📬 La idea en una frase

> **`String` trae de serie una caja de herramientas con métodos para medir, recortar, buscar y transformar texto (`length()`, `trim()`, `toUpperCase()`, `substring()`, `replace()`…).**

En el punto 2 conociste al `String` como la caja mágica del texto. Ahora vas a abrir su caja de herramientas: porque los programas no solo guardan texto, también lo miden, lo limpian, lo ponen en mayúsculas y lo trocean.

---

## 🪄 El gimnasio del texto: los métodos que medirás

Aquí está el arsenal completo. Fíjate en cómo se llama un método de objeto: `texto.metodo()`, con un punto entre la variable y el método (no como `Math.random()`, que era estático):

```java
String texto = "  Programación DAM  ";

texto.length();               // 18 — cuántos caracteres hay (espacios incluidos)
texto.trim();                 // "Programación DAM" — sin espacios a los lados
texto.toUpperCase();          // "  PROGRAMACIÓN DAM  "
texto.toLowerCase();          // "  programación dam  "
texto.contains("DAM");        // true — ¿contiene ese texto?
texto.startsWith("  ");       // true — ¿empieza por...?
texto.endsWith("AM  ");       // true — ¿termina por...?
texto.indexOf("DAM");         // 14 — ¿en qué posición empieza "DAM"?
texto.substring(2, 13);       // "Programación" — recorta del carácter 2 al 13
texto.replace("DAM", "DAW");  // "  Programación DAW  " — sustituye texto
```

> 💡 **Detalle práctico:** `length()` es un **método** (con paréntesis). Es el error clásico del novato escribir `texto.length` sin paréntesis y que no compile. En cambio, para un array (la U09) se usa `.length` sin paréntesis. Los `String` llevan paréntesis; los arrays, no.

---

## 🔍 Los métodos que buscan

Cuando necesitas saber si algo está dentro del texto:

```java
String email = "ana@instituto.edu";
boolean tieneArroba = email.contains("@");          // true
boolean esDeEdu = email.endsWith(".edu");           // true
boolean empiezaPorAna = email.startsWith("ana");    // true
int posicionArroba = email.indexOf("@");            // 3 — el @ está en la posición 3
```

> 📝 **Nota:** `indexOf()` devuelve la **posición** (empezando en 0) donde encuentra el texto, o **-1** si no lo encuentra. Es el "buscar" de Java.

---

## ✂️ Los métodos que recortan

El clásico: limpiar espacios y trocear. `trim()` es el héroe silencioso de los formularios mal rellenados:

```java
String sucio = "   Ana   ";
String limpio = sucio.trim();          // "Ana" — sin espacios alrededor
String nombreCompleto = "Ana Martínez";
String nombre = nombreCompleto.substring(0, 3);       // "Ana" — del 0 al 3 (sin incluir el 3)
String apellido = nombreCompleto.substring(4);        // "Martínez" — desde el 4 hasta el final
```

> ⚠️ **Advertencia:** en `substring(inicio, fin)`, el `fin` **no se incluye**. `substring(0, 3)` te da los caracteres 0, 1 y 2. Es un error típico pedir un carácter de más (o de menos).

---

## 🏫 Ejemplo guiado: el nombre del usuario

Vamos a construir un programa que procese un nombre como lo haría un formulario serio: limpiando espacios y mostrando datos:

```java
public class ProcesaNombre {
    public static void main(String[] args) {
        String nombre = "  aNA  ";

        String limpio = nombre.trim();                     // "aNA"
        String enMayusculas = limpio.toUpperCase();        // "ANA"
        String enMinusculas = limpio.toLowerCase();        // "ana"
        String primera = enMayusculas.substring(0, 1);     // "A"
        String ultima = enMayusculas.substring(enMayusculas.length() - 1);  // "A"

        System.out.println("Nombre limpio: " + limpio);
        System.out.println("Longitud: " + limpio.length());
        System.out.println("En mayúsculas: " + enMayusculas);
        System.out.println("Primera letra: " + primera);
        System.out.println("Última letra: " + ultima);
    }
}
```

Salida:

```
Nombre limpio: aNA
Longitud: 3
En mayúsculas: ANA
Primera letra: A
Última letra: A
```

Fíjate en la última letra: `enMayusculas.length() - 1` es la última posición, porque las posiciones empiezan en 0.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** encadena los métodos para expresiones potentes: `texto.trim().toUpperCase().substring(0, 1)` hace tres cosas en una línea. Java las ejecuta de izquierda a derecha.

**Ejercicio: la inicial de una reina**

Sin ejecutar, di qué imprime este código:

```java
String nombre = "  merida  ";
String inicial = nombre.trim().toUpperCase().substring(0, 1);
String resto = nombre.trim().substring(1).toLowerCase();
System.out.println(inicial + ". " + resto);
```

<details>
<summary>🔄 Solución</summary>

Imprime `M. erida`.

- `nombre.trim()` → `"merida"` (fuera espacios).
- `.toUpperCase()` → `"MERIDA"`.
- `.substring(0, 1)` → `"M"`. Ese es el `inicial`.
- Para el resto: `"merida".substring(1)` → `"erida"`, y `.toLowerCase()` lo deja igual. Resultado: `M. erida`.

(La idea era normalizar un nombre estilo "M. erida"... aunque el resultado suena a princesa con prisa.)

</details>

---

## 🎯 Mini-chequeo

1. ¿`String.length()` lleva paréntesis o no? ¿Por qué?
2. ¿Qué hace `trim()` y cuándo es imprescindible?
3. ¿Qué devuelve `indexOf("@")` si el texto no contiene `@`?
4. ¿Qué devuelve `"Hola".substring(1, 3)`?

<details>
<summary>🔄 Respuestas</summary>

1. **Lleva paréntesis**: `length()` es un método de la clase `String`. (Los arrays usan `.length` sin paréntesis, pero eso es la U09.)
2. `trim()` elimina los **espacios del principio y del final**. Es imprescindible al limpiar entradas de usuario que suelen traer espacios de más.
3. **`-1`**, el centinela de "no encontrado".
4. `"ol"` — el carácter 1 ('o') y el 2 ('l'); el `3` no se incluye.

</details>

---

## ✅ Resumen en 3 frases

1. Los métodos de `String` se llaman sobre la variable (`texto.metodo()`) y transforman el texto en algo nuevo.
2. `length()`, `trim()`, `toUpperCase()`, `contains()`, `indexOf()`, `substring()` y `replace()` cubren el 90% de lo que harás con texto.
3. En `substring(inicio, fin)` el fin no se incluye, e `indexOf()` devuelve `-1` cuando no encuentra nada.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `length()` | Nº de caracteres de un String (con paréntesis) |
> | `trim()` | Quita los espacios de los extremos |
> | `substring()` | Recorta una porción del texto |
> | `indexOf()` | Posición de la primera aparición (o `-1`) |
> | `replace()` | Sustituye una parte del texto por otra |
> | Encadenar métodos | Aplicar varios métodos seguidos con puntos |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/02-variables-tipos-operadores) · **Anterior:** [07 · Math.random() y números aleatorios](/ApuntesProgramacion/02-variables-tipos-operadores/07-math-random-aleatorios) · **Siguiente:** [09 · Repaso interactivo](/ApuntesProgramacion/02-variables-tipos-operadores/09-repaso-interactivo)