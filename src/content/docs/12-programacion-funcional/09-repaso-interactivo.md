---
title: "09 · Repaso interactivo: domina la programación funcional"
description: "El cierre práctico de la unidad, con un pipeline que parece magia y un Optional que esconde un susto 🎯"
---

<p><small>El cierre práctico de la unidad, con un pipeline que parece magia y un Optional que esconde un susto 🎯</small></p>

> 🗺️ **Estás en:** 🎯 **U12 · Programación Funcional** → 09 · Repaso interactivo

---

## 📬 La idea en una frase

> **En este punto no aprendemos nada nuevo: lo convertimos todo en práctica. Y, como siempre, algo no va a funcionar.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaban de darte este programa para ejecutar:*

```java
import java.util.*;
import java.util.stream.*;

public class Misterio {
    public static void main(String[] args) {
        List<String> nombres = List.of("ana", "bob", "carla", "david", "eva");

        long r = nombres.stream()
            .filter(n -> n.length() > 3)
            .map(String::toUpperCase)
            .count();

        System.out.println(r);
    }
}
```

**¿Qué imprimes por pantalla? Elige sabiamente:**

1. **`5`** → El `filter` no filtra nada y el `map` convierte todos. ❌
2. **`3`** → `filter` deja pasar a `carla`, `david` y `eva`... ¿no? ❌
3. **`2`** → ✅ Correcto de verdad: de `ana, bob, carla, david, eva` pasan el filtro `carla` y `david` (las únicas con más de 3 letras). `map(String::toUpperCase)` las pone en mayúsculas, pero no cambia la cuenta. `count()` devuelve **2**.

> <details>
> <summary>🔄 Solución</summary>
>
> La opción **3**: **`2`**. Las longitudes son `ana`=3, `bob`=3, `carla`=5, `david`=5, `eva`=3. El `filter(n -> n.length() > 3)` deja pasar solo `carla` y `david`. El `map` las convierte en `CARLA` y `DAVID`, pero `count()` cuenta elementos: no mira los valores transformados. La trampa está en `eva`: 3 letras no superan a 3, y el `map` no cambia el número de elementos, solo su forma.
>
> </details>

---

## 🔥 Fireside Chat: el Bucle For vs el Stream

> *Dos maneras de recorrer una lista se encuentran frente a la máquina de café.*

**Bucle For:** — Mira, yo soy el clásico. `for (String s : lista) { ... }`. Voy elemento a elemento, decido yo el ritmo, puedo parar cuando quiero. El control total.

**Stream:** — ¡Ja! Tú controlas el *cómo*. Yo solo necesito que me digas el *qué*: `lista.stream().filter(...).map(...).toList()`. Declaras la receta y yo cocino.

**Bucle For:** — ¿Y cuando necesitas modificar la lista mientras la recorres? Yo te dejo, con cuidado. Tú ni lo intentas.

**Stream:** — Para eso existen las colecciones de salida. Y cuando te olvidas del `break` y recorres mil elementos de más, no me vengas llorando. Además, yo puedo decir `limit(3)` y me paro solo. ¿Tú sabes lo que es pereza productiva?

**Bucle For:** — Vale, vale... pero mis primitivos y mis índices siguen siendo útiles para cosas simples.

**Stream:** — Nadie dice que no. Yo brillo cuando el pipeline se vuelve complejo: filtrar, transformar, ordenar y agrupar en tres líneas en vez de tres bucles anidados. Tú para lo simple, yo para lo declarativo. Tregua.

**Bucle For:** — Tregua. Al final, los dos recorremos.

> La lección: **usa el bucle cuando el control importe y el stream cuando quieras declarar el resultado.** No es una guerra: es saber cuándo usar cada herramienta. El stream no te odia: te está quitando trabajo.

---

## 🕵️ ¿Quién soy?

Adivina qué concepto de la unidad soy:

1. **Soy la flecha que convierte un bloque de código en un valor que viaja solo.**
2. **Soy la interfaz funcional que responde `true` o `false` a una pregunta.**
3. **Soy el operador que te deja reciclar un método como si fuera una lambda.**
4. **Soy el flujo perezoso que no hace nada hasta que abres el grifo.**
5. **Soy el grifo final: sin mí, el stream no fluye.**
6. **Soy la caja que acepta la ausencia.**

<details>
<summary>🔄 Respuestas</summary>

1. La **lambda** (`->`) — `(x) -> x * 2`.
2. **`Predicate<T>`** — `boolean test(T)`.
3. La **referencia a método** (`::`) — `String::toUpperCase`.
4. El **`Stream`** — perezoso y de un solo uso.
5. La **operación terminal** — `collect`, `reduce`, `count`, `forEach`.
6. **`Optional`** — la caja que envuelve un valor o su ausencia.

