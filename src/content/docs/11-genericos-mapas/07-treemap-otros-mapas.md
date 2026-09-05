---
title: "07 · TreeMap, LinkedHashMap y otros mapas"
description: "El ordenado de serie, el que recuerda el orden de llegada y los métodos de navegación 🌳"
---

<p><small>El ordenado de serie, el que recuerda el orden de llegada y los métodos de navegación 🌳</small></p>

> 🗺️ **Estás en:** 🗺️ **U11 · Genéricos y Mapas** → 07 · TreeMap, LinkedHashMap y otros mapas

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

## ✅ Resumen en 3 frases

1. **`TreeMap`** ordena las claves automáticamente y ofrece navegación (`firstKey`, `lastKey`, `headMap`, `subMap`) a cambio de O(log n).
2. **`LinkedHashMap`** mantiene el orden de inserción con la misma velocidad casi O(1) de un HashMap.
3. **Regla de oro:** velocidad → `HashMap`; orden natural → `TreeMap`; orden de llegada → `LinkedHashMap`.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `TreeMap` | Mapa ordenado por clave (árbol rojo-negro) |
> | Árbol rojo-negro | Estructura interna que mantiene el orden en O(log n) |
> | `LinkedHashMap` | Mapa que recuerda el orden de inserción |
> | `headMap` / `subMap` | Subconjuntos de entradas por rango de claves |
> | O(log n) | Logarítmico: rápido aunque crezca el mapa |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/11-genericos-mapas) · **Anterior:** [06 · HashMap: la guía telefónica](/ApuntesProgramacion/11-genericos-mapas/06-hashmap) · **Siguiente:** [08 · Map vs List vs Set: elige tu estructura](/ApuntesProgramacion/11-genericos-mapas/08-elegir-estructura-datos)