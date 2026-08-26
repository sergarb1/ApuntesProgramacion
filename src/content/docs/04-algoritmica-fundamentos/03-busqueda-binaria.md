---
title: "03 — Búsqueda binaria"
description: "El buscador Jedi: descarta media tonelada de papel en cada intento 🕯️"
---

<p><small>El buscador Jedi: descarta media tonelada de papel en cada intento 🕯️</small></p>

> 🗺️ **Estás en:** 🧩 **U04 · Algorítmica I: Fundamentos** → 03 · Búsqueda binaria

---

## 📬 La idea en una frase

> **La búsqueda binaria abre el "diccionario" por la mitad, compara, y descarta media tonelada de papel en cada intento. Solo funciona si el array está ordenado.**

Buscar una palabra en un diccionario es un ritual muy concreto: no abres por la página 1 y pasas de una en una. Abres por la mitad, ves si la palabra está antes o después, y descartas la mitad del libro en un gesto. Y repites. Eso es la búsqueda binaria.

---

## ⚠️ El requisito imprescindible

> **El array debe estar ordenado.** Si no, este método no funciona.

Y lo peor de todo: no te avisa. No hay error de compilación, no hay excepción, no hay "ey, me has dado basura". Simplemente obtienes la respuesta equivocada. Es como buscar "merienda" en un diccionario cuyas palabras están al azar: abrir por la mitad no te sirve de nada.

---

## 🕯️ El algoritmo

```java
public class BusquedaBinaria {

    public static int buscar(int[] array, int objetivo) {
        int izquierda = 0;
        int derecha = array.length - 1;

        while (izquierda <= derecha) {
            int medio = izquierda + (derecha - izquierda) / 2;  // mitad del segmento

            if (array[medio] == objetivo) {
                return medio;  // ¡Bingo!
            }

            if (array[medio] < objetivo) {
                izquierda = medio + 1;  // descartamos la mitad izquierda
            } else {
                derecha = medio - 1;    // descartamos la mitad derecha
            }
        }
        return -1;  // no encontrado
    }

    public static void main(String[] args) {
        // OJO: tiene que estar ORDENADO
        int[] numeros = {2, 5, 8, 12, 19, 24, 31, 37, 42, 50, 58, 63};

        int resultado = buscar(numeros, 31);
        System.out.println("31 encontrado en posición: " + resultado);  // 6

        resultado = buscar(numeros, 3);
        System.out.println("3 encontrado en: " + resultado);  // -1
    }
}
```

Vamos a trazar la búsqueda del 31 sobre el array `{2, 5, 8, 12, 19, 24, 31, 37, 42, 50, 58, 63}` (12 elementos):

| Vuelta | izquierda | derecha | medio | array[medio] | ¿Qué pasa? |
|---|---|---|---|---|---|
| 1 | 0 | 11 | 5 | 24 | 24 < 31 → izquierda = 6 |
| 2 | 6 | 11 | 8 | 42 | 42 > 31 → derecha = 7 |
| 3 | 6 | 7 | 6 | 31 | ¡Bingo! → devuelve 6 |

Tres comparaciones. La búsqueda lineal habría necesitado siete. Y en un array de un millón de elementos, la diferencia es todavía más escandalosa.

---

## 🧮 ¿Por qué `izquierda + (derecha - izquierda) / 2` y no `(izquierda + derecha) / 2`?

Porque si el array es muy grande (cerca de `Integer.MAX_VALUE` elementos), `izquierda + derecha` puede **desbordarse**: el resultado ya no cabe en un `int` y se convierte en un número negativo de golpe. La fórmula alternativa `izquierda + (derecha - izquierda) / 2` evita ese problema.

> ⚠️ **Advertencia:** este es un bug tan famoso que apareció incluso en la biblioteca de Java original. Lleva años coleccionando trofeos: Bug del año, Bug de la década, Bug favorito del público...

---

## ⏱️ El análisis: O(log n)

En cada paso, la búsqueda binaria **descarta la mitad** del array restante. Mira cómo crece el número de pasos:

- Array de 16 elementos → 4 pasos máximos
- Array de 32 elementos → 5 pasos
- Array de 1.024 elementos → 10 pasos
- Array de 1.000.000 de elementos → 20 pasos

