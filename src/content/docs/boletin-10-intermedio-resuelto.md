---
title: "Boletín 9 - Resuelto: Genéricos y Mapas"
nav_order: 9
---
*Dificultad progresiva. De ⭐ a ⭐⭐⭐.*

---

## ⭐ Ejercicio 1: Clase genérica `Pareja<T, U>`

Crea una clase genérica `Pareja<T, U>` que almacene dos objetos de tipos posiblemente distintos. Incluye métodos `getPrimero()`, `getSegundo()`, `setPrimero(T)`, `setSegundo(U)` y un método `intercambiar()` que devuelva una nueva `Pareja<U, T>`.

---

## ⭐ Ejercicio 2: Contador de palabras con HashMap

Escribe un programa que lea un texto (hardcodeado o por Scanner) y cuente cuántas veces aparece cada palabra usando `HashMap<String, Integer>`.

---

## ⭐ Ejercicio 3: Método genérico `maximo`

Implementa un método genérico `public static <T extends Comparable<T>> T maximo(T[] array)` que devuelva el elemento más grande de un array usando el método `compareTo()`.

---

## ⭐⭐ Ejercicio 4: Agenda completa con menú

Implementa una agenda usando `HashMap<String, String>` con menú interactivo: añadir contacto, buscar por nombre, listar todos, borrar contacto y salir.

---

## ⭐⭐ Ejercicio 5: TreeMap — ordenando por clave

Crea un programa que lea 5 países y sus capitales, los guarde en un `TreeMap<String, String>` y los muestre ordenados alfabéticamente por país. Luego muestra el primer y último país alfabéticamente.

---

## ⭐⭐⭐ Ejercicio 6 (ProgramaMe): Wildcards — el método de comparación

Crea un método `compararMedias(List<? extends Number> a, List<? extends Number> b)` que compare la media de dos listas de números. Devuelve -1, 0 o 1 según si la media de a es menor, igual o mayor que la de b. Usa wildcards para que acepte `List<Integer>`, `List<Double>`, etc.

---

## ⭐⭐⭐ Ejercicio 7 (ProgramaMe): Sistema de votaciones

Crea un sistema de votaciones donde:
- Cada votante puede votar por un candidato (String)
- Usa un `HashMap<String, Integer>` para los votos
- Usa un `TreeMap<String, Integer>` para mostrar el ranking ordenado

Crea un método genérico `public static <T> T obtenerGanador(Map<T, Integer> votos)` que devuelva la clave con más votos.

---

## ⭐⭐⭐ Ejercicio 8 (ProgramaMe): Cache simple con genéricos

Implementa una clase `Cache<K, V>` que almacene hasta `maxElementos` pares clave-valor usando un `LinkedHashMap<K, V>`. Cuando se añade un elemento y la cache está llena, elimina el elemento más antiguo (LRU - Least Recently Used). Incluye `get(K clave)` y `put(K clave, V valor)`.

---

## 🔗 Referencias para seguir practicando

- **CodeWars:** [Word Count](https://www.codewars.com/kata/570cc83d616be859a5000c9b) (7 kyu)
- **CodeWars:** [Sort arrays - 1](https://www.codewars.com/kata/51f41b98e8f2e0b8fd0000b5) (6 kyu)
- **CodeWars:** [Counting duplicates](https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1) (6 kyu)
- **AceptaElReto.com:** [416 - Casillas](https://www.aceptaelreto.com/problem/statement.php?id=416)
- **AceptaElReto.com:** [417 - Binomiales](https://www.aceptaelreto.com/problem/statement.php?id=417)
- **AceptaElReto.com:** [462 - Tres dedos](https://www.aceptaelreto.com/problem/statement.php?id=462)
