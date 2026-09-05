---
title: "07 · Be the Code: el parking se gestiona"
description: "Invierte, busca y compacta arrays a mano, sin ayuda de la clase Arrays, como en una entrevista de trabajo 🕶️"
---

<p><small>Invierte, busca y compacta arrays a mano, sin ayuda de la clase Arrays, como en una entrevista de trabajo 🕶️</small></p>

> 🗺️ **Estás en:** 🅿️ **U04 · Arrays** → 07 · Be the Code: el parking se gestiona

---

## 📬 La idea en una frase

> **Este punto no tiene teoría nueva: tiene tres retos. Invertir un array sin mirar apuntes, buscar todas las posiciones de un valor y cazar los errores de un array que se rebela.**

La clase `Arrays` te lo da todo hecho: ordena, copia, busca... Pero cuando te piden "invierte este array" en una entrevista, nadie te deja usar `Arrays.sort()`. Hay que saber hacerlo a mano. Este punto es tu gimnasio.

---

## 🕶️ Don Tip: la receta mental del inverso en el sitio

Invertir un array es el clásico de las entrevistas. La receta mental:

1. Dos punteros: `izquierda = 0` y `derecha = array.length - 1`.
2. Mientras `izquierda < derecha`: intercambia `array[izquierda]` y `array[derecha]`.
3. `izquierda++` y `derecha--`.
4. Cuando se cruzan, ya está.

El error más común: crear un **array auxiliar** cuando no hace falta. En el sitio, con dos punteros y una variable temporal, es O(n) de tiempo y O(1) de memoria. Eso es lo que impresiona en una entrevista.

---

## 🧩 RETO 1: Invertir el array en el sitio

Completa el método `invertir` para que dé la vuelta al array **sin crear otro array**. Debe mostrar `5 4 3 2 1`:

```java
public class RetoInverso {

    public static void invertir(int[] array) {
        // 🧠 TU CÓDIGO AQUÍ
    }

    public static void main(String[] args) {
        int[] datos = {1, 2, 3, 4, 5};
        invertir(datos);
        for (int n : datos) {
            System.out.print(n + " ");
        }
    }
}
```

**Pasos guiados (resiste a leerlos todos de golpe):**

1. Declara los dos punteros.
   <details><summary>¿Atascado?</summary>`int izquierda = 0;` e `int derecha = array.length - 1;`</details>
2. Escribe el `while` con la condición correcta.
   <details><summary>¿Atascado?</summary>`while (izquierda < derecha) { ... }` — cuando se cruzan, ya está.</details>
3. Intercambia los dos elementos con una variable temporal.
   <details><summary>¿Atascado?</summary>`int temp = array[izquierda]; array[izquierda] = array[derecha]; array[derecha] = temp;`</details>
4. Mueve los punteros hacia el centro.
   <details><summary>¿Atascado?</summary>`izquierda++; derecha--;`</details>

<details>
<summary>🔄 Solución completa</summary>

```java
public static void invertir(int[] array) {
    int izquierda = 0;
    int derecha = array.length - 1;

    while (izquierda < derecha) {
        int temp = array[izquierda];
        array[izquierda] = array[derecha];
        array[derecha] = temp;
        izquierda++;
        derecha--;
    }
}
```

</details>

---

## 🧩 RETO 2: Buscar todas las posiciones

`binarySearch` te da una posición. Este reto te pide **todas**. Escribe un método que devuelva un array con todos los índices donde aparece un valor (vacío si no aparece):

```java
public class RetoBusqueda {

    public static int[] posiciones(int[] datos, int buscado) {
        // 🧠 TU CÓDIGO AQUÍ
        return new int[0];
    }

    public static void main(String[] args) {
        int[] datos = {3, 7, 2, 7, 9, 7, 1};
        System.out.println(java.util.Arrays.toString(posiciones(datos, 7)));
        System.out.println(java.util.Arrays.toString(posiciones(datos, 5)));
    }
}
```

Debe mostrar `[1, 3, 5]` y `[]`.

**Pasos guiados:**

1. Primera pasada: cuenta cuántas veces aparece.
   <details><summary>¿Atascado?</summary>Un `for` con un contador que suba cuando `datos[i] == buscado`.</details>
2. Crea el array de resultados con ese tamaño.
   <details><summary>¿Atascado?</summary>`int[] resultado = new int[cuantas];`</details>
