---
title: "Boletín 8 - Intermedio: Arrays y Colecciones"
nav_order: 8
---
*Ejercicios de dificultad progresiva. De ⭐ a ⭐⭐⭐.*

---

## ⭐ Ejercicio 1: La fusión de arrays ordenados

Escribe un método `fusionarArrays(int[] a, int[] b)` que reciba dos arrays ordenados de menor a mayor y devuelva un **nuevo array** también ordenado con todos los elementos de ambos. No uses `Arrays.sort()` ni colecciones. Hazlo con el algoritmo de fusión (merge) tipo «dos punteros».

> **Pista:** Avanza con dos índices, uno por array, comparando en cada paso cuál elemento es menor.

---

## ⭐ Ejercicio 2: Rotación circular a la derecha

Implementa un método `rotarDerecha(int[] arr, int k)` que desplace cada elemento del array `k` posiciones hacia la derecha. Los elementos que «salen» por el final vuelven a entrar por el principio. No uses estructuras auxiliares grandes (vale un array temporal del tamaño de k, pero no copies todo).

Ejemplo: `{1, 2, 3, 4, 5}` con `k = 2` → `{4, 5, 1, 2, 3}`.

---

## ⭐ Ejercicio 3: Suma de diagonales (matriz cuadrada)

Crea un programa que genere una matriz cuadrada `int[N][N]` con valores aleatorios entre 1 y 100, y calcule:

1. Suma de la **diagonal principal** (de arriba-izquierda a abajo-derecha).
2. Suma de la **diagonal secundaria** (de arriba-derecha a abajo-izquierda).
3. Diferencia absoluta entre ambas sumas.

Usa `N = 5` para las pruebas.

---

## ⭐⭐ Ejercicio 4: Cola del supermercado con LinkedList

Simula una cola de supermercado usando `LinkedList<String>`. El programa debe mostrar un menú:

1. **Llega cliente** → Añade un nombre al final de la cola.
2. **Atender cliente** → Elimina y muestra el primero de la cola.
3. **¿Quién sigue?** → Muestra el primero sin eliminarlo.
4. **Estado de la cola** → Muestra todos los clientes en orden.
0. **Salir**

Usa los métodos `addLast()`, `removeFirst()`, `getFirst()` de `LinkedList`.

---

## ⭐⭐ Ejercicio 5: Intersección y unión de conjuntos

Crea dos `HashSet<Integer>` con números aleatorios (entre 1 y 20, 8 elementos cada uno). Calcula y muestra:

- **Intersección:** elementos que están en ambos conjuntos.
- **Unión:** todos los elementos sin repetir.
- **Diferencia simétrica:** elementos que están en uno u otro, pero no en ambos.

Pista: Usa `retainAll()`, `addAll()`, `removeAll()` de la interfaz `Set`.

---

## ⭐⭐ Ejercicio 6: Eliminar duplicados manteniendo orden

Crea un `ArrayList<Integer>` con elementos repetidos (`[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]`). Escribe un método que devuelva un nuevo `ArrayList<Integer>` **sin duplicados pero manteniendo el orden de primera aparición**. No puedes usar `HashSet` directamente porque pierdes el orden. La solución es usar un `LinkedHashSet` o recorrer manualmente.

---

## ⭐⭐⭐ Ejercicio 7 (CodeWars): Find the odd int

Dado un array de enteros, encuentra el que aparece un número impar de veces.

```java
public static int findIt(int[] arr) {
    // tu código aquí
}
```

Ejemplo: `{1, 2, 2, 3, 3, 3, 4, 3, 3, 3, 2, 2, 1}` → devuelve `4`.

Pista: Puedes usar un `HashMap<Integer, Integer>` para contar frecuencias, o el truco del XOR (operador `^`).

🔗 **CodeWars:** [Find the odd int](https://www.codewars.com/kata/54da5a58ea159efa38000836) (6 kyu)

---

## ⭐⭐⭐ Ejercicio 8 (AceptaElReto): La lotería de la peña

En una peña de lotería, cada socio aporta una cantidad y compra participaciones. Implementa un programa que:

1. Lea un array con las aportaciones de cada socio (en euros).
2. Calcule el total recaudado.
3. Si toca un premio de X euros, calcule cuánto le corresponde a cada socio proporcionalmente a su aportación.
4. Muestre los resultados ordenados de mayor a menor ganancia.

Usa arrays para almacenar nombres y aportaciones. El premio se pide por teclado.

🔗 **AceptaElReto.com:** [340 - Juegos de naipes](https://www.aceptaelreto.com/problem/statement.php?id=340)

---

## 📚 Referencias

- **CodeWars:** [Find the odd int](https://www.codewars.com/kata/54da5a58ea159efa38000836) (6 kyu)
- **CodeWars:** [Array.diff](https://www.codewars.com/kata/523f5d21c841566fde000009) (6 kyu)
- **CodeWars:** [Sort the odd](https://www.codewars.com/kata/578aa45ee9fd15ff4600090d) (6 kyu)
- **AceptaElReto.com:** [340 - Juegos de naipes](https://www.aceptaelreto.com/problem/statement.php?id=340)
- **AceptaElReto.com:** [101 - Cuadrado Sator](https://www.aceptaelreto.com/problem/statement.php?id=101)
- **AceptaElReto.com:** [241 - Buscando el nivel](https://www.aceptaelreto.com/problem/statement.php?id=241)
