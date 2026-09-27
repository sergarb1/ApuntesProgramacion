---
title: Boletín U05 — Extras
description: CodeWars y AceptaElReto para ir más allá de la unidad
---

# 📝 Boletín U05 — Extras

> Ejercicios de CodeWars y AceptaElReto con pistas. La solución está oculta: resístete hasta agotar tu pista.

---

## CodeWars

### 1. L1: Set Alarm

Un booleano `employed` te dice si trabajas y otro, `vacation`, si estás de vacaciones. Devuelve `true` **solo** si trabajas y no estás de vacaciones.

**Ejemplos:** `setAlarm(true, false)` → `true`, `setAlarm(false, false)` → `false`, `setAlarm(true, true)` → `false`, `setAlarm(false, true)` → `false`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/568dcc3c7f12767a62000038)
- Dificultad: 8 kyu

**Pista:** una sola condición con `&&` y un `!` delante de las vacaciones.

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static boolean setAlarm(boolean employed, boolean vacation) {
        return employed && !vacation;
    }
}
```

`employed && !vacation` es la traducción literal de «trabajas y no estás de vacaciones». Un `return` de una línea, sin `if`: cuando la condición ya es un `boolean`, el ternario o el `if` sobran.

</details>

---

### 2. Beginner Series #2 Clock

El reloj marca `h` horas, `m` minutos y `s` segundos desde la medianoche. Escribe el método `Past`, que devuelve ese tiempo en **milisegundos**.

**Ejemplos:** `Past(0, 1, 1)` → `61000`, `Past(1, 0, 1)` → `3601000`, `Past(0, 0, 0)` → `0`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/55f9bca8ecaa9eac7100004a)
- Dificultad: 8 kyu

**Pista:** 1 hora = 3.600.000 ms, 1 minuto = 60.000 ms y 1 segundo = 1.000 ms. Suma las tres partes y multiplica al final.

<details>
<summary>🔄 Solución</summary>

```java
public class Clock {
    public static int Past(int h, int m, int s) {
        return (h * 60 * 60 + m * 60 + s) * 1000;
    }
}
```

`h * 60 * 60 + m * 60 + s` deja todo en segundos dentro de un paréntesis y un solo `* 1000` lo convierte a milisegundos. El mayor valor posible (23:59:59 = 86.399 segundos → 86.399.000 ms) cabe sobrado en un `int`, que llega hasta 2.147.483.647.

</details>

---

### 3. Volume of a Cuboid

El método `getVolumeOfCuboid` recibe largo, ancho y alto de una caja y devuelve su volumen.

**Ejemplos:** `(1, 2, 3)` → `6`, `(6, 2, 1)` → `12`, `(5, 3, 2)` → `30`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/58261acb22be6e2ed800003a)
- Dificultad: 8 kyu

**Pista:** el volumen de un paralelepípedo es ancho × alto × largo. Un `return`, tres multiplicaciones, ni un `if`.

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static int getVolumeOfCuboid(int length, int width, int height) {
        return length * width * height;
    }
}
```

El método más corto de todo el boletín: recibe tres entradas, devuelve una salida. Fíjate en el patrón de la firma `public static` que ya es rutina: sin `static`, CodeWars (igual que tu `main`) no podría llamarlo.

</details>

---

### 4. Drink about

Dada una edad, devuelve qué bebida corresponde: menos de 14 → `"drink toddy"`, menos de 18 → `"drink coke"`, menos de 21 → `"drink beer"` y a partir de 21 → `"drink whisky"`.

**Ejemplos:** `10` → `"drink toddy"`, `15` → `"drink coke"`, `20` → `"drink beer"`, `30` → `"drink whisky"`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/56170e844da7c6f647000063)
- Dificultad: 8 kyu

