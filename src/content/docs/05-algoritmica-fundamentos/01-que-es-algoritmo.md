---
title: "01 — Qué es un algoritmo"
description: La receta de la tortilla que tu ordenador puede seguir al pie de la letra 🍳
---

<p><small>La receta de la tortilla que tu ordenador puede seguir al pie de la letra 🍳</small></p>

> 🗺️ **Estás en:** 🧩 **U05 · Algorítmica I: Fundamentos** → 01 · Qué es un algoritmo

---

## 📬 La idea en una frase

> **Un algoritmo es una receta de cocina para tu ordenador: una secuencia finita, ordenada y sin ambigüedades de pasos que resuelve un problema.**

Cuando cocinas una tortilla de patatas, sigues un algoritmo mental:

1. Pelar las patatas.
2. Cortarlas en rodajas finas.
3. Freírlas en aceite abundante.
4. Batir los huevos.
5. Mezclarlo todo y cuajar.

Pero ojo: "echa sal al gusto" no vale como paso de algoritmo. ¿Cuánto es "al gusto"? ¿Un pellizco? ¿Un puñado? Cada persona interpretaría la receta de forma distinta. Un algoritmo de verdad **no deja espacio a la interpretación**: cada paso debe ser preciso y determinista. Si le pasas la misma entrada, siempre produce la misma salida. Como una máquina expendedora: metes moneda, pulsas el botón, y siempre sale el mismo batido.

---

## 🏛️ Las propiedades de un algoritmo

Para que una secuencia de pasos merezca el nombre de algoritmo, debe cumplir cinco propiedades:

1. **Finito**: debe terminar en algún momento. Si se ejecuta para siempre, no es un algoritmo, es una pesadilla.
2. **Preciso**: cada paso está definido sin ambigüedad. Nada de "al gusto" ni "cuando esté listo".
3. **Entrada**: recibe cero o más valores de entrada.
4. **Salida**: produce al menos un valor de salida.
5. **Eficaz**: resuelve el problema en tiempo finito y de forma correcta.

> 📝 **Nota histórica:** la palabra "algoritmo" viene del matemático persa **Al-Juarismi** (siglo IX), que escribió un libro sobre cómo hacer cálculos con los números indios. Siglos después, los informáticos le robamos la palabra. Como somos así.

---

## 🧠 La idea vs. el código

Este es un momento importante, así que sube el volumen mental:

> ⚠️ **Advertencia:** **no todo código es un algoritmo.** El algoritmo es la *idea*: la secuencia de pasos. El código es su *materialización* en un lenguaje concreto. Puedes implementar el mismo algoritmo en Java, en Python o en ensamblador, y la esencia seguirá siendo la misma.

Mira este ejemplo. El algoritmo de "sumar dos números" se materializa así en Java:

```java
public class AlgoritmoSimple {
    public static void main(String[] args) {
        int a = 5;
        int b = 3;
        int resultado = a + b;  // la idea: sumar. El código: la materialización
        System.out.println("5 + 3 = " + resultado);
    }
}
```

La *idea* (sumar dos números) es la misma en cualquier lenguaje. El *código* es solo el disfraz. Por eso los algoritmos se estudian independientemente del lenguaje: son las recetas, y Java solo es una de tus cocinas.

---

## 📦 Las dos grandes familias

En esta unidad (y en la próxima) vas a vivir con dos familias de algoritmos:

- **Búsqueda**: encontrar un elemento dentro de un conjunto de datos. ¿Está el número 23 en este array?
- **Ordenación**: poner un conjunto de datos en un orden determinado. ¿Puedes dejar este array ordenado de menor a mayor?

Son las dos habilidades básicas de cualquier programa que maneja datos, y aparecen en todos lados: en una lista de reproducción, en una base de datos, en un buscador. Sin ordenar ni buscar, tu app es un cajón desordenado donde las cosas solo están "por ahí".

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuando escribas pasos "a lo loco" en un papel, pregúntate siempre: *¿podría mi abuela ejecutar estos pasos sin preguntarme nada?* Si la respuesta es "no", tienes ambigüedad.

**Ejercicio: la tortilla ordenada**

Los pasos de esta receta están desordenados. Ordénalos para que formen un algoritmo válido y explica cuál de las propiedades del algoritmo fallaría si los dejaras en el orden original:

1. Batir los huevos.
2. Comer la tortilla.
3. Echar sal "al gusto" sobre las patatas fritas.
4. Freír las patatas en aceite abundante.
5. Pelar y cortar las patatas en rodajas.
6. Mezclar las patatas con el huevo batido y cuajar en la sartén.

<details>
<summary>🔄 Solución</summary>

Orden correcto: **5 → 4 → 1 → 6 → 2** (pelar y cortar, freír, batir, mezclar y cuajar, comer).

El paso 3 ("echar sal al gusto") sobra como algoritmo **preciso**: es ambiguo, cada persona interpretaría una cantidad distinta. Si lo dejaras en el orden original, la receta no sería **precisa** ni **eficaz**, porque no hay una única forma correcta de ejecutarla. Nota extra: el paso 2 (comer) podría estar en otro orden, pero lo lógico es al final.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Cuál es la diferencia entre un algoritmo y un programa?
2. ¿Por qué "echa sal al gusto" no puede ser un paso de algoritmo?
3. ¿Un algoritmo puede recibir cero entradas?
4. ¿Qué pasaría si un algoritmo nunca terminara?

<details>
<summary>🔄 Respuestas</summary>

1. El algoritmo es la **idea** (la secuencia de pasos); el programa es su **materialización** en un lenguaje (Java, Python…).
2. Porque es **ambiguo**: no define una cantidad exacta, y dos personas lo interpretarían distinto.
3. Sí, un algoritmo puede recibir **cero o más** entradas. Por ejemplo, "imprime los números del 1 al 10".
4. Dejaría de ser un algoritmo: incumple la propiedad de ser **finito**. Se convertiría en una pesadilla en bucle.

</details>

---

## ✅ Resumen en 3 frases

1. Un algoritmo es una **secuencia finita, precisa y sin ambigüedades de pasos** que resuelve un problema: una receta de cocina para el ordenador.
2. Debe ser **finito, preciso, con entradas, con salida y eficaz**, y no deja espacio a la interpretación.
3. El algoritmo es la **idea** y el código su materialización: el mismo algoritmo se escribe igual de bien en cualquier lenguaje.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Algoritmo | Secuencia finita y precisa de pasos que resuelve un problema |
> | Determinista | Misma entrada → siempre misma salida |
> | Ambigüedad | Paso que se puede interpretar de varias formas ("al gusto") |
> | Búsqueda | Encontrar un elemento dentro de un conjunto de datos |
> | Ordenación | Poner los datos en un orden determinado (numérico, alfabético…) |
> | Materializar | Traducir la idea del algoritmo a código de un lenguaje |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/05-algoritmica-fundamentos) · **Anterior:** [Índice de la unidad](/ApuntesProgramacion/05-algoritmica-fundamentos) · **Siguiente:** [02 · Búsqueda lineal](/ApuntesProgramacion/05-algoritmica-fundamentos/02-busqueda-lineal)
