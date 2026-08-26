---
title: 05 — Casting y conversiones
description: Aprieta que cabe, con pérdidas y lágrimas si no eliges bien 🔄
---

<p><small>Aprieta que cabe, con pérdidas y lágrimas si no eliges bien 🔄</small></p>

> 🗺️ **Estás en:** 🔤 **U02 · Variables, Tipos y Operadores** → 05 · Casting y conversiones

---

## 📬 La idea en una frase

> **El casting convierte un valor de un tipo a otro: la conversión implícita (widening) la hace Java solo y sin pérdidas, mientras que la explícita (narrowing) la fuerzas tú con `(tipo)` y puedes perder datos por el camino.**

En el almacén de la memoria tienes cajas de todos los tamaños. A veces necesitas meter el contenido de una caja grande en una pequeña... y eso, o lo haces con cuidado, o pierdes cosas por el camino. Bienvenido al arte de apretar.

---

## 🪜 Conversión implícita (widening): mudarse a una caja más grande

Cuando el destino es una caja **más grande**, Java lo hace solo, sin preguntar. Es como cambiar de un piso a una mansión: te mudas y no pierdes nada. Esto se llama *widening* (ensanchar):

```java
int num = 100;
long numLong = num;        // Cabe de sobra, sin pérdidas
double numDouble = num;    // 100 → 100.0, también sin problemas
```

La cadena natural de ensanchamiento entre tipos numéricos es:

```
byte → short → int → long → float → double
```

Cualquier tipo puede pasar al que está a su derecha sin que se pierda ni un bit. Java sonríe y te deja.

---

## 📉 Conversión explícita (narrowing): la maleta XXL en un Smart

Cuando el destino es una caja **más pequeña**, Java se niega. Tienes que empujar a la fuerza con un casting explícito: pones el `(tipo)` delante y rezas:

```java
double precio = 19.99;
int entero = (int) precio;    // Aprietas 19.99 en un int
System.out.println(entero);   // 19 — los céntimos desaparecen en el olvido
```

Esto se llama *narrowing* (estrechar). Java te obliga a escribir el `(tipo)` porque es peligroso: estás diciendo "confía en mí, sé lo que hago". Y si te equivocas, los datos se pierden en silencio.

> 💡 **Detalle práctico:** el casting sobre un `double` **trunca**, no redondea. `(int) 19.99` da `19` y `(int) 19.5` también da `19`. Si quieres redondear, usa `Math.round()` (lo verás en el punto 7).

---

## 🪓 El truncamiento: el céntimo olvidado

El ejemplo del precio es la advertencia clásica:

```java
double precio = 9.99;
int precioEntero = (int) precio;
System.out.println(precioEntero);   // 9 — te acaban de quitar 0.99€
```

No es redondeo: es **cortar con hacha**. Java tira la parte decimal sin mirar si era 0.1 o 0.9.

> ⚠️ **Advertencia:** antes de estrechar una caja, pregúntate siempre: *¿cabe el valor?* Si el número es mayor que el máximo de la caja destino, no solo perderás decimales: el valor se **desbordará** a algo completamente absurdo.

---

## 💥 El desbordamiento: cuando aprietas de más

¿Qué pasa si intentas meter un elefante (300) en una caja de cerillas (byte, máximo 127)?

```java
int grande = 300;
byte pequeno = (byte) grande;
System.out.println(pequeno);   // 44 — ¿¡cuarenta y cuatro!?
```

¿De dónde sale el 44? En binario, 300 es `100101100`. Un `byte` solo guarda 8 bits, así que se truncan los sobrantes y se queda con `00101100`, que es... 44. Es como meter un elefante en un Mini Cooper y que salga un perro salchicha: el resultado técnicamente es un animal, pero no el que metiste.

> ⚠️ **Advertencia:** el desbordamiento no da error. Java no te avisa. El programa sigue corriendo con un valor absurdo. Por eso el casting explícito es responsabilidad tuya: comprueba siempre que el valor cabe.

---

## 🏫 Ejemplo guiado: el guardia del almacén

