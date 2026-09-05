---
title: "Boletín U04 — Extras"
description: "CodeWars y AceptaElReto para ir más allá de los arrays"
---

# 📝 Boletín U04 — Extras

> Ejercicios de CodeWars y AceptaElReto con pistas. Las soluciones están ocultas: agota tu pista antes de mirarlas.

---

## CodeWars

### 1. Convert number to reversed array of digits

Te dan un número entero no negativo. Devuelve sus dígitos en un array de enteros, **en orden inverso**.

**Ejemplo:** `35231` → `[1, 3, 2, 5, 3]` · `0` → `[0]`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/5583090cbe83f4fd8c000051)
- Dificultad: 8 kyu

<details>
<summary>💡 Pista</summary>

Para extraer dígitos, `% 10` te da el último y `/ 10` se lo quita. Con eso ya salen invertidos: el primero que sacas es el último del número.

</details>

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

### 2. Find the smallest integer in the array

Te dan un array de enteros. Devuelve el entero **más pequeño**.

**Ejemplos:** `[78, 56, 232, 12, 11, 43]` → `11` · `[34, -345, -1, 100]` → `-345`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/55a2d7ebe362935a210000b2)
- Dificultad: 8 kyu

<details>
<summary>💡 Pista</summary>

El patrón del mínimo: empieza asumiendo que el primero es el mínimo y compara con cada uno. Aquí el array nunca está vacío.

</details>

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static int findSmallestInt(int[] args) {
        int minimo = args[0];
        for (int i = 1; i < args.length; i++) {
            if (args[i] < minimo) {
                minimo = args[i];
            }
        }
        return minimo;
    }
}
```

El mismo esqueleto que el "máximo acumulado", pero al revés. Como el array nunca está vacío, puedes usar `args[0]` como punto de partida sin miedo.

</details>

---

### 3. Count by X

Devuelve un array con los **primeros `n` múltiplos** de `x`.

**Ejemplos:** `countBy(2, 5)` → `[2, 4, 6, 8, 10]` · `countBy(1, 10)` → `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/5513795bd3fafb56c200049e)
- Dificultad: 8 kyu

<details>
<summary>💡 Pista</summary>

Crea el array con `new int[n]` y rellena con un `for`: la plaza `i` guarda `x * (i + 1)`.

</details>

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static int[] countBy(int x, int n) {
        int[] resultado = new int[n];
        for (int i = 0; i < n; i++) {
            resultado[i] = x * (i + 1);
        }
        return resultado;
    }
}
```

Sabes el tamaño de antemano (`n`), así que no hace falta el patrón de dos pasadas: un solo `for` crea y rellena. El `(i + 1)` es porque los múltiplos empiezan en `x * 1`, no en `x * 0`.

</details>

---

### 4. Take a Ten Minute Walk

Vives en una ciudad en cuadrícula. Te dan un array de direcciones (`'n'`, `'s'`, `'e'`, `'w'`). Devuelve `true` si el paseo dura **exactamente 10 minutos** (una manzana por minuto) **y te deja en el punto de partida**.

**Ejemplos:** `['n','s','n','s','n','s','n','s','n','s']` → `true` · `['n','n','n','s','n','s','n','s','n','s']` → `false`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/54da539698eb8f52b900053b)
- Dificultad: 6 kyu

<details>
<summary>💡 Pista</summary>

Lleva dos contadores: uno para norte/sur y otro para este/oeste. Si el paseo no dura 10 minutos, ya puedes devolver `false` sin contar nada.

</details>

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static boolean isValid(char[] walk) {
        if (walk.length != 10) {
            return false;
        }

        int x = 0, y = 0;
        for (char c : walk) {
            if (c == 'n') y++;
            if (c == 's') y--;
            if (c == 'e') x++;
            if (c == 'w') x--;
        }

        return x == 0 && y == 0;
    }
}
```

Norte sube `y`, sur lo baja; este sube `x`, oeste lo baja. Si al final ambos contadores vuelven a 0, estás donde empezaste. Es un array recorrido una sola vez, con la suma como testigo. O(n), como debe ser.

</details>

---

## AceptaElReto

### 5. 171 — Abadías de piedra

Una cordillera tiene una serie de montañas, cada una con su altura. Se puede construir una **abadía** sobre una montaña si es **más alta que todas las que tiene a su derecha** (hacia el mar). Cuenta cuántas montañas cumplen la condición.

**Entrada:** varios casos de prueba. Cada caso empieza con `N` (número de montañas), seguido de `N` alturas en la misma línea. Un `0` termina la entrada.

**Ejemplo:**

```
3
5 3 4
4
2 3 4 1
0
```

**Salida:**

```
2
2
```

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=171)
- Dificultad: Fácil

<details>
<summary>💡 Pista</summary>

Recorre el array **de derecha a izquierda** guardando la altura máxima vista. La última montaña siempre vale. Cuando una montaña supere la máxima vista hasta ahora, es una abadía nueva.

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class Abadias {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();

        while (n != 0) {
            int[] montanas = new int[n];
            for (int i = 0; i < n; i++) {
                montanas[i] = sc.nextInt();
            }

            int abadias = 0;
            int maxVista = -1;
            for (int i = n - 1; i >= 0; i--) {
                if (montanas[i] > maxVista) {
                    abadias++;
                    maxVista = montanas[i];
                }
            }

            System.out.println(abadias);
            n = sc.nextInt();
        }
        sc.close();
    }
}
```

La clave es recorrer hacia atrás: la montaña ve el mar si es más alta que **todo** lo que hay a su derecha, y la máxima vista lo resume todo. Con `5 3 4`: el 4 vale, el 3 no (hay un 4 más alto), el 5 vale → 2. Es un array + recorrido en el sentido correcto.

</details>

---

### 6. 369 — Contando en la arena

Un niño escribe los números en la arena con marcas de conteo: el `1` lo escribe como `1`, el `2` como `11`, el `3` como `111`... Es decir, cada número se representa con tantos unos como valga. Dado un número, escríbelo como lo haría el niño.

**Entrada:** varios números, uno por línea, hasta un `0` final.

**Ejemplo:**

```
1
5
3
0
```

**Salida:**

```
1
11111
111
```

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=369)
- Dificultad: Fácil

<details>
<summary>💡 Pista</summary>

Un bucle que añada `'1'` a un `StringBuilder` tantas veces como indique el número. No hace falta array: es la prueba de que a veces basta con saber cuántas veces repetir.

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class ContandoEnLaArena {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();

        while (n != 0) {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < n; i++) {
                sb.append('1');
            }
            System.out.println(sb);
            n = sc.nextInt();
        }
        sc.close();
    }
}
```

Cada número `n` se convierte en `n` unos. El bucle es el mismo que usarías para rellenar un array, pero aquí el "array" es un `StringBuilder` que crece. El `0` marca el final de la entrada, como siempre en AceptaElReto.

</details>

---

> 🧭 **¿Y si te quedas con ganas?** Cuando domines el aparcamiento entero —crear, recorrer, ordenar, buscar, invertir y compactar—, vuelve a estos problemas con el punto 9 como examen. Y en la U05 te esperan los algoritmos: búsqueda binaria, burbuja y Big O. Los arrays que has aprendido hoy son la materia prima de todo lo que viene.