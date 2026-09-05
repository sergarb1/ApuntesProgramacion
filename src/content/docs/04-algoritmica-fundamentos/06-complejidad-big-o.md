---
title: "06 — Complejidad algorítmica: Big O"
description: La balanza que pesa algoritmos sin parar el cronómetro ⏱️
---

<p><small>La balanza que pesa algoritmos sin parar el cronómetro ⏱️</small></p>

> 🗺️ **Estás en:** 🧩 **U04 · Algorítmica I: Fundamentos** → 06 · Complejidad algorítmica: Big O

---

## 📬 La idea en una frase

> **Big O no te dice cuántos segundos tarda un algoritmo: te dice cómo crece su tiempo cuando crece la cantidad de datos. La tendencia, no el cronómetro.**

Dos ordenadores, uno de 2024 y otro de 2004. El moderno gana siempre en un test rápido, pero eso no nos dice nada del *algoritmo*. Para comparar algoritmos de forma justa, miramos su **tasa de crecimiento**: ¿qué pasa cuando el número de datos `n` se hace MUY grande? Eso es Big O.

---

## 📈 Las complejidades más comunes

| Notación | Nombre | Ejemplo | Para n = 1.000 |
|---|---|---|---|
| O(1) | Constante | Acceder a `array[0]` | 1 operación |
| O(log n) | Logarítmica | Búsqueda binaria | ~10 operaciones |
| O(n) | Lineal | Búsqueda lineal | 1.000 operaciones |
| O(n log n) | Casi lineal | Ordenaciones avanzadas (lo verás en la U05) | ~10.000 operaciones |
| O(n²) | Cuadrática | Burbuja, inserción | 1.000.000 de operaciones |
| O(2ⁿ) | Exponencial | Fibonacci sin optimizar | ¡inviable! |

Fíjate en el último. Para `n = 1.000`, O(2ⁿ) no es "muy lento": es que no termina ni en la era de los dinosaurios. La diferencia entre O(n) y O(n²) con datos grandes es la diferencia entre "echo un café mientras carga" y "me jubilo antes de que termine".

---

## 🧪 Big O en código

Vamos a ver las tres más habituales con ejemplos en Java:

```java
public class EjemplosComplejidad {

    // O(1) — CONSTANTE: siempre igual, no importa el tamaño
    public static int obtenerPrimero(int[] array) {
        return array[0];  // un solo paso, siempre
    }

    // O(n) — LINEAL: crece en proporción a n
    public static int sumar(int[] array) {
        int suma = 0;
        for (int numero : array) {
            suma += numero;  // n pasos
        }
        return suma;
    }

    // O(n²) — CUADRÁTICA: dos bucles anidados
    public static void imprimirPares(int[] array) {
        for (int i = 0; i < array.length; i++) {
            for (int j = 0; j < array.length; j++) {
                System.out.println(array[i] + ", " + array[j]);  // n × n pasos
            }
        }
    }

    public static void main(String[] args) {
        int[] datos = {10, 20, 30, 40, 50};

        System.out.println("O(1): " + obtenerPrimero(datos));
        System.out.println("O(n): " + sumar(datos));
        System.out.println("O(n²): mira la consola llenándose de pares...");
        imprimirPares(datos);
    }
}
```

La regla del pulgar: **un bucle solo → O(n). Un bucle dentro de otro → O(n²).** Y si el bucle solo recorre la mitad de los datos... sigue siendo O(n), no O(n/2). Las constantes no cuentan.

---

## 📏 Las reglas prácticas de Big O

1. **Ignora las constantes**: O(2n) es lo mismo que O(n). El 2 no importa cuando `n` tiende a infinito.
2. **Quédate con el término dominante**: O(n² + n) → O(n²). El `n²` se come al `n` cuando `n` crece.
3. **Los bucles anidados multiplican**: un bucle dentro de otro → `n × n` → O(n²).
4. **Los bucles secuenciales suman**: un bucle y luego otro → O(n + n) → O(2n) → O(n).

