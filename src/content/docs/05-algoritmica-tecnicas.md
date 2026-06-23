---
title: "⚙️ Unidad 5: Algorítmica II — Técnicas Avanzadas"
---

Bienvenido, valiente explorador del stack de llamadas. Hasta ahora has sobrevivido a arrays, bucles, objetos y condiciones. Has dominado el arte de hacer que el ordenador haga lo que le dices. Pero el bosque se oscurece. Llegó la hora de enfrentarte a los algoritmos que **cambian tu forma de pensar** (y de paso, te hacen quedar genial en las entrevistas técnicas de Google, que nunca se sabe).

En esta unidad vamos a dejar atrás los bucles obvios y nos adentramos en la **recursividad** y **divide y vencerás**. No tengas miedo. Respira hondo. Y recuerda: para entender la recursividad, primero tienes que entender la recursividad.

Vamos allá.

---

## 1. Recursividad: una función que se llama a sí misma (sin volverse loca)

La recursividad es cuando una función se invoca a sí misma. Sí, suena a bucle infinito y a dolor de cabeza. Pero con una **condición de parada** bien puesta, es una de las herramientas más elegantes y potentes que existen en programación.

Piénsalo así: en lugar de resolver el problema entero de golpe, resuelves una pequeña parte y le pasas el resto a... ti mismo. Como cuando limpias tu habitación: coges una cosa del suelo y luego vuelves a llamar a la misma función "limpiarHabitacion" con lo que queda. Eventualmente no queda nada, y has terminado.

### Las dos caras de la moneda recursiva

> [!NOTE]
> Toda función recursiva necesita **dos partes** imprescindibles. Si te falta una, estás muerto:
> - **Caso base**: la condición que detiene la recursión. Sin esto, tu programa se ejecuta hasta que la JVM se cansa y te lanza un `StackOverflowError`.
> - **Caso recursivo**: la llamada a sí misma, normalmente con una versión más pequeña del mismo problema.

La estructura general es siempre la misma:

```java
public static tipo funcion(parametros) {
    if (/* condicion de parada */) {
        return /* valor base */;
    } else {
        // hacer algo
        return funcion(/* version mas pequena */);
    }
}
```

### La pila de llamadas (call stack) — el origen de toda la diversión

Cada vez que una función se llama, Java reserva un trocito de memoria en el **stack** (la pila). Ese trocito se llama **stack frame** y guarda: los parámetros de la función, las variables locales, y la dirección de vuelta para cuando la función termine.

Si llamas a una función 5 veces, tienes 5 frames en el stack. Si la llamas 10.000 veces... bum. `StackOverflowError`.

```java
public class StackExplorer {

    static int prof = 0;

    static void recursivo() {
        prof++;
        System.out.println("Llamada numero: " + prof);
        recursivo(); // ¡no hay caso base!
    }

    public static void main(String[] args) {
        try {
            recursivo();
        } catch (StackOverflowError e) {
            System.out.println("Stack explotó en la llamada: " + prof);
        }
    }
}
```

Pruébalo. Verás que el número varía según tu máquina y la JVM. Normalmente entre 10.000 y 20.000 llamadas. No es infinito. Nada lo es.

> [!WARNING]
> Sin caso base, no hay piedad. El stack tiene un límite y Java no te va a salvar. Cada frame ocupa espacio, y cuando el vaso se desborda, la JVM dice "hasta aquí llegamos".

### Recursividad vs iteración: el duelo

| Aspecto | Recursividad | Iteración (bucles) |
|---|---|---|
| Legibilidad | Muy elegante para problemas jerárquicos | Más verbosa pero clara |
| Memoria | Gasta stack (cada llamada = frame nuevo) | Solo variables locales |
| Velocidad | Más lenta (overhead de llamadas) | Más rápida |
| Stack overflow | Riesgo real si profundidad es alta | No aplica |
| Casos ideales | Árboles, grafos, backtracking, divide y vencerás | Recorridos lineales, procesamiento simple |

