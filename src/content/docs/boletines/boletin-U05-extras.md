---
title: Boletín U05 — Extras
description: CodeWars y AceptaElReto para ir más allá de la unidad
---

# 📝 Boletín U05 — Extras

> Ejercicios de CodeWars y AceptaElReto con pistas. La solución está oculta: resístete hasta agotar tu pista.

---

## CodeWars

### 1. You only need one — Beginner

Te dan un array y un valor. Devuelve `true` si el array **contiene** el valor.

**Ejemplos:** `{"a", "b", "c"}`, `"a"` → `true` · `{"a", "b", "c"}`, `"z"` → `false`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/57cc975ed542d3148f00015b)
- Dificultad: 8 kyu

**Pista:** un `for` que recorra el array y un `if` que devuelva `true` si algún elemento es igual al valor. Después del bucle, `false`.

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static boolean check(Object[] a, Object x) {
        for (Object elemento : a) {
            if (elemento.equals(x)) {
                return true;
            }
        }
        return false;
    }
}
```

Es la búsqueda lineal en su forma más pura: recorrer y devolver en cuanto encuentras. Para objetos usamos `.equals()` en vez de `==`. La complejidad es O(n): puede que lo encuentres a la primera o al final.

</details>

---

### 2. Square(n) Sum

Te dan un array de enteros. Devuelve la suma de los **cuadrados** de cada número.

**Ejemplo:** `[1, 2, 2]` → `1 + 4 + 4 = 9`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/515e271a311df0350d00000f)
- Dificultad: 8 kyu

**Pista:** un acumulador `suma` y, dentro del bucle, `suma += numero * numero;`.

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static int squareSum(int[] numeros) {
        int suma = 0;
        for (int numero : numeros) {
            suma += numero * numero;
        }
        return suma;
    }
}
```

`numero * numero` es el cuadrado (evita `Math.pow`, que es más lento para un entero). Un acumulador y un bucle: O(n). El mismo esqueleto que "suma todos" pero con un pequeño cálculo dentro.

</details>

---

### 3. Convert number to reversed array of digits

Te dan un número entero no negativo. Devuelve sus dígitos en un array de enteros, **en orden inverso**.

**Ejemplo:** `35231` → `[1, 3, 2, 5, 3]` · `0` → `[0]`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/5583090cbe83f4fd8c000051)
- Dificultad: 8 kyu

**Pista:** para extraer dígitos, `% 10` te da el último y `/ 10` se lo quita. Con eso ya salen invertidos: el primero que sacas es el último del número.

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static int[] digitize(long n) {
        String texto = Long.toString(n);
        int[] resultado = new int[texto.length()];

        for (int i = 0; i < resultado.length; i++) {
            resultado[i] = Character.getNumericValue(texto.charAt(resultado.length - 1 - i));
        }
        return resultado;
    }
}
```

Otra forma, sin convertir a texto, si prefieres `%` y `/`:

```java
public static int[] digitize(long n) {
    String texto = String.valueOf(n);
    int[] resultado = new int[texto.length()];
    for (int i = 0; i < texto.length(); i++) {
        resultado[i] = (int) (n % 10);
        n /= 10;
    }
    return resultado;
}
```

Con `% 10` y `/ 10`: el último dígito sale primero (ya viene invertido), y después de dividir entre 10 se repite. El caso `0` → `[0]` funciona solo: `0 % 10 = 0`.

</details>

---

### 4. Count the divisors of a number

Cuenta cuántos divisores tiene un número `n` (positivo).

**Ejemplos:** `divisors(4)` → `3` (1, 2, 4) · `divisors(12)` → `6` (1, 2, 3, 4, 6, 12).

- [Enunciado en CodeWars](https://www.codewars.com/kata/542c0f198e077084c0000c2e)
- Dificultad: 7 kyu

**Pista:** un bucle del 1 a `n` con un `if (n % i == 0)` y un contador. (Optimización opcional: solo llegas a la raíz cuadrada y cuentas de dos en dos.)

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static long numberOfDivisors(int n) {
        int contador = 0;
        for (int i = 1; i <= n; i++) {
            if (n % i == 0) {
                contador++;
            }
        }
        return contador;
    }
}
```

Versión optimizada (O(√n) en vez de O(n)):

```java
public static long numberOfDivisors(int n) {
    int contador = 0;
    for (int i = 1; i * i <= n; i++) {
        if (n % i == 0) {
            contador += (i * i == n) ? 1 : 2;
        }
    }
    return contador;
}
```

La versión simple recorre del 1 a n: si `n % i == 0`, es divisor. La optimizada se aprovecha de que los divisores van en parejas: si `i` divide a `n`, entonces `n / i` también, salvo cuando son el mismo (el caso del cuadrado perfecto). De O(n) a O(√n): Big O en acción.

</details>

---

## AceptaElReto

### 5. 185 — Potitos

Un padre le compra potitos (botes de comida para bebé) a su hijo. A veces el bebé **le da la vuelta** al bote para ver el reverso, donde se lee el ingrediente *que menos le gusta* (o "FIN" si no hay ninguno). El padre quiere saber los ingredientes que el bebé **odia**, para dejar de comprarlos.

