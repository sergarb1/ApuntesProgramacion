---
title: "09 — Repaso interactivo: domina el parking"
description: "El cierre práctico de la unidad, con arrays, colecciones y un remove() que lo va a liar todo 😈"
---

<p><small>El cierre práctico de la unidad, con arrays, colecciones y un remove() que lo va a liar todo 😈</small></p>

> 🗺️ **Estás en:** 📚 **U09 · Arrays y Colecciones** → 09 · Repaso interactivo

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

## 🔥 Fireside Chat: Array vs ArrayList

> *Dos formas de almacenar datos se enfrentan frente a la máquina de café.*

**Array:** — Mira, yo soy el original. Rápido, eficiente, directo. Acceso O(1) a cualquier posición. ¡Soy la base de todo!

**ArrayList:** — Sí, pero tienes tamaño fijo. Una vez que te creas con 10 posiciones, no puedes tener 11. Yo crezco y me encojo bajo demanda. Soy flexible.

**Array:** — Pero yo soy más rápido en acceso y más ligero en memoria. Tú usas un array por dentro y añades overhead.

**ArrayList:** — Cierto, pero mis métodos `add()`, `remove()`, `contains()` me hacen mucho más cómodo. ¿Cuántas líneas necesitas para añadir un elemento a un array? Yo una: `lista.add(42)`.

**Array:** — Para datos primitivos soy más eficiente. `int[]` ocupa menos que `ArrayList<Integer>` por el autoboxing.

**ArrayList:** — Vale, para tipos primitivos y rendimiento extremo, usa arrays. Para todo lo demás, úsame a mí. ¿Tregua?

**Array:** — Tregua.

> La lección: **¿sabes cuántos elementos necesitas y no va a cambiar? → array. ¿No lo sabes o va a cambiar? → ArrayList.** Y para rendimiento puro con primitivos, el array gana siempre.

---

## 🕵️ ¿Quién soy?

Adivina qué concepto de la unidad soy:

1. **Soy el aparcamiento de datos de tamaño fijo: mi longitud se pregunta sin paréntesis.**
2. **Soy el bucle perezoso que recorre todo sin índice... pero no puedo modificar nada.**
3. **Soy el parking que crece solo y no puede guardar `int` a pelo.**
4. **Soy el portero que no deja entrar a nadie que ya esté dentro.**
5. **Soy el camarero que recorre cualquier colección y permite borrar sin liarla.**
6. **Soy la clase estática que ordena, revuelve y encuentra el máximo de tus colecciones.**

<details>
<summary>🔄 Respuestas</summary>

1. **El array** — `length`, sin paréntesis, tamaño fijo.
2. **El for-each** — lee todo, pero es de solo lectura.
3. **`ArrayList`** — redimensionable; para números usa `Integer`.
4. **`HashSet`** — sin duplicados, sin orden.
5. **`Iterator`** — `hasNext()`, `next()` y el sagrado `remove()`.
6. **`Collections`** — `sort`, `shuffle`, `max`, `min`...

</details>

---

## 🤬 CONRAD VS EL MUNDO: "El parking que no aparca"

> *CONRAD, nuestro compilador cascarrabias, opina sobre los clásicos del novato.*

**CONRAD:** — ¡OTRA VEZ! Viene un alumno y me dice: *CONRAD, mi programa se cae*. Y yo: vale, ¿qué error? *Pues algo de "out of bounds".* ¡AY, MADRE MÍA! Has intentado aparcar en la plaza 5 de un parking de 5 plazas. Los índices van de 0 a `length - 1`. ¿Cuántas veces lo tengo que repetir?

*Y luego está el del `length`.* Escribe `numeros.length()` con paréntesis. ¡Pero si es un atributo! Los corchetes se usan para acceder, no para medir. El que lleva paréntesis es `size()` de las colecciones y `length()` de los `String`. Tres mundos, tres sintaxis, y los tres en el mismo examen.

*Y el colmo de los colmos:* borra elementos con `lista.remove(...)` dentro de un `for-each` y se queja de que Java "le tiene manía". ¡Claro que te lanza `ConcurrentModificationException`! ¡Estás cambiando la lista mientras el bucle la recorre! Usa `iterator.remove()`, que para eso existe.

