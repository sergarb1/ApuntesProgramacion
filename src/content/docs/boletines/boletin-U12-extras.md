---
title: "Boletín U12 — Extras"
description: "CodeWars y AceptaElReto para ir más allá de la programación funcional"
---

# 📝 Boletín U12 — Extras

> Ejercicios de CodeWars y AceptaElReto con pistas. Las soluciones están ocultas: agota tu pista antes de mirarlas.

---

## CodeWars

### 1. Enumerable Magic #1 - True for All?

Implementa la función `all`: recibe una lista y un `Predicate`, y devuelve `true` si el predicado es verdadero para **todos** los elementos. Si la lista está vacía, devuelve `true` (nada ha fallado la prueba).

**Ejemplo:** `all([1, 2, 3, 4, 5], x -> x < 9)` → `true`, y `all([1, 2, 3, 4, 5], x -> x > 9)` → `false`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/54598d1fcbae2ae05200112c)
- Dificultad: 8 kyu

<details>
<summary>💡 Pista</summary>

Un `Stream` tiene la operación terminal `allMatch(Predicate)` que hace exactamente esto: devuelve `true` si todos los elementos cumplen el predicado. Y con la lista vacía ya devuelve `true` por sí misma. Una sola línea de stream.

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.List;
import java.util.function.Predicate;

public class Solution {
    public static boolean all(List<Integer> list, Predicate<Integer> predicate) {
        return list.stream().allMatch(predicate);
    }
}
```

`allMatch` es la terminal de los cuantificadores: comprueba si todos los elementos cumplen el predicado (el `all` que pide la kata). El `Stream` hace el recorrido por ti, y el caso de la lista vacía está resuelto por diseño: si no hay elementos, técnicamente ninguno falla, así que devuelve `true`. Es la versión funcional del "recorre y comprueba".

</details>

---

### 2. Sorted? yes? no? how?

Recibes un array de números. Devuelve `"yes, ascending"` si está ordenado de menor a mayor, `"yes, descending"` si está de mayor a menor, y `"no"` si no está ordenado.

**Ejemplo:** `[1, 2]` → `"yes, ascending"`, `[15, 7, 3]` → `"yes, descending"`, `[4, 2, 30]` → `"no"`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/580a4734d6df748060000045)
- Dificultad: 7 kyu

<details>
<summary>💡 Pista</summary>

Un array ordenado de menor a mayor cumple que cada elemento es menor o igual que el siguiente. Eso es un `allMatch` sobre las parejas consecutivas: `IntStream.range(0, array.length - 1).allMatch(i -> array[i] <= array[i + 1])`. Haz lo mismo para el orden descendente.

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.stream.IntStream;

public class Kata {
    public static String isSortedAndHow(int[] array) {
        boolean ascendente = IntStream.range(0, array.length - 1)
            .allMatch(i -> array[i] <= array[i + 1]);
        boolean descendente = IntStream.range(0, array.length - 1)
            .allMatch(i -> array[i] >= array[i + 1]);

        if (ascendente) return "yes, ascending";
        if (descendente) return "yes, descending";
        return "no";
    }
}
```

`IntStream.range(0, array.length - 1)` genera los índices de 0 a n-2: cada uno apunta al inicio de una pareja `(array[i], array[i + 1])`. `allMatch` comprueba que todas las parejas respetan el orden. Es "ordenado" si todas las parejas van en la misma dirección. Un array de un solo elemento cumple ambas condiciones a la vez (no hay parejas), y el `if` ascendente gana: es correcto, un elemento está "ascendente".

</details>

---

### 3. Sum of odd numbers

Dado el triángulo de números impares consecutivos:

```
             1
          3     5
       7     9    11
   13    15    17    19
21    23    25    27    29
```

Devuelve la suma de la fila `n` (empezando por 1). **Ejemplo:** `n=1` → `1`, `n=2` → `8`, `n=3` → `27`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/55fd2d567d94ac3bc9000064)
- Dificultad: 7 kyu

