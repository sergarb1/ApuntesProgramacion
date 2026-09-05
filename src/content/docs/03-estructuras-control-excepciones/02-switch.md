---
title: "02 — switch: el menú del restaurante"
description: Elegir entre muchas opciones sin llenar el código de semáforos 🍽️
---

<p><small>Elegir entre muchas opciones sin llenar el código de semáforos 🍽️</small></p>

> 🗺️ **Estás en:** 🔀 **U03 · Estructuras de Control y Excepciones** → 02 · switch

---

## 📬 La idea en una frase

> **`switch` es la carta de un restaurante: miras el valor de una variable y ejecutas el `case` que coincida, sin encadenar veinte `if`.**

Cuando tienes que elegir entre muchas opciones con un solo valor (día de la semana, talla, menú), una cadena de `else if` funciona pero es fea. `switch` existe para eso.

---

## 🍽️ La carta del restaurante

```java
int dia = 3;

switch (dia) {
    case 1:
        System.out.println("Lunes");
        break;
    case 2:
        System.out.println("Martes");
        break;
    case 3:
        System.out.println("Miércoles");
        break;
    default:
        System.out.println("Día desconocido");
        break;
}
```

> ⚠️ **Advertencia:** el **`break` es obligatorio** (a menos que quieras "fall-through", que veremos abajo). Sin él, Java entra en el `case` correcto y sigue ejecutando todos los siguientes hasta encontrar un `break`. Es el clásico bug del novato.

---

## 🧱 Las piezas del puzzle

- **`switch (variable)`**: la variable que se examina. Admite tipos enteros, `char` y `enum`; a partir de Java 7 también `String`.
- **`case valor:`**: cada opción posible. Si la variable coincide, se ejecuta ese bloque.
- **`break;`**: "hasta aquí he llegado, salgo del switch". Sin él, todo se desborda hacia abajo.
- **`default:`**: el comodín, el "ninguno de los anteriores". Es opcional, como el `else`.

```java
String talla = "M";

switch (talla) {
    case "S":
        System.out.println("Pequeña");
        break;
    case "M":
        System.out.println("Mediana");
        break;
    case "L":
        System.out.println("Grande");
        break;
    default:
        System.out.println("Talla no válida");
        break;
}
```

> 💡 **Detalle práctico:** usa `switch` cuando compares **una variable con muchos valores concretos**. Usa `if`/`else if` cuando las condiciones sean rangos ("mayor que 5", "entre 10 y 20") o mezclen variables.

---

## 🌀 El fall-through: ¿error o superpoder?

El famoso "caerse a través" ocurre cuando olvidas el `break`. En la mayoría de los casos es un bug:

```java
// ⚠️ Fall-through ACCIDENTAL: imprime los tres platos
int plato = 1;

switch (plato) {
    case 1:
        System.out.println("Ensalada");
        // sin break: se cae al siguiente
    case 2:
        System.out.println("Sopa");
        break;
}
```

Pero a veces se usa a propósito, para agrupar casos:

```java
// ✅ Fall-through INTENCIONAL: varios casos comparten bloque
char letra = 'a';

switch (letra) {
    case 'a':
    case 'e':
    case 'i':
    case 'o':
    case 'u':
        System.out.println("Vocal");
        break;
    default:
        System.out.println("Consonante");
        break;
}
```

Aquí, si `letra` es cualquier vocal, ejecuta el bloque compartido. Elegante y compacto.

---

## 🆚 switch vs else if: el duelo

| Situación | Mejor opción |
|---|---|
| Un valor y muchas opciones concretas (`1..7`, `"S"/"M"/"L"`) | `switch` |
| Rangos o comparaciones (`>= 18`, `entre 10 y 20`) | `if`/`else if` |
| Combinar varias variables | `if`/`else if` |
| Comprobar `null` | `if` |

> 💡 **Nota de futuro:** en Java 14+ existe el `switch` con flechas (`->`) que no necesita `break` y devuelve valores. Lo verás como curiosidad avanzada; aquí aprendemos el clásico, que es el de todos los exámenes.

---

## 🏫 Ejemplo guiado: el menú del día

Montemos una carta que diga el plato según el día, con un `default` que cace a los despistados:

```java
public class MenuDia {
    public static void main(String[] args) {
        String dia = "miercoles";

        switch (dia) {
            case "lunes":
                System.out.println("Lentejas");
                break;
            case "martes":
                System.out.println("Paella");
                break;
            case "miercoles":
                System.out.println("Macarrones");
                break;
            case "jueves":
                System.out.println("Fabada");
                break;
            case "viernes":
                System.out.println("Pescado");
                break;
            default:
                System.out.println("Fin de semana: no hay menú");
                break;
        }
    }
}
```

Salida:

```
Macarrones
```

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuando veas un `switch`, cuenta los `break`: **debe haber uno por cada `case` no compartido**. Si falta alguno, tu programa se convierte en un tobogán.

**Ejercicio: el switch olvidadizo**

Sin ejecutar, calcula qué imprime este programa:

```java
public class Tobogan {
    public static void main(String[] args) {
        int numero = 2;

        switch (numero) {
            case 1:
                System.out.println("Uno");
            case 2:
                System.out.println("Dos");
            case 3:
                System.out.println("Tres");
                break;
            default:
                System.out.println("Otro");
                break;
        }
    }
}
```

<details>
<summary>🔄 Solución</summary>

Imprime:

```
Dos
Tres
```

El `case 2` no tiene `break`, así que tras imprimir "Dos" se cae al `case 3` ("Tres") y ahí sí encuentra el `break` y se detiene. Fíjate: el `case 1` no imprime nada porque `numero` no vale 1. Un solo `break` olvidado convierte el switch en un tobogán.

</details>

---

## 🎯 Mini-chequeo

1. ¿Qué pasa si un `case` no tiene `break`?
2. ¿Qué hace el `default`?
3. ¿Cuándo prefieres `switch` a una cadena de `else if`?
4. ¿Cómo agrupas varios valores en el mismo bloque de `switch`?

<details>
<summary>🔄 Respuestas</summary>

1. Se produce el **fall-through**: el código sigue ejecutando los `case` siguientes hasta encontrar un `break`.
2. Es el comodín: se ejecuta si **ningún** `case` coincide. Es opcional.
3. Cuando comparas **un valor con muchas opciones concretas** (números, `char`, `String`).
4. Escribiendo los `case` seguidos sin `break` entre ellos y un solo bloque al final.

</details>

---

## ✅ Resumen en 3 frases

1. `switch` elige entre **muchas opciones concretas** de una variable, con `case`, `break` y `default`.
2. Sin `break` se produce el **fall-through** (el código se desborda), que puede ser un bug o un truco para agrupar casos.
3. Usa `switch` para valores exactos y `if`/`else if` para **rangos** y condiciones combinadas.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `switch` | Estructura que elige entre varios `case` según un valor |
> | `case` | Cada opción concreta a comparar |
> | `break` | Orden de salida: corta el switch |
> | `default` | El "ninguno de los anteriores", opcional |
> | Fall-through | Que el código se desborde de un `case` al siguiente |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/03-estructuras-control-excepciones) · **Anterior:** [01 · if, else if y else](/ApuntesProgramacion/03-estructuras-control-excepciones/01-if-else) · **Siguiente:** [03 · Bucles: while y do-while](/ApuntesProgramacion/03-estructuras-control-excepciones/03-bucles-while-do-while)