</details>

---

## 🤬 CONRAD VS EL MUNDO: "El que olvida el grifo"

> *CONRAD, nuestro compilador cascarrabias, opina sobre los clásicos del novato.*

**CONRAD:** — ¡OTRA VEZ! Un alumno me enseña su programa y se queja: *"CONRAD, no me imprime nada"*. Y yo: ¿has puesto una operación terminal? *"¿Una qué?"* ¡AY, MADRE MÍA! ¡`lista.stream().filter(...).map(...)` sin terminal no hace NADA! El stream es perezoso, como mi paciencia. Pónle un `collect`, un `count` o un `forEach`, o la cinta se queda parada para siempre.

*Y luego está el que intenta recorrer el mismo stream dos veces.* "¿Por qué me da error al segundo `count()`?" ¡Pues porque la cinta ya se vació! Un stream se consume con la primera terminal. Si quieres contar dos cosas, crea dos streams. Es como querer comer la misma pizza dos veces: imposible, ya está en tu estómago.

*Y el colmo de los colmos:* el que hace `Optional.of(objetoQuePuedeSerNull)` y se extraña de la `NullPointerException`. ¡`of` es para lo seguro! Si puede venir `null`, `ofNullable`. Y no me vengas con `get()` a ciegas sobre una caja que puede estar vacía: eso es `NoSuchElementException` asegurada. `orElse`, `ifPresent`, `orElseThrow`... la caja tiene puerta, úsala.

**La lección:** antes de acusar a Java de "odiarte", repasa el trío sagrado de la unidad: **¿hay una operación terminal? ¿estoy reutilizando un stream ya consumido? ¿estoy abriendo un `Optional` vacío sin red?** El compilador no te odia: te está pasando las respuestas del examen.

---

## 🎮 El juego de las decisiones

Elige la respuesta correcta para cada decisión (respuestas al final):

1. `nombres.stream().map(String::length)` sin operación terminal... ¿se ejecuta el `map`?
   - a) Sí, en el acto   b) No, hasta que llegue una terminal
2. ¿Puedes hacer `lista.add(...)` sobre una lista devuelta por `toList()`?
   - a) Sí   b) No: es inmutable
3. `Optional<String> o = Optional.empty(); o.get()`... ¿qué pasa?
   - a) Devuelve `null`   b) Lanza `NoSuchElementException`
4. `reduce(0, Integer::sum)` sobre un `Stream<Integer>`... ¿qué devuelve?
   - a) `int`   b) `Optional<Integer>`
5. `Collectors.groupingBy(Function.identity())` devuelve un...
   - a) `Map<T, List<T>>`   b) `List<T>`
6. Después de `stream.count()`, ¿puedes usar el mismo stream para otra cosa?
   - a) Sí   b) No: queda consumido

<details>
<summary>🔄 Soluciones</summary>

1. **b)** — El stream es perezoso; las intermedias no se ejecutan hasta la terminal.
2. **b)** — `toList()` devuelve una lista inmutable. Para poder modificarla, `collect(Collectors.toList())`.
3. **b)** — `get()` sobre una caja vacía lanza `NoSuchElementException`. Usa `orElse` o `ifPresent`.
4. **a)** — Con identidad, `reduce` devuelve el valor directo (`int`). Sin identidad (`reduce((a, b) -> ...)`) devolvería `Optional<Integer>`.
5. **a)** — `groupingBy` devuelve un `Map` con las claves agrupadas y sus listas de elementos.
6. **b)** — Un stream solo se recorre una vez; la primera terminal lo consume.

</details>

---

## ⚡ Laboratorio de tortura: la estadística que no arranca

> **Duración estimada:** 30 minutos
> **Herramienta:** tu IDE y un archivo nuevo

**El escenario:** copia este programa y haz que funcione. Te dicen que tiene **3 errores** que impiden que compile y 1 error de lógica que hace que el resultado sea incorrecto... pero, ¿y si te lo dicen mal? Tu tarea: hacer que compile, que ejecute y que **toda** la salida sea correcta, contando tú los errores reales.

```java
import java.util.*;
import java.util.stream.*;

public class Estadisticas {

    public static void main(String[] args) {
        List<Integer> notas = List.of(7, 8, 3, 9, 5);

        long aprobados = notas.stream()
            .filter(n -> n >= 5)
            .count;                                    // línea A

        List<Integer> dobladas = notas.stream()
            .map(n -> n * 2)
            .toList();                                 // línea B

        int total = dobladas.stream()
            .reduce(0, (a, b) -> a + b);               // línea C

        System.out.println(aprobados + " " + dobladas + " " + total);
    }
}
```

**Fallo intencionado:** el número de errores del enunciado está mal a propósito: si buscas el "tercer error de compilación" y "el error de lógica", te vuelves loco. La trampa es tu confianza en el enunciado.

