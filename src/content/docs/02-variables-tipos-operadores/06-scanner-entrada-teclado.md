---
title: "06 · Scanner: leer por teclado"
description: El momento en que tu programa deja de gritar y empieza a escuchar ⌨️
---

<p><small>El momento en que tu programa deja de gritar y empieza a escuchar ⌨️</small></p>

> 🗺️ **Estás en:** 🔤 **U02 · Variables, Tipos y Operadores** → 06 · Scanner: leer por teclado

---

## 📬 La idea en una frase

> **`Scanner` es la clase de Java que lee lo que escribes por teclado: instancias un objeto con `new Scanner(System.in)` y le pides datos con `nextInt()`, `nextDouble()` o `nextLine()`.**

Hasta ahora, tus programas eran unos gritones: solo escupían texto a la consola. A partir de este punto van a tener oídos. Y con oídos llegan los programas de verdad: un conversor de temperaturas que te pregunta los grados, una calculadora que recibe números...

---

## 📖 El paquete: importar la librería

`Scanner` no vive en el centro de Java: vive en una librería (`java.util`). Para usarlo, la primera línea de tu archivo debe ser:

```java
import java.util.Scanner;
```

Es como pedir en la biblioteca el libro que vas a usar. Sin el `import`, Java te dirá que no conoce a `Scanner`.

---

## 🏗️ Instanciar: el constructor

Para tener un lector de teclado necesitas **crear un objeto** de la clase `Scanner`. Esto se hace con `new` y un **constructor** (recuerda el `new String(...)` del punto 2):

```java
Scanner sc = new Scanner(System.in);
```

- `Scanner` es la clase (el molde).
- `new Scanner(...)` crea el objeto (el constructor).
- `System.in` es el argumento que le pasas: "lee del teclado estándar".

> 💡 **Detalle práctico:** el nombre de la variable suele ser `sc` o `teclado`, por pura costumbre. Cuando acabes de usar el `Scanner`, es buena práctica cerrarlo con `sc.close()`, sobre todo si el programa va a seguir haciendo cosas raras.

---

## 🔢 Pedir datos: los métodos next

Una vez tienes el objeto `sc`, le pides datos con sus métodos. Cada método espera a que escribas y pulses Enter:

```java
import java.util.Scanner;

public class PrimerEscucha {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("¿Cómo te llamas? ");
        String nombre = sc.nextLine();     // lee una línea de texto completa

        System.out.print("¿Cuántos años tienes? ");
        int edad = sc.nextInt();           // lee un número entero

        System.out.print("¿Cuál es tu nota media? ");
        double nota = sc.nextDouble();     // lee un número con decimales

        System.out.println("Hola, " + nombre + ". Con " + edad + " años y un " + nota + " de media, vas sobrado.");

        sc.close();
    }
}
```

Salida de ejemplo:

```
¿Cómo te llamas? Ana
¿Cuántos años tienes? 18
¿Cuál es tu nota media? 9.5
Hola, Ana. Con 18 años y un 9.5 de media, vas sobrado.
```

Los métodos más usados:

| Método | Lee | Ejemplo |
|---|---|---|
| `nextLine()` | Una línea de texto completa | `String nombre = sc.nextLine();` |
| `next()` | Solo la siguiente palabra | `String palabra = sc.next();` |
| `nextInt()` | Un número entero | `int edad = sc.nextInt();` |
| `nextDouble()` | Un número con decimales | `double nota = sc.nextDouble();` |
| `nextBoolean()` | `true` o `false` | `boolean ok = sc.nextBoolean();` |

---

## ⚠️ El lío de `nextLine()` tras `nextInt()`

Este es el error más odiado del `Scanner`, y aparece en todos los exámenes. Cuando haces `nextInt()`, el Enter que pulsaste se queda *guardado* en el buffer. Si después llamas a `nextLine()`, esa llamada se traga el Enter residual y te devuelve una línea vacía:

```java
Scanner sc = new Scanner(System.in);
System.out.print("Edad: ");
int edad = sc.nextInt();          // escribes 18 y pulsas Enter
System.out.print("Nombre: ");
String nombre = sc.nextLine();    // ¡se salta la pregunta! devuelve ""
```

**La solución:** añade un `nextLine()` extra (o usa `next()` para el texto) justo después del número:

```java
int edad = sc.nextInt();
sc.nextLine();                    // se traga el Enter sobrante
String nombre = sc.nextLine();    // ahora sí, lee el nombre
```

> ⚠️ **Advertencia:** memoriza el truco: *después de un `nextInt()` / `nextDouble()`, inserta un `nextLine()` vacío antes del siguiente `nextLine()`.* Es el guardián del buffer.

---

## 🏫 Ejemplo guiado: la calculadora de la propina

Vamos a usar el teclado para algo útil: calcular cuánto dejar de propina.

```java
import java.util.Scanner;

public class Propina {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("¿Cuánto vale la cuenta? ");
        double cuenta = sc.nextDouble();

        System.out.print("¿Qué porcentaje de propina? ");
        int porcentaje = sc.nextInt();

        double propina = cuenta * porcentaje / 100;
        double total = cuenta + propina;

        System.out.println("Propina: " + propina + "€");
        System.out.println("Total a pagar: " + total + "€");

        sc.close();
    }
}
```

Salida de ejemplo:

```
¿Cuánto vale la cuenta? 45.5
¿Qué porcentaje de propina? 15
Propina: 6.825€
Total a pagar: 52.325€
```

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuando combines `nextInt()` y `nextLine()`, recuerda siempre el Enter residual. Escríbelo como un reflejo: número → `nextLine()` vacío → texto.

**Ejercicio: el presentador con trampa**

Este programa intenta saludar al usuario... pero algo falla. Sin ejecutar, di qué ocurre y cómo lo arreglarías:

```java
Scanner sc = new Scanner(System.in);
System.out.print("Edad: ");
int edad = sc.nextInt();
System.out.print("Nombre: ");
String nombre = sc.nextLine();
System.out.println(nombre + " tiene " + edad + " años.");
```

<details>
<summary>🔄 Solución</summary>

El problema es el **Enter residual**: tras `nextInt()`, el `nextLine()` se traga el Enter y `nombre` queda como texto vacío. El programa imprimiría algo como ` tiene 18 años.`

La solución es añadir un `nextLine()` vacío entre el número y el texto:

```java
int edad = sc.nextInt();
sc.nextLine();                    // se traga el Enter sobrante
String nombre = sc.nextLine();    // ahora sí lee el nombre
```

</details>

---

## 🎯 Mini-chequeo

1. ¿Qué hace la línea `import java.util.Scanner;`?
2. ¿Qué hace `new Scanner(System.in)`?
3. ¿Cuál es la diferencia entre `next()` y `nextLine()`?
4. ¿Por qué tras un `nextInt()` hay que poner un `nextLine()` vacío?

<details>
<summary>🔄 Respuestas</summary>

1. Importa la clase `Scanner` desde la librería `java.util`, para poder usarla.
2. **Crea un objeto** de tipo `Scanner` que lee del teclado (`System.in`). Es el constructor de la clase.
3. `next()` lee **una sola palabra** (hasta un espacio); `nextLine()` lee **toda la línea** hasta el Enter.
4. Porque el Enter que pulsaste en `nextInt()` queda en el buffer y el siguiente `nextLine()` se lo traga, devolviendo texto vacío.

</details>

---

## ✅ Resumen en 3 frases

1. `Scanner` es la clase para leer del teclado: la importas con `import`, la instancias con `new Scanner(System.in)` y pides datos con métodos `next...`.
2. Cada tipo de dato tiene su método: `nextInt()`, `nextDouble()`, `nextLine()` para texto.
3. Tras un `nextInt()` o `nextDouble()`, un `nextLine()` vacío se traga el Enter residual: sin él, tu siguiente pregunta se saltará.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `Scanner` | Clase de `java.util` para leer datos de teclado |
> | `import` | Línea que trae una clase desde su librería |
> | Constructor | Mecanismo que crea el objeto (`new Scanner(...)`) |
> | `System.in` | El teclado estándar, la fuente de entrada |
> | Buffer | Zona de memoria donde queda el Enter residual |
> | Instanciar | Crear un objeto a partir de una clase |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/02-variables-tipos-operadores) · **Anterior:** [05 · Casting y conversiones](/ApuntesProgramacion/02-variables-tipos-operadores/05-casting-conversiones) · **Siguiente:** [07 · Math.random() y números aleatorios](/ApuntesProgramacion/02-variables-tipos-operadores/07-math-random-aleatorios)