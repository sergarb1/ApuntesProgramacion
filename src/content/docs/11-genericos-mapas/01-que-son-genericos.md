---
title: "01 · Genéricos: el `<T>` que lo cambió todo"
description: "El lío antes de los genéricos, el compilador que se vuelve tu amigo y el fin de los castings a ciegas 🤝"
---

<p><small>El lío antes de los genéricos, el compilador que se vuelve tu amigo y el fin de los castings a ciegas 🤝</small></p>

> 🗺️ **Estás en:** 🗺️ **U11 · Genéricos y Mapas** → 01 · Genéricos: el `<T>` que lo cambió todo

---

## 📬 La idea en una frase

> **Los genéricos existen para una sola razón: seguridad de tipos. Comprueban en tiempo de compilación que no metas la pata con los tipos y eliminan los castings a ciegas y las temidas `ClassCastException`.**

En la U10 viste `ArrayList<String>`, `HashSet<Integer>`... pero nadie te explicó de dónde sale ese `<String>`. Hoy es el día. Bienvenida o bienvenido a la unidad donde el compilador deja de ser un juez y se convierte en tu entrenador personal.

---

## 😱 El infierno antes de los genéricos

Imagina que tienes una `ArrayList` a la antigua usanza, sin genéricos. Es como una caja de caos donde puedes meter cualquier cosa: un zapato, una manzana, un gato, un número de la suerte. El problema es que cuando _sacas_ las cosas, Java te devuelve un `Object` y tú tienes que recordar qué metiste. ¿Y si metiste un `Integer` pero lo tratas como `String`? **BOOM**. `ClassCastException` en toda la cara.

```java
import java.util.*;

public class InfiernoSinGenericos {
    public static void main(String[] args) {
        ArrayList cajaDeCaos = new ArrayList();   // sin <String>, sin <Integer>...
        cajaDeCaos.add(42);
        cajaDeCaos.add("Hola");
        cajaDeCaos.add(3.14);

        // Todo lo que sacas es Object... ¡tú adivina qué es!
        Object cosa = cajaDeCaos.get(0);
        String texto = (String) cosa;  // 💥 ClassCastException en tiempo de ejecución
    }
}
```

¿Ves? El compilador no te avisó de nada. Te enteras cuando el programa ya está corriendo y explota. Como una granada con el seguro quitado. Y lo peor: el casting `(String) cosa` no era mentira hasta que explotó, porque Java no tenía forma de saber que dentro había un `Integer`.

> ⚠️ **Advertencia:** sin genéricos, los errores de tipo saltan en tiempo de EJECUCIÓN (cuando el usuario está usando tu programa). Con genéricos, saltan en tiempo de COMPILACIÓN (cuando tú estás programando). ¿Cuándo prefieres enterarte?

---

## 🤝 Llegan los genéricos: el compilador se vuelve tu amigo

A partir de Java 5, los genéricos cambiaron las reglas del juego. Una `ArrayList<String>` ya no es una caja de caos: es una máquina expendedora que SOLO da Coca-Colas. No puedes meter un zapato, y si lo intentas, el compilador te para el brazo antes de que la fiesta se tuerza.

```java
import java.util.*;

public class CieloConGenericos {
    public static void main(String[] args) {
        ArrayList<String> maquinaDeCocacolas = new ArrayList<>();
        maquinaDeCocacolas.add("Coca-Cola");
        maquinaDeCocacolas.add("Coca-Cola Light");
        // maquinaDeCocacolas.add(42);  // 🚫 Error de compilación

        // Al sacar, ya sabes que es String. Sin casting.
        String bebida = maquinaDeCocacolas.get(0);
        System.out.println(bebida.toUpperCase());  // "COCA-COLA" sin miedo
    }
}
```

Fíjate en el superpoder: `get(0)` devuelve un `String`, no un `Object`. Puedes llamar a `.toUpperCase()` directamente, sin casting y sin cruzar los dedos. El `<String>` es un **parámetro de tipo**: una promesa que le haces al compilador y que él se encarga de cumplir.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `ArrayList<String>` solo acepta Strings. Si intentas meter un `int` o un `double`, el compilador te para el brazo en la puerta.

**Ejercicio: el portero de discoteca**

```java
import java.util.*;

public class BeTheList {
    public static void main(String[] args) {
        ArrayList<String> lista = new ArrayList<>();
        lista.add("Hola");
        lista.add("Mundo");
        // lista.add(42);       // línea A
        String s = lista.get(0); // línea B
        System.out.println(s.toUpperCase());
    }
}
```

**¿Qué ocurre si descomentas la línea A?**

- (A) Compila y añade el `42` sin problema.
- (B) Error de compilación: no se puede meter un `int` en una lista de Strings.
- (C) Compila, pero salta una excepción al ejecutar.
- (D) El `42` se convierte solo a `"42"` como String.

<details>
<summary>🔄 Solución</summary>

La **B**. `lista` es `ArrayList<String>`, así que el compilador rechaza `add(42)` antes de que el programa llegue a ejecutarse. Esa es exactamente la magia de los genéricos: el error aparece cuando tú estás programando, no cuando el usuario está usando tu app. La línea B y el `toUpperCase()` funcionan sin casting porque el compilador ya sabe que `get(0)` devuelve un String.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué excepción evitamos gracias a los genéricos al sacar elementos de una colección?
2. ¿Cuándo saltan los errores de tipo con genéricos: en compilación o en ejecución?
3. ¿Qué te devuelve `get(0)` en una `ArrayList<String>` sin hacer casting?
4. ¿Por qué sin genéricos todo lo que sacas de una `ArrayList` es un `Object`?

<details>
<summary>🔄 Respuestas</summary>

1. `ClassCastException`, el clásico de intentar usar un elemento como si fuera de otro tipo.
2. En compilación. El compilador comprueba los tipos antes de generar el bytecode.
3. Un `String`. El parámetro de tipo `<String>` le dice al compilador qué devuelve cada método.
4. Porque la `ArrayList` a la antigua guarda `Object` y no recuerda qué metiste. Los genéricos añaden esa memoria al compilador.

</details>

---

## ✅ Resumen en 3 frases

1. **Antes de los genéricos**, las colecciones eran cajas de caos: todo se guardaba como `Object`, sacabas con casting a ciegas y las `ClassCastException` explotaban en tiempo de ejecución.
2. **Con los genéricos**, `ArrayList<String>` promete al compilador qué tipo contiene y él lo comprueba en compilación: no cuela un `int` en una lista de Strings.
3. Los genéricos existen para **seguridad de tipos**: menos castings, menos excepciones y código que se explica solo.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Genérico | Código que trabaja con un tipo que se decide al usarlo (`<T>`) |
> | Parámetro de tipo | El `<String>` de `ArrayList<String>`: el tipo que se pasa |
> | Casting | Convertir a la fuerza: `(String) objeto` |
> | `ClassCastException` | Excepción al usar un objeto como si fuera de otro tipo |
> | Seguridad de tipos | Que el compilador verifique que los tipos cuadran |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/11-genericos-mapas) · **Anterior:** — · **Siguiente:** [02 · Tu propia clase genérica: `Caja<T>`](/ApuntesProgramacion/11-genericos-mapas/02-clases-genericas)