La regla de oro: **usa recursividad cuando el problema sea inherentemente recursivo** (árboles, expresiones anidadas, algoritmos de ordenación avanzados). Para lo demás, un `for` de toda la vida.

---

## 2. Ejemplos clásicos (los clásicos por algo son)

Vamos a ver tres ejemplos que te perseguirán el resto de tu carrera. Acostúmbrate a ellos. Aparecen en exámenes, entrevistas, y conversaciones de ascensor con otros programadores.

### 2.1. Factorial — el "Hello World" de la recursividad

```java
public class Factorial {

    static int fact(int n) {
        if (n <= 1) return 1;          // caso base
        return n * fact(n - 1);        // caso recursivo
    }

    public static void main(String[] args) {
        System.out.println("fact(5) = " + fact(5));   // 120
        System.out.println("fact(0) = " + fact(0));   // 1
        System.out.println("fact(7) = " + fact(7));   // 5040
    }
}
```

¿Qué pasa cuando llamamos a `fact(4)`? Vamos paso a paso:

```
fact(4) → 4 * fact(3)
       → 4 * (3 * fact(2))
       → 4 * (3 * (2 * fact(1)))
       → 4 * (3 * (2 * 1))
       → 4 * (3 * 2)
       → 4 * 6
       → 24
```

Primero "baja" hasta el caso base, luego "sube" haciendo las multiplicaciones. Como un ascensor que baja al sótano y vuelve a subiteando puertas.

### 2.2. Fibonacci (versión ingenua — no hagas esto en casa)

```java
public class FiboNaive {

    static long fibo(int n) {
        if (n <= 1) return n;
        return fibo(n - 1) + fibo(n - 2);
    }

    public static void main(String[] args) {
        long inicio = System.currentTimeMillis();
        System.out.println("fibo(40) = " + fibo(40));
        long fin = System.currentTimeMillis();
        System.out.println("Tiempo: " + (fin - inicio) + " ms");
    }
}
```

Ejecuta esto. Serán unos segundos de infierno. ¿El problema? `fibo(40)` genera un **árbol de llamadas monstruoso**. Cada llamada se bifurca en dos, que se bifurcan en dos, etc. El número total de llamadas es aproximadamente O(2ⁿ).

```
                         fibo(5)
                        /       \
                  fibo(4)       fibo(3)
                 /       \      /     \
           fibo(3)    fibo(2) fibo(2) fibo(1)
           /    \      /   \   /   \
      fibo(2) fibo(1) ...  ... ...  ...
      /    \
 fibo(1) fibo(0)
```

Cuenta las veces que se llama a `fib(1)`. Exacto, demasiadas. Es como preguntarle a tu compañero una y otra vez la misma pregunta esperando una respuesta diferente. Eso, señor mío, es locura.

> [!TIP]
> Este es el ejemplo perfecto para entender por qué **la eficiencia importa**. Un algoritmo que se ve bonito en código puede ser un desastre en tiempo de ejecución. Fibonacci naive es el rey de los algoritmos bonitos pero inútiles para números grandes.

### 2.3. Fibonacci optimizado (con memoización — ahora sí)

```java
public class FiboOptimizado {

    static long[] memo;

    static long fibo(int n) {
        if (n <= 1) return n;
        if (memo[n] != 0) return memo[n];      // ya lo calculamos antes
        memo[n] = fibo(n - 1) + fibo(n - 2);
        return memo[n];
    }

    public static void main(String[] args) {
        int n = 92;
        memo = new long[n + 1];
        long inicio = System.currentTimeMillis();
        System.out.println("fibo(" + n + ") = " + fibo(n)); // instantáneo
        long fin = System.currentTimeMillis();
        System.out.println("Tiempo: " + (fin - inicio) + " ms");
    }
}
```

