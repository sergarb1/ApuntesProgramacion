---
title: "03 · Referencias a métodos: el atajo `::`"
description: "Reciclar métodos ya escritos como si fueran lambdas con el operador `::` 🩹"
---

<p><small>Reciclar métodos ya escritos como si fueran lambdas con el operador `::` 🩹</small></p>

> 🗺️ **Estás en:** 🎯 **U12 · Programación Funcional** → 03 · Referencias a métodos: el atajo `::`

---

## 📬 La idea en una frase

> **Cuando tu lambda solo llama a un método que ya existe, puedes escribir `::` en vez de `->`: `String::toUpperCase` significa "el método `toUpperCase` de los Strings", listo para usarse como una lambda.**

En el punto 1 viste las lambdas y en el punto 2 los cuatro trajes oficiales. Hoy aprendes a vestirlos sin escribir ni una flecha: si el cuerpo de tu lambda es literalmente "llama a este método", Java te deja reciclar ese método directamente con el operador **`::`** (dos puntos, dos puntos, no son dos puntos suspensivos).

---

## 🩹 Cuando la lambda es solo una llamada

Imagina que quieres una `Function<String, String>` que ponga un texto en mayúsculas. Con lambda:

```java
Function<String, String> mayusculas = s -> s.toUpperCase();
```

Esa lambda hace una sola cosa: llamar a `toUpperCase()`. Java piensa: "oye, ya existe ese método, ¿para qué escribo la flecha?". La versión con `::`:

```java
Function<String, String> mayusculas = String::toUpperCase;
```

**`String::toUpperCase`** se lee: "el método `toUpperCase` de la clase `String`". Y funciona exactamente igual que la lambda: cuando le pases un String, lo pondrá en mayúsculas.

```java
System.out.println(mayusculas.apply("hola"));   // HOLA
```

---

## 🗂️ Los cuatro tipos de referencia

### 1. Método estático: `Clase::metodoEstatico`

```java
Function<Integer, Integer> valorAbsoluto = Math::abs;
System.out.println(valorAbsoluto.apply(-7));   // 7
```

Equivale a `x -> Math.abs(x)`.

### 2. Método de instancia sobre un objeto cualquiera: `Clase::metodoInstancia`

```java
Function<String, Integer> longitud = String::length;
System.out.println(longitud.apply("java"));   // 4
```

Equivale a `s -> s.length()`. El parámetro de la lambda se convierte en el objeto sobre el que llamamos.

### 3. Método de instancia sobre un objeto concreto: `objeto::metodo`

```java
Consumer<String> imprimir = System.out::println;
imprimir.accept("¡Hola!");
```

Equivale a `s -> System.out.println(s)`. Aquí el objeto ya existe (`System.out`) y el parámetro de la lambda es el argumento del método.

### 4. Constructor: `Clase::new`

```java
Supplier<ArrayList<String>> fabrica = ArrayList::new;
ArrayList<String> lista = fabrica.get();
```

Equivale a `() -> new ArrayList<>()`. El constructor también es un método, y también se puede reciclar.

---

## 📋 La tabla del `::`

| Referencia | Sintaxis | Equivale a |
|---|---|---|
| Estática | `Math::abs` | `x -> Math.abs(x)` |
| De instancia (clase) | `String::toUpperCase` | `s -> s.toUpperCase()` |
| De instancia (objeto) | `System.out::println` | `s -> System.out.println(s)` |
| Constructor | `ArrayList::new` | `() -> new ArrayList<>()` |

> ⚠️ **Advertencia:** la referencia a método no ejecuta el método. `String::toUpperCase` **no** pone nada en mayúsculas: es la receta, no la comida. Se ejecutará cuando el stream o la interfaz funcional lo pida.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuando dudes entre lambda y referencia, piensa en la legibilidad. `String::toUpperCase` es más limpio que `s -> s.toUpperCase()`, pero una lambda con lógica (como `s -> s.length() > 3`) no se puede convertir a `::` porque no llama a un único método.

**Ejercicio: el reciclador de saludos**

```java
import java.util.function.*;

public class Reciclador {
    public static void main(String[] args) {
        Supplier<String> fabrica = String::new;
        Function<String, String> mayusculas = String::toUpperCase;
        Consumer<String> imprimir = System.out::println;

        String vacio = fabrica.get();
        imprimir.accept(mayusculas.apply(vacio.isEmpty() ? "hola" : vacio));
    }
}
```

**¿Qué imprime?**

- (A) `HOLA`
- (B) `hola`
- (C) Nada: el `String` está vacío.
- (D) Error de compilación: `String::new` no es una referencia válida.

<details>
<summary>🔄 Solución</summary>

La **A**. `String::new` es una referencia al constructor: `fabrica.get()` crea un `String` vacío (`""`). Como `vacio.isEmpty()` es `true`, el ternario elige `"hola"`, y `mayusculas.apply("hola")` llama a `String::toUpperCase` sobre ese texto, dando `"HOLA"`. El `Consumer` con `System.out::println` lo imprime. Tres referencias a método en tres roles distintos: constructor, método de instancia y método sobre un objeto concreto.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué significa `String::toUpperCase` sin paréntesis?
2. ¿Cuándo usarías `objeto::metodo` en vez de `Clase::metodo`?
3. ¿`Math::max` qué tipo de referencia es?
4. ¿Qué hace `Clase::new`?

<details>
<summary>🔄 Respuestas</summary>

1. Una referencia al método `toUpperCase` de cualquier `String`, lista para llamarse cuando toque. No ejecuta nada por sí sola.
2. Cuando el método se llama sobre un objeto concreto que ya existe, como `System.out::println`. `Clase::metodo` sirve para métodos que se llaman sobre el parámetro que llegue.
3. Referencia a un método estático de una clase.
4. Referencia al constructor: fabrica objetos nuevos, como un `Supplier` (`() -> new Clase()`).

</details>

---

## ✅ Resumen en 3 frases

1. Una **referencia a método** (`::`) es una lambda aún más corta: reutiliza un método que ya existe en vez de escribir la flecha.
2. Hay cuatro tipos: **estática** (`Math::abs`), **de instancia sobre clase** (`String::toUpperCase`), **de instancia sobre objeto** (`System.out::println`) y **de constructor** (`ArrayList::new`).
3. Cuando tu lambda solo llama a un método, la referencia es más legible y se comporta exactamente igual.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Referencia a método | Reutilizar un método como lambda con `::` |
> | `Clase::estatico` | Referencia a un método estático |
> | `Clase::instancia` | Método de instancia llamado sobre el parámetro que llegue |
> | `objeto::metodo` | Método llamado sobre un objeto concreto que ya existe |
> | `Clase::new` | Referencia al constructor |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/12-programacion-funcional) · **Anterior:** [02 · Interfaces funcionales: Predicate, Function, Consumer, Supplier](/ApuntesProgramacion/12-programacion-funcional/02-interfaces-funcionales) · **Siguiente:** [04 · Streams: el flujo de datos](/ApuntesProgramacion/12-programacion-funcional/04-streams-basicos)