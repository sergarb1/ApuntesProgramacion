---
title: "07 · Consola: salida formateada y errores de entrada"
description: "printf, String.format, NumberFormat y los fallos clásicos del Scanner (y cómo no morir en el intento) 🖨️"
---

<p><small>printf, String.format, NumberFormat y los fallos clásicos del Scanner (y cómo no morir en el intento) 🖨️</small></p>

> 🗺️ **Estás en:** 🔤 **U02 · Variables, Tipos y Operadores** → 07 · Consola: salida formateada y errores de entrada

---

## 📬 La idea en una frase

> **`printf` y `String.format` dan formato a tu salida (decimales, ancho, alineación) en una línea, y conocer los errores típicos del `Scanner` te ahorra los bugs más odiados de la unidad.**

En el punto 6 aprendiste a leer del teclado. Ahora vas a darle belleza a lo que escribes y, de paso, a blindar tus programas contra los fallos más típicos de entrada. Con esto cierras el círculo de la consola.

---

## 🖨️ Salida con formato: `System.out.printf`

`System.out.println` imprime tal cual. Para controlar **cómo** se ve (decimales, ancho, relleno) tienes `printf` (print formatted):

```java
String nombre = "Ana";
int edad = 20;
double nota = 9.5;

System.out.printf("Nombre: %s, Edad: %d, Nota: %.2f%n", nombre, edad, nota);
// Nombre: Ana, Edad: 20, Nota: 9,50
```

Cada `%algo` es un **hueco** que se rellena con el valor que le sigue, en orden. Los especificadores básicos:

| Especificador | Tipo | Ejemplo |
|---|---|---|
| `%s` | String | `"Hola %s"` → `"Hola Mario"` |
| `%d` | Entero | `"Edad: %d"` → `"Edad: 25"` |
| `%f` | Decimal | `"%.2f"` → `"19,99"` |
| `%c` | Carácter | `"Inicial: %c"` |
| `%n` | Salto de línea | (independiente del sistema) |
| `%b` | boolean | `"%b"` → `true` |

> 💡 **Consejo:** `%n` para saltos de línea en `printf` (no `\n`): funciona igual en Windows, Linux y Mac. El `\n` también vale, pero `%n` es la opción "oficial".

### Controlar los decimales y el ancho

```java
double pi = Math.PI;
System.out.printf("2 decimales: %.2f%n", pi);   // 3,14
System.out.printf("4 decimales: %.4f%n", pi);   // 3,1416
System.out.printf("Ancho 10: %10.2f%n", pi);    //       3,14
System.out.printf("Izquierda: %-10.2f%n", pi);  // 3,14
```

- `%.2f` → dos decimales.
- `%10.2f` → ancho mínimo de 10 caracteres, alineado a la derecha.
- `%-10.2f` → el guion lo alinea a la izquierda.

> ⚠️ **Advertencia:** los decimales de `printf` usan la **configuración regional** de tu sistema. En un ordenador con locale español, `%.2f` escribe `3,14` (coma); en uno con locale inglés, `3.14` (punto). No te asustes si el resultado varía: es la máquina hablando en su idioma.

---

## 🧵 `String.format`: lo mismo, pero sin imprimir

A veces no quieres imprimir en el momento, sino **construir un texto** con formato para usarlo después (guardarlo, concatenarlo...). `String.format` hace exactamente lo mismo que `printf`, pero **devuelve** la cadena en vez de imprimirla:

```java
String msg = String.format("Bienvenido, %s. Tienes %d mensajes nuevos.", "Carlos", 3);
System.out.println(msg);
// Bienvenido, Carlos. Tienes 3 mensajes nuevos.
```

> 💡 **Consejo:** usa `String.format` cuando quieras un texto con formato como **valor** (para guardarlo o usarlo varias veces), y `printf` cuando solo quieras escribirlo en pantalla.

---

## 💶 Números grandes: `NumberFormat`

Imprimir `1234567.89` sin formato es feo y difícil de leer. `NumberFormat` aplica los separadores de miles y decimales de tu idioma:

```java
import java.text.NumberFormat;
import java.util.Locale;

NumberFormat nf = NumberFormat.getInstance(new Locale("es", "ES"));
System.out.println(nf.format(1234567.89));  // 1.234.567,89

NumberFormat moneda = NumberFormat.getCurrencyInstance(new Locale("es", "ES"));
System.out.println(moneda.format(12345.67));  // 12.345,67 €
```

- `getInstance(locale)` → formato numérico con separadores.
- `getCurrencyInstance(locale)` → formato de moneda (con el símbolo €).

> 📝 **Nota:** el `Locale("es", "ES")` le dice "habla como en España": punto para los miles, coma para los decimales. Si no le pasas locale, usa el de tu sistema.

---

## 🚨 Errores clásicos del Scanner (y sus remedios)

El `Scanner` es traicionero. Estos son los fallos que se repiten en cada examen y en cada programa de prácticas:

### 1. Olvidar el `import java.util.Scanner;`

Sin la línea de import, Java no conoce la clase y te lanza un error de compilación. Es el fallo más tonto y el más común.

### 2. No cerrar el Scanner: `sc.close()`

