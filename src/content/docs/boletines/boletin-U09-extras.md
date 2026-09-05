---
title: "Boletín U09 — Extras"
description: "CodeWars y AceptaElReto para ir más allá de la unidad"
---

# 📝 Boletín U09 — Extras

> Ejercicios de CodeWars y AceptaElReto con pistas. Las soluciones están ocultas: agota tu pista antes de mirarlas.

---

## CodeWars

### 1. Mexican Wave

Te dan una cadena. Debes devolver un array de cadenas donde cada una tiene una sola letra en mayúscula: la de la posición `i`, avanzando de izquierda a derecha. Los espacios se saltan (no generan versión propia, pero no cambian el índice).

**Ejemplo:** `"gap"` → `["Gap", "gAp", "gaP"]`, y `"hello"` → `["Hello", "hEllo", "heLlo", "helLo", "hellO"]`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/58f5c63f1e26ecda7e000029)
- Dificultad: 6 kyu

<details>
<summary>💡 Pista</summary>

Recorre la cadena carácter a carácter con un `for`. Si el carácter es un espacio, `continue`. Si no, construye la versión en ola: `texto.substring(0, i) + Character.toUpperCase(c) + texto.substring(i + 1)`.

</details>

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static String[] wave(String str) {
        java.util.List<String> resultado = new java.util.ArrayList<>();
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            if (c == ' ') {
                continue;
            }
            String ola = str.substring(0, i) + Character.toUpperCase(c) + str.substring(i + 1);
            resultado.add(ola);
        }
        return resultado.toArray(new String[0]);
    }
}
```

La ola se construye con tres trozos: lo anterior, la letra en mayúscula y lo posterior. Los espacios se saltan pero no desplazan el índice, así que `"two words"` produce una ola por letra, no por palabra.

</details>

---

### 2. Delete occurrences of an element if it occurs more than n times

Te dan una lista de enteros y un límite `n`. Devuelve una nueva lista con los mismos elementos, pero cada valor solo puede aparecer como máximo `n` veces (se conservan las primeras `n` apariciones).

**Ejemplo:** `[1, 2, 3, 1, 2, 1, 2, 3]` con `n = 2` → `[1, 2, 3, 1, 2, 3]`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/554ca54ffa7d91b236000023)
- Dificultad: 6 kyu

<details>
<summary>💡 Pista</summary>

Usa un `HashMap<Integer, Integer>` (lo verás en la U10, pero ya puedes usarlo) para llevar la cuenta de cuántas veces ha aparecido cada valor. Solo añade el elemento a la respuesta si su contador aún no ha llegado a `n`.

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.*;

public class Kata {
    public static int[] deleteNth(int[] elements, int maxOcurrences) {
        Map<Integer, Integer> contador = new HashMap<>();
        List<Integer> resultado = new ArrayList<>();

        for (int e : elements) {
            int veces = contador.getOrDefault(e, 0);
            if (veces < maxOcurrences) {
                resultado.add(e);
                contador.put(e, veces + 1);
            }
        }

        int[] arr = new int[resultado.size()];
        for (int i = 0; i < arr.length; i++) {
            arr[i] = resultado.get(i);
        }
        return arr;
    }
}
```

El `HashMap` asocia cada valor con las veces que ha aparecido. `getOrDefault(e, 0)` devuelve la cuenta actual (o 0 si es la primera vez). Si aún no has llegado al límite, añades el elemento y subes el contador. Es la combinación perfecta de arrays (recorrido) y colecciones (la cuenta).

</details>

---

### 3. Roman Numerals Encoder

Crea una función que convierta un número positivo (1 a 3999) en su representación en **números romanos**.

**Ejemplo:** `182` → `"CLXXXII"`, `1990` → `"MCMXC"`, `1666` → `"MDCLXVI"`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/51b62bf6a9c58071c600002b)
- Dificultad: 6 kyu

<details>
<summary>💡 Pista</summary>

Prepara dos arrays paralelos: los valores `{1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1}` y sus símbolos `{"M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"}`. Recórrelos en orden descendente y, mientras el número alcance el valor, resta y añade el símbolo.

</details>

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static String solution(int n) {
        int[] valores = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
        String[] simbolos = {"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"};

        StringBuilder resultado = new StringBuilder();
        for (int i = 0; i < valores.length; i++) {
            while (n >= valores[i]) {
                resultado.append(simbolos[i]);
                n -= valores[i];
            }
        }
        return resultado.toString();
    }
}
```

El truco está en los símbolos compuestos (`CM` = 900, `IV` = 4): sin ellos, no podrías representar los restos del 4 y el 9. El `while` va restando el valor máximo posible con cada símbolo. Es un clásico de arrays paralelos.

</details>

---

### 4. Array.diff

Te dan dos arrays. Devuelve el primer array con todos los valores que estaban en el segundo **eliminados**.

**Ejemplo:** `[1, 2, 2, 2, 3]` y `[2]` → `[1, 3]`, y `[1, 2, 3]` y `[1, 2]` → `[3]`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/523f5d21c841566fde000009)
- Dificultad: 6 kyu

<details>
<summary>💡 Pista</summary>

Convierte el segundo array en un `HashSet<Integer>` y recorre el primero con un `for-each`: solo añade al resultado los elementos que `set.contains(...)` diga que NO están.

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.*;

public class Kata {
    public static int[] arrayDiff(int[] a, int[] b) {
        Set<Integer> aBorrar = new HashSet<>();
        for (int x : b) {
            aBorrar.add(x);
        }

        List<Integer> resultado = new ArrayList<>();
        for (int x : a) {
            if (!aBorrar.contains(x)) {
                resultado.add(x);
            }
        }

        int[] arr = new int[resultado.size()];
        for (int i = 0; i < arr.length; i++) {
            arr[i] = resultado.get(i);
        }
        return arr;
    }
}
```

