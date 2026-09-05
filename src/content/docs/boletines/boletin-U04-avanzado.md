---
title: Boletín U04 — Avanzado
description: Ejercicios de dificultad progresiva para exprimir la unidad
---

# 📝 Boletín U04 — Avanzado

> Dificultad progresiva. ⭐ para calentar, ⭐⭐ para pensar, ⭐⭐⭐ para concursar. Cada ejercicio incluye una pista (resiste a mirarla).

---

## ⭐ Ejercicio 1: ¿Qué imprime? — la binaria con historial

Sin ejecutar, escribe la salida exacta de este programa:

```java
public class BinariaHistorial {
    public static void main(String[] args) {
        int[] datos = {2, 4, 6, 8, 10, 12, 14, 16};
        int objetivo = 10;
        int izquierda = 0;
        int derecha = datos.length - 1;

        while (izquierda <= derecha) {
            int medio = izquierda + (derecha - izquierda) / 2;
            System.out.println("Pruebo el índice " + medio);

            if (datos[medio] == objetivo) {
                System.out.println("Encontrado en " + medio);
                break;
            } else if (datos[medio] < objetivo) {
                izquierda = medio + 1;
            } else {
                derecha = medio - 1;
            }
        }
    }
}
```

**Pista:** escribe en una tabla cada vuelta con sus `izquierda`, `derecha`, `medio` y qué decide. Solo son 3 o 4 líneas de traza.

---

## ⭐ Ejercicio 2: El buscador binario con historial

Escribe un método `public static int busquedaBinaria(int[] datos, int objetivo)` como el de la teoría, pero que **cada vez que pruebe un índice, lo muestre por pantalla**: `Probando el índice X`. Al final devuelve el índice o `-1`.

Prueba con `int[] datos = {1, 3, 5, 7, 9, 11, 13, 15, 17, 19}` y `objetivo = 7`.

**Pista:** el `System.out.println` va dentro del `while`, justo después de calcular `medio` y antes de comparar.

---

## ⭐⭐ Ejercicio 3: La bombolla con recuento (y flag)

Escribe un programa llamado `BombollaRecuento` que ordene `int[] datos = {9, 3, 7, 1, 5}` con bombolla y **cuente los intercambios**, igual que en el inicial. Pero además, añade el flag `boolean huboIntercambio` con su `break` para no hacer pasadas inútiles.

Muestra al final el array ordenado y `Intercambios: X`.

**Pista:** el flag se resetea a `false` al principio de cada pasada y se pone a `true` dentro del `if`. Después de la pasada: `if (!huboIntercambio) break;`.

---

## ⭐⭐ Ejercicio 4: La inserción descendente

Modifica la ordenación por inserción para que ordene **de mayor a menor**. Escribe un método `public static void ordenarDescendente(int[] datos)`.

Prueba con `int[] notas = {6, 9, 3, 8, 5}` y muestra el resultado.

**Pista:** solo cambia un signo: en la condición del `while`, los mayores deben deslizarse hacia la derecha. Piensa cuál es ahora el "orden correcto".

---

## ⭐⭐ Ejercicio 5: El analista de complejidad

Di la complejidad Big O de cada método y justifica brevemente:

```java
public class Analista {

    public static int metodoA(int[] datos) {
        int total = 0;
        for (int num : datos) {
            total += num;
        }
        return total;
    }

    public static int metodoB(int[] datos) {
        int pares = 0;
        for (int i = 0; i < datos.length; i++) {
            for (int j = i + 1; j < datos.length; j++) {
                if (datos[i] == datos[j]) {
                    pares++;
                }
            }
        }
        return pares;
    }

    public static int metodoC(int[] datos, int objetivo) {
        int izquierda = 0;
        int derecha = datos.length - 1;
        while (izquierda <= derecha) {
            int medio = izquierda + (derecha - izquierda) / 2;
            if (datos[medio] == objetivo) return medio;
            if (datos[medio] < objetivo) izquierda = medio + 1;
            else derecha = medio - 1;
        }
        return -1;
    }
}
```

