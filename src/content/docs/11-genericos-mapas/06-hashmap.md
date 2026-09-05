---
title: "06 · HashMap: la guía telefónica"
description: "Asocia claves con valores, el put que sobrescribe y las tres formas de recorrerlo ☎️"
---

<p><small>Asocia claves con valores, el put que sobrescribe y las tres formas de recorrerlo ☎️</small></p>

> 🗺️ **Estás en:** 🗺️ **U11 · Genéricos y Mapas** → 06 · HashMap: la guía telefónica

---

## 📬 La idea en una frase

> **Un `Map` asocia claves únicas con valores: buscas por clave (nombre) y obtienes su valor (teléfono). `HashMap` lo hace en O(1) y, si repites clave, el `put` sobrescribe el valor anterior.**

Hasta aquí solo guardabas elementos sueltos en listas y conjuntos. Pero la vida real está llena de asociaciones: nombre → teléfono, palabra → veces que aparece, matrícula → plaza de parking. Para eso existen los **mapas**, la tercera familia de estructuras junto a `List` y `Set`. Bienvenido a la guía telefónica.

---

## ☎️ HashMap: clave → valor

`HashMap` asocia claves con valores. Como una agenda: buscas por nombre (clave) y obtienes el teléfono (valor).

```java
import java.util.HashMap;

HashMap<String, Integer> agenda = new HashMap<>();
agenda.put("Ana", 612345678);
agenda.put("Bob", 698765432);
agenda.put("Ana", 600000000);  // Sobrescribe el anterior

int telefono = agenda.get("Ana");          // 600000000
Integer inexistente = agenda.get("NoExisto"); // null
agenda.containsKey("Bob");        // true
agenda.containsValue(600000000);  // true
agenda.remove("Bob");             // borra la entrada
agenda.size();                    // 1 (solo queda Ana)
```

Fíjate en las tres ideas clave:

1. **Las claves son únicas.** `put("Ana", 612345678)` y luego `put("Ana", 600000000)`: el segundo sobrescribe al primero. Es como tachar un número de tu agenda para poner otro: solo queda el último.
2. **`get` devuelve `null` si la clave no existe.** No lanza excepción, pero cuidado: si la variable es `int` (primitivo), asignar `null` da error. Por eso existe `getOrDefault`.
3. **Búsqueda rapidísima**: O(1) de media. Da igual si hay 10 o 10.000 entradas.

> 📝 **Nota:** las claves de un HashMap deben ser **inmutables**. Por eso `String` e `Integer` son perfectos. Si usas un objeto mutable como clave y luego lo modificas, su `hashCode()` cambia y el HashMap no lo encontrará más. Es como cambiar la cerradura y esperar que la llave vieja siga funcionando.

---

## 🛟 `getOrDefault`: el salvavidas de los null

En lugar de escribir el clásico `if (map.get(clave) != null)`, haces:

```java
int edadCarlos = agenda.getOrDefault("Carlos", 0);  // 0 si no existe
```

Es como un plan B: "si no encuentras a Carlos, dame 0". Lo usarás muchísimo para contar frecuencias, como verás en el Sé el Código.

---

## 🚶 Recorrer un HashMap: tres caminos

Un mapa tiene tres vistas para recorrer: las claves, los valores o las entradas completas.

```java
HashMap<String, Integer> agenda = new HashMap<>();
agenda.put("Ana", 612345678);
agenda.put("Bob", 698765432);

// 1) Solo las claves
for (String nombre : agenda.keySet()) {
    System.out.println(nombre + " → " + agenda.get(nombre));
}

// 2) Solo los valores
for (Integer telefono : agenda.values()) {
    System.out.println("Tel: " + telefono);
}

// 3) Las entradas completas (clave + valor juntos) — la preferida
for (HashMap.Entry<String, Integer> entrada : agenda.entrySet()) {
    System.out.println(entrada.getKey() + " → " + entrada.getValue());
}
```

La tercera es la favorita de los profesionales: `entrySet()` te da pares clave-valor sin tener que hacer un `get` extra dentro del bucle. En los exámenes y en el trabajo, esta es la que verás una y otra vez.

> 💡 **Consejo:** para recorrer, declara el mapa como `Map<String, Integer>` y usa `Map.Entry<K, V>` en el bucle: así, si mañana cambias a `TreeMap`, no tocas nada. Programa contra la interfaz, como en la U10.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** HashMap no garantiza orden. Si necesitas orden, usa TreeMap o LinkedHashMap (punto 7). Y ojo con `put`: repetir clave sobrescribe, no añade.

**Ejercicio 1: el HashMap traicionero**

