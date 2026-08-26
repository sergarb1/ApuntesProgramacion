---
title: "09 — Repaso interactivo"
description: "El cierre de la unidad con chicha: adivina salidas, arregla bugs y date el lujo de sufrir con honor 😈"
---

<p><small>El cierre de la unidad con chicha: adivina salidas, arregla bugs y date el lujo de sufrir con honor 😈</small></p>

> 🗺️ **Estás en:** ⚡ **U05 · Algorítmica II: Técnicas** → 09 · Repaso interactivo

---

## 📬 La idea en una frase

> **En este punto no aprendemos nada nuevo: lo convertimos todo en práctica. Y, como siempre, algo no va a funcionar.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaban de darte este programa para ejecutar:*

```java
public class MisterioRecursivo {
    static int contar(int n) {
        if (n <= 0) return 0;
        return 1 + contar(n / 2);
    }

    public static void main(String[] args) {
        System.out.println(contar(16));
        System.out.println(contar(100));
    }
}
```

**¿Qué imprimes por pantalla? Elige sabiamente:**

1. **`4` y `6`** → Recuerda: cada llamada divide `n` entre 2 hasta llegar a 0. ❌
2. **`5` y `7`** → ✅ ¡Correcto! `contar(16)`: 16→8→4→2→1→0, cinco saltos. `contar(100)`: 100→50→25→12→6→3→1→0, siete saltos. Es un contador de divisiones entre 2 (o sea, el "log₂" redondeado).
3. **`4` y `7`** → Cuenta los saltos de la primera: 16→8→4→2→1→0 son cinco pasos, no cuatro. ❌

> <details>
> <summary>🔄 Solución</summary>
>
> La opción **2**. `contar(n)` devuelve `1 + contar(n / 2)`: cada llamada añade 1 y reduce `n` a la mitad. Los pasos hasta llegar a 0 son el log₂ redondeado hacia arriba. Este es el clásico que separa a los que han hecho la unidad de los que han dormido.
>
> </details>

---

## 🎯 Verdadero o falso

1. "Toda función recursiva necesita un caso base." 
2. "El Fibonacci ingenua es O(n log n)."
3. "Quicksort es estable."
4. "Mergesort siempre es O(n log n), pase lo que pase."
5. "La memoización convierte el Fibonacci de O(2ⁿ) a O(n)."
6. "En Java, `Arrays.sort()` usa TimSort para tipos primitivos."

<details>
<summary>🔄 Respuestas</summary>

1. **Verdadero.** Sin caso base, `StackOverflowError` asegurado.
2. **Falso.** El Fibonacci ingenuo es **O(2ⁿ)**, exponencial.
3. **Falso.** Quicksort no es estable; la estabilidad es de Mergesort.
4. **Verdadero.** Por eso es "el fiable": no tiene caso malo.
5. **Verdadero.** Cada Fibonacci se calcula una sola vez.
6. **Falso.** Para **primitivos** usa Dual-Pivot Quicksort; TimSort es para **objetos**.

</details>

---

## 🔥 Fireside Chat: Quicksort y Mergesort discuten

> *Dos veteranos de la ordenación discuten junto a la taza humeante.*

**Quicksort:** — Escucha, colega. Yo soy el más usado del planeta. En promedio, yo ordeno más rápido que tú con la misma memoria. A ti te hace falta un array entero de repuesto.

**Mergesort:** — ¿En promedio? ¿Y qué pasa con tus malos días? Cuando te dan un array ya ordenado y tu pivote es el primer elemento, te vas a O(n²) y lloras. Yo jamás. Siempre O(n log n), pase lo que pase.

**Quicksort:** — ¡Eso era antes! Ahora uso mediana de tres, o pivote aleatorio, o dos pivotes como el Dual-Pivot de Java. No me pillas en la mala.

**Mergesort:** — Vale, pero dime, ¿eres estable? Porque cuando ordeno alumnos por nota y luego por nombre, yo conservo el orden de los empates. Tú los mezclas como si barajaras cartas.

**Quicksort:** — Bueno... la estabilidad es para débiles. Y tu memoria O(n) no entra en un sistema embebido.

**Mergesort:** — Y tu O(n²) no entra en una base de datos. ¿Sabes lo que ordena discos enteros? Yo. Mergesort externo. Todo el día. Todos los días.

**Quicksort:** — *suspira* Vale. Cada uno es mejor donde su jefe le pone. Pero todos sabemos quién tiene más fama.

