---
title: "03 — Atributos y métodos"
description: "Las propiedades y los comportamientos de tu clase, con sus tipos, parámetros y valores de retorno 🏗️"
---

<p><small>Las propiedades y los comportamientos de tu clase, con sus tipos, parámetros y valores de retorno 🏗️</small></p>

> 🗺️ **Estás en:** 🏗️ **U06 · POO: Clases y Objetos** → 03 · Atributos y métodos

---

## 📬 La idea en una frase

> **Los atributos son las propiedades de la cosa (qué es) y los métodos son sus comportamientos (qué hace): la clase los declara y cada objeto los vive por su cuenta.**

Ya sabes que la clase es el molde. Ahora vamos a vestir ese molde por dentro: qué datos guarda y qué sabe hacer. Los atributos y métodos son la carne de la clase, y es aquí donde tus objetos empiezan a tener vida propia.

---

## 🏷️ Los atributos: las propiedades de la cosa

Un atributo se declara igual que una variable, pero **dentro de la clase** y **fuera de cualquier método**:

```java
public class Coche {
    String marca;       // atributo
    String modelo;      // atributo
    int velocidad;      // atributo
    boolean encendido;  // atributo
}
```

Cada atributo tiene un tipo (que ya dominas de la U02) y describe una propiedad del objeto. Cuando creas un coche con `new Coche()`, ese coche concreto tendrá **su propia copia** de los cuatro atributos. Otro coche, otras copias. Cada galleta lleva sus pepitas.

> 💡 **Tip:** los atributos se declaran con los mismos tipos que las variables: `String`, `int`, `double`, `boolean`... Si dominas la U02, dominas la mitad de este punto.

---

## 🎮 Los métodos: los comportamientos de la cosa

Un método es una acción que el objeto sabe hacer. Tiene nombre, parámetros (los datos de entrada) y un **tipo de retorno** (lo que devuelve):

```java
public class Coche {
    String marca;
    int velocidad;

    // Método que no devuelve nada: solo hace cosas
    void acelerar(int incremento) {
        velocidad += incremento;
    }

    // Método que devuelve un valor: calcula y devuelve
    int velocidadActual() {
        return velocidad;
    }

    // Método que imprime y no devuelve nada
    void mostrarEstado() {
        System.out.println(marca + " va a " + velocidad + " km/h");
    }
}
```

- **`void`** = no devuelve nada. Solo ejecuta (acelera, imprime, saluda...).
- **Tipo normal** (`int`, `double`, `String`...) = devuelve un valor con `return`.

> ⚠️ **Advertencia:** si el método promete devolver un `int` (`int velocidadActual()`), está **obligado** a terminar con un `return` que dé un `int`. Si promete `void`, se prohíbe el `return` con valor. Java es un notario muy puntilloso con las firmas.

---

## 📞 Llamar a los métodos

Dentro del `main` (o de otro método) llamas a los métodos con el punto:

```java
public class Concesionario {
    public static void main(String[] args) {
        Coche miCoche = new Coche();
        miCoche.marca = "Seat";
        miCoche.acelerar(50);          // no devuelve nada
        int v = miCoche.velocidadActual();   // devuelve 50
        System.out.println("Velocidad: " + v);
        miCoche.mostrarEstado();       // "Seat va a 50 km/h"
    }
}
```

> 📝 **Nota:** dentro de la propia clase (por ejemplo, `acelerar` llamando a `mostrarEstado`), no hace falta el punto: `mostrarEstado();` a secas. El punto solo hace falta cuando llamas a un método de **otro** objeto.

---

## 🧬 Cada objeto con su propia copia

Aquí está la magia del punto 2 hecha realidad. Dos coches creados del mismo molde son independientes:

```java
Coche cocheA = new Coche();
Coche cocheB = new Coche();

cocheA.marca = "Seat";
cocheB.marca = "Ford";

cocheA.acelerar(100);   // solo cocheA se entera

System.out.println(cocheA.marca + " → " + cocheA.velocidad);  // Seat → 100
System.out.println(cocheB.marca + " → " + cocheB.velocidad);  // Ford → 0
```

`cocheB` no sabe nada de la aceleración de `cocheA`: cada objeto guarda sus propios valores. Esto es lo que hace que la POO no sea un caos: **los datos de cada objeto van con su objeto**.

