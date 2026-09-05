---
title: "02 — Clases y objetos: el cortapastas y las galletas"
description: "El molde, la galleta, `new` y tu primera clase: ya no escribes recetas, horneas 🍪"
---

<p><small>El molde, la galleta, `new` y tu primera clase: ya no escribes recetas, horneas 🍪</small></p>

> 🗺️ **Estás en:** 🏗️ **U07 · POO: Clases y Objetos** → 02 · Clases y objetos: el cortapastas y las galletas

---

## 📬 La idea en una frase

> **Una clase es el cortapastas (el molde) y un objeto es la galleta que haces con él: un solo molde, millones de galletas, y cada una con su propio sabor.**

En el punto 1 viste que una clase es un diseño. Ahora toca la pregunta del millón: ¿y qué hago con un diseño? Lo uso para **fabricar cosas**. Y en Java, la fábrica se llama `new`.

---

## 🍪 El cortapastas y la galleta

Imagina la cocina de tu abuela. Tiene un cortapastas con forma de estrella. Ese cortapastas es **la clase**: define la forma de todas las galletas, pero él mismo no es una galleta. Puedes usarlo mil veces y cada galleta será distinta: unas con pepitas de chocolate, otras de vainilla, otras que tu prima se come a medio hacer.

En programación:

- **Clase** = el cortapastas. Define *qué atributos* y *qué métodos* tendrán todas sus galletas.
- **Objeto** = la galleta. Una cosa concreta, con sus propios valores, viviendo en la memoria.

Así que de un solo molde salen infinitas galletas, todas con la misma forma pero cada una con su propia vida.

---

## 🔨 Tu primera clase

Vamos a escribir el cortapastas `Galleta`:

```java
public class Galleta {
    String sabor;
    boolean tieneChocolate;

    void comer() {
        System.out.println("Ñam, galleta sabor " + sabor);
    }
}
```

Esto solo define el molde. Por ahora, **no existe ninguna galleta en memoria**. Es un archivo en el disco esperando a que alguien lo use.

> 📝 **Nota:** la clase lleva `public class Galleta` y el archivo se llama `Galleta.java`. El nombre de la clase y del archivo deben coincidir. Es la primera regla no escrita de Java... vale, sí escrita.

---

## 🏭 `new`: la máquina de galletas

Para fabricar galletas (objetos) a partir del molde usas el operador `new`:

```java
public class Pasteleria {
    public static void main(String[] args) {
        Galleta g1 = new Galleta();          // Primera galleta
        g1.sabor = "Chocolate";
        g1.tieneChocolate = true;

        Galleta g2 = new Galleta();          // Segunda galleta (mismo molde)
        g2.sabor = "Vainilla";
        g2.tieneChocolate = false;

        g1.comer();   // "Ñam, galleta sabor Chocolate"
        g2.comer();   // "Ñam, galleta sabor Vainilla"
    }
}
```

Desmenucemos la línea estrella: `Galleta g1 = new Galleta();`

1. `Galleta g1` — declara una variable que apuntará a una galleta.
2. `new Galleta()` — fabrica la galleta en memoria (y llama a su constructor, que verás en el punto 4).
3. `=` — conecta la variable `g1` con la galleta recién horneada.

Después, con `g1.sabor = "Chocolate"` y `g1.comer()`, le dices a *esa* galleta concreta qué sabor tiene y que se coma. La `g2` no se entera de nada: es otra galleta con su propia vida.

> 💡 **Tip:** el punto (`.`) es la mano que tiendes al objeto. `g1.comer()` significa "oye, galleta g1, ejecuta tu método comer". `g1.sabor` significa "dame el sabor de la galleta g1".

---

## 🥊 Clase vs objeto: el ring

**Clase:** — Yo soy el molde, el plano, la idea platónica. Sin mí no existirías. Defino qué atributos y métodos tienen los objetos. ¡Soy la creadora!

**Objeto:** — Sí, pero yo soy quien realmente hace cosas. Tú eres solo un archivo `.java` en el disco. Yo ocupo memoria, tengo estado, puedo cambiar mis atributos. Sin mí tu código no sirve para nada.

**Clase:** — ¿Ah sí? ¿Y cuántos de ti existen? Puedes tener miles de objetos creados a partir de mí. Yo soy única, tú eres una copia. ¡Soy original, eres reproducible!

