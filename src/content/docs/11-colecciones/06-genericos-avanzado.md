---
title: "06 · El diamante, métodos genéricos y wildcards"
description: "El perezoso oficial que infiere el tipo, métodos con su propio `<T>` y el principio PECS de Joshua Bloch 💎"
---

<p><small>El perezoso oficial que infiere el tipo, métodos con su propio `<T>` y el principio PECS de Joshua Bloch 💎</small></p>

> 🗺️ **Estás en:** 📚 **U11 · Colecciones, genéricos y mapas** → 06 · El diamante, métodos genéricos y wildcards

---

## 📬 La idea en una frase

> **El diamante `<>` te ahorra repetir el tipo, un método genérico declara su propio `<T>` antes del retorno, y los wildcards (`? extends` / `? super`) resuelven la invarianza de los genéricos con la regla PECS.**

Tres piezas que completan el puzzle genérico: la primera te ahorra teclear, la segunda te da flexibilidad en utilidades y la tercera es la que cae en las entrevistas.

---

## 💎 El operador diamante `<>`

Desde Java 7 no hace falta repetir el tipo dos veces; el compilador lo infiere:

```java
// Antes de Java 7 (repetitivo):
Caja<String> caja1 = new Caja<String>();

// Desde Java 7 (el diamante <> al rescate):
Caja<String> caja2 = new Caja<>();  // "ya sabes de qué hablo, ¿no?"
```

> 💡 **Consejo:** usa siempre el diamante. El compilador mira el lado izquierdo y deduce el derecho: código más limpio y cero repeticiones.

## 🎩 Type erasure: el mago se lleva los genéricos

Los genéricos SOLO existen en compilación. Al generar el bytecode, el compilador **verifica** los tipos, **borra** la información genérica y **añade** los castings donde hagan falta:

```java
// En tu código fuente:
ArrayList<String> nombres = new ArrayList<>();

// En el bytecode tras compilar:
ArrayList nombres = new ArrayList();   // sin genéricos, con castings
```

Por eso dos `ArrayList` de tipos distintos son la misma clase en tiempo de ejecución, y por eso no puedes hacer `new T()` ni `new T[]`: en runtime, `T` no existe.

---

## 🧰 Métodos genéricos

Un método puede declarar su propio `<T>` **antes del tipo de retorno**, sin que la clase sea genérica. El compilador lo deduce de los argumentos:

```java
public class Utilidades {

    // Declara <T> antes del tipo de retorno
    public static <T> void imprimir(T elemento) {
        System.out.println("Elemento: " + elemento);
    }

    // Con límite: T debe saber compararse (implementar Comparable)
    public static <T extends Comparable<T>> T maximo(T a, T b) {
        return a.compareTo(b) > 0 ? a : b;
    }
}

// Uso con inferencia:
Utilidades.imprimir(42);        // T = Integer
Utilidades.imprimir("Hola");    // T = String
Utilidades.maximo(5, 8);        // 8
Utilidades.maximo("gato", "perro"); // "perro"
```

El **límite** (`T extends Comparable<T>`) convierte la promesa genérica en contrato: si tu clase no sabe compararse, el compilador no te deja pasarla. Y aunque casi nunca hace falta, existe la sintaxis explícita `Utilidades.<String>maximo(...)` (suele salir en exámenes).

---

## 🃏 Wildcards: el problema de la invarianza

Momento incómodo: `List<Number>` NO acepta una `List<Integer>`, aunque un Integer sea un Number. Los genéricos son **invariantes**. La solución es el comodín `?`:

### `? extends T`: para LEER (covarianza)

```java
public static double sumar(List<? extends Number> numeros) {
    double total = 0.0;
    for (Number n : numeros) {
        total += n.doubleValue();   // leer: sí
    }
    // numeros.add(42);             // 🚫 añadir: no (salvo null)
    return total;
}
// sumar(List.of(1, 2, 3)) y sumar(List.of(1.5, 2.5)) compilan ✅
```

### `? super T`: para ESCRIBIR (contravarianza)

```java
public static void rellenar(List<? super Integer> lista) {
    lista.add(1);
    lista.add(2);          // escribir: sí
    // Integer n = lista.get(0);  // 🚫 leer tipado: no, solo como Object
}
// rellenar(new ArrayList<Number>()) y rellenar(new ArrayList<Object>()) compilan ✅
```

