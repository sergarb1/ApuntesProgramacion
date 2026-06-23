---
title: "Boletín 9 - Intermedi: Genèrics i Mapes"
nav_order: 9
---
*Exercicis de dificultat progressiva. De ⭐ a ⭐⭐⭐.*

---

## ⭐ Ejercicio 1: Pila genérica `<T>`

Implementa una clase genérica `Pila<T>` que funcione como una pila (LIFO). Debe tener los métodos:

- `void push(T elemento)` — apila un elemento.
- `T pop()` — desapila y devuelve el elemento superior (lanza `EmptyStackException` si está vacía).
- `T peek()` — devuelve el elemento superior sin desapilarlo.
- `boolean isEmpty()` — indica si está vacía.
- `int size()` — número de elementos.

Internamente, usa un `ArrayList<T>` como almacenamiento. Pruébala con `Pila<Integer>`, `Pila<String>` y `Pila<Double>`.

---

## ⭐ Ejercicio 2: HashMap inverso

Escribe un método genérico estático:

```java
public static <K, V> HashMap<V, K> invertirMapa(HashMap<K, V> original)
```

Que devuelva un nuevo `HashMap` intercambiando claves y valores. Si hay valores duplicados en el mapa original, el último encontrado sobrescribe al anterior.

Prueba con un mapa de `String → Integer` y otro de `String → String`.

---

## ⭐ Ejercicio 3: Método genérico — filtrar por condición

Implementa un método genérico:

```java
public static <T> List<T> filtrar(List<T> lista, Predicate<T> condicion)
```

Que devuelva una nueva lista con los elementos que cumplen la condición. Usa la interfaz `Predicate<T>` de Java.

Pruébalo filtrando números pares de una `List<Integer>` y palabras que empiecen por «A» de una `List<String>`.

---

## ⭐⭐ Ejercicio 4: Caché LRU con LinkedHashMap

Crea una clase `CacheLRU<K, V>` que extienda o use internamente un `LinkedHashMap<K, V>` con capacidad máxima de 5 elementos. Cuando se añade un elemento y ya hay 5, se elimina el **menos recientemente usado** (acceso, no inserción).

Pista: `LinkedHashMap` tiene el constructor con `accessOrder=true` y el método `removeEldestEntry()`.

---

## ⭐⭐ Ejercicio 5: TreeMap — frecuencia de letras

Escribe un programa que lea un texto por teclado (o use uno hardcodeado) y cuente cuántas veces aparece cada **letra** (ignorando espacios, números y signos). Usa un `TreeMap<Character, Integer>` para que las letras se muestren automáticamente ordenadas alfabéticamente.

Ejemplo de salida para «Hola mundo»:
```
a: 1, d: 1, h: 1, l: 1, m: 1, n: 1, o: 2, u: 1
```

---

## ⭐⭐ Ejercicio 6 (Wildcards): Suma de números genérica

Implementa un método que sume todos los números de una lista, aceptando cualquier subtipo de `Number`:

```java
public static double sumar(List<? extends Number> lista)
```

Pruébalo con `List<Integer>`, `List<Double>` y `List<Float>`. ¿Qué ocurre si intentas pasar una `List<String>`?

Crea también un segundo método que **mezcle** dos listas de números de tipos distintos en una sola `List<Double>`:

```java
public static List<Double> mezclar(List<? extends Number> a, List<? extends Number> b)
```

---

## ⭐⭐⭐ Ejercicio 7 (ProgramaMe): Sistema de inventario genérico

Crea un sistema de inventario genérico para una tienda:

1. Clase `Producto<T>` con `String nombre`, `double precio`, `T categoria` (el tipo de categoría puede ser `String` o un `Enum`).
2. Clase `Inventario<T>` que almacene `Producto<T>` en un `HashMap<String, Producto<T>>` (clave = nombre del producto).
3. Métodos: `agregar`, `eliminar`, `buscar`, `listar`, `valorTotal()`.
4. Crea un inventario de productos con categoría `String` y otro con categoría `enum`.

---

## ⭐⭐⭐ Ejercicio 8 (CodeWars + AceptaElReto)

Resuelve los siguientes problemas aplicando mapas y genéricos:

**CodeWars:** [Counting Duplicates](https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1) (6 kyu) — Cuenta cuántos caracteres aparecen más de una vez en una cadena. Ideal para `HashMap<Character, Integer>`.

**AceptaElReto:** [416 - Casillas de corrección](https://www.aceptaelreto.com/problem/statement.php?id=416) — Gestiona casillas de corrección usando un mapa de errores por alumno.

---

## 📚 Referències

- **CodeWars:** [Counting Duplicates](https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1) (6 kyu)
- **CodeWars:** [Sort arrays - 1](https://www.codewars.com/kata/51f41b98e8f2e0b8fd0000b5) (6 kyu)
- **CodeWars:** [Merging sorted integer arrays](https://www.codewars.com/kata/573f5c61e7752709df0005d6) (6 kyu)
- **AceptaElReto.com:** [416 - Casillas](https://www.aceptaelreto.com/problem/statement.php?id=416)
- **AceptaElReto.com:** [462 - Tres dedos](https://www.aceptaelreto.com/problem/statement.php?id=462)
- **AceptaElReto.com:** [417 - Binomiales](https://www.aceptaelreto.com/problem/statement.php?id=417)