**Objeto:** — Exacto. Porque tú eres el plano, pero yo soy el edificio construido. Nadie vive en un plano. Cuando ejecutas el programa, el que trabaja soy yo.

**Clase:** — Vale, nos necesitamos. Sin clase no hay objeto. Sin objeto, la clase es solo teoría.

**Objeto:** — Trato hecho.

> 🕶️ **Don Tip:** la clase define el **QUÉ** (atributos) y el **CÓMO** (métodos). El objeto es el **QUIÉN** (la instancia concreta que ejecuta y tiene valores propios).

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuenta cada `new` como una galleta nueva. Cada `new` = un objeto nuevo en memoria, aunque sea del mismo molde.

**Ejercicio: ¿cuántas galletas hay?**

Sin ejecutar, responde: ¿cuántos objetos de la clase `Galleta` existen en memoria al final de este `main`?

```java
public class Pasteleria2 {
    public static void main(String[] args) {
        Galleta g1 = new Galleta();
        Galleta g2 = new Galleta();
        Galleta g3 = g1;
        g1.comer();
    }
}
```

<details>
<summary>🔄 Solución</summary>

**2 objetos.** `g1` y `g2` son dos galletas distintas. `g3 = g1` no crea una tercera galleta: hace que `g3` *apunte a la misma* que `g1`. Dos nombres, una galleta. Esto se llama **alias** y lo destripamos en el punto 6. Por ahora, memoriza: **cada `new` fabrica un objeto; copiar una variable no fabrica nada**.

</details>

---

## ❓ ¡No hay preguntas tontas!

> **Q:** ¿Por qué hace falta escribir `new`? ¿No podría Java crear el objeto solito?
>
> **A:** No, porque `new` es el "permiso de construcción". Sin `new`, solo declaras una variable (como `Galleta g;`), pero no hay galleta en la bandeja, solo un hueco vacío. Hasta que no hagas `new`, el objeto no existe.

> **Q:** ¿Y por qué `String nombre = "Ana";` no lleva `new`?
>
> **A:** Porque Java es un amor con `String`. Es tan común que te deja crearlo con comillas directamente (un literal). Es un atajo: detrás del telón, Java lo trata casi como si tuviera `new`. Pero eso es un privilegio de `String` (y de los arrays), no una norma general. Tú, con tus clases, tendrás que usar `new` como todo el mundo.

> **Q:** ¿Puedo tener varias clases en un mismo archivo `.java`?
>
> **A:** Puedes, pero solo **una** puede ser `public` y debe coincidir con el nombre del archivo. Las demás van sin `public`. Para empezar, un archivo = una clase pública. Simple y limpio.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué es la clase en la analogía del cortapastas?
2. ¿Qué operador fabrica objetos en memoria?
3. ¿Cuántos objetos crea este código: `Galleta a = new Galleta(); Galleta b = new Galleta();`?
4. ¿Para qué sirve el punto (`.`) entre el objeto y el miembro?

<details>
<summary>🔄 Respuestas</summary>

1. La clase es el **cortapastas** (el molde); el objeto es la galleta.
2. `new`.
3. **2 objetos**, uno por cada `new`.
4. Para **acceder** a un atributo (`g.sabor`) o invocar un método (`g.comer()`) de ese objeto concreto.

</details>

---

## ✅ Resumen en 3 frases

1. La **clase** es el molde que define atributos y métodos; el **objeto** es la galleta concreta, con sus propios valores, viviendo en memoria.
2. Se fabrican objetos con **`new`**, y cada `new` crea una instancia independiente aunque use el mismo molde.
3. Con el **punto** (`.`) accedes a los atributos e invocas los métodos de un objeto concreto.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Clase | El molde / cortapastas. Define atributos y métodos |
> | Objeto | La galleta. Instancia concreta con valores propios |
> | Instanciar | Crear un objeto a partir de una clase con `new` |
> | Instancia | Sinónimo de objeto creado |
> | Miembro | Cualquier atributo o método de una clase |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/07-poo-clases-objetos) · **Anterior:** [01 · Qué es la POO](/ApuntesProgramacion/07-poo-clases-objetos/01-que-es-poo) · **Siguiente:** [03 · Atributos y métodos](/ApuntesProgramacion/07-poo-clases-objetos/03-atributos-metodos)