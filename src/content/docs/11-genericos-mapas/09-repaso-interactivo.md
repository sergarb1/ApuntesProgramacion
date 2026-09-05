---
title: "09 · Repaso interactivo: domina los genéricos y los mapas"
description: "El cierre práctico de la unidad, con un HashMap que sobrescribe, un TreeMap que ordena solo y un bucle que lo va a liar todo 😈"
---

<p><small>El cierre práctico de la unidad, con un HashMap que sobrescribe, un TreeMap que ordena solo y un bucle que lo va a liar todo 😈</small></p>

> 🗺️ **Estás en:** 🗺️ **U11 · Genéricos y Mapas** → 09 · Repaso interactivo

---

## 📬 La idea en una frase

> **En este punto no aprendemos nada nuevo: lo convertimos todo en práctica. Y, como siempre, algo no va a funcionar.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaban de darte este programa para ejecutar:*

```java
import java.util.*;

public class Misterio {
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

**¿Qué imprimes por pantalla? Elige sabiamente:**

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

## 🔥 Fireside Chat: el Genérico vs el Tipo Crudo

> *Dos maneras de declarar una lista se encuentran frente a la máquina de café.*

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

1. **Soy el comodín que significa "cualquier tipo" y limita a una jerarquía cuando le pongo `extends`.**
2. **Soy el operador perezoso que evita repetir el tipo dos veces.**
3. **Soy el mago que borra los genéricos cuando el código se compila.**
4. **Soy el mapa rapidísimo que no garantiza ningún orden.**
5. **Soy el mapa que ordena las claves automáticamente.**
6. **Soy el método que funciona para cualquier tipo gracias a su `<T>` propio.**

<details>
<summary>🔄 Respuestas</summary>

1. El **wildcard** (`?`) — `? extends Number` acepta cualquier subtipo.
2. El **diamante** `<>` — `new Caja<>()` infiere el tipo.
3. El **type erasure** — borra los genéricos y añade castings en el bytecode.
4. **`HashMap`** — O(1) pero sin orden.
5. **`TreeMap`** — árbol rojo-negro con `firstKey()`, `headMap()`...
6. El **método genérico** — `public static <T> void imprimir(T x)`.

</details>

---

## 🤬 CONRAD VS EL MUNDO: "El que sobrescribe sin avisar"

> *CONRAD, nuestro compilador cascarrabias, opina sobre los clásicos del novato.*

**CONRAD:** — ¡OTRA VEZ! Un alumno me enseña su agenda y se queja: *"CONRAD, se me ha perdido un contacto"*. Y yo: ¿lo añadiste con `put` usando el mismo nombre dos veces? *"Pues sí, ¿por?"* ¡AY, MADRE MÍA! ¡En un HashMap las claves son únicas! El segundo `put("Ana", ...)` SOBRESCRIBE al primero. Es como tachar un número en tu agenda para poner otro: el anterior se fue para siempre. Si quieres conservar varios, usa `HashMap<String, List<String>>`.

*Y luego está el que pregunta "¿por qué no ordena mi HashMap?"* ¡Pues claro que no ordena! Es un HashMap, el rey de la velocidad, no un bibliotecario. Si quieres orden, `TreeMap`. Si quieres orden de llegada, `LinkedHashMap`. Cada mapa con su superpoder.

*Y el colmo de los colmos:* el que escribe `Caja<int>` y espera que compile. ¡No se puede! Los genéricos solo aceptan objetos: usa `Integer` y deja que el autoboxing haga su magia. Y no me vengas con el `get` de una clave que no existe: devuelve `null`. Usa `getOrDefault`, que para eso está.

**La lección:** antes de acusar a Java de "odiarte", repasa el trío sagrado de la unidad: **¿estoy sobrescribiendo una clave con `put`? ¿he elegido el mapa con el orden que necesito? ¿estoy guardando un primitivo donde solo caben objetos?** El compilador no te odia: te está pasando las respuestas del examen.

---

## 🎮 El juego de las decisiones

Elige la respuesta correcta para cada decisión (respuestas al final):

1. `mapa.put("Ana", 10); mapa.put("Ana", 20);` ¿Qué hace el segundo `put`?
   - a) Añade otra entrada   b) Sobrescribe el valor de "Ana" a 20
2. `Caja<int>`... ¿compila?
   - a) Sí   b) No: los genéricos no aceptan primitivos
3. `mapa.get("NoExisto")` devuelve...
   - a) `null`   b) 0   c) Una excepción
4. ¿Qué mapa te da las claves siempre ordenadas alfabéticamente?
   - a) `HashMap`   b) `TreeMap`
5. ¿Puedes añadir un elemento a una `List<? extends Number>`?
   - a) Sí, cualquier Number   b) No (solo `null`)
6. En runtime, ¿`ArrayList<String>` y `ArrayList<Integer>` son la misma clase?
   - a) Sí, gracias al type erasure   b) No, son clases distintas

<details>
<summary>🔄 Soluciones</summary>

1. **b)** — Las claves de un Map son únicas; `put` sobrescribe.
2. **b)** — `int` es primitivo; se usa `Integer` con autoboxing.
3. **a)** — `get` devuelve `null` si la clave no existe (no lanza excepción).
4. **b)** — `TreeMap` ordena por clave; `HashMap` no ordena nada.
5. **b)** — `? extends Number` es de solo lectura (PECS: Producer Extends).
6. **a)** — El type erasure borra los genéricos en el bytecode: ambos son `ArrayList`.

</details>

---

## ⚡ Laboratorio de tortura: la media que llora

> **Duración estimada:** 30 minutos
> **Herramienta:** tu IDE y un archivo nuevo

**El escenario:** copia este programa y haz que funcione. Te dicen que tiene **3 errores** que impiden que compile y 1 error de lógica que hace que el resultado sea incorrecto... pero, ¿y si te lo dicen mal? Tu tarea: hacer que compile, que ejecute y que **toda** la salida sea correcta, contando tú los errores reales.

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

**Fallo intencionado:** el número de errores del enunciado está mal a propósito: si buscas el "tercer error de compilación" y el "error de lógica", te vuelves loco. La trampa es tu confianza en el enunciado.

**Tu tarea:** conseguir que compile, que ejecute y que **toda** la salida sea correcta. Si el resultado no cuadra, diagnostica.

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

   Salida correcta: `7.0`. La lección real: **lee el código, no el enunciado**. Un bug puede ser que te digan "hay 3 errores" y solo haya 2: si buscas el tercero, te vuelves loco. Cuenta, verifica y confía en el compilador, no en la leyenda.

   </details>

---

## 🏆 Logros de esta unidad

| Logro | Cómo conseguirlo |
|---|---|
| 🏅 **El Tipógrafo** | Explicar por qué `ArrayList<String>` rechaza un `int` sin necesidad de casting |
| 🏅 **El Cajero** | Crear tu propia clase genérica `Caja<T>` y usarla con dos tipos distintos |
| 🏅 **El Mago** | Explicar el type erasure y el diamante `<>` como si fuera un truco de magia |
| 🏅 **El Guía Telefónico** | Recorrer un `HashMap` con `entrySet()` y contar frecuencias con `getOrDefault` |
| 🏅 **El Estratega** | Elegir entre Map, List y Set justificando la elección con argumentos |

---

## 🧠 Atrévete a pensar

1. **Sin ejecutar:** ¿qué imprime este programa?

```java
import java.util.HashMap;

