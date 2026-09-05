---
title: "09 · Repaso interactivo: domina las colecciones"
description: "El cierre práctico de la unidad, con colecciones, un remove() que lo va a liar todo y un bucle que va a explotar 😈"
---

<p><small>El cierre práctico de la unidad, con colecciones, un remove() que lo va a liar todo y un bucle que va a explotar 😈</small></p>

> 🗺️ **Estás en:** 📚 **U10 · Colecciones** → 09 · Repaso interactivo

---

## 📬 La idea en una frase

> **En este punto no aprendemos nada nuevo: lo convertimos todo en práctica. Y, como siempre, algo no va a funcionar.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaban de darte este programa para ejecutar:*

```java
import java.util.ArrayList;

public class Misterio {
    public static void main(String[] args) {
        ArrayList<Integer> lista = new ArrayList<>();
        lista.add(1);
        lista.add(2);
        lista.add(3);
        lista.add(4);

        lista.remove(1);
        lista.add(2, 10);

        for (int i = 0; i < lista.size(); i++) {
            System.out.print(lista.get(i) + " ");
        }
    }
}
```

**¿Qué imprimes por pantalla? Elige sabiamente:**

1. **`1 3 4 10`** → El `remove(1)` borra el 2, y luego el `add(2, 10)` mete el 10 al final. ❌
2. **`1 2 3 10`** → El `remove(1)` borra el 2, y el `add(2, 10)` inserta el 10 en la posición 2. ❌
3. **`1 3 10 4`** → ✅ ¡Correcto! `remove(1)` borra el índice 1 (el `2`) → `{1, 3, 4}`. `add(2, 10)` inserta el 10 en el índice 2, desplazando el 4 → `{1, 3, 10, 4}`.

> <details>
> <summary>🔄 Solución</summary>
>
> La opción **3**. `remove(1)` elimina por **índice** (no el valor 1): se va el `2`, que ocupaba la posición 1. Luego `add(2, 10)` inserta el 10 en la posición 2 y empuja al 4 una posición. Los índices se desplazan, como las fichas de dominó.
>
> </details>

---

## 🔥 Fireside Chat: ArrayList vs LinkedList

> *Dos primos de la familia List se enfrentan frente a la máquina de café.*

**ArrayList:** — Mira, yo soy el de toda la vida. Acceso directo a cualquier posición: `get(500)` y ya está. Contiguo, rápido, fiable.

**LinkedList:** — Sí, pero tú, para añadir al principio, desplazas a toda la fila. Yo encadeno mis elementos como una conga: cada uno sabe quién va delante y quién detrás.

**ArrayList:** — ¿Y para recorrer? Yo soy un array por dentro, el CPU te lo agradece. Tú saltas de eslabón en eslabón.

**LinkedList:** — Cierto, pero mis métodos `addFirst`, `addLast`, `removeFirst` son instantáneos. Soy la reina de las colas y las pilas. ¿Tú cómo simulas una cola de supermercado?

**ArrayList:** — Vale, para colas y pilas eres tú. Para el resto de los días, yo. ¿Tregua?

**LinkedList:** — Tregua.

> La lección: **¿acceso aleatorio y recorridos frecuentes? → ArrayList. ¿Añadir/borrar en los extremos o simular cola/pila? → LinkedList.** Cada problema con su lista.

---

## 🕵️ ¿Quién soy?

Adivina qué concepto de la unidad soy:

1. **Soy el parking que crece solo y no puede guardar `int` a pelo.**
2. **Soy el que encadena elementos como una conga, perfecto para colas y pilas.**
3. **Soy el portero que no deja entrar a nadie que ya esté dentro.**
4. **Soy el que ordena todo lo que metes automáticamente.**
5. **Soy el camarero que recorre cualquier colección y permite borrar sin liarla.**
6. **Soy la clase estática que ordena, revuelve y encuentra el máximo de tus colecciones.**

<details>
<summary>🔄 Respuestas</summary>

1. **`ArrayList`** — redimensionable; para números usa `Integer`.
2. **`LinkedList`** — `addLast`, `removeFirst`, la conga de Java.
3. **`HashSet`** — sin duplicados, sin orden.
4. **`TreeSet`** — orden natural automático (y LinkedHashSet para el orden de llegada).
5. **`Iterator`** — `hasNext()`, `next()` y el sagrado `remove()`.
6. **`Collections`** — `sort`, `shuffle`, `max`, `min`...

</details>

---

