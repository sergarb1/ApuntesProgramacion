---
title: 07 — Math.random() y números aleatorios
description: El casino de Java, con dados y fórmulas para no hacer trampa 🎲
---

<p><small>El casino de Java, con dados y fórmulas para no hacer trampa 🎲</small></p>

> 🗺️ **Estás en:** 🔤 **U02 · Variables, Tipos y Operadores** → 07 · Math.random() y números aleatorios

---

## 📬 La idea en una frase

> **`Math.random()` devuelve un número aleatorio entre `0,0` (incluido) y `1,0` (excluido), y con la fórmula `(int)(Math.random() * (max - min + 1)) + min` lo conviertes en un dado, una lotería o cualquier número que necesites.**

Tus programas ya escuchan (Scanner) y calculan (operadores). Ahora van a jugar: a los dados, a la lotería, a adivinar números. Y para eso necesitas el casino de Java: `Math.random()`.

---

## 🎲 El casino: qué devuelve Math.random()

`Math.random()` es un **método estático** de la clase `Math`. Devuelve un número entre `0,0` y `1,0`... con un detalle importante: **el `1.0` no está incluido**. Es como cuando te toca la lotería pero no.

```java
double aleatorio = Math.random();          // Entre 0.0 y 0.999999...
System.out.println(aleatorio);             // Por ejemplo: 0.473821...
```

> 💡 **Detalle práctico:** `Math.random()` es un método **estático**: no necesitas crear un objeto de `Math` para llamarlo. Escribes `Math.random()` directamente y listo. Es una llamada de clase, no de objeto.

---

## 🎯 La fórmula: de 0.0-1.0 a lo que tú quieras

Un número entre 0 y 1 está muy bien, pero tú quieres un dado, un número de la lotería, un porcentaje... Aquí va la escalera:

```java
double aleatorio = Math.random();                    // Entre 0.0 y 0.999999...
int deCeroANueve = (int) (Math.random() * 10);      // Entre 0 y 9
int dado = (int) (Math.random() * 6) + 1;            // Entre 1 y 6 (como un dado)
```

¿Ves el patrón? El truco está en multiplicar y sumar:

- `Math.random() * 6` → número entre `0,0` y `5,999...`
- `(int)` lo trunca → entre `0` y `5`
- `+ 1` lo desplaza → entre `1` y `6` ✅

**La fórmula universal** para un número entre `min` y `max` (ambos incluidos):

```java
int numero = (int) (Math.random() * (max - min + 1)) + min;
```

Ejemplo del 5 al 10:

```java
int entreCincoYDiez = (int) (Math.random() * 6) + 5;   // 5, 6, 7, 8, 9 o 10
```

> 📝 **Nota:** memoriza la fórmula como un mantra: `(max - min + 1)` da el tamaño del abanico, y `+ min` lo coloca donde empieza. No hay más secreto.

---

## 🧰 Otras herramientas del casino: la clase Math

`Math` no es solo la ruleta: es toda la sala de máquinas. Algunas joyas que usarás a diario:

```java
double pi = Math.PI;                    // 3.141592653589793 — constante
double potencia = Math.pow(2, 10);      // 1024.0 — 2 elevado a 10
double raiz = Math.sqrt(144);           // 12.0
double absoluto = Math.abs(-7);         // 7.0
double redondeo = Math.round(4.6);      // 5.0
double techo = Math.ceil(4.1);          // 5.0
double suelo = Math.floor(4.9);         // 4.0
int maximo = Math.max(3, 9);            // 9
int minimo = Math.min(3, 9);            // 3
```

> 💡 **Detalle práctico:** todos estos son **métodos estáticos** de la clase `Math` (y `Math.PI` una constante estática): se llaman con `Math.nombre`, sin crear objetos. En el examen, la pregunta típica es "¿cómo redondeas 4.6 sin truncarlo?" → `Math.round(4.6)`.

---

## 🏫 Ejemplo guiado: el juego de los dados

Vamos a montar un dado de verdad, con dos tiradas, suma y veredicto:

