---
title: "04 · Métodos genéricos: funciones para todo tipo"
description: "El <T> antes del tipo de retorno, la inferencia automática y los límites con Comparable 🧰"
---

<p><small>El <T> antes del tipo de retorno, la inferencia automática y los límites con Comparable 🧰</small></p>

> 🗺️ **Estás en:** 🗺️ **U11 · Genéricos y Mapas** → 04 · Métodos genéricos: funciones para todo tipo

---

## 📬 La idea en una frase

> **Un método genérico declara su propio `<T>` antes del tipo de retorno y funciona para cualquier tipo, deduciéndolo de los argumentos. Con un límite (`T extends Comparable<T>`) le exiges a `T` que sepa compararse.**

En el punto 2 la clase era genérica. Pero hay un caso aún más flexible: un método genérico **dentro de una clase que no es genérica**. El `<T>` del método vive solo en él, como un parámetro más, y el compilador lo deduce de la llamada. Es la herramienta perfecta para las clases de utilidades.

---

## 🧰 El `<T>` antes del tipo de retorno

La sintaxis tiene un truco visual: el `<T>` va **antes** del tipo de retorno. Ese es el cartel que le dice al compilador "oye, en este método `T` es un tipo".

```java
public class Utilidades {

    // Método genérico: declara <T> antes del tipo de retorno
    public static <T> void imprimir(T elemento) {
        System.out.println("Elemento: " + elemento.toString());
    }

    // Método genérico con dos parámetros de tipo
    public static <T, U> boolean sonIguales(T a, U b) {
        return a.equals(b);
    }

    // Invertir un array genérico
    public static <T> T[] invertir(T[] array) {
        for (int i = 0; i < array.length / 2; i++) {
            T temp = array[i];
            array[i] = array[array.length - 1 - i];
            array[array.length - 1 - i] = temp;
        }
        return array;
    }
}
```

Y el uso, con la magia de la inferencia:

```java
Utilidades.imprimir(42);         // El compilador infiere que T es Integer
Utilidades.imprimir("Hola");     // El compilador infiere que T es String

boolean igual = Utilidades.sonIguales("Ana", "Ana");  // T=String, U=String

String[] invertido = Utilidades.invertir(new String[]{"A", "B", "C"});
// invertido = {"C", "B", "A"}
```

No especificas el tipo en ninguna llamada: el compilador mira los argumentos y deduce qué es `T`. Es como un profesor que se adapta a cada alumno: misma clase, contenido adaptado.

---

## 🚧 Los límites: `T extends Comparable<T>`

¿Y si el método necesita que `T` tenga un superpoder? Por ejemplo, comparar elementos para encontrar el máximo. Ahí entra el **límite (bound)**: le exiges a `T` que implemente `Comparable`:

```java
public class Utilidades {

    // T debe saber compararse consigo mismo
    public static <T extends Comparable<T>> T maximo(T a, T b) {
        return a.compareTo(b) > 0 ? a : b;
    }
}

// Uso:
System.out.println(Utilidades.maximo(5, 8));            // 8
System.out.println(Utilidades.maximo("gato", "perro")); // "perro"
```

`String` e `Integer` implementan `Comparable`, así que funcionan. Si intentaras pasar una clase tuya sin `Comparable`, el compilador te lo diría: no puede garantizar que tu tipo sepa compararse. El límite convierte la promesa genérica en un contrato.

> 💡 **Consejo:** `extends` en genéricos no significa herencia de clase: significa "es o hereda de / implementa". `T extends Comparable<T>` se lee como "T implementa Comparable<T>". Lo verás a fondo en el punto 5 con los wildcards.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** puedes invocar un método genérico especificando el tipo explícitamente: `Clase.<Tipo>metodo(...)`. Es raro, pero existe, y suele salir en exámenes.

**Ejercicio: el método que se llama con gafas**

```java
public class BeTheGenericMethod {
    public static void main(String[] args) {
        String resultado = Utilidades.<String>maximo("manzana", "plátano");
        System.out.println(resultado);
    }
}
```

**¿Qué imprime?**

- (A) "manzana"
- (B) "plátano"
- (C) null
- (D) No compila, la sintaxis es incorrecta

<details>
<summary>🔄 Solución</summary>

La **B**. La sintaxis `Clase.<Tipo>metodo(...)` es válida para especificar el tipo explícitamente, aunque normalmente el compilador lo infiere solo. Aquí le dices a la cara que `T` es `String`, así que el método usa el `compareTo` de los Strings y devuelve "plátano" (p > m). Sin gafas: `maximo("manzana", "plátano")` haría exactamente lo mismo.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Dónde se declara el `<T>` de un método genérico?
2. ¿Qué significa `T extends Comparable<T>`?
3. ¿Qué deduce el compilador en la llamada `imprimir(42)`?
4. ¿Un método genérico puede vivir en una clase no genérica?

<details>
<summary>🔄 Respuestas</summary>

1. Antes del tipo de retorno: `public static <T> void imprimir(T x)`.
2. Que `T` implementa `Comparable<T>`: sabe compararse consigo mismo.
3. Que `T` es `Integer` (el tipo del argumento).
4. Sí, y es lo más común: las clases de utilidades están llenas de métodos estáticos genéricos.

</details>

---

## ✅ Resumen en 3 frases

1. Un **método genérico** declara `<T>` antes del tipo de retorno y el compilador deduce `T` de los argumentos.
2. Con un **límite** (`T extends Comparable<T>`) exiges que `T` sepa compararse, y el compilador lo verifica.
3. La sintaxis `Clase.<Tipo>metodo(...)` permite especificar el tipo a mano, aunque casi nunca la necesitas.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Método genérico | Método con `<T>` propio, independiente de la clase |
> | Inferencia | El compilador deduce `T` de los argumentos |
> | Límite (bound) | Restricción: `T extends Comparable<T>` |
> | `Comparable` | Interfaz que da el superpoder `compareTo()` |
> | `<T>` explícito | `Clase.<String>metodo(...)`: declarar el tipo a mano |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/11-genericos-mapas) · **Anterior:** [03 · El diamante `<>` y type erasure](/ApuntesProgramacion/11-genericos-mapas/03-diamante-type-erasure) · **Siguiente:** [05 · Wildcards: `? extends T` y `? super T`](/ApuntesProgramacion/11-genericos-mapas/05-wildcards)