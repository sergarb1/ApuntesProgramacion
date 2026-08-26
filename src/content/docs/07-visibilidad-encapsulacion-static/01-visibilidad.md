---
title: "01 — Visibilidad: el arte de no enseñarlo todo"
description: "Vivir en una casa de cristal está fatal: tu código también merece puertas, llaves y candados 🏠"
---

<p><small>Vivir en una casa de cristal está fatal: tu código también merece puertas, llaves y candados 🏠</small></p>

> 🗺️ **Estás en:** 🔒 **U07 · Visibilidad, Encapsulación y Static** → 01 · Visibilidad: el arte de no enseñarlo todo

---

## 📬 La idea en una frase

> **Si todo en tu clase es `public`, cualquier persona (o tú mismo dentro de un año) puede romper tus objetos. La visibilidad es el arte de decidir qué muestra tu clase y qué se queda en casa.**

En la U06 construiste clases con atributos y métodos. Pero hay una pregunta que no te hiciste: *¿y si alguien le pone `edad = -666` a mi objeto Persona?* Si todo es público, cualquiera puede hacerlo desde cualquier sitio. Y ahí es donde empieza esta unidad: en el momento en el que tu código necesita **puertas**.

---

## 🏠 El problema de la casa de cristal

Imagina que vives en una casa de cristal. Cualquiera puede verlo todo: tu ropa interior, tu colección de cromos, esa caja de galletas vacía que guardas "por si acaso". Incómodo, ¿verdad? Pues lo mismo pasa con tus objetos si todo es público:

```java
Persona p = new Persona();
p.edad = -666;          // Edad negativa... Esto no tiene sentido.
p.saldo = 999999999;    // Y encima te multiplicas el saldo por cero.
```

Tu objeto queda hecho unos zorros. Nadie ha cometido un error grave: el problema es que **tu clase permitía hacerlo**. No pusiste candado. La visibilidad es exactamente eso: decidir qué partes de tu clase son de acceso público y cuáles están fuera de la vista de todo el mundo.

> ⚠️ **Advertencia:** un atributo `public` es como dejar la puerta de tu casa abierta con un cartel que pone "Pasen y toquen todo". Tarde o temprano, alguien lo hará.

---

## 🚪 Por qué importa la visibilidad

Vale, ¿y por qué no lo dejamos todo `public` y tan contentos? Por tres motivos que en el mundo laboral son oro puro:

1. **Control:** decides qué puede leerse, qué puede modificarse y qué ni se toca. Nada de edades negativas ni saldos imposibles.
2. **Seguridad:** nadie puede dejar tu objeto en un estado inconsistente (por ejemplo, una cuenta con saldo negativo).
3. **Mantenibilidad:** si cambias por dentro cómo se calcula algo, el código de fuera no se entera. Los cambios internos no rompen a tus usuarios.

En los próximos puntos verás las herramientas exactas (modificadores, getters y setters, `static`). Pero primero necesitas el concepto: **tu clase es una caja, y tú decides quién tiene la llave**.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** la visibilidad no es un capricho: es el contrato que tu clase firma con el resto del mundo. Antes de escribir `public` en un atributo, pregúntate: *¿de verdad quiero que cualquiera pueda cambiarlo?*

**Ejercicio: el supermercado sin puertas**

Aquí tienes una clase de la U06 escrita "a lo bruto", con todo público:

```java
public class Carrito {
    public String cliente;
    public int total;          // en céntimos
    public int articulos;
}

public class Supermercado {
    public static void main(String[] args) {
        Carrito c = new Carrito();
        c.cliente = "Pepita";
        c.total = -5000;       // ¿Una compra negativa? ¡Claro!
        c.articulos = -3;      // -3 artículos, genial.
    }
}
```

**Preguntas (sin ejecutar):**

1. ¿Qué hay de raro en `c.total = -5000`?
2. ¿Qué daños colaterales tendría que un `main` de cualquier clase pudiera hacer esto en un programa de verdad?
3. ¿Quién tendría que impedirlo: el `main` o la propia clase `Carrito`?

<details>
<summary>🔄 Solución</summary>

1. Un total de -5000 céntimos es imposible en la realidad: nadie te paga por llevarse la compra. El atributo acepta cualquier valor porque es `public` y no hay filtro.
2. En un programa grande, otro compañero (o tú dentro de tres meses) podría meter valores imposibles, romper la lógica de precios y hacer que el bug apareciera a kilómetros del sitio donde se originó. Encontrarlo costaría horas.
3. La propia clase. Ella es la que conoce sus reglas (un total no puede ser negativo), así que ella debe blindarse. Eso es la **encapsulación** de los puntos 3 y 4.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué problema tiene que todos los atributos de una clase sean `public`?
2. ¿Qué ganas al esconder la implementación interna de tu clase?
3. ¿Quién es el responsable de que una clase no acepte valores imposibles?
4. ¿Por qué es importante la visibilidad para el mantenimiento del código?

<details>
<summary>🔄 Respuestas</summary>

1. Cualquier clase puede modificar los atributos directamente y dejar el objeto en un estado imposible (edades negativas, saldos inventados...).
2. Control, seguridad y mantenibilidad: puedes cambiar cómo funciona por dentro sin que el código de fuera se entere ni se rompa.
3. La propia clase. Es la que conoce sus reglas de negocio, así que es la que debe validar y esconder.
4. Porque los cambios internos no rompen al código que usa la clase: el "contrato" público se mantiene estable.

</details>

---

## ✅ Resumen en 3 frases

1. La **visibilidad** decide qué partes de tu clase puede ver y usar el resto del mundo.
2. Con todo `public`, cualquier código puede romper tus objetos con valores imposibles.
3. Esconder datos te da **control, seguridad y mantenibilidad**: los tres superpoderes del programador que no llora depurando.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Visibilidad | Qué se ve de una clase desde fuera |
> | `public` | Visible para todos, absolutamente todos |
> | Atributo | La "caja" de datos de la clase (ej. `edad`) |
> | Estado inconsistente | Un objeto con valores imposibles (ej. `edad = -5`) |
> | Contrato público | Lo que tu clase promete al mundo exterior |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/07-visibilidad-encapsulacion-static) · **Anterior:** [Índice de la unidad](/ApuntesProgramacion/07-visibilidad-encapsulacion-static) · **Siguiente:** [02 · public, private y protected](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/02-public-private-protected)
