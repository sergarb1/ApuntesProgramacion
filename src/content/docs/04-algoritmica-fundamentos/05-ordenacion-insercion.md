---
title: "05 — Ordenación por inserción"
description: Ordena las cartas de la mano como un crupier veterano 🃏
---

<p><small>Ordena las cartas de la mano como un crupier veterano 🃏</small></p>

> 🗺️ **Estás en:** 🧩 **U04 · Algorítmica I: Fundamentos** → 05 · Ordenación por inserción

---

## 📬 La idea en una frase

> **La inserción toma cada elemento como una carta nueva y la coloca en su sitio dentro de las que ya tienes ordenadas en la mano. Como ordenar cartas en el póker.**

Cuando te reparten cartas, no las tiras todas sobre la mesa y empiezas de cero: vas colocando cada carta nueva en su hueco dentro de la mano que ya tienes ordenada. El 7 entre el 5 y el 9, el 3 al principio, la K al final. Pues eso, pero en Java.

---

## 🃏 El algoritmo

```java
public class Insercion {

    public static void ordenar(int[] array) {
        for (int i = 1; i < array.length; i++) {
            int clave = array[i];  // la carta que vamos a colocar
            int j = i - 1;

            // desplazar los mayores hacia la derecha
            while (j >= 0 && array[j] > clave) {
                array[j + 1] = array[j];
                j--;
            }
            array[j + 1] = clave;  // colocar la carta en su sitio
        }
    }

    public static void main(String[] args) {
        int[] datos = {9, 5, 1, 4, 3};

        System.out.print("Antes: ");
        for (int numero : datos) System.out.print(numero + " ");

        ordenar(datos);

        System.out.print("\nDespués: ");
        for (int numero : datos) System.out.print(numero + " ");
        // 1 3 4 5 9
    }
}
```

El truco está en el `while` interior: guardas la `clave` (la carta nueva), y mientras haya cartas mayores que ella a su izquierda, las desplazas una posición a la derecha. Cuando encuentras una menor (o llegas al principio), esa es la posición de la clave. La "mano" izquierda siempre está ordenada.

---

## 👣 Paso a paso

Dado `{9, 5, 1, 4, 3}`, mira cómo crece la "mano" (lo que hay a la izquierda de la barra):

```
Paso 0: [9] | 5 1 4 3   → la mano empieza con el 9
Paso 1: [5 9] | 1 4 3   → el 5 se coloca a la izquierda del 9
Paso 2: [1 5 9] | 4 3   → el 1 se cuela al principio
Paso 3: [1 4 5 9] | 3   → el 4 entra entre el 1 y el 5
Paso 4: [1 3 4 5 9]     → el 3 entra entre el 1 y el 4
```

Cada elemento nuevo se "inserta" en su sitio. De ahí el nombre. La mano izquierda siempre está ordenada; el resto del array espera su turno.

---

## 📊 El análisis: ¿cuándo es buena?

También es **O(n²)** en el peor caso (array invertido: cada elemento debe viajar hasta el principio). Pero tiene truco:

- **Mejor caso (array casi ordenado):** O(n). Solo hace una pasada de comprobación. Es rapidísima.
- Es **estable**: mantiene el orden relativo de los elementos iguales.
- **No necesita memoria extra**: ordena in-place, modificando el propio array.
- En la práctica, es **más rápida que la burbuja**, aunque ambas sean O(n²).

> 💡 **Consejo:** la inserción es la reina de los datos **casi ordenados**. Si sabes que tu array tiene 100 elementos y ya está "casi bien" (solo un par de elementos fuera de sitio), la inserción te va a sorprender. De hecho, se usa como paso final en algoritmos avanzados (TimSort, el que usa Java por defecto en sus colecciones).

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** en la inserción, la variable `clave` es la única que "sobrevive" al desplazamiento. Si la usaras para algo más, la perderías al sobrescribir `array[j + 1]`. Guárdala como un tesoro: es tu carta.

**Ejercicio: la mano que se desordena**

Sin ejecutar, escribe la salida exacta de este programa:

```java
public class Insercion2 {
    public static void main(String[] args) {
        int[] datos = {4, 2};

        for (int i = 1; i < datos.length; i++) {
            int clave = datos[i];
            int j = i - 1;
            while (j >= 0 && datos[j] > clave) {
                datos[j + 1] = datos[j];
                j--;
            }
            datos[j + 1] = clave;
        }

        System.out.println(datos[0] + " " + datos[1]);
    }
}
```

<details>
<summary>🔄 Solución</summary>

Imprime **`2 4`**.

Con solo dos elementos, la inserción es casi ridícula de simple: `clave = 2`, `j = 0`. Como `4 > 2`, desplaza el 4 a la posición 1 y `j` pasa a `-1`. El `while` termina (porque `j >= 0` ya no se cumple) y la clave se coloca en `datos[0]`. Resultado: `{2, 4}`. La clave viajó hasta el principio: ese es el mecanismo exacto que, repetido, ordena arrays enteros.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿En qué se diferencia la inserción de la burbuja a la hora de ordenar?
2. ¿Cuál es la complejidad de la inserción en su mejor caso y por qué?
3. ¿Qué significa que sea "estable"?
4. ¿Por qué se dice que no necesita memoria extra?

<details>
<summary>🔄 Respuestas</summary>

1. La burbuja intercambia **vecinos** en cada pasada; la inserción **coloca cada elemento en su sitio** desplazando los mayores una posición.
2. **O(n)** — con un array casi ordenado, cada elemento solo necesita una comprobación y se queda donde está.
3. Que mantiene el **orden relativo** de los elementos iguales entre sí (si "Ana" venía antes que "Luis" y tienen la misma edad, sigue viniendo antes).
4. Porque ordena **in-place**: modifica el array original, sin crear estructuras auxiliares.

</details>

---

## ✅ Resumen en 3 frases

1. La inserción toma cada elemento como una **carta nueva** y lo coloca en su sitio dentro de la parte ya ordenada.
2. Es **O(n²)** en el peor caso, pero **O(n)** con datos casi ordenados: la reina de los arrays casi listos.
3. Es **estable**, no usa memoria extra y en la práctica supera a la burbuja.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Clave | El elemento actual que estamos colocando en su sitio |
> | Desplazar | Mover un elemento una posición hacia la derecha |
> | Mano | La parte del array ya ordenada (a la izquierda) |
> | Estable | Respeta el orden relativo de los elementos iguales |
> | In-place | Ordena sin necesidad de arrays auxiliares |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/04-algoritmica-fundamentos) · **Anterior:** [04 · Ordenación burbuja](/ApuntesProgramacion/04-algoritmica-fundamentos/04-ordenacion-burbuja) · **Siguiente:** [06 · Complejidad algorítmica: Big O](/ApuntesProgramacion/04-algoritmica-fundamentos/06-complejidad-big-o)