¿Qué cambia? Guardamos los resultados en un array (`memo[]`) para no recalcular. Si ya hemos calculado `fib(10)`, lo devolvemos directamente. Cada fibonacci se calcula **una sola vez**.

La mejora es brutal: de **O(2ⁿ) a O(n)**. Esa es la mayor subida de nivel desde que pasaste de piedra a pokéball.

> [!NOTE]
> Esto se llama **memoización** (sí, sin la "r"). Es la base de la programación dinámica, que verás en unidades más avanzadas. Consiste en: "si ya lo calculé, no lo vuelvo a calcular, lo guardo en un mapa o array y lo reutilizo".

### 2.4. Suma de un array

```java
public class SumArray {

    static int sumar(int[] arr, int i) {
        if (i == arr.length) return 0;              // caso base: no hay más elementos
        return arr[i] + sumar(arr, i + 1);           // caso recursivo
    }

    public static void main(String[] args) {
        int[] nums = {3, 8, 2, 10, 5};
        System.out.println("Suma: " + sumar(nums, 0)); // 28

        int[] vacio = {};
        System.out.println("Suma vacia: " + sumar(vacio, 0)); // 0
    }
}
```

Este ejemplo es casi idéntico al factorial, pero recorriendo un array. El índice `i` avanza hasta llegar a `arr.length`. En ese momento, devolvemos 0 y empezamos a sumar hacia arriba.

> [!TIP]
| Piensa en la recursividad como si pelaras una cebolla. Quitas una capa (un elemento), y lo que queda es el mismo problema pero más pequeño. Eventualmente no queda cebolla.

---

## 3. Divide y vencerás (Divide & Conquer)

La estrategia es tan antigua como Julio César, pero aplicada a algoritmos sigue siendo igual de efectiva. El principio es sencillo:

1. **Dividir** el problema en subproblemas más pequeños y manejables.
2. **Conquistar** cada subproblema recursivamente (llamadas recursivas).
3. **Combinar** las soluciones de los subproblemas para obtener la solución del problema original.

```
Input grande
     │
     ├──Dividir──→ Subproblema A    → Conquistar (recursivo) → Combinar ──→ Output
     └──Dividir──→ Subproblema B    → Conquistar (recursivo) ──┘
```

Los dos reyes indiscutibles de esta técnica son los algoritmos de ordenación más famosos del mundo: **Quicksort** y **Mergesort**. Merecen sección propia. Y corbata.

---

## 4. Quicksort — el rápido (cuando le sale bien)

Creado por Tony Hoare en 1959. Sí, tiene más años que tus padres. Y sigue siendo el algoritmo de ordenación más usado del mundo. Por algo será.

### Cómo funciona

1. Elegimos un **pivote** (un elemento del array).
2. Colocamos todos los elementos **menores** que el pivote a su izquierda, y los **mayores** a su derecha. Esto se llama **particionar**.
3. Aplicamos el mismo proceso recursivamente a las dos mitades (izquierda y derecha del pivote).

Cuando el array tiene 0 o 1 elementos... ya está ordenado. Caso base.

### Implementación

```java
public class Quicksort {

    static void qs(int[] arr, int izq, int der) {
        if (izq >= der) return;   // caso base: 0 o 1 elementos

        int pivote = arr[(izq + der) / 2];  // elegimos el del medio
        int i = izq, j = der;

        // partición
        while (i <= j) {
            while (arr[i] < pivote) i++;
            while (arr[j] > pivote) j--;
            if (i <= j) {
                int tmp = arr[i];
                arr[i] = arr[j];
                arr[j] = tmp;
                i++;
                j--;
            }
        }

        // llamadas recursivas a cada mitad
        qs(arr, izq, j);
        qs(arr, i, der);
    }

    public static void main(String[] args) {
        int[] datos = {9, 3, 7, 1, 8, 2, 6, 4, 5};
        qs(datos, 0, datos.length - 1);
        System.out.println(java.util.Arrays.toString(datos));
    }
}
```

