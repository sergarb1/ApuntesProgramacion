---
title: "🧠 Unidad 4: Algorítmica I — Fundamentos"
nav_order: 4
---
🎯 **Objetivos de aprendizaje**
- Entender qué es un algoritmo y cómo diseñarlo
- Implementar búsqueda lineal y binaria en Java
- Implementar ordenación burbuja e inserción
- Analizar la complejidad algorítmica con notación Big O
- Elegir el algoritmo adecuado según el contexto

## ¿Qué es un Algoritmo? (El Arte de Dar Instrucciones Precisas)

Un **algoritmo** es una secuencia de pasos finita, ordenada y sin ambigüedades que resuelve un problema. Básicamente, es una receta de cocina, pero para tu ordenador.

Cuando cocinas una tortilla de patatas, sigues un algoritmo mental:
1. Pelar las patatas
2. Cortarlas en rodajas finas
3. Freírlas en aceite abundante
4. Batir los huevos
5. Mezclar todo y cuajar

Si un paso es ambiguo ("echa sal al gusto"), cada persona lo interpreta diferente. Un algoritmo de verdad no deja espacio a la interpretación: cada paso debe ser **preciso** y **determinista**.

> **📝 Nota:**
>
> La palabra "algoritmo" viene del matemático persa **Al-Juarismi** (siglo IX). Escribió un libro sobre cómo hacer cálculos con números indios. Siglos después, los informáticos le robamos la palabra.

### Algoritmos en Programación

En informática, los algoritmos más clásicos se dividen en dos grandes familias:

- **Búsqueda**: encontrar un elemento dentro de un conjunto de datos.
- **Ordenación**: poner un conjunto de datos en un orden determinado (numérico, alfabético, etc.).

Y de eso va esta unidad: de buscar y ordenar como un profesional.

```java
// El algoritmo más simple que existe: sumar dos números
public class AlgoritmoSimple {
    public static void main(String[] args) {
        int a = 5;
        int b = 3;
        int resultado = a + b;  // Esto ES un algoritmo: pasos precisos que producen un resultado
        System.out.println("5 + 3 = " + resultado);
    }
}
```

> **⚠️ Advertencia:**
>
> No todo código es un algoritmo. Un algoritmo es la *idea*. El código es su *materialización*. Puedes implementar el mismo algoritmo en Java, Python o ensamblador. La esencia es la misma.

### Propiedades de un Algoritmo

Para que un algoritmo sea considerado como tal, debe cumplir:

1. **Finito**: debe terminar en algún momento. Si se ejecuta para siempre, no es un algoritmo, es una pesadilla.
2. **Preciso**: cada paso debe estar definido sin ambigüedad.
3. **Entrada**: debe recibir cero o más valores de entrada.
4. **Salida**: debe producir al menos un valor de salida.
5. **Eficaz**: debe resolver el problema en tiempo finito.

## Búsqueda Lineal: El Buscador de Zapatos Perdidos

Imagina que pierdes una zapatilla en tu habitación. ¿Qué haces? Miras debajo de la cama, detrás de la puerta, en el armario... básicamente **revisas cada sitio hasta encontrarla**.

Pues eso es la **búsqueda lineal**: recorres un array elemento por elemento hasta encontrar lo que buscas. Es simple, directa, y funciona incluso si los datos están desordenados.

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

### Análisis: ¿Cómo de rápido es?

En el **mejor caso**, el elemento está en la primera posición → encuentras en 1 paso.

En el **peor caso**, el elemento está al final o no existe → recorres los `n` elementos enteros.

Decimos que su **complejidad es O(n)** — lineal. Si el array tiene 10 elementos, tardas ~10 pasos; si tiene 10.000, tardas ~10.000 pasos. Crece al mismo ritmo que los datos.

> **💡 Consejo:**
>
> La búsqueda lineal es como buscar en tu nevera: si es pequeña, da igual el método. Pero si tienes un almacén de 10.000 items, necesitas algo mejor.

## Búsqueda Binaria: El Buscador Jedi

