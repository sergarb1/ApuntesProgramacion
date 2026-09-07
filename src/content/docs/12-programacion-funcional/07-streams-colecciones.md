---
title: "07 · Del stream a la colección: toList, Collectors, groupingBy"
description: "`toList()`, `Collectors.toMap` y `groupingBy`: del flujo a listas, conjuntos y mapas 🗂️"
---

<p><small>`toList()`, `Collectors.toMap` y `groupingBy`: del flujo a listas, conjuntos y mapas 🗂️</small></p>

> 🗺️ **Estás en:** 🗺️ **U12 · Programación Funcional** → 07 · Del stream a la colección: toList, Collectors, groupingBy

---

## 📬 La idea en una frase

> **Un stream no guarda nada, así que al final del pipeline toca aterrizar: `toList()` o los `Collectors` convierten el flujo en listas, conjuntos, Strings y, con `groupingBy`, en mapas agrupados por una clave.**

La cinta transportadora está muy bien para procesar, pero al final los paquetes tienen que ir a algún sitio. La terminal `collect` (del punto 6) es la puerta de salida, y hoy conoces su maletín: `Collectors`, la clase con las recetas para empaquetar de todas las formas imaginables.

---

## 📥 `toList()`: la salida rápida (Java 16+)

Desde Java 16 existe `toList()` directo sobre el stream: la forma más corta de aterrizar en una lista.

```java
List<String> palabras = List.of("hola", "mundo", "hola", "adios");
List<String> unicas = palabras.stream()
    .distinct()
    .toList();                       // [hola, mundo, adios]
```

> ⚠️ **Advertencia:** `toList()` devuelve una lista **inmutable**: no puedes `add`, `remove` ni reordenarla. Si necesitas modificarla, usa `collect(Collectors.toList())`, que devuelve un `ArrayList` de toda la vida.

---

## 🗂️ Los `Collectors` de toda la vida

La clase `Collectors` (en `java.util.stream`) tiene recetas para cada tipo de aterrizaje:

```java
import java.util.*;
import java.util.stream.*;

List<String> palabras = List.of("hola", "mundo", "hola", "adios");

List<String> lista = palabras.stream().collect(Collectors.toList());       // ArrayList
Set<String> conjunto = palabras.stream().collect(Collectors.toSet());      // HashSet sin duplicados
String frase = palabras.stream().collect(Collectors.joining(", "));        // "hola, mundo, hola, adios"
long cuantos = palabras.stream().collect(Collectors.counting());           // 4
```

`joining(", ")` es el favorito para sacar un `String` legible: une los elementos con el separador que le pases. Ideal para depurar pipelines en dos líneas.

---

## 🗺️ `groupingBy`: agrupar como en una tabla

El rey de este punto. **`Collectors.groupingBy(función)`** agrupa los elementos según la clave que devuelve la función y te da un `Map<clave, List<valor>>`.

```java
import java.util.*;
import java.util.stream.*;

public class Agrupando {
    public static void main(String[] args) {
        List<String> palabras = List.of("hola", "adios", "hola", "mar", "mundo");

        Map<Character, List<String>> porLetra = palabras.stream()
            .collect(Collectors.groupingBy(p -> p.charAt(0)));

        System.out.println(porLetra);
        // {a=[adios], h=[hola, hola], m=[mar, mundo]}
    }
}
```

Es el equivalente a la sentencia SQL `GROUP BY`: en vez de recorrer a mano y montar el `HashMap` de la U11 con `getOrDefault`, declaras la clave y Java agrupa. Por dentro está usando un `HashMap`, pero tú no lo ves: el `Collectors` lo monta por ti.

---

## 🗺️ `toMap`: de elementos a entradas

`Collectors.toMap(clave, valor)` convierte cada elemento en una entrada de mapa. Tiene un tercer argumento: la **función de fusión**, que decide qué hacer cuando dos elementos quieren la misma clave.