**Ejecución paso a paso** con `{3, 1, 4, 1, 5, 9, 2, 6}`:

```
Array inicial:  [3, 1, 4, 1, 5, 9, 2, 6]
Pivote = 5 (posición media)
Posiciones i=0, j=7

1. i avanza hasta encontrar 9 (≥5), j retrocede hasta encontrar 2 (≤5)
2. Intercambiamos 9 y 2 → [3, 1, 4, 1, 5, 2, 9, 6]
3. i=5, j=4 → i > j, terminamos partición
4. Llamada recursiva izquierda: [3, 1, 4, 1, 5, 2]
5. Llamada recursiva derecha: [9, 6]
...
```

> [!TIP]
> El secreto de Quicksort está en la partición. Si consigues que los elementos se repartan más o menos equilibradamente, el algoritmo vuela. Si no... prepara los O(n²).

### Elección del pivote

| Estrategia | Ventaja | Desventaja |
|---|---|---|
| Primer elemento | Simple | Pesimo si array ya ordenado |
| Último elemento | Simple | Pesimo si array ya ordenado |
| Elemento central | Mejor equilibrio | Sigue teniendo casos malos |
| Mediana de tres (primero, medio, último) | Muy robusto | Un poco más de cálculo |
| Aleatorio | Evita el caso peor en la práctica | Aleatoriedad no determinista |

### Complejidad

- **Caso promedio**: O(n log n) — casi siempre.
- **Mejor caso**: O(n log n) — cuando el pivote divide siempre en mitades iguales.
- **Peor caso**: O(n²) — cuando el array ya está ordenado y eliges el primer o último pivote.

> [!WARNING]
> Si eliges siempre el primer elemento como pivote y el array ya está ordenado, Quicksort se vuelve más lento que una tortuga con resaca. O(n²). Literalmente peor que un `for` anidado cutre.

### ¿Es estable?

**No**. Durante la partición, dos elementos iguales pueden intercambiarse de posición. Si necesitas estabilidad (orden original de elementos iguales), mejor usa Mergesort.

---

## 5. Mergesort — el fiable (siempre cumple lo que promete)

Creado por John von Neumann en 1945. Sí, el mismo de la arquitectura de ordenadores. El tío no paraba.

### Cómo funciona

1. **Dividir** el array en dos mitades (por la mitad exactamente, no hay que elegir pivote).
2. **Ordenar** cada mitad recursivamente.
3. **Fusionar** (merge) las dos mitades ordenadas en un único array ordenado.

```
[7, 3, 9, 1, 8, 2, 6, 4]
         │
    ┌────┴────┐
 [7, 3, 9, 1] [8, 2, 6, 4]
    │            │
 ┌──┴──┐      ┌──┴──┐
[7, 3] [9, 1] [8, 2] [6, 4]
  │      │      │      │
┌─┴─┐  ┌─┴─┐  ┌─┴─┐  ┌─┴─┐
[7] [3] [9] [1] [8] [2] [6] [4]   ← caso base
  │      │      │      │
└─┬─┘  └─┬─┘  └─┬─┘  └─┬─┘
[3, 7] [1, 9] [2, 8] [4, 6]       ← fusionar
    │            │
 ┌──┴──┐      ┌──┴──┐
[1, 3, 7, 9] [2, 4, 6, 8]          ← fusionar
    │            │
 ┌──┴────────────┘
[1, 2, 3, 4, 6, 7, 8, 9]          ← fusionar
```

### Implementación

