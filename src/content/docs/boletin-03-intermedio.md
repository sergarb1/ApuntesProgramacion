---
title: "Boletín 3 - Intermedio: Estructuras de Control"
nav_order: 10
---
Dificultad progresiva. Los ⭐ te calientan, los ⭐⭐ te hacen pensar, los ⭐⭐⭐ te preparan para el mundo real (y para que el switch no se te atragante).

---

## ⭐ Ejercicio 1: Números pares e impares

Escribe un programa que recorra los números del 1 al 20 y muestre al lado si cada uno es par o impar. Usa un `for` y el operador `%` dentro de un `if-else`.

Salida esperada:
```
1 es impar
2 es par
3 es impar
...
20 es par
```

---

## ⭐ Ejercicio 2: Suma acumulativa

Pide números al usuario (con `Scanner`) hasta que introduzca un 0. Muestra la suma acumulada después de cada número. Usa un bucle `while`.

Ejemplo de ejecución:
```
Introduce un número (0 para salir): 5
Suma acumulada: 5
Introduce un número (0 para salir): 3
Suma acumulada: 8
Introduce un número (0 para salir): 0
Suma acumulada final: 8
```

---

## ⭐⭐ Ejercicio 3: Número perfecto

Un número perfecto es aquel que es igual a la suma de sus divisores propios (excluyéndose a sí mismo). Por ejemplo, 6 = 1 + 2 + 3. Escribe un programa que pida un número N y determine si es perfecto o no.

Pista: usa un `for` que vaya de 1 a N/2, comprobando si N es divisible entre i (`N % i == 0`) y sumando los divisores.

---

## ⭐⭐ Ejercicio 4: Menú con validación

Crea un programa que muestre un menú de operaciones y valide que la opción sea correcta. Usa un `do-while` para el menú principal y un `switch` para las opciones.

```
=== CALCULADORA RUPESTRE ===
1. Sumar
2. Restar
3. Multiplicar
4. Salir
Elige opción (1-4):
```

Si el usuario elige una opción inválida (menor que 1 o mayor que 4), muestra "Opción no válida, intenta de nuevo" y repite el menú. Las opciones 1-3 deben pedir dos números y mostrar el resultado. La opción 4 termina el programa.

---

## ⭐⭐⭐ Ejercicio 5: Criba de Eratóstenes (números primos)

Escribe un programa que pida un número N y muestre todos los números primos desde 2 hasta N usando la **Criba de Eratóstenes**:

1. Crea un array de booleanos con tamaño N+1, inicializado a `true` (todos son primos en teoría)
2. Desde 2 hasta √N, si el número es primo, marca como `false` todos sus múltiplos
3. Al final, imprime los números que siguen siendo `true`

Ejemplo para N = 30:
```
Primos: 2 3 5 7 11 13 17 19 23 29
```

---

## ⭐⭐⭐ Ejercicio 6: CodeWars — Vowel Count

Resuelve la kata **"Vowel Count"** (7 kyu) en [CodeWars](https://www.codewars.com/kata/54ff3102c1bad923760001f3).

Devuelve el número de vocales (a, e, i, o, u) en un String dado. La entrada será solo minúsculas y espacios. Por ejemplo, `"hola mundo"` tiene 4 vocales.

---

## ⭐⭐⭐ Ejercicio 7: AceptaElReto — 151 ¿Es matriz identidad?

Resuelve el problema **151 — ¿Es matriz identidad?** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=151).

Dada una matriz cuadrada, determina si es la matriz identidad: todos los 1 en la diagonal principal y 0 en el resto. El programa debe leer casos de prueba, cada uno con un tamaño N seguido de N×N números.

Pista: para recorrer la matriz, necesitarás bucles anidados. La diagonal principal son las posiciones donde fila == columna.

---

## 📚 Referencias

| Plataforma | Problema | Dificultad |
|---|---|---|
| AceptaElReto | 151 — ¿Es matriz identidad? | Medio |
| AceptaElReto | 200 — Aburrimiento en las aulas | Medio |
| AceptaElReto | 340 — Juegos de naipes | Medio |
| CodeWars | Century From Year (8 kyu) | Principiante |
| CodeWars | Vowel Count (7 kyu) | Fácil |
| CodeWars | Cat years, Dog years (7 kyu) | Fácil |
