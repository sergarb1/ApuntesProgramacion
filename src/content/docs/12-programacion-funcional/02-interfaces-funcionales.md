---
title: "02 · Interfaces funcionales: Predicate, Function, Consumer, Supplier"
description: "Los cuatro trajes oficiales de toda lambda: qué espera cada uno y cómo leer su firma 🎭"
---

<p><small>Los cuatro trajes oficiales de toda lambda: qué espera cada uno y cómo leer su firma 🎭</small></p>

> 🗺️ **Estás en:** 🗺️ **U12 · Programación Funcional** → 02 · Interfaces funcionales: Predicate, Function, Consumer, Supplier

---

## 📬 La idea en una frase

> **Una interfaz funcional es una interfaz con un único método abstracto. Java ya te regala las cuatro más usadas en `java.util.function`: `Predicate` (comprueba), `Function` (transforma), `Consumer` (consume) y `Supplier` (fabrica).**

En el punto 1 viste que para guardar una lambda en una variable necesitas una interfaz funcional. Hoy te presento a los cuatro trajes oficiales que Java te da hechos. Ya no hace falta inventarse interfaces propias como `Transformador`: el armario de `java.util.function` está lleno.

---

## 🎭 ¿Qué es una interfaz funcional?

Es una interfaz con **exactamente un método abstracto**. Ese método es la firma que toda lambda debe cumplir: si la interfaz espera `boolean test(int)`, tu lambda debe ser algo que reciba un `int` y devuelva un `boolean`.

Para que el compilador te eche una mano, existe la anotación `@FunctionalInterface`: si alguien intenta añadir un segundo método abstracto, el compilador monta en cólera.

```java
@FunctionalInterface
interface Transformador {
    int transformar(int x);
    // int otroMetodo();  // 🚫 Error de compilación: solo un método abstracto
}
```

> ⚠️ **Advertencia:** `@FunctionalInterface` es opcional. La interfaz funciona igual sin ella; la anotación solo sirve para que el compilador verifique que sigues las reglas. Como un cinturón de seguridad: nadie te obliga, pero es buena idea.

---

## 🎭 Los cuatro trajes oficiales

### 1. `Predicate<T>` — el juez

Comprueba si algo cumple una condición. Su método abstracto: **`boolean test(T t)`**.

```java
import java.util.function.Predicate;

Predicate<Integer> esPar = n -> n % 2 == 0;
System.out.println(esPar.test(4));   // true
System.out.println(esPar.test(7));   // false
```

### 2. `Function<T, R>` — el transformador

Recibe una cosa de tipo `T` y devuelve otra de tipo `R`. Su método abstracto: **`R apply(T t)`**.

```java
import java.util.function.Function;

Function<String, Integer> longitud = s -> s.length();
System.out.println(longitud.apply("java"));   // 4

Function<String, String> gritando = s -> s.toUpperCase();
System.out.println(gritando.apply("hola"));   // HOLA
```

### 3. `Consumer<T>` — el que consume sin devolver

Hace algo con el valor y no devuelve nada. Su método abstracto: **`void accept(T t)`**.

```java
import java.util.function.Consumer;

Consumer<String> imprimir = s -> System.out.println(s);
imprimir.accept("¡Hola!");
```

### 4. `Supplier<T>` — el fabricante

No recibe nada y produce un valor. Su método abstracto: **`T get()`**.

```java
import java.util.function.Supplier;

Supplier<String> fabricaSaludos = () -> "¡Hola!";
System.out.println(fabricaSaludos.get());   // ¡Hola!
```

---

## 📋 La chuleta de las cuatro

| Interfaz | Método abstracto | Qué hace | Lambda típica |
|---|---|---|---|
| `Predicate<T>` | `boolean test(T)` | Comprueba una condición | `n -> n % 2 == 0` |
| `Function<T, R>` | `R apply(T)` | Transforma un valor en otro | `s -> s.length()` |
| `Consumer<T>` | `void accept(T)` | Consume sin devolver | `s -> System.out.println(s)` |
| `Supplier<T>` | `T get()` | Fabrica un valor sin entrada | `() -> new ArrayList<>()` |