Eso es **O(log n)**, complejidad logarítmica. Crece muy despacio incluso con datos enormes. Es la diferencia entre preguntar a mil personas una por una, o preguntar "¿está a la izquierda o a la derecha?" y descartar a 500 de golpe. Con un millón de elementos, la lineal necesita un millón de pasos y la binaria solo **20**. Lee eso otra vez. Veinte.

> 📝 **Nota:** cuando un informático dice "log n", piensa en **base 2**: es "mitad, mitad, mitad...". No es el logaritmo decimal de toda la vida. Un logaritmo en base 2 responde a la pregunta "¿cuántas veces puedo dividir entre 2 antes de llegar a 1?".

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** la búsqueda binaria tiene una regla de oro: si el medio es menor que el objetivo, `izquierda = medio + 1`; si es mayor, `derecha = medio - 1`. El `+1` y el `-1` son sagrados: sin ellos, el bucle puede quedarse dando vueltas para siempre.

**Ejercicio: el buscador que no avanza**

Sin ejecutar, traza la búsqueda del número **8** en este array ordenado y escribe los valores de `izquierda`, `derecha` y `medio` en cada vuelta:

```java
public class Traza {
    public static int buscar(int[] array, int objetivo) {
        int izquierda = 0;
        int derecha = array.length - 1;

        while (izquierda <= derecha) {
            int medio = izquierda + (derecha - izquierda) / 2;
            System.out.println("izquierda=" + izquierda + " derecha=" + derecha + " medio=" + medio);

            if (array[medio] == objetivo) return medio;
            if (array[medio] < objetivo) {
                izquierda = medio + 1;
            } else {
                derecha = medio - 1;
            }
        }
        return -1;
    }

    public static void main(String[] args) {
        int[] datos = {1, 4, 8, 12, 20, 33};
        System.out.println("Resultado: " + buscar(datos, 8));
    }
}
```

<details>
<summary>🔄 Solución</summary>

| Vuelta | izquierda | derecha | medio | array[medio] | Acción |
|---|---|---|---|---|---|
| 1 | 0 | 5 | 2 | 8 | ¡Bingo! → devuelve 2 |

Imprime:

```
izquierda=0 derecha=5 medio=2
Resultado: 2
```

El 8 está justo en el medio de la primera pasada, así que el algoritmo hace **una sola comparación**. Este es el mejor caso de la búsqueda binaria: encontrar el objetivo en el centro a la primera.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué requisito imprescindible tiene la búsqueda binaria?
2. ¿Qué pasa si la incumples?
3. ¿Cuántos pasos máximos necesita para un array de 1.000.000 de elementos?
4. ¿Por qué se usa `izquierda + (derecha - izquierda) / 2` en vez de `(izquierda + derecha) / 2`?

<details>
<summary>🔄 Respuestas</summary>

1. Que el array esté **ordenado**.
2. Devuelve la respuesta equivocada **sin avisar**: no hay error ni excepción. Silencio y basura.
3. **20 pasos** — log₂(1.000.000) ≈ 20.
4. Para evitar el **desbordamiento**: `izquierda + derecha` puede no caber en un `int` con arrays gigantes.

</details>

---

## ✅ Resumen en 3 frases

1. La búsqueda binaria **divide el problema a la mitad en cada paso**, comparando el objetivo con el elemento central.
2. Exige un array **ordenado**; si no lo está, devuelve basura sin avisar.
3. Su complejidad es **O(log n)**: con un millón de elementos bastan ~20 pasos, mientras que la lineal necesita un millón.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Mitad | El elemento central del segmento actual (`medio`) |
> | Descartar | Eliminar la mitad izquierda o derecha del segmento |
> | O(log n) | El tiempo crece muy despacio: cada paso descarta la mitad |
> | Off-by-one | Error de "por uno": confundir `<=` con `<` o `medio+1` con `medio` |
> | Desbordamiento | Cuando una suma supera el máximo que cabe en un `int` |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/04-algoritmica-fundamentos) · **Anterior:** [02 · Búsqueda lineal](/ApuntesProgramacion/04-algoritmica-fundamentos/02-busqueda-lineal) · **Siguiente:** [04 · Ordenación burbuja](/ApuntesProgramacion/04-algoritmica-fundamentos/04-ordenacion-burbuja)
