---
title: "01 — Recursividad: una función que se llama a sí misma"
description: Cuando tu código decide llamarse a sí mismo y tu cerebro empieza a humear 🔁
---

<p><small>Cuando tu código decide llamarse a sí mismo y tu cerebro empieza a humear 🔁</small></p>

> 🗺️ **Estás en:** ⚡ **U05 · Algorítmica II: Técnicas** → 01 · Recursividad

---

## 📬 La idea en una frase

> **La recursividad es cuando una función se llama a sí misma para resolver un problema resolviendo una versión más pequeña de sí mismo, hasta llegar a un caso base que lo detiene todo.**

En la U04 viste que un algoritmo se puede escribir con bucles. Pero hay problemas que se *expresan* de forma mucho más natural diciendo "este problema es como el mismo problema, pero más pequeño". Para esos casos nació la recursividad: la técnica estrella de esta unidad.

---

## 🔁 El ciclo de la vida recursiva

Toda función recursiva necesita **dos partes imprescindibles**. Si te falta una, estás muerto:

> [!NOTE]
> - **Caso base**: la condición que detiene la recursión. Sin esto, tu programa se ejecuta hasta que la JVM se cansa y te lanza un `StackOverflowError`.
> - **Caso recursivo**: la llamada a sí misma, normalmente con una versión más pequeña del mismo problema.

La estructura general es siempre la misma:

```java
public static tipo funcion(parametros) {
    if (/* condicion de parada */) {
        return /* valor base */;
    } else {
        // hacer algo con el problema actual
        return funcion(/* version mas pequena */);
    }
}
```

Piénsalo como limpiar tu habitación (suponiendo que algún día lo hagas): en lugar de limpiarla entera de golpe, coges una cosa del suelo y vuelves a llamar a la misma función "limpiarHabitacion" con lo que queda. Eventualmente no queda nada, y has terminado.

---

## 📚 La pila de llamadas: el origen de toda la diversión

Cada vez que una función se llama, Java reserva un trocito de memoria en el **stack** (la pila). Ese trocito se llama **stack frame** y guarda: los parámetros de la función, las variables locales, y la dirección de vuelta para cuando la función termine.

Si llamas a una función 5 veces, tienes 5 frames en el stack. Si la llamas 10.000 veces... bum. `StackOverflowError`.

```java
public class StackExplorer {

    static int prof = 0;

    static void recursivo() {
        prof++;
        System.out.println("Llamada numero: " + prof);
        recursivo(); // ¡no hay caso base!
    }

    public static void main(String[] args) {
        try {
            recursivo();
        } catch (StackOverflowError e) {
            System.out.println("Stack exploto en la llamada: " + prof);
        }
    }
}
```

Pruébalo. Verás que el número varía según tu máquina y la JVM: normalmente entre 10.000 y 20.000 llamadas. No es infinito. Nada lo es.

> [!WARNING]
> Sin caso base, no hay piedad. El stack tiene un límite y Java no te va a salvar. Cada frame ocupa espacio, y cuando el vaso se desborda, la JVM dice "hasta aquí llegamos". Atrapa el `StackOverflowError` solo para inspeccionar (como arriba), nunca para "arreglar" una recursión rota.

---

## 🥊 Recursividad vs iteración: el duelo

| Aspecto | Recursividad | Iteración (bucles) |
|---|---|---|
| Legibilidad | Muy elegante para problemas jerárquicos | Más verbosa pero clara |
| Memoria | Gasta stack (cada llamada = frame nuevo) | Solo variables locales |
| Velocidad | Más lenta (overhead de llamadas) | Más rápida |
| Stack overflow | Riesgo real si la profundidad es alta | No aplica |
| Casos ideales | Árboles, grafos, backtracking, divide y vencerás | Recorridos lineales, procesamiento simple |

La regla de oro: **usa recursividad cuando el problema sea inherentemente recursivo** (estructuras jerárquicas, expresiones anidadas, ordenación avanzada). Para lo demás, un `for` de toda la vida. Nadie va a darte una medalla por hacer una suma de array con recursión.

---

## 🌰 Un primer ejemplo completo

Antes de los clásicos del punto 2, un ejemplo mínimo para que veas la estructura completa. Contar hasta `n`:

```java
public class CuentaAtras {

    static void cuenta(int n) {
        if (n < 0) return;              // caso base: no hay números negativos que imprimir
        System.out.println(n);
        cuenta(n - 1);                  // caso recursivo: el mismo problema, un paso más pequeño
    }

    public static void main(String[] args) {
        cuenta(3);
    }
}
```

Salida:

```
3
2
1
0
```

Fíjate: primero baja imprimiendo 3, 2, 1, 0, y cuando `n < 0`, la llamada devuelve y todos los frames se cierran uno tras otro. La pila se vacía en orden inverso al que se llenó.

> [!TIP]
> El 90% de los bugs de recursión son dos: **olvidar el caso base** o **no reducir el problema** (llamarse a sí misma con los mismos parámetros). Si tu recursión no termina o no avanza, dibuja el árbol de llamadas en un papel. El papel y boli siguen siendo tus mejores herramientas de depuración.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué dos partes necesita toda función recursiva?
2. ¿Qué lanza la JVM si la recursión nunca termina?
3. ¿Qué guarda un *stack frame*?
4. ¿Por qué una suma de array con bucle suele ser mejor que con recursión?

<details>
<summary>🔄 Respuestas</summary>

1. El **caso base** (detiene la recursión) y el **caso recursivo** (la llamada a sí misma con un problema más pequeño).
2. Un **`StackOverflowError`** cuando el stack se llena de frames.
3. Los **parámetros**, las **variables locales** y la **dirección de vuelta** para continuar cuando la llamada termine.
4. Porque cada llamada recursiva crea un frame nuevo en el stack: **más memoria y más overhead** que un simple `for`.

</details>

---

## ✅ Resumen en 3 frases

1. La recursividad es una **función que se llama a sí misma** con una versión más pequeña del problema.
2. Sin **caso base** no hay detención: el stack se llena y llega el `StackOverflowError`.
3. Usa recursión cuando el problema sea **inherentemente recursivo**; para lo lineal, los bucles siguen ganando.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Caso base | La condición que detiene la recursión |
> | Caso recursivo | La llamada a sí misma con un problema menor |
> | Stack frame | El trocito de memoria de cada llamada (parámetros, locales, retorno) |
> | Call stack | La pila de frames pendientes |
> | `StackOverflowError` | Lo que pasa cuando llenas la pila |
> | Recursión de cola | Cuando la llamada recursiva es lo último que hace la función |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/05-algoritmica-tecnicas) · **Anterior:** [Índice de la unidad](/ApuntesProgramacion/05-algoritmica-tecnicas) · **Siguiente:** [02 · Recursividad: ejemplos clásicos](/ApuntesProgramacion/05-algoritmica-tecnicas/02-recursividad-ejemplos-clasicos)