```java
public class JuegoDeDados {
    public static void main(String[] args) {
        int dado1 = (int) (Math.random() * 6) + 1;
        int dado2 = (int) (Math.random() * 6) + 1;
        int suma = dado1 + dado2;

        System.out.println("Dado 1: " + dado1);
        System.out.println("Dado 2: " + dado2);
        System.out.println("Suma: " + suma);

        boolean esPar = suma % 2 == 0;
        String mensaje = esPar ? "Suma par — ganas" : "Suma impar — pierdes";
        System.out.println(mensaje);
    }
}
```

Salida posible:

```
Dado 1: 4
Dado 2: 6
Suma: 10
Suma par — ganas
```

Cada ejecución da un resultado distinto: eso es lo divertido (y a veces frustrante) de los aleatorios.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** recuerda siempre *truncar antes de sumar*: `(int)(... * 6) + 1`, nunca `(int)(... * 6 + 1)`. Si sumas antes del casting, el rango cambia y tus dados mentirán.

**Ejercicio: el dado que miente**

¿Qué rango de números produce cada una de estas tres líneas? ¿Cuál es la que da un dado de verdad (1 a 6)?

```java
int a = (int) (Math.random() * 6);
int b = (int) (Math.random() * 6) + 1;
int c = (int) (Math.random() * 7);
```

<details>
<summary>🔄 Solución</summary>

- `a`: `Math.random() * 6` va de `0.0` a `5.999...` → tras el `(int)`, **0 a 5**.
- `b`: la línea anterior más `1` → **1 a 6**. ✅ Es el dado de verdad.
- `c`: `Math.random() * 7` va de `0.0` a `6.999...` → tras el `(int)`, **0 a 6** (¡siete caras, y el 0 no existe en un dado!).

La diferencia entre `b` y `c` es sutil pero decisiva: la `+ 1` debe ir **fuera** del casting.

</details>

---

## 🎯 Mini-chequeo

1. ¿Qué rango exacto devuelve `Math.random()`?
2. Escribe la línea para obtener un número aleatorio entre 5 y 10.
3. ¿Qué devuelve `(int) (Math.random() * 100)`? ¿Y si le sumas 1?
4. ¿`Math.PI` es un método o una constante? ¿Y `Math.round`?

<details>
<summary>🔄 Respuestas</summary>

1. Entre `0.0` (incluido) y `1.0` (**excluido**): de `0.0` a `0.999...`.
2. `int numero = (int) (Math.random() * 6) + 5;` — abanico de 6 valores empezando en 5.
3. `(int) (Math.random() * 100)` da **0 a 99**; con `+ 1` da **1 a 100**.
4. `Math.PI` es una **constante** (sin paréntesis); `Math.round` es un **método** (con paréntesis).

</details>

---

## ✅ Resumen en 3 frases

1. `Math.random()` devuelve un número entre `0,0` y `1,0` (sin incluir el 1), y se combina con multiplicaciones y casting para generar el rango que quieras.
2. La fórmula `(int)(Math.random() * (max - min + 1)) + min` es tu navaja suiza para cualquier número aleatorio.
3. `Math` es la sala de máquinas estática: `PI`, `pow`, `sqrt`, `abs`, `round`... todos se llaman con `Math.nombre`, sin crear objetos.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `Math.random()` | Número aleatorio entre 0.0 y 1.0 (el 1 excluido) |
> | Método estático | Se llama con `Math.nombre(...)`, sin crear objetos |
> | `Math.pow` | Potencia: `Math.pow(base, exponente)` |
> | `Math.round` | Redondea (a diferencia del truncamiento del casting) |
> | `Math.PI` | Constante con el número π |
> | Truncar | Cortar los decimales con `(int)` |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/02-variables-tipos-operadores) · **Anterior:** [06 · Scanner: leer por teclado](/ApuntesProgramacion/02-variables-tipos-operadores/06-scanner-entrada-teclado) · **Siguiente:** [08 · Métodos útiles de String](/ApuntesProgramacion/02-variables-tipos-operadores/08-metodos-string)