> La lección: **ninguno gana siempre**. Quicksort brilla con datos al azar y poca memoria; Mergesort con estabilidad y garantías. El profesional elige según el contexto, no según la marca.

---

## 🕵️ ¿Quién soy?

Adivina qué concepto de la unidad soy:

1. **Me llamo a mí misma con un problema más pequeño, hasta que llego a un caso que ya se resuelve solo.**
2. **Soy la variable que divide el array en menores y mayores, y mi elección decide si el algoritmo vuela o se arrastra.**
3. **Soy el paso en el que dos listas ordenadas se combinan en una sola, comparando el primero de cada una.**
4. **Soy la técnica que guarda los resultados ya calculados para no repetir trabajo.**

<details>
<summary>🔄 Respuestas</summary>

1. **La recursividad** — caso base + caso recursivo.
2. **El pivote** — corazón de la partición de Quicksort.
3. **La fusión (merge)** — el corazón de Mergesort.
4. **La memoización** — de O(2ⁿ) a O(n) en Fibonacci.

</details>

---

## 🧩 Completa el código

Este factorial recursivo tiene **3 huecos**. Rellénalos:

```java
public class FactorialHuecos {

    static int fact(int n) {
        if (_____) return 1;         // hueco 1: caso base
        return _____;                // hueco 2: caso recursivo
    }

    public static void main(String[] args) {
        System.out.println("fact(5) = " + _____);   // hueco 3: la llamada
    }
}
```

<details>
<summary>🔄 Solución</summary>

```java
public class FactorialHuecos {

    static int fact(int n) {
        if (n <= 1) return 1;         // hueco 1
        return n * fact(n - 1);       // hueco 2
    }

    public static void main(String[] args) {
        System.out.println("fact(5) = " + fact(5));   // hueco 3 → 120
    }
}
```

</details>

---

## 🤬 CONRAD VS EL MUNDO: "Tu recursión explotó"

> *CONRAD, nuestro compilador cascarrabias, opina sobre el clásico del novato.*

**CONRAD:** — ¡OTRA VEZ! Viene un alumno y me dice: *CONRAD, mi programa da StackOverflowError*. Y yo: vale, ¿has mirado tu caso base? *¿Caso qué?* ¡AY, MADRE MÍA! ¡Hemos estado tres unidades para que me digas "¿caso qué"!

*Y lo peor viene después. Me enseña el código y veo:* `return fibo(n - 1) + fibo(n - 2);` para `n = 50`. ¿PERO TÚ SABES LO QUE ES ESO? Eso no es un programa, es una declaración de intenciones suicidas. `fibo(50)` son miles de millones de llamadas. Mi stack tiembla solo de verlo.

*Y luego, el súmmum:* coge el array ya ordenado, elige el primer elemento como pivote, y me pregunta por qué Quicksort va tan lento. ¿Que por qué? ¡Porque has convertido O(n log n) en O(n²), campeón! ¡Elige el del medio, o mediana de tres, o tira un dado!

**La lección:** antes de llorar sobre el teclado, revisa los tres sospechosos habituales: **caso base**, **complejidad real** (¿estás duplicando trabajo?) y **elección del pivote**. El 90% de los dramas de esta unidad se arreglan solo con mirar esos tres.

---

## ⚡ Laboratorio de tortura: el programa que no ordena

> **Duración estimada:** 30 minutos
> **Herramienta:** tu IDE y un archivo nuevo

**El escenario:** este programa debería ordenar, pero tiene **3 errores** que lo rompen. Encuéntralos y haz que la salida sea `[1, 2, 3, 4, 5, 6, 7]`.

```java
public class TorturaOrdenacion {

    static void quicksort(int[] arr, int inicio, int fin) {
        if (inicio > fin) return;

        int pivote = arr[inicio];
        int i = inicio + 1;

        for (int j = inicio + 1; j <= fin; j++) {
            if (arr[j] < pivote) {
                int tmp = arr[i];
                arr[i] = arr[j];
                arr[j] = tmp;
                i++;
            }
        }

        quicksort(arr, inicio, i - 1);
        quicksort(arr, i, fin);
    }

    public static void main(String[] args) {
        int[] datos = {7, 3, 5, 1, 6, 2, 4};
        quicksort(datos, 0, datos.length - 1);
        System.out.println(java.util.Arrays.toString(datos));
    }
}
```