```java
public class ReglasBigO {
    public static void main(String[] args) {
        // REGLA 1: las constantes no importan
        // O(2n) → O(n)
        // O(100n) → O(n)

        // REGLA 2: el término dominante se queda
        // O(n² + 5n + 1) → O(n²)
        // O(n + log n) → O(n)

        // REGLA 3: bucles anidados → multiplica
        // for (i...) { for (j...) { } }  →  O(n × n) → O(n²)

        // REGLA 4: bucles secuenciales → suma
        // for (i...) { }  for (i...) { }  →  O(n + n) → O(2n) → O(n)

        System.out.println("Big O no es magia, es simplificar.");
        System.out.println("Pregúntate: ¿qué pasa cuando n se hace MUY grande?");
    }
}
```

> 📝 **Nota:** Big O describe el **peor caso** (la cota superior): "como mucho, tardará esto". Existen también Big Omega Ω (mejor caso) y Big Theta Θ (caso promedio), pero con Big O tienes suficiente para empezar. Y para aprobar, también.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** para calcular Big O de memoria: cuenta bucles y mira si se anidan o se suceden. Si tienes dudas entre O(n) y O(n²), piensa en un array de un millón: ¿recorre una vez (un millón de pasos) o un millón de veces (un billón)?

**Ejercicio: el analista de complejidades**

Dime la complejidad Big O de cada método (las respuestas, escondidas):

```java
public class Analisis {

    public static int metodoA(int[] array) {
        int total = 0;
        for (int i = 0; i < array.length; i++) {
            total += array[i];
        }
        for (int i = 0; i < array.length; i++) {
            total += array[i] * 2;
        }
        return total;
    }

    public static void metodoB(int[] array) {
        for (int i = 0; i < array.length; i++) {
            for (int j = 0; j < array.length; j++) {
                System.out.println(array[i] + " " + array[j]);
            }
        }
    }

    public static int metodoC(int[] array) {
        return array[array.length - 1];
    }
}
```

<details>
<summary>🔄 Solución</summary>

- **`metodoA` → O(n)**: dos bucles **secuenciales** suman: O(n + n) = O(2n) = O(n).
- **`metodoB` → O(n²)**: dos bucles **anidados** multiplican: n × n.
- **`metodoC` → O(1)**: acceso directo por índice, sin bucles. Un solo paso, siempre.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué mide exactamente Big O?
2. ¿Cuál es la complejidad de un bucle anidado?
3. ¿O(2n) y O(n) son lo mismo?
4. Ordena de menor a mayor: O(1), O(n²), O(n), O(log n), O(2ⁿ).

<details>
<summary>🔄 Respuestas</summary>

1. La **tasa de crecimiento** del tiempo de ejecución cuando crece `n`. No los segundos exactos.
2. **O(n²)** — los bucles anidados multiplican.
3. **Sí** — las constantes se ignoran: O(2n) = O(n).
4. **O(1) < O(log n) < O(n) < O(n²) < O(2ⁿ)**.

</details>

---

## ✅ Resumen en 3 frases

1. Big O describe **cómo crece el tiempo** de un algoritmo cuando crece la cantidad de datos, no los segundos exactos.
2. Las reglas de oro: ignora constantes, quédate con el término dominante, **anidar multiplica** y **secuenciar suma**.
3. Con datos grandes, la diferencia entre O(n) y O(n²) es la diferencia entre un café y una jubilación.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Big O | Notación para la cota superior de crecimiento de un algoritmo |
> | Término dominante | El que manda cuando `n` es enorme (el `n²` de `n² + n`) |
> | Anidar | Meter un bucle dentro de otro → multiplica la complejidad |
> | O(1) | Constante: siempre el mismo número de pasos |
> | O(log n) | Cada paso descarta la mitad: crece muy despacio |
> | Exponencial | O(2ⁿ): crece tan rápido que es inviable con datos medianos |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/04-algoritmica-fundamentos) · **Anterior:** [05 · Ordenación por inserción](/ApuntesProgramacion/04-algoritmica-fundamentos/05-ordenacion-insercion) · **Siguiente:** [07 · Elegir el algoritmo adecuado](/ApuntesProgramacion/04-algoritmica-fundamentos/07-elegir-algoritmo)
