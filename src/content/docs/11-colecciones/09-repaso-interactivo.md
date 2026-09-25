---
title: "09 · Repaso interactivo: colecciones, genéricos y mapas"
description: "El cierre práctico de la unidad: un remove() que lo va a liar todo, un HashMap que sobrescribe y un bucle que va a explotar 😈"
---

<p><small>El cierre práctico de la unidad: un remove() que lo va a liar todo, un HashMap que sobrescribe y un bucle que va a explotar 😈</small></p>

> 🗺️ **Estás en:** 📚 **U11 · Colecciones, genéricos y mapas** → 09 · Repaso interactivo

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

Y ahora la versión mapa, con trampa doble:

```java
import java.util.*;

public class MisterioMapa {
    public static void main(String[] args) {
        HashMap<String, Integer> m = new HashMap<>();
        m.put("Ana", 3);
        m.put("Bob", 5);
        m.put("Ana", m.get("Ana") + 2);

        TreeMap<Integer, String> ordenado = new TreeMap<>();
        for (Map.Entry<String, Integer> e : m.entrySet()) {
            ordenado.put(e.getValue(), e.getKey());
        }

        System.out.println(ordenado.firstKey() + " " + m.size());
    }
}
```

**¿Qué imprime este segundo programa?**

1. **`3 3`** → El `put("Ana", m.get("Ana") + 2)` añade otra entrada y el mapa tiene 3. ❌
2. **`5 2`** → ✅ ¡Correcto! `Ana` pasa de 3 a 5 (3 + 2), `Bob` sigue en 5, el mapa tiene 2 entradas, y el TreeMap de claves numéricas tiene `{5 → Ana, 5 → Bob}` donde el segundo `put` sobrescribe: primera clave = 5.
3. **`Bob 2`** → El TreeMap guarda el valor como clave y el nombre como valor, y `firstKey()` devuelve el valor. ❌

> <details>
> <summary>🔄 Solución</summary>
>
> La opción **2**. Primero `Ana = 3 + 2 = 5`, así que el HashMap queda `{Ana=5, Bob=5}` y `size()` es 2. Luego el TreeMap se construye con `put(valor, clave)`: `put(5, "Ana")` y `put(5, "Bob")` sobrescribe, dejando `{5=Bob}`. `firstKey()` devuelve la menor clave numérica: `5`. Salida: `5 2`. Fíjate en las dos trampas juntas: `put` que sobrescribe y TreeMap que ordena por clave (aquí, la clave es el número).
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

## 🔥 Fireside Chat: el Genérico vs el Tipo Crudo

> *Dos maneras de declarar una lista se encuentran frente a la misma máquina de café.*

**Genérico:** — Mira, yo me llamo `ArrayList<String>`. Sé exactamente qué hay dentro, el compilador me protege y no me hacen falta castings. Voy por la vida con la conciencia tranquila.

**Tipo Crudo:** — ¡Ja! Yo soy `ArrayList` a secas. Meto lo que quiero, saco lo que puedo y si algo explota, es que el programador no sabía lo que hacía. Libertad total.

**Genérico:** — ¿Libertad? A ti, la primera vez que metes un `Integer` donde iba un `String`, se te rompe el programa en producción. Yo detecto ese error en compilación, cuando todavía estás a tiempo de arreglarlo.

**Tipo Crudo:** — Vale, vale... pero los genéricos son más difíciles de escribir. Ese `<T>` por todas partes...

**Genérico:** — Desde Java 7 el diamante `<>` lo infiere todo, y los genéricos desaparecen al compilar (type erasure). No cuestan ni un céntimo de rendimiento. Tú eres el que paga: con castings y `ClassCastException`.

**Tipo Crudo:** — Tregua. Reconozco que soy solo para código antiguo.

**Genérico:** — Hecho. Y por el amor de Java, no escribas `new ArrayList()` sin los `< >`.

> La lección: **usa siempre genéricos con diamante `<>`. El tipo crudo es una reliquia que solo da sustos.** El compilador no te odia: te está protegiendo.

---

## 🕵️ ¿Quién soy?

Adivina qué concepto de la unidad soy:

1. **Soy el parking que crece solo y no puede guardar `int` a pelo.**
2. **Soy el que encadena elementos como una conga, perfecto para colas y pilas.**
3. **Soy el portero que no deja entrar a nadie que ya esté dentro.**
4. **Soy el que ordena todo lo que metes automáticamente.**
5. **Soy el camarero que recorre cualquier colección y permite borrar sin liarla.**
6. **Soy la clase estática que ordena, revuelve y encuentra el máximo de tus colecciones.**
7. **Soy el comodín que significa "cualquier tipo" y limita a una jerarquía cuando le pongo `extends`.**
8. **Soy el operador perezoso que evita repetir el tipo dos veces.**
9. **Soy el mago que borra los genéricos cuando el código se compila.**
10. **Soy el mapa rapidísimo que no garantiza ningún orden.**
11. **Soy el mapa que ordena las claves automáticamente.**
12. **Soy el método que funciona para cualquier tipo gracias a su `<T>` propio.**

<details>
<summary>🔄 Respuestas</summary>

1. **`ArrayList`** — redimensionable; para números usa `Integer`.
2. **`LinkedList`** — `addLast`, `removeFirst`, la conga de Java.
3. **`HashSet`** — sin duplicados, sin orden.
4. **`TreeSet`** — orden natural automático (y LinkedHashSet para el orden de llegada).
5. **`Iterator`** — `hasNext()`, `next()` y el sagrado `remove()`.
6. **`Collections`** — `sort`, `shuffle`, `max`, `min`...
7. El **wildcard** (`?`) — `? extends Number` acepta cualquier subtipo.
8. El **diamante** `<>` — `new Caja<>()` infiere el tipo.
9. El **type erasure** — borra los genéricos y añade castings en el bytecode.
10. **`HashMap`** — O(1) pero sin orden.
11. **`TreeMap`** — árbol rojo-negro con `firstKey()`, `headMap()`...
12. El **método genérico** — `public static <T> void imprimir(T x)`.

</details>

---

## 🤬 CONRAD VS EL MUNDO: "El parking que no aparca"

> *CONRAD, nuestro compilador cascarrabias, opina sobre los clásicos del novato.*

**CONRAD:** — ¡OTRA VEZ! Viene un alumno y me dice: *CONRAD, mi programa se cae*. Y yo: vale, ¿qué error? *Pues algo de "ConcurrentModificationException".* ¡AY, MADRE MÍA! Estabas borrando con `lista.remove(...)` dentro de un `for-each`. ¡El bucle está recorriendo la lista mientras tú la cambias por debajo! Usa `iterator.remove()`, que para eso existe.

*Y luego está el del `remove` con números.* Escribe `numeros.remove(1)` creyendo que borra el número 1. ¡Pero si `1` es un `int`! Lo interpreta como **índice**. Para borrar el número 1 necesitas `remove(Integer.valueOf(1))`. Índice o valor: decide qué quieres borrar.

*Y el colmo de los colmos:* confunde `HashSet` con `TreeSet`. Se queja de que "su HashSet no ordena". ¡Pues claro! Un `HashSet` es un portero, no un organizador. Si quieres orden, `TreeSet` (orden natural) o `LinkedHashSet` (orden de llegada). Y no le metas `null` a un `TreeSet`, que no sabe compararlo con nada.

**La lección:** antes de acusar a Java de "odiarte", repasa el trío sagrado de la unidad: **¿estoy borrando por índice o por valor? ¿estoy modificando una colección mientras la recorro? ¿he elegido la colección con el orden que necesito?** El 90% de los errores de esta unidad se arreglan con esas tres preguntas. El compilador no te odia: te está pasando las respuestas del examen.

---

Y cuando ya creías que CONRAD estaba calmado, llega el del mapa:

**CONRAD:** — ¡OTRA VEZ! Un alumno me enseña su agenda y se queja: *"CONRAD, se me ha perdido un contacto"*. Y yo: ¿lo añadiste con `put` usando el mismo nombre dos veces? *"Pues sí, ¿por?"* ¡AY, MADRE MÍA! ¡En un HashMap las claves son únicas! El segundo `put("Ana", ...)` SOBRESCRIBE al primero. Es como tachar un número en tu agenda para poner otro: el anterior se fue para siempre. Si quieres conservar varios, usa `HashMap<String, List<String>>`.

*Y luego está el que pregunta "¿por qué no ordena mi HashMap?"* ¡Pues claro que no ordena! Es un HashMap, el rey de la velocidad, no un bibliotecario. Si quieres orden, `TreeMap`. Si quieres orden de llegada, `LinkedHashMap`. Cada mapa con su superpoder.

*Y el colmo de los colmos:* el que escribe `Caja<int>` y espera que compile. ¡No se puede! Los genéricos solo aceptan objetos: usa `Integer` y deja que el autoboxing haga su magia. Y no me vengas con el `get` de una clave que no existe: devuelve `null`. Usa `getOrDefault`, que para eso está.

