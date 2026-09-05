---
title: Boletín U05 — Inicial Resuelto
description: Los mismos ejercicios que el boletín inicial, con soluciones
---

# 📝 Boletín U05 — Inicial (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## Ejercicio 1: ¿Qué imprime? — la búsqueda de la gema

<details>
<summary>🔄 Solución</summary>

Imprime **`Posición: 3`**.

Recorrido: `cofre[0] = 12` (no), `cofre[1] = 7` (no), `cofre[2] = 25` (no), `cofre[3] = 9` (¡sí!). Guardamos `posicion = 3` y el `break` corta el bucle. No hace falta seguir buscando: ya está.

</details>

---

## Ejercicio 2: El buscador de tesoros

<details>
<summary>🔄 Solución</summary>

```java
public static int buscar(int[] datos, int objetivo) {
    for (int i = 0; i < datos.length; i++) {
        if (datos[i] == objetivo) {
            return i;
        }
    }
    return -1;
}
```

Si lo encuentra, el `return i` devuelve el índice y corta el método al instante. Solo si el bucle termina entero sin encontrarlo, se ejecuta el `return -1`. Ese `-1` es la contraseña universal del "no encontrado" que usa toda la industria.

</details>

---

## Ejercicio 3: ¿Qué imprime? — la bombolla mínima

<details>
<summary>🔄 Solución</summary>

Imprime **`1 2 3 `**.

Traza de la bombolla sobre `{3, 1, 2}`:

| Pasada | j | Compara | Intercambia | Array |
|---|---|---|---|---|
| 1 | 0 | 3 vs 1 | Sí | 1 3 2 |
| 1 | 1 | 3 vs 2 | Sí | 1 2 3 |
| 2 | 0 | 1 vs 2 | No | 1 2 3 |

La pasada 2 solo comprueba (el `-1 - i` reduce el recorrido) y confirma que ya está ordenado.

</details>

---

## Ejercicio 4: La caja de zapatos ordenada

<details>
<summary>🔄 Solución</summary>

```java
public static void ordenar(int[] datos) {
    for (int i = 1; i < datos.length; i++) {
        int clave = datos[i];
        int j = i - 1;

        while (j >= 0 && datos[j] > clave) {
            datos[j + 1] = datos[j];
            j--;
        }
        datos[j + 1] = clave;
    }
}

// En main:
int[] caja = {9, 2, 7, 1};
ordenar(caja);
for (int num : caja) {
    System.out.print(num + " ");
}
```

Salida: `1 2 7 9 `

Sobre `{9, 2, 7, 1}`: el 2 se cuela a la izquierda del 9, el 7 entra entre el 2 y el 9, y el 1 viaja hasta el principio. Cada elemento se inserta en su sitio dentro de la "mano" ya ordenada.

</details>

---

## Ejercicio 5: El detective de la búsqueda binaria

<details>
<summary>🔄 Solución</summary>

```java
public static int busquedaBinaria(int[] datos, int objetivo) {
    int izquierda = 0;
    int derecha = datos.length - 1;

    while (izquierda <= derecha) {
        int medio = izquierda + (derecha - izquierda) / 2;

        if (datos[medio] == objetivo) {
            return medio;
        } else if (datos[medio] < objetivo) {
            izquierda = medio + 1;
        } else {
            derecha = medio - 1;
        }
    }
    return -1;
}
```

Para el 23: medio = 4 (16 < 23 → izquierda = 5), medio = 7 (56 > 23 → derecha = 6), medio = 5 (23 → devuelve 5). Para el 30: descarta y descarta hasta que `izquierda` supera a `derecha` y cae el `return -1`. Los `+1`/`-1` son los que garantizan que el segmento siempre se reduce.

</details>

---

## Ejercicio 6: ¿Qué imprime? — la binaria que falla

<details>
<summary>🔄 Solución</summary>

Imprime **`false`**.

El 35 no está en el array. La binaria va descartando mitades: medio = 2 (30 < 35 → izquierda = 3), medio = 4 (50 > 35 → derecha = 3), medio = 3 (40 > 35 → derecha = 2). Ahora `izquierda = 3` > `derecha = 2`, el `while` termina y `encontrado` sigue en `false`. Sin error, sin drama: el "no encontrado" también se comunica.

</details>

---

## Ejercicio 7: El contador de intercambios

<details>
<summary>🔄 Solución</summary>

```java
public class ContadorIntercambios {
    public static void main(String[] args) {
        int[] datos = {5, 2, 9, 1, 5};
        int intercambios = 0;

        for (int i = 0; i < datos.length - 1; i++) {
            for (int j = 0; j < datos.length - 1 - i; j++) {
                if (datos[j] > datos[j + 1]) {
                    int temp = datos[j];
                    datos[j] = datos[j + 1];
                    datos[j + 1] = temp;
                    intercambios++;
                }
            }
        }

        System.out.println("Intercambios: " + intercambios);
    }
}
```

Salida: `Intercambios: 5`

Cada vez que el `if` dispara un intercambio, sumamos 1 al contador. Con los dos 5 (repetidos), la bombolla no los intercambia entre sí (porque `5 > 5` es `false`): la comparación estricta mantiene el orden relativo de los iguales. Ordenado: `{1, 2, 5, 5, 9}`.

</details>

---

## Ejercicio 8: La nota más alta de la clase

<details>
<summary>🔄 Solución</summary>

```java
public static int notaMaxima(int[] notas) {
    int maximo = notas[0];

    for (int i = 1; i < notas.length; i++) {
        if (notas[i] > maximo) {
            maximo = notas[i];
        }
    }
    return maximo;
}
```

Inicializamos `maximo` con el primer elemento (no con 0, por si hubiera notas negativas) y comparamos con los demás. Recorrido lineal O(n): un solo bucle. Devuelve 10.

</details>

---

## Ejercicio 9: CodeWars — Find the smallest integer in the array

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static int findSmallestInt(int[] args) {
        int minimo = args[0];

        for (int i = 1; i < args.length; i++) {
            if (args[i] < minimo) {
                minimo = args[i];
            }
        }
        return minimo;
    }
}
```

El espejo del ejercicio 8: en vez de buscar el máximo, buscamos el mínimo. `args[0]` como valor inicial y un solo recorrido. O(n): no puedes hacerlo más rápido sin mirar cada elemento al menos una vez.

</details>