**Pistas para cuando te frustres (no antes):**

1. ¿El caso base usa `>` o `>=`? ¿Qué pasa con una zona de un solo elemento? *pista: `inicio == fin` tiene un solo elemento, ya ordenado.*
   <details><summary>¿Y si sigo atascado?</summary>El caso base debería ser `if (inicio >= fin) return;`.</details>
2. ¿Dónde debería ir el pivote al terminar la partición? *pista: él también es un elemento del array.*
   <details><summary>¿Y si sigo atascado?</summary>Falta intercambiar el pivote (en `arr[inicio]`) con `arr[i - 1]` antes de las llamadas recursivas.</details>
3. ¿Y las llamadas recursivas de la derecha, qué zona cubren? *pista: con el pivote en `i - 1`, la zona derecha empieza en `i`.*
   <details><summary>Solución final</summary>

```java
public class TorturaOrdenacion {

    static void quicksort(int[] arr, int inicio, int fin) {
        if (inicio >= fin) return;

        int pivote = arr[inicio];
        int i = inicio + 1;

        for (int j = inicio + 1; j <= fin; j++) {
            if (arr[j] < pivote) {
                int tmp = arr[i];
                arr[i] = arr[j];
                arr[j] = tmp;
                i++;
            }
        }

        // el pivote a su sitio: justo antes de la zona de mayores
        int tmp = arr[inicio];
        arr[inicio] = arr[i - 1];
        arr[i - 1] = tmp;

        quicksort(arr, inicio, i - 2);
        quicksort(arr, i, fin);
    }

    public static void main(String[] args) {
        int[] datos = {7, 3, 5, 1, 6, 2, 4};
        quicksort(datos, 0, datos.length - 1);
        System.out.println(java.util.Arrays.toString(datos));
    }
}
```

Salida correcta: `[1, 2, 3, 4, 5, 6, 7]`.

</details>

---

## 🏆 Logros de esta unidad

| Logro | Cómo conseguirlo |
|---|---|
| 🏅 **El Mago del Stack** | Explicar caso base, caso recursivo y pila de llamadas sin mirar |
| 🏅 **Recursionista** | Implementar factorial y palíndromo recursivos sin ayuda |
| 🏅 **Domador de Fibonacci** | Bajar `fibo(50)` de O(2ⁿ) a O(n) con memoización |
| 🏅 **El Rápido** | Implementar Quicksort desde cero sin mirar el código |
| 🏅 **El Fiable** | Implementar Mergesort desde cero, con su fusión, sin mirar |
| 🏅 **Ingeniero de Datos** | Elegir con criterio entre Quicksort, Mergesort y `Arrays.sort()` según el contexto |

---

## 🧠 Atrévete a pensar

1. **Sin ejecutar:** ¿qué imprime este programa?

```java
public class Misterio2 {
    static int misterio(int n) {
        if (n == 0) return 0;
        return n % 10 + misterio(n / 10);
    }

    public static void main(String[] args) {
        System.out.println(misterio(1234));
    }
}
```

2. **El iterativo que no se rinde:** escribe una versión **iterativa** (con bucle) de `fact(n)`. ¿Cuál prefieres y por qué?
3. **El detective del IDE:** tu Quicksort "funciona" con arrays pequeños pero desordena los grandes. ¿Qué técnica de depuración usas y en qué paso te fijas primero? *pista: los índices de la partición.*
4. **Verdadero o falso:** "Mergesort es mejor que Quicksort siempre porque no tiene caso malo."

<details>
<summary>💡 Soluciones</summary>

1. **`10`** — suma las cifras: 4 + 3 + 2 + 1 = 10. Es una suma de dígitos recursiva.
2. `int r = 1; for (int i = 2; i <= n; i++) r *= i; return r;`. El iterativo no gasta stack y suele ser más rápido, pero el recursivo expresa mejor la definición matemática. Para un examen, domina los dos.
3. El **depurador** con breakpoints en la partición. Observa cómo cambian `i` y `j` (o `i` y el pivote) y dónde se cruzan: los errores de off-by-one en los límites de la partición son el clásico.
4. **Falso.** Mergesort es más *fiable* (garantiza O(n log n)), pero gasta O(n) de memoria y no gana en velocidad práctica con arrays en memoria. "Mejor" depende del contexto: esa es toda la lección del punto 6.

</details>

---

## 🧩 Crucigrama de bits