**La lección:** repasa el trío sagrado del lado de los mapas: **¿estoy sobrescribiendo una clave con `put`? ¿he elegido el mapa con el orden que necesito? ¿estoy guardando un primitivo donde solo caben objetos?** El compilador no te odia: te está pasando las respuestas del examen.

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
6. `mapa.put("Ana", 10); mapa.put("Ana", 20);` ¿Qué hace el segundo `put`?
   - a) Añade otra entrada   b) Sobrescribe el valor de "Ana" a 20
7. `Caja<int>`... ¿compila?
   - a) Sí   b) No: los genéricos no aceptan primitivos
8. `mapa.get("NoExisto")` devuelve...
   - a) `null`   b) 0   c) Una excepción
9. ¿Qué mapa te da las claves siempre ordenadas alfabéticamente?
   - a) `HashMap`   b) `TreeMap`
10. ¿Puedes añadir un elemento a una `List<? extends Number>`?
    - a) Sí, cualquier Number   b) No (solo `null`)
11. En runtime, ¿`ArrayList<String>` y `ArrayList<Integer>` son la misma clase?
    - a) Sí, gracias al type erasure   b) No, son clases distintas

<details>
<summary>🔄 Soluciones</summary>

1. **b)** — Como `7` es un `Integer` y la lista es `Integer`, `remove(Object)` borra el objeto 7. Si pasaras un `int` a secas, el compilador elegiría `remove(int)` = índice.
2. **b)** — `TreeSet` ordena automáticamente. `HashSet` no ordena nada.
3. **b)** — El `for-each` recorre con un `Iterator` interno; borrar por la espalda lanza `ConcurrentModificationException`.
4. **a)** — `LinkedHashSet` conserva el orden de inserción.
5. **a)** — `sort`, `reverse`, `shuffle`... modifican la lista que les pasas. Si la necesitas intacta, cópiala antes.
6. **b)** — Las claves de un Map son únicas; `put` sobrescribe.
7. **b)** — `int` es primitivo; se usa `Integer` con autoboxing.
8. **a)** — `get` devuelve `null` si la clave no existe (no lanza excepción).
9. **b)** — `TreeMap` ordena por clave; `HashMap` no ordena nada.
10. **b)** — `? extends Number` es de solo lectura (PECS: Producer Extends).
11. **a)** — El type erasure borra los genéricos en el bytecode: ambos son `ArrayList`.

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

## ⚡ Laboratorio de tortura: la media que llora

> **Duración estimada:** 30 minutos
> **Herramienta:** tu IDE y un archivo nuevo

**El escenario:** el mismo juego, ahora con genéricos y mapas. Te dicen que tiene **3 errores** de compilación y 1 de lógica... ¿te lo crees?

```java
import java.util.*;

public class Estadisticas {

    public static <T extends Number> double media(List<T> numeros) {
        double suma = 0;
        for (T n : numeros) {
            suma += n.doubleValue()
        }
        return suma / numeros.size();
    }

    public static void main(String[] args) {
        ArrayList<Integer> notas = new ArrayList<>();
        notas.add(6);
        notas.add(8);
        notas.add(5);
        notas.add(9);

        HashMap<String, Double> resultado = new HashMap<>();
        resultado.put("media", media(notas))
        System.out.println(resultado.get("media"));
    }
}
```

**Pistas para cuando te frustres (no antes):**

1. ¿Hay algún `;` que falte? *no → sigue buscando.*
   <details><summary>¿Y si sigo atascado?</summary>Repasa la línea `suma += n.doubleValue()` y la última del `main`: ambas necesitan `;`.</details>
2. ¿Compila ya? *no → mira los tipos y los imports.*
   <details><summary>¿Y si sigo atascado?</summary>El método `media` recibe `List<T>` con `T extends Number`, y el `main` le pasa un `ArrayList<Integer>`: los tipos cuadran (los wildcards no hacen falta porque `T` se deduce). Mira otra vez los `;`.</details>
