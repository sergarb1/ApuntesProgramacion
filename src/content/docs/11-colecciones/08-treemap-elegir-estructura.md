---
title: "08 · TreeMap y cómo elegir estructura"
description: "El ordenado de serie, el que recuerda el orden de llegada y los métodos de navegación 🌳"
---

<p><small>El ordenado de serie, el que recuerda el orden de llegada y los métodos de navegación 🌳</small></p>

> 🗺️ **Estás en:** 📚 **U11 · Colecciones, genéricos y mapas** → 08 · TreeMap y cómo elegir estructura

---

## 📬 La idea en una frase

> **`HashMap` es rapidísimo pero no ordena, `TreeMap` ordena las claves automáticamente (O(log n)) y `LinkedHashMap` recuerda el orden de inserción. Eliges según lo que necesites.**

En el punto 6 conociste al rey de la velocidad. Pero a veces la velocidad no basta: necesitas que las claves salgan ordenadas, o que se respete el orden en el que las metiste. Aquí están sus dos primos, con sus superpoderes y sus debilidades.

---

## 🌳 TreeMap: el ordenado de serie

`TreeMap` es un mapa ordenado por clave. Internamente usa un árbol rojo-negro, que es como una biblioteca que se reordena sola cada vez que añades un libro.

```java
import java.util.TreeMap;

TreeMap<String, Integer> ordenado = new TreeMap<>();
ordenado.put("Zara", 30);
ordenado.put("Ana", 25);
ordenado.put("Bob", 35);
System.out.println(ordenado);  // {Ana=25, Bob=35, Zara=30} — orden alfabético

// Métodos de navegación extra
ordenado.firstKey();    // "Ana" — la primera clave
ordenado.lastKey();     // "Zara" — la última clave
ordenado.headMap("Bob");  // {Ana=25} — entradas antes de "Bob"
ordenado.subMap("Ana", "Zara"); // {Ana=25, Bob=35} — entre claves
```

La gracia está en los métodos de navegación: `firstKey`, `lastKey`, `headMap`, `subMap`... son la razón de ser del TreeMap. Con un HashMap, para "las claves que van antes que Bob" tendrías que copiar y ordenar a mano.

> ⚠️ **Advertencia:** TreeMap NO admite una clave `null` (no sabe compararla con nada). Y las claves deben ser comparables: por eso `String` e `Integer` funcionan, y las clases tuyas sin `Comparable` fallan en tiempo de ejecución.

---

## 🔗 LinkedHashMap: el que recuerda el orden de llegada

`LinkedHashMap` es un HashMap que, además, mantiene el orden de inserción. Es como un HashMap con memoria de lo que fuiste metiendo.

```java
import java.util.LinkedHashMap;

LinkedHashMap<String, Integer> conMemoria = new LinkedHashMap<>();
conMemoria.put("Zara", 30);
conMemoria.put("Ana", 25);
conMemoria.put("Bob", 35);
System.out.println(conMemoria);  // {Zara=30, Ana=25, Bob=35} — orden de inserción
```

¿Cuándo lo usas? Cuando quieres la velocidad del HashMap pero necesitas saber "en qué orden llegó cada cosa": un historial, una lista de "lo último visto"... Recuerda: **orden de inserción**, no orden natural.

---

## ⚖️ La familia al completo

| Mapa | Orden | Velocidad | ¿Clave `null`? |
|---|---|---|---|
| `HashMap` | Ninguno | O(1) | Sí (una) |
| `TreeMap` | Natural (por clave) | O(log n) | No |
| `LinkedHashMap` | De inserción | O(1) | Sí (una) |

**Regla práctica:** ¿velocidad y no te importa el orden? → `HashMap`. ¿Claves siempre ordenadas o navegación (`firstKey`, `headMap`...)? → `TreeMap`. ¿Velocidad pero respetando el orden de llegada? → `LinkedHashMap`.

---

## 🥊 EL RING: HashMap vs TreeMap

Dos implementaciones de Map se enfrentan frente a la máquina de café.

**HashMap:** — Yo soy el rey de la velocidad. O(1) en `get` y `put`. No me importa el orden, me importa la rapidez.

**TreeMap:** — Sí, pero yo mantengo las claves ordenadas automáticamente. Si necesitas recorrerlas en orden alfabético, soy tu único amigo.

**HashMap:** — ¿Ordenado? Eso cuesta. Yo soy O(1) en todo. ¡Soy imbatible en rendimiento!

**TreeMap:** — Cierto, pero puedo navegar: `firstKey()`, `lastKey()`, `subMap()`, `headMap()`. Tú, para todo eso, tienes que copiar y ordenar.

**HashMap:** — Si no necesitas orden, ¿para qué pagar el coste? La mayoría de los casos usan HashMap.

**TreeMap:** — Y cuando necesitan orden, ahí estoy yo. Y no soy tan lento: O(log n) sigue siendo muy rápido para la mayoría de los casos.

**HashMap:** — Tregua. Cada uno en su sitio.

**TreeMap:** — Hecho.

> La lección: **¿velocidad? → HashMap. ¿orden natural? → TreeMap. ¿orden de inserción? → LinkedHashMap.** Cada uno tiene su superpoder, y la respuesta a "¿cuál es mejor?" siempre es "depende".

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** TreeMap ordena por clave en el momento del `put`. No ordenas tú: él ordena solo.

**Ejercicio: la biblioteca que se ordena sola**

```java
import java.util.TreeMap;

public class BeTheTreeMap {
    public static void main(String[] args) {
        TreeMap<String, Integer> m = new TreeMap<>();
        m.put("Zara", 30);
        m.put("Ana", 25);
        m.put("Bob", 35);

        System.out.println(m.firstKey());
        System.out.println(m.headMap("Bob"));
    }
}
```

