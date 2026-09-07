---
title: "06 · Operaciones terminales: collect, reduce, count, forEach"
description: "El grifo que hace que el agua fluya de verdad: `collect`, `reduce`, `count` y `forEach` 🚰"
---

<p><small>El grifo que hace que el agua fluya de verdad: `collect`, `reduce`, `count` y `forEach` 🚰</small></p>

> 🗺️ **Estás en:** 🎯 **U12 · Programación Funcional** → 06 · Operaciones terminales: collect, reduce, count, forEach

---

## 📬 La idea en una frase

> **Las operaciones terminales son el grifo del pipeline: sin una de ellas, el stream no fluye. `collect` empaqueta el resultado, `reduce` combina todos los elementos en uno, `count` los cuenta y `forEach` los recorre.**

En el punto 4 viste que el stream es perezoso y en el punto 5 que las intermedias solo preparan la cinta. Hoy abres el grifo. Cada terminal produce un resultado final y, al hacerlo, **consume el stream**: después de `count()`, `reduce()` o `forEach()`, la cinta queda vacía y no se puede reutilizar.

---

## 🚰 Las cuatro terminales

### `collect(Collector)` — la que empaqueta

Recoge los elementos del flujo en una estructura. La más famosa: `Collectors.toList()`. Es el puente entre el stream y las colecciones de la U10 (en el punto 7 la exprimimos a fondo).

```java
import java.util.*;
import java.util.stream.*;

List<Integer> numeros = List.of(4, 8, 2, 9, 5);
List<Integer> lista = numeros.stream()
    .filter(n -> n % 2 == 0)
    .collect(Collectors.toList());    // [4, 8, 2]
```

### `reduce(identidad, acumulador)` — la que combina

Va combinando los elementos en uno solo. El primer argumento es la **identidad** (el valor neutro: `0` para sumas, `1` para productos), y el segundo es un `BinaryOperator` que dice cómo combinar dos elementos.

```java
int suma = numeros.stream().reduce(0, (a, b) -> a + b);      // 28
int maximo = numeros.stream().reduce(Integer.MIN_VALUE, Math::max);  // 9
```

`reduce(0, (a, b) -> a + b)` se lee: "empieza en 0 y ve sumando cada elemento al acumulador". Es como un bucle `for` donde el acumulador viaja de elemento en elemento... sin bucle.

### `count()` — la que cuenta

Devuelve el número de elementos como `long`.

```java
long pares = numeros.stream().filter(n -> n % 2 == 0).count();   // 3
```

### `forEach(Consumer)` — la que recorre

Aplica un `Consumer` a cada elemento. Es la terminal "imperativa": la única que se parece a un bucle, pensada para efectos secundarios (imprimir, guardar...).

```java
numeros.stream().forEach(System.out::println);   // imprime todos
```

> ⚠️ **Advertencia:** `forEach` con un stream en paralelo no garantiza orden. Para el curso, úsalo en streams normales y no te preocupes; pero recuerda que si el orden importa, es más seguro `collect` y luego recorrer.

---

## 🏭 El pipeline completo

Junta lo de los dos puntos anteriores:

```java
import java.util.*;
import java.util.stream.*;

public class Notas {
    public static void main(String[] args) {
        List<Integer> notas = List.of(7, 8, 3, 9, 5);

        long aprobados = notas.stream()
            .filter(n -> n >= 5)
            .count();                                  // 4

        int sumaAprobados = notas.stream()
            .filter(n -> n >= 5)
            .reduce(0, Integer::sum);                  // 29

        List<Integer> dobladas = notas.stream()
            .filter(n -> n >= 5)
            .map(n -> n * 2)
            .collect(Collectors.toList());             // [14, 16, 18, 10]

        System.out.println(aprobados + " " + sumaAprobados + " " + dobladas);
    }
}
```

Salida: `4 29 [14, 16, 18, 10]`. Tres pipelines, tres grifos, tres resultados. Cada vez que abres uno, el stream se consume y tienes que crear otro.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `Integer::sum` es una referencia a método (punto 3) perfecta para `reduce`: es un `BinaryOperator<Integer>` que suma dos enteros.

**Ejercicio: el acumulador**

```java
import java.util.*;
import java.util.stream.*;

public class Acumulador {
    public static void main(String[] args) {
        List<Integer> numeros = List.of(1, 2, 3, 4, 5);
        int total = numeros.stream()
            .reduce(10, (a, b) -> a * b);
        System.out.println(total);
    }
}
```

**¿Qué imprime?**

- (A) `120`
- (B) `15`
- (C) `1200`
- (D) `10`

<details>
<summary>🔄 Solución</summary>

La **C**. `reduce(10, (a, b) -> a * b)` empieza en la identidad `10` y va multiplicando por cada elemento: `10 * 1 = 10`, `10 * 2 = 20`, `20 * 3 = 60`, `60 * 4 = 240`, `240 * 5 = 1200`. La identidad NO es "el primer elemento": es el valor con el que arranca el acumulador. Por eso la B (`15`) sería el resultado de `reduce(1, ...)` sin multiplicar por la identidad, y la A (`120`) la trampa de creer que la identidad se ignora. La identidad es un elemento más del cálculo: `10` cuenta.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué devuelve `count()`?
2. ¿Para qué sirve el primer argumento de `reduce(0, ...)`?
3. ¿Qué hace `forEach`?
4. ¿Puedes reutilizar el mismo stream tras una operación terminal?

<details>
<summary>🔄 Respuestas</summary>

1. Un `long` con el número de elementos.
2. Es la **identidad**: el valor con el que arranca el acumulador (el neutro de la operación: `0` para sumas, `1` para productos).
3. Aplica un `Consumer` a cada elemento: la terminal para efectos secundarios como imprimir.
4. No. Tras una terminal, el stream queda consumido.

</details>

---

## ✅ Resumen en 3 frases

1. Las **operaciones terminales** son el grifo del pipeline: sin ellas, nada fluye.
2. `collect` empaqueta el resultado, `reduce` combina los elementos en uno (con una identidad), `count` los cuenta y `forEach` los recorre.
3. Tras una terminal, el stream se **consume**: si necesitas procesar de nuevo, crea otro stream.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Terminal | Operación que cierra el pipeline y produce un resultado |
> | `collect` | Recoge el flujo en una estructura (p. ej. lista) |
> | `reduce` | Combina todos los elementos en uno (suma, máximo...) |
> | Identidad | Valor inicial del `reduce` (neutro: `0` para la suma) |
> | `count()` | Devuelve el número de elementos (`long`) |
> | `forEach` | Aplica un `Consumer` a cada elemento |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/12-programacion-funcional) · **Anterior:** [05 · Operaciones intermedias: filter, map, distinct, sorted, limit](/ApuntesProgramacion/12-programacion-funcional/05-streams-intermedias) · **Siguiente:** [07 · Del stream a la colección: toList, Collectors, groupingBy](/ApuntesProgramacion/12-programacion-funcional/07-streams-colecciones)