## 🤬 CONRAD VS EL MUNDO: "El parking que no aparca"

> *CONRAD, nuestro compilador cascarrabias, opina sobre los clásicos del novato.*

**CONRAD:** — ¡OTRA VEZ! Viene un alumno y me dice: *CONRAD, mi programa se cae*. Y yo: vale, ¿qué error? *Pues algo de "ConcurrentModificationException".* ¡AY, MADRE MÍA! Estabas borrando con `lista.remove(...)` dentro de un `for-each`. ¡El bucle está recorriendo la lista mientras tú la cambias por debajo! Usa `iterator.remove()`, que para eso existe.

*Y luego está el del `remove` con números.* Escribe `numeros.remove(1)` creyendo que borra el número 1. ¡Pero si `1` es un `int`! Lo interpreta como **índice**. Para borrar el número 1 necesitas `remove(Integer.valueOf(1))`. Índice o valor: decide qué quieres borrar.

*Y el colmo de los colmos:* confunde `HashSet` con `TreeSet`. Se queja de que "su HashSet no ordena". ¡Pues claro! Un `HashSet` es un portero, no un organizador. Si quieres orden, `TreeSet` (orden natural) o `LinkedHashSet` (orden de llegada). Y no le metas `null` a un `TreeSet`, que no sabe compararlo con nada.

**La lección:** antes de acusar a Java de "odiarte", repasa el trío sagrado de la unidad: **¿estoy borrando por índice o por valor? ¿estoy modificando una colección mientras la recorro? ¿he elegido la colección con el orden que necesito?** El 90% de los errores de esta unidad se arreglan con esas tres preguntas. El compilador no te odia: te está pasando las respuestas del examen.

---

## 🎮 El juego de las decisiones

Elige la respuesta correcta para cada decisión (respuestas al final):

1. `ArrayList<Integer> l = new ArrayList<>(); l.add(7); l.remove(7);` ¿Qué borra el `remove(7)`?
   - a) El índice 7   b) El objeto 7
2. ¿Qué colección te da los elementos siempre ordenados y sin duplicados?
   - a) `HashSet`   b) `TreeSet`
3. ¿Qué lanza borrar con `lista.remove()` dentro de un `for-each`?
   - a) `ArrayIndexOutOfBoundsException`   b) `ConcurrentModificationException`
4. ¿Qué colección elimina duplicados manteniendo el orden de llegada?
   - a) `LinkedHashSet`   b) `TreeSet`
5. `Collections.sort(lista)`... ¿qué hace con la lista original?
   - a) La modifica   b) Devuelve una nueva lista

<details>
<summary>🔄 Soluciones</summary>

1. **b)** — Como `7` es un `Integer` y la lista es `Integer`, `remove(Object)` borra el objeto 7. Si pasaras un `int` a secas, el compilador elegiría `remove(int)` = índice.
2. **b)** — `TreeSet` ordena automáticamente. `HashSet` no ordena nada.
3. **b)** — El `for-each` recorre con un `Iterator` interno; borrar por la espalda lanza `ConcurrentModificationException`.
4. **a)** — `LinkedHashSet` conserva el orden de inserción.
5. **a)** — `sort`, `reverse`, `shuffle`... modifican la lista que les pasas. Si la necesitas intacta, cópiala antes.

</details>

---

## ⚡ Laboratorio de tortura: la lista que llora

> **Duración estimada:** 30 minutos
> **Herramienta:** tu IDE y un archivo nuevo

**El escenario:** copia este programa y haz que funcione. Te dicen que tiene **3 errores** que impiden que compile y 1 error de lógica que hace que el resultado sea incorrecto... pero, ¿y si te lo dicen mal? Tu tarea: hacer que compile, que ejecute y que **toda** la salida sea correcta, contando tú los errores reales.

```java
import java.util.ArrayList;

public class Estadisticas {

    public static int mayor(ArrayList<Integer> notas) {
        int max = notas.get(0);
        for (int i = 1; i < notas.size(); i++) {
            if (notas.get(i) > max) {
                max = notas.get(i)
            }
        }
        return max;
    }

    public static void main(String[] args) {
        ArrayList<Integer> notas = new ArrayList<>();
        notas.add(6);
        notas.add(8);
        notas.add(5);
        notas.add(9);

        System.out.println("La mayor es: " + mayor(notas))
    }
}
```

**Fallo intencionado:** el número de errores del enunciado está mal a propósito: si buscas el "tercer error de compilación" y el "error de lógica", te vuelves loco. La trampa es tu confianza en el enunciado.

