---
title: "07 — Elegir el algoritmo adecuado"
description: La tabla de decisión del buen programador, para no usar una excavadora como cucharilla 🧠
---

<p><small>La tabla de decisión del buen programador, para no usar una excavadora como cucharilla 🧠</small></p>

> 🗺️ **Estás en:** 🧩 **U05 · Algorítmica I: Fundamentos** → 07 · Elegir el algoritmo adecuado

---

## 📬 La idea en una frase

> **El mejor algoritmo no es el más famoso ni el más rápido en teoría: es el que encaja con tu tamaño de datos, su orden inicial y lo que necesitas. Elegir bien es la mitad del trabajo.**

¿Para abrir una nuez usarías una excavadora? Pues eso. Hay quien clava una búsqueda binaria en un array de 5 elementos, y quien ordena un millón de datos con burbuja. Los dos están mal: uno desperdicia esfuerzo, el otro desperdicia su tiempo de vida. Elegir el algoritmo adecuado es parte del oficio.

---

## 📋 La tabla de resumen

| Algoritmo | Complejidad | ¿Cuándo usarlo? | ¿Cuándo NO? |
|---|---|---|---|
| Búsqueda lineal | O(n) | Arrays pequeños o desordenados | Arrays grandes y ordenados (la binaria gana) |
| Búsqueda binaria | O(log n) | Arrays grandes **ordenados**, con muchas búsquedas | Arrays desordenados (¡basura sin aviso!) |
| Burbuja | O(n²) | Aprender y arrays muy pequeños (< 50) | Cualquier cosa que merezca la pena |
| Inserción | O(n²) / O(n) | Arrays pequeños o **casi ordenados** | Arrays grandes y desordenados |

---

## 🧮 La pregunta clave: ¿ordenar antes de buscar?

Vale, la búsqueda binaria es rapidísima... pero exige un array ordenado. Y ordenar también cuesta. Entonces: ¿merece la pena ordenar primero?

La regla del buen administrador:

- Si **ordenas una vez y buscas muchas veces** → ordena con algo decente (en la U06 verás cómo) y luego usa binaria. La inversión se amortiza.
- Si **buscas una vez** en un array desordenado → búsqueda lineal directa. Ordenar solo para una búsqueda es regar el jardín con champán.

Y una curiosidad: para arrays **muy pequeños** (menos de ~50 elementos), la búsqueda lineal suele ganar incluso con datos ordenados, porque la sobrecarga de la binaria no compensa. La teoría importa, pero el contexto manda.

---

## 🏫 Ejemplo guiado: el catálogo de la tienda

Tienes una tienda con `notas` de clientes y quieres saber la nota de "Luis". El catálogo está en un `int[] notas` con los valores desordenados y solo vas a preguntar una vez. ¿Qué usas?

```java
public class Tienda {
    // Una sola búsqueda sobre datos desordenados → búsqueda lineal
    public static int buscarNota(int[] notas, int objetivo) {
        for (int i = 0; i < notas.length; i++) {
            if (notas[i] == objetivo) {
                return i;
            }
        }
        return -1;
    }

    public static void main(String[] args) {
        int[] notas = {7, 9, 5, 8, 6, 4};
        int posicion = buscarNota(notas, 8);
        System.out.println("El 8 está en la posición " + posicion);
    }
}
```

¿Y si tu tienda recibiera **miles de consultas al día** sobre el mismo catálogo? Entonces merece la pena ordenar el array una vez (cuesta O(n²) con lo que sabes hoy, pero en la U06 aprenderás más rápido) y usar búsqueda binaria en cada consulta. **Ordenar una vez, buscar mil.**

---

## 📊 Reglas de oro para decidir