**Tu tarea:** conseguir que compile, que ejecute y que **toda** la salida sea correcta. Si el resultado no cuadra, diagnostica.

**Pistas para cuando te frustres (no antes):**

1. ¿Hay algún error de compilación? *sí → busca la línea sospechosa.*
   <details><summary>¿Y si sigo atascado?</summary>Repasa la línea A: `count` sin paréntesis no es una llamada a método, es una referencia. Necesita `count()`.</details>
2. ¿Compila ya? *sí → ahora piensa en la salida.*
   <details><summary>¿Y si sigo atascado?</summary>`notas` = {7, 8, 3, 9, 5}. El `filter(n -> n >= 5)` deja pasar 7, 8, 9 y 5: cuatro aprobados. `map(n -> n * 2)` los dobla y `toList()` los recoge. `reduce(0, (a, b) -> a + b)` suma la lista doblada. Ningún error de lógica acecha.</details>
3. ¿Crees que hay un error de lógica que cambia el resultado? *Vuelve a leer el código con calma y no te fíes del enunciado.*
   <details><summary>Solución final</summary>

   El **único error de compilación**:

   1. Línea A: falta el `()` — `count` sin paréntesis es una referencia a método, no una llamada. Debe ser `count()`.

   El **error de lógica**: no existe. `aprobados` = 4 (7, 8, 9, 5 aprueban; el 3 se queda fuera). `dobladas` = `[14, 16, 6, 18, 10]` (toda la lista se dobla, también el 3). `total` = `14 + 16 + 6 + 18 + 10` = `64`. Salida: `4 [14, 16, 6, 18, 10] 64`.

   Ese era el fallo intencionado: el enunciado dice "3 errores de compilación y 1 de lógica", pero solo hay 1 falta de `()` y ninguna lógica rota. El error "oculto" era tu confianza en el enunciado.

   ```java
   import java.util.*;
   import java.util.stream.*;

   public class Estadisticas {

       public static void main(String[] args) {
           List<Integer> notas = List.of(7, 8, 3, 9, 5);

           long aprobados = notas.stream()
               .filter(n -> n >= 5)
               .count();

           List<Integer> dobladas = notas.stream()
               .map(n -> n * 2)
               .toList();

           int total = dobladas.stream()
               .reduce(0, (a, b) -> a + b);

           System.out.println(aprobados + " " + dobladas + " " + total);
       }
   }
   ```

   Salida correcta: `4 [14, 16, 6, 18, 10] 64`. La lección real: **lee el código, no el enunciado**. Un bug puede ser que te digan "hay 3 errores" y solo haya 1: si buscas los otros dos, te vuelves loco. Cuenta, verifica y confía en el compilador, no en la leyenda.

   </details>

---

## 🏆 Logros de esta unidad

| Logro | Cómo conseguirlo |
|---|---|
| 🏅 **El Arquero** | Explicar la sintaxis `->` de las lambdas con un ejemplo de un parámetro sin paréntesis |
| 🏅 **El Sastre** | Vestir una lambda con `Predicate`, `Function`, `Consumer` y `Supplier` sin consultar la chuleta |
| 🏅 **El Reciclador** | Reescribir tres lambdas como referencias a método (`::`) |
| 🏅 **El Maestro de la Cinta** | Montar un pipeline `filter → map → sorted → limit → collect` y predecir su salida |
| 🏅 **El Aceptador** | Gestionar un `Optional` vacío con `orElse` e `ifPresent` sin lanzar ninguna excepción |

---

## 🧠 Atrévete a pensar

1. **Sin ejecutar:** ¿qué imprime este programa?

```java
import java.util.*;
import java.util.stream.*;

public class Acertijo {
    public static void main(String[] args) {
        List<String> palabras = List.of("sol", "mar", "luna", "sol", "luna", "cielo");
        long distintas = palabras.stream().distinct().count();
        List<String> orden = palabras.stream().distinct().sorted().toList();
        System.out.println(distinctas + " " + orden);
    }
}
```

2. **La media de aprobados:** tienes una `List<Integer>` con notas. ¿Cómo calculas, con streams, la media de las notas que son 5 o más? ¿Qué devuelve `average()` si ninguna nota aprueba?

3. **El detective del pipeline:** ¿por qué `stream.map(...).filter(...)` sin operación terminal no imprime absolutamente nada?

4. **Verdadero o falso:** "un `Stream` se puede recorrer tantas veces como quieras".

<details>
<summary>💡 Soluciones</summary>