```java
public class Mergesort {

    static void ms(int[] arr, int izq, int der) {
        if (izq >= der) return;  // caso base

        int mid = (izq + der) / 2;
        ms(arr, izq, mid);                   // ordenar mitad izquierda
        ms(arr, mid + 1, der);               // ordenar mitad derecha
        fusionar(arr, izq, mid, der);         // combinar las dos mitades
    }

    static void fusionar(int[] arr, int izq, int mid, int der) {
        int[] tmp = new int[der - izq + 1];
        int i = izq, j = mid + 1, k = 0;

        // Comparar elementos de las dos mitades
        while (i <= mid && j <= der)
            tmp[k++] = (arr[i] <= arr[j]) ? arr[i++] : arr[j++];

        // Copiar lo que quede de la mitad izquierda
        while (i <= mid) tmp[k++] = arr[i++];

        // Copiar lo que quede de la mitad derecha
        while (j <= der) tmp[k++] = arr[j++];

        // Copiar el array temporal al original
        System.arraycopy(tmp, 0, arr, izq, tmp.length);
    }

    public static void main(String[] args) {
        int[] datos = {9, 3, 7, 1, 8, 2, 6, 4, 5};
        ms(datos, 0, datos.length - 1);
        System.out.println(java.util.Arrays.toString(datos));
    }
}
```

### Complejidad

- **Siempre**: O(n log n). No importa cómo esté el array. Mergesort no tiene caso malo.
- **Memoria**: O(n) extra por el array temporal `tmp`. Ese es su punto débil.

### ¿Es estable?

**Sí**. Cuando dos elementos son iguales, el de la izquierda va primero en la fusión. Esto mantiene el orden original de elementos iguales, algo que Quicksort no puede garantizar.

> [!NOTE]
| Estabilidad no es un concepto teórico aburrido. Es importante cuando ordenas por múltiples criterios. Por ejemplo, si ordenas una lista de alumnos por nota y luego por nombre, quieres que los que tienen la misma nota mantengan el orden alfabético. Mergesort te lo da. Quicksort te hace llorar.

---

## 6. Comparación: ¿cuándo uso cada uno?

No hay un "mejor algoritmo" universal. Todo depende del contexto. Aquí tienes una guía práctica para tomar decisiones:

| Situación | Elige |
|---|---|
| Array pequeño (< 50 elementos) | Da igual, usa `Arrays.sort()` |
| Array grande con datos al azar | **Quicksort** (irá genial en promedio) |
| Array grande, casi ordenado o con muchos duplicados | **Mergesort** o Quicksort con mediana de tres |
| Necesitas estabilidad (orden relativo) | **Mergesort** |
| La memoria es justa (sistema embebido, móvil) | **Quicksort** (O(log n) vs O(n)) |
| No te pagan por pensar | `Arrays.sort()` y a seguir con tu vida |
| El array es enorme y los datos están en disco | Mergesort externo (se usa en bases de datos) |

En Java, `Arrays.sort()` para tipos primitivos usa **Dual-Pivot Quicksort** (una versión mejorada con dos pivotes). Para objetos usa **TimSort** (una mezcla de Mergesort e Insertion Sort). Por algo Will Smith no canta sobre algoritmos de ordenación.

### Rendimiento en la práctica

| Algoritmo | n=10 | n=100 | n=1.000 | n=10.000 | n=100.000 | n=1.000.000 |
|---|---|---|---|---|---|---|
| Quicksort | ~0 ms | ~0 ms | ~0 ms | ~1 ms | ~15 ms | ~120 ms |
| Mergesort | ~0 ms | ~0 ms | ~0 ms | ~2 ms | ~20 ms | ~150 ms |
| Burbuja (para llorar) | ~0 ms | ~1 ms | ~100 ms | ~10.000 ms | no esperes |

> [!WARNING]
| Nunca, bajo ningún concepto, uses Burbuja (Bubble Sort) en producción. Es O(n²), lento, y tus compañeros te odiarán. Es como usar un caracol para repartir pizzas. Existe, pero no debería.

---

## 7. ⭐ BE THE CODE, MY FRIEND: implementa Quicksort desde cero

> 🕶️ **Don Tip:** Divide y vencerás: elige un pivote, parte el array en menores y mayores, y repite recursivamente. Si dominas ese patrón, Quicksort es tuyo.

