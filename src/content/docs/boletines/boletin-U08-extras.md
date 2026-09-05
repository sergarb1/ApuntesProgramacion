---
title: Boletín U08 — Extras
description: CodeWars y AceptaElReto para ir más allá de la unidad
---

# 📝 Boletín U08 — Extras

> Ejercicios de CodeWars y AceptaElReto con pistas. La solución está oculta: resístete hasta agotar tu pista.

---

## CodeWars

### 1. Remove String Spaces

Te dan una cadena y tienes que quitarle todos los espacios en blanco.

**Ejemplos:** `"8 j 8   mBliB8g  imjB8B8  jl  B"` → `"8j8mBliB8gimjB8B8jlB"`, `"8aaaaa dddd r     "` → `"8aaaaaddddr"`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/57eae20f5500ad98e50002c5)
- Dificultad: 8 kyu

**Pista:** el método `String.replace(" ", "")` cambia todas las apariciones de un texto por otro. Quitar los espacios es reemplazarlos por "nada".

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static String noSpace(final String x) {
        return x.replace(" ", "");
    }
}
```

`replace(" ", "")` recorre toda la cadena y sustituye cada espacio por la cadena vacía. Sin bucles, sin condiciones: un solo método estático resuelto con el material de cadenas de la U06.

</details>

---

### 2. String repeat

Te dan un número `repeat` y una cadena `string`. Devuelve la cadena repetida ese número de veces.

**Ejemplos:** `repeatStr(6, "I")` → `"IIIIII"`, `repeatStr(5, "Hello")` → `"HelloHelloHelloHelloHello"`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/57a0e5c372292dd76d000d7e)
- Dificultad: 8 kyu

**Pista:** un `for` que vaya sumando la cadena a un acumulador tantas veces como indique `repeat`. (O el método `string.repeat(repeat)`, si te va el atajo.)

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static String repeatStr(final int repeat, final String string) {
        return string.repeat(repeat);
    }
}
```

O, a la antigua:

```java
public class Kata {
    public static String repeatStr(final int repeat, final String string) {
        StringBuilder resultado = new StringBuilder();
        for (int i = 0; i < repeat; i++) {
            resultado.append(string);
        }
        return resultado.toString();
    }
}
```

`String.repeat(repeat)` es el método moderno, directo y sin bucles. Si prefieres entender la mecánica, el `for` con `StringBuilder` (lo viste en la U06) hace exactamente lo mismo: acumular la cadena `repeat` veces.

</details>

---

### 3. Convert boolean values to strings 'Yes' or 'No'

Completa el método `boolToWord(boolean b)` para que devuelva `"Yes"` si es `true` y `"No"` si es `false`.

**Ejemplos:** `boolToWord(true)` → `"Yes"`, `boolToWord(false)` → `"No"`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/53369039d7ab3ac506000467)
- Dificultad: 8 kyu

