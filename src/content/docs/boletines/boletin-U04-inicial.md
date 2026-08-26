---
title: Boletín U04 — Inicial
description: "Ejercicios básicos de Algorítmica: fundamentos"
---

# 📝 Boletín U04 — Inicial

> Sin soluciones. Sin prisas. Abre el IDE y deja que tus bucles busquen, ordenen y calculen. El ordenador nunca se cansa de recorrer un array: eres tú quien decide cómo.

---

## Ejercicio 1: ¿Qué imprime? — la búsqueda de la gema

Sin ejecutar, escribe la salida exacta de este programa:

```java
public class BusquedaGema {
    public static void main(String[] args) {
        int[] cofre = {12, 7, 25, 9, 31};
        int objetivo = 9;
        int posicion = -1;

        for (int i = 0; i < cofre.length; i++) {
            if (cofre[i] == objetivo) {
                posicion = i;
                break;
            }
        }

        System.out.println("Posición: " + posicion);
    }
}
```

Pista: recorre el array mentalmente elemento a elemento. ¿En qué índice aparece el 9 por primera vez?

---

## Ejercicio 2: El buscador de tesoros

Escribe un método `public static int buscar(int[] datos, int objetivo)` que recorra el array con un `for` y devuelva el **índice** donde aparece el objetivo. Si no está, devuelve `-1`.

Prueba con `int[] tesoros = {4, 8, 15, 16, 23, 42}`:

- `buscar(tesoros, 15)` → debe devolver `2`
- `buscar(tesoros, 7)` → debe devolver `-1`

Pista: devuelve `i` en cuanto encuentres el objetivo; solo después del bucle devuelves `-1`.

---

## Ejercicio 3: ¿Qué imprime? — la bombolla mínima

Sin ejecutar, escribe la salida exacta de este programa:

```java
public class BombollaMinima {
    public static void main(String[] args) {
        int[] datos = {3, 1, 2};

        for (int i = 0; i < datos.length - 1; i++) {
            for (int j = 0; j < datos.length - 1 - i; j++) {
                if (datos[j] > datos[j + 1]) {
                    int temp = datos[j];
                    datos[j] = datos[j + 1];
                    datos[j + 1] = temp;
                }
            }
        }

        for (int num : datos) {
            System.out.print(num + " ");
        }
    }
}
```

Pista: haz la traza en un papel. Primera pasada: el 3 vs 1, luego 3 vs 2. ¿Qué queda al final?

---

## Ejercicio 4: La caja de zapatos ordenada

Escribe un método `public static void ordenar(int[] datos)` que ordene el array **de menor a mayor** usando la ordenación por inserción.

Prueba con `int[] caja = {9, 2, 7, 1}` y muestra el array resultante con un `for...each`.

Pista: guarda `int clave = datos[i]` y desliza hacia la derecha los elementos mayores con un `while`.

---

## Ejercicio 5: El detective de la búsqueda binaria

Escribe un método `public static int busquedaBinaria(int[] datos, int objetivo)` que use la búsqueda binaria sobre un array **ya ordenado** y devuelva el índice del objetivo (o `-1`).

Prueba con `int[] agenda = {2, 5, 8, 12, 16, 23, 38, 56, 72, 91}`:

- `busquedaBinaria(agenda, 23)` → debe devolver `5`
- `busquedaBinaria(agenda, 30)` → debe devolver `-1`

Pista: dos punteros `izquierda = 0` y `derecha = datos.length - 1`, un `while (izquierda <= derecha)` y `int medio = izquierda + (derecha - izquierda) / 2`.

---

## Ejercicio 6: ¿Qué imprime? — la binaria que falla

Sin ejecutar, escribe la salida exacta de este programa:

```java
public class BinariaQueFalla {
    public static void main(String[] args) {
        int[] datos = {10, 20, 30, 40, 50};
        int objetivo = 35;
        int izquierda = 0;
        int derecha = datos.length - 1;
        boolean encontrado = false;

        while (izquierda <= derecha) {
            int medio = izquierda + (derecha - izquierda) / 2;
            if (datos[medio] == objetivo) {
                encontrado = true;
                break;
            } else if (datos[medio] < objetivo) {
                izquierda = medio + 1;
            } else {
                derecha = medio - 1;
            }
        }

        System.out.println(encontrado);
    }
}
```

Pista: el 35 no está en el array. ¿Qué valor tiene `encontrado` al final del bucle?

---

## Ejercicio 7: El contador de intercambios

Escribe un programa llamado `ContadorIntercambios` que use la bombolla para ordenar `int[] datos = {5, 2, 9, 1, 5}` y **cuente cuántos intercambios** realiza en total. Al final muestra: `Intercambios: X`.

Pista: declara `int intercambios = 0;` y súmale 1 dentro del `if` de intercambio, justo después de la operación.

---

## Ejercicio 8: La nota más alta de la clase

Escribe un método `public static int notaMaxima(int[] notas)` que recorra el array y devuelva la nota más alta.

Prueba con `int[] notas = {7, 9, 5, 10, 6, 8, 4}` → debe devolver `10`.

Pista: usa una variable `maximo` inicializada con el primer elemento (`notas[0]`) y compara con cada uno.

---

## Ejercicio 9: CodeWars — Find the smallest integer in the array

Resuelve la kata **"Find the smallest integer in the array"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/55a2d7ebe362935a210000b2).

Crea el método `public static int findSmallestInt(int[] args)` que devuelva el entero más pequeño del array.

Pista: es el mismo patrón del ejercicio 8: recorre y compara. Aquí el array nunca está vacío.
