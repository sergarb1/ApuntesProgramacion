---
title: "02 — Búsqueda lineal"
description: "El buscador de zapatillas perdidas: revisa cada sitio hasta encontrar lo que buscas 👟"
---

<p><small>El buscador de zapatillas perdidas: revisa cada sitio hasta encontrar lo que buscas 👟</small></p>

> 🗺️ **Estás en:** 🧩 **U04 · Algorítmica I: Fundamentos** → 02 · Búsqueda lineal

---

## 📬 La idea en una frase

> **La búsqueda lineal recorre el array elemento por elemento hasta encontrar el objetivo (o hasta comprobar que no está). Simple, directa y funciona aunque los datos estén desordenados.**

Imagina que pierdes una zapatilla en tu habitación. ¿Qué haces? Miras debajo de la cama, detrás de la puerta, en el armario... básicamente **revisas cada sitio hasta encontrarla**. Pues eso es la búsqueda lineal: vas uno a uno, sin atajos.

---

## 👟 El algoritmo

```java
public class BusquedaLineal {

    public static int buscar(int[] array, int objetivo) {
        for (int i = 0; i < array.length; i++) {
            if (array[i] == objetivo) {
                return i;  // ¡Encontrado! Devuelve la posición
            }
        }
        return -1;  // No está en el array
    }

    public static void main(String[] args) {
        int[] numeros = {34, 12, 56, 78, 23, 9, 45, 67};

        int resultado = buscar(numeros, 23);
        if (resultado != -1) {
            System.out.println("¡Encontrado el 23 en la posición " + resultado + "!");
        } else {
            System.out.println("El 23 no está en el array.");
        }

        resultado = buscar(numeros, 99);
        if (resultado == -1) {
            System.out.println("El 99 no está. Como unas zapatillas que nunca aparecen.");
        }
    }
}
```

Salida:

```
¡Encontrado el 23 en la posición 4!
El 99 no está. Como unas zapatillas que nunca aparecen.
```

Detalles del método `buscar`:

- Recorre el array con un `for` desde la posición 0 hasta `array.length - 1`.
- Si encuentra el objetivo, **devuelve su índice** y para: el `return` corta el método entero.
- Si termina el bucle sin encontrar nada, devuelve `-1`, el "índice imposible" que usamos como señal de *no encontrado*.

> 💡 **Detalle práctico:** devolver `-1` es la convención clásica de "no está". Nunca devuelvas `0` para decir "no encontrado", porque `0` es una posición válida: la primera. Ese error es el clásico "bug del índice cero".

---

## ⏱️ ¿Cómo de rápida es?

En el **mejor caso**, el elemento está en la primera posición → 1 paso.

En el **peor caso**, el elemento está al final, o no existe → recorres los `n` elementos enteros.

Decimos que su complejidad es **O(n)**, lineal. Si el array tiene 10 elementos, tardas ~10 pasos; si tiene 10.000, tardas ~10.000. Crece al mismo ritmo que los datos.

> 💡 **Consejo:** la búsqueda lineal es como buscar en tu nevera: si es pequeña, da igual el método. Pero si tienes un almacén de 10.000 productos, necesitas algo mejor... y en el próximo punto lo encuentras.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuando un método devuelve un índice, los dos caminos de salida son: `return` cuando lo encuentras, `return -1` cuando el bucle termina. Si mezclas eso, el programa se comporta como una gaviota: confunde los sitios.

**Ejercicio: el buscador que se pierde**

Sin ejecutar, calcula cuántas comparaciones hace este programa y qué imprime:

```java
public class Busqueda2 {
    public static int buscar(int[] array, int objetivo) {
        int pasos = 0;
        for (int i = 0; i < array.length; i++) {
            pasos++;
            if (array[i] == objetivo) {
                System.out.println("He necesitado " + pasos + " pasos.");
                return i;
            }
        }
        System.out.println("He necesitado " + pasos + " pasos.");
        return -1;
    }

    public static void main(String[] args) {
        int[] datos = {3, 8, 1, 9, 5, 2};
        int resultado = buscar(datos, 9);
        System.out.println("Posición: " + resultado);
    }
}
```

<details>
<summary>🔄 Solución</summary>

El 9 está en la posición 3 (índice 3, el cuarto elemento). El bucle compara: `3` (paso 1), `8` (paso 2), `1` (paso 3), `9` (paso 4) → lo encuentra. Imprime:

```
He necesitado 4 pasos.
Posición: 3
```

Fíjate en que el `for` **no** recorre todo el array: se detiene en cuanto el `return` corta el método. Ese es el poder del `return` como "break" de emergencia.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué devuelve la búsqueda lineal cuando el elemento no está en el array?
2. ¿Funciona la búsqueda lineal con arrays desordenados?
3. ¿Por qué se dice que es O(n)?
4. ¿Qué imprimiría `buscar(new int[]{5, 5, 5}, 5)`? ¿Qué posición devuelve?

<details>
<summary>🔄 Respuestas</summary>

1. Devuelve `-1`, la señal clásica de "no encontrado".
2. **Sí.** Esa es su gran ventaja: no exige ningún orden previo.
3. Porque en el peor caso recorre los `n` elementos del array: el tiempo crece en proporción directa con los datos.
4. Devuelve la posición **0** (el primer `5`), porque el `return` corta en cuanto encuentra el primero. La posición 0 es válida y distinta de "no encontrado".

</details>

---

## ✅ Resumen en 3 frases

1. La búsqueda lineal recorre el array **elemento por elemento** hasta encontrar el objetivo o agotar la lista.
2. Devuelve el **índice** del elemento, o `-1` si no existe, y funciona con datos **desordenados**.
3. Su complejidad es **O(n)**: perfecta para arrays pequeños, lenta para los grandes.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Índice | Posición de un elemento dentro del array (empieza en 0) |
> | Recorrer | Visitar cada elemento del array uno a uno |
> | -1 | El "índice imposible": señal de que el elemento no está |
> | O(n) | El tiempo crece en proporción directa al número de elementos |
> | Mejor caso | El elemento está el primero: 1 solo paso |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/04-algoritmica-fundamentos) · **Anterior:** [01 · Qué es un algoritmo](/ApuntesProgramacion/04-algoritmica-fundamentos/01-que-es-algoritmo) · **Siguiente:** [03 · Búsqueda binaria](/ApuntesProgramacion/04-algoritmica-fundamentos/03-busqueda-binaria)
