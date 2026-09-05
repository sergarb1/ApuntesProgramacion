---
title: "03 — Divide y vencerás"
description: "El patrón más antiguo de la informática: divide el problema, conquista cada parte y combina ⚔️"
---

<p><small>El patrón más antiguo de la informática: divide el problema, conquista cada parte y combina ⚔️</small></p>

> 🗺️ **Estás en:** ⚡ **U06 · Algorítmica II: Técnicas** → 03 · Divide y vencerás

---

## 📬 La idea en una frase

> **Divide y vencerás (divide & conquer) consiste en partir un problema en subproblemas más pequeños, resolver cada uno por separado (normalmente con recursión) y combinar las soluciones.**

La estrategia es tan antigua como Julio César, pero aplicada a algoritmos sigue siendo igual de efectiva. Y sí, en la U05 ya la usaste sin saberlo: la **búsqueda binaria** parte el array por la mitad y descarta una parte en cada paso. Ese era el germen. Ahora le vas a poner nombre y apellidos.

---

## 🧩 Los tres pasos del patrón

1. **Dividir** el problema en subproblemas más pequeños y manejables.
2. **Conquistar** cada subproblema recursivamente (llamadas recursivas).
3. **Combinar** las soluciones de los subproblemas para obtener la solución del problema original.

```
Input grande
     │
     ├──Dividir──→ Subproblema A    → Conquistar (recursivo) → Combinar ──→ Output
     └──Dividir──→ Subproblema B    → Conquistar (recursivo) ─┘
```

La clave está en que **cada subproblema es una copia más pequeña del original**: por eso la recursión encaja tan bien. Y el caso base es el subproblema tan pequeño que ya se resuelve directamente.

---

## 📊 ¿Cuándo merece la pena?

No todo problema se beneficia de dividir. La magia aparece cuando el coste de **combinar** es barato y la división reduce de verdad el trabajo. Un clásico de esta unidad:

| Algoritmo | Divide | Conquista | Combina | Complejidad |
|---|---|---|---|---|
| Búsqueda binaria | Parte por la mitad | Descartas una mitad | Nada | O(log n) |
| Mergesort | Parte por la mitad | Ordenas cada mitad | **Fusionas** | O(n log n) |
| Quicksort | Particiona con pivote | Ordenas cada zona | Nada (ya está) | O(n log n) promedio |

> [!NOTE]
> Fíjate en la fila de Quicksort: el trabajo "caro" ocurre en la **división** (particionar alrededor del pivote), y la combinación es gratis. En Mergesort pasa lo contrario: la división es trivial (cortar por el medio) y el trabajo está en **combinar** (fusionar). Son dos sabores del mismo patrón.

---

## 💡 Un ejemplo sencillo: el máximo de un array

Aunque el máximo se resuelve con un bucle en una línea, veamos cómo lo enfocaría divide y vencerás para que veas el patrón en su mínima expresión:

```java
public class MaximoDyV {

    static int maximo(int[] arr, int izq, int der) {
        if (izq == der) return arr[izq];          // caso base: un solo elemento

        int mid = (izq + der) / 2;
        int maxIzq = maximo(arr, izq, mid);       // conquistar mitad izquierda
        int maxDer = maximo(arr, mid + 1, der);   // conquistar mitad derecha

        return Math.max(maxIzq, maxDer);          // combinar
    }

    public static void main(String[] args) {
        int[] datos = {3, 9, 2, 7, 5, 8, 1, 6};
        System.out.println("Máximo: " + maximo(datos, 0, datos.length - 1)); // 9
    }
}
```

Espera... eso es un bucle disfrazado, ¿no? Sí: su complejidad es O(n), igual que el bucle, porque cada elemento se visita una vez. La moraleja es que **divide y vencerás no siempre gana**: gana cuando la división evita trabajo repetido (como ordenar o buscar), no cuando simplemente reparte el mismo trabajo.

> [!TIP]
> Regla práctica para decidir: si el bucle simple es claro y rápido, usa el bucle. Divide y vencerás es para cuando *partir el problema* te permite **descartar** o **reutilizar** trabajo. La búsqueda binaria descarta media array; el factorial no descarta nada.

---

## 🌳 Aplicaciones famosas

Una vez entiendes el patrón, empiezas a verlo por todas partes. Es como cuando aprendes una palabra nueva y de repente la ves en cada esquina:

- **Búsqueda binaria**: O(log n). Ya la conoces de la U05.
- **Mergesort y Quicksort**: los dos reyes de la ordenación, que verás en los puntos 4 y 5.
- **Exponenciación rápida**: calcular `aⁿ` en O(log n) en lugar de O(n).
- **Multiplicación de matrices (Strassen)**: submatrices en lugar de la triple operación clásica.
- **FFT (Transformada Rápida de Fourier)**: la base del JPEG, el MP3 y el WiFi.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Cuáles son los tres pasos del patrón divide y vencerás?
2. ¿En qué se diferencia el trabajo de Quicksort y Mergesort dentro del patrón?
3. ¿Por qué el "máximo con divide y vencerás" no mejora al bucle simple?
4. La búsqueda binaria, ¿qué paso del patrón "evita" (no necesita)?

<details>
<summary>🔄 Respuestas</summary>

1. **Dividir** en subproblemas, **conquistar** cada uno (recursión) y **combinar** las soluciones.
2. Quicksort hace el trabajo en la **partición** (dividir) y la combinación es gratis; Mergesort divide trivial y hace el trabajo en la **fusión** (combinar).
3. Porque no **descarta** trabajo: visita todos los elementos una vez, igual que el bucle → O(n) en ambos.
4. El paso de **combinar** (no necesita combinar nada: descarta media array y sigue).

</details>

---

## ✅ Resumen en 3 frases

1. Divide y vencerás es el patrón de **dividir, conquistar y combinar**, con cada subproblema más pequeño resuelto por recursión.
2. El caso base es el subproblema trivial; la complejidad depende de cuánto trabajo te ahorre la **división** (descartar o reutilizar).
3. No siempre gana al bucle: solo brilla cuando partir el problema **evita trabajo repetido**, como en ordenación y búsqueda.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Divide & Conquer | Dividir, conquistar y combinar |
> | Subproblema | Una copia más pequeña del problema original |
> | Caso base | El subproblema que se resuelve directamente |
> | Combinar | Unir las soluciones parciales en la solución final |
> | Particionar | Repartir elementos alrededor de un pivote (Quicksort) |
> | Fusionar | Mezclar dos listas ordenadas en una (Mergesort) |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/06-algoritmica-tecnicas) · **Anterior:** [02 · Recursividad: ejemplos clásicos](/ApuntesProgramacion/06-algoritmica-tecnicas/02-recursividad-ejemplos-clasicos) · **Siguiente:** [04 · Quicksort](/ApuntesProgramacion/06-algoritmica-tecnicas/04-quicksort)
