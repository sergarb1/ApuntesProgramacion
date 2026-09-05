---
title: "05 — Arrays y métodos"
description: "Pasar arrays a métodos y el paso por referencia: el testigo que se comparte, no se copia 🏃"
---

<p><small>Pasar arrays a métodos y el paso por referencia: el testigo que se comparte, no se copia 🏃</small></p>

> 🗺️ **Estás en:** 🅿️ **U04 · Arrays** → 05 · Arrays y métodos

---

## 📬 La idea en una frase

> **Cuando pasas un array a un método, pasas la referencia, no los datos: el método comparte tu parking y, si toca un coche, el cambio se ve fuera.**

Aquí se te van a caer las gafas (o se te van a poner de moda). En la U07 viste que Java pasa los argumentos **por valor**. Pero los arrays parecen llegar por referencia... La clave: se pasa por valor la **copia de la referencia**. El array no se copia; solo se copia la dirección donde está.

---

## 🏃 Pasando el testigo

Mira este programa y su salida:

```java
public class ArraysMetodos {
    public static void main(String[] args) {
        int[] edades = {10, 20, 30};
        modificar(edades);
        System.out.println(edades[0]); // 99
    }

    public static void modificar(int[] arr) {
        arr[0] = 99;
    }
}
```

Imprime `99`, no `10`. El método `modificar` ha cambiado la plaza 0 del array `edades`... aunque el array se creó en `main`. ¿Cómo es posible si Java pasa por valor?

La explicación: **la referencia** (la dirección de memoria donde vive el array) se copia al pasar al método. La copia y el original apuntan al **mismo parking**. Cuando el método hace `arr[0] = 99`, no cambia su copia de la referencia: cambia el contenido del objeto al que ambos apuntan.

> 📝 **Nota:** esto NO es un paso por referencia de verdad. Java nunca pasa la variable por referencia. Pasa una copia de la referencia (por eso se llama *pass-by-value*). Pero como el array es un objeto, esa copia apunta al mismo sitio.

---

## 🆚 Primitivos vs arrays: la diferencia clave

Compara el comportamiento:

```java
public class PasoDeDatos {
    public static void main(String[] args) {
        int numero = 5;
        cambiarNumero(numero);
        System.out.println(numero);   // 5 (el primitivo NO cambia)

        int[] arr = {1, 2, 3};
        cambiarArray(arr);
        System.out.println(arr[0]);   // 99 (el array SÍ cambia)
    }

    static void cambiarNumero(int n) {
        n = 99;                       // cambia la copia, el original sigue en 5
    }

    static void cambiarArray(int[] a) {
        a[0] = 99;                    // cambia el contenido del objeto compartido
    }
}
```

| Tipo | Qué recibe el método | ¿Se modifica fuera? |
|---|---|---|
| `int`, `double`, `boolean`... | Una copia del valor | No |
| `String` | Una copia de la referencia (String es inmutable) | No (por inmutable) |
| Array (`int[]`, `String[]`...) | Una copia de la referencia | Sí, si se modifican elementos |
| Objetos | Una copia de la referencia | Sí, si se modifican atributos |

> ⚠️ **Advertencia:** si dentro del método haces `arr = otroArray`, NO cambias el array original: solo reasignas tu copia de la referencia. Para modificar el original, toca elementos (`arr[i] = ...`) o atributos del objeto, nunca la variable.

---

## 🧪 Métodos que usan arrays

### Recibir un array para calcular

```java
public static double media(int[] notas) {
    int suma = 0;
    for (int n : notas) {
        suma += n;
    }
    return (double) suma / notas.length;
}
```

### Modificar un array (el cambio se ve fuera)

```java
public static void duplicar(int[] arr) {
    for (int i = 0; i < arr.length; i++) {
        arr[i] *= 2;
    }
}
```

### Devolver un array nuevo

Los métodos también pueden **devolver** arrays. Aquí se crea uno nuevo y se rellena:

```java
public static int[] primerosCuadrados(int n) {
    int[] resultado = new int[n];
    for (int i = 0; i < n; i++) {
        resultado[i] = (i + 1) * (i + 1);
    }
    return resultado;
}

// En el main:
int[] cuadrados = primerosCuadrados(4);
System.out.println(Arrays.toString(cuadrados)); // [1, 4, 9, 16]
```

