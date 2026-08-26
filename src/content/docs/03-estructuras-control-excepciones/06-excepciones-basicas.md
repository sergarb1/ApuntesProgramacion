---
title: 06 — Excepciones básicas
description: "Cuando Java se queja por escrito: la familia Throwable y las quejas más típicas 💥"
---

<p><small>Cuando Java se queja por escrito: la familia Throwable y las quejas más típicas 💥</small></p>

> 🗺️ **Estás en:** 🔀 **U03 · Estructuras de Control y Excepciones** → 06 · Excepciones básicas

---

## 📬 La idea en una frase

> **Una excepción es un aviso de que algo salió mal; Java lo lanza como un objeto que hereda de `Throwable`, y tu programa puede o no estar preparado para atraparlo.**

¿Te ha pasado que un programa se "cae" con un montón de texto rojo? Ese texto es una excepción. En vez de morir en silencio, Java grita con todo el detalle. Aprender a leer esos gritos es aprender a depurar.

---

## 💥 El crash: tu primera excepción

Ejecuta esto:

```java
public class Explosion {
    public static void main(String[] args) {
        int[] numeros = {1, 2, 3};
        System.out.println(numeros[5]);   // ¡no existe!
    }
}
```

Java no se calla. Aparece algo así:

```
Exception in thread "main" java.lang.ArrayIndexOutOfBoundsException: Index 5 out of bounds for length 3
	at Explosion.main(Explosion.java:5)
```

Este texto es oro: te dice **qué** excepción (`ArrayIndexOutOfBoundsException`), **dónde** (línea 5) y en **qué método**. Leerlo bien resuelve la mitad de tus problemas.

---

## 🌳 La familia Throwable: el árbol genealógico

Todas las excepciones heredan de una clase madre:

```
Object
 └── Throwable
      ├── Error                  (cosas que no deberías intentar arreglar)
      └── Exception              (lo que de verdad nos interesa)
           ├── RuntimeException  (excepciones en tiempo de ejecución)
           └── (otras excepciones "controladas")
```

- **`Error`**: problemas graves de la JVM (memoria agotada, por ejemplo). No los provocas tú y no debes intentar atraparlos. Ignóralos.
- **`Exception`**: fallos del programa. Aquí vive el 99% de tu vida.
- **`RuntimeException`**: subfamilia de `Exception` que se lanza en **tiempo de ejecución** y que **no estás obligado** a capturar. Aquí viven las más famosas.

```java
// Todas estas son RuntimeException (no necesitas try para que compile):
int x = 10 / 0;                        // ArithmeticException
int[] a = new int[3]; a[9] = 1;        // ArrayIndexOutOfBoundsException
String s = null; s.length();           // NullPointerException
int num = Integer.parseInt("Hola");    // NumberFormatException
```

> 💡 **Detalle práctico:** "RuntimeException" significa que el error aparece cuando el programa **se ejecuta**, no al compilar. El compilador no te avisa: solo lo descubres en plena ejecución.

---

## 🗺️ Las excepciones más comunes: la guía de campo

| Excepción | Cuándo aparece | Frase típica |
|---|---|---|
| `ArithmeticException` | Dividir entre 0 | "Dividir entre cero, qué valiente" |
| `ArrayIndexOutOfBoundsException` | Índice fuera del array | "Ese hueco no existe" |
| `NullPointerException` | Llamar a algo `null` | "El clásico absoluto" |
| `NumberFormatException` | Convertir texto que no es número | "ParSEAR 'Hola' como número, no" |
| `StringIndexOutOfBoundsException` | Índice fuera de un `String` | "substring() más allá del final" |
| `InputMismatchException` | `Scanner` recibe el tipo equivocado | "Pusiste texto donde iba un número" |

> ⚠️ **Advertencia:** la `NullPointerException` (NPE) es, con diferencia, la excepción más común de la historia de Java. Tu abuela, si programara, también la tendría. El mensaje suele ser un críptico "null" seguido de la línea donde tocaste un objeto que no existía.

---

## 🏫 Ejemplo guiado: el lector de edades

Un programa que pide una edad por teclado puede explotar si el usuario escribe letras. Veamos el crash y luego lo arreglaremos en el punto 7:

```java
import java.util.Scanner;

public class LectorEdad {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("¿Cuántos años tienes? ");
        int edad = sc.nextInt();
        System.out.println("Naciste hace " + edad + " años.");
        sc.close();
    }
}
```

Si escribes `hola`, obtienes un `InputMismatchException`. El programa muere. La solución es atrapar la excepción con `try`/`catch`... que es justo el punto 7.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuando un programa explote, lee la primera línea del error: el nombre de la excepción te dice *qué* pasó, y la línea con `at ...` te dice *dónde*. Es un GPS con acusaciones.

**Ejercicio: el detective de excepciones**

Di qué excepción lanzaría cada línea (o si no lanzaría ninguna):

```java
int a = 5 / 0;
String[] dias = {"L", "M", "X"};
System.out.println(dias[3]);
String texto = null;
System.out.println(texto.toUpperCase());
int b = Integer.parseInt("42");
int c = Integer.parseInt("cuarenta y dos");
```

<details>
<summary>🔄 Solución</summary>

- `5 / 0` → **`ArithmeticException`** (división entre cero).
- `dias[3]` → **`ArrayIndexOutOfBoundsException`** (un array de 3 huecos se indexa 0, 1, 2).
- `texto.toUpperCase()` → **`NullPointerException`** (`texto` es `null`).
- `parseInt("42")` → **Sin excepción**: 42 sí es un número.
- `parseInt("cuarenta y dos")` → **`NumberFormatException`** (ese texto no es un número).

</details>

---

## 🎯 Mini-chequeo

1. ¿Qué clase está en la raíz de todas las excepciones?
2. ¿Qué diferencia hay entre `Error` y `Exception`?
3. ¿Qué significa que sea una `RuntimeException`?
4. ¿Cuál es la excepción más famosa de la historia y cuándo aparece?

<details>
<summary>🔄 Respuestas</summary>

1. **`Throwable`**.
2. `Error` son problemas graves de la JVM que no debes intentar arreglar; `Exception` son fallos del programa que sí puedes capturar.
3. Que se lanza **en tiempo de ejecución** (no al compilar) y que **no estás obligado** a capturarla.
4. La **`NullPointerException`**: aparece al tocar un objeto que vale `null`.

</details>

---

## ✅ Resumen en 3 frases

1. Una excepción es un **objeto** que Java lanza cuando algo sale mal y que hereda de `Throwable`.
2. La familia se divide en `Error` (graves, no tocar), `Exception` (capturables) y `RuntimeException` (se lanzan al ejecutar, sin obligación de capturarlas).
3. Leer el mensaje de la excepción (qué, dónde, en qué método) es la primera habilidad de un buen depurador.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Excepción | Objeto que representa un error en el programa |
> | `Throwable` | Clase raíz de errores y excepciones |
> | `Error` | Fallo grave de la JVM, no capturable |
> | `Exception` | Fallo del programa, capturable |
> | `RuntimeException` | Excepción de ejecución, sin captura obligatoria |
> | Trace | El "stack trace": la lista de llamadas hasta el fallo |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/03-estructuras-control-excepciones) · **Anterior:** [05 · break y continue](/ApuntesProgramacion/03-estructuras-control-excepciones/05-break-continue) · **Siguiente:** [07 · try, catch y finally](/ApuntesProgramacion/03-estructuras-control-excepciones/07-try-catch-finally)
