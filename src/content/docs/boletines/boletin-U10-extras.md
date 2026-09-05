---
title: "Boletín U10 — Extras"
description: "CodeWars y AceptaElReto para ir más allá de las colecciones"
---

# 📝 Boletín U10 — Extras

> Ejercicios de CodeWars y AceptaElReto con pistas. Las soluciones están ocultas: agota tu pista antes de mirarlas.

---

## CodeWars

### 1. Convert a string to an array

Te dan una cadena de texto separada por espacios. Escribe una función que la divida y devuelva un array de palabras.

**Ejemplo:** `"Robin Singh"` → `["Robin", "Singh"]`, y `"I love arrays they are my favorite"` → `["I", "love", "arrays", "they", "are", "my", "favorite"]`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/57e76bc428d6fbc2d500036d)
- Dificultad: 8 kyu

<details>
<summary>💡 Pista</summary>

El método `String.split(" ")` ya te devuelve un `String[]`. Pero como estamos en la unidad de colecciones: conviértelo en una `List<String>` con `Arrays.asList(...)` o guarda las palabras con un bucle en un `ArrayList<String>`.

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.List;

public class Kata {
    public static String[] stringToArray(String s) {
        return s.split(" ");
    }
}
```

O, pensando en colecciones:

```java
import java.util.ArrayList;
import java.util.List;

public class Kata {
    public static List<String> stringToArray(String s) {
        List<String> palabras = new ArrayList<>();
        for (String palabra : s.split(" ")) {
            palabras.add(palabra);
        }
        return palabras;
    }
}
```

`split(" ")` parte la cadena por los espacios y devuelve un array. La versión con `ArrayList` recorre ese array y construye la lista: el mismo dato, visto desde la unidad de colecciones.

</details>

---

### 2. Roman Numerals Encoder

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

El truco está en los símbolos compuestos (`CM` = 900, `IV` = 4): sin ellos, no podrías representar los restos del 4 y el 9. El `while` va restando el valor máximo posible con cada símbolo. Es un clásico de arrays paralelos y del patrón "greedy".

</details>

---

### 3. Delete occurrences of an element if it occurs more than n times

Te dan una lista de enteros y un límite `n`. Devuelve una nueva lista con los mismos elementos, pero cada valor solo puede aparecer como máximo `n` veces (se conservan las primeras `n` apariciones).

**Ejemplo:** `[1, 2, 3, 1, 2, 1, 2, 3]` con `n = 2` → `[1, 2, 3, 1, 2, 3]`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/554ca54ffa7d91b236000023)
- Dificultad: 6 kyu

<details>
<summary>💡 Pista</summary>

Usa un `HashMap<Integer, Integer>` (lo verás en la U11, pero ya puedes usarlo) para llevar la cuenta de cuántas veces ha aparecido cada valor. Solo añade el elemento a la respuesta si su contador aún no ha llegado a `n`.

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

El `HashMap` asocia cada valor con las veces que ha aparecido. `getOrDefault(e, 0)` devuelve la cuenta actual (o 0 si es la primera vez). Si aún no has llegado al límite, añades el elemento y subes el contador. Es la combinación perfecta de listas (el resultado) y mapas (la cuenta).

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

### 5. 158 — Los saltos de Mario

Mario se encuentra sobre un muro y tiene que saltar a una serie de muros sucesivos. Cuenta **cuántos saltos son hacia arriba** (el siguiente muro está más alto) y **cuántos hacia abajo** (el siguiente muro está más bajo). Si dos muros tienen la misma altura, el salto no es ni arriba ni abajo.

**Entrada:** varios casos de prueba. Cada caso empieza con el número de muros `n`, seguido de `n` alturas. Mario se encuentra sobre el primero.

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=158)
- Dificultad: ⭐⭐

<details>
<summary>💡 Pista</summary>

Guarda las alturas en un `ArrayList<Integer>` y recorre con un for clásico desde el índice 1: compara `alturas.get(i)` con `alturas.get(i - 1)`. Más alto → sube++; más bajo → baja++.

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.ArrayList;
import java.util.Scanner;

public class SaltosDeMario {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int casos = sc.nextInt();
        for (int c = 0; c < casos; c++) {
            int n = sc.nextInt();
            ArrayList<Integer> muros = new ArrayList<>();
            for (int i = 0; i < n; i++) {
                muros.add(sc.nextInt());
            }

            int sube = 0, baja = 0;
            for (int i = 1; i < muros.size(); i++) {
                if (muros.get(i) > muros.get(i - 1)) {
                    sube++;
                } else if (muros.get(i) < muros.get(i - 1)) {
                    baja++;
                }
            }
            System.out.println(sube + " " + baja);
        }
        sc.close();
    }
}
```

La lista guarda todas las alturas del caso y el bucle compara cada muro con el anterior. Un salto hacia arriba es `sube++`; hacia abajo, `baja++`; si son iguales, no se cuenta. `ArrayList` con acceso por índice al servicio del clásico de ProgramaMe.

</details>

---

### 6. 168 — La pieza perdida

Un puzzle tiene piezas numeradas del 1 al `n`, pero en la bolsa falta una. Te dan el número total de piezas `n` y los números de todas las que había (no necesariamente en orden). Dime **qué pieza falta**.

**Entrada:** varios casos. Cada caso: una línea con `n`, y otra con `n - 1` números (los que hay en la bolsa). La entrada termina con `0`.

**Pista:** la numeración de las piezas empieza en 1.

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=168)
- Dificultad: ⭐⭐

<details>
<summary>💡 Pista</summary>

Mete todos los números de la bolsa en un `HashSet<Integer>` y recorre del 1 a `n`: la primera pieza que no esté en el conjunto es la que falta.

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.HashSet;
import java.util.Scanner;

public class PiezaPerdida {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            int n = sc.nextInt();
            if (n == 0) break;

            HashSet<Integer> bolsa = new HashSet<>();
            for (int i = 0; i < n - 1; i++) {
                bolsa.add(sc.nextInt());
            }

            for (int pieza = 1; pieza <= n; pieza++) {
                if (!bolsa.contains(pieza)) {
                    System.out.println(pieza);
                    break;
                }
            }
        }
        sc.close();
    }
}
```

El `HashSet` guarda las `n - 1` piezas que hay. Luego se comprueba cada número del 1 a `n` con `contains`, que es O(1): la primera pieza que no esté en el conjunto es la que falta. Sin ordenar nada y sin un solo bucle de búsqueda lineal.

</details>

---

> 🧭 **¿Y si te quedas con ganas?** Cuando domines listas, conjuntos e iteradores, vuelve a los problemas de unidades anteriores y resuélvelos guardando los datos en colecciones: ya no hará falta pedir todo por teclado de golpe. El material no se pierde: se reutiliza.