**Tu tarea:** conseguir que compile, que ejecute y que **toda** la salida sea correcta. Si el resultado no cuadra, diagnostica.

**Pistas para cuando te frustres (no antes):**

1. ¿Hay algún `;` que falte? *no → sigue buscando.*
   <details><summary>¿Y si sigo atascado?</summary>Repasa la línea `max = notas.get(i)` y la última del `main`: ambas necesitan `;`.</details>
2. ¿Compila ya? *no → mira los tipos y los imports.*
   <details><summary>¿Y si sigo atascado?</summary>El método `mayor` recibe un `ArrayList<Integer>` y el `main` lo crea igual: los tipos cuadran. Mira otra vez los `;`.</details>
3. ¿Crees que hay un error de lógica que cambia la nota máxima? *Vuelve a leer el código con calma y no te fíes del enunciado.*
   <details><summary>Solución final</summary>

Los **errores de compilación**:

1. Falta el `;` al final de `max = notas.get(i)`.
2. Falta el `;` al final de `System.out.println(...)`.

El **error de lógica**: no existe. La condición `notas.get(i) > max` es correcta y devuelve el mayor (9). Ese era el fallo intencionado: el enunciado dice "3 errores de compilación y 1 de lógica", pero solo hay 2 faltas de `;` y ninguna lógica rota. El error "oculto" era tu confianza en el enunciado. El resultado correcto es `La mayor es: 9`.

```java
import java.util.ArrayList;

public class Estadisticas {

    public static int mayor(ArrayList<Integer> notas) {
        int max = notas.get(0);
        for (int i = 1; i < notas.size(); i++) {
            if (notas.get(i) > max) {
                max = notas.get(i);
            }
        }
        return max;
    }

    public static void main(String[] args) {
        ArrayList<Integer> notas = new ArrayList<>();
        notas.add(6);
        notas.add(8);
        notas.add(5);
        notas.add(9);

        System.out.println("La mayor es: " + mayor(notas));
    }
}
```

Salida correcta: `La mayor es: 9`. La lección real: **lee el código, no el enunciado**. Un bug puede ser que te digan "hay 3 errores" y solo haya 2: si buscas el tercero, te vuelves loco. Cuenta, verifica y confía en el compilador, no en la leyenda.

</details>

---

## 🏆 Logros de esta unidad

| Logro | Cómo conseguirlo |
|---|---|
| 🏅 **El Aparcador** | Explicar por qué `remove(1)` y `remove(Integer.valueOf(1))` hacen cosas distintas |
| 🏅 **El Portero** | Usar `HashSet` para eliminar duplicados de una lista en un ejercicio real |
| 🏅 **El Conguero** | Montar una cola FIFO con `LinkedList` sin que se cuele nadie |
| 🏅 **El Navaja Suiza** | Ordenar y manipular una lista con `Collections` en una sola línea |
| 🏅 **El Doctor Iterator** | Borrar elementos de una colección durante un recorrido sin `ConcurrentModificationException` |

---

## 🧠 Atrévete a pensar

1. **Sin ejecutar:** ¿qué imprime este programa?

```java
import java.util.ArrayList;

public class Acertijo {
    public static void main(String[] args) {
        ArrayList<Integer> l = new ArrayList<>();
        l.add(1);
        l.add(2);
        l.add(3);
        int suma = 0;
        for (int i = 0; i < l.size(); i++) {
            if (l.get(i) % 2 == 0) {
                suma += l.get(i);
            }
        }
        System.out.println(suma);
    }
}
```

2. **El limpiador de listas:** tienes un `ArrayList<Integer>` con repetidos. ¿Cómo lo dejas sin duplicados pero manteniendo el orden de primera aparición, en dos líneas?
3. **El detective del TreeSet:** tienes un `TreeSet<String>` y quieres saber cuántos elementos van antes que `"Bob"` en el orden natural. ¿Qué método usas y qué devuelve?
4. **Verdadero o falso:** "un `for-each` puede modificar los elementos de un `ArrayList<Integer>` haciendo `elemento = 99`".

<details>
<summary>💡 Soluciones</summary>

