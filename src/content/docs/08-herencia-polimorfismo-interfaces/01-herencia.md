---
title: "01 — Herencia: cuando tus hijos siguen tus pasos"
description: "extends, qué se hereda y qué no, IS-A vs HAS-A y el árbol genealógico de tus clases 🧬"
---

<p><small>extends, qué se hereda y qué no, IS-A vs HAS-A y el árbol genealógico de tus clases 🧬</small></p>

> 🗺️ **Estás en:** 🧬 **U08 · Herencia, Polimorfismo e Interfaces** → 01 · Herencia: cuando tus hijos siguen tus pasos

---

## 📬 La idea en una frase

> **La herencia permite que una clase hija obtenga los miembros de una clase padre con `extends`, reutilizando código y añadiendo o mejorando lo que haga falta.**

¿Recuerdas cuando heredaste la nariz de tu abuela o el genio para enfadar a los profesores? Pues en Java pasa lo mismo, pero con menos drama y más código reutilizable.

---

## 🧬 ¿Qué es la herencia?

La herencia es el mecanismo por el cual una clase _hija_ (subclase) obtiene todos los miembros de una clase _padre_ (superclase). Y puede hacer dos cosas más: **añadir** los suyos propios y **mejorar** los existentes.

```java
public class Animal {
    protected String nombre;
    protected int edad;

    public void hacerSonido() {
        System.out.println("Algún sonido genérico...");
    }
}

public class Perro extends Animal {
    public void hacerSonido() {
        System.out.println("¡Guau guau!");
    }

    public void moverCola() {
        System.out.println("*mueve la cola felizmente*");
    }
}
```

`Perro` ahora tiene `nombre`, `edad`, `hacerSonido()` (mejorado) y `moverCola()`. Cortesía de la herencia.

> 💡 **Consejo:** código reutilizado, neuronas ahorradas. La herencia existe para que NO tengas que copiar y pegar el mismo código en 15 clases.

---

## 🔑 extends: "Soy como tú, pero con mejoras"

La palabra clave es `extends` (lo viste en la U07 por encima, ahora lo dominas):

```java
public class Coche extends Vehiculo {
    // Coche tiene TODO lo de Vehiculo + lo suyo
}
```

Detrás de cada `extends` hay una pregunta: **¿realmente es-un?** Si la respuesta es sí, adelante. Si es "tiene-un"... eso es composición, y la verás en el punto 3.

### ¿Qué se hereda y qué no?

No todo viaja de padres a hijos. Esta tabla te lo aclara:

| Miembro | ¿Lo hereda la hija? |
|---|---|
| `public` | ✅ Sí |
| `protected` | ✅ Sí |
| package-private (sin modificador) | ✅ Sí, si está en el mismo paquete |
| `private` | ❌ No (pero existe dentro del objeto) |
| Constructores | ❌ No (se invocan con `super()`, punto 2) |
| Métodos `final` | ❌ No se pueden sobrescribir |

> ⚠️ **Advertencia:** los miembros `private` no se heredan, pero siguen ahí, dentro del objeto. La hija no puede tocarlos directamente, pero el padre los usa. Es como el dinero en la cuenta de tus padres: existe, pero no lo tocas.

---

## ⚖️ La regla de oro: IS-A vs HAS-A

- **IS-A** (es-un): relación de herencia. `Perro` IS-A `Animal`.
- **HAS-A** (tiene-un): relación de composición. `Coche` HAS-A `Motor`.

```java
public class Coche extends Vehiculo { }   // IS-A ✓
public class Coche { private Motor m; }   // HAS-A ✓
```

> 🎮 **¿Quién quiere ser millonario? — Edición Java:**
> ¿Cuál es la relación correcta? a) `Cliente extends Persona`  b) `Cliente has-a Persona`  c) `Coche extends Rueda`
>
> **Respuesta:** la a. `Cliente` IS-A `Persona`. `Coche` NO es una rueda: tiene ruedas (HAS-A). Si dudaste con la c, repasa tu vocabulario de coches.