<details>
<summary>💡 Pista</summary>

El primer número de la fila `n` es `n * n - n + 1` (fila 3: 9 - 3 + 1 = 7). Luego hay `n` impares consecutivos, separados de 2 en 2. Genera la fila con `IntStream.range(0, n).map(i -> primer + 2 * i)` y súmalos con `.sum()`.

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.stream.IntStream;

public class Kata {
    public static int rowSumOddNumbers(int n) {
        int primerImpar = n * n - n + 1;
        return IntStream.range(0, n)
            .map(i -> primerImpar + 2 * i)
            .sum();
    }
}
```

`IntStream.range(0, n)` genera los `n` números de la fila y `map` los convierte en impares consecutivos desde `primerImpar` (fila 3: 7, 9, 11). `.sum()` es la terminal que suma un `IntStream`. El resultado coincide con `n * n * n` (¡la suma de la fila n es siempre el cubo de n!), pero esta versión te entrena en construir y sumar streams, que es lo que toca la unidad.

</details>

---

### 4. Two Oldest Ages

Implementa `twoOldestAges`: recibe un array de edades (siempre con al menos 2 elementos) y devuelve un array con las **dos edades más altas**, en el formato `[segunda más alta, la más alta]`.

**Ejemplo:** `[1, 2, 10, 8]` → `[8, 10]`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/511f11d355fe575d2c000001)
- Dificultad: 7 kyu

<details>
<summary>💡 Pista</summary>

Ordena el array de menor a mayor con `Arrays.stream(ages).sorted()` y sáltate todos menos los dos últimos: `skip(ages.length - 2)`. El stream resultante tiene exactamente las dos edades más altas en el orden pedido. Recoge con `.toArray()`.

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Arrays;

public class Kata {
    public static int[] twoOldestAges(int[] ages) {
        return Arrays.stream(ages)
            .sorted()
            .skip(ages.length - 2)
            .toArray();
    }
}
```

`Arrays.stream(ages)` convierte el array en un `IntStream`, `sorted()` lo ordena de menor a mayor, y `skip(ages.length - 2)` se salta todos los elementos menos los dos últimos. Al estar ordenados, esos dos últimos son la segunda más alta y la más alta, en ese orden. `.toArray()` recoge el flujo de vuelta en un array. Cuatro operaciones para un problema que a mano pediría dos variables y un bucle.

</details>

---

## AceptaElReto

### 5. 219 — La lotería de la peña Atlética

La peña atlética solo compra décimos con **números pares**. Te dan una lista de décimos de cada administración y debes decir cuántos puede comprar.

**Entrada:** el primer número indica cuántos casos de prueba hay. Cada caso son dos líneas: el número de décimos `n` y la lista de `n` números (entre 0 y 99.999).

**Salida:** para cada caso, cuántos décimos son pares.

**Ejemplo:** `10` y `1 2 3 4 5 6 7 8 9 10` → `5`.

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=219)
- Dificultad: ⭐

<details>
<summary>💡 Pista</summary>

Lee los `n` números en un array y cuenta los pares con un stream: `Arrays.stream(decimos).filter(d -> d % 2 == 0).count()`. El `filter` con un `Predicate` y la terminal `count` es la plantilla de "cuántos cumplen".

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Arrays;
import java.util.Scanner;

public class Loteria {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int casos = sc.nextInt();