```java
import java.util.HashMap;

public class BeTheMap {
    public static void main(String[] args) {
        HashMap<String, String> capitales = new HashMap<>();
        capitales.put("España", "Madrid");
        capitales.put("Francia", "París");
        capitales.put("Italia", "Roma");
        capitales.put("España", "Barcelona");

        System.out.println(capitales.get("España"));
    }
}
```

**¿Qué imprime?**

- (A) Madrid
- (B) Barcelona
- (C) null
- (D) Error

<details>
<summary>🔄 Solución</summary>

La **B**. La clave "España" se sobrescribe con el nuevo valor: `put("España", "Barcelona")` pisa al anterior. "Madrid" ha sido reemplazado. Moraleja: en un HashMap, una clave solo puede tener UN valor, el último que se ponga.

</details>

---

**Ejercicio 2: la frecuencia de letras**

> 🕶️ **Don Tip:** `getOrDefault()` evita el null check. Úsalo siempre que puedas.

```java
import java.util.HashMap;

public class BeTheFrequency {
    public static void main(String[] args) {
        String texto = "banana";
        HashMap<Character, Integer> frec = new HashMap<>();
        for (char c : texto.toCharArray()) {
            frec.put(c, frec.getOrDefault(c, 0) + 1);
        }
        System.out.println(frec.get('a') + " " + frec.get('n'));
    }
}
```

**¿Qué imprime?**

- (A) 1 1
- (B) 3 1
- (C) 3 2
- (D) 2 2

<details>
<summary>🔄 Solución</summary>

La **B**. En "banana", la 'a' aparece 3 veces y la 'n' aparece 2... espera, ¡revisa! "b-a-n-a-n-a": b=1, a=3, n=2. Entonces `frec.get('a')` = 3 y `frec.get('n')` = 2 → la opción correcta sería **C** (3 2). El truco de `getOrDefault(c, 0) + 1` es el héroe: si la letra no estaba, devuelve 0 y empieza en 1; si estaba, suma uno al contador. Este patrón es EL patrón de los mapas: lo verás en la U12 con ficheros y en media carrera de programación.

</details>

---

## 🤷 No hay preguntas tontas

> ❓ **¿Puedo tener un HashMap con clave `null`?**

Sí, HashMap admite **una** clave `null` (la guarda en una posición especial). TreeMap no lo admite. Y los valores `null` sí se permiten en ambos.

---

> ❓ **¿Qué pasa si la clave no existe en el mapa?**

`get()` devuelve `null`. No lanza excepción. Úsalo con cuidado o, mejor, usa `getOrDefault(clave, valorPorDefecto)`, que te devuelve un valor seguro.

---

> ❓ **¿Y si necesito asociar varias cosas a la misma clave?**

Usa un mapa de listas: `HashMap<String, ArrayList<Integer>>`. La clave apunta a una lista y cada `put` bien hecho añade a la lista existente. Es la estructura que usarás para "una clave, muchos valores".

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué devuelve `get(clave)` si la clave no existe?
2. ¿Qué hace `put("Ana", x)` si la clave "Ana" ya existe?
3. ¿Qué método devuelve un valor por defecto si la clave no existe?
4. ¿Cuál es el bucle preferido para recorrer un mapa y por qué?

<details>
<summary>🔄 Respuestas</summary>

1. `null` (no lanza excepción).
2. Sobrescribe el valor anterior: las claves son únicas.
3. `getOrDefault(clave, valorPorDefecto)`.
4. `for (Map.Entry<K, V> e : mapa.entrySet())`: te da clave y valor juntos sin un `get` extra.

</details>

---

## ✅ Resumen en 3 frases

1. **`Map`** asocia claves únicas con valores: `put` añade (o sobrescribe), `get` consulta y devuelve `null` si la clave no existe.
2. Se recorre con **`keySet()`** (claves), **`values()`** (valores) o **`entrySet()`** (pares), siendo esta última la preferida.
3. Las claves deben ser **inmutables** y el `getOrDefault()` es tu salvavidas contra los `null`, especialmente para contar frecuencias.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `Map` | Interfaz que asocia claves con valores |
> | Clave / valor | El par asociado; la clave es única |
> | `put` | Añadir o sobrescribir una entrada |
> | `getOrDefault` | Devolver un valor seguro si la clave no existe |
> | `entrySet` | Las entradas (clave + valor) para recorrer |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/11-genericos-mapas) · **Anterior:** [05 · Wildcards: `? extends T` y `? super T`](/ApuntesProgramacion/11-genericos-mapas/05-wildcards) · **Siguiente:** [07 · TreeMap, LinkedHashMap y otros mapas](/ApuntesProgramacion/11-genericos-mapas/07-treemap-otros-mapas)