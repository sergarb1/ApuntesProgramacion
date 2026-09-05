---
title: "01 — Arrays: el aparcamiento de datos"
description: "Declaración, índices y el primer BOOM: la ArrayIndexOutOfBoundsException que te estrellará alguna vez 🅿️"
---

<p><small>Declaración, índices y el primer BOOM: la ArrayIndexOutOfBoundsException que te estrellará alguna vez 🅿️</small></p>

> 🗺️ **Estás en:** 📚 **U09 · Arrays y Colecciones** → 01 · Arrays: el aparcamiento de datos

---

## 📬 La idea en una frase

> **Un array es un aparcamiento de tamaño fijo: guarda muchos datos del mismo tipo bajo un solo nombre, y cada plaza tiene un número (el índice) que empieza en 0.**

Hasta ahora guardabas una cosa por variable. Con los arrays guardas 100 bajo el mismo cartel. Es la primera herramienta "de verdad" para manejar cantidades, y de ella cuelga todo lo que viene después.

---

## 🐱 El problema: tienes 100 gatos y un solo nombre

Imagina que tienes 100 gatos y necesitas guardar sus nombres. Podrías hacer esto:

```java
String gato1 = "Bigotes";
String gato2 = "Garfield";
String gato3 = "Misifú";
// ... 97 líneas después ...
String gato100 = "Calcetines";
```

Pero entonces llega el gato 101 y tu programa se cae. O peor: quieres saber cuántos gatos empiezan con "M" y tienes que escribir 100 `if`. Tu espalda ya duele solo de pensarlo.

> ⚠️ **Advertencia:** si alguna vez escribes `gato1`, `gato2`, `gato3`... `gatoN` en tu código, en algún lugar un programador senior llora. Los arrays existen exactamente para esto.

---

## 🅿️ El array: tu primer aparcamiento

Un array es como un parking de varias plantas. Cada plaza tiene un número (el **índice**) y en cada plaza solo caben coches del mismo tipo (bueno, y sus subclases).

```java
String[] gatos = new String[100];
// Has creado un parking con 100 plazas para Strings
```

Hay dos formas de declararlo y crearlo:

```java
int[] numeros = new int[5];      // 5 plazas, todas vacías (0)
int[] directo = {10, 20, 30};    // 3 plazas, ya ocupadas
```

La primera plaza es la **0**, no la 1. Esto confunde a todo el mundo al principio. Acéptalo.

> 💡 **Consejo:** piensa en los índices como distancias desde la primera posición. La primera casa está a 0 pasos de ti, no a 1.

### Los valores por defecto

Cuando creas un array con `new`, cada plaza se llena con el valor por defecto del tipo:

| Tipo | Valor por defecto |
|---|---|
| `int`, `long`, `short`, `byte` | `0` |
| `double`, `float` | `0.0` |
| `boolean` | `false` |
| `char` | `'\u0000'` |
| Objetos (`String`, `Persona`...) | `null` |

Ese último es el que muerde: un array de `String` recién creado está lleno de `null`, no de `""`. Si intentas llamar a un método sobre una plaza null, te llevas un `NullPointerException` al instante.

---

## 🚗 Cómo meter cosas en el parking

Se accede a una plaza con corchetes y el número de índice:

```java
String[] gatos = new String[3];
gatos[0] = "Bigotes";
gatos[1] = "Garfield";
gatos[2] = "Misifú";
gatos[3] = "Calcetines"; // ¡BOOM!
```

¿Qué pasa en la última línea? Te vas a estrellar.

### ¡BOOM! La ArrayIndexOutOfBoundsException

```java
int[] numeros = new int[5];
numeros[0] = 10;
numeros[1] = 20;
numeros[2] = 30;
numeros[3] = 40;
numeros[4] = 50;
numeros[5] = 60; // Index 5 out of bounds for length 5
```

El array tiene plazas del 0 al 4. Pedir la 5 es como intentar aparcar donde no hay plaza. Java te responde con `ArrayIndexOutOfBoundsException` y tu programa muere en el acto. Es **la** excepción más típica de esta unidad y la primera que casi todo el mundo sufre.

