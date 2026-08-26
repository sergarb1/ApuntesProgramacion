---
title: 04 — Bucle for y bucles anidados
description: El contador obsesivo que repite un número exacto de vueltas 🔢
---

<p><small>El contador obsesivo que repite un número exacto de vueltas 🔢</small></p>

> 🗺️ **Estás en:** 🔀 **U03 · Estructuras de Control y Excepciones** → 04 · Bucle for y bucles anidados

---

## 📬 La idea en una frase

> **`for` es un bucle con contador de serie: declara la variable, pone la condición y la actualiza en la misma línea, ideal para "repite N veces".**

El `while` repetía "mientras pase algo". El `for` repite "un número exacto de veces". Es el bucle favorito para recorrer cosas y el que más usarás en toda tu carrera.

---

## 🔢 La anatomía del for

```java
for (inicializacion; condicion; actualizacion) {
    // bloque
}
```

```java
for (int i = 1; i <= 5; i++) {
    System.out.println("Vuelta " + i);
}
```

Salida:

```
Vuelta 1
Vuelta 2
Vuelta 3
Vuelta 4
Vuelta 5
```

El ciclo de vida de `i`:

1. **Inicialización**: `int i = 1` — se ejecuta una sola vez, al entrar.
2. **Condición**: `i <= 5` — se comprueba antes de cada vuelta.
3. **Bloque**: se ejecuta si la condición es `true`.
4. **Actualización**: `i++` — se ejecuta al final de cada vuelta.
5. Vuelta al paso 2.

> ⚠️ **Advertencia:** una comilla mal puesta en el `for` es el error de examen más común. La sintaxis es: inicialización **`;`** condición **`;`** actualización. Tres partes, dos puntos y coma, cero comas entre ellas.

---

## 🔁 Los tres bucles son el mismo chiste

Esto es `while`, `do-while` y `for` haciendo exactamente lo mismo:

```java
int i = 1;                        // inicialización
while (i <= 5) {                   // condición
    System.out.println("Vuelta " + i);
    i++;                           // actualización
}
```

```java
int i = 1;
do {
    System.out.println("Vuelta " + i);
    i++;
} while (i <= 5);
```

```java
for (int i = 1; i <= 5; i++) {
    System.out.println("Vuelta " + i);
}
```

Los tres imprimen lo mismo. El `for` gana porque junta las tres partes del control en una línea: es más difícil olvidar el `i++` (adiós, bucles infinitos por descuido).

> 💡 **Detalle práctico:** si sabes cuántas veces vas a repetir → `for`. Si no lo sabes → `while`. Regla que te salvará la vida en el examen.

---

## 🧩 Bucles anidados: la parrilla de ejercicios

Un bucle dentro de otro. El bucle **exterior** se ejecuta una vez por cada vuelta del... no, al revés: por cada vuelta del exterior, el **interior** se ejecuta completo.

```java
for (int fila = 1; fila <= 3; fila++) {
    for (int columna = 1; columna <= 4; columna++) {
        System.out.print("* ");
    }
    System.out.println();
}
```

Salida:

```
* * * *
* * * *
* * * *
```

- El bucle exterior controla las **filas** (3).
- El interior controla las **columnas** (4).
- El `println()` sin texto después del interior salta de línea al acabar cada fila.

> ⚠️ **Advertencia:** cada nivel de anidamiento multiplica las vueltas. Con 1000 filas y 1000 columnas son 1.000.000 de iteraciones. Los bucles anidados son potentes, pero también la fábrica de programas lentos.

---

## 🏫 Ejemplo guiado: la tabla de multiplicar

```java
public class TablaMultiplicar {
    public static void main(String[] args) {
        for (int i = 1; i <= 10; i++) {
            System.out.println("7 x " + i + " = " + (7 * i));
        }
    }
}
```

Salida (primeras líneas):

```
7 x 1 = 7
7 x 2 = 14
7 x 3 = 21
...
```

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuando uses un `for`, pregunta: *¿la condición usa `<` o `<=`?* Un despiste de un dígito (repetir 9 veces en vez de 10) es el bug del off-by-one, el más famoso de la historia.

**Ejercicio: el triangulero**

Sin ejecutar, calcula cuántos asteriscos imprime en total este programa:

```java
public class Triangulo {
    public static void main(String[] args) {
        for (int fila = 1; fila <= 4; fila++) {
            for (int ast = 1; ast <= fila; ast++) {
                System.out.print("*");
            }
            System.out.println();
        }
    }
}
```

<details>
<summary>🔄 Solución</summary>

Imprime:

```
*
**
***
****
```

En total, **10 asteriscos** (1 + 2 + 3 + 4). Fíjate en el truco: la condición del interior es `ast <= fila`, así que cada fila imprime tantos asteriscos como número de fila. El bucle interior depende del valor del exterior: eso es el corazón de los bucles anidados.

</details>

---

## 🎯 Mini-chequeo

1. ¿Cuáles son las tres partes del `for`?
2. ¿Cuántas veces se ejecuta la inicialización?
3. ¿Qué imprime `for (int i = 0; i < 5; i++)`? ¿5 o 4 vueltas?
4. En un bucle anidado, ¿qué hace el bucle interior por cada vuelta del exterior?

<details>
<summary>🔄 Respuestas</summary>

1. **Inicialización**, **condición** y **actualización**, separadas por `;`.
2. **Una sola vez**, al entrar en el bucle.
3. **5 vueltas**: con `i` valiendo 0, 1, 2, 3 y 4 (cuando `i` llega a 5, la condición falla).
4. Se ejecuta **completo** (todas sus vueltas) por cada vuelta del exterior.

</details>

---

## ✅ Resumen en 3 frases

1. `for` junta **inicialización, condición y actualización** en una línea: ideal para repetir un número conocido de veces.
2. `while`, `do-while` y `for` son intercambiables; elige `for` cuando sepas las vueltas.
3. En los **bucles anidados**, por cada vuelta del exterior el interior se ejecuta completo, y eso multiplica el trabajo.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `for` | Bucle con contador: `for (inicio; condicion; avance)` |
> | Contador | Variable que cuenta las vueltas (normalmente `i`) |
> | Bucle anidado | Un bucle dentro de otro |
> | Off-by-one | Fallar por uno en la condición (`<` vs `<=`) |
> | Iteración | Una vuelta del bucle |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/03-estructuras-control-excepciones) · **Anterior:** [03 · Bucles: while y do-while](/ApuntesProgramacion/03-estructuras-control-excepciones/03-bucles-while-do-while) · **Siguiente:** [05 · break y continue](/ApuntesProgramacion/03-estructuras-control-excepciones/05-break-continue)
