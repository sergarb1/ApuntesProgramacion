---
title: "09 — Repaso interactivo: ordena y busca como un profesional"
description: El cierre práctico de la unidad, con búsquedas, burbujas y un algoritmo que no va a funcionar 😈
---

<p><small>El cierre práctico de la unidad, con búsquedas, burbujas y un algoritmo que no va a funcionar 😈</small></p>

> 🗺️ **Estás en:** 🧩 **U04 · Algorítmica I: Fundamentos** → 09 · Repaso interactivo

---

## 📬 La idea en una frase

> **En este punto no aprendemos nada nuevo: lo convertimos todo en práctica. Y, como siempre, algo no va a funcionar.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaban de darte este programa para ejecutar:*

```java
public class Misterio {
    public static void main(String[] args) {
        int[] datos = {10, 20, 30, 40, 50, 60};
        int izquierda = 0;
        int derecha = datos.length - 1;
        int objetivo = 40;
        int pasos = 0;

        while (izquierda <= derecha) {
            int medio = izquierda + (derecha - izquierda) / 2;
            pasos++;
            if (datos[medio] == objetivo) {
                System.out.println("Encontrado en " + medio + " con " + pasos + " pasos.");
                return;
            }
            if (datos[medio] < objetivo) {
                izquierda = medio + 1;
            } else {
                derecha = medio - 1;
            }
        }
        System.out.println("No está. Pasos: " + pasos);
    }
}
```

**¿Qué imprime por pantalla? Elige sabiamente:**

1. **`Encontrado en 3 con 1 pasos.`** → ✅ ¡Correcto! Con 6 elementos, `medio` es `0 + (5-0)/2 = 2` → `datos[2] = 30`, que es menor que 40, así que `izquierda = 3`. Segunda vuelta: `medio = 3 + (5-3)/2 = 4` → `datos[4] = 50`, que es mayor, así que `derecha = 3`. Tercera vuelta: `medio = 3 + (3-3)/2 = 3` → `datos[3] = 40`. ¡Bingo en 3 pasos! Con `return` (estamos en `main`) el programa termina ahí.
2. **`Encontrado en 3 con 3 pasos.`** → Confundes el número de pasos con la posición. ❌
3. **`No está. Pasos: 4.`** → El 40 está en el array, solo que la búsqueda binaria no lo caza a la primera. ❌

> <details>
> <summary>🔄 Solución</summary>
>
> La opción **1**. Traza: `medio=2 (30<40) → izq=3`, `medio=4 (50>40) → der=3`, `medio=3 → ¡40!`. Son **3 pasos** en la posición **3**. El `return` dentro de `main` termina el programa sin llegar a la línea del "No está".
>
> </details>

---

## 🔥 Fireside Chat: búsqueda lineal vs búsqueda binaria

> *Dos veteranos de la búsqueda discuten junto a la máquina de café.*

**Lineal:** — Yo soy la básica. Recorro elemento por elemento, sin exigirle nada a nadie. ¿Desordenado? Sin problema. ¿Cinco elementos? Un momento. ¿Un millón? Unos milloncitos de pasos, pero voy.

**Binaria:** — Unos milloncitos. Qué generosidad. Yo con un millón tardo veinte pasos. Veinte. Mientras tú sudas, yo ya he terminado y me estoy pidiendo otro café.

**Lineal:** — ¿Y quién te ha dado permiso para ser tan lista? El array **ordenado**. Si los datos llegan desordenados, tú no sirves ni para abrir la puerta. Yo, en cambio, funciono siempre. Es la vida: sin exigir nada, pero sin grandes alegrías.

**Binaria:** — Ordenar una vez y buscar mil, y verás. Yo soy la que salva a las apps con millones de usuarios. Tú eres... el plan B.

**Lineal:** — El plan B que no se estrella. Cuando tu array está desordenado y a nadie le apetece ordenarlo, a mí me llaman. Y no me quejo.

**Binaria:** — Vale, cada una en su terreno: tú, lo pequeño y desordenado; yo, lo grande y ordenado con muchas búsquedas. ¿Tregua?

**Lineal:** — Tregua. Pero que sepas que en los arrays de 5 elementos te gano hasta a ti, con tus humos de `izquierda + (derecha - izquierda) / 2`.

> La lección: ninguna es mejor "en general". **Lineal** para datos pequeños o desordenados; **binaria** para datos grandes y ordenados con muchas búsquedas. El contexto decide.

---

## 🕵️ ¿Quién soy?

Adivina qué concepto de la unidad soy:

1. **Soy una receta de cocina para el ordenador: finita, precisa y sin ambigüedades.**
2. **Recorro el array elemento por elemento hasta encontrar el objetivo. No exijo orden, pero soy lenta con datos grandes.**
3. **Abro el diccionario por la mitad y descarto media tonelada de papel en cada intento. Exijo orden, o te devuelvo basura sin avisar.**
4. **Soy el patoso de la ordenación: comparo vecinos e intercambio, una y otra vez, hasta que los grandes suben como burbujas.**
5. **Ordeno como en el póker: coloco cada carta nueva en su sitio dentro de la mano que ya tengo ordenada.**
6. **No mido segundos: mido cómo crece el tiempo cuando crecen los datos.**

<details>
<summary>🔄 Respuestas</summary>

1. **El algoritmo** — secuencia finita, precisa y no ambigua de pasos.
2. **La búsqueda lineal** — O(n), no exige orden.
3. **La búsqueda binaria** — O(log n), exige array ordenado.
4. **La ordenación burbuja** — intercambia vecinos, O(n²).
5. **La ordenación por inserción** — coloca cada elemento en su sitio, O(n²) con O(n) en casi ordenados.
6. **La notación Big O** — describe la tasa de crecimiento del tiempo de ejecución.

</details>

---

## 🤬 CONRAD VS EL MUNDO: "El algoritmo que no termina"

> *CONRAD, nuestro compilador cascarrabias, opina sobre el clásico del novato.*

**CONRAD:** — ¡OTRA VEZ! Viene un alumno y me dice: *CONRAD, mi búsqueda binaria se queda colgada*. Y yo: vale, ¿qué tiene el bucle? *Pues no lo sé, no lo he mirado.* ¡AY, MADRE MÍA! Un `while (izquierda <= derecha)` que en lugar de `izquierda = medio + 1` pone `izquierda = medio`... ¿sabes lo que pasa? El segmento no se reduce. `izquierda` se queda atascada y el bucle da vueltas como un gato persiguiéndose la cola. Enseñándole el algoritmo a un robot aspirador con dirección propia.

*Y luego está el de la burbuja:* `for (int j = 0; j < array.length; j++)` y dentro `array[j + 1]`. ¿DE VERDAD? Cuando `j` llega al final, `j + 1` sale del array. ¿A qué esperas, a que te lance la `ArrayIndexOutOfBoundsException` para leer el mensaje? El mensaje ya te está diciendo el índice, la línea y el motivo. LÉELO.

*Y el clásico:* *mi algoritmo ordena pero muy lento*. Ya. ¿Y qué usaste? *Burbuja*. Con un array de medio millón. ¿Sabes cuántos intercambios son? Los que son. Y no es culpa del algoritmo, que avisa en la etiqueta: "O(n²), para arrays pequeños". El algoritmo no tiene la culpa de que no leyeras la etiqueta.

**La lección:** los bucles de los algoritmos se cuelgan por dos motivos: o la condición nunca avanza hacia `false`, o el índice se sale del array. Antes de llorar sobre el teclado, comprueba esas dos cosas. El 90% de los "algoritmos colgados" se arreglan con un vistazo.

---

## 🎮 El juego de las decisiones

Elige la respuesta correcta para cada decisión (respuestas al final):

1. ¿Cuál es la complejidad de la búsqueda binaria?
   - a) O(n)   b) O(log n)   c) O(1)
2. ¿Cuántos pasos máximos necesita la búsqueda binaria para un array de 1.024 elementos?
   - a) 10   b) 1.024   c) 11
3. ¿Qué devuelve `buscar(new int[]{}, 5)` con una búsqueda binaria bien hecha?
   - a) `-1`   b) `0`   c) `Exception`
4. ¿Cuál de estas es O(n²)?
   - a) Un bucle secuencial   b) Dos bucles anidados   c) Acceder a `array[0]`

<details>
<summary>🔄 Soluciones</summary>

1. **b)** — O(log n): descarta la mitad en cada paso.
2. **a)** — 10 pasos: log₂(1.024) = 10.
3. **a)** — `-1`: el bucle ni siquiera entra (0 <= -1 es `false`) y devuelve el "no encontrado".
4. **b)** — Dos bucles anidados multiplican: n × n.

</details>

---

## ⚡ Laboratorio de tortura: la máquina que no ordena

> **Duración estimada:** 30 minutos
> **Herramienta:** tu IDE y un archivo nuevo

**El escenario:** copia este programa y haz que funcione. Tiene **3 errores** que impiden que compile o que falle en ejecución, y 1 error de lógica que hace que el resultado sea incorrecto cuando lo arregles.

```java
public class Tortura
    public static void main(String[] args) {
        int[] datos = {3, 1, 4, 2};
        for (int i = 0; i < datos.length; i++) {
            for (int j = 0; j < datos.length; j++) {
                if (datos[j] > datos[j + 1]) {
                    int temp = datos[j];
                    datos[j] = datos[j + 1];
                    datos[j + 1] = temp;
                }
            }
        }
        for (int n : datos) System.out.print(n + " ")
    }
}
```

