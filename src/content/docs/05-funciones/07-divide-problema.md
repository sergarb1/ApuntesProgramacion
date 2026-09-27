---
title: "07 · Divide el problema"
description: "Main como director de orquesta: una responsabilidad por método, el programa que se lee como un resumen y cómo trocear sin miedo 🧱"
---

<p><small>Main como director de orquesta: una responsabilidad por método, el programa que se lee como un resumen y cómo trocear sin miedo 🧱</small></p>

> 🗺️ **Estás en:** 🔧 **U05 · Funciones y métodos** → 07 · Divide el problema

---

## 📬 La idea en una frase

> **Dividir es escribir un `main` que se lea como un resumen en inglés claro ("lee datos, calcula media, muestra informe") y esconder cada frase en un método con su nombre.**

---

## 🎼 El director no toca los instrumentos

Un buen `main` parece esto:

```java
public static void main(String[] args) {
    double[] notas = leerNotas();
    double media = calcularMedia(notas);
    String informe = formatearInforme(media);
    System.out.println(informe);
}
```

Cuatro líneas, cuatro verbos, cero aritmética. ¿Quieres saber cómo se leen las notas? Abres `leerNotas()`. ¿Cómo se calcula la media? `calcularMedia()`. Cada detalle vive en su sitio y `main` sigue siendo un **índice del programa**, no un pliego de recetas.

Si ese mismo programa viviera todo en `main`, tendrías 40 líneas mezclando lectura, cálculo y formato donde ningún comentario te salva. El director de orquesta no toca los instrumentos: **coordina**.

---

## 🔪 Cómo trocear: el método de los verbos

Mira un `main` de taller y enciende los verbos:

```java
public static void main(String[] args) {
    // 1. leer las notas del teclado          → leerNotas()
    // 2. comprobar si hay alguna suspensa    → tieneSuspensa(notas)
    // 3. calcular la media                   → calcularMedia(notas)
    // 4. imprimir el resultado bonito        → mostrarResultado(media, notas)
}
```

Cada verbo con paréntesis en el comentario es **un candidato a método**. El patrón se repite:

1. **Escribe el comentario-objetivo** (o léelo si ya está).
2. **Crea el método** con ese nombre, `public static`, parámetros si necesita datos, retorno si devuelve algo.
3. **Mueve el código** de ese paso al cuerpo.
4. **Deja una llamada** en `main` y **ejecuta**: si hacía lo mismo que antes, has troceado bien.
5. Repite con el siguiente verbo. **Un método por vez.**

> 💡 **Consejo:** si necesitas un comentario para explicar un bloque de 5 líneas, ese bloque ya tiene nombre: hazlo método y que el nombre hable por él.

### ¿Dónde está el límite?

| Se queda en `main` | Se va a su método |
|---|---|
| La secuencia de pasos | Un paso con nombre propio |
| Un `if` de dos líneas que decide flujo | Un bloque que repites o que "hace una cosa" |
| La llamada final de impresión | La cuenta, la lectura, la búsqueda, el formato |

No hay ley universal de "más de N líneas", sí una brújula: **una responsabilidad por método**. `calcularMediaYMostrarYGuardar` es tres métodos disfrazados de uno.

---

## 🧪 Antes y después: el informe de notas

**Antes** (todo en `main`):

```java
public static void main(String[] args) {
    Scanner teclado = new Scanner(System.in);
    double suma = 0;
    for (int i = 0; i < 5; i++) {
        System.out.print("Nota " + (i + 1) + ": ");
        suma += teclado.nextDouble();
    }
    double media = suma / 5;
    System.out.println("Media: " + media);
    if (media >= 5) {
        System.out.println("¡APROBADO!");
    } else {
        System.out.println("Suspenso. A por ello.");
    }
}
```

**Después** (un resumen y dos recetas):

```java
public static void main(String[] args) {
    double[] notas = leerNotas(5);
    double media = calcularMedia(notas);
    mostrarVeredicto(media);
}

static double[] leerNotas(int cantidad) { ... }      // leer
static double calcularMedia(double[] notas) { ... }  // calcular
static void mostrarVeredicto(double media) { ... }   // contar
```

Mismo programa, dos vidas distintas: en la segunda, mañana añades el máximo sin tocar nada más (bueno, casi: `leerNotas` ya devuelve un array... que verás en serio en la U06).

> 📝 **Nota:** el orden de declaración no importa (lo viste en el punto 2), así que `main` puede leerse arriba como un resumen aunque sus ayudantes estén debajo.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** si dudas entre trocear o no, escribe la llamada que **quisieras** tener (`int max = encontrarMaximo(notas);`) y luego haz que exista. El código se diseña hacia delante, como se pide en un restaurante.

**Ejercicio: el verbo escondido**

¿Qué método (nombre y firma) extraerías de este `main`? Devuelve `true` si todos los números son positivos:

```java
public static void main(String[] args) {
    int[] datos = {3, 7, 2};
    boolean todoPositivo = true;
    for (int i = 0; i < datos.length; i++) {
        if (datos[i] <= 0) {
            todoPositivo = false;
        }
    }
    System.out.println("¿Todo positivo? " + todoPositivo);
}
```

<details>
<summary>🔄 Solución</summary>

```java
public static boolean todosPositivos(int[] datos) {
    for (int i = 0; i < datos.length; i++) {
        if (datos[i] <= 0) {
            return false;
        }
    }
    return true;
}
```

Verbo: "todos positivos" → nombre `todosPositivos`. ¿Necesita datos? Sí → `int[] datos`. ¿Devuelve algo? Sí, un juicio → `boolean`. `main` queda en: `boolean ok = todosPositivos(datos);`. (Que el bucle use arrays no te distraiga: la idea del troceado es la misma en cualquier terreno.)

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué tres preguntas te haces al diseñar un método? (pista: nombre, entradas, salidas).
2. ¿Cuál es el oficio de `main` en un programa bien troceado?
3. ¿Qué señal dice "este bloque pide método"?
4. ¿Cuántos bloques troceas de una vez cuando refactorizas?

<details>
<summary>🔄 Respuestas</summary>

1. ¿Cómo se llama (qué verbo hace)? ¿Qué datos necesita (parámetros)? ¿Qué devuelve (retorno o `void`)?
2. Coordinar: leer → calcular → mostrar, en llamadas legibles.
3. Necesitar un comentario para explicarlo, repetirse en otro sitio o contener "una cosa con nombre".
4. Uno solo, ejecutando tras cada extracción: si algo se rompe, sabes qué fue.

</details>

---

## ✅ Resumen en 3 frases

1. Un `main` bien troceado se lee como un **resumen** de verbos; cada verbo vive en un método con una responsabilidad.
2. El método de los verbos: **comentario → nombre → firma → mover código → llamar y probar**, un método por vez.
3. La brújula no es la longitud, es la **responsabilidad**: si el nombre del método necesita "y", son dos métodos.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Orquestación | `main` coordina; los métodos trabajan |
> | Responsabilidad única | Un método, una cosa bien hecha |
> | Extracción | Mover un bloque a un método nuevo |
> | Refactorizar | Reorganizar sin cambiar lo que hace |
> | Método helper | Ayudante pequeño al servicio de otro paso |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/05-funciones) · **Anterior:** [06 · Errores frecuentes](/ApuntesProgramacion/05-funciones/06-errores-frecuentes) · **Siguiente:** [08 · Be the Code](/ApuntesProgramacion/05-funciones/08-be-the-code)
