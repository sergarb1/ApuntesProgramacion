---
title: 05 — Comentarios y documentación
description: Notas pegajosas digitales para tu código 📝
---

<p><small>Notas pegajosas digitales para tu código 📝</small></p>

> 🗺️ **Estás en:** 🚀 **U01 · Introducción a Java** → 05 · Comentarios y documentación

---

## 📬 La idea en una frase

> **Un comentario es un mensaje que te dejas a ti mismo (o a otros). El ordenador lo ignora por completo: es para los humanos, no para las máquinas.**

El código explica *qué* hace la máquina; los comentarios explican *por qué* lo hace. Y el *por qué* es oro puro: seis meses después, ese comentario te evitará horas de "¿qué estaba pensando cuando escribí esto?".

---

## 📝 Los tres tipos de comentarios

Java tiene tres formas de escribir comentarios, cada una con su uso:

| Tipo | Sintaxis | Uso |
|---|---|---|
| De una línea | `// texto` | Notas rápidas al lado del código |
| De bloque | `/* texto */` | Explicaciones largas, varias líneas |
| Javadoc | `/** texto */` | Documentación automática de clases y métodos |

```java
// Comentario de una línea: "Aquí va la magia"

/*
   Comentario de varias líneas:
   "Si esto funciona, no lo toques.
    Si no funciona, no lo toques tampoco.
    Ya llamaremos a alguien."
*/

/**
 * Comentario Javadoc (el elegante):
 * Sirve para generar documentación automática.
 * @param argumentos la lista de argumentos de la línea de comandos
 * @return nada, esto es void, ¿no te enteras?
 */
```

> 💡 **Detalle práctico:** los comentarios pueden ir en medio de una línea sin problema. `System.out.println(/* "Cuatro" */ "Cinco")` imprime `Cinco`: el comentario se ignora y el resto de la línea sigue viva.

---

## 🗝️ El consejo que te ahorrará horas: comenta el *por qué*, no el *qué*

Este es el consejo más rentable de toda la unidad:

```
int i = 0; // Declaro i con valor 0   ← MAL: el código ya lo dice
int i = 0; // Empezamos desde 0 porque el usuario no ha pulsado nada   ← BIEN
```

Escribir `// Declaro i con valor 0` es como poner "Abro la puerta" en una puerta. El código ya dice eso. El comentario útil añade información que **el código no puede expresar**: el contexto, la intención, la decisión de diseño.

- ❌ `int temperatura = 30; // temperatura vale 30`
- ✅ `int temperatura = 30; // Refresca por debajo de 25 según el jefe`

> 🧠 **Truco de memoria:** si el comentario describe la misma acción que ves en el código, bórralo. El buen comentario responde a *¿por qué?*, nunca a *¿qué?*.

---

## 📖 Javadoc: documentación que se genera sola

**Javadoc** es un comentario especial (`/** ... */`) que colocas **justo antes** de una clase o de un método. La herramienta `javadoc` (incluida en el JDK) lo convierte en páginas de documentación automáticas, iguales a las oficiales de Java.

```java
/**
 * Clase que representa a un alumno del curso de programación.
 *
 * @author Sergi Garcia
 * @version 1.0
 */
public class SobreMi {

    /**
     * Punto de entrada del programa.
     *
     * @param args argumentos recibidos desde la línea de comandos
     */
    public static void main(String[] args) {
        System.out.println("Me llamo Sergi y me gusta la programación");
    }
}
```

Etiquetas que debes conocer:

| Etiqueta | Dónde | Qué documenta |
|---|---|---|
| `@author` | Clase | Quién escribió el código |
| `@version` | Clase | Versión del código |
| `@param` | Método | Qué significa cada parámetro |
| `@return` | Método | Qué devuelve el método (si no es `void`) |

Para generarla: `javadoc SobreMi.java` en la terminal y se crearán los `.html` con la documentación. Pruébalo: es como tener un manual de instrucciones hecho por ti mismo.

> 💡 **Consejo:** en los exámenes y en la vida real, los comentarios Javadoc en los métodos suelen "caer" en las rúbricas. Además, en el trabajo, los que documentan duermen mejor... y los que no, vuelven al código a las 3 de la mañana con cara de pánico.

---

## 🏫 Ejemplo guiado: documentar un programa completo

Vamos a aplicar todo a un programa real:

```java
/**
 * Clase que saluda de distintas formas.
 *
 * @author Alumno DAM
 * @version 1.0
 */
public class Saludo {

    /**
     * Método principal: imprime los dos mensajes de la clase.
     *
     * @param args argumentos de línea de comandos (no usados aquí)
     */
    public static void main(String[] args) {
        // Primer mensaje: bienvenida al curso
        System.out.println("Bienvenidos al curso de Programación");

        /* Segundo mensaje:
           usamos println para saltar de línea y dejar la consola limpia */
        System.out.println("Este curso va a molar");
    }
}
```

Fíjate en que cada comentario aporta algo: el Javadoc documenta la API, el `//` explica la intención y el `/* */` justifica una decisión de formato. Ninguno repite lo que el código ya dice.

---

## 🎯 Mini-chequeo

1. ¿Cuál es la diferencia entre `//`, `/* */` y `/** */`?
2. ¿Qué imprime este programa?

```java
public class Comentarios {
    public static void main(String[] args) {
        // System.out.println("Uno");
        System.out.println("Dos");
        /* System.out.println("Tres"); */
        System.out.println(/* "Cuatro" */ "Cinco");
    }
}
```

3. ¿Es buen comentario `// x = 10`?

<details>
<summary>🔄 Respuestas</summary>

1. `//` es de una línea; `/* */` es de bloque (varias líneas); `/** */` es Javadoc, que la herramienta `javadoc` convierte en documentación automática.
2. Imprime `Dos` y `Cinco`. La línea con `//` y la del bloque `/* */` se ignoran, y en la última el comentario interno se elimina pero `"Cinco"` sigue siendo el argumento del `println`.
3. No: el código ya muestra que `x` vale 10. Comenta el **por qué**, no el qué.

</details>

---

## ✅ Resumen en 3 frases

1. Los comentarios son para humanos: `//`, `/* */` y `/** */`, según lo que necesites.
2. Comenta el **por qué**, no el qué: el código ya dice qué hace.
3. **Javadoc** genera documentación automática con `@author`, `@version`, `@param` y `@return`.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Comentario | Texto que el compilador ignora |
> | Javadoc | Comentario que genera documentación automática |
> | Etiqueta | `@param`, `@return`... metadatos del Javadoc |
> | Documentación | Explicación escrita del código |
> | Compilador | Traductor que ignora los comentarios |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/01-introduccion) · **Anterior:** [04 · El depurador](/ApuntesProgramacion/01-introduccion/04-depurador) · **Siguiente:** [06 · Argumentos de línea de comandos](/ApuntesProgramacion/01-introduccion/06-argumentos)