**Fallo intencionado:** uno de los errores parece correcto a simple vista porque "se ve bien", pero hace que el programa falle en ejecución en cuanto arranca.

**Tu tarea:** conseguir que compile, que ejecute y que imprima `1 2 3 4`. Si el resultado no cuadra, diagnostica.

**Pistas para cuando te frustres (no antes):**

1. ¿Hay algún `;` que falte? *no → sigue buscando.*
   <details><summary>¿Y si sigo atascado?</summary>Comprueba también las llaves `{}`: la clase necesita su apertura, y el último `for` necesita su `;`.</details>
2. ¿Compila ya? *no → mira el mensaje de error.*
   <details><summary>¿Y si sigo atascado?</summary>La clase `Tortura` necesita `{` de apertura.</details>
3. ¿Compila pero explota al ejecutar? *Es el error de índices: el bucle interior llega demasiado lejos.*
   <details><summary>¿Y si sigo atascado?</summary>`j < datos.length` accede a `datos[j + 1]` fuera del array. Debe ser `j < datos.length - 1 - i` (y el exterior `i < datos.length - 1`).</details>
4. ¿Ejecuta e imprime `1 2 3 4`? ¡Entonces ya está! Si imprime algo raro, revisa el orden de los bucles.
   <details><summary>Solución final</summary>

```java
public class Tortura {
    public static void main(String[] args) {
        int[] datos = {3, 1, 4, 2};
        for (int i = 0; i < datos.length - 1; i++) {
            for (int j = 0; j < datos.length - 1 - i; j++) {
                if (datos[j] > datos[j + 1]) {
                    int temp = datos[j];
                    datos[j] = datos[j + 1];
                    datos[j + 1] = temp;
                }
            }
        }
        for (int n : datos) System.out.print(n + " ");
    }
}
```

Salida correcta: `1 2 3 4`. Los tres errores eran: falta de `{` de la clase, falta de `;` en el último `for`, y el `j < datos.length` (error de índices). El error de lógica "invisible" era el mismo bucle interior: sin el `- 1 - i`, además de explotar, no aprovecharía las pasadas para ordenar bien en todos los casos.

</details>

---

## 🏆 Logros de esta unidad

| Logro | Cómo conseguirlo |
|---|---|
| 🏅 **El Recetario Humano** | Explicar qué es un algoritmo y sus 5 propiedades sin mirar |
| 🏅 **El Buscador Jedi** | Escribir búsqueda binaria a mano y que funcione a la primera |
| 🏅 **El Crupier** | Explicar inserción con la analogía de las cartas, sin mirar |
| 🏅 **El Analista** | Calcular Big O de un fragmento de código en menos de un minuto |
| 🏅 **El Jefe de Almacén** | Elegir el algoritmo correcto para cada escenario del punto 7 |
| 🏅 **El Cazador de Errores** | Encontrar los 3+1 errores del Laboratorio sin usar las pistas |

---

## 🧠 Atrévete a pensar

1. **Sin ejecutar:** ¿qué imprime este programa?

```java
public class Misterio2 {
    public static void main(String[] args) {
        int[] datos = {2, 4, 6, 8};
        int contador = 0;

        for (int i = 0; i < datos.length; i++) {
            for (int j = i + 1; j < datos.length; j++) {
                if (datos[i] < datos[j]) {
                    contador++;
                }
            }
        }
        System.out.println(contador);
    }
}
```

2. **La copia que se desordena:** ¿qué le pasa a la burbuja si en lugar de comparar `>` comparas `>=`? ¿Afecta a la estabilidad del algoritmo?
3. **El detective:** tu búsqueda binaria devuelve `-1` para un número que SÍ está en el array. ¿Qué herramienta usas y qué variables miras primero?
4. **Verdadero o falso:** "la búsqueda binaria funciona con cualquier array, solo que a veces es más lenta".

<details>
<summary>💡 Soluciones</summary>

1. Imprime **`6`**. El bucle doble cuenta las parejas `(i, j)` con `i < j` donde `datos[i] < datos[j]`. Con `{2,4,6,8}` todas las parejas cumplen: 4 · 3 / 2 = 6.
2. Con `>=` la burbuja seguiría ordenando, pero **rompe la estabilidad**: dos elementos iguales podrían intercambiarse, cambiando su orden relativo. La versión con `>` (estricto) mantiene el orden de los iguales.
3. El **depurador**: pon un breakpoint en el `while` y observa `izquierda`, `derecha` y `medio` en cada vuelta. Si `derecha` nunca baja o `izquierda` no avanza con `medio + 1`, ese es el fallo. El clásico off-by-one.
4. **Falso.** Con un array desordenado no es que sea lenta: devuelve **resultados incorrectos sin avisar**. No hay error, hay basura silenciosa.

</details>

---

## 🧩 Crucigrama de bits

