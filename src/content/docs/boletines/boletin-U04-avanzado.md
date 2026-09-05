---
title: "Boletín U04 — Avanzado"
description: "Ejercicios de dificultad progresiva para exprimir los arrays"
---

# 📝 Boletín U04 — Avanzado

> Dificultad progresiva. ⭐ para calentar, ⭐⭐ para pensar, ⭐⭐⭐ para concursar. Cada ejercicio incluye una pista (resiste a mirarla).

---

## ⭐ Ejercicio 1: La fusión de arrays ordenados

Escribe un método `fusionarArrays(int[] a, int[] b)` que reciba dos arrays ordenados de menor a mayor y devuelva un **nuevo array** también ordenado con todos los elementos de ambos. No uses `Arrays.sort()`. Hazlo con el algoritmo de fusión (merge) tipo «dos punteros».

**Pista:** avanza con dos índices, uno por array, comparando en cada paso cuál elemento es menor. Cuando un array se acabe, copia el resto del otro.

---

## ⭐ Ejercicio 2: Rotación circular a la derecha

Implementa un método `rotarDerecha(int[] arr, int k)` que desplace cada elemento del array `k` posiciones hacia la derecha. Los elementos que «salen» por el final vuelven a entrar por el principio.

Ejemplo: `{1, 2, 3, 4, 5}` con `k = 2` → `{4, 5, 1, 2, 3}`.

**Pista:** usa un array temporal del tamaño de `k` con los últimos `k` elementos, desplaza el resto hacia la derecha y luego coloca los guardados al principio. (O divide los índices con `(i + k) % arr.length`.)

---

## ⭐ Ejercicio 3: Suma de diagonales (matriz cuadrada)

Crea un programa que genere una matriz cuadrada `int[N][N]` con valores aleatorios entre 1 y 100, y calcule:

1. Suma de la **diagonal principal** (de arriba-izquierda a abajo-derecha).
2. Suma de la **diagonal secundaria** (de arriba-derecha a abajo-izquierda).
3. Diferencia absoluta entre ambas sumas.

Usa `N = 5` para las pruebas y `Math.random()` para rellenarla.

**Pista:** en la diagonal principal, `fila == columna`, así que un solo bucle con `matriz[i][i]` basta. En la secundaria, `columna = N - 1 - i`.

---

## ⭐⭐ Ejercicio 4: ¿Está ordenado?

Escribe un método `public static boolean estaOrdenado(int[] arr)` que devuelva `true` si el array está ordenado **de menor a mayor** (cada elemento es menor o igual que el siguiente), y `false` en caso contrario.

Pruebas:

- `estaOrdenado({1, 2, 3, 4})` → `true`
- `estaOrdenado({1, 3, 2, 4})` → `false`
- `estaOrdenado({})` → `true`
- `estaOrdenado({7})` → `true`

**Pista:** recorre con un `for` de `i = 1` hasta el final y pregunta si `arr[i] < arr[i - 1]`. En cuanto un vecino rompa el orden, devuelve `false`.

---

## ⭐⭐ Ejercicio 5: El inverso en el sitio

Escribe un método `public static void invertir(int[] arr)` que dé la vuelta al array **sin crear otro array** (usa dos punteros y una variable temporal).

Prueba con `{1, 2, 3, 4, 5}` y muestra el resultado con `Arrays.toString` → debe salir `[5, 4, 3, 2, 1]`.

**Pista:** `izquierda = 0` y `derecha = arr.length - 1`; mientras `izquierda < derecha`, intercambia y mueve ambos hacia el centro.

---

## ⭐⭐ Ejercicio 6: ¿Qué imprime? — el doble bucle que cuenta parejas

Sin ejecutar, escribe la salida exacta de este programa:

```java
public class CuentaParejas {
    public static void main(String[] args) {
        int[] datos = {2, 4, 6};
        int contador = 0;

        for (int i = 0; i < datos.length; i++) {
            for (int j = i + 1; j < datos.length; j++) {
                if (datos[i] < datos[j]) {
                    contador++;
                }
            }
        }

        System.out.println(contador);
    }
}
```

**Pista:** cuenta las parejas `(i, j)` con `i < j` donde el primero es menor que el segundo. Con `{2, 4, 6}` todas las parejas lo cumplen. ¿Cuántas hay?

---

## ⭐⭐⭐ Ejercicio 7: Estadísticas de clase

Pide al usuario las notas de 20 alumnos con `Scanner`, guárdalas en un `double[]` y calcula:

- La nota media.
- La nota más alta y la más baja.
- Cuántos alumnos aprobaron (nota >= 5).

Usa un bucle para rellenar, otro para sumar y el patrón del máximo/mínimo acumulado.

**Pista:** para el mínimo empieza con la primera nota; para el máximo, también. Guarda las notas en un array y recórrelo varias veces: cada cálculo es un bucle.

---

## ⭐⭐⭐ Ejercicio 8: El gran reto — buscaminas simplificado

Crea un array bidimensional `boolean[5][5]` que represente un campo de minas. Coloca 5 minas en posiciones **aleatorias** (con `Math.random()`). El usuario introduce coordenadas `(fila, columna)` y el programa dice si hay mina o no. Si acierta una mina, el juego termina mostrando «¡BOOM!».

Extras opcionales: di cuántas minas hay alrededor de la casilla (mira las 8 vecinas) y termina cuando hayas comprobado todas las casillas sin minas.

**Pista:** comprueba antes de mirar una vecina que su fila y su columna estén entre 0 y 4, o te saldrás del array con `ArrayIndexOutOfBoundsException`. El juego usa un `while` que termina al pisar una mina o al agotar las casillas.

---

## ⭐⭐⭐ Ejercicio 9: Compactar — los ceros al final

Escribe un método `public static void compactar(int[] arr)` que mueva todos los ceros al final del array, **manteniendo el orden** de los elementos que no son cero.

Ejemplos:

- `{0, 3, 0, 1, 0, 2}` → `{3, 1, 2, 0, 0, 0}`
- `{1, 2, 3}` → `{1, 2, 3}`
- `{0, 0, 0}` → `{0, 0, 0}`

**Pista:** usa un segundo índice `pos` que marque dónde va el siguiente valor no cero. Recorre con `i`, y cuando `arr[i]` no sea 0, cópialo a `arr[pos]` y sube `pos`. Al final, rellena de ceros desde `pos` hasta el final.