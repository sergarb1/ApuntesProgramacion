---
title: "04 — Ordenación burbuja"
description: Simple, simpática... y la más lenta de las que merecen la pena 🫧
---

<p><small>Simple, simpática... y la más lenta de las que merecen la pena 🫧</small></p>

> 🗺️ **Estás en:** 🧩 **U04 · Algorítmica I: Fundamentos** → 04 · Ordenación burbuja

---

## 📬 La idea en una frase

> **La burbuja recorre el array comparando parejas vecinas: si el de la izquierda es mayor, los intercambia. Repite hasta que en una pasada no haya ningún intercambio. Los grandes "suben" hacia el final como burbujas en una copa.**

Es el algoritmo de ordenación más sencillo de entender... y el más lento de los que merecen la pena. Pero antes de aprender a correr, hay que aprender a caminar. La burbuja es tu andador.

---

## 🫧 El algoritmo

```java
public class Burbuja {

    public static void ordenar(int[] array) {
        int n = array.length;
        boolean huboIntercambio;

        for (int i = 0; i < n - 1; i++) {
            huboIntercambio = false;

            for (int j = 0; j < n - 1 - i; j++) {
                if (array[j] > array[j + 1]) {
                    // intercambio
                    int temp = array[j];
                    array[j] = array[j + 1];
                    array[j + 1] = temp;
                    huboIntercambio = true;
                }
            }

            // si no hubo intercambio, el array ya está ordenado
            if (!huboIntercambio) break;
        }
    }

    public static void main(String[] args) {
        int[] datos = {64, 34, 25, 12, 22, 11, 90};

        System.out.print("Antes: ");
        for (int numero : datos) System.out.print(numero + " ");

        ordenar(datos);

        System.out.print("\nDespués: ");
        for (int numero : datos) System.out.print(numero + " ");
        // 11 12 22 25 34 64 90
    }
}
```

Vamos a trazar la primera pasada con un array pequeño, `{5, 2, 9, 1}`:

| Paso | ¿Qué compara? | ¿Intercambia? | Array |
|---|---|---|---|
| 1 | 5 vs 2 | Sí | 2 5 9 1 |
| 2 | 5 vs 9 | No | 2 5 9 1 |
| 3 | 9 vs 1 | Sí | 2 5 1 9 |

El 9, el mayor, "subió" hasta el final. En cada pasada, el mayor de los que quedan queda colocado en su sitio: el 9, luego el 5, luego el 2, luego el 1. Por eso el bucle interior llega solo hasta `n - 1 - i`: ya no hace falta mirar los elementos que quedaron colocados al final.

---

## 🏎️ ¿Por qué es tan lenta?

Dos bucles anidados. Para un array de `n` elementos:

- Primer bucle: `n` veces.
- Segundo bucle: `~n` veces (en realidad `n-i-1`, pero a grandes rasgos `n`).

**Total: ~n × n = n² operaciones.** Complejidad **O(n²)**.

- Para 10 elementos → 100 operaciones (bien).
- Para 1.000 elementos → 1.000.000 de operaciones (empieza a doler).
- Para 1.000.000 de elementos → 1.000.000.000.000 de operaciones (tu ordenador pide la jubilación).

> 💡 **Consejo:** burbuja solo se usa en dos situaciones: (1) estás aprendiendo, y (2) sabes que el array tendrá menos de 50 elementos. Para todo lo demás hay mejores alternativas (las verás en la U05).

---

## 🚩 La optimización del flag

Fíjate en la variable `huboIntercambio`. Si en una pasada completa no intercambiamos nada, es que el array ya está ordenado y podemos parar: `break`. Sin este flag, la burbuja daría todas las pasadas aunque el array llegara ordenado en la primera.

Esta optimización **no mejora el peor caso** (array invertido: hay que intercambiarlo todo), pero convierte el mejor caso (array ya ordenado) en O(n): una sola pasada de comprobación y listo.

> 💡 **Detalle práctico:** el patrón del flag ("marca si ha pasado algo; si no, para") aparece en muchísimos algoritmos reales. Es una de esas ideas que te harán parecer programador senior aunque solo lleves cuatro unidades.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuando veas `array[j] > array[j + 1]`, piensa "estoy ordenando **de menor a mayor**". Si quieres lo contrario, cambia la flecha. El resto del algoritmo no cambia ni una coma.

**Ejercicio: la burbuja que se queda corta**

Sin ejecutar, escribe la salida exacta de este programa:

```java
public class BurbujaCorta {
    public static void main(String[] args) {
        int[] datos = {3, 1, 2};

        for (int i = 0; i < datos.length - 1; i++) {
            for (int j = 0; j < datos.length - 1 - i; j++) {
                if (datos[j] > datos[j + 1]) {
                    int temp = datos[j];
                    datos[j] = datos[j + 1];
                    datos[j + 1] = temp;
                }
            }
        }

        for (int numero : datos) {
            System.out.print(numero + " ");
        }
    }
}
```

<details>
<summary>🔄 Solución</summary>

Imprime **`1 2 3`**.

Traza sin el flag (este programa no tiene `huboIntercambio`):

| Pasada | j | ¿Compara? | Array |
|---|---|---|---|
| 1 | 0 | 3 vs 1 → sí | 1 3 2 |
| 1 | 1 | 3 vs 2 → sí | 1 2 3 |
| 2 | 0 | 1 vs 2 → no | 1 2 3 |

Sin el flag, la burbuja da una pasada extra de comprobación. El resultado es el mismo, pero en un array ya ordenado de 1000 elementos daría todas las pasadas sin necesidad. Ahí gana la versión con `break`.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Por qué el bucle interior de la burbuja solo llega hasta `n - 1 - i`?
2. ¿Cuál es la complejidad de la burbuja en el peor caso?
3. ¿Qué hace la variable `huboIntercambio`?
4. ¿Cuándo está justificado usar burbuja en un programa real?

<details>
<summary>🔄 Respuestas</summary>

1. Porque tras cada pasada, el mayor de los elementos restantes ya quedó **colocado al final**, y no hace falta volver a mirarlo.
2. **O(n²)** — dos bucles anidados.
3. Detecta si en la pasada hubo intercambios: si no hubo ninguno, el array ya está ordenado y se hace `break`.
4. Solo para aprender, o con arrays de **menos de ~50 elementos**. Para el resto, espera a la U05.

</details>

---

## ✅ Resumen en 3 frases

1. La burbuja compara **parejas vecinas** e intercambia las que están desordenadas, pasada tras pasada.
2. Su complejidad es **O(n²)**: funciona, pero es lenta con datos grandes.
3. El flag `huboIntercambio` la optimiza para arrays casi ordenados, convirtiendo el mejor caso en O(n).

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Intercambio | Cambiar dos elementos entre sí usando una variable temporal |
> | Pasada | Un recorrido completo del bucle interior |
> | Flag | Variable booleana que marca si algo ocurrió durante la pasada |
> | O(n²) | El tiempo crece al cuadrado: dos bucles anidados |
> | In-place | Ordena modificando el propio array, sin memoria extra |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/04-algoritmica-fundamentos) · **Anterior:** [03 · Búsqueda binaria](/ApuntesProgramacion/04-algoritmica-fundamentos/03-busqueda-binaria) · **Siguiente:** [05 · Ordenación por inserción](/ApuntesProgramacion/04-algoritmica-fundamentos/05-ordenacion-insercion)
