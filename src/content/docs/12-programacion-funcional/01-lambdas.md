---
title: "01 · Lambdas: funciones que viajan solas"
description: "La flecha `->`, la sintaxis de las lambdas y la primera vez que guardas una función en una variable 🏹"
---

<p><small>La flecha `->`, la sintaxis de las lambdas y la primera vez que guardas una función en una variable 🏹</small></p>

> 🗺️ **Estás en:** 🎯 **U12 · Programación Funcional** → 01 · Lambdas: funciones que viajan solas

---

## 📬 La idea en una frase

> **Una lambda es una función sin nombre que puedes tratar como un valor: guardarla en una variable, pasarla a un método o devolverla. Es la respuesta de Java a "quiero pasarle a este método un comportamiento, no solo datos".**

En la U10 viste las colecciones y en la U11 los genéricos y los mapas. Todo genial. Pero para recorrerlas siempre había una constante: los bucles y los métodos uno tras otro. Hoy cambia la jugada: las funciones dejan de estar encadenadas a una clase y empiezan a **viajar solas**.

---

## 😱 La forma antigua: clases anónimas

Imagina que quieres pasarle a algo "la acción de imprimir un saludo". Antes de las lambdas, Java solo te dejaba hacerlo con una **clase anónima**: una clase sin nombre que defines sobre la marcha, solo para implementar un método y regalárselo a otro sitio.

```java
Runnable tarea = new Runnable() {
    @Override
    public void run() {
        System.out.println("Hola");
    }
};
```

Fíjate en el espectáculo: para decir "imprime Hola" necesitas `new Runnable()`, una clase anónima, `@Override`, `public void run()`... seis líneas para una idea de una. Java siempre ha sido muy de ir por las ramas.

---

## 🏹 Llega la flecha: la lambda

Una **expresión lambda** (del griego lambda, y no, no tiene nada que ver con los lámbada de la serie *Futurama*... o sí, porque los dos son raros) es exactamente esa idea en una línea:

```java
Runnable tarea = () -> System.out.println("Hola");
```

Se lee: "sin parámetros, haz `System.out.println("Hola")`". La flecha `->` separa **los parámetros** (a la izquierda) del **cuerpo** (a la derecha). Es como decir: "con estos datos, haz esto".

La sintaxis tiene varias caras:

```java
() -> System.out.println("Hola");        // sin parámetros
(x) -> x * 2;                            // un parámetro con paréntesis
x -> x % 2 == 0;                         // un parámetro SIN paréntesis (permitido)
(a, b) -> a + b;                         // dos parámetros
nombre -> {                              // cuerpo con bloque: varias sentencias
    String saludo = "Hola, " + nombre;
    System.out.println(saludo);
}
```

Reglas de oro:

- **Un solo parámetro** → puedes quitar los paréntesis: `x -> x * 2`.
- **El tipo se infiere** → no escribes `(Integer x) -> ...` a menos que te apetezca.
- **Cuerpo de una sola expresión** → no necesita `return` ni llaves.
- **Cuerpo con bloque** → necesitas `{ }` y `return` si devuelves algo.

---

## 📦 Funciones que viajan en variables

Aquí viene la parte que te va a volar la cabeza: la lambda no necesita pertenecer a ninguna clase concreta. Solo necesita una **interfaz funcional**: una interfaz con un único método abstracto (en el punto 2 profundizamos). Con eso, la función viaja como un valor.

```java
interface Transformador {
    int transformar(int x);
}

public class Demo {
    public static void main(String[] args) {
        Transformador doble = x -> x * 2;           // guardo una función en una variable
        Transformador sumaUno = x -> x + 1;         // y otra

        System.out.println(doble.transformar(5));   // 10
        System.out.println(sumaUno.transformar(5)); // 6
    }
}
```

`doble` no es un número ni un String: es **una función**. La has metido en una variable como quien guarda un lápiz en el bolsillo. Y puedes pasarla a otros métodos, guardarla en listas... ya no eres tú quien llama a la función: la función viaja sola hasta donde haga falta.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** una lambda con un solo parámetro puede quitarse los paréntesis, pero con dos o más (o ninguno) no hay atajo: `(a, b) -> ...` y `() -> ...`.

**Ejercicio: el contador de viajes**

```java
interface Viajera {
    String viajar(String destino);
}

public class Demo {
    public static void main(String[] args) {
        Viajera saludo = destino -> "¡Bienvenida a " + destino + "!";
        System.out.println(saludo.viajar("Valencia"));
    }
}
```

**¿Qué imprime?**

- (A) `¡Bienvenida a Valencia!`
- (B) `saludo@1234abcd`
- (C) Error de compilación: las lambdas no pueden devolver Strings.
- (D) `destino`

<details>
<summary>🔄 Solución</summary>

La **A**. La lambda `destino -> "¡Bienvenida a " + destino + "!"` tiene un cuerpo que es una sola expresión, así que el resultado de esa expresión es lo que devuelve la interfaz. No hace falta `return` ni llaves: una expresión → devuelve. `saludo.viajar("Valencia")` ejecuta la lambda con `destino = "Valencia"` y obtienes la frase completa. Las lambdas no son objetos raros que se imprimen como `saludo@...`: cuando las llamas, ejecutan su cuerpo.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué significa la flecha `->` en una lambda?
2. ¿Cuándo puedes omitir los paréntesis de los parámetros?
3. ¿Qué tipo necesita la variable que guarda una lambda?
4. ¿Cuál es la ventaja de una lambda frente a una clase anónima?

<details>
<summary>🔄 Respuestas</summary>

1. Separa los parámetros (izquierda) del cuerpo (derecha): "con estos datos, haz esto".
2. Cuando hay exactamente un parámetro: `x -> x * 2`. El tipo se infiere solo.
3. Una interfaz funcional: una interfaz con un único método abstracto.
4. Menos ruido: la misma idea en una línea, sin `new Interfaz() { ... }` ni `@Override`.

</details>

---

## ✅ Resumen en 3 frases

1. Una **lambda** es una función sin nombre que se escribe con la flecha `->` y se puede tratar como un valor: `(x) -> x * 2`.
2. Se usa donde antes hacía falta una **clase anónima**: menos llaves, menos ruido, exactamente la misma idea.
3. Para guardarla en una variable necesitas una **interfaz funcional**: una interfaz con un único método abstracto.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Lambda | Función sin nombre, escrita con `->` |
> | Flecha `->` | Separa parámetros de cuerpo en una lambda |
> | Clase anónima | Clase sin nombre definida sobre la marcha (la forma antigua) |
> | Interfaz funcional | Interfaz con un único método abstracto |
> | Variable funcional | Variable cuyo tipo es una interfaz funcional y guarda una lambda |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/12-programacion-funcional) · **Anterior:** — · **Siguiente:** [02 · Interfaces funcionales: Predicate, Function, Consumer, Supplier](/ApuntesProgramacion/12-programacion-funcional/02-interfaces-funcionales)