**¿Qué imprime?**

- (A) Zara / {Zara=30}
- (B) Ana / {Ana=25}
- (C) Ana / {Ana=25, Bob=35}
- (D) Zara / {Zara=30, Ana=25}

<details>
<summary>🔄 Solución</summary>

La **B**. `firstKey()` devuelve la primera clave en orden natural: "Ana". `headMap("Bob")` devuelve las entradas con claves estrictamente menores que "Bob": solo `{Ana=25}`. Ojo: "Bob" no entra en su propio `headMap`.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué mapa ordena las claves automáticamente?
2. ¿Qué mapa mantiene el orden de inserción?
3. ¿Qué método devuelve las entradas con clave menor que una dada?
4. ¿Puede un TreeMap tener una clave `null`?

<details>
<summary>🔄 Respuestas</summary>

1. `TreeMap` (orden natural de la clave).
2. `LinkedHashMap` (orden de inserción).
3. `headMap(clave)`.
4. No. TreeMap no sabe comparar `null` con nada; HashMap sí admite una clave `null`.

</details>

---

---

## ⚖️ Map vs List vs Set: la comparativa definitiva

| Característica | List | Set | Map |
|---|---|---|---|
| ¿Qué guarda? | Elementos ordenados por posición | Elementos únicos | Pares clave → valor |
| ¿Duplicados? | Sí | No | Claves no, valores sí |
| ¿Orden? | De inserción | Depende (Hash/Tree) | Depende (Hash/Tree) |
| Acceso | Por índice | Por elemento | Por clave |
| ¿Nulls? | Sí | HashSet: 1, TreeSet: 0 | HashMap: 1 clave, TreeMap: 0 |
| Implementación principal | `ArrayList` | `HashSet` | `HashMap` |

**La gran diferencia:** List y Set guardan elementos sueltos; Map guarda parejas. Si tu dato necesita una "clave" para buscarse después (un DNI, un nombre, una palabra), es un Map. Si solo necesitas una colección de cosas, es List o Set.

## 🧭 El árbol de decisiones

```
¿Tienes parejas clave → valor?
├── Sí → ¿Necesitas orden por clave?
│        ├── Sí → TreeMap
│        └── No → ¿Orden de llegada?
│                 ├── Sí → LinkedHashMap
│                 └── No → HashMap
└── No → ¿Me importa el orden?
         ├── No → ¿Duplicados?
         │        ├── No → HashSet
         │        └── Sí → ArrayList
         └── Sí → ¿Qué orden?
                  ├── Natural → ¿Duplicados?
                  │        ├── No → TreeSet
                  │        └── Sí → ArrayList + sort
                  └── De llegada → ¿Duplicados?
                           ├── No → LinkedHashSet
                           └── Sí → ArrayList
```

## 🥇 La regla práctica

- ¿Una lista de cosas que recorres por posición? → `ArrayList`
- ¿Cosas sin repetir y no te importa el orden? → `HashSet`
- ¿Cosas sin repetir y siempre ordenadas? → `TreeSet`
- ¿Asociar una cosa con otra y buscar por clave? → `HashMap`
- ¿Claves ordenadas o navegación (`firstKey`, `headMap`)? → `TreeMap`
- ¿Velocidad pero respetando el orden de llegada? → `LinkedHashMap`

**La regla de oro:** ¿el dato se busca solo por su contenido? → Set. ¿Por una posición? → List. ¿Por una clave distinta de él mismo? → Map. Esa última frase separa al que memoriza de quien entiende.

**¿Qué estructura usarías?** Para cada escenario, elige y justifica en una línea:

1. Asociar cada alumno (por su nombre) con su nota de examen.
2. Las notas de la clase, para recorrerlas muchas veces por posición.
3. Los DNI de los matriculados, sin repetir y en orden alfabético.
4. Saber si una palabra ya ha salido en un sorteo, con 100.000 palabras.
5. El número de veces que aparece cada letra en un texto, mostradas en orden alfabético.

<details>
<summary>🔄 Soluciones</summary>

1. **`HashMap<String, Integer>`** — clave = nombre, valor = nota. Búsqueda directa por alumno.
2. **`ArrayList<Integer>`** — acceso por índice O(1) y duplicados permitidos.
3. **`TreeSet<String>`** — sin duplicados y orden natural automático.
4. **`HashSet<String>`** — `contains` en O(1) para la pregunta "¿ya salió?".
5. **`TreeMap<Character, Integer>`** — frecuencia por letra con las claves ordenadas solas.

</details>

---

## ✅ Resumen en 3 frases (ampliado)

1. **List** guarda elementos por posición (duplicados sí), **Set** guarda únicos y **Map** asocia claves únicas con valores: la primera pregunta siempre es "¿necesito asociar?".
2. **TreeMap** ordena sus claves y añade navegación (`firstKey`, `headMap`, `floorEntry`); **LinkedHashMap** combina velocidad de HashMap con orden de llegada.
3. **"¿Cuál es la mejor estructura?"** se responde siempre con "depende" y argumentos: el árbol de decisiones de este punto es tu brújula.

---

📚 [Volver al índice de la unidad](/ApuntesProgramacion/11-colecciones) · **Anterior:** [07 · HashMap: la guía telefónica](/ApuntesProgramacion/11-colecciones/07-hashmap) · **Siguiente:** [09 · Repaso interactivo](/ApuntesProgramacion/11-colecciones/09-repaso-interactivo)