        while (casos-- > 0) {
            int n = sc.nextInt();
            int[] decimos = new int[n];
            for (int i = 0; i < n; i++) {
                decimos[i] = sc.nextInt();
            }

            long comprables = Arrays.stream(decimos)
                .filter(d -> d % 2 == 0)
                .count();

            System.out.println(comprables);
        }
        sc.close();
    }
}
```

La entrada se lee en un array (leer dentro de una lambda sería un efecto secundario feo) y el stream hace el trabajo: `filter(d -> d % 2 == 0)` deja pasar los pares y `count()` los cuenta. Fíjate en que `count()` devuelve `long`: el problema acepta la salida aunque la variable sea `long`. Es el mismo patrón que `filter(...).count()` de la unidad, aplicado a un problema de concurso real.

</details>

---

### 6. 105 — Ventas

El bar de Javier abre todos los días menos los lunes. Apunta la caja de cada día de la semana (martes, miércoles, jueves, viernes, sábado y domingo). Debe decir: el **día de más ventas**, el **día de menos ventas** (o `EMPATE` si hay empate en el máximo o el mínimo), y si las **ventas del domingo superan la media semanal** (`SI` o `NO`).

**Entrada:** varios casos de prueba. Cada caso son 6 números (las ventas de martes a domingo). El programa termina cuando el primer número del caso es `-1`.

**Salida:** para cada caso, `DIA_MAX DIA_MIN SI/NO`.

**Ejemplo:** `185.50 250.36 163.45 535.20 950.22 450.38` → `SABADO JUEVES SI`.

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=105)
- Dificultad: ⭐⭐

<details>
<summary>💡 Pista</summary>

Guarda los 6 valores en un `double[]`. Con streams: `Arrays.stream(ventas).max()`, `.min()` y `.average()` te dan los tres datos (todos devuelven `OptionalDouble`, aterriza con `orElse(0)`). Para saber el día, busca el índice del máximo/mínimo; y cuenta cuántos valores coinciden con el máximo/mínimo: si hay más de uno, es `EMPATE`.

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.*;
import java.util.stream.*;

public class Ventas {
    static final String[] DIAS = {"MARTES", "MIERCOLES", "JUEVES", "VIERNES", "SABADO", "DOMINGO"};

    static int indiceDe(double[] ventas, double valor) {
        return IntStream.range(0, ventas.length)
            .filter(i -> ventas[i] == valor)
            .findFirst()
            .orElse(-1);
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            double[] ventas = new double[6];
            ventas[0] = sc.nextDouble();
            if (ventas[0] == -1) break;
            for (int i = 1; i < 6; i++) {
                ventas[i] = sc.nextDouble();
            }

            double max = Arrays.stream(ventas).max().orElse(0);
            double min = Arrays.stream(ventas).min().orElse(0);
            double media = Arrays.stream(ventas).average().orElse(0);

            long vecesMax = Arrays.stream(ventas).filter(v -> v == max).count();
            long vecesMin = Arrays.stream(ventas).filter(v -> v == min).count();

            String diaMax = vecesMax > 1 ? "EMPATE" : DIAS[indiceDe(ventas, max)];
            String diaMin = vecesMin > 1 ? "EMPATE" : DIAS[indiceDe(ventas, min)];
            String domingo = ventas[5] > media ? "SI" : "NO";

            System.out.println(diaMax + " " + diaMin + " " + domingo);
        }
        sc.close();
    }
}
```

El problema entero es un desfile de streams: `max()` y `min()` para los extremos, `average()` para la media (los tres devuelven `OptionalDouble` porque el array podría estar vacío; `orElse(0)` aterriza). El `filter(...).count()` cuenta cuántos días empatan con el máximo/mínimo, y `indiceDe` usa `IntStream.range` + `findFirst` para localizar el día exacto. La media se compara con las ventas del domingo (`ventas[5]`, el último índice). El `EMPATE` del enunciado sale de `vecesMax > 1` / `vecesMin > 1`. Este es el problema de la unidad: casi todo, con streams.

</details>

---

> 🧭 **¿Y si te quedas con ganas?** Cuando domines lambdas y streams, vuelve a los problemas de unidades anteriores y reescríbelos con pipelines: el contador de frecuencias de la U11 con `groupingBy`, los bucles de la U05 con `filter` + `reduce`, la agenda de la U11 con `Collectors.toMap`... Todo lo que antes era un bucle ahora es una declaración. El material no se pierde: se reutiliza.