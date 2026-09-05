---
title: "Boletín U11 — Avanzado"
description: "Ejercicios de dificultad progresiva para exprimir los genéricos y los mapas"
---

# 📝 Boletín U11 — Avanzado

> Dificultad progresiva. ⭐ para calentar, ⭐⭐ para pensar, ⭐⭐⭐ para concursar. Cada ejercicio incluye una pista (resiste a mirarla).

---

## ⭐ Ejercicio 1: Pila genérica `<T>`

Implementa una clase genérica `Pila<T>` que funcione como una pila (LIFO). Debe tener los métodos:

- `void push(T elemento)` — apila un elemento.
- `T pop()` — desapila y devuelve el elemento superior (lanza `EmptyStackException` si está vacía).
- `T peek()` — devuelve el elemento superior sin desapilarlo.
- `boolean isEmpty()` — indica si está vacía.
- `int size()` — número de elementos.

Internamente, usa un `ArrayList<T>` como almacenamiento. Pruébala con `Pila<Integer>`, `Pila<String>` y `Pila<Double>`.

**Pista:** `EmptyStackException` está en `java.util.EmptyStackException`. Recuerda comprobar `isEmpty()` antes de `pop()`/`peek()`.

---

## ⭐⭐ Ejercicio 2: Método genérico `maximo` sobre un array

Implementa un método genérico:

```java
public static <T extends Comparable<T>> T maximo(T[] array)
```

Que devuelva el elemento más grande del array usando `compareTo()`. Pruébalo con un `Integer[]` y un `String[]`.

**Pista:** asume que el primero es el máximo y recorre desde el índice 1. No puedes usar arrays de primitivos: usa `Integer[]`, no `int[]`.

---

## ⭐⭐ Ejercicio 3: HashMap inverso

Escribe un método genérico estático:

```java
public static <K, V> HashMap<V, K> invertirMapa(HashMap<K, V> original)
```

Que devuelva un nuevo `HashMap` intercambiando claves y valores. Si hay valores duplicados en el mapa original, el último encontrado sobrescribe al anterior.

Prueba con un mapa de `String → Integer` y otro de `String → String`.

**Pista:** recorre `original.entrySet()` y haz `invertido.put(e.getValue(), e.getKey())`.

---

## ⭐⭐ Ejercicio 4: TreeMap — frecuencia de letras

Escribe un programa que lea un texto por teclado (o use uno hardcodeado) y cuente cuántas veces aparece cada **letra** (ignorando espacios, números y signos). Usa un `TreeMap<Character, Integer>` para que las letras se muestren automáticamente ordenadas alfabéticamente.

Ejemplo de salida para «Hola mundo»:
```
a: 1, d: 1, h: 1, l: 1, m: 1, n: 1, o: 2, u: 1
```

**Pista:** recorre el `String` con `toCharArray()` y usa `Character.isLetter(c)` para filtrar. El `getOrDefault` suma el contador; el TreeMap ordena solo.

---

## ⭐⭐⭐ Ejercicio 5: Wildcards — suma y mezcla de números

Implementa un método que sume todos los números de una lista, aceptando cualquier subtipo de `Number`:

```java
public static double sumar(List<? extends Number> lista)
```

Pruébalo con `List<Integer>`, `List<Double>` y `List<Float>`. ¿Qué ocurre si intentas pasar una `List<String>`?

Crea también un segundo método que **mezcle** dos listas de números de tipos distintos en una sola `List<Double>`:

```java
public static List<Double> mezclar(List<? extends Number> a, List<? extends Number> b)
```

**Pista:** para `sumar`, recorre con `for (Number n : lista)` y usa `n.doubleValue()`. Para `mezclar`, usa `addAll()` y convierte cada elemento con `doubleValue()`. Y no intentes `add` en `sumar`: `? extends` es de solo lectura (PECS).

---

## ⭐⭐ Ejercicio 6: Caché LRU con LinkedHashMap

Crea una clase `CacheLRU<K, V>` que use internamente un `LinkedHashMap<K, V>` con capacidad máxima de 5 elementos. Cuando se añade un elemento y ya hay 5, se elimina el **menos recientemente usado** (acceso, no inserción).

**Pista:** `LinkedHashMap` tiene el constructor con `accessOrder=true` y el método protegido `removeEldestEntry()` que devuelve si hay que expulsar al más viejo. Sobrescríbelo para devolver `size() > 5`.

---

## ⭐⭐ Ejercicio 7: Agenda completa con menú

Implementa una agenda usando `HashMap<String, String>` con menú interactivo:

1. **Añadir contacto** (nombre y teléfono).
2. **Buscar por nombre** (muestra el teléfono).
3. **Listar todos** (recorre con `entrySet`).
4. **Borrar contacto**.
0. **Salir**

Usa un `while`, un `switch` y un `Scanner`. Cuida los casos en los que el contacto no existe (usa `containsKey` o `getOrDefault`).

**Pista:** el menú se repite hasta que el usuario elija `0`. Para buscar, comprueba `containsKey(nombre)` antes de `get`.

---

## ⭐⭐⭐ Ejercicio 8: Sistema de votaciones con método genérico

Crea un sistema de votaciones donde:

- Cada votante puede votar por un candidato (String).
- Usa un `HashMap<String, Integer>` para los votos.
- Usa un `TreeMap<String, Integer>` para mostrar el ranking ordenado.

Crea un método genérico:

```java
public static <T> T obtenerGanador(Map<T, Integer> votos)
```

Que devuelva la clave con más votos. Pruébalo con un `HashMap<String, Integer>` y otro `HashMap<Integer, Integer>`.

**Pista:** recorre `votos.entrySet()` y guarda el ganador provisional comparando `getValue()` con un máximo acumulado. El método es genérico porque el tipo de la clave (`String`, `Integer`...) no importa.

---

## ⭐⭐ Ejercicio 9: Pareja genérica con intercambio

Crea una clase genérica `Pareja<T, U>` que almacene dos objetos de tipos posiblemente distintos. Incluye métodos `getPrimero()`, `getSegundo()`, `setPrimero(T)`, `setSegundo(U)` y un método `intercambiar()` que devuelva una nueva `Pareja<U, T>` con los valores intercambiados.

**Pista:** `intercambiar()` crea y devuelve `new Pareja<>(this.segundo, this.primero)`. El orden de los parámetros de tipo cambia: `Pareja<U, T>`.