La **búsqueda binaria** es como buscar una palabra en el diccionario. No abres por la página 1 y pasas de una en una. Abres por la mitad, ves si la palabra está antes o después, y descartas media tonelada de papel en cada intento.

**Requisito imprescindible: el array debe estar ordenado.** Si no, este método no funciona.

```java
public class BusquedaBinaria {

    public static int buscar(int[] array, int objetivo) {
        int izquierda = 0;
        int derecha = array.length - 1;

        while (izquierda <= derecha) {
            int medio = izquierda + (derecha - izquierda) / 2;  // Mitad del segmento

            if (array[medio] == objetivo) {
                return medio;  // ¡Bingo!
            }

            if (array[medio] < objetivo) {
                izquierda = medio + 1;  // Descartamos la mitad izquierda
            } else {
                derecha = medio - 1;    // Descartamos la mitad derecha
            }
        }
        return -1;  // No encontrado
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

### ¿Por qué `izquierda + (derecha - izquierda) / 2` en lugar de `(izquierda + derecha) / 2`?

Porque si el array es muy grande (cerca de `Integer.MAX_VALUE` elementos), `izquierda + derecha` puede desbordarse. La fórmula alternativa evita ese problema. Es un clásico bug que apareció incluso en la biblioteca de Java original.

> **⚠️ Advertencia:**
>
> Si ejecutas búsqueda binaria sobre un array **no ordenado**, los resultados son basura. No hay error de compilación, no hay excepción. Simplemente obtienes la respuesta equivocada. Como buscar "merienda" en un diccionario que tiene las palabras al azar.

### Análisis: O(log n)

En cada paso, la búsqueda binaria **descarta la mitad** del array restante.

- Array de 16 elementos → 4 pasos máximos
- Array de 32 elementos → 5 pasos
- Array de 1024 elementos → 10 pasos
- Array de 1.000.000 elementos → 20 pasos

Eso es **O(log n)**, o complejidad logarítmica. Crece muy despacio incluso con datos enormes. Es la diferencia entre preguntar a 1000 personas una por una vs. preguntar "¿está a la izquierda o a la derecha?" y descartar a 500 de golpe.

```java
public class DemoComplejidad {
    public static void main(String[] args) {
        // Simulación visual de pasos necesarios
        System.out.println("n\tLineal\tBinaria");
        System.out.println("--------------------");
        for (int n = 10; n <= 1000000; n *= 10) {
            int pasosLineal = n;
            int pasosBinaria = (int)(Math.log(n) / Math.log(2));
            System.out.println(n + "\t" + pasosLineal + "\t\t" + pasosBinaria);
        }
    }
}
```

Salida esperada:
```
n	Lineal	Binaria
--------------------
10		10		4
100		100		7
1000		1000		10
10000		10000		14
100000	100000		17
1000000	1000000	20
```

Con un millón de elementos, la búsqueda lineal necesita un millón de pasos. La binaria solo **20**. Lee eso otra vez. **20.**

> **📝 Nota:**
>
> `log₂(n)` en informática se asume siempre en base 2. No confundas con el logaritmo decimal de toda la vida. Cuando un informático dice "log n", piensa en "mitad, mitad, mitad...".

## Ordenación Burbuja: Simple pero Torpe

La **ordenación burbuja** (bubble sort) es el algoritmo de ordenación más sencillo de entender... y el más lento de los que merecen la pena. Funciona así:

> Ve recorriendo el array. Si el elemento actual es mayor que el siguiente, intercámbialos. Repite hasta que no haya intercambios.

Los elementos grandes "suben como burbujas" hacia el final del array. De ahí el nombre.

```java
public class Burbuja {

    public static void ordenar(int[] array) {
        int n = array.length;
        boolean huboIntercambio;

        for (int i = 0; i < n - 1; i++) {
            huboIntercambio = false;

            for (int j = 0; j < n - 1 - i; j++) {
                if (array[j] > array[j + 1]) {
                    // Intercambio
                    int temp = array[j];
                    array[j] = array[j + 1];
                    array[j + 1] = temp;
                    huboIntercambio = true;
                }
            }

            // Si no hubo intercambio, el array ya está ordenado
            if (!huboIntercambio) break;
        }
    }

