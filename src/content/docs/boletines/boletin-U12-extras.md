---
title: "Boletín U12 — Extras"
description: "CodeWars y AceptaElReto para ir más allá de los ficheros y las expresiones regulares"
---

# 📝 Boletín U12 — Extras

> Ejercicios de CodeWars y AceptaElReto con pistas. Las soluciones están ocultas: agota tu pista antes de mirarlas.

---

## CodeWars

### 1. Regex validate PIN code

Crea una función que valide un PIN: un `String` que es válido solo si tiene **4 o 6 dígitos exactos**.

**Ejemplo:** `"1234"` → `true`, `"12345"` → `false`, `"a234"` → `false`, `"123456"` → `true`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/55f8a9c06c018a0d6e000132)
- Dificultad: 7 kyu

<details>
<summary>💡 Pista</summary>

Es la kata más regex de la unidad: un solo `matches()` con el patrón `\\d{4}|\\d{6}` lo resuelve. Recuerda: `matches()` exige que todo el string cumpla el patrón, que es justo lo que pide un PIN.

</details>

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static boolean validatePin(String pin) {
        return pin.matches("\\d{4}|\\d{6}");
    }
}
```

`\\d{4}` es "exactamente 4 dígitos" y `\\d{6}` "exactamente 6". El `|` los une: o 4 o 6. `matches()` comprueba el string entero, así que `"12345a"` no pasa aunque tenga 5 dígitos: hay una letra al final.

</details>

---

### 2. Two to One

Te dan dos strings en minúsculas con letras de la `a` a la `z`. Devuelve un único string con las letras **distintas de ambos, ordenadas alfabéticamente**.

**Ejemplo:** `"xyaabbbccccdefww"` y `"xxxxyyyyabklmopq"` → `"abcdefklmopqwxy"`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/5656b6906de340bd1b0000ac)
- Dificultad: 7 kyu

<details>
<summary>💡 Pista</summary>

Concatena los dos strings en uno. Luego recorre las letras de la `a` a la `z` y, si el string concatenado contiene esa letra (`indexOf`), añádela al resultado. El orden alfabético sale gratis porque recorres el alfabeto en orden.

</details>

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static String longest(String s1, String s2) {
        String unidos = s1 + s2;
        StringBuilder resultado = new StringBuilder();

        for (char c = 'a'; c <= 'z'; c++) {
            if (unidos.indexOf(c) != -1) {
                resultado.append(c);
            }
        }
        return resultado.toString();
    }
}
```

La clave es invertir la pregunta: en vez de filtrar los caracteres de los strings, recorres el alfabeto y preguntas "¿está esta letra en la unión?". Con `indexOf(c) != -1` sabes si aparece. El `StringBuilder` acumula el resultado y el orden alfabético es automático porque la `a` se procesa antes que la `b`.

</details>

---

### 3. Categorize New Member

El club de tenis clasifica a sus nuevos socios. Un socio es **"Senior"** si tiene 55 años o más **y** un hándicap mayor que 7; si no, es **"Open"**. Te dan un array de pares `[edad, hándicap]` y debes devolver un array con la categoría de cada uno.

**Ejemplo:** `[[45, 12], [55, 21], [19, -2], [104, 20]]` → `["Open", "Senior", "Open", "Senior"]`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/5502c9e7b3216ec63c000020)
- Dificultad: 7 kyu

<details>
<summary>💡 Pista</summary>

Simple lógica booleana: `edad >= 55 && hándicap > 7`. Recorre el array de pares y monta el resultado con un ternario.

</details>

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static String[] openOrSenior(int[][] data) {
        String[] resultado = new String[data.length];

        for (int i = 0; i < data.length; i++) {
            resultado[i] = (data[i][0] >= 55 && data[i][1] > 7)
                ? "Senior" : "Open";
        }
        return resultado;
    }
}
```

Cada par `data[i]` tiene la edad en `[0]` y el hándicap en `[1]`. El ternario decide la categoría en una línea y guarda el resultado en su posición. Es la lógica booleana pura del enunciado: las dos condiciones con `&&`.

</details>

---

### 4. Primes in numbers

Dado un número positivo `n`, devuelve su descomposición en factores primos con el formato `"(p1**exp1)(p2**exp2)"`. Si el exponente es 1, se escribe solo `"(p)"`.

**Ejemplo:** `86240` → `"(2**5)(5)(7**2)(11)"`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/54d512e62a5e54c96200002e)
- Dificultad: 5 kyu

<details>
<summary>💡 Pista</summary>

Divide por 2, luego por los impares desde 3 hasta la raíz cuadrada de `n` (que se va reduciendo al dividir). Cuenta cuántas veces divide cada divisor (el exponente) y monta el string con un `StringBuilder`.

</details>

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static String factors(int n) {
        StringBuilder sb = new StringBuilder();

        for (int i = 2; i * i <= n; i++) {
            int veces = 0;
            while (n % i == 0) {
                n /= i;
                veces++;
            }
            if (veces == 1) {
                sb.append("(").append(i).append(")");
            } else if (veces > 1) {
                sb.append("(").append(i).append("**").append(veces).append(")");
            }
        }
        if (n > 1) {
            sb.append("(").append(n).append(")");
        }
        return sb.toString();
    }
}
```