> 💡 **Tip:** piensa en los atributos como cajetines personales. Tú tienes tu taquilla, tu compañero tiene la suya. Si tú llenas la tuya de bocadillos, la de él no se llena sola.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** para trazar un programa con objetos, haz una cajita por cada objeto y apunta sus atributos dentro. Cada vez que se llama a un método, actualiza solo la cajita del objeto que lo llama.

**Ejercicio: la caja misteriosa**

Sin ejecutar, calcula qué imprime este programa:

```java
public class Caja {
    int ancho;
    int alto;
    int profundo;

    int volumen() {
        return ancho * alto * profundo;
    }
}

public class Main {
    public static void main(String[] args) {
        Caja c1 = new Caja();
        Caja c2 = new Caja();

        c1.ancho = 2;  c1.alto = 3;  c1.profundo = 4;
        c2.ancho = 5;  c2.alto = 1;  c2.profundo = 2;

        c1.ancho = 10;
        System.out.println(c1.volumen());
        System.out.println(c2.volumen());
    }
}
```

<details>
<summary>🔄 Solución</summary>

Imprime **`120`** y **`10`**.

- `c1.volumen()` → 10 × 3 × 4 = **120** (hemos cambiado `ancho` a 10 antes de calcular).
- `c2.volumen()` → 5 × 1 × 2 = **10**.
- El cambio de `c1.ancho` **no afecta a `c2`**: cada objeto tiene su propia copia de los atributos. Si no lo has visto venir, repite el mantra: *cada objeto guarda sus propios valores*.

</details>

---

## ❓ ¡No hay preguntas tontas!

> **Q:** ¿Un método puede llamar a otro método de la misma clase?
>
> **A:** Sí, y es lo más normal del mundo. `acelerar` puede llamar a `mostrarEstado` sin el punto: `mostrarEstado();`. Es como hablarte a ti mismo en voz alta: no necesitas presentarte.

> **Q:** ¿Y si un método necesita varios datos? ¿Puedo pasar varios parámetros?
>
> **A:** Todos los que quieras, separados por comas: `void mover(int x, int y, int velocidad)`. El número y tipo de parámetros forman la **firma** del método, y Java distingue métodos por su firma (esto lo exprimimos en el punto 7 con la sobrecarga).

> **Q:** ¿Los atributos pueden tener valores por defecto?
>
> **A:** Sí, y de hecho Java les da uno automático cuando creas el objeto: números a `0`, `boolean` a `false` y `String` (y cualquier referencia) a `null`. Pero depender de esos valores es mala costumbre: verás en el punto 4 que los **constructores** existen para darles un buen comienzo.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Dónde se declaran los atributos dentro de una clase?
2. ¿Qué significa `void` en la firma de un método?
3. ¿Qué palabra devuelve un valor en un método?
4. Si dos objetos son de la misma clase, ¿comparten sus atributos?

<details>
<summary>🔄 Respuestas</summary>

1. **Dentro de la clase y fuera de cualquier método**.
2. Que el método **no devuelve nada**; solo ejecuta.
3. `return`.
4. **No.** Comparten la *definición* (la clase), pero cada objeto tiene su **propia copia** de los valores.

</details>

---

## ✅ Resumen en 3 frases

1. Los **atributos** son las propiedades de la cosa y se declaran como variables dentro de la clase; cada objeto tiene su propia copia.
2. Los **métodos** son los comportamientos: pueden no devolver nada (`void`) o devolver un valor con `return`, y reciben datos por parámetros.
3. Se invocan con el punto (`objeto.metodo()`), y dentro de la misma clase no hace falta.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Atributo | Propiedad del objeto: `marca`, `velocidad` |
> | Método | Comportamiento: `acelerar()`, `volumen()` |
> | Firma | Nombre + tipos de los parámetros |
> | `void` | El método no devuelve nada |
> | `return` | Devuelve un valor al que llamó |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/06-poo-clases-objetos) · **Anterior:** [02 · Clases y objetos: el cortapastas y las galletas](/ApuntesProgramacion/06-poo-clases-objetos/02-clases-objetos) · **Siguiente:** [04 · Constructores](/ApuntesProgramacion/06-poo-clases-objetos/04-constructores)