```java
List<String> palabras = List.of("hola", "mundo", "hola", "adios");

// palabra → longitud
Map<String, Integer> longitudes = palabras.stream()
    .collect(Collectors.toMap(p -> p, String::length, (a, b) -> a));
// {adios=5, hola=4, mundo=5}

// primera letra → primera palabra que la cumpla
Map<Character, String> representantes = palabras.stream()
    .collect(Collectors.toMap(p -> p.charAt(0), p -> p, (a, b) -> a));
// {a=adios, h=hola, m=mundo}
```

Sin la función de fusión `(a, b) -> a`, un `"hola"` duplicado provocaría una `IllegalStateException`: dos elementos queriendo la misma clave y nadie resolviendo el conflicto. Con `(a, b) -> a` le dices "quédate con el primero".

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `groupingBy` admite un segundo argumento, el "colector aguas abajo": `groupingBy(clave, Collectors.counting())` te da `Map<clave, Long>` con cuántos elementos hay en cada grupo. El contador de frecuencias de la U11 en una sola línea.

**Ejercicio: el contador de grupos**

```java
import java.util.*;
import java.util.stream.*;

public class Grupos {
    public static void main(String[] args) {
        List<String> palabras = List.of("sol", "mar", "sol", "luna", "mar", "sol");
        Map<String, Long> conteo = palabras.stream()
            .collect(Collectors.groupingBy(p -> p, Collectors.counting()));
        System.out.println(conteo);
    }
}
```

**¿Qué imprime?**

- (A) `{sol=3, mar=2, luna=1}`
- (B) `{sol=1, mar=1, luna=1}`
- (C) `{sol=1, mar=1, sol=1, luna=1, mar=1, sol=1}`
- (D) `{sol=6}`

<details>
<summary>🔄 Solución</summary>

La **A**. `groupingBy(p -> p, Collectors.counting())` agrupa las palabras por sí mismas (cada palabra es su propia clave) y el colector aguas abajo `counting()` cuenta cuántas veces aparece cada una: `sol` aparece 3 veces, `mar` 2 y `luna` 1. Las claves del mapa son únicas (esa es la regla de oro de los mapas de la U11), así que la C es imposible: no puede haber dos entradas con la misma clave. La B sería el resultado sin `counting()` (grupos de un elemento) y la D confunde el total con el grupo.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué devuelve `toList()`?
2. ¿Qué hace `Collectors.groupingBy(...)`?
3. ¿Para qué sirve el tercer argumento de `toMap`?
4. ¿Qué devuelve `Collectors.joining(", ")`?

<details>
<summary>🔄 Respuestas</summary>

1. Una `List` inmutable con los elementos del stream.
2. Agrupa los elementos por la clave que devuelve la función y da un `Map<clave, List<valor>>`.
3. La **función de fusión**: resuelve qué hacer cuando dos elementos quieren la misma clave (por ejemplo, `(a, b) -> a` se queda con el primero).
4. Un `String` con los elementos unidos por la coma y un espacio.

</details>

---

## ✅ Resumen en 3 frases

1. `toList()` y los `Collectors` convierten el flujo en **colecciones reales**: listas, conjuntos, Strings y mapas.
2. `groupingBy` agrupa los elementos por una clave y devuelve un `Map<clave, List<valor>>`; con `counting()` como segundo argumento, cuenta cada grupo.
3. `toMap` convierte cada elemento en una entrada clave-valor y necesita una **función de fusión** cuando puede haber claves repetidas.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `toList()` | Recoge el stream en una lista inmutable (Java 16+) |
> | `Collectors.toList()` / `toSet()` | Recogen en lista o conjunto modificables |
> | `groupingBy` | Agrupa por una clave en un `Map` |
> | Colector aguas abajo | Segundo argumento que procesa cada grupo (`counting()`) |
> | `toMap` | Convierte cada elemento en una entrada clave-valor |
> | Fusión (merge) | Función que resuelve qué hacer con claves repetidas |
> | `joining` | Une los elementos en un `String` |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/12-programacion-funcional) · **Anterior:** [06 · Operaciones terminales: collect, reduce, count, forEach](/ApuntesProgramacion/12-programacion-funcional/06-streams-terminales) · **Siguiente:** [08 · Optional: el que acepta la ausencia](/ApuntesProgramacion/12-programacion-funcional/08-optional)