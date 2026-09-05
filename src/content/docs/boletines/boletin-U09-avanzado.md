---
title: "Boletín U09 — Avanzado"
description: "Ejercicios de dificultad progresiva para exprimir la unidad"
---

# 📝 Boletín U09 — Avanzado

> Dificultad progresiva. ⭐ para calentar, ⭐⭐ para pensar, ⭐⭐⭐ para concursar. Cada ejercicio incluye una pista (resiste a mirarla).

---

## ⭐ Ejercicio 1: La fusión de arrays ordenados

Escribe un método `fusionarArrays(int[] a, int[] b)` que reciba dos arrays ordenados de menor a mayor y devuelva un **nuevo array** también ordenado con todos los elementos de ambos. No uses `Arrays.sort()` ni colecciones. Hazlo con el algoritmo de fusión (merge) tipo «dos punteros».

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

## ⭐⭐ Ejercicio 4: La cola del supermercado con LinkedList

Simula una cola de supermercado usando `LinkedList<String>`. El programa debe mostrar un menú:

1. **Llega cliente** → Añade un nombre al final de la cola.
2. **Atender cliente** → Elimina y muestra el primero de la cola.
3. **¿Quién sigue?** → Muestra el primero sin eliminarlo.
4. **Estado de la cola** → Muestra todos los clientes en orden.
0. **Salir**

Usa los métodos `addLast()`, `removeFirst()` y `getFirst()` de `LinkedList`, con un `switch` y un `Scanner`.

**Pista:** el menú se repite con un `while` hasta que el usuario elija `0`. Cuida los casos en los que la cola está vacía antes de llamar a `removeFirst()` o `getFirst()`.

---

## ⭐⭐ Ejercicio 5: Intersección y unión de conjuntos

Crea dos `HashSet<Integer>` con números aleatorios (entre 1 y 20, 8 elementos cada uno). Calcula y muestra:

- **Intersección:** elementos que están en ambos conjuntos.
- **Unión:** todos los elementos sin repetir.
- **Diferencia simétrica:** elementos que están en uno u otro, pero no en ambos.

**Pista:** usa `retainAll()`, `addAll()` y `removeAll()` de la interfaz `Set`. Para la diferencia simétrica: `union.removeAll(interseccion)`.

---

## ⭐⭐ Ejercicio 6: Eliminar duplicados manteniendo el orden

Crea un `ArrayList<Integer>` con elementos repetidos (`[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]`). Escribe un método que devuelva un nuevo `ArrayList<Integer>` **sin duplicados pero manteniendo el orden de primera aparición**.

**Pista:** un `HashSet` no vale directamente porque pierde el orden. Usa un `LinkedHashSet` (conserva el orden de inserción) o recorre manualmente comprobando con `contains` antes de añadir.

---

## ⭐⭐⭐ Ejercicio 7: ¿Qué imprime? — el remove que rompe el baile

Sin ejecutar, responde qué ocurre con este programa:

```java
import java.util.ArrayList;

public class Puzle {
    public static void main(String[] args) {
        ArrayList<String> palabras = new ArrayList<>();
        palabras.add("hola");
        palabras.add("mundo");
        palabras.add("adiós");

        for (String p : palabras) {
            if (p.equals("mundo")) {
                palabras.remove(p);
            }
        }
        System.out.println(palabras);
    }
}
```

¿Imprime algo? ¿O lanza una excepción? ¿Cuál y por qué?

**Pista:** piensa en lo que hace el `for-each` por debajo (usa un `Iterator`) y en lo que pasa si la colección cambia mientras se recorre.

---

## ⭐⭐⭐ Ejercicio 8: Estadísticas de clase

Pide al usuario las notas de 20 alumnos con `Scanner`, guárdalas en un `double[]` y calcula:

- La nota media.
- La nota más alta y la más baja.
- Cuántos alumnos aprobaron (nota >= 5).

Usa un bucle para rellenar, otro para sumar y el patrón del máximo/mínimo acumulado.

**Pista:** para el mínimo empieza con `Double.MAX_VALUE` (o con la primera nota); para el máximo, con `Double.MIN_VALUE` (o la primera nota). Guarda las notas en un array y recórrelo varias veces: cada cálculo es un bucle.

---

## ⭐⭐⭐ Ejercicio 9: El gran reto — buscaminas simplificado

Crea un array bidimensional `boolean[5][5]` que represente un campo de minas. Coloca 5 minas en posiciones **aleatorias** (con `Math.random()`). El usuario introduce coordenadas `(fila, columna)` y el programa dice si hay mina o no. Si acierta una mina, el juego termina mostrando «¡BOOM!».

Extras opcionales: di cuántas minas hay alrededor de la casilla (mira las 8 vecinas) y termina cuando hayas comprobado todas las casillas sin minas.

**Pista:** comprueba antes de mirar una vecina que su fila y su columna estén entre 0 y 4, o te saldrás del array con `ArrayIndexOutOfBoundsException`. El juego usa un `while` que termina al pisar una mina o al agotar las casillas.