```
Horizontal:
1. La condición que detiene la recursión (5,4)
3. Algoritmo estable del punto 5 (9)
5. Técnica que guarda resultados ya calculados (12)
6. La variable que divide el array en Quicksort (6)

Vertical:
2. Lo que lanza la JVM cuando el stack se llena (8,7)
4. Ordenar sin arrays auxiliares (7)
7. Repartir elementos alrededor del pivote (11)
```

<details>
<summary>📝 Soluciones</summary>

**Horizontal:** 1. CASO BASE · 3. MERGESORT · 5. MEMOIZACIÓN · 6. PIVOTE
**Vertical:** 2. STACKOVERFLOW · 4. IN-PLACE · 7. PARTICIONAR

</details>

---

## 💬 Preguntas de entrevista de trabajo

> Preguntas reales que te harían para programador Java junior.

1. **"Explícame, como si yo fuera tu abuela, qué es la recursividad y por qué a veces da StackOverflowError."**
2. **"¿Cuándo usarías Quicksort y cuándo Mergesort? Justifica."**
3. **"El factorial recursivo con `n = 100000` te revienta la pila. ¿Qué haces?"**
4. **"¿Qué es la memoización y qué problema resuelve?"**
5. **"Si `Arrays.sort()` ya ordena, ¿para qué aprender a implementar Quicksort?"**

---

## 🤷 No hay preguntas tontas

> ❓ **¿Puedo escribir recursividad con bucles y olvidarme de todo esto?**

Puedes, pero te perderás la elegancia en los problemas jerárquicos (árboles, juegos, laberintos) y la comprensión de cómo funcionan por dentro Quicksort, Mergesort y el backtracking. Además, casi cualquier entrevista técnica te preguntará por esto. No es obligatorio, pero duele no saberlo.

---

> ❓ **¿Por qué `fibo(92)` da el máximo que cabe en `long` y no puedo ir más allá?**

Porque `long` tiene un límite (9.223.372.036.854.775.807) y `fibo(93)` ya lo supera. Si necesitas números más grandes, tendrás que usar `BigInteger`, que puede crecer tanto como la memoria lo permita.

---

> ❓ **¿Mergesort es el que usa Java por defecto? Yo juraría que era Quicksort.**

Los dos, en función del tipo: **Dual-Pivot Quicksort** para primitivos y **TimSort** (una mezcla con Mergesort) para objetos. Java no es dogmático: usa el mejor para cada caso. Ese es el mismo criterio que te pedimos a ti en el punto 6.

---

## 🎬 Poscréditos

El programador novato termina su Quicksort, lo ejecuta y... funciona a la primera. Se frota los ojos. Su compañero Mergesort, ese maratoniano fiable, le sonríe desde el otro monitor.

**Novato:** — No me lo creo. ¡He escrito un Quicksort sin mirar!

**CONRAD:** — *aparece con cara de pocos amigos* Bonito. Ahora dime: ¿cuándo usarías Mergesort en su lugar?

**Novato:** — Cuando necesite estabilidad... o cuando el array llegue casi ordenado y me dé miedo el pivote.

**CONRAD:** — *asiente, casi emocionado* Mira por dónde. Ya no solo escribes algoritmos: piensas en ellos. Eso se llama ser ingeniero. *pausa* Pero no te relajes, que la próxima unidad te espera con objetos, clases y algún que otro constructor que te hará llorar.

**Novato:** — ¿Llorar? Yo ya domino la recursividad.

**CONRAD:** — *ríe malvado* Eso decía el otro antes de encontrarse con `this`.

El novato guarda su proyecto, y siente que algo ha cambiado en su forma de pensar. La recursividad ya no le da miedo: la entiende. Y la entiende porque, para entender la recursividad, primero entendió la recursividad.

**PRÓXIMAMENTE EN U06:** POO: Clases y Objetos. El momento en el que tus programas dejan de ser funciones sueltas y se convierten en **ciudadanos con atributos y métodos**. 🏗️

---

📚 [Volver al índice de la unidad](/ApuntesProgramacion/05-algoritmica-tecnicas) · **Anterior:** [08 · Otras técnicas algorítmicas](/ApuntesProgramacion/05-algoritmica-tecnicas/08-otras-tecnicas-algoritmicas) · **Siguiente:** **[U06 · POO: Clases y Objetos](/ApuntesProgramacion/06-poo-clases-objetos)**