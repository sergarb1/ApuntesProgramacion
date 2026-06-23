---
title: "Boletín 10 — Extras: Genéricos y Mapas"
description: Ejercicios extra de la unidad 10 (CodeWars y AceptaElReto)
---
> ⭐ **Extras — Conviértete en un programador de muy alto nivel**  
> Estos ejercicios son completamente opcionales, pero si aspiras a ser un programador o programadora de élite, aquí tienes tu campo de entrenamiento. CodeWars y AceptaElReto son plataformas donde los mejores programadores del mundo se retan a diario. Cada problema que resuelvas te hará más fuerte, más rápido y más creativo. No los subestimes: son la diferencia entre saber programar y ser un verdadero profesional.

**CodeWars:**

- [Counting sheep](https://www.codewars.com/kata/54edbc7200b811e956000556) (8 kyu)
> **Pista:** Filtra los valores `null` y cuenta los `true` con `stream().filter(b -> b).count()`.
- [Find the unique number](https://www.codewars.com/kata/585d7d5adb20cf33cb000235) (6 kyu)
> **Pista:** Divide los tres primeros números para saber cuál se repite; el que no coincide es el único. O usa XOR.
- [Array.diff](https://www.codewars.com/kata/523f5d21c841566fde000009) (6 kyu)
> **Pista:** Convierte el segundo array en un `Set<Integer>` y filtra el primero con `removeIf` o un stream.

**AceptaElReto:**

- [302 - Cuadrado mágico](https://www.aceptaelreto.com/problem/statement.php?id=302) (⭐⭐)
> **Pista:** Calcula la suma objetivo = total / n; verifica filas, columnas y diagonales contra ese valor.
- [432 - Número de veces que aparece](https://www.aceptaelreto.com/problem/statement.php?id=432) (⭐)
> **Pista:** Usa un `HashMap<Character, Integer>` para contar frecuencias de cada carácter.

**CodeWars:**

- [Who likes it?](https://www.codewars.com/kata/5266876b8f4bf2da9b000362) (6 kyu)
> **Pista:** Usa un `Map<Integer, String>` con los patrones de respuesta. La clave es el tamaño del array, el valor es el template.

**AceptaElReto:**

- [217 - ¿Qué lado de la calle?](https://www.aceptaelreto.com/problem/statement.php?id=217) (⭐⭐)
> **Pista:** Lee el número como `String`, no como `int`. Solo te interesa el último dígito para saber si es par o impar.