Dejar el `Scanner` abierto es de mala educación (y en programas largos, puede dejar recursos sin liberar). Cierra siempre al terminar:

```java
Scanner sc = new Scanner(System.in);
// ... todo tu código ...
sc.close();
```

### 3. Pedir un tipo y escribir otro: `InputMismatchException`

Si pides un `int` y el usuario escribe letras, el programa **explota** con `InputMismatchException`:

```java
int edad = sc.nextInt();   // el usuario escribe "hola" → 💥 InputMismatchException
```

La solución robusta es **preguntar antes** con `hasNextInt()` (o `hasNextDouble()`, `hasNext()`...):

```java
if (sc.hasNextInt()) {
    int edad = sc.nextInt();
} else {
    System.out.println("Eso no es un número entero.");
    sc.next();   // descarta el texto mal escrito
}
```

> ⚠️ **Advertencia:** `hasNextInt()` **no consume** el dato: solo mira si el siguiente es un entero. Si no lo es, debes consumir el texto basura con `sc.next()` antes de volver a preguntar, o se quedará ahí para siempre.

### 4. El lío del `nextLine()` tras `nextInt()` (ya lo viste en el punto 6)

El Enter residual se queda en el buffer. Tras un número, pon un `nextLine()` vacío antes de pedir texto.

---

## 🏫 Ejemplo guiado: el validador que no se rompe

Un programa que pide una edad y no se cae por mucho que el usuario escriba basura:

```java
import java.util.Scanner;

public class EdadSegura {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int edad = -1;

        while (edad == -1) {
            System.out.print("¿Cuántos años tienes? ");
            if (sc.hasNextInt()) {
                edad = sc.nextInt();
            } else {
                System.out.println("Eso no es un número entero, intenta otra vez.");
                sc.next();
            }
        }

        System.out.printf("Genial, %d años y listo para programar.%n", edad);
        sc.close();
    }
}
```

El bucle `while` repite la pregunta hasta que el usuario da un entero. Con `hasNextInt()` + `sc.next()` para descartar la basura, el programa es **a prueba de bombas**.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** la regla de oro: `printf` para imprimir con formato, `String.format` para guardar el texto formateado, `hasNextInt()` antes de cada `nextInt()` si el usuario puede equivocarse.

**Ejercicio: el formateador misterioso**

¿Qué imprime exactamente este programa?

```java
public class Formateo {
    public static void main(String[] args) {
        int horas = 5;
        double precio = 12.5;
        System.out.printf("Trabajo: %d horas a %.1f €/hora = %.2f €%n",
                horas, precio, horas * precio);
    }
}
```

<details>
<summary>🔄 Solución</summary>

Imprime:

```
Trabajo: 5 horas a 12,5 €/hora = 62,50 €
```

El `%d` rellena con el entero, `%.1f` con un decimal, y `%.2f` con dos. Los tres valores (`5`, `12.5` y `62.5`) se colocan en los huecos en orden. El `%n` añade el salto de línea final. (Los decimales con coma o punto dependen del locale del sistema.)

</details>

---

## 🎯 Mini-chequeo

1. ¿Qué diferencia hay entre `System.out.printf` y `String.format`?
2. ¿Qué especificador usarías para un `double` con dos decimales?
3. ¿Qué excepción lanza `sc.nextInt()` si el usuario escribe letras?
4. ¿Cómo evitas que `sc.nextInt()` explote con una entrada incorrecta?

<details>
<summary>🔄 Respuestas</summary>

1. Ambos aplican el mismo formato, pero `printf` lo imprime en pantalla y `String.format` **devuelve** el texto formateado para usarlo como valor.
2. `%.2f`.
3. `InputMismatchException`.
4. Comprobando antes con `sc.hasNextInt()` y, si no es entero, descartando la basura con `sc.next()` antes de volver a preguntar.

</details>

---

## ✅ Resumen en 3 frases

1. **`printf` y `String.format`** dan formato a la salida con especificadores (`%d`, `%s`, `%.2f`) y control de decimales y ancho.
2. **`NumberFormat`** formatea números grandes y monedas con los separadores de tu idioma.
3. El `Scanner` se rompe con `InputMismatchException` si el usuario escribe mal: pregunta antes con **`hasNextInt()`** y cierra siempre con `sc.close()`.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `printf` | Imprime con formato (`%d`, `%s`, `%.2f`...) |
> | `String.format` | Devuelve un texto con formato, sin imprimirlo |
> | Especificador | El `%algo` que marca dónde y cómo se coloca un valor |
> | `NumberFormat` | Formatea números y monedas con separadores locales |
> | `InputMismatchException` | Explosión al pedir un tipo y recibir otro |
> | `hasNextInt()` | Pregunta si lo que viene es un entero, sin consumirlo |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/02-variables-tipos-operadores) · **Anterior:** [06 · Scanner: leer por teclado](/ApuntesProgramacion/02-variables-tipos-operadores/06-scanner-entrada-teclado) · **Siguiente:** [08 · Math.random() y números aleatorios](/ApuntesProgramacion/02-variables-tipos-operadores/08-math-random-aleatorios)