3. ¿Crees que hay un error de lógica que cambia la media? *Vuelve a leer el código con calma y no te fíes del enunciado.*
   <details><summary>Solución final</summary>

   Los **errores de compilación**:

   1. Falta el `;` al final de `suma += n.doubleValue()`.
   2. Falta el `;` al final de `resultado.put(...)`.

   El **error de lógica**: no existe. `media` recorre la lista, acumula con `doubleValue()` (funciona para cualquier `Number`) y divide entre el tamaño: `(6+8+5+9)/4 = 7.0`. Ese era el fallo intencionado: el enunciado dice "3 errores de compilación y 1 de lógica", pero solo hay 2 faltas de `;` y ninguna lógica rota. El error "oculto" era tu confianza en el enunciado. El resultado correcto es `7.0`.

   ```java
   import java.util.*;

   public class Estadisticas {

       public static <T extends Number> double media(List<T> numeros) {
           double suma = 0;
           for (T n : numeros) {
               suma += n.doubleValue();
           }
           return suma / numeros.size();
       }

       public static void main(String[] args) {
           ArrayList<Integer> notas = new ArrayList<>();
           notas.add(6);
           notas.add(8);
           notas.add(5);
           notas.add(9);

           HashMap<String, Double> resultado = new HashMap<>();
           resultado.put("media", media(notas));
           System.out.println(resultado.get("media"));
       }
   }
   ```

   Salida correcta: `7.0`. La lección real: **lee el código, no el enunciado**. Cuenta, verifica y confía en el compilador, no en la leyenda.

   </details>

---

## 🏆 Logros de esta unidad

| Logro | Cómo conseguirlo |
|---|---|
| 🏅 **El Aparcador** | Explicar por qué `remove(1)` y `remove(Integer.valueOf(1))` hacen cosas distintas |
| 🏅 **El Portero** | Usar `HashSet` para eliminar duplicados de una lista en un ejercicio real |
| 🏅 **El Conguero** | Montar una cola FIFO con `LinkedList` sin que se cuele nadie |
| 🏅 **El Doctor Iterator** | Borrar elementos de una colección durante un recorrido sin `ConcurrentModificationException` |
| 🏅 **El Tipógrafo** | Explicar por qué `ArrayList<String>` rechaza un `int` sin necesidad de casting |
| 🏅 **El Cajero** | Crear tu propia clase genérica `Caja<T>` y usarla con dos tipos distintos |
| 🏅 **El Mago** | Explicar el type erasure y el diamante `<>` como si fuera un truco de magia |
| 🏅 **El Guía Telefónico** | Recorrer un `HashMap` con `entrySet()` y contar frecuencias con `getOrDefault` |
| 🏅 **El Estratega** | Elegir entre Map, List y Set justificando la elección con argumentos |

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
5. **Sin ejecutar:** ¿qué imprime este programa?

```java
import java.util.HashMap;

public class AcertijoMapa {
    public static void main(String[] args) {
        HashMap<String, Integer> m = new HashMap<>();
        for (char c : "casa".toCharArray()) {
            m.put(String.valueOf(c), m.getOrDefault(String.valueOf(c), 0) + 1);
        }
        System.out.println(m.get("a") + " " + m.size());
    }
}
```

6. **El contador de palabras ordenado:** tienes un `String[]` de palabras y quieres mostrar cada palabra con su frecuencia, en orden alfabético. ¿Qué estructura usas y con qué bucle?
7. **El detective del erasure:** ¿por qué no puedes escribir `new T()` dentro de una clase genérica, aunque te hayas pasado por el `<T>`?
8. **Verdadero o falso:** "un `HashMap` garantiza el orden en el que introduces las claves".

<details>
<summary>💡 Soluciones</summary>

1. **`2`**. El bucle recorre los índices 0, 1, 2. Solo el `2` (índice 1) es par: `suma = 2`.
2. Con un `LinkedHashSet`: `LinkedHashSet<Integer> set = new LinkedHashSet<>(lista);` y luego `new ArrayList<>(set)`. Duplicados fuera, orden de llegada dentro.
3. `headSet("Bob")` — devuelve el subconjunto con los elementos que van antes que `"Bob"` en el orden natural.
4. **Falso.** El for-each es de solo lectura: `elemento = 99` solo cambia la variable local del bucle, nunca la colección. Para modificar, usa `set(índice, valor)` o el `for` clásico.
5. **`2 3`**. "casa" tiene c=1, a=2, s=1. `get("a")` = 2 y `size()` = 3 (tres claves distintas: c, a, s).
6. Un **`TreeMap<String, Integer>`** (claves ordenadas solas) recorrido con `entrySet()`: cada entrada es la palabra y su cuenta.
7. Porque en compilación Java no sabe qué es `T`, y en runtime el type erasure lo ha borrado: no hay forma de instanciar un tipo que ya no existe.
8. **Falso.** `HashMap` no garantiza orden. Para orden de inserción usa `LinkedHashMap`; para orden natural, `TreeMap`.

