---
title: "03 · El diamante `<>` y type erasure"
description: "El perezoso oficial que infiere el tipo por ti y el mago que hace desaparecer los genéricos en el bytecode 🎩"
---

<p><small>El perezoso oficial que infiere el tipo por ti y el mago que hace desaparecer los genéricos en el bytecode 🎩</small></p>

> 🗺️ **Estás en:** 🗺️ **U11 · Genéricos y Mapas** → 03 · El diamante `<>` y type erasure

---

## 📬 La idea en una frase

> **El diamante `<>` te ahorra repetir el tipo dos veces, y el type erasure es el truco por el que los genéricos solo existen en compilación: cuando generas el bytecode, el compilador los borra y añade los castings por ti.**

Ya sabes crear clases genéricas. Ahora toca dominar los dos detalles que la gente suele repetir de memoria sin entender: el `<>` de `new ArrayList<>()` y la famosa "type erasure". Los dos son hermanos: el primero te ahorra teclear, el segundo es el porqué de que Java funcione con genéricos sin perder velocidad.

---

## 💎 El operador diamante `<>`: el perezoso oficial

Desde Java 7, no hace falta repetir el tipo dos veces. El compilador lo infiere por ti:

```java
// Antes de Java 7 (repetitivo):
Caja<String> caja1 = new Caja<String>();

// Desde Java 7 (el diamante <> al rescate):
Caja<String> caja2 = new Caja<>();
```

El `<>` es como el "etcétera" de los genéricos: "ya sabes de qué tipo estoy hablando, ¿no? Pues eso". El compilador mira el lado izquierdo, `Caja<String>`, y deduce que el lado derecho también es `Caja<String>`.

> 💡 **Consejo:** usa siempre el operador diamante `<>`. Tu código queda más limpio, más legible y tus compañeros de equipo te lo agradecerán. El compilador sabe de qué tipo hablas; no le hagas repetir las cosas.

---

## 🎩 Type erasure: el mago se lleva los genéricos

Aquí va el truco que lo explica todo: los genéricos SOLO existen en tiempo de compilación. Cuando tu código se convierte en bytecode, el compilador borra toda la información de tipos genéricos. Es como si un mago hiciera desaparecer los `<String>` y `<Integer>`.

```java
// En tu código fuente:
ArrayList<String> nombres = new ArrayList<>();
ArrayList<Integer> numeros = new ArrayList<>();

// Después de compilar (en bytecode):
ArrayList nombres = new ArrayList();   // ambos son ArrayList simples
ArrayList numeros = new ArrayList();
```

A esto se le llama **type erasure**. El compilador hace tres cosas:

1. **Verifica** que los tipos sean correctos (aquí no cuela un `Integer` en una lista de Strings).
2. **Borra** la información genérica.
3. **Añade** los castings necesarios donde haga falta.

Es como un portero que revisa tu DNI en la puerta, pero una vez dentro, tú no llevas ninguna identificación. Por eso dos `ArrayList` de tipos distintos son la misma clase en tiempo de ejecución (lo comprobarás en el Sé el Código).

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** gracias al type erasure, los genéricos no existen en runtime. Dos colecciones con tipos distintos son la misma clase de verdad.

**Ejercicio: el gemelo perdido**

```java
import java.util.*;

public class BeTheErasure {
    public static void main(String[] args) {
        ArrayList<String> nombres = new ArrayList<>();
        ArrayList<Integer> numeros = new ArrayList<>();

        System.out.println(nombres.getClass() == numeros.getClass());
    }
}
```

**¿Qué imprime?**

- (A) true
- (B) false
- (C) Error en tiempo de ejecución
- (D) No compila

<details>
<summary>🔄 Solución</summary>

La **A**. `getClass()` devuelve la clase real del objeto en runtime, y gracias al type erasure tanto `nombres` como `numeros` son, de verdad, `java.util.ArrayList`. Los `<String>` y `<Integer>` solo vivieron en compilación. Es la prueba definitiva de que "los genéricos son gratis": no añaden clases ni ralentizan nada.

</details>

---

## 🤷 No hay preguntas tontas

> ❓ **¿Por qué no puedo hacer `new T()` dentro de una clase genérica?**

Porque en tiempo de compilación, Java no sabe qué es `T`. No puede crear una instancia de algo que no conoce. Es como pedirle a un pastelero que haga "un pastel" pero sin decirle de qué. Con el type erasure, en runtime `T` ni siquiera existe.

---

> ❓ **¿Y `new T[]`?**

Tampoco. Los arrays conocen su tipo en tiempo de ejecución, pero los genéricos se borran (type erasure). Por eso internamente se usa `Object[]` y se castea. Es una de las limitaciones que verás si algún día intentas crear un array de genéricos.

---

> ❓ **¿Los genéricos ralentizan mi programa?**

No. Java aplica **type erasure**: el compilador borra toda la información genérica y la convierte a castings normales. Es solo azúcar sintáctico en compilación. En runtime, no hay genéricos y no hay coste extra.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Desde qué versión de Java existe el operador diamante `<>`?
2. ¿Qué hace el compilador con los genéricos al generar el bytecode?
3. ¿Por qué no puedes escribir `new T()` en una clase genérica?
4. En runtime, ¿`ArrayList<String>` y `ArrayList<Integer>` son la misma clase?

<details>
<summary>🔄 Respuestas</summary>

1. Desde Java 7. Antes había que repetir el tipo dos veces.
2. Los borra: verifica los tipos, elimina la información genérica y añade los castings necesarios.
3. Porque en compilación Java no sabe qué es `T`, y en runtime el type erasure lo ha borrado.
4. Sí, exactamente. `getClass()` devuelve `java.util.ArrayList` en ambos casos.

</details>

---

## ✅ Resumen en 3 frases

1. El **diamante `<>`** (Java 7+) infiere el tipo del lado derecho y te ahorra repetirlo: `new Caja<>()`.
2. El **type erasure** borra los genéricos al compilar: verifica, borra y añade castings.
3. Gracias a eso, **los genéricos son gratis**: no existen en runtime, no ralentizan nada y por eso no puedes crear `new T()` ni arrays de genéricos.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Diamante | El `<>` que infiere el tipo y evita repetirlo |
> | Inferencia | Que el compilador deduzca el tipo por ti |
> | Type erasure | El proceso que borra los genéricos al compilar |
> | Bytecode | El código que genera el compilador para la JVM |
> | Raw type | `Caja` sin `< >`, solo para código antiguo |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/11-genericos-mapas) · **Anterior:** [02 · Tu propia clase genérica: `Caja<T>`](/ApuntesProgramacion/11-genericos-mapas/02-clases-genericas) · **Siguiente:** [04 · Métodos genéricos: funciones para todo tipo](/ApuntesProgramacion/11-genericos-mapas/04-metodos-genericos)