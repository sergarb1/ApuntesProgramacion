---
title: Boletín U04 — Extras
description: CodeWars y AceptaElReto para ir más allá de la unidad
---

# 📝 Boletín U04 — Extras

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

Dos ideas de la U04 trabajando a la vez: la **bombolla** para ordenar (adaptada a `String` con `compareTo`) y la idea de recorrer para **filtrar repetidos** (comparando con el anterior una vez ordenado). `split("--")` trocea cada línea, y solo los que tienen reverso distinto de `FIN` entran en la lista de odiados.

</details>

---

### 6. 100 — Constante de Kaprekar

Aplicando el algoritmo de Kaprekar (ordenar los dígitos de mayor a menor, restar el ordenado de menor a mayor, y repetir), todo número de 4 cifras (con ceros a la izquierda si hace falta) termina en **6174**. Cuenta cuántas iteraciones necesita cada número de la entrada.

**Entrada:** varios números, uno por línea, hasta un `0` final. El `6174` necesita `0` iteraciones. Los números con todas las cifras iguales (1111, 5555...) son el caso especial del problema: la respuesta oficial es **8**.

**Ejemplo:**

```
6174
3524
1111
0
```

**Salida:**

```
0
3
8
```

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=100)
- Dificultad: Fácil

**Pista:** usa tu bombolla para ordenar los dígitos extraídos con `% 10` y `/ 10` en un `int[]` de 4 posiciones. Reconstruye el descendente (dígitos de mayor a menor) y el ascendente, réstalos y cuenta con un contador hasta llegar a 6174. El problema completo, en el boletín avanzado.

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class Kaprekar {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int numero = sc.nextInt();

        while (numero != 0) {
            if (esRepdigit(numero)) {
                System.out.println(8);
                numero = sc.nextInt();
                continue;
            }

            int iteraciones = 0;

            while (numero != 6174) {
                int[] digitos = new int[4];

                for (int i = 3; i >= 0; i--) {
                    digitos[i] = numero % 10;
                    numero /= 10;
                }

                for (int i = 0; i < digitos.length - 1; i++) {
                    for (int j = 0; j < digitos.length - 1 - i; j++) {
                        if (digitos[j] > digitos[j + 1]) {
                            int temp = digitos[j];
                            digitos[j] = digitos[j + 1];
                            digitos[j + 1] = temp;
                        }
                    }
                }

                int ascendente = 0;
                int descendente = 0;
                for (int i = 0; i < 4; i++) {
                    ascendente = ascendente * 10 + digitos[i];
                    descendente = descendente * 10 + digitos[3 - i];
                }

                numero = descendente - ascendente;
                iteraciones++;
            }

            System.out.println(iteraciones);
            numero = sc.nextInt();
        }
        sc.close();
    }

    static boolean esRepdigit(int n) {
        String s = String.format("%04d", n);
        char primera = s.charAt(0);
        for (char c : s.toCharArray()) {
            if (c != primera) return false;
        }
        return true;
    }
}
```

El mismo algoritmo del boletín avanzado, ahora en su formato AceptaElReto (varios casos hasta el 0). Para `3524`: dígitos {3,5,2,4}, ordenados {2,3,4,5} → ascendente 2345, descendente 5432, resta 3087 (iteración 1); luego {3,0,8,7} → 8730 − 0378 = 8352 (2); luego 8532 − 2358 = 6174 (3). Los repdigits (1111, 5555...) se detectan antes de entrar en el bucle: la primera resta da 0 y, sin `esRepdigit`, el `while (numero != 6174)` se quedaría dando vueltas para siempre. El problema pide `8` para ellos. La bombolla, otra vez, protagonista.

</details>

---

> 🧭 **¿Y si te quedas con ganas?** Cuando domines cerchas, bombollas y Big O, vuelve a los problemas de esta unidad con el punto 9 como examen. Y en la U05 te esperan las bestias: QuickSort, MergeSort y la recursividad. Ordenar un millón de datos en un suspiro está a un paso.