3. Segunda pasada: rellena las posiciones.
   <details><summary>¿Atascado?</summary>Un segundo `for` que, cuando encuentre el valor, haga `resultado[k++] = i;`</details>

> 💡 **Consejo de depuración:** este "contar primero, crear después" es un patrón que se repite: no puedes crear el array de resultados hasta saber cuántas plazas necesita. Cuando el tamaño depende de los datos, se hace en dos pasadas.

<details>
<summary>🔄 Solución completa</summary>

```java
public static int[] posiciones(int[] datos, int buscado) {
    int cuantas = 0;
    for (int i = 0; i < datos.length; i++) {
        if (datos[i] == buscado) {
            cuantas++;
        }
    }

    int[] resultado = new int[cuantas];
    int k = 0;
    for (int i = 0; i < datos.length; i++) {
        if (datos[i] == buscado) {
            resultado[k++] = i;
        }
    }
    return resultado;
}
```

</details>

---

## 🧩 EL LÍO: el parking que se rebeló

El encargado del parking ha escrito esto para "dejar las plazas impares vacías". Algo huele mal. Encuentra los errores:

```java
public class ParkingLioso {
    public static void vaciarImpares(int[] arr) {
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] % 2 == 1) {
                arr[i] = null;   // 🚨 ¿compila esto?
            }
        }
    }
}
```

> 🕶️ **Don Tip:** pregunta siempre: ¿qué tipo de dato guarda este array? Un `int` no puede valer `null`; un `Integer` sí (pero eso es un objeto de la U10).

<details>
<summary>🔄 Solución</summary>

**No compila.** `arr` es un `int[]`, y `int` es un tipo primitivo: **no puede valer `null`**. `null` solo cabe en variables de tipo objeto (`String`, `Integer`, `Alumno`...).

Si quisieras "vaciar" un `int[]`, tendrías que poner un valor de sentinela, por ejemplo `0` o `-1`. Y si de verdad necesitas plazas vacías de verdad, tendrías que usar un array de objetos (`Integer[]`), que verás en la U10 con las colecciones.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué condición usa el `while` del inverso en el sitio: `<` o `<=`?
2. ¿Qué pasa si usas `<=` en el inverso con un array de longitud impar?
3. ¿Por qué el patrón "contar primero, crear después" necesita dos pasadas?
4. ¿Puede un `int[]` guardar `null`? ¿Y un `String[]`?

<details>
<summary>🔄 Respuestas</summary>

1. `izquierda < derecha`. Con `<=` te sobraría el paso en el que ambos punteros apuntan al mismo elemento (con longitud impar), que además intercambiaría un elemento consigo mismo.
2. Con longitud impar, en la vuelta central `izquierda == derecha`: intercambias el elemento consigo mismo (inútil pero inofensivo). Con `<` ni siquiera entras ahí.
3. Porque no sabes cuántas plazas necesita el array de resultados hasta contar las coincidencias. Los arrays tienen tamaño fijo: hay que saberlo antes de crearlos.
4. No: `int` es primitivo y no acepta `null`. Sí: `String` es un objeto y su valor por defecto es `null`.

</details>

---

## ✅ Resumen en 3 frases

1. **Invertir en el sitio** es el clásico de entrevistas: dos punteros (`izquierda`/`derecha`), intercambio con `temp`, y `while (izquierda < derecha)`.
2. Cuando el tamaño del resultado **depende de los datos**, se usa el patrón de **dos pasadas**: contar primero, crear y rellenar después.
3. `null` no cabe en un array de **primitivos**: solo en arrays de objetos. Con `int[]` se usan valores centinela.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Invertir en el sitio | Dar la vuelta al array sin crear otro, con dos punteros |
> | Variable temporal | El `temp` que guarda un valor durante el intercambio |
> | Dos pasadas | Contar primero y crear/rellenar después (tamaño dependiente de los datos) |
> | Valor centinela | Un valor especial (`-1`, `0`) que significa "vacío" en primitivos |
> | Puntero | Índice que delimita una zona (`izquierda`, `derecha`) |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/04-arrays) · **Anterior:** [06 · Aplicaciones de los arrays](/ApuntesProgramacion/04-arrays/06-aplicaciones-arrays) · **Siguiente:** [08 · Array-revelde: errores comunes y depuración](/ApuntesProgramacion/04-arrays/08-array-revelde)