### 🧠 PECS: la mnemotecnia infalible

Joshua Bloch (autor de *Effective Java*) lo resumió en cuatro letras:

> - **P**roducer **E**xtends: si el método solo **produce** (lee) datos, usa `? extends`.
> - **C**onsumer **S**uper: si el método solo **consume** (escribe) datos, usa `? super`.
> - ¿Hace las dos cosas? → no uses wildcard: usa `T` directamente.

> ⚠️ **Advertencia:** pregunta clásica de examen: "¿puedo añadir a una `List<? extends Number>`?" NO (salvo `null`). "¿Puedo leer tipado de una `List<? super Integer>`?" Tampoco: solo como `Object`. PECS te salva de ambas.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** gracias al type erasure, los genéricos no existen en runtime: `nombres.getClass() == numeros.getClass()` es `true` aunque uno sea `ArrayList<String>` y otro `ArrayList<Integer>`.

**Ejercicio: el comodín que lo acepta todo**

```java
import java.util.*;

public class BeTheWildcard {
    public static void main(String[] args) {
        printNumbers(Arrays.asList(1, 2, 3));      // ¿compila?
        printNumbers(Arrays.asList(1.5, 2.5, 3.5)); // ¿compila?
    }

    public static void printNumbers(List<? extends Number> lista) {
        for (Number n : lista) {
            System.out.print(n + " ");
        }
    }
}
```

**¿Cuántas llamadas compilan?**

- (A) 0
- (B) 1
- (C) 2
- (D) Error en ambas

<details>
<summary>🔄 Solución</summary>

La **C**. `List<? extends Number>` acepta cualquier lista cuyo tipo herede de Number: tanto `List<Integer>` como `List<Double>`. El método solo lee (for-each), así que cumple el lado "producer" de PECS sin problema. Imprime `1 2 3 1.5 2.5 3.5`.

</details>

---

## 🤷 No hay preguntas tontas

> ❓ **¿Los genéricos ralentizan mi programa?**

No. El **type erasure** los convierte en castings normales al compilar: es solo azúcar sintáctico. En runtime no hay genéricos ni coste extra.

---

> ❓ **¿Por qué no puedo hacer `new T()`?**

Porque en compilación Java no sabe qué es `T` y en runtime ya se ha borrado. Es como pedirle a un pastelero "un pastel" sin decirle de qué.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Desde qué versión de Java existe el operador diamante `<>`?
2. ¿Dónde se declara el `<T>` de un método genérico?
3. ¿Qué significa `? extends Number` y para qué sirve?
4. ¿Qué dice la C de PECS?

<details>
<summary>🔄 Respuestas</summary>

1. Desde Java 7.
2. Antes del tipo de retorno: `public static <T> void imprimir(T x)`.
3. "Una lista de Number o de cualquier subclase suya", de solo lectura (covarianza).
4. Consumer Super: si el método escribe en la colección, usa `? super`.

</details>

---

## ✅ Resumen en 3 frases

1. El **diamante `<>`** (Java 7+) infiere el tipo del lado derecho, y el **type erasure** borra los genéricos al compilar: por eso son gratis y no existen en runtime.
2. Un **método genérico** declara `<T>` antes del retorno y puede llevar un **límite** (`T extends Comparable<T>`) que actúa como contrato.
3. Los **wildcards** resuelven la invarianza: `? extends` para leer, `? super` para escribir, y **PECS** (*Producer Extends, Consumer Super*) para recordarlo.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Diamante | El `<>` que infiere el tipo y evita repetirlo |
> | Type erasure | Proceso que borra los genéricos al compilar |
> | Límite (bound) | Restricción: `T extends Comparable<T>` |
> | Wildcard | El `?`: "cualquier tipo" |
> | Covarianza / Contravarianza | `? extends` (leer) / `? super` (escribir) |
> | PECS | Producer Extends, Consumer Super |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/11-colecciones) · **Anterior:** [05 · Clases genéricas: tu propia `Caja<T>`](/ApuntesProgramacion/11-colecciones/05-clases-genericas) · **Siguiente:** [07 · HashMap: la guía telefónica](/ApuntesProgramacion/11-colecciones/07-hashmap)