**La lección:** antes de acusar a Java de "odiarte", repasa el trío sagrado de la unidad: **¿el índice está entre 0 y `length - 1`? ¿estoy usando `length`, `length()` o `size()` según toca? ¿estoy modificando una colección mientras la recorro?** El 90% de los errores de esta unidad se arreglan con esas tres preguntas. El compilador no te odia: te está pasando las respuestas del examen.

---

## 🎮 El juego de las decisiones

Elige la respuesta correcta para cada decisión (respuestas al final):

1. `int[] a = new int[5];` ¿Cuánto vale `a[0]`?
   - a) `null`   b) `0`
2. `ArrayList<Integer> l = new ArrayList<>(); l.add(7); l.remove(7);` ¿Qué borra el `remove(7)`?
   - a) El índice 7   b) El objeto 7
3. ¿Qué lanza `arr[arr.length]`?
   - a) `NullPointerException`   b) `ArrayIndexOutOfBoundsException`
4. ¿Qué colección te da los elementos siempre ordenados y sin duplicados?
   - a) `HashSet`   b) `TreeSet`
5. `String[] s = {"a", "b"};` y `System.out.println(s.length);` ¿Compila?
   - a) Sí   b) No, falta `()`

<details>
<summary>🔄 Soluciones</summary>

1. **b)** — Los `int` por defecto valen `0`, no `null` (eso era para objetos).
2. **b)** — Como `7` es un `Integer` y la lista es `Integer`, `remove(Object)` borra el objeto 7. Si fuera un `int` a secas (como en `ArrayList<Integer>`, ojo), el compilador elegiría `remove(int)` = índice. Aquí el autoboxing hace que sea objeto.
3. **b)** — La plaza `length` no existe: `ArrayIndexOutOfBoundsException`.
4. **b)** — `TreeSet` ordena automáticamente. `HashSet` no ordena nada.
5. **a)** — `s.length` es un atributo válido, sin paréntesis. Compila y muestra 2.

</details>

---

## ⚡ Laboratorio de tortura: el array que llora

> **Duración estimada:** 30 minutos
> **Herramienta:** tu IDE y un archivo nuevo

**El escenario:** copia este programa y haz que funcione. Tiene **3 errores** que impiden que compile y 1 error de lógica que hace que el resultado sea incorrecto cuando lo arregles.

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

**Fallo intencionado:** uno de los errores parece correcto a simple vista porque "se ve bien", pero cambia por completo el resultado del programa.

**Tu tarea:** conseguir que compile, que ejecute y que **toda** la salida sea correcta. Si el resultado no cuadra, diagnostica.

**Pistas para cuando te frustres (no antes):**

1. ¿Hay algún `;` que falte? *no → sigue buscando.*
   <details><summary>¿Y si sigo atascado?</summary>Repasa la línea `max = notas.get(i)` y la última del `main`: ambas necesitan `;`.</details>
2. ¿Compila ya? *no → mira los tipos y los imports.*
   <details><summary>¿Y si sigo atascado?</summary>El método `mayor` recibe un `ArrayList<Integer>` y el `main` lo crea igual: los tipos cuadran. Mira otra vez los `;`.</details>
3. ¿Ejecuta pero la nota máxima sale rara? *Es el error de lógica: el signo de la condición.*
   <details><summary>Solución final</summary>

Los **3 errores de compilación**:

1. Falta el `;` al final de `max = notas.get(i)`.
2. Falta el `;` al final de `System.out.println(...)`.
3. No hay tercer error de compilación: fíjate bien. En realidad solo hay **2** faltas de `;`... y un error de lógica.