> 📝 **Nota:** los índices válidos van de `0` a `length - 1`. El último elemento siempre es `arr[arr.length - 1]`. No te lo pienses dos veces: memorízalo.

### La longitud: `length` sin paréntesis

Para saber cuántas plazas tiene el parking:

```java
int[] numeros = new int[10];
System.out.println(numeros.length);  // 10 (sin paréntesis)
```

Fíjate: `array.length` NO lleva paréntesis. No es un método, es un atributo. Los `String` usan `length()`. Los arrays usan `length`. Es una trampa mortal en los exámenes.

> ⚠️ **Advertencia:** el array es un objeto (está en el heap), pero la variable que lo referencia está en la pila (stack). Cuando pasas un array a un método, pasas la referencia, no los datos. Lo verás en detalle en el punto 5, pero ya lo sabes: si modificas el array dentro de un método, los cambios afectan al original.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** los arrays tienen tamaño fijo. Una vez creados, no puedes añadir ni quitar elementos. Si lo necesitas, se crea otro y se copia. Las colecciones del punto 6 solucionan eso.

**Ejercicio: el array que se duplica**

```java
public class BeTheArray {
    public static void main(String[] args) {
        int[] arr = new int[4];
        arr[0] = 2;
        arr[1] = 4;
        arr[2] = 6;
        arr[3] = 8;

        for (int i = 0; i < arr.length; i++) {
            arr[i] = arr[i] * 2;
        }

        System.out.println(arr[2]);
    }
}
```

**¿Qué imprime?**

- (A) 6
- (B) 8
- (C) 12
- (D) 16

<details>
<summary>🔄 Solución</summary>

La **C**. El array original es `{2, 4, 6, 8}`. Después del bucle, cada elemento se multiplica por 2: `{4, 8, 12, 16}`. Por tanto, `arr[2]` = 12. El `for` recorre todas las plazas y las sobreescribe en el sitio: no necesitas otro array.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Cuántas plazas tiene `int[] a = new int[7]` y cuáles son los índices válidos?
2. ¿Qué valor tiene `boolean[] b = new boolean[3]` en cada plaza?
3. ¿Qué excepción lanza `arr[arr.length]`?
4. ¿`numeros.length` o `numeros.length()`? ¿Y para un `String`?

<details>
<summary>🔄 Respuestas</summary>

1. 7 plazas. Índices del 0 al 6 (`length - 1`).
2. `false` en todas: es el valor por defecto de `boolean`.
3. `ArrayIndexOutOfBoundsException`: la plaza `length` no existe, las válidas terminan en `length - 1`.
4. `numeros.length` (atributo, sin paréntesis) para arrays; `texto.length()` (método, con paréntesis) para `String`.

</details>

---

## ✅ Resumen en 3 frases

1. Un **array** guarda muchos valores del mismo tipo bajo un solo nombre, en un aparcamiento de **tamaño fijo**.
2. Se accede por **índice** desde `0` hasta `length - 1`; pasarse provoca `ArrayIndexOutOfBoundsException`.
3. La **longitud** se pregunta con `length` (sin paréntesis) y las plazas recién creadas se llenan con los valores por defecto (`0`, `false`, `null`...).

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Array | Aparcamiento de datos del mismo tipo, tamaño fijo |
> | Índice | Número de la plaza; empieza en 0 |
> | `length` | Tamaño del array (atributo, sin paréntesis) |
> | `ArrayIndexOutOfBoundsException` | Error al salirte de las plazas válidas |
> | Valor por defecto | Lo que ocupa una plaza recién creada (`0`, `false`, `null`...) |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/09-arrays-colecciones) · **Anterior:** [Índice de la unidad](/ApuntesProgramacion/09-arrays-colecciones) · **Siguiente:** [02 · Recorrer arrays: for y for-each](/ApuntesProgramacion/09-arrays-colecciones/02-recorrer-arrays)