1. **¿Es pequeño (< 50)?** → Cualquiera vale: usa lineal o inserción por simplicidad.
2. **¿Es grande y desordenado?** → No uses burbuja ni inserción. Espera a la U06 (QuickSort, MergeSort).
3. **¿Es grande y ordenado?** → Búsqueda binaria, sin pensarlo.
4. **¿Está casi ordenado?** → Inserción arrasa: O(n) en la práctica.
5. **¿Voy a buscar muchas veces?** → Invierte en ordenar bien y busca con binaria.
6. **¿Voy a buscar una sola vez?** → Lineal directa, sin dramas.

> ⚠️ **Advertencia:** la elección de algoritmo también depende de otros factores que verás más adelante: la **estabilidad** (¿mantener el orden de los iguales?), la **memoria** disponible y si los datos caben en memoria. Por ahora, con estas reglas de oro sobrevives a cualquier examen y a casi cualquier app.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** antes de escribir una línea, pregúntate: *¿qué tamaño tiene mi array? ¿Está ordenado? ¿Cuántas veces voy a hacer esta operación?* Tres preguntas, tres respuestas, y el algoritmo se elige solo.

**Ejercicio: el jefe de almacén**

Para cada escenario, elige el algoritmo más adecuado y justifica en una línea:

1. Un array de **8** notas desordenado, buscar la nota de un alumno una sola vez.
2. Una agenda de **10.000** contactos ordenada alfabéticamente, donde buscarás nombres constantemente.
3. Un array de **60.000** mediciones desordenadas que hay que dejar ordenadas de menor a mayor.
4. Un array de **200** números ya casi ordenados (solo un par de despistados fuera de sitio).

<details>
<summary>🔄 Solución</summary>

1. **Búsqueda lineal**: array pequeño, una sola búsqueda, y además está desordenado. La binaria ni se plantea.
2. **Búsqueda binaria**: está ordenado y buscas muchas veces: O(log n) en cada consulta.
3. **Ni burbuja ni inserción**: con 60.000 elementos, O(n²) es un martirio. Toca esperar a la U06 (QuickSort/MergeSort, O(n log n)).
4. **Inserción**: con datos casi ordenados es O(n) en la práctica, mucho mejor que la burbuja.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Cuándo gana la búsqueda lineal a la binaria aunque el array esté ordenado?
2. ¿Cuándo merece la pena ordenar antes de buscar?
3. ¿Qué algoritmo eliges para un array casi ordenado?
4. ¿Qué regla de oro usarías para un array de 100.000 elementos desordenado?

<details>
<summary>🔄 Respuestas</summary>

1. Con arrays **muy pequeños** (< ~50) o cuando solo vas a buscar **una vez**: la sobrecarga de la binaria no compensa.
2. Cuando **ordenas una vez y buscas muchas veces**; la inversión se amortiza con las consultas.
3. **Inserción** — es O(n) en la práctica con datos casi ordenados.
4. No usar burbuja ni inserción: su O(n²) sería un calvario. Espera a la U06 para ordenar como es debido.

</details>

---

## ✅ Resumen en 3 frases

1. El algoritmo adecuado depende del **tamaño**, el **orden inicial** y la **frecuencia de las operaciones**.
2. **Ordenar una vez y buscar muchas** amortiza la inversión; buscar una sola vez no merece ordenar.
3. Regla rápida: pequeño o desordenado → lineal; grande y ordenado → binaria; casi ordenado → inserción; grande y desordenado → espera a la U06.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Contexto | Tamaño, orden inicial y frecuencia de uso de tus datos |
> | Amortizar | Recuperar una inversión inicial con el uso repetido |
> | Sobrecarga | El coste fijo extra de un algoritmo sofisticado en datos pequeños |
> | Trade-off | Compromiso: ganar en algo pagando algo a cambio |
> | Estabilidad | Mantener el orden relativo de los elementos iguales |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/05-algoritmica-fundamentos) · **Anterior:** [06 · Complejidad algorítmica: Big O](/ApuntesProgramacion/05-algoritmica-fundamentos/06-complejidad-big-o) · **Siguiente:** [08 · Be the Code: búsqueda binaria desde cero](/ApuntesProgramacion/05-algoritmica-fundamentos/08-be-the-code)