**Pista:** cuenta bucles: uno → O(n), dos anidados → O(n²). El que divide el segmento por la mitad en cada vuelta es O(log n). El `j = i + 1` no lo salva de ser O(n²): sigue siendo casi n × n.

---

## ⭐⭐ Ejercicio 6: El cazador de parejas

Escribe un método `public static boolean existePareja(int[] datos, int sumaObjetivo)` que devuelva `true` si existen **dos elementos distintos** del array cuya suma sea `sumaObjetivo`.

Prueba con `int[] precios = {10, 3, 7, 5, 12}`:

- `existePareja(precios, 17)` → `true` (10 + 7)
- `existePareja(precios, 25)` → `false`

**Pista:** dos bucles anidados con `j = i + 1` (para no probar un elemento consigo mismo). En el interior: `if (datos[i] + datos[j] == sumaObjetivo) return true;`. Al final, `return false;`.

---

## ⭐⭐ Ejercicio 7: El detective de inversiones

Una **inversión** es una pareja de posiciones `(i, j)` con `i < j` donde `datos[i] > datos[j]` (están desordenadas). Escribe un método `public static int contarInversiones(int[] datos)` que las cuente.

Prueba con `int[] datos = {2, 4, 1, 3}` → hay 3 inversiones: (2,1), (4,1), (4,3).

**Pista:** el patrón de doble bucle con `j = i + 1` otra vez, pero ahora el `if` compara `datos[i] > datos[j]` y suma 1 al contador.

---

## ⭐⭐⭐ Ejercicio 8: CodeWars — Ones and Zeros

Resuelve la kata **"Ones and Zeros"** (7 kyu) en [CodeWars](https://www.codewars.com/kata/578553c3a1b8d5c40300037c).

Te dan un array de enteros (solo 0 y 1) que representa un número en binario. Devuelve su valor decimal.

**Ejemplo:** `[1, 0, 1, 1]` → `11` (1·8 + 0·4 + 1·2 + 1·1).

**Pista:** recorre el array de izquierda a derecha acumulando `valor = valor * 2 + digito`. Ese es el algoritmo para convertir de binario a decimal sin usar `Math.pow`.

---

## ⭐⭐⭐ Ejercicio 9: AceptaElReto — 100 Constante de Kaprekar

Resuelve el problema **100 — Constante de Kaprekar** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=100).

El algoritmo de Kaprekar: dado un número de 4 cifras, ordena sus dígitos de mayor a menor y de menor a mayor, resta ambos, y repite con el resultado. Al final siempre se llega a **6174** (o al propio 6174) y, si el número tiene todas las cifras iguales (como 1111), la diferencia da 0.

La entrada trae varios números (pueden tener menos de 4 cifras: hay que completar con ceros a la izquierda). Para cada uno, muestra **cuántas iteraciones** se necesitan para alcanzar 6174. El 6174 necesita 0 iteraciones. **Cuidado con los repdigits** (1111, 5555...): la primera resta da 0 y el bucle nunca llegaría a 6174; el problema oficial pide **8** para ellos. El 0 de entrada termina el programa.

**Pista:** para ordenar los dígitos, extráelos en un `int[]` de 4 posiciones con `% 10` y `/ 10`, ordénalo con bombolla (¡reutiliza la U04!), y reconstruye el número mayor (dígitos en orden descendente) y el menor (ascendente). Cuenta las iteraciones con un contador.

---

## 📚 Referencias

| Plataforma | Problema | Dificultad |
|---|---|---|
| AceptaElReto | 100 — Constante de Kaprekar | Fácil |
| AceptaElReto | 185 — Potitos | Fácil |
| CodeWars | Find the smallest integer in the array (8 kyu) | Principiante |
| CodeWars | Ones and Zeros (7 kyu) | Aficionado |
| CodeWars | You only need one (8 kyu) | Principiante |