**Entrada:** varios casos de prueba. Cada caso empieza con `N` (número de potitos). A continuación, `N` líneas: cada una con un ingrediente `I` que le gusta, un guion `--`, y opcionalmente un `FIN` o un ingrediente que detesta. El caso `0` termina.

**Ejemplo:**

```
4
pollo--FIN
pescado--FIN
verdura--atun
pollo--FIN
0
```

**Salida:**

```
atun
```

(El único detestado es `atun`; los demás no tenían reverso o decían `FIN`.) Los ingredientes detestados se muestran **ordenados alfabéticamente** y **sin repetir**.

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=185)
- Dificultad: Fácil

**Pista:** para cada línea, separa con `split("--")`. Si la segunda parte no es `"FIN"`, es un ingrediente detestado: guárdalo. Al final, ordénalo (la bombolla del punto 4, pero con `String.compareTo` en vez de `>`) y elimina los repetidos.

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class Potitos {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        sc.nextLine();

        while (n != 0) {
            String[] odiados = new String[n];
            int cuantos = 0;

            for (int i = 0; i < n; i++) {
                String linea = sc.nextLine();
                String[] partes = linea.split("--");

                if (partes.length > 1 && !partes[1].equals("FIN")) {
                    odiados[cuantos] = partes[1];
                    cuantos++;
                }
            }

            for (int i = 0; i < cuantos - 1; i++) {
                for (int j = 0; j < cuantos - 1 - i; j++) {
                    if (odiados[j].compareTo(odiados[j + 1]) > 0) {
                        String temp = odiados[j];
                        odiados[j] = odiados[j + 1];
                        odiados[j + 1] = temp;
                    }
                }
            }

            StringBuilder salida = new StringBuilder();
            for (int i = 0; i < cuantos; i++) {
                if (i == 0 || !odiados[i].equals(odiados[i - 1])) {
                    salida.append(odiados[i]).append(" ");
                }
            }
            System.out.println(salida.toString().trim());

            n = sc.nextInt();
            sc.nextLine();
        }
        sc.close();
    }
}
```

Dos ideas de la U05 trabajando a la vez: la **bombolla** para ordenar (adaptada a `String` con `compareTo`) y la idea de recorrer para **filtrar repetidos** (comparando con el anterior una vez ordenado). `split("--")` trocea cada línea, y solo los que tienen reverso distinto de `FIN` entran en la lista de odiados.

</details>

---

### 6. 342 — ¡No lo puedes saber!

Un jugador piensa un número oculto en un rango `[ini, fin]` y un segundo jugador hace preguntas ("¿El 500?") recibiendo respuestas **"menor"** o **"mayor o igual"**. Dado el rango, el número oculto y la lista de preguntas realizadas, di si el segundo jugador puede **saber con certeza** cuál es el número.

**Entrada:** varios casos. Cada caso: una línea con `ini`, `fin` y `n` (el número oculto). La siguiente línea tiene `k` (nº de preguntas) y las `k` hipótesis. Termina con `0 0 0`.

**Ejemplo:**

```
1 10 1
2 1 2
1 1000 450
2 400 500
0 0 0
```

**Salida:**

```
LO SABE
NO LO SABE
```

En el primer caso, el jugador pregunta por 1 y 2: responde "mayor o igual" (1) y "menor" (2), así que solo queda el 1 → LO SABE. En el segundo, con preguntas 400 y 500 solo acota a 450, 451... 500 → aún quedan varios → NO LO SABE.

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=342)
- Dificultad: Media

**Pista:** es la **búsqueda binaria** del punto 3 al revés: cada pregunta divide el rango posible en dos según la respuesta. Lleva `min` y `max` (los límites posibles). Si la hipótesis es menor que el oculto, `min` sube a hipótesis + 1; si es mayor o igual, `max` baja a la hipótesis. Al final, LO SABE si `min == max == n`.

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class NoLoPuedesSaber {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            int ini = sc.nextInt();
            int fin = sc.nextInt();
            int n = sc.nextInt();
            if (ini == 0 && fin == 0 && n == 0) break;

            int min = ini;
            int max = fin;
            int k = sc.nextInt();

            for (int i = 0; i < k; i++) {
                int hipotesis = sc.nextInt();
                if (hipotesis < n) {
                    min = Math.max(min, hipotesis + 1);
                } else {
                    max = Math.min(max, hipotesis);
                }
            }

            System.out.println((min == max && min == n) ? "LO SABE" : "NO LO SABE");
        }
        sc.close();
    }
}
```

Cada respuesta estrecha el intervalo: si la hipótesis es menor que el oculto, el número no puede estar en `[ini, hipotesis]`, así que `min` sube a `hipótesis + 1`. Si es mayor o igual, `max` baja a la hipótesis. Es el mismo razonamiento de la búsqueda binaria del punto 3: partir el rango por la mitad (o por donde toque) y descartar. Al final, el jugador "lo sabe" solo si el intervalo se ha cerrado por completo sobre el número oculto. La comparación con `n` usa el dato que nosotros sí conocemos, pero el programa simula lo que el jugador va descubriendo.

</details>

---

> 🧭 **¿Y si te quedas con ganas?** Cuando domines cerchas, bombollas y Big O, vuelve a los problemas de esta unidad con el punto 9 como examen. Y en la U06 te esperan las bestias: QuickSort, MergeSort y la recursividad. Ordenar un millón de datos en un suspiro está a un paso.