Este mini-programa recorre toda la cadena de conversiones, para que veas cuándo Java te acompaña y cuándo te obliga a firmar:

```java
public class CadenaDeCajas {
    public static void main(String[] args) {
        int a = 10;
        double b = a;            // implícita: int → double, sin lágrimas
        int c = (int) b;         // explícita: double → int, forzada
        byte d = (byte) c;       // explícita: int → byte, cabe de sobra

        System.out.println(b);   // 10.0
        System.out.println(c);   // 10
        System.out.println(d);   // 10
    }
}
```

Y ahora la parte mala:

```java
public class Perdidas {
    public static void main(String[] args) {
        double nota = 9.9;
        int notaEntera = (int) nota;    // 9 — adiós, décimas
        int enorme = 400;
        byte pequeno = (byte) enorme;   // desbordamiento silencioso
        System.out.println(notaEntera); // 9
        System.out.println(pequeno);    // -112 (¡ni siquiera es 400!)
    }
}
```

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** el casting con `(tipo)` puede truncar y desbordar. Siempre comprueba si el valor cabe antes de forzarlo.

**Ejercicio: sigue al guardia**

Sin ejecutar, determina qué imprime este programa:

```java
int a = 10;
double b = a;
int c = (int) b;
byte d = (byte) c;
System.out.println(d);

int grande = 300;
byte pequeno = (byte) grande;
System.out.println(pequeno);
```

<details>
<summary>🔄 Solución</summary>

Imprime `10` y `44`.

- El primer bloque es una cadena de conversiones sin pérdida: `10` → `10.0` → `10` → `10`. Imprime **10**.
- El segundo es el desbordamiento clásico: 300 no cabe en un `byte` (tope 127), se truncan los bits sobrantes y queda **44**. Como meter un elefante en un Mini y que salga un perro salchicha.

</details>

---

## 🎯 Mini-chequeo

1. ¿Por qué `long x = 100000;` compila sin casting y `int y = (int) 100000.5;` sí necesita el `(int)`?
2. ¿Cuánto vale `(int) 7.99`? ¿Y `(int) 7.1`?
3. ¿Qué pasa si conviertes `300` a `byte`?
4. ¿El truncamiento es lo mismo que redondear?

<details>
<summary>🔄 Respuestas</summary>

1. Porque `100000` (un `int`) cabe en un `long` sin pérdidas: es conversión **implícita**. Meter un `double` con decimales en un `int` es **estrechar** (narrowing), y Java te obliga a escribirlo con `(int)`.
2. `(int) 7.99` → **7** y `(int) 7.1` → **7**. Trunca, no redondea: la parte decimal se tira entera.
3. Se **desborda** silenciosamente y vale **44**, sin error ni aviso.
4. **No.** El truncamiento corta la parte decimal siempre; redondear sube o baja según el valor.

</details>

---

## ✅ Resumen en 3 frases

1. La conversión **implícita** (widening) hacia cajas más grandes la hace Java solo y sin pérdidas.
2. La conversión **explícita** (narrowing) la fuerzas con `(tipo)` y puede **truncar** los decimales o **desbordar** el valor.
3. Antes de estrechar, comprueba siempre que el valor cabe: Java no te avisará de las pérdidas.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Casting | Convertir un valor de un tipo a otro |
> | Widening | Ensanchar: a caja más grande, sin pérdidas, automático |
> | Narrowing | Estrechar: a caja más pequeña, con `(tipo)` y posibles pérdidas |
> | Truncamiento | Cortar la parte decimal, sin redondear |
> | Desbordamiento | El valor no cabe y se convierte en algo absurdo en silencio |
> | `(int)` | El casting que fuerza un valor decimal a entero |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/02-variables-tipos-operadores) · **Anterior:** [04 · Relacionales, lógicos y ternario](/ApuntesProgramacion/02-variables-tipos-operadores/04-operadores-relacionales-logicos) · **Siguiente:** [06 · Scanner: leer por teclado](/ApuntesProgramacion/02-variables-tipos-operadores/06-scanner-entrada-teclado)