Cierra esta página. Abre un editor de texto en blanco. No mires ni una línea de lo que has leído hasta ahora.

Escribe Quicksort desde cero. La firma del método debe ser:

```java
static void quicksort(int[] arr, int inicio, int fin)
```

Cuando termines, pégale un vistazo a tu código y compáralo con el de esta unidad.

**Niveles de logro:**

- ⭐ Lo tienes, pero has tenido que mirar el código una vez. Aprobado raspado.
- ⭐⭐ Te ha salido a la primera y funciona. Eres una máquina.
- ⭐⭐⭐ Te ha salido a la primera, sin errores de off-by-one, y además has elegido mediana de tres como pivote. No necesitas este curso. Vete a dar una charla TED.

> [!TIP]
> Pista mental gratuita: necesitas tres cosas — elegir un pivote, partir el array en dos zonas (menores y mayores), y llamar recursivamente a cada lado. Si memorizas ese patrón, Quicksort es tuyo para siempre.

---

## 8. ¡No Hay Preguntas Tontas!

### ¿La recursividad es más lenta que un bucle?

Casi siempre, sí. Cada llamada recursiva añade overhead: crear un stack frame, guardar variables, calcular dirección de retorno, etc. Para operaciones simples como sumar un array, un `for` siempre gana. **Pero** hay problemas que se expresan de forma mucho más natural con recursividad: árboles, expresión de paréntesis anidados, recorrido de laberintos, backtracking. La regla es: usa bucles para lo simple, recursividad para lo complejo.

### ¿Qué es exactamente un StackOverflowError?

El **call stack** es una región de memoria donde la JVM guarda información de cada llamada a función. Cada llamada ocupa un espacio (stack frame) que contiene: parámetros, variables locales, y la dirección de retorno.

Cuando haces demasiadas llamadas recursivas (o una recursión infinita), el stack se llena. La siguiente llamada ya no cabe. La JVM dice "no puedo más" y te lanza un `StackOverflowError`.

Es como llenar un vaso de agua: cada gota es una llamada. Llega un punto en que una gota más lo desborda todo.

```
Stack memoria:
┌──────────────────────┐
│ main()               │  ← frame 1
├──────────────────────┤
│ recursivo() n=1      │  ← frame 2
├──────────────────────┤
│ recursivo() n=2      │  ← frame 3
├──────────────────────┤
│ ...                  │  ← ...
├──────────────────────┤
│ recursivo() n=10000  │  ← ¡BUM! Stack Overflow
└──────────────────────┘
```

### ¿Qué es tail recursion? ¿Java la optimiza?

**Tail recursion** (recursión de cola) es cuando la llamada recursiva es la **última operación** que realiza la función. No hay ninguna operación pendiente después de la llamada.

```java
// Sin tail recursion — hay una multiplicación pendiente
static int factNormal(int n) {
    if (n <= 1) return 1;
    return n * factNormal(n - 1);  // la multiplicación espera a que vuelva
}

// Con tail recursion — la llamada es lo último
static int factTail(int n, int acum) {
    if (n <= 1) return acum;
    return factTail(n - 1, n * acum);  // nada pendiente después
}
```

En lenguajes funcionales como Scala, Haskell o Scheme, el compilador detecta tail recursion y la convierte en un bucle internamente (no gasta stack). **Java no hace esto**. Ni ahora ni en el futuro previsible. Si llamas a `factTail(10000, 1)` en Java, explota igual.

> [!NOTE]
> Aunque Java no optimice tail recursion, escribir funciones con tail recursion es un buen hábito: clarifica tu intención, es más fácil de leer, y si algún día usas un lenguaje que sí lo haga, ya lo dominas.

### ¿Puedo usar recursividad sin saberlo?

