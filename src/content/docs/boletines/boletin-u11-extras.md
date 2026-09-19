---
title: "Boletín U11 — Extras"
description: "CodeWars y AceptaElReto para ir más allá de las colecciones, los genéricos y los mapas"
---

# 📝 Boletín U11 — Extras

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

### 2. Counting Duplicates

Escribe una función que devuelva cuántos caracteres **distintos** (letras y dígitos, sin distinguir mayúsculas) aparecen más de una vez en una cadena.

**Ejemplo:** `"abcde"` → `0`, `"aabbcde"` → `2` (a y b), `"indivisibility"` → `1` (la i), `"aA11"` → `2` (a y 1).

- [Enunciado en CodeWars](https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1)
- Dificultad: 6 kyu

<details>
<summary>💡 Pista</summary>

Usa un `HashMap<Character, Integer>` para contar cuántas veces aparece cada carácter (con `toLowerCase()` primero y `getOrDefault` al contar). Después cuenta cuántas claves tienen un valor mayor que 1.

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.HashMap;
import java.util.Map;

public class CountingDuplicates {
    public static int duplicateCount(String text) {
        HashMap<Character, Integer> contador = new HashMap<>();
        for (char c : text.toLowerCase().toCharArray()) {
            contador.put(c, contador.getOrDefault(c, 0) + 1);
        }

        int repetidos = 0;
        for (int veces : contador.values()) {
            if (veces > 1) {
                repetidos++;
            }
        }
        return repetidos;
    }
}
```

Dos pasadas sobre el mismo mapa: primero se cuentan frecuencias con `getOrDefault` (el patrón estrella de la unidad), y después se recorren los **valores** con `values()` contando cuántos superan 1. `toLowerCase()` unifica 'A' y 'a'. Este es el uso de mapa más típico que existe en las katas.

</details>

---

### 3. Find the unique number

Tienes un array de números donde todos son iguales excepto uno. Encuentra el número único.

**Ejemplo:** `[ 1, 1, 1, 2, 1, 1 ]` → `2`, y `[ 0, 0, 0.55, 0, 0 ]` → `0.55`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/585d7d5adb20cf33cb000235)
- Dificultad: 6 kyu

<details>
<summary>💡 Pista</summary>

Cuenta las apariciones de cada número con un `HashMap<Double, Integer>`. Después recorre `entrySet()` y devuelve la clave cuyo valor sea 1. Alternativa tramposa: mira los tres primeros números para saber cuál es el repetido.

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.HashMap;
import java.util.Map;

public class Kata {
    public static double findUniq(double[] arr) {
        HashMap<Double, Integer> contador = new HashMap<>();
        for (double d : arr) {
            contador.put(d, contador.getOrDefault(d, 0) + 1);
        }

        for (Map.Entry<Double, Integer> e : contador.entrySet()) {
            if (e.getValue() == 1) {
                return e.getKey();
            }
        }
        return -1;
    }
}
```

El `HashMap` agrupa por valor: todos los repetidos caen en una clave con contador alto y el único solitario tiene contador 1. Recorrer `entrySet()` y devolver la clave con `getValue() == 1` es directo. La pista alternativa (comparar los tres primeros) evita el mapa, pero esta versión te entrena en frecuencias, que es justo lo que toca esta unidad.

</details>

---

## AceptaElReto

### 4. 152 — Va de modas...

Dado un conjunto de números, la **moda** es el valor (o valores) que más se repite. Te piden calcular la moda de cada distribución.

**Entrada:** varios casos de prueba. Cada caso comienza con un número que indica cuántos valores tiene el conjunto (nunca mayor de 25.000). En la siguiente línea se dan los valores separados por espacios. La entrada termina cuando el primer número es 0.

**Salida:** para cada caso, la moda (se garantiza que solo hay una).

**Ejemplo:** `1 2 2 3 3 3 4 4 4 4 5` → `4`, y `1 8 9 6 3 2 1 5 4 7 9 6 3 2 1 4 7` → `1`.

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=152)
- Dificultad: ⭐⭐

<details>
<summary>💡 Pista</summary>

Cuenta cada número con un `HashMap<Integer, Integer>` (el patrón `getOrDefault`). Después recorre `entrySet()` guardando el número con mayor contador. No hace falta ordenar nada: el mapa hace el trabajo.

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class VaDeModas {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            int n = sc.nextInt();
            if (n == 0) break;

            HashMap<Integer, Integer> frec = new HashMap<>();
            for (int i = 0; i < n; i++) {
                int valor = sc.nextInt();
                frec.put(valor, frec.getOrDefault(valor, 0) + 1);
            }

            int moda = 0, maxVeces = 0;
            for (Map.Entry<Integer, Integer> e : frec.entrySet()) {
                if (e.getValue() > maxVeces) {
                    maxVeces = e.getValue();
                    moda = e.getKey();
                }
            }
            System.out.println(moda);
        }
        sc.close();
    }
}
```

El problema clásico de las frecuencias con mapa: una pasada para contar (`getOrDefault`), otra sobre `entrySet()` para encontrar el máximo. Como se garantiza una única moda, no hay que gestionar empates. Esta es la plantilla que usarás en decenas de problemas de concursos.

</details>

---

### 5. 416 — Michael J. Fox y el Pato Donald

En un grupo de personas, hay que comprobar si **dos personas cumplen años el mismo día**. Te dan las fechas de nacimiento de cada una en formato `día/mes/año`.

**Entrada:** varios casos de prueba en dos líneas cada uno. La primera línea tiene el número de personas del grupo; la segunda, sus fechas de nacimiento separadas por espacios. La entrada termina con un `0`.

**Salida:** `SI` si hay algún cumpleaños repetido (mismo día y mes) y `NO` en caso contrario.

**Ejemplo:** `9/6/1961 22/10/1938 31/5/1961 20/4/1964` → `NO`, y `9/6/1961 22/10/1938 31/5/1961 20/4/1964 9/6/1934` → `SI`.

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=416)
- Dificultad: ⭐⭐

<details>
<summary>💡 Pista</summary>

Mete cada fecha en un `HashSet<String>`. Si `add` devuelve `false`, esa fecha ya estaba: hay repetido. Recuerda que el año no cuenta: corta la fecha en `día/mes` con `split("/")`.

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.HashSet;
import java.util.Scanner;

public class Cumpleanos {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            int n = sc.nextInt();
            if (n == 0) break;

            HashSet<String> fechas = new HashSet<>();
            boolean repetido = false;

            for (int i = 0; i < n; i++) {
                String fecha = sc.next();
                String diaMes = fecha.split("/")[0] + "/" + fecha.split("/")[1];
                if (!fechas.add(diaMes)) {
                    repetido = true;
                }
            }
            System.out.println(repetido ? "SI" : "NO");
        }
        sc.close();
    }
}
```

El truco del `HashSet`: `add()` devuelve `false` si el elemento ya estaba, así que no necesitas `contains` por separado. Se guarda solo `día/mes` (sin el año) porque dos personas cumplen el mismo día aunque hayan nacido en años distintos. Detectar duplicados en O(1) es el superpoder del Set, hermano pequeño del mapa de esta unidad.

</details>

---

> 🧭 **¿Y si te quedas con ganas?** Cuando domines listas, conjuntos, genéricos y mapas, vuelve a los problemas de unidades anteriores y resuélvelos guardando los datos en colecciones: el contador de notas, el buscador de nombres... Todo lo que antes era un array paralelo ahora es un mapa. El material no se pierde: se reutiliza.
