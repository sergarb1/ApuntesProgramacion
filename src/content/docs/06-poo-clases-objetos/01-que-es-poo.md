---
title: "01 — Qué es la POO"
description: "Cuando tu código deja de ser una receta y se convierte en un mundo de cosas que hablan entre sí 🏗️"
---

<p><small>Cuando tu código deja de ser una receta y se convierte en un mundo de cosas que hablan entre sí 🏗️</small></p>

> 🗺️ **Estás en:** 🏗️ **U06 · POO: Clases y Objetos** → 01 · Qué es la POO

---

## 📬 La idea en una frase

> **La POO es escribir código como funciona el mundo real: en vez de una lista de instrucciones, modelas *cosas* con sus datos (atributos) y sus comportamientos (métodos).**

Hasta ahora tus programas eran como una **receta de cocina**: haz esto, luego esto, luego lo otro. Muy ordenado, pero muy rígido. Si quieres representar a dos estudiantes, dos coches o dos galletas... empiezas a copiar y pegar variables como un loco. Y cuando el programa crece, la receta se convierte en un caos.

La POO llega para poner orden: en lugar de variables sueltas, agrupas los datos *de la misma cosa* junto con lo que esa cosa *sabe hacer*. Un perro no es solo un `String nombre` y un `int edad` sueltos por ahí: es un **objeto** que tiene nombre, edad, y sabe ladrar.

---

## 📜 De la receta al mundo real

Imagina que tienes que gestionar los datos de un estudiante sin POO:

```java
String nombre1 = "Ana";
int edad1 = 20;
double nota1 = 8.5;

String nombre2 = "Luis";
int edad2 = 19;
double nota2 = 6.0;
```

Con dos estudiantes, ya son seis variables. Con cincuenta, es la peor pesadilla de tu vida. Los datos de cada persona están **desconectados**: no hay nada que diga "nombre1, edad1 y nota1 van juntos porque son Ana".

Con POO agrupas todo eso en una pieza:

```java
public class Estudiante {
    String nombre;
    int edad;
    double nota;
}
```

Y cada estudiante es un **objeto** con sus tres datos dentro, bien atados. Ya no tienes variables sueltas: tienes *personas*.

> 💡 **Tip:** cuando veas código lleno de `nombre1`, `nombre2`, `nombre3`, huele a que ahí dentro quiere nacer una clase. Ese olfato se entrena, y esta unidad es tu gimnasio.

---

## 🧩 Los dos ingredientes: atributos y métodos

Toda clase se construye con dos ingredientes:

- **Atributos (o propiedades):** los datos que describen la cosa. El color del coche, la edad del perro, el saldo de la cuenta.
- **Métodos (o comportamientos):** lo que la cosa *sabe hacer*. Acelerar, ladrar, retirar dinero.

```java
public class Perro {
    // Atributos
    String nombre;
    int edad;

    // Métodos
    void ladrar() {
        System.out.println(nombre + ": ¡Guau!");
    }
}
```

> 📝 **Nota:** todavía no ejecutamos nada. Esta clase es solo el *diseño*. Que exista `Perro` no significa que exista un perro. Eso llegará en el punto 2 con `new`.

---

## 🏛️ Los cuatro pilares (una promo, no el capítulo)

La POO se apoya en cuatro pilares. En esta unidad tocamos el primero a fondo y hacemos la promo de los demás:

1. **Abstracción:** te quedas con lo importante de una cosa y te olvidas del ruido. Un gato en un programa es `nombre`, `edad` y `maullar()`, no sus bigotes.
2. **Encapsulación (U07):** cada objeto protege sus datos y decide quién puede tocarlos. Como una cuenta bancaria: el saldo no está tirado en la calle.
3. **Herencia (U08):** una clase puede "heredar" de otra. Un `Perro` es un `Animal` y, además, ladra.
4. **Polimorfismo (U08):** el mismo mensaje, distintas respuestas. Todos los animales "hacen sonido"; el perro ladra y el gato maúlla.