**Pista:** son cuatro `return` encadenados con `if`, de la edad más pequeña a la mayor, como la cascada de notas de la U04.

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static String peopleWithAgeDrink(int old) {
        if (old < 14) {
            return "drink toddy";
        }
        if (old < 18) {
            return "drink coke";
        }
        if (old < 21) {
            return "drink beer";
        }
        return "drink whisky";
    }
}
```

La misma cascada de rangos de siempre, pero devolviendo en lugar de imprimir. El orden importa: si comprobaras `old < 21` primero, un niño de 10 años bebería cerveza.

</details>

---

## AceptaElReto

### 5. 116 — ¡Hola mundo!

En la primera clase de cualquier curso de programación se debería salir habiendo escrito un «hola mundo». Pues eso: dado un número `n` (`0 ≤ n ≤ 5`), escribe `n` líneas con la cadena `Hola mundo.`.

**Ejemplo:**

```
3
```

**Salida:**

```
Hola mundo.
Hola mundo.
Hola mundo.
```

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=116)
- Dificultad: Fácil

**Pista:** un método `public static void imprimirHolaMundo(int n)` con un `for` de `0` a `n - 1`, y un `main` que solo lee y llama.

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class HolaMundo {
    public static void imprimirHolaMundo(int n) {
        for (int i = 0; i < n; i++) {
            System.out.println("Hola mundo.");
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        imprimirHolaMundo(n);
        sc.close();
    }
}
```

`imprimirHolaMundo(0)` no imprime nada (el `for` no arranca) y `imprimirHolaMundo(5)` repite la línea cinco veces. El método encapsula la repetición: el juez pide un número, tu método sabe repetir. Programar en equipo, con uno por área.

</details>

---

### 6. 115 — Número de Kaprekar

Un número es de *Kaprekar* si su cuadrado puede partirse en dos números que sumados devuelvan el original, y el segundo de la partida no puede ser cero. Por ejemplo: `9² = 81` → `8 + 1 = 9` (¡es Kaprekar!) y `703² = 494209` → `494 + 209 = 703`. En cambio, `100` no lo es: `10000` podría partirse en `100 + 00`, pero `00` vale cero.

**Entrada:** varios números (≥ 1 y < 65536) hasta un `0` que marca el final.

**Ejemplo:**

```
22222
75
99
100
0
```

**Salida:**

```
SI
NO
SI
NO
```

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=115)
- Dificultad: Medio

**Pista:** envuelve todo en `public static boolean esKaprekar(int n)`. El cuadrado puede pasarse de `int` (usa `long`), y debes probar **todos** los cortes posibles: `p = 10, 100, 1000, ...` hasta superar el cuadrado, con `izq = cuadrado / p` y `der = cuadrado % p`. Si `der != 0` y `izq + der == n`, has ganado.

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class Kaprekar {
    public static boolean esKaprekar(int n) {
        long cuadrado = (long) n * n;
        for (long p = 10; p <= cuadrado * 10; p *= 10) {
            long izquierda = cuadrado / p;
            long derecha = cuadrado % p;
            if (derecha != 0 && izquierda + derecha == n) {
                return true;
            }
        }
        return false;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        while (n != 0) {
            System.out.println(esKaprekar(n) ? "SI" : "NO");
            n = sc.nextInt();
        }
        sc.close();
    }
}
```

Comprobemos con `9`: `cuadrado = 81`, con `p = 10` → `izq = 8`, `der = 1`, y `8 + 1 = 9` → `SI`. Con `100`: ningún corte da `100` sin que `der` sea `0` → `NO`. El corte extra `p <= cuadrado * 10` es el que permite que la izquierda quede vacía, justo lo que necesita el `1` (`1² = 1` → `0 + 1 = 1` → `SI`). Un `for` de cortes y un `long` a salvo de desbordes: puro músculo de esta unidad.

</details>

---

> 🧭 **¿Y si te quedas con ganas?** Con los métodos en la mano puedes reescribir tus programas de la U04 troceando cada bloque en una función con nombre. Y si te apetece un reto de futuro, la U08 te enseñará a hacer que un método se llame a sí mismo (recursión): el juego de la caja rusa del código.