1. **`4 [cielo, luna, mar, sol]`**. `distinct()` deja `sol, mar, luna, cielo` (4 distintas). El segundo stream ordena las 4 alfabéticamente: `cielo, luna, mar, sol`.
2. Con `notas.stream().filter(n -> n >= 5).mapToInt(n -> n).average()`. `average()` devuelve un `OptionalDouble`: si no hay aprobados, la caja está vacía y aterrizas con `orElse(0)`.
3. Porque el stream es **perezoso**: las operaciones intermedias solo preparan la cinta. Sin una terminal (`collect`, `count`, `forEach`...), no se ejecuta nada.
4. **Falso.** Un stream es de un solo uso: la primera operación terminal lo consume. Para repetir, crea otro stream.

</details>

---

## 🧩 Crucigrama de bits

```
Horizontal:
1. Expresión sin nombre que viaja como un valor (6 letras)
3. Operación terminal que combina todos los elementos en uno (6 letras)
5. Clase que envuelve un valor o su ausencia (8 letras)
7. Operación intermedia que deja pasar solo lo que cumple una condición (6 letras)

Vertical:
2. Interfaz funcional que devuelve `boolean` (9 letras)
4. El flujo de datos perezoso de Java (6 letras)
6. Operador que transforma cada elemento (3 letras)
```

<details>
<summary>📝 Soluciones</summary>

**Horizontal:** 1. LAMBDA · 3. REDUCE · 5. OPTIONAL · 7. FILTER
**Vertical:** 2. PREDICATE · 4. STREAM · 6. MAP

</details>

---

## 💬 Preguntas de entrevista de trabajo

> Preguntas reales que te harían para programador Java junior.

1. **"Explícame, como si yo fuera tu abuela, qué es una lambda."**
2. **"¿Qué es una interfaz funcional y qué tiene que ver con las lambdas?"**
3. **"¿Cuál es la diferencia entre una operación intermedia y una terminal en un stream?"**
4. **"¿Por qué `Optional` es mejor que devolver `null`?"**
5. **"¿Qué hace `groupingBy` y qué devuelve?"**
6. **"¿Cuál es la diferencia entre `map` y `reduce`?"**

---

## 🤷 No hay preguntas tontas

> ❓ **¿Una lambda es un objeto?**

Sí. Una lambda es un objeto de la clase anónima que implementa su interfaz funcional. `Predicate<Integer> p = n -> n % 2 == 0;` crea por debajo un objeto que implementa `Predicate<Integer>`. El compilador hace la magia; tú solo escribes la flecha.

---

> ❓ **¿Puedo guardar una lambda en una variable?**

Sí, pero no en una variable de tipo `int` ni `String`: necesita una variable de tipo **interfaz funcional**. `Predicate<Integer> esPar = n -> n % 2 == 0;` es perfectamente legal. La lambda viaja como cualquier otro valor.

---

> ❓ **¿Un `Stream` guarda datos? ¿Y cuándo se vacía?**

No guarda nada: es una vista sobre una fuente (lista, array...). Se vacía en cuanto llega una operación terminal. Los datos originales siguen intactos en su colección; lo que se consume es la cinta.

---

> ❓ **¿Puedo usar streams con arrays, que en la U04 eran otra cosa?**

Claro: `Arrays.stream(miArray)` convierte un array en flujo, y `Arrays.stream(int[])` además da un `IntStream` con métodos como `sum()` y `average()`. Los arrays y los streams no compiten: se pasan el relevo.

---

## 🎬 Poscréditos

La programadora acaba su analizador de notas: un pipeline de streams que filtra los aprobados, calcula la media con `average()` y guarda el resultado en un `Optional` por si un día no hay notas que analizar. Todo perfecto... hasta que cierra el programa y sus estadísticas desaparecen.

Se acerca CONRAD, el compilador cascarrabias, con su taza humeante.

**CONRAD:** — ¿Has visto? Todo vive en memoria RAM. Cierras la app y adiós, estadísticas. Un stream es fantástico para procesar datos mientras el programa corre, pero para que sobrevivan al reinicio necesitas algo más.

**Programadora:** — ¿Guardarlas en un archivo? ¿Como un fichero de texto en el disco?

**CONRAD:** — *asiente* Exacto. Ficheros, y cuando los datos crezcan, expresiones regulares para buscar patrones. Tu cinta transportadora procesa; el fichero conserva. Todo eso es otra historia... y casi te toca.

**PROXIMAMENTE EN U13:** Ficheros y Regex. Guarda los resultados de tus streams en disco y busca patrones con expresiones regulares. 📁

---

📚 [Volver al índice de la unidad](/ApuntesProgramacion/12-programacion-funcional) · **Anterior:** [08 · Optional: el que acepta la ausencia](/ApuntesProgramacion/12-programacion-funcional/08-optional) · **Siguiente:** **[U13 · Ficheros y Regex](/ApuntesProgramacion/13-ficheros-regex)**