---
title: "08 — Be the Code: búsqueda binaria desde cero"
description: Programa binaria y burbuja sin red de seguridad, como en las entrevistas de Google 🕶️
---

<p><small>Programa binaria y burbuja sin red de seguridad, como en las entrevistas de Google 🕶️</small></p>

> 🗺️ **Estás en:** 🧩 **U04 · Algorítmica I: Fundamentos** → 08 · Be the Code: búsqueda binaria desde cero

---

## 📬 La idea en una frase

> **Este punto no tiene teoría nueva: tiene dos retos. Programar búsqueda binaria y burbuja a mano, paso a paso, sin mirar los apuntes. Si algún día quieres trabajar en una FAANG, esto lo tienes que escribir dormido.**

La búsqueda binaria es un clásico de las entrevistas técnicas de Google, Amazon y compañía. No porque sea difícil, sino porque el **off-by-one** castiga sin piedad a quien confía de más. Vamos a entrenarte para que tú no seas esa víctima.

---

## 🕶️ Don Tip: la receta mental de la binaria

Antes de escribir código, memoriza la receta:

1. Dos punteros: `izquierda = 0` y `derecha = array.length - 1`.
2. Mientras `izquierda <= derecha`: calcula `medio = izquierda + (derecha - izquierda) / 2`.
3. Si `array[medio] == objetivo` → devuelve `medio`.
4. Si `array[medio] < objetivo` → `izquierda = medio + 1`.
5. Si no → `derecha = medio - 1`.
6. Fin del bucle → devuelve `-1`.

El error más común (incluso con 10 años de experiencia) es el **off-by-one**: ¿`<=` o `<`? ¿`medio + 1` o `medio`? La respuesta: `<=` en la condición, y `medio + 1` / `medio - 1` al mover los punteros. Sin el `+1`/`-1`, si el objetivo no está, el bucle puede quedarse girando para siempre.

---

## 🧩 RETO 1: Búsqueda binaria desde cero

Aquí tienes el esqueleto. Complétalo. **Sin mirar los apuntes.** Tu cerebro tiene que recordar, no copiar:

```java
public class RetoBinaria {

    public static int busquedaBinaria(int[] array, int objetivo) {
        // 🧠 TU CÓDIGO AQUÍ
        return -1;
    }

    public static void main(String[] args) {
        int[] pruebas = {1, 3, 5, 7, 9, 11, 13, 15, 17, 19};

        System.out.println("El 7 está en posición: " + busquedaBinaria(pruebas, 7));   // 3
        System.out.println("El 13 está en posición: " + busquedaBinaria(pruebas, 13)); // 6
        System.out.println("El 8 está en posición: " + busquedaBinaria(pruebas, 8));   // -1
        System.out.println("El 19 está en posición: " + busquedaBinaria(pruebas, 19)); // 9
        System.out.println("El 1 está en posición: " + busquedaBinaria(pruebas, 1));   // 0
        System.out.println("Array vacío: " + busquedaBinaria(new int[]{}, 5));         // -1
    }
}
```

**Pasos guiados (resiste a leerlos todos de golpe):**

1. Declara `izquierda` y `derecha`.
   <details><summary>¿Atascado?</summary>`int izquierda = 0;` e `int derecha = array.length - 1;`</details>
2. Escribe el `while` con la condición correcta.
   <details><summary>¿Atascado?</summary>`while (izquierda <= derecha) { ... }`</details>
3. Calcula el `medio`.
   <details><summary>¿Atascado?</summary>`int medio = izquierda + (derecha - izquierda) / 2;` — la fórmula anti-desbordamiento.</details>
4. Compara y decide los tres casos.
   <details><summary>¿Atascado?</summary>`==` → devuelve `medio`; `<` → `izquierda = medio + 1`; `>` → `derecha = medio - 1`.</details>
5. Fuera del bucle, devuelve el "no encontrado".
   <details><summary>¿Atascado?</summary>`return -1;`</details>

> 💡 **Consejo de debugging:** si algo falla, dibuja el array en un papel con 3 elementos y simula los pasos con un objetivo que no esté. El papel y el boli son tus mejores herramientas de depuración. Sí, en pleno 2026, y sí, funcionan.

<details>
<summary>🔄 Solución completa</summary>

```java
public static int busquedaBinaria(int[] array, int objetivo) {
    if (array == null || array.length == 0) return -1;

    int izquierda = 0;
    int derecha = array.length - 1;

    while (izquierda <= derecha) {
        int medio = izquierda + (derecha - izquierda) / 2;

        if (array[medio] == objetivo) {
            return medio;
        } else if (array[medio] < objetivo) {
            izquierda = medio + 1;
        } else {
            derecha = medio - 1;
        }
    }
    return -1;
}
```

</details>

---

## 🧩 RETO 2: Burbuja a mano

Ahora toca la burbuja. Misma regla: sin mirar. Completa el método `ordenar` para que deje el array de menor a mayor. Debería mostrar `11 12 22 25 34 64 90`:

```java
public class RetoBurbuja {

    public static void ordenar(int[] array) {
        // 🧠 TU CÓDIGO AQUÍ
    }

    public static void main(String[] args) {
        int[] datos = {64, 34, 25, 12, 22, 11, 90};

        ordenar(datos);

        for (int numero : datos) {
            System.out.print(numero + " ");
        }
    }
}
```

**Pasos guiados:**

1. Dos bucles anidados: el exterior repite pasadas.
   <details><summary>¿Atascado?</summary>`for (int i = 0; i < array.length - 1; i++) { ... }`</details>
2. El interior compara parejas vecinas, llegando cada vez un elemento menos.
   <details><summary>¿Atascado?</summary>`for (int j = 0; j < array.length - 1 - i; j++) { ... }`</details>
3. Si están desordenados, intercambia con una variable temporal.
   <details><summary>¿Atascado?</summary>`if (array[j] > array[j + 1]) { int temp = array[j]; array[j] = array[j + 1]; array[j + 1] = temp; }`</details>
4. Extras de nivel: añade el flag `huboIntercambio` con su `break`.
   <details><summary>¿Atascado?</summary>Un `boolean huboIntercambio = false;` al inicio de cada pasada, `true` al intercambiar, y `if (!huboIntercambio) break;` al final de la pasada.</details>

<details>
<summary>🔄 Solución completa</summary>

```java
public static void ordenar(int[] array) {
    int n = array.length;
    boolean huboIntercambio;

    for (int i = 0; i < n - 1; i++) {
        huboIntercambio = false;

        for (int j = 0; j < n - 1 - i; j++) {
            if (array[j] > array[j + 1]) {
                int temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
                huboIntercambio = true;
            }
        }

        if (!huboIntercambio) break;
    }
}
```

</details>

---

## 🧩 EL LÍO: la burbuja que apesta

El departamento de calidad ha recibido este algoritmo. Algo huele mal. Identifica los errores y explica por qué no funciona:

```java
public class BurbujaLiosa {
    public static void ordenar(int[] arr) {
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr.length; j++) {
                if (arr[j] > arr[j + 1]) {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
    }
}
```

> 🕶️ **Don Tip:** cuando un bucle accede a `arr[j + 1]`, asegúrate de que `j + 1` no se salga del array. Y pregúntate: ¿recorro menos elementos en cada pasada?

<details>
<summary>🔄 Solución</summary>

Hay **dos errores**:

1. **Error de índices (y de castigo seguro):** el bucle interior va `j < arr.length`, así que cuando `j = arr.length - 1`, accede a `arr[j + 1]` = `arr[arr.length]`, que **no existe** → `ArrayIndexOutOfBoundsException`. El interior debe ir hasta `arr.length - 1 - i`.
2. **Error de rendimiento:** el bucle exterior recorre `arr.length` veces y el interior **siempre** recorre todo el array, sin aprovechar que cada pasada deja un elemento colocado al final. Además, sin el flag `huboIntercambio`, sigue dando pasadas aunque el array ya esté ordenado. Es burbuja "sin pulir", y se nota.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. En búsqueda binaria, ¿qué condición usa el `while`: `izquierda <= derecha` o `izquierda < derecha`?
2. ¿Por qué `izquierda = medio` (sin el `+1`) puede colgar el bucle?
3. ¿Qué pasa si haces burbuja con `j < array.length` en el bucle interior?
4. ¿Para qué sirve el flag `huboIntercambio` en la burbuja?

<details>
<summary>🔄 Respuestas</summary>

1. `izquierda <= derecha`. Con `<`, te puedes perder el elemento que queda justo en `medio` cuando los punteros se cruzan.
2. Porque si `medio` no es el objetivo, al reasignar `izquierda = medio` (o `derecha = medio`) el segmento **no se reduce** y el bucle se repite con los mismos límites para siempre.
3. `ArrayIndexOutOfBoundsException`: al llegar a `j = array.length - 1`, `arr[j + 1]` está fuera del array.
4. Detectar que el array ya está ordenado para parar (`break`) en vez de seguir dando pasadas inútiles.

</details>

---

## ✅ Resumen en 3 frases

1. La búsqueda binaria se escribe con **dos punteros**, el **medio anti-desbordamiento** y los **`+1`/`-1` sagrados**; con eso, no hay off-by-one que valga.
2. La burbuja se construye con **dos bucles anidados**, un intercambio con variable temporal y, si eres listo, un **flag** que corta en cuanto está ordenado.
3. Escribir ambos **a mano** (sin mirar) es el ejercicio de la unidad: si lo logras, te llevas la medalla al cinturón.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Off-by-one | Error de "por uno": `<=` vs `<`, `medio+1` vs `medio` |
> | Puntero | Índice que delimita el segmento actual (`izquierda`, `derecha`) |
> | Anti-desbordamiento | `izquierda + (derecha - izquierda) / 2` en vez de `(izquierda+derecha)/2` |
> | Variable temporal | El `temp` que guarda un valor durante el intercambio |
> | Flag | Booleano que avisa de si pasó algo en la pasada |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/04-algoritmica-fundamentos) · **Anterior:** [07 · Elegir el algoritmo adecuado](/ApuntesProgramacion/04-algoritmica-fundamentos/07-elegir-algoritmo) · **Siguiente:** [09 · Repaso interactivo](/ApuntesProgramacion/04-algoritmica-fundamentos/09-repaso-interactivo)