El `HashSet` convierte la búsqueda en O(1): preguntar "¿está este número para borrar?" es instantáneo aunque `b` sea enorme. Con un array en su lugar, cada `contains` sería un recorrido lineal completo. Por eso esta kata se resuelve con colecciones, no con más arrays.

</details>

---

## AceptaElReto

### 5. 102 — Encriptación de mensajes

Un mensaje se encripta desplazando cada letra un número fijo de posiciones en el alfabeto (cifrado César). Debes implementar el programa que dado un desplazamiento y un texto, devuelva el mensaje encriptado, **rodeando al final del alfabeto** (si te pasas de la Z, vuelves a la A).

**Entrada:** varios casos. Cada caso: una línea con el desplazamiento seguido del texto entre comillas. La entrada termina con una línea con `0` y un texto vacío.

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=102)
- Dificultad: ⭐⭐

<details>
<summary>💡 Pista</summary>

Convierte cada letra a su posición con `c - 'A'`, súmale el desplazamiento, aplica `% 26` para el wrap-around y vuelve a `char` con `(char) ('A' + pos)`. Vigila que solo encriptes letras, no espacios ni signos.

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class Encriptacion {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (sc.hasNextInt()) {
            int desplazamiento = sc.nextInt();
            String texto = sc.nextLine().trim();
            if (desplazamiento == 0 && texto.isEmpty()) break;

            StringBuilder resultado = new StringBuilder();
            for (int i = 0; i < texto.length(); i++) {
                char c = texto.charAt(i);
                if (c >= 'A' && c <= 'Z') {
                    int pos = (c - 'A' + desplazamiento) % 26;
                    resultado.append((char) ('A' + pos));
                } else {
                    resultado.append(c);
                }
            }
            System.out.println(resultado);
        }
        sc.close();
    }
}
```

El wrap-around lo hace el `% 26`: si estás en la Z (pos 25) y sumas 3, `(25 + 3) % 26 = 2`, que es la C. Las letras se tratan por separado de los espacios y signos. La condición de salida usa el caso especial de AceptaElReto: desplazamiento 0 y texto vacío.

</details>

---

### 6. 341 — Matriz identidad

Una **matriz identidad** tiene unos en la diagonal principal y ceros en el resto. Dado el tamaño de una matriz y sus valores, debes decir si es identidad o no.

**Entrada:** varios casos. Cada caso: una línea con el tamaño `n`, seguida de `n` líneas con los `n` valores de cada fila. La entrada termina con `0`.

**Ejemplo:**

```
2
1 0
0 1
3
1 0 0
0 1 0
0 0 1
0
```

**Salida:**

```
SI
SI
```

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=341)
- Dificultad: ⭐⭐

<details>
<summary>💡 Pista</summary>

Recorre toda la matriz con dos bucles y comprueba: si `fila == columna` debe valer 1, si no, debe valer 0. En cuanto encuentres un valor que no cumpla su regla, el caso es "NO". Una matriz identidad de tamaño 1 (solo un `1`) también es identidad.

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class MatrizIdentidad {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            int n = sc.nextInt();
            if (n == 0) break;

            int[][] matriz = new int[n][n];
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < n; j++) {
                    matriz[i][j] = sc.nextInt();
                }
            }

            boolean esIdentidad = true;
            for (int i = 0; i < n && esIdentidad; i++) {
                for (int j = 0; j < n; j++) {
                    if ((i == j && matriz[i][j] != 1) || (i != j && matriz[i][j] != 0)) {
                        esIdentidad = false;
                        break;
                    }
                }
            }

            System.out.println(esIdentidad ? "SI" : "NO");
        }
        sc.close();
    }
}
```

La condición del `if` resume toda la regla en una línea: en la diagonal (`i == j`) exiges 1, fuera de ella exiges 0. En cuanto falla una casilla, `esIdentidad = false` y el `break` corta el bucle interior; el `&& esIdentidad` del exterior corta también el de fuera. Arrays 2D + bucles anidados al servicio del problema.

</details>

---

> 🧭 **¿Y si te quedas con ganas?** Cuando domines arrays y colecciones, vuelve a los problemas de unidades anteriores y resuélvelos guardando los datos en estructuras: ya no hará falta pedir todo por teclado de golpe. El material no se pierde: se reutiliza.