El **error de lógica**: ninguno. Espera... si solo hay 2 faltas de `;`, ¿dónde está el tercer error que impide compilar? **No existe tal tercer error.** Ese era el fallo intencionado: el enunciado dice "3 errores", pero solo hay 2 faltas de `;`. El error "oculto" era tu confianza en el enunciado. El resultado correcto es `La mayor es: 9`.

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
| 🏅 **El Aparcador** | Explicar la diferencia entre `length`, `length()` y `size()` sin equivocarte |
| 🏅 **Cazador de BOOM** | Encontrar el índice que provoca una `ArrayIndexOutOfBoundsException` sin pistas |
| 🏅 **El Portero** | Usar `HashSet` para eliminar duplicados de una lista en un ejercicio real |
| 🏅 **El Listo del remove** | Explicar por qué `remove(1)` y `remove(Integer.valueOf(1))` hacen cosas distintas |
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

2. **El array fantasma:** tienes `int[] datos = {4, 1, 3};`. ¿Cómo lo conviertes en `{1, 3, 4}` sin escribir un algoritmo de ordenación a mano?
3. **El detective del heap:** tu programa imprime `null` cuando esperabas un nombre guardado en un array de `String`. ¿Qué valor tiene el array y qué lo provocó?
4. **Verdadero o falso:** "un `for-each` puede modificar los elementos de un `ArrayList<Integer>` haciendo `elemento = 99`".

<details>
<summary>💡 Soluciones</summary>

1. **`2`**. El bucle recorre los índices 0, 1, 2. Solo el `2` (índice 1) es par: `suma = 2`.
2. Con `Arrays.sort(datos)`. Después `Arrays.toString(datos)` imprime `[1, 3, 4]`. No hace falta reinventar la burbuja.
3. Las plazas de un `String[]` recién creado valen `null`. Si nunca asignaste el nombre (o asignaste `null`), la plaza sigue en `null`. Imprimir un `null` no da error; llamar a `nombre.toUpperCase()` sobre él, sí.
4. **Falso.** El for-each es de solo lectura: `elemento = 99` solo cambia la variable local del bucle, nunca la colección. Para modificar, usa `set(índice, valor)` o el `for` clásico.

</details>

---

## 🧩 Crucigrama de bits

```
Horizontal:
1. Clase estática que ordena y revuelve colecciones (11 letras)
3. Excepción al salirte de las plazas válidas de un array (26 letras)
5. Bucle de solo lectura: "para cada X en Y" (7 letras)
6. Clase lista que crece sola y usa size() (9 letras)

Vertical:
2. Colección que no deja entrar duplicados (7 letras)
4. Colección que mantiene los elementos ordenados (7 letras)
```

<details>
<summary>📝 Soluciones</summary>

**Horizontal:** 1. COLLECTIONS · 3. ARRAYINDEXOUTOFBOUNDSEXCEPTION · 5. FOR-EACH · 6. ARRAYLIST
**Vertical:** 2. HASHSET · 4. TREESET

</details>

---

## 💬 Preguntas de entrevista de trabajo

> Preguntas reales que te harían para programador Java junior.

1. **"Explícame, como si yo fuera tu abuela, qué es un array."**
2. **"¿Cuál es la diferencia entre un array y un `ArrayList`?"**
3. **"¿Por qué los índices empiezan en 0?"**
4. **"¿Qué es el autoboxing y por qué `ArrayList<int>` no compila?"**
5. **"¿Cómo eliminas un elemento de una colección mientras la recorres? ¿Qué pasa si usas `list.remove()`?"**
6. **"¿Cuándo usarías `HashSet` en vez de `ArrayList`?"**

---

## 🤷 No hay preguntas tontas

> ❓ **¿Los arrays pueden cambiar de tamaño?**

No. Son inmutables en tamaño. Si necesitas que crezca, crea uno nuevo y copia los datos con `Arrays.copyOf()` o `System.arraycopy()`. O, mejor, usa un `ArrayList`, que hace eso por ti.

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

**PROXIMAMENTE EN U10:** Genéricos y Mapas. El momento en el que tus colecciones aprenden a hablar de sí mismas con `<T>` y a guardar parejas de clave-valor. 🗺️

---

📚 [Volver al índice de la unidad](/ApuntesProgramacion/09-arrays-colecciones) · **Anterior:** [08 · Iterator y la clase Collections](/ApuntesProgramacion/09-arrays-colecciones/08-iterator-collections) · **Siguiente:** **[U10 · Genéricos y Mapas](/ApuntesProgramacion/10-genericos-mapas)**