    public static void main(String[] args) {
        int[] datos = {64, 34, 25, 12, 22, 11, 90};

        System.out.print("Antes: ");
        for (int n : datos) System.out.print(n + " ");

        ordenar(datos);

        System.out.print("\nDespués: ");
        for (int n : datos) System.out.print(n + " ");
        // 11 12 22 25 34 64 90
    }
}
```

### ¿Por qué es tan lento?

Dos bucles anidados. Para un array de `n` elementos:

- Primer bucle: `n` veces
- Segundo bucle: ~`n` veces (en realidad `n-i-1`, pero a grandes rasgos `n`)

**Total: ~n × n = n² operaciones.** Complejidad **O(n²)**.

Para 10 elementos → 100 operaciones (bien).
Para 1000 elementos → 1.000.000 de operaciones (empieza a doler).
Para 1.000.000 elementos → 1.000.000.000.000 operaciones (tu ordenador pide la jubilación).

> **💡 Consejo:**
>
> Burbuja solo se usa en dos situaciones: (1) estás aprendiendo, (2) sabes que el array tendrá < 50 elementos. Para todo lo demás, hay mejores alternativas.

### La Optimización del Flag

Fíjate en la variable `huboIntercambio`. Si en una pasada completa no intercambiamos nada, es que el array ya está ordenado y podemos parar. Esta optimización no mejora el peor caso (array invertido), pero ayuda en arrays casi ordenados.

## Ordenación por Inserción: Como Ordenar Cartas en la Mano

La **ordenación por inserción** (insertion sort) es como ordenar las cartas que te reparten en el póker. Tomas una carta nueva y la colocas en su sitio dentro de las que ya tienes ordenadas en la mano.

```java
public class Insercion {

    public static void ordenar(int[] array) {
        for (int i = 1; i < array.length; i++) {
            int clave = array[i];  // La carta que vamos a colocar
            int j = i - 1;

            // Desplazar elementos mayores hacia la derecha
            while (j >= 0 && array[j] > clave) {
                array[j + 1] = array[j];
                j--;
            }
            array[j + 1] = clave;  // Colocar la carta en su sitio
        }
    }

    public static void main(String[] args) {
        int[] datos = {9, 5, 1, 4, 3};

        System.out.print("Antes: ");
        for (int n : datos) System.out.print(n + " ");

        ordenar(datos);

        System.out.print("\nDespués: ");
        for (int n : datos) System.out.print(n + " ");
        // 1 3 4 5 9
    }
}
```

### ¿Cómo funciona paso a paso?

Dado `{9, 5, 1, 4, 3}`:

```
Paso 0: [9] | 5 1 4 3   → la "mano" empieza con el 9
Paso 1: [5 9] | 1 4 3   → 5 se coloca a la izquierda del 9
Paso 2: [1 5 9] | 4 3   → 1 se coloca al principio
Paso 3: [1 4 5 9] | 3   → 4 se cuela entre el 1 y el 5
Paso 4: [1 3 4 5 9]     → 3 se coloca entre el 1 y el 4
```

### Análisis y ¿Cuándo es buena?

También es **O(n²)** en el peor caso (array invertido). Pero:

- **Mejor caso (array casi ordenado)**: O(n). Solo hace una pasada. Es rapidísimo.
- Es **estable**: mantiene el orden relativo de elementos iguales.
- **No necesita memoria extra** (ordena in-place).
- Es **más rápido que burbuja** en la práctica, aunque ambos sean O(n²).

> **💡 Consejo:**
>
> La ordenación por inserción es la reina de los datos **casi ordenados**. Si sabes que tu array tiene 100 elementos y ya está "casi bien" (solo unos pocos fuera de sitio), inserción te va a sorprender. Se usa como paso final en algoritmos avanzados (TimSort, usado por Java y Python).

```java
public class Comparacion {
    public static void main(String[] args) {
        // Demostración: inserción vs burbuja con array casi ordenado
        int[] casiOrdenado = {1, 2, 3, 4, 6, 5, 7, 8, 9, 10};
        // Solo el 6 y el 5 están intercambiados

        int[] burbuja = casiOrdenado.clone();
        int[] insercion = casiOrdenado.clone();

        // Con burbuja da varias pasadas aunque casi esté ordenado
        // Con inserción resuelve en un suspiro
        System.out.println("Inserción es ideal cuando tienes que añadir");
        System.out.println("un elemento a un array ya ordenado.");
    }
}
```

## Complejidad Algorítmica: Big O para Mortales

La **notación Big O** describe cómo crece el tiempo de ejecución de un algoritmo cuando crece la cantidad de datos de entrada. No te da el tiempo exacto en segundos (eso depende del hardware), te da la **tendencia**.

### Las Complejidades Más Comunes

| Notación | Nombre | Ejemplo | Para n=1000 |
|----------|--------|---------|-------------|
| O(1) | Constante | Acceder a un array por índice | 1 operación |
| O(log n) | Logarítmica | Búsqueda binaria | ~10 ops |
| O(n) | Lineal | Búsqueda lineal | 1000 ops |
| O(n log n) | Casi lineal | Ordenación rápida (lo verás más adelante) | ~10.000 ops |
| O(n²) | Cuadrática | Burbuja, inserción | 1.000.000 ops |
| O(2ⁿ) | Exponencial | Fibonacci recursivo sin optimizar | ¡inviable! |

```java
public class EjemplosComplejidad {

    // O(1) — CONSTANTE: siempre igual, no importa el tamaño
    public static int obtenerPrimero(int[] array) {
        return array[0];  // Un solo paso, siempre
    }

    // O(n) — LINEAL: crece proporcional a n
    public static int sumar(int[] array) {
        int suma = 0;
        for (int num : array) {
            suma += num;  // n pasos
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

### Reglas Prácticas de Big O

1. **Ignora constantes**: O(2n) es lo mismo que O(n). El 2 no importa cuando n tiende a infinito.
2. **Quédate con el término dominante**: O(n² + n) → O(n²). El n² come al n cuando n crece.
3. **Los bucles anidados multiplican**: un bucle dentro de otro → n × n → O(n²).
4. **Los bucles secuenciales suman**: un bucle y luego otro → O(n + n) → O(2n) → O(n).

> **📝 Nota:**
>
> "Big O" describe el **peor caso** (o cota superior). Si dices que búsqueda lineal es O(n), estás diciendo "como mucho, tardará lo mismo que recorrer todo el array". Existen también Big Omega Ω (mejor caso) y Big Theta Θ (caso promedio), pero con Big O tienes suficiente para empezar.

```java
public class ReglasBigO {
    public static void main(String[] args) {
        // REGLA 1: Las constantes no importan
        // O(2n) → O(n)
        // O(100n) → O(n)

        // REGLA 2: El término dominante se queda
        // O(n² + 5n + 1) → O(n²)
        // O(n + log n) → O(n)
        // O(n! + n²) → O(n!)

        // REGLA 3: Bucles anidados → multiplica
        // for(i...) { for(j...) } → O(n * m) → O(n²)

        // REGLA 4: Bucles secuenciales → suma
        // for(i...) { } for(i...) { }
        // O(n + n) → O(2n) → O(n)

        System.out.println("Big O no es magia, es simplificar.");
        System.out.println("Pregúntate: ¿qué pasa cuando n se hace MUY grande?");
    }
}
```

## ⭐ BE THE CODE, MY FRIEND: Implementa Búsqueda Binaria desde Cero

> 🕶️ **Don Tip:** La búsqueda binaria reduce el problema a la mitad en cada paso. Céntrate en los límites `izquierda` y `derecha` — el error más común es no actualizarlos bien.

Este ejercicio es un clásico en entrevistas técnicas de Google, Amazon y compañía. Si algún día quieres trabajar en una FAANG, la búsqueda binaria la tienes que saber escribir dormido, borracho y con una mano atada a la espalda.

**Instrucciones:**

Sin mirar el código de arriba, implementa el método `busquedaBinaria` que recibe un array ordenado de enteros y un objetivo, y devuelve la posición del objetivo o -1 si no existe.

```java
/**
 * Implementa este método:
 * 
 * public static int busquedaBinaria(int[] array, int objetivo)
 *
 * Requisitos:
 * - No uses Arrays.binarySearch() — el sentido es programarlo
 * - No mires el código de la unidad — fuerza tu cerebro a recordar
 * - Piénsalo así: coge el medio, compara, descarta la mitad, repite
 */
public class RetoBinaria {

    public static int busquedaBinaria(int[] array, int objetivo) {
        // 🧠 TU CÓDIGO AQUÍ
        return -1;
    }

    public static void main(String[] args) {
        int[] pruebas = {1, 3, 5, 7, 9, 11, 13, 15, 17, 19};

        System.out.println("Probando búsqueda binaria...");
        System.out.println("El 7 está en posición: " + busquedaBinaria(pruebas, 7));  // 3
        System.out.println("El 13 está en posición: " + busquedaBinaria(pruebas, 13)); // 6
        System.out.println("El 8 está en posición: " + busquedaBinaria(pruebas, 8));  // -1
        System.out.println("El 19 está en posición: " + busquedaBinaria(pruebas, 19)); // 9
        System.out.println("El 1 está en posición: " + busquedaBinaria(pruebas, 1));   // 0
        System.out.println("Primer elemento fuera: " + busquedaBinaria(new int[]{}, 5)); // -1
    }
}
```

**Pistas (si te atascas):**

- Necesitas dos punteros: `izquierda` y `derecha`.
- Calcula el `medio` como `izquierda + (derecha - izquierda) / 2`.
- Si `array[medio] == objetivo`, devuelve `medio`.
- Si `array[medio] < objetivo`, mueve `izquierda` a `medio + 1`.
- Si `array[medio] > objetivo`, mueve `derecha` a `medio - 1`.
- El bucle termina cuando `izquierda > derecha`.
- Array vacío → directamente `-1`.

> **💡 Consejo:**
>
> El error más común en búsqueda binaria (incluso en programadores con 10 años de experiencia) es el **off-by-one**: ¿`<=` o `<`? ¿`medio + 1` o `medio`? Dibuja el array en un papel con 3 elementos y simula los casos. El papel y boli son tus mejores herramientas de debugging.

### Solución (inténtalo antes de mirar)

```java
public static int busquedaBinaria(int[] array, int objetivo) {
    if (array == null || array.length == 0) return -1;

    int izquierda = 0;
    int derecha = array.length - 1;

    while (izquierda <= derecha) {
        int medio = izquierda + (derecha - izquierda) / 2;

        if (array[medio] == objetivo) {
            return medio;
        } else if (array[medio] < objetivo) {
            izquierda = medio + 1;
        } else {
            derecha = medio - 1;
        }
    }
    return -1;
}
```

### 🧩 EL LÍO

El departamento de calidad ha recibido este algoritmo de ordenación. Algo huele mal. Identifica los errores y explica por qué no funciona:

```java
public class BurbujaLiosa {
    public static void ordenar(int[] arr) {
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr.length; j++) {
                if (arr[j] > arr[j + 1]) {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
    }
}
```

Pista: hay un error de índices y otro de rendimiento.

> 🕶️ **Don Tip:** Cuando un bucle accede a `arr[j + 1]`, asegúrate de que `j + 1` no se salga del array. También piensa: ¿recorro menos elementos en cada pasada?

## ¡No Hay Preguntas Tontas!

> **Q:** ¿Por qué no usamos siempre búsqueda binaria si es tan rápida?
>
> **A:** Porque requiere que los datos estén **ordenados**. Ordenar también cuesta tiempo. Si tienes que ordenar cada vez que buscas, pierdes la ventaja. La búsqueda binaria es ideal cuando ordenas una vez y buscas muchas veces.

> **Q:** ¿Big O sirve para algo en el mundo real o es solo teoría de examen?
>
> **A:** Sirve y mucho. Cuando tu app web empieza a ir lenta con 1000 usuarios, la diferencia entre O(n) y O(n²) es la diferencia entre "echar un café mientras carga" y "jubilarte antes de que termine". Las empresas tech (Google, Amazon, Netflix) matan por eficiencia. Un algoritmo malo en producción cuesta dinero real en servidores.

> **Q:** ¿Hay algoritmos de ordenación más rápidos que O(n²)?
>
> **A:** Sí, y los verás en la siguiente unidad. QuickSort, MergeSort y HeapSort son del orden **O(n log n)**, que es mucho más rápido que O(n²). Por ejemplo, para 1.000.000 de elementos, O(n log n) son ~20 millones de operaciones; O(n²) son 1 billón.

> **Q:** ¿Puedo mezclar tipos de búsqueda y ordenación?
>
> **A:** Claro. Es muy común ordenar con QuickSort y luego buscar con binaria. O si el array es muy pequeño (< 50), usar búsqueda lineal aunque esté ordenado, porque la sobrecarga de la binaria no compensa.

> **Q:** Vale, pero... ¿cuándo uso cada algoritmo de ordenación?
>
> **A:** Regla práctica:
> - Array pequeño (< 50 elementos) → cualquiera vale, usa inserción por simplicidad.
> - Array casi ordenado → **inserción** arrasa.
> - Array grande → no uses burbuja ni inserción. Espera a la próxima unidad.
> - Array enorme con memoria limitada → **HeapSort**.
> - Array enorme y necesitas estabilidad → **MergeSort**.
> - Array enorme y velocidad bruta → **QuickSort**.

> **Q:** ¿Qué significa que un algoritmo sea "estable"?
>
> **A:** Un algoritmo de ordenación es estable si mantiene el orden relativo de elementos con el mismo valor. Por ejemplo, si tienes dos usuarios con edad 25 ("Ana" antes que "Luis"), un algoritmo estable los deja en ese orden. Inserción y MergeSort son estables; Burbuja se puede hacer estable o no según la implementación; QuickSort no lo es por defecto.

> **Q:** ¿Y todo esto sirve para aprobar el módulo?
>
> **A:** Sirve para aprobar el módulo, para las entrevistas técnicas, para escribir código que no de pena, y para que cuando alguien diga "es O(n²)" tú sepas exactamente por qué es malo. Así que sí, pon atención.

### 🔮 EL ACERTIJO

Tienes 9 monedas aparentemente idénticas. Una de ellas es falsa y pesa menos que las demás. Dispones de una balanza de dos platillos. ¿Cuál es el número mínimo de pesadas que necesitas para encontrar la moneda falsa?

Pista: no las peses una por una. Usa divide y vencerás.

> 🕶️ **Don Tip:** Si divides 9 monedas en 3 grupos de 3, con una sola pesada puedes descartar 6 monedas.

## Resumen de la Unidad

| Algoritmo | Complejidad | ¿Cuándo usarlo? |
|-----------|------------|-----------------|
| Búsqueda lineal | O(n) | Arrays pequeños o desordenados |
| Búsqueda binaria | O(log n) | Arrays grandes ORDENADOS |
| Burbuja | O(n²) | Solo para aprender o arrays muy pequeños |
| Inserción | O(n²) / O(n) | Arrays pequeños o casi ordenados |

**Conceptos clave:**
- Un algoritmo es una secuencia finita, precisa y no ambigua de pasos.
- La notación Big O describe la tasa de crecimiento del tiempo de ejecución.
- O(1) < O(log n) < O(n) < O(n log n) < O(n²) < O(2ⁿ)
- Ordenar antes de buscar puede merecer la pena si haces muchas búsquedas.
- El mejor algoritmo depende del contexto: tamaño, orden inicial, requisitos de memoria y estabilidad.

> **⚠️ Advertencia:**
>
> Esto es solo el principio. La siguiente unidad sube el nivel: QuickSort, MergeSort, búsqueda con hash, y complejidad en casos reales. Pero si dominas estos fundamentos, lo demás es cuesta abajo. Algorítmica es como montar en bici: al principio parece imposible, luego no se te olvida nunca.

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
