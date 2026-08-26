---
title: Boletín U03 — Extras
description: CodeWars y AceptaElReto para ir más allá de la unidad
---

# 📝 Boletín U03 — Extras

> Ejercicios de CodeWars y AceptaElReto con pistas. La solución está oculta: resístete hasta agotar tu pista.

---

## CodeWars

### 1. Return Negative

Te dan un número y tienes que devolverlo negativo. Pero ojo: si el número ya es negativo, déjalo como está.

**Ejemplos:** `1` → `-1`, `-14` → `-14`, `34` → `-34`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/55685cd7ad70877c23000102)
- Dificultad: 8 kyu

**Pista:** un ternario decide: si es mayor que 0, cambia el signo (`-num`); si no, devuélvelo tal cual.

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static int makeNegative(int num) {
        return num > 0 ? -num : num;
    }
}
```

Un ternario con la condición `num > 0`. Si es positivo, el operador unario `-` lo hace negativo; si ya era negativo (o cero), se queda igual. Decidir con una línea: pura U03.

</details>

---

### 2. Sum of positive

Te dan un array de enteros. Devuelve la suma de todos los **positivos**.

**Ejemplo:** `[1, -4, 7, 12]` → `1 + 7 + 12 = 20`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/5715eaedb436cf5606000381)
- Dificultad: 8 kyu

**Pista:** recorre el array con un `for` y, con un `if`, suma solo los números mayores que 0.

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static int sum(int[] arr) {
        int suma = 0;
        for (int numero : arr) {
            if (numero > 0) {
                suma += numero;
            }
        }
        return suma;
    }
}
```

El bucle recorre cada número y el `if` filtra los positivos antes de sumarlos. El `for...each` es un atajo que ya conoces; el `if` dentro del bucle es la esencia de las estructuras de control.

</details>

---

### 3. Grasshopper — Summation

Escribe un programa que calcule la suma de todos los números desde 1 hasta `n`.

**Ejemplos:** `summation(2)` → `3` (1 + 2), `summation(8)` → `36` (1 + 2 + ... + 8).

- [Enunciado en CodeWars](https://www.codewars.com/kata/55d24f55d7dd296eb9000030)
- Dificultad: 8 kyu

**Pista:** un `for` que acumule del 1 al `n` en una variable `suma`. (O la fórmula matemática `n * (n + 1) / 2`, si te va el atajo.)

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static int summation(int n) {
        int suma = 0;
        for (int i = 1; i <= n; i++) {
            suma += i;
        }
        return suma;
    }
}
```

Con bucles: `suma += i` acumula cada vuelta. Con la fórmula directa: `return n * (n + 1) / 2;`, que da el mismo resultado sin ni un bucle. Ambas son válidas; el bucle es lo que practicamos aquí.

</details>

---

### 4. Sum without highest and lowest number

Suma todos los números de un array **excepto** el más alto y el más bajo. Si el array está vacío, es `null` o tiene un solo elemento, devuelve `0`.

**Ejemplo:** `[6, 2, 1, 8, 10]` → `2 + 6 + 8 = 16`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/576b93db112df076d900060c)
- Dificultad: 7 kyu

**Pista:** recorre el array una vez para acumular la suma y, en el mismo bucle, rastrea el mínimo y el máximo con dos `if`. Al final: `suma - minimo - maximo`.

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static int sum(int[] numeros) {
        if (numeros == null || numeros.length <= 1) {
            return 0;
        }

        int suma = 0;
        int minimo = Integer.MAX_VALUE;
        int maximo = Integer.MIN_VALUE;

        for (int numero : numeros) {
            suma += numero;
            if (numero < minimo) minimo = numero;
            if (numero > maximo) maximo = numero;
        }

        return suma - minimo - maximo;
    }
}
```

El truco: `Integer.MAX_VALUE` y `Integer.MIN_VALUE` como "infinitos" iniciales, para que el primer número del array siempre los supere. Un solo bucle hace tres cosas (sumar, buscar mínimo, buscar máximo) y la resta final quita los extremos. Tres decisiones en un solo recorrido: puro músculo de esta unidad.

</details>

---

## AceptaElReto

### 5. 149 — San Fermines

En los sanfermines, los mozos quieren saber la velocidad máxima de los toros para saber si salir corriendo o volar. Dado un número de toros y la velocidad de cada uno, di cuál es la máxima.

**Entrada:** varios casos de prueba hasta el final de la entrada (EOF). Cada caso: un número N y a continuación las N velocidades.

**Ejemplo:**

```
3
10 20 15
5
50 12 90 7 25
```

**Salida:**

```
20
90
```

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=149)
- Dificultad: Fácil

**Pista:** un `while (sc.hasNextInt())` lee hasta el final de la entrada. Dentro, un `for` recorre las velocidades y un `if` va guardando el máximo.

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class SanFermines {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (sc.hasNextInt()) {
            int n = sc.nextInt();
            int max = 0;

            for (int i = 0; i < n; i++) {
                int velocidad = sc.nextInt();
                if (velocidad > max) {
                    max = velocidad;
                }
            }

            System.out.println(max);
        }
        sc.close();
    }
}
```

El `while (sc.hasNextInt())` es el patrón "leer hasta el final". El `if` dentro del `for` compara cada velocidad con el máximo acumulado. Al acabar el bucle, `max` es la respuesta. Bucles y decisiones trabajando en equipo.

</details>

---

### 6. 340 — Siguiente con mismo número de cifras

Dado un número natural N, encuentra el siguiente número que tenga el **mismo número de cifras** que N. Si no existe (porque N es el último con ese número de cifras), muestra `MENSAJE`.

**Entrada:** varios casos separados por espacios, que termina con un `0`.

**Ejemplos:**

```
1 → 2
9 → MENSAJE
99 → MENSAJE
100 → 101
```

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=340)
- Dificultad: Medio

**Pista:** cuenta las cifras de N con un `while (copia > 0) { cifras++; copia /= 10; }`. Si N es `9`, `99`, `999`... (todos nueves), no hay siguiente. En el resto de casos, la respuesta es `N + 1`.

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class SiguienteCifras {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();

        while (n != 0) {
            int copia = n;
            int cifras = 0;

            while (copia > 0) {
                cifras++;
                copia /= 10;
            }

            int ultimoConEseTamano = (int) Math.pow(10, cifras) - 1;

            if (n == ultimoConEseTamano) {
                System.out.println("MENSAJE");
            } else {
                System.out.println(n + 1);
            }

            n = sc.nextInt();
        }
        sc.close();
    }
}
```

Dos bucles: el interior cuenta las cifras dividiendo entre 10 (`while (copia > 0)`), y el exterior lee casos hasta el 0 centinela. Si N es 9, 99 o 999 (el `10^cifras - 1`), no existe siguiente y toca "MENSAJE". En cualquier otro caso, sumar 1 no cambia el número de cifras... salvo en los de todos nueves, que ya cazamos antes.

</details>

---

> 🧭 **¿Y si te quedas con ganas?** Cuando domines los bucles y las condiciones podrás volver a los problemas de la U02 (como Nochevieja o ¿Qué lado de la calle?) y resolverlos con `for` y `switch` para hacer soluciones más elegantes. El material no se pierde: se reutiliza.