---

## 🌳 Jerarquía de clases: el árbol genealógico

Una clase puede heredar de otra que a su vez hereda de otra. Así se forman las jerarquías:

```java
public class Animal { }
public class Mamifero extends Animal { }
public class Canino extends Mamifero { }
public class Perro extends Canino { }
```

`Perro` hereda de `Canino`, que hereda de `Mamifero`, que hereda de `Animal`. Cada generación aporta lo suyo:

```
       Animal
         │
     ┌───┴───┐
  Mamifero   Ave
     │
  Canino
     │
   Perro
```

> 📝 **Nota:** cuanto más arriba en el árbol, más general es la clase; cuanto más abajo, más específica. `Animal` no sabe ladrar; `Perro` no sabe volar. Cada uno en su nivel.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuando una clase hereda, se lleva TODO lo accesible. Pregúntate siempre qué ve la hija antes de escribir `extends`.

**Ejercicio: el examen de visibilidad**

```java
public class Animal {
    private String idSecreto = "X-123";
    protected String nombre = "Animal";
    public int edad = 5;
}

public class Perro extends Animal {
    public void mostrar() {
        System.out.println(idSecreto); // ¿compila?
        System.out.println(nombre);    // ¿compila?
        System.out.println(edad);      // ¿compila?
    }
}
```

**Preguntas (sin ejecutar):**

1. ¿Cuál de las tres líneas compila?
2. ¿Qué pasaría si `idSecreto` fuese `protected` en vez de `private`?

<details>
<summary>🔄 Solución</summary>

1. `idSecreto` **NO** compila (es `private`: solo `Animal` lo ve). `nombre` **sí** (es `protected`). `edad` **sí** (es `public`).
2. Entonces `Perro` lo vería sin problema. `protected` es el "secreto de familia" del que hablarás en el punto 3.

</details>

**Ejercicio: ¿qué imprime?**

```java
class Abuelo { void decir() { System.out.println("Abuelo"); } }
class Padre extends Abuelo { void decir() { System.out.println("Padre"); } }
class Hijo extends Padre { void decir() { System.out.println("Hijo"); } }

public class Test {
    public static void main(String[] args) {
        new Hijo().decir();
    }
}
```

<details>
<summary>🔄 Solución</summary>

Imprime **"Hijo"**. Java busca el método desde la clase más específica hacia arriba: encuentra `decir()` en `Hijo` y ahí se queda. Nunca sube a `Padre` ni a `Abuelo`.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué palabra clave usas para que `Perro` herede de `Animal`?
2. ¿Se heredan los atributos `private`? ¿Y los `protected`?
3. ¿`Coche extends Rueda` es buena idea? ¿Por qué?
4. ¿Qué significa que una jerarquía de clases es un "árbol genealógico"?

<details>
<summary>🔄 Respuestas</summary>

1. `extends`: `public class Perro extends Animal { }`.
2. `private` no se heredan; `protected` sí (y también `public`).
3. No: `Coche` no es una rueda, tiene ruedas. Sería HAS-A (composición), no IS-A.
4. Que cada nivel es más específico: `Perro` hereda de `Canino`, que hereda de `Mamifero`, que hereda de `Animal`.

</details>

---

## ✅ Resumen en 3 frases

1. **La herencia** con `extends` permite que una subclase reutilice y mejore los miembros de su superclase.
2. Solo se hereda lo **accesible** (`public`, `protected` y package-private); los `private` y los constructores no.
3. Antes de heredar, pregunta: **¿es-un?** Si es "tiene-un", usa composición.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Superclase | La clase padre, la general |
> | Subclase | La clase hija, la específica |
> | `extends` | La palabra que establece la herencia |
> | IS-A | Relación de herencia (Perro es-un Animal) |
> | HAS-A | Relación de composición (Coche tiene-un Motor) |
> | Jerarquía | El árbol de clases de general a específico |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces) · **Anterior:** — · **Siguiente:** [02 · super y @Override](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/02-super-override)