> ⚠️ **Advertencia:** no te estreses con los pilares 2, 3 y 4. Esta unidad te da los cimientos; los demás los levantamos en la U07 y la U08. Aquí manda la abstracción y el nacimiento de las clases.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuando veas una clase, pregúntate siempre dos cosas: *¿qué datos tiene?* (atributos) y *¿qué sabe hacer?* (métodos). Si sabes responder, ya has entendido el 80% de la POO.

**Ejercicio: clasifica**

Sin ejecutar nada, decide para cada uno de estos si es un **atributo** o un **método** de una clase `Videojuego`:

1. `String titulo;`
2. `void pausar() { ... }`
3. `int nivelMaximo;`
4. `double calcularPuntuacion() { ... }`
5. `boolean estaInstalado;`

<details>
<summary>🔄 Solución</summary>

1. **Atributo** — el título es un dato que describe al juego.
2. **Método** — pausar es algo que el juego *sabe hacer*.
3. **Atributo** — el nivel máximo es un dato.
4. **Método** — calcular la puntuación es un comportamiento (además devuelve un `double`).
5. **Atributo** — si está instalado o no es un dato (un `boolean`).

La regla de oro: **atributo = sustantivo (dato), método = verbo (acción)**. Si lo puedes conjugar ("pausar", "calcular"), es método. Si lo puedes describir ("título", "nivel"), es atributo.

</details>

---

## ❓ ¡No hay preguntas tontas!

> **Q:** Vale, pero yo ya sé hacer programas con variables y bucles. ¿De verdad necesito todo este rollo?
>
> **A:** Para un programa de 30 líneas, no. Para cualquier cosa que vaya a crecer, sí. Los bucles y variables siguen estando (no los abandonamos, los usamos *dentro* de los métodos), pero la POO te da una forma de organizar el código que escala. Nadie escribe un programa de empresa con una sola lista de instrucciones. Bueno, nadie *sano*.

> **Q:** ¿La POO es solo cosa de Java?
>
> **A:** No. Es una *forma de pensar* que usan casi todos los lenguajes modernos: Python, JavaScript, C++, C#... Cada uno con su acento, pero la idea es la misma: modelar el mundo en objetos. Aprenderla aquí te sirve para todos.

> **Q:** ¿Qué pasa con el `main` que llevo escribiendo desde la U01? ¿Ahora no sirve?
>
> **A:** El `main` sigue siendo la puerta de entrada: lo que hay dentro de `main` es la "receta" que arranca la película. Lo que cambia es que ahora, dentro de ese `main`, en vez de variables sueltas crearás objetos. El `main` sigue siendo el director; solo cambia el reparto.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué dos ingredientes forman una clase?
2. ¿Qué pilar de la POO consiste en "quedarte con lo importante"?
3. ¿Un `String color;` dentro de una clase es atributo o método?
4. ¿En qué unidades se ven la encapsulación y la herencia?

<details>
<summary>🔄 Respuestas</summary>

1. **Atributos** (los datos) y **métodos** (los comportamientos).
2. La **abstracción**.
3. **Atributo** — es un dato (un sustantivo), no una acción.
4. La **encapsulación** en la U07 y la **herencia** (y el polimorfismo) en la U08.

</details>

---

## ✅ Resumen en 3 frases

1. La **POO** modela el mundo real en objetos con **atributos** (datos) y **métodos** (comportamientos), en vez de una lista de instrucciones.
2. La **clase** es el diseño de la cosa; aún no hay ninguna "cosa" real hasta que no la instancies.
3. Los cuatro pilares son **abstracción, encapsulación, herencia y polimorfismo**; en esta unidad cimentamos el primero.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | POO | Paradigma que organiza el código en objetos |
> | Atributo | Dato que describe a la cosa: `color`, `edad` |
> | Método | Comportamiento que la cosa sabe hacer: `acelerar()` |
> | Abstracción | Quedarte con lo esencial y olvidar el ruido |
> | Procedural | Estilo antiguo: una receta de instrucciones en orden |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/06-poo-clases-objetos) · **Anterior:** [Índice de la unidad](/ApuntesProgramacion/06-poo-clases-objetos) · **Siguiente:** [02 · Clases y objetos: el cortapastas y las galletas](/ApuntesProgramacion/06-poo-clases-objetos/02-clases-objetos)