Cuando devuelves un array, devuelves una **referencia** a un objeto del heap. Quien la recibe puede usar y modificar ese objeto. Por eso, si no quieres que te lo toquen, devuelve una copia (`Arrays.copyOf`).

---

## 🏁 El famoso `main(String[] args)`

Desde la U01 llevas escribiendo `main(String[] args)` sin pararte a pensar. ¡Es un método que recibe un array de Strings! Esos son los argumentos de línea de comandos:

```java
public class Saludo {
    public static void main(String[] args) {
        System.out.println("Hola, " + args[0]);
    }
}
```

Si lo ejecutas con `java Saludo Ana`, `args` será `{"Ana"}` e imprimirá `Hola, Ana`. Si lo ejecutas sin argumentos y accedes a `args[0]`, `ArrayIndexOutOfBoundsException` — el mismo error del punto 1, ahora con la cara de `args`.

> 💡 **Consejo:** `args.length` te dice cuántos argumentos te han pasado. Comprueba siempre antes de acceder: `if (args.length > 0) { ... }`.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** los arrays se pasan por referencia (copia de la referencia). Las variables primitivas se pasan por valor. Si lo entiendes aquí, entiendes el 90% de los bugs raros del curso.

**Ejercicio: el array al cuadrado**

```java
import java.util.Arrays;

public class BeTheArrayRevelde {
    public static void main(String[] args) {
        int[] nums = {1, 2, 3, 4, 5};
        for (int i = 0; i < nums.length; i++) {
            nums[i] = nums[i] * nums[i];
        }
        System.out.println(nums[2]);
    }
}
```

**¿Qué imprime?**

- (A) 3
- (B) 6
- (C) 9
- (D) 25

<details>
<summary>🔄 Solución</summary>

La **C**. Se eleva cada número al cuadrado en el sitio: `{1, 4, 9, 16, 25}`. `nums[2]` = 9. No hay trampa de referencias aquí porque todo ocurre en el mismo método, pero el patrón (`arr[i] = ...`) es el mismo que usarías para modificar un array pasado a un método.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué imprime este código: `int[] a = {1,2,3}; cambiar(a);` donde `cambiar(int[] x) { x[0] = 7; }`?
2. ¿Y si el método hace `x = new int[]{9,9,9}` en lugar de tocar `x[0]`?
3. ¿`String` se comporta como un array o como un primitivo al pasarlo a un método?
4. ¿Qué guarda realmente la variable `args` de `main`?

<details>
<summary>🔄 Respuestas</summary>

1. `7`. El método modifica el contenido del objeto compartido, y el cambio se ve en `main`.
2. Nada: el array original sigue `{1, 2, 3}`. `x = new int[]{...}` solo reasigna la copia local de la referencia.
3. Como un primitivo "especial": la referencia se copia, pero `String` es inmutable, así que ningún método puede cambiar su contenido. El original nunca cambia.
4. Un array de `String` con los argumentos de línea de comandos. `args[0]` es el primero, `args.length` cuántos hay.

</details>

---

## ✅ Resumen en 3 frases

1. Los **arrays se pasan por referencia** (una copia de la referencia al objeto compartido): modificarlos dentro de un método se ve fuera.
2. Los **primitivos se pasan por valor**: el método recibe una copia y el original no cambia; los `String`, por ser inmutables, se comportan como ellos.
3. Los métodos pueden **devolver arrays** (una referencia a un objeto nuevo) y `main(String[] args)` es, en realidad, un método que recibe un array.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Paso por valor | Se copia el dato (primitivos, referencias) |
> | Paso por referencia | Se comparte el objeto (efecto visible en arrays) |
> | Referencia | Dirección de memoria donde vive el objeto |
> | Alias | Dos variables que apuntan al mismo objeto |
> | Argumentos de `main` | El array `args` con los parámetros de la línea de comandos |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/04-arrays) · **Anterior:** [04 · La clase Arrays: tu navaja suiza](/ApuntesProgramacion/04-arrays/04-clase-arrays) · **Siguiente:** [06 · Aplicaciones de los arrays](/ApuntesProgramacion/04-arrays/06-aplicaciones-arrays)