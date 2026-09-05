---
title: Boletín U02 — Extras
description: CodeWars y AceptaElReto para ir más allá de la unidad
---

# 📝 Boletín U02 — Extras

> Ejercicios de CodeWars y AceptaElReto con pistas. La solución está oculta: resístete hasta agotar tu pista.

---

## CodeWars

### 1. Keep Hydrated!

Nathan bebe agua, pero no siempre suficiente. Le han dado `time` en horas y quiere saber cuántos litros de agua debe beber. La regla: bebe 0.5 litros por hora. Devuelve el número de litros **redondeado hacia abajo**.

**Ejemplo:** con `time = 6.7`, bebe `3` litros (3.35 → 3).

- [Enunciado en CodeWars](https://www.codewars.com/kata/582cb0224e56e068d2000030)
- Dificultad: 8 kyu

**Pista:** multiplica `time * 0.5` y trunca el resultado con `(int)`. El truncamiento y el "redondeo hacia abajo" son lo mismo aquí... por una vez.

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static int Liters(double time) {
        return (int) (time * 0.5);
    }
}
```

`6.7 * 0.5 = 3.35`, y `(int)` trunca a 3. El truncamiento del casting es exactamente el "redondeo hacia abajo" que pide el enunciado.

</details>

---

### 2. Opposite number

Escribe una función que reciba un número y devuelva su opuesto (el mismo número con el signo cambiado).

**Ejemplos:** `1` → `-1`, `14` → `-14`, `-34` → `34`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/56dec885c54a926dcd001095)
- Dificultad: 8 kyu

**Pista:** el operador unario `-` invierte el signo de cualquier número: `-numero`. O multiplícalo por `-1`.

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static int opposite(int number) {
        return -number;
    }
}
```

El operador unario `-` del punto 3 invierte el signo. Un solo carácter y el problema está resuelto.

</details>

---

### 3. MakeUpperCase

Escribe una función que convierta un String a mayúsculas.

**Ejemplo:** `"hello"` → `"HELLO"`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/57a0556c7cb1f31ab3000ad7)
- Dificultad: 8 kyu

**Pista:** ¿recuerdas el método de `String` del punto 8 que pone todo en mayúsculas? Es la primera herramienta de la caja.

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static String makeUpperCase(String str) {
        return str.toUpperCase();
    }
}
```

`toUpperCase()` del punto 8. Directo de la caja de herramientas.

</details>

---

### 4. Count of positives / sum of negatives

Dado un array de enteros, devuelve un array de dos elementos: el **número de números positivos** en el primer hueco y la **suma de los negativos** en el segundo. Si el array está vacío, devuelve un array vacío.

**Ejemplo:** `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, -11, -12, -13, -14, -15]` → `[10, -65]`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/571effabb625ed9b0600107a)
- Dificultad: 7 kyu

**Pista:** no hace falta ni bucles: declara `int[] resultado = new int[2];` y usa un bucle `for...each` (ya lo has visto en clase) para contar positivos y sumar negativos con `if`. Aquí lo importante es recordar cómo acceder a los huecos de un array.

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static int[] countPositivesSumNegatives(int[] input) {
        if (input == null || input.length == 0) {
            return new int[0];
        }

        int positivos = 0;
        int sumaNegativos = 0;

        for (int numero : input) {
            if (numero > 0) {
                positivos++;
            } else if (numero < 0) {
                sumaNegativos += numero;
            }
        }

        return new int[]{positivos, sumaNegativos};
    }
}
```

El contador usa `++`, la suma acumulada usa `+=`, y el `if` decide con operadores relacionales. Un repaso perfecto de la unidad (el `for...each` completo lo verás en la U04).

</details>

---

### 5. Get the Middle Character

Dada una palabra, devuelve el carácter (o los dos caracteres) del centro.

**Ejemplos:** `"test"` → `"es"`, `"testing"` → `"t"`, `"middle"` → `"dd"`, `"A"` → `"A"`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/56747fd5cb988479af000028)
- Dificultad: 7 kyu

