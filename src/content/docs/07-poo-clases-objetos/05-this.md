---
title: "05 — La palabra clave this"
description: "El objeto gritando «¡hablo de mí, no de otro!» para desambiguar y encadenar constructores 🗣️"
---

<p><small>El objeto gritando «¡hablo de mí, no de otro!» para desambiguar y encadenar constructores 🗣️</small></p>

> 🗺️ **Estás en:** 🏗️ **U07 · POO: Clases y Objetos** → 05 · La palabra clave this

---

## 📬 La idea en una frase

> **`this` es el objeto hablando de sí mismo: sirve para desambiguar entre atributo y parámetro, para llamar a otro constructor, y para pasarte a ti mismo como argumento.**

Tienes un problema clásico: el parámetro se llama igual que el atributo. `nombre` aquí, `nombre` allá... ¿a cuál te refieres? Java necesita que le des una pista, y esa pista se llama `this`.

---

## 🔍 Desambiguar: atributo vs parámetro

Cuando el parámetro de un método (o constructor) se llama igual que un atributo, hay un **choque de nombres**. Sin `this`, Java da preferencia al parámetro (el más cercano), así que el atributo se queda sin tocar:

```java
public class Persona {
    String nombre;
    int edad;

    public Persona(String nombre, int edad) {
        // Sin this: "nombre" es el parámetro, el atributo se queda con su valor por defecto
        nombre = nombre;   // ❌ no hace nada útil
        this.nombre = nombre;   // ✅ atributo = parámetro
        this.edad = edad;       // ✅ atributo = parámetro
    }
}
```

`this.nombre` significa **"el atributo `nombre` de ESTE objeto"**; `nombre` a secas (a la derecha) es el parámetro. El `this.` es la mano que señala: *"hablo del mío, no del tuyo"*.

> ⚠️ **Advertencia:** si no hay choque de nombres, `this` es opcional. Puedes escribir `acelerar(int inc) { velocidad += inc; }` sin `this`, porque `velocidad` solo puede ser el atributo. Pero cuando hay ambigüedad, `this` es obligatorio si quieres tocar el atributo.

---

## 🔗 Llamar a otro constructor: `this(...)`

`this` también sirve para llamar a un constructor desde otro constructor de la misma clase. Útil para no repetir código:

```java
public class Galleta {
    String forma;
    boolean tieneChocolate;

    public Galleta() {
        this("redonda", false);   // "llama al otro constructor"
    }

    public Galleta(String forma, boolean tieneChocolate) {
        this.forma = forma;
        this.tieneChocolate = tieneChocolate;
    }
}
```

Ahora `new Galleta()` y `new Galleta("redonda", false)` hacen lo mismo, pero el código solo está escrito una vez. Una regla de oro:

> 💡 **Tip:** el `this(...)` que llama a otro constructor **debe ser la primera instrucción** del constructor. Java no deja que hagas otras cosas antes. Es la presentación antes de la fiesta: primero llamas al otro constructor y luego ya te pones a hacer tus cosas.

---

## 📦 Pasarte a ti mismo como argumento

`this` también puede viajar: pasas el objeto actual como argumento a otro método. Es la manera que tiene un objeto de decir: *"oye, pásame a mí mismo"*.

```java
public class Cliente {
    String nombre;

    void presentarse() {
        System.out.println("Hola, soy " + nombre);
    }
}

public class Sala {
    void recibir(Cliente c) {
        c.presentarse();
    }
}
```

```java
Cliente ana = new Cliente();
ana.nombre = "Ana";
Sala sala = new Sala();
sala.recibir(ana);   // desde fuera, pasas la variable
```

Dentro de la propia clase `Cliente` podrías hacer `sala.recibir(this)` para pasarte a ti mismo sin tener la variable a mano. Este caso te sonará "raro" ahora, pero es la semilla de patrones que verás en módulos más avanzados. Por ahora, memoriza la idea: **`this` es la referencia al objeto actual**.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** para decidir si hace falta `this`, pregúntate: *¿hay un parámetro o variable local con el mismo nombre que el atributo?* Si sí, `this.` señala al atributo. Si no, no lo necesitas.

**Ejercicio: ¿compila o no?**

Estas dos líneas están dentro de un constructor `Persona(String nombre)`. Una funciona y la otra es una pérdida de tiempo. ¿Cuál y por qué?

```java
nombre = nombre;        // línea A
this.nombre = nombre;   // línea B
```

<details>
<summary>🔄 Solución</summary>

La **línea B** es la que hace algo: `this.nombre = nombre` copia el parámetro en el atributo. La **línea A** (`nombre = nombre`) asigna el parámetro... al parámetro: el atributo se queda con su valor por defecto (`null`). Es como intentar llenar tu vaso vertiendo el agua de tu vaso en tu vaso: las ganas no faltan, pero el resultado es cero.

</details>

---

## ❓ ¡No hay preguntas tontas!

> **Q:** `this` es una palabra reservada, ¿no? ¿Puedo usarla fuera de una clase?
>
> **A:** No. `this` fuera de una clase es como pedir una pizza en una ferretería: no tiene sentido. Solo existe dentro del contexto de un objeto, es decir, dentro de métodos no estáticos y constructores de una clase.

> **Q:** ¿Y qué pasa con los métodos `static`? ¿Ahí puedo usar `this`?
>
> **A:** No, y ese es el clásico de los exámenes. Los métodos `static` no pertenecen a un objeto concreto, así que no hay "este objeto" al que señalar. Usar `this` en un `static` es error de compilación. Los `static` tienen su propia unidad: la U08.

> **Q:** ¿Por qué en el punto 3 escribí métodos sin `this` y funcionaban?
>
> **A:** Porque no había ambigüedad. En `int volumen() { return ancho * alto * profundo; }` no hay ningún parámetro llamado `ancho`, así que Java solo puede referirse al atributo. `this` es el que habla en voz alta cuando hay dos personas llamadas igual en la sala.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué significa `this.nombre`?
2. ¿Cuándo es obligatorio usar `this`?
3. ¿Qué regla debe cumplir el `this(...)` que llama a otro constructor?
4. ¿Puedo usar `this` dentro de un método `static`?

<details>
<summary>🔄 Respuestas</summary>

1. El **atributo `nombre` del objeto actual**.
2. Cuando hay un **choque de nombres**: un parámetro o variable local con el mismo nombre que el atributo.
3. Debe ser la **primera instrucción** del constructor.
4. **No.** Los métodos `static` no pertenecen a un objeto, así que no hay "este objeto" que señalar.

</details>

---

## ✅ Resumen en 3 frases

1. **`this`** es la referencia al objeto actual: `this.nombre` habla del atributo, `nombre` a secas del parámetro.
2. **`this(...)`** encadena constructores de la misma clase y debe ir siempre primero.
3. No hace falta `this` sin ambigüedad, y está **prohibido** dentro de métodos `static`.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `this` | La referencia al objeto actual |
> | Desambiguar | Dejar claro a qué `nombre` te refieres |
> | Choque de nombres | Parámetro y atributo con el mismo nombre |
> | `this(...)` | Llamada a otro constructor de la misma clase |
> | `static` | Contexto sin objeto (no admite `this`) |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/07-poo-clases-objetos) · **Anterior:** [04 · Constructores](/ApuntesProgramacion/07-poo-clases-objetos/04-constructores) · **Siguiente:** [06 · Referencias, null y memoria](/ApuntesProgramacion/07-poo-clases-objetos/06-referencias-memoria)