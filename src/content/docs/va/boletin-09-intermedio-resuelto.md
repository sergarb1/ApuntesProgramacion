---
title: "Boletín 8 - Resuelto: Arrays y Colecciones"
nav_order: 8
---
*Dificultad progresiva. De ⭐ a ⭐⭐⭐.*

---

## ⭐ Ejercicio 1: El inversor de arrays

Escribe un método `invertirArray(int[] arr)` que devuelva un nuevo array con los elementos en orden inverso. Pruébalo en `main()`.

---

## ⭐ Ejercicio 2: ArrayList de números pares

Crea un programa que genere los primeros 20 números pares (2, 4, 6, ..., 40) y los guarde en un `ArrayList<Integer>`. Luego, recorre la lista y suma solo los que sean múltiplos de 5.

---

## ⭐ Ejercicio 3: Estadísticas con array

Pide al usuario las notas de 10 alumnos (usa `Scanner`), guárdalas en un array `double[]`, y calcula: nota media, nota máxima, nota mínima y cuántos aprobaron (>= 5).

---

## ⭐⭐ Ejercicio 4: Buscaminas simplificado

Crea un array bidimensional `boolean[5][5]` que represente un campo de minas. Coloca 5 minas (`true`) en posiciones aleatorias. El usuario introduce coordenadas (fila, columna) y el programa dice si hay mina. Si acierta una mina, el juego termina.

---

## ⭐⭐ Ejercicio 5: Lista de la compra con ArrayList

Crea un programa que gestione una lista de la compra usando `ArrayList<String>`. Menú con opciones: 1) Añadir, 2) Eliminar, 3) Marcar como comprado (añadir "[OK]" al final), 4) Mostrar lista, 0) Salir.

---

## ⭐⭐ Ejercicio 6: HashSet y TreeSet — eliminando duplicados

Crea un programa que lea una frase del usuario, separe las palabras (con `split(" ")`), las guarde en un `TreeSet<String>` y luego las muestre ordenadas alfabéticamente y sin duplicados.

---

## ⭐⭐⭐ Ejercicio 7 (ProgramaMe): El juego de la memoria

Crea un juego de memoria usando un array bidimensional `int[4][4]`. Coloca 8 pares de números (1-8) en posiciones aleatorias. El jugador destapa dos posiciones. Si son iguales, permanecen visibles. Si no, se ocultan de nuevo. El juego termina cuando todos los pares están descubiertos.

---

## ⭐⭐⭐ Ejercicio 8 (ProgramaMe): Estadísticas de texto con colecciones

Crea un programa que analice un texto largo (puedes hardcodearlo) y muestre:
1. Número total de palabras
2. Las 5 palabras más frecuentes
3. La palabra más larga
4. Porcentaje de palabras únicas

Usa `HashMap<String, Integer>` para frecuencias, `TreeSet` para orden, y `ArrayList` para manipulación.

---

## 🔗 Referencias para seguir practicando

- **CodeWars:** [Convert number to reversed array of digits](https://www.codewars.com/kata/5583090cbe83f4fd8c000051) (8 kyu)
- **CodeWars:** [Find the smallest integer in the array](https://www.codewars.com/kata/55a2d7ebe362532a0a000018) (7 kyu)
- **CodeWars:** [Sorting arrays](https://www.codewars.com/kata/56ff6a70e1a63ccdfa0001b1) (7 kyu)
- **AceptaElReto.com:** [100 - Kaprekar](https://www.aceptaelreto.com/problem/statement.php?id=100)
- **AceptaElReto.com:** [340 - Juegos de naipes](https://www.aceptaelreto.com/problem/statement.php?id=340)
- **AceptaElReto.com:** [101 - Cuadrado Sator](https://www.aceptaelreto.com/problem/statement.php?id=101)