**Pista:** usa `length()` y `substring()` del punto 9. Si la longitud es par, devuelve los dos caracteres centrales; si es impar, solo uno.

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static String getMiddle(String word) {
        int longitud = word.length();
        int medio = longitud / 2;

        if (longitud % 2 == 0) {
            return word.substring(medio - 1, medio + 1);
        }
        return word.substring(medio, medio + 1);
    }
}
```

`longitud / 2` te da el centro. Si la longitud es par, el centro está repartido entre dos letras (`"test"` → medio 2 → `substring(1, 3)` = `"es"`); si es impar, el centro es una sola letra. `%` para saber si es par o impar, `length` para medir y `substring` para cortar: el trío de herramientas de esta unidad.

</details>

---

## AceptaElReto

### 6. 148 — Nochevieja

El 31 de diciembre, los más impacientes miran el reloj y cuentan cuántos segundos faltan para las 12 de la noche. Dado un instante con formato `HH:MM:SS`, calcula los segundos que faltan para medianoche.

**Entrada:** un número con el total de casos, y en cada línea una hora en formato `HH:MM:SS` (con dos dígitos por campo, pero los ceros a la izquierda pueden omitirse).

**Ejemplo:**

```
3
00:00:00
23:59:59
05:30:00
```

**Salida:**

```
86400
1
66600
```

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=148)
- Dificultad: Fácil

**Pista:** el día tiene 86400 segundos. Convierte la hora a segundos totales (`hora * 3600 + minuto * 60 + segundo`) y réstalo de 86400. Para separar los campos, lee con `nextInt()` y descarta los dos puntos con `next()`, o usa `Scanner.useDelimiter(":")`. El truco está en `%02d`... o en leer directamente.

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class Nochevieja {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int casos = sc.nextInt();

        for (int i = 0; i < casos; i++) {
            String hora = sc.next();
            String[] partes = hora.split(":");
            int h = Integer.parseInt(partes[0]);
            int m = Integer.parseInt(partes[1]);
            int s = Integer.parseInt(partes[2]);

            int segundosTranscurridos = h * 3600 + m * 60 + s;
            int segundosFaltan = 86400 - segundosTranscurridos;
            System.out.println(segundosFaltan);
        }
        sc.close();
    }
}
```

Lectura alternativa sin `split`: declarar el `Scanner` con `useDelimiter("\\s*:\\s*")` y leer tres `nextInt()` seguidos. La lógica es la misma: hora a segundos, réstalo de 86400 (los segundos que tiene el día). Para `00:00:00` faltan 86400; para `23:59:59`, 1. Pura aritmética de la unidad.

</details>

---

### 7. 217 — ¿Qué lado de la calle?

En la calle principal de Doña Lita las casas se distribuyen en dos lados: los números impares van en un lado y los pares en el otro. Dado un número de casa, di en qué lado está.

**Entrada:** el número 0 indica el fin de la entrada (no hay que procesarlo). Para cada número de casa (positivo), muestra:

```
IZQUIERDA
```

o

```
DERECHA
```

según corresponda. El criterio es simple: un número de casa es `IZQUIERDA` si es par y `DERECHA` si es impar (o al revés, según la calle; lee bien el enunciado original).

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=217)
- Dificultad: Fácil

**Pista:** ¿qué operador te dice si un número es par o impar? El `%` del punto 3. El bucle termina cuando lees un 0, con un `while`.

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class LadoCalle {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int numero = sc.nextInt();

        while (numero != 0) {
            String lado = numero % 2 == 0 ? "IZQUIERDA" : "DERECHA";
            System.out.println(lado);
            numero = sc.nextInt();
        }
        sc.close();
    }
}
```

El operador módulo `%` decide: resto 0 es par, resto 1 es impar. El `while` repite hasta leer el 0 centinela. La lógica entera del problema es un solo ternario.

</details>

---

> 🧭 **¿Y si te quedas con ganas?** Cuando domines las estructuras de control (U03) podrás volver a estos problemas con `for` y `switch` para hacer soluciones más elegantes. El material no se pierde: se reutiliza.
