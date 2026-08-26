---
title: Boletín U03 — Avanzado
description: Ejercicios de dificultad progresiva para exprimir la unidad
---

# 📝 Boletín U03 — Avanzado

> Dificultad progresiva. ⭐ para calentar, ⭐⭐ para pensar, ⭐⭐⭐ para concursar. Cada ejercicio incluye una pista (resiste a mirarla).

---

## ⭐ Ejercicio 1: La calculadora de notas

Escribe un programa que convierta una nota numérica (`double nota`) en su calificación textual usando `if`/`else if`:

- `>= 9` → "Sobresaliente"
- `>= 7` → "Notable"
- `>= 5` → "Aprobado"
- `>= 0` → "Suspenso"
- Cualquier otro valor (negativo o mayor que 10) → "Nota inválida"

Usa `double nota = 8.7;` y muestra el resultado. Fíjate en el orden: el caso inválido debe comprobarse antes que los rangos.

**Pista:** un `if` inicial para el caso inválido (`nota < 0 || nota > 10`) y después la cascada de rangos de arriba abajo.

---

## ⭐ Ejercicio 2: El menú que no se rinde

Escribe un programa que muestre un menú de dos opciones (1. Jugar, 2. Salir) con `do-while` y repita la pregunta hasta que el usuario escriba 1 o 2. Usa `Scanner`. Al final muestra "Has elegido la opción X.".

**Pista:** `do { ... } while (opcion != 1 && opcion != 2);`. El `do-while` garantiza que el menú se muestre al menos una vez.

---

## ⭐⭐ Ejercicio 3: ¿Qué imprime? — la pirámide

Sin ejecutar, escribe la salida exacta:

```java
public class Piramide {
    public static void main(String[] args) {
        for (int fila = 1; fila <= 4; fila++) {
            for (int col = 1; col <= fila; col++) {
                System.out.print("*");
            }
            System.out.println();
        }
    }
}
```

**Pista:** el bucle interior depende de `fila`: la fila 1 imprime 1 asterisco, la fila 2 imprime 2... ¿Cuántos asteriscos en total?

---

## ⭐⭐ Ejercicio 4: La escalera de números

Escribe un programa que imprima esta escalera de números (bucles anidados):

```
1
1 2
1 2 3
1 2 3 4
```

**Pista:** bucle exterior del 1 al 4 (las filas) y bucle interior que imprime del 1 al número de fila, con `print` para no saltar de línea y un `println()` vacío al final de cada fila.

---

## ⭐⭐⭐ Ejercicio 5: ¿Qué imprime? — break, continue y la etiqueta

Sin ejecutar, escribe la salida exacta:

```java
public class Escapista {
    public static void main(String[] args) {
        exterior:
        for (int i = 1; i <= 4; i++) {
            for (int j = 1; j <= 3; j++) {
                if (j == 2 && i >= 3) {
                    continue exterior;
                }
                if (i * j >= 8) {
                    break exterior;
                }
                System.out.print(i + "" + j + " ");
            }
        }
    }
}
```

**Pista:** haz una tabla de pares `(i, j)`. El `continue exterior` salta a la siguiente `i`; el `break exterior` apaga todos los bucles. Comprueba par a par hasta dónde llega.

---

## ⭐⭐ Ejercicio 6: Cazador de primos

Escribe un programa que imprima todos los números primos del 1 al 50, cada uno en su línea. Reutiliza la lógica del detective de divisores (`for` + `break`) dentro de otro `for`.

**Pista:** anida dos bucles: uno que recorra del 1 al 50 y otro interior que busque divisores. Usa un booleano `esPrimo` que se ponga a `false` con `break` si aparece un divisor.

---

## ⭐⭐ Ejercicio 7: La suma centinela

Escribe un programa que sume números enteros introducidos por el usuario hasta que escriba `0`. Muestra la suma final. Usa `while` y un centinela.

**Pista:** `while (numero != 0) { suma += numero; numero = sc.nextInt(); }`. El 0 no se suma: es la señal de parada.

---

## ⭐⭐⭐ Ejercicio 8: CodeWars — Categorize New Member

Resuelve la kata **"Categorize New Member"** (7 kyu) en [CodeWars](https://www.codewars.com/kata/5502c9e7b3216ec63c0001aa).

Completa el método `public static String[] openOrSenior(int[][] data)` que recibe pares `{edad, handicap}` y devuelve `"Senior"` si el miembro tiene al menos 55 años Y un handicap mayor que 7; si no, `"Open"`.

**Pista:** recorre el array con un `for` y decide cada caso con una condición combinada (`&&`): `data[i][0] >= 55 && data[i][1] > 7`.

---

## ⭐⭐⭐ Ejercicio 9: AceptaElReto — 156 Ascensor

Resuelve el problema **156 — Ascensor** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=156).

Un ascensor parte de la planta 0. Dado un número de visitas y las plantas de cada visita, calcula la distancia total recorrida. El valor `0` indica el fin de la entrada (no se procesa). Usa `Math.abs()` para las distancias.

**Ejemplo:**

```
5
5 1 10 4 2
0
```

Distancia: |0-5| + |5-1| + |1-10| + |10-4| + |4-2| = 5 + 4 + 9 + 6 + 2 = **26**.

**Pista:** un `while` que lea el número de visitas y rompa con `break` si es 0; dentro, un `for` que acumule `Math.abs(piso - pisoActual)` y actualice `pisoActual`.

---

## 📚 Referencias

| Plataforma | Problema | Dificultad |
|---|---|---|
| AceptaElReto | 156 — Ascensor | Fácil |
| AceptaElReto | 149 — San Fermines | Fácil |
| AceptaElReto | 340 — Siguiente con mismo número de cifras | Medio |
| CodeWars | Even or Odd (8 kyu) | Principiante |
| CodeWars | Categorize New Member (7 kyu) | Aficionado |
| CodeWars | Return Negative (8 kyu) | Principiante |