El `while` interno divide mientras el divisor encaje y cuenta las repeticiones: ese es el exponente. El bucle solo llega a la raíz de `n` (y `n` se va reduciendo), así que el `if (n > 1)` final recoge el último factor primo que queda. El `StringBuilder` evita concatenar cadenas en cada vuelta, que sería lento.

</details>

---

## AceptaElReto

### 5. 108 — Hormigas

Sobre una barra de longitud `L` cm hay `n` hormigas. Cada hormiga se mueve a 1 cm/s hacia el extremo que le toque (el enunciado te da las posiciones). Cuando dos hormigas se cruzan, ambas cambian de sentido. Calcula, para cada caso de prueba, el **tiempo mínimo** y el **tiempo máximo** que tardan en caerse todas de la barra.

**Entrada:** varios casos de prueba. Cada caso empieza con `L` y `n`, seguido de las `n` posiciones de las hormigas.

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=108)
- Dificultad: ⭐⭐

<details>
<summary>💡 Pista</summary>

Cuando dos hormigas se cruzan y cambian de sentido, es **como si se ignoraran**: la posición de las hormigas es indistinguible. Así que cada hormiga cae en `min(pos, L - pos)` o `max(pos, L - pos)`. El mínimo tiempo es el mayor de los mínimos; el máximo, el mayor de los máximos.

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class Hormigas {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (sc.hasNextInt()) {
            int L = sc.nextInt();
            int n = sc.nextInt();
            int minTiempo = 0, maxTiempo = 0;

            for (int i = 0; i < n; i++) {
                int pos = sc.nextInt();
                int haciaIzq = pos;
                int haciaDer = L - pos;
                minTiempo = Math.max(minTiempo, Math.min(haciaIzq, haciaDer));
                maxTiempo = Math.max(maxTiempo, Math.max(haciaIzq, haciaDer));
            }

            System.out.println(minTiempo + " " + maxTiempo);
        }
        sc.close();
    }
}
```

El truco conceptual: cuando dos hormigas se cruzan, ambas dan la vuelta, pero como son indistinguibles, el efecto es el mismo que si pasaran de largo. Cada hormiga tarda `pos` o `L - pos` en caer según el lado al que vaya. Para el mínimo total, cada hormiga elige su lado más cercano y el tiempo es el mayor de esos mínimos; para el máximo, el peor caso.

</details>

---

### 6. 140 — Suma de dígitos

Dado un número positivo, calcula la suma de sus dígitos. La entrada es una secuencia de números que termina con `-1`.

**Ejemplo:** `123` → `123: 6`, `55` → `55: 10`, `1000` → `1000: 1`.

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=140)
- Dificultad: ⭐

<details>
<summary>💡 Pista</summary>

Puedes extraer los dígitos con `% 10` y `/ 10` en un bucle mientras el número sea mayor que 0. O, más en el espíritu de esta unidad, convertir el número a `String` y recorrerlo con un `charAt`, sumando `c - '0'`.

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class SumaDigitos {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            int n = sc.nextInt();
            if (n == -1) break;

            int suma = 0;
            String texto = String.valueOf(n);
            for (int i = 0; i < texto.length(); i++) {
                suma += texto.charAt(i) - '0';
            }

            System.out.println(n + ": " + suma);
        }
        sc.close();
    }
}
```

Convertir el número a `String` permite tratar los dígitos como caracteres: `charAt(i) - '0'` convierte el carácter `'3'` en el número `3` (porque los códigos ASCII de los dígitos son consecutivos). Sin operaciones aritméticas de `%` y `/`: la versión "de unidad de regex" de un clásico.

</details>

---

> 🧭 **¿Y si te quedas con ganas?** Cuando domines los ficheros y las regex, vuelve a los problemas de unidades anteriores y resuélvelos leyendo los datos desde un archivo en vez de pedirlos por teclado, o validando la entrada con un `matches()`. El material no se pierde: se reutiliza.