Sí, constantemente. Cada vez que llamas a `Arrays.sort()`, estás usando Quicksort o Mergesort recursivo por debajo. Cuando recorres un sistema de archivos con `File.listFiles()`, la JVM puede usar recursividad internamente. La recursividad no es una característica exótica: es el pan de cada día de la computación.

### ¿Y si mi recursividad explota el stack? ¿Qué hago?

Tienes varias opciones:
1. **Aumentar el tamaño del stack** de la JVM: `java -Xss2m MiPrograma` (a 2 MB).
2. **Convertir a iterativo** (usa una pila explícita con un `Stack<T>` o `Deque<T>`).
3. **Usar una técnica diferente** que no requiera tanta profundidad.
4. **Aceptar la derrota** y buscar otro trabajo. (No, es broma. Haz la opción 1 o 2).

### ¿Divide y vencerás solo sirve para ordenar arrays?

Para nada. Es uno de los paradigmas más universales de la computación. Aquí tienes aplicaciones famosas:

- **Búsqueda binaria**: parte un array ordenado por la mitad y busca en el lado correcto. O(log n).
- **Multiplicación de matrices (Strassen)**: divide matrices grandes en submatrices. O(n²·⁸⁰⁷) en lugar de O(n³).
- **Transformada Rápida de Fourier (FFT)**: divide señales digitales en frecuencias. Base del JPEG, MP3, WiFi.
- **Convex Hull**: encuentra el polígono convexo mínimo que contiene un conjunto de puntos.
- **Algoritmo de Karatsuba**: multiplica números grandes más rápido que el método tradicional.

Una vez entiendes Divide y Vencerás, empiezas a ver patrones por todas partes. Es como cuando aprendes una palabra nueva y de repente la ves en todas partes.

### 🔮 EL ACERTIJO

Estás en un laberinto con 3 interruptores. Cada uno controla una bombilla en una habitación cerrada. Solo puedes entrar a la habitación UNA vez. ¿Cómo averiguas qué interruptor enciende qué bombilla?

Pista: las bombillas no solo se encienden, también se calientan.

> 🕶️ **Don Tip:** Si una bombilla ha estado encendida mucho tiempo, estará caliente aunque la apagues. Úsalo a tu favor.

---

## Resumen de la unidad

| Concepto | Clave |
|---|---|
| Recursividad | Caso base + caso recursivo. Sin caso base = StackOverflowError |
| Factorial | O(n). El ejemplo canónico de recursividad lineal |
| Fibonacci naive | O(2ⁿ). No lo uses para nada serio |
| Fibonacci optimizado | O(n) con memoización. La diferencia entre lento y rápido |
| Divide y vencerás | Dividir, conquistar, combinar. Paradigma universal |
| Quicksort | O(n log n) promedio, O(n²) peor, inestable. El más rápido en la práctica |
| Mergesort | O(n log n) siempre, estable, O(n) memoria extra. El más fiable |
| Partición | El corazón de Quicksort. Cómo repartir elementos alrededor del pivote |
| Fusión | El corazón de Mergesort. Cómo combinar dos arrays ordenados |
| Estabilidad | Mergesort la mantiene, Quicksort no. Importante para ordenaciones multi-criterio |
| Tail recursion | Cuando la llamada recursiva es lo último. Java no la optimiza |
| Stack overflow | El límite del call stack. Cada llamada cuesta memoria |

> [!NOTE]
> Esta unidad cubre los RA2 (uso de estructuras de control avanzadas incluyendo recursividad) y RA6 (aplicación de algoritmos de ordenación, análisis de complejidad y elección justificada del algoritmo según el contexto). Efectivamente, la programación no es solo escribir código que funcione: es pensar en **cómo** hacerlo eficiente, elegir la herramienta adecuada, y entender qué pasa bajo el capó.

En la siguiente unidad exploraremos **estructuras de datos avanzadas**: árboles, grafos y tablas hash. Prepárate para dibujar flechas y cuadraditos. Muchos cuadraditos.

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