**Pista:** un `if`/`else` que devuelva una cadena u otra, o el operador ternario que viste en la U03: `return b ? "Yes" : "No";`.

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static String boolToWord(boolean b) {
        return b ? "Yes" : "No";
    }
}
```

Un ternario en una sola línea: si `b` es `true` devuelve `"Yes"`, si no `"No"`. Decidir con elegancia, justo el espíritu de las estructuras de control de la U03 aplicado a un método estático.

</details>

---

### 4. Find the smallest integer in the array

Te dan un array de enteros. Devuelve el número más pequeño.

**Ejemplo:** `[34, 15, 88, 2]` → `2`, `[34, -345, -1, 100]` → `-345`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/55a2d7ebe362935a210000b2)
- Dificultad: 8 kyu

**Pista:** recorre el array y ve guardando en una variable el mínimo encontrado hasta el momento. Empieza con `args[0]` como primer candidato.

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

La idea del "mínimo acumulado": empiezas asumiendo que el primero es el menor y, si aparece uno más pequeño, actualizas. Es el mismo razonamiento que el `Validador` del boletín avanzado, ahora aplicado a números. `Math.min` sería el atajo, pero este `for` enseña la mecánica.

</details>

---

## AceptaElReto

### 5. 155 — Perímetro de un rectángulo

Varios rectángulos se colocan uno a continuación de otro, todos apoyados sobre la misma base horizontal. Dado el número de rectángulos y el ancho y el alto de cada uno, calcula el **perímetro** de la figura resultante.

**Entrada:** varios casos de prueba. Cada caso es una línea con un número N (el número de rectángulos) seguido de N pares `ancho alto`. La entrada termina con `0`.

**Ejemplo:**

```
2 2 2 1
3 1 1 1 1 1 1
0
```

**Salida:**

```
12
8
```

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=155)
- Dificultad: Fácil

**Pista:** el perímetro de la figura es `2 * (sumaAnchos + sumaAltos) - 2 * suma(alturaCompartida entre rectángulos vecinos)`, donde la altura compartida entre dos vecinos es la **menor** de sus alturas (`Math.min`). Los lados internos se restan porque no forman parte del perímetro exterior.

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class PerimetroRectangulo {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            int n = sc.nextInt();
            if (n == 0) break;

            int sumaAnchos = 0;
            int sumaAltos = 0;
            int[] altos = new int[n];
            int compartido = 0;

            for (int i = 0; i < n; i++) {
                int ancho = sc.nextInt();
                int alto = sc.nextInt();
                sumaAnchos += ancho;
                sumaAltos += alto;
                altos[i] = alto;
            }

            for (int i = 0; i < n - 1; i++) {
                compartido += Math.min(altos[i], altos[i + 1]);
            }

            System.out.println(2 * (sumaAnchos + sumaAltos) - 2 * compartido);
        }
        sc.close();
    }
}
```

Primero acumulamos anchos y altos y guardamos los altos en un array. Después, por cada pareja de vecinos restamos el doble de su altura compartida (`Math.min`): esa pared queda dentro de la figura y no cuenta en el perímetro. Verifícalo con `2 2 2 1`: `2 * (4 + 3) - 2 * 1 = 14 - 2 = 12`.

</details>

---

### 6. 171 — Abadías de piedra

En los Picos de Europa hay montañas en fila, y una **abadía** (construida en la cima de una montaña) solo puede ver el mar si **no hay ninguna montaña a su derecha que sea más alta o igual**. Dado el número de montañas y sus alturas, cuenta cuántas abadías ven el mar.

**Entrada:** varios casos de prueba. Cada caso: una línea con N (número de montañas) seguida de otra línea con las N alturas. La entrada termina con `0`.

**Ejemplo:**

```
3
3 1 2
0
```

**Salida:**

```
2
```

(La de altura 3 ve el mar: a su derecha hay 1 y 2, ambas más bajas. La de altura 1 no: la tapa la de 2. La última, de altura 2, siempre ve el mar.)

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=171)
- Dificultad: Fácil

**Pista:** recorre las montañas **de derecha a izquierda** llevando la altura máxima vista hasta ahora. Una montaña ve el mar si su altura es **mayor** que ese máximo; entonces la cuentas y actualizas el máximo. La última montaña siempre ve el mar.

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class AbadiasPiedra {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            int n = sc.nextInt();
            if (n == 0) break;

            int[] alturas = new int[n];
            for (int i = 0; i < n; i++) {
                alturas[i] = sc.nextInt();
            }

            int maxVisto = 0;
            int abadias = 0;

            for (int i = n - 1; i >= 0; i--) {
                if (alturas[i] > maxVisto) {
                    abadias++;
                    maxVisto = alturas[i];
                }
            }

            System.out.println(abadias);
        }
        sc.close();
    }
}
```

La clave es ir **de derecha a izquierda**: la montaña más a la derecha no tiene nada delante y siempre cuenta. Luego, cada montaña ve el mar solo si supera a todo lo que ya hemos visto por su derecha (`maxVisto`). Para `3 1 2`: la 2 cuenta (máx. 2), la 1 no, la 3 sí (3 > 2) → `2`. Arrays + el patrón del máximo, en una sola pasada.

</details>

---

> 🧭 **¿Y si te quedas con ganas?** Cuando domines la encapsulación podrás volver a los problemas de las unidades anteriores (como San Fermines o la suma centinela) y reescribir sus soluciones con clases bien blindadas y métodos `static` utilitarios. El material no se pierde: se reutiliza.