```
Horizontal:
1. Notación que mide cómo crece el tiempo (3 letras + espacio + 1 letra: "O" más otra letra)
3. La complejidad de la búsqueda binaria (empieza por "log")
5. Algoritmo que intercambia vecinos hasta ordenar (8 letras)
6. Secuencia finita y precisa de pasos (9 letras)

Vertical:
2. Señal de "no encontrado" que devuelven las búsquedas (2 letras)
4. Algoritmo que coloca cada carta en su sitio (9 letras)
```

<details>
<summary>📝 Soluciones</summary>

**Horizontal:** 1. BIGO · 3. LOG · 5. BURBUJA · 6. ALGORITMO
**Vertical:** 2. MENOS (el -1) · 4. INSERCIÓN

</details>

---

## 💬 Preguntas de entrevista de trabajo

> Preguntas reales que te harían para programador Java junior.

1. **"Explícame, como si yo fuera tu abuela, la diferencia entre búsqueda lineal y búsqueda binaria."**
2. **"¿Qué es la notación Big O y por qué es importante?"**
3. **"Escribe una búsqueda binaria en la pizarra. Ahora dime qué pasa si el array no está ordenado."**
4. **"¿Cuándo usarías ordenación por inserción en vez de burbuja?"**
5. **"¿Qué es el off-by-one y cómo lo evitas en la búsqueda binaria?"**
6. **"Un algoritmo O(n²) tarda 1 segundo con 1.000 elementos. ¿Cuánto tardará con 2.000? ¿Y con 10.000?"**

---

## 🤷 No hay preguntas tontas

> ❓ **¿Puedo usar `Arrays.sort()` y `Arrays.binarySearch()` de Java en vez de escribir los algoritmos?**

En tus programas reales, sí: Java trae utilidades ordenadas, eficientes y probadas, y verás `Arrays.sort()` pronto. Pero en esta unidad el objetivo es **entender la idea** que hay debajo. Es como aprender a hacer una suma a mano antes de usar la calculadora: no es que la calculadora sea mala, es que necesitas saber qué estás haciendo. Y en una entrevista, el entrevistador quiere ver que lo entiendes, no que sabes importar `java.util.Arrays`.

---

> ❓ **¿Por qué hay que decir "log n" y no simplemente "pocos pasos"?**

Porque "pocos pasos" no sirve para comparar: pocos comparado con qué. El logaritmo en base 2 te dice exactamente **cuántas veces puedes partir por la mitad** antes de llegar a 1. Y cuando alguien te dice "es O(log n)", tú sabes exactamente qué significa. La precisión es el sueldo del programador.

---

> ❓ **Si burbuja e inserción son las dos O(n²), ¿por qué se dice que inserción es mejor?**

Por dos motivos: en el **caso medio** hace menos intercambios (desplaza, no intercambia de tres en tres), y en **arrays casi ordenados** es O(n) de verdad, mientras que burbuja sin flag sigue dando pasadas enteras. En la práctica, con arrays pequeños, la inserción nota la diferencia. Con arrays grandes, ninguna de las dos: ahí llega la U05.

---

## 🎬 Poscréditos

El programador termina su catálogo: ordena las notas con inserción, y cuando un cliente pregunta por su nota, responde con búsqueda binaria en un parpadeo. Está contento. Se acerca CONRAD, el compilador cascarrabias, con su taza humeante.

**CONRAD:** — Oye, no está mal. Inserción para ordenar, binaria para buscar... Y encima sabes decirme por qué no usaste burbuja para el millón de datos. ¿Seguro que eres el mismo que empezó esta unidad con el "echa sal al gusto"?

**Novato:** — *sonríe* Empecé con una receta de tortilla y he terminado ordenando el catálogo en 20 pasos. ¿Y ahora qué?

**CONRAD:** — *toma un sorbo* Todo esto es el calentamiento. Burbuja, inserción, lineal, binaria... son los fundamentos. El siguiente nivel usa técnicas que parten los problemas en trozos, se llaman a sí mismas y ordenan arrays de un millón en un suspiro. Otro tipo de bestias.

El novato guarda su proyecto, cierra el IDE y siente que ya no busca ni ordena: **piensa en términos de algoritmos**.

**PRÓXIMAMENTE EN U05:** Algorítmica II: Técnicas. Divide y vencerás, QuickSort, MergeSort y recursividad. El momento en el que ordenar un millón de datos deja de ser una utopía. ⚡

---

📚 [Volver al índice de la unidad](/ApuntesProgramacion/04-algoritmica-fundamentos) · **Anterior:** [08 · Be the Code: búsqueda binaria desde cero](/ApuntesProgramacion/04-algoritmica-fundamentos/08-be-the-code) · **Siguiente:** **[U05 · Algorítmica II: Técnicas](/ApuntesProgramacion/05-algoritmica-tecnicas)**