</details>

---

## 🧩 Crucigrama de bits

**Colecciones:**

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
<summary>📝 Soluciones (colecciones)</summary>

**Horizontal:** 1. COLLECTIONS · 3. CONCURRENTMODIFICATIONEXCEPTION · 5. FOREACH · 6. ARRAYLIST
**Vertical:** 2. HASHSET · 4. TREESET

</details>

**Genéricos y mapas:**

```
Horizontal:
1. Mapa que ordena las claves automáticamente (7 letras)
3. Operador perezoso que infiere el tipo en `new ArrayList<>()` (7 letras)
5. Método que devuelve un valor por defecto si la clave no existe (12 letras)
6. Mapa rapidísimo que no garantiza orden (7 letras)

Vertical:
2. Proceso que borra los genéricos al compilar (12 letras)
4. Estructura que asocia claves con valores (3 letras)
```

<details>
<summary>📝 Soluciones (genéricos y mapas)</summary>

**Horizontal:** 1. TREEMAP · 3. DIAMANTE · 5. GETORDEFAULT · 6. HASHMAP
**Vertical:** 2. TYPEERASURE · 4. MAP

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
7. **"Explícame, como si yo fuera tu abuela, qué es un `HashMap`."**
8. **"¿Qué es el type erasure y por qué es importante?"**
9. **"¿Cuál es la diferencia entre `? extends T` y `? super T`? ¿Qué es PECS?"**
10. **"¿Por qué `List<Number>` no acepta una `List<Integer>`?"**
11. **"¿Cuándo usarías un `TreeMap` en vez de un `HashMap`?"**
12. **"¿Puedes crear un array de genéricos? ¿Y hacer `new T()`? ¿Por qué?"**

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

> ❓ **¿`Map` es una `Collection`?**

No. `Map` no hereda de la interfaz `Collection` (aunque vive en `java.util`). `List` y `Set` son `Collection`; `Map` es una familia aparte que asocia claves con valores. Es un error muy típico: "las colecciones de Java" incluyen a los tres, pero técnicamente `Map` no implementa `Collection`.

---

> ❓ **¿Los genéricos ralentizan mi programa?**

No. Java aplica **type erasure**: el compilador borra toda la información genérica y la convierte en castings normales. En runtime no hay genéricos, así que no hay coste extra. Es solo azúcar sintáctico en compilación.

---

> ❓ **¿Wildcard o parámetro de tipo? ¿Cuándo uso cada uno?**

Usa el **parámetro de tipo `<T>`** cuando necesites el tipo más de una vez (devolverlo, guardarlo en una variable, dos argumentos del mismo tipo). Usa el **wildcard `?`** cuando solo te importe la colección en sí (leer o escribir sin nombrar el tipo). Si tienes dudas: "¿necesito nombrar el tipo?" → parámetro de tipo; "¿me da igual cuál sea?" → wildcard.

---

## 🎬 Poscréditos

La programadora termina su agenda telefónica: un `HashMap<String, String>` con nombre → número, un `TreeMap` que le ordena los contactos alfabéticamente y un `getOrDefault` que evita los `null` cuando busca a alguien que no existe. Todo perfecto... hasta que cierra el programa y su agenda desaparece.

Se acerca CONRAD, el compilador cascarrabias, con su taza humeante.

**CONRAD:** — ¿Has visto? Todo vive en memoria RAM. Cierras la app y adiós, agenda. Un mapa es fantástico para guardar datos mientras el programa corre, pero para que sobreviva al reinicio necesitas algo más.

**Programadora:** — ¿Guardarlo en un archivo? ¿Como un fichero de texto en el disco?

**CONRAD:** — *asiente* Exacto. Ficheros, serialización, y cuando los datos crezcan, expresiones regulares para buscar patrones. Todo eso es otra historia... y casi te toca.

**PRÓXIMAMENTE EN U13:** Ficheros y expresiones regulares (Regex). Guarda tus mapas y tus listas en disco y busca patrones con expresiones regulares. 📁

---

📚 [Volver al índice de la unidad](/ApuntesProgramacion/11-colecciones) · **Anterior:** [08 · TreeMap y cómo elegir estructura](/ApuntesProgramacion/11-colecciones/08-treemap-elegir-estructura) · **Siguiente:** **[U12 · Programación funcional (Streams y Lambdas)](/ApuntesProgramacion/12-programacion-funcional)**