Fíjate en el patrón para leerlos sin miedo: el nombre te dice el papel (**pre**dica, **fun**ción, **con**sume, **sup**line) y la firma te dice el contrato. Cuando en los puntos siguientes veas `filter(n -> ...)`, `map(n -> ...)`, `forEach(...)` o `orElseGet(...)`, todos estarán pidiendo uno de estos trajes por debajo.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuando una lambda no encaja en `Predicate`, `Function`, `Consumer` o `Supplier`, Java tiene decenas de variantes (`BiFunction`, `IntFunction`, `UnaryOperator`...). Empieza siempre por las cuatro básicas y amplía solo si hace falta.

**Ejercicio: el portero de discoteca (versión funcional)**

```java
import java.util.function.*;

public class Portero {
    public static void main(String[] args) {
        Predicate<Integer> mayorDeEdad = edad -> edad >= 18;
        Function<Integer, String> etiqueta = edad -> edad >= 18 ? "ADULTO" : "MENOR";
        Consumer<String> anunciar = s -> System.out.println("Entrada: " + s);
        Supplier<Integer> reloj = () -> 20;

        int edad = reloj.get();
        if (mayorDeEdad.test(edad)) {
            anunciar.accept(etiqueta.apply(edad));
        }
    }
}
```

**¿Qué imprime?**

- (A) `Entrada: ADULTO`
- (B) `Entrada: MENOR`
- (C) Nada: el `if` nunca se cumple.
- (D) Error de compilación: no se pueden combinar cuatro lambdas así.

<details>
<summary>🔄 Solución</summary>

La **A**. `reloj.get()` devuelve `20`, `mayorDeEdad.test(20)` es `true` (20 ≥ 18), y dentro del `if` se encadenan las otras dos: `etiqueta.apply(20)` devuelve `"ADULTO"` y `anunciar.accept("ADULTO")` imprime `Entrada: ADULTO`. Fíjate en cómo cada traje hace su papel: el `Supplier` fabrica el dato, el `Predicate` decide, la `Function` transforma y el `Consumer` actúa. Es el baile completo de `java.util.function`.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué método abstracto tiene `Predicate<T>` y qué devuelve?
2. ¿Qué devuelve `Function<T, R>`?
3. ¿Para qué sirve `Consumer<T>`?
4. ¿Y `Supplier<T>`?

<details>
<summary>🔄 Respuestas</summary>

1. `boolean test(T)` — devuelve `true` o `false` según una condición.
2. `R apply(T)` — transforma un valor de tipo `T` en otro de tipo `R`.
3. Para acciones que no devuelven nada: `void accept(T)`. Ideal para imprimir, guardar, enviar...
4. Produce un valor sin recibir parámetros: `T get()`. El proveedor perezoso.

</details>

---

## ✅ Resumen en 3 frases

1. Una **interfaz funcional** es una interfaz con un único método abstracto: es la firma que toda lambda debe cumplir.
2. Los cuatro trajes oficiales de `java.util.function` son **`Predicate`** (`test`), **`Function`** (`apply`), **`Consumer`** (`accept`) y **`Supplier`** (`get`).
3. La anotación **`@FunctionalInterface`** le pide al compilador que verifique que la interfaz es funcional: un único método abstracto y nada más.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Interfaz funcional | Interfaz con un único método abstracto |
> | `Predicate<T>` | Comprueba una condición: `boolean test(T)` |
> | `Function<T, R>` | Transforma un valor: `R apply(T)` |
> | `Consumer<T>` | Consume sin devolver: `void accept(T)` |
> | `Supplier<T>` | Fabrica un valor: `T get()` |
> | `@FunctionalInterface` | Anotación que valida que la interfaz es funcional |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/12-programacion-funcional) · **Anterior:** [01 · Lambdas: funciones que viajan solas](/ApuntesProgramacion/12-programacion-funcional/01-lambdas) · **Siguiente:** [03 · Referencias a métodos: el atajo `::`](/ApuntesProgramacion/12-programacion-funcional/03-referencias-metodos)