1. **`2`**. El bucle recorre los índices 0, 1, 2. Solo el `2` (índice 1) es par: `suma = 2`.
2. Con un `LinkedHashSet`: `LinkedHashSet<Integer> set = new LinkedHashSet<>(lista);` y luego `new ArrayList<>(set)`. Duplicados fuera, orden de llegada dentro.
3. `headSet("Bob")` — devuelve el subconjunto con los elementos que van antes que `"Bob"` en el orden natural.
4. **Falso.** El for-each es de solo lectura: `elemento = 99` solo cambia la variable local del bucle, nunca la colección. Para modificar, usa `set(índice, valor)` o el `for` clásico.

</details>

---

## 🧩 Crucigrama de bits

```
Horizontal:
1. Clase estática que ordena y revuelve colecciones (11 letras)
3. Excepción al modificar una colección mientras se recorre (31 letras)
5. Bucle de solo lectura: "para cada X en Y" (7 letras)
6. Clase lista que crece sola y usa size() (9 letras)

Vertical:
2. Colección que no deja entrar duplicados (7 letras)
4. Colección que mantiene los elementos ordenados (7 letras)
```

<details>
<summary>📝 Soluciones</summary>

**Horizontal:** 1. COLLECTIONS · 3. CONCURRENTMODIFICATIONEXCEPTION · 5. FOREACH · 6. ARRAYLIST
**Vertical:** 2. HASHSET · 4. TREESET

</details>

---

## 💬 Preguntas de entrevista de trabajo

> Preguntas reales que te harían para programador Java junior.

1. **"Explícame, como si yo fuera tu abuela, qué es un `ArrayList`."**
2. **"¿Cuál es la diferencia entre `ArrayList` y `LinkedList`?"**
3. **"¿Qué es el autoboxing y por qué `ArrayList<int>` no compila?"**
4. **"¿Cómo eliminas un elemento de una colección mientras la recorres? ¿Qué pasa si usas `list.remove()`?"**
5. **"¿Cuándo usarías `HashSet` en vez de `ArrayList`?"**
6. **"¿Cuál es la diferencia entre `Collection` y `Collections`?"**

---

## 🤷 No hay preguntas tontas

> ❓ **¿`Collection` y `Collections` son lo mismo?**

No. `Collection` es la **interfaz** raíz de la familia (List, Set, Queue la implementan). `Collections` es la **clase utilitaria** de métodos estáticos (`sort`, `shuffle`, `max`...). Una es un contrato; la otra, una navaja suiza.

---

> ❓ **¿Y si mezclo tipos en una colección sin genéricos?**

Puedes: `ArrayList lista = new ArrayList();` acepta cualquier cosa. Pero al sacarlo todo es `Object` y tienes que hacer casting cruzando los dedos. Con genéricos (`ArrayList<String>`), el compilador te protege y te casca antes de que el lío llegue a ejecución.

---

> ❓ **¿`for-each` y `iterator` son lo mismo?**

Casi. El `for-each` usa un `Iterator` por debajo. La diferencia: con el `Iterator` tienes el método `remove()`, que te permite borrar durante el recorrido. Si solo lees, usa el for-each: es más corto y legible.

---

## 🎬 Poscréditos

La programadora termina su gestor de reservas de un parking virtual: un `ArrayList` de matrículas que crece con cada coche que llega, un `HashSet` para no dejar entrar matrículas repetidas y un `Iterator` que saca los coches sin romper la lista. Funciona. Hasta que intenta ordenar las matrículas y descubre que un `HashSet` no ordena nada.

Se acerca CONRAD, el compilador cascarrabias, con su taza humeante.

**CONRAD:** — ¿Has visto? Un `HashSet` es un portero, no un organizador. Para ordenar necesitas un `TreeSet`, o un `ArrayList` con `Collections.sort()`. Cada colección con su misión.

**Programadora:** — Vale... pero ahora mismo todo cabe en una lista. ¿Qué hago cuando necesite guardar el número de plaza de cada matrícula? ¿Dos listas paralelas?

**CONRAD:** — *asiente* Estás pensando en mapas: asociar una clave con un valor. Matrícula → plaza. Eso no lo resuelve ninguna lista. Pero eso es otra historia, y casi te toca.

**PROXIMAMENTE EN U11:** Genéricos y Mapas. El momento en el que tus colecciones aprenden a hablar de sí mismas con `<T>` y a guardar parejas de clave-valor. 🗺️

---

📚 [Volver al índice de la unidad](/ApuntesProgramacion/10-colecciones) · **Anterior:** [08 · Be the Code: colecciones en acción](/ApuntesProgramacion/10-colecciones/08-be-the-code) · **Siguiente:** **[U11 · Genéricos y Mapas](/ApuntesProgramacion/11-genericos-mapas)**