public class Acertijo {
    public static void main(String[] args) {
        HashMap<String, Integer> m = new HashMap<>();
        for (char c : "casa".toCharArray()) {
            m.put(String.valueOf(c), m.getOrDefault(String.valueOf(c), 0) + 1);
        }
        System.out.println(m.get("a") + " " + m.size());
    }
}
```

2. **El contador de palabras ordenado:** tienes un `String[]` de palabras y quieres mostrar cada palabra con su frecuencia, en orden alfabético. ¿Qué estructura usas y con qué bucle?

3. **El detective del erasure:** ¿por qué no puedes escribir `new T()` dentro de una clase genérica, aunque te hayas pasado por el `<T>`?

4. **Verdadero o falso:** "un `HashMap` garantiza el orden en el que introduces las claves".

<details>
<summary>💡 Soluciones</summary>

1. **`2 3`**. "casa" tiene c=1, a=2, s=1. `get("a")` = 2 y `size()` = 3 (tres claves distintas: c, a, s).
2. Un **`TreeMap<String, Integer>`** (claves ordenadas solas) recorrido con `entrySet()`: cada entrada es la palabra y su cuenta.
3. Porque en compilación Java no sabe qué es `T`, y en runtime el type erasure lo ha borrado: no hay forma de instanciar un tipo que ya no existe.
4. **Falso.** `HashMap` no garantiza orden. Para orden de inserción usa `LinkedHashMap`; para orden natural, `TreeMap`.

</details>

---

## 🧩 Crucigrama de bits

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
<summary>📝 Soluciones</summary>

**Horizontal:** 1. TREEMAP · 3. DIAMANTE · 5. GETORDEFAULT · 6. HASHMAP
**Vertical:** 2. TYPEERASURE · 4. MAP

</details>

---

## 💬 Preguntas de entrevista de trabajo

> Preguntas reales que te harían para programador Java junior.

1. **"Explícame, como si yo fuera tu abuela, qué es un `HashMap`."**
2. **"¿Qué es el type erasure y por qué es importante?"**
3. **"¿Cuál es la diferencia entre `? extends T` y `? super T`? ¿Qué es PECS?"**
4. **"¿Por qué `List<Number>` no acepta una `List<Integer>`?"**
5. **"¿Cuándo usarías un `TreeMap` en vez de un `HashMap`?"**
6. **"¿Puedes crear un array de genéricos? ¿Y hacer `new T()`? ¿Por qué?"**

---

## 🤷 No hay preguntas tontas

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

**PROXIMAMENTE EN U12:** Ficheros y Regex. Guarda tus mapas y tus listas en disco y busca patrones con expresiones regulares. 📁

---

📚 [Volver al índice de la unidad](/ApuntesProgramacion/11-genericos-mapas) · **Anterior:** [08 · Map vs List vs Set: elige tu estructura](/ApuntesProgramacion/11-genericos-mapas/08-elegir-estructura-datos) · **Siguiente:** **[U12 · Ficheros y Regex](/ApuntesProgramacion/12-ficheros-regex)**