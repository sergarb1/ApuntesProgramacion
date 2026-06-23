---
title: "Boletín 1 - Inicial Resuelto: Introducción"
nav_order: 2
---
Aquí tienes las soluciones del boletín inicial. No las mires hasta haberlo intentado por tu cuenta. Venga, date una oportunidad.

---

## Ejercicio 1: ¿Qué imprime este programa?

```java
public class MensajeSecreto {
    public static void main(String[] args) {
        System.out.println("Java mola");
        System.out.println("mucho");
        System.out.print("¿O no?");
    }
}
```

**Salida:**
```
Java mola
mucho
¿O no?
```

> **💡 Explicación:** `println` imprime y salta a la línea siguiente. `print` imprime y se queda en la misma línea. Fíjate en que "¿O no?" aparece justo después de "mucho", sin espacio ni salto. Los `println` anteriores sí añadieron saltos de línea después de cada texto. La diferencia entre `print` y `println` es como hablar con alguien: `println` suelta la frase y espera respuesta; `print` suelta la frase y se queda mirándote esperando que continúes.

---

## Ejercicio 2: Encuentra los 3 errores

```java
Public class MiPrograma
    public static void main(String[] args) {
        System.out.println("Hola, mundo")
        System.out.prinltn("Esto es DAM")
    }
}
```

**Versión corregida:**

```java
public class MiPrograma {
    public static void main(String[] args) {
        System.out.println("Hola, mundo");
        System.out.println("Esto es DAM");
    }
}
```

**Errores:**
1. `Public` debe ser `public` (minúscula). Java es sensible a mayúsculas, como tu ex.
2. Falta `{` después de `MiPrograma`. La clase necesita sus llaves de apertura.
3. Faltan los `;` al final de cada `println`. En Java, el punto y coma es el punto final de cada frase. Sin él, el compilador se queda esperando más.

Además, `prinltn` en lugar de `println` en la segunda línea (error 4 si queremos ser generosos). ¿Lo viste? Eres un buen detective.

> **💡 Explicación:** Cada instrucción en Java termina con `;`. Sin él, el compilador se confunde y piensa que la línea sigue. Es como si hablaras sin respirar. La clase necesita llaves `{}` para delimitar su cuerpo. Y los nombres de las cosas (como `public` o `println`) deben escribirse exactamente igual que los definió Java, con sus mayúsculas y minúsculas exactas.

---

## Ejercicio 3: Completa el método

```java
public class Saludo {
    public static void main(String[] args) {
        System.out.println("Bienvenidos al curso DAM");
    }
}
```

> **💡 Explicación:** El método `main` es la puerta de entrada de cualquier programa Java. Sin la línea `System.out.println(...)`, el programa se ejecuta pero no dice nada. Es como un presentador que sale al escenario y se queda callado. Incómodo. `System.out.println()` es la voz de tu programa: todo lo que pongas entre paréntesis (entre comillas dobles si es texto) se imprimirá por consola.

---

## Ejercicio 4: Escribe tu primer programa

```java
public class Presentacion {
    public static void main(String[] args) {
        System.out.println("Me llamo Sergi");
        System.out.println("Tengo 30 años");
        System.out.println("Me gusta la programación");
    }
}
```

**Salida:**
```
Me llamo Sergi
Tengo 30 años
Me gusta la programación
```

> **💡 Explicación:** Cada `println` imprime una línea. Es como escribir en un cuaderno: un renglón por cada `println`. Puedes poner cualquier texto entre las comillas dobles. El programa ejecuta las líneas en orden, de arriba a abajo, como cuando lees una receta de cocina. No se salta ninguna, no inventa nada. Es un robot obediente y aburrido.

---

## Ejercicio 5: ¿Qué hace este programa?

```java
public class SumaRara {
    public static void main(String[] args) {
        System.out.println("Resultado: " + (3 + 4));
        System.out.println("Resultado: " + 3 + 4);
    }
}
```

**Salida:**
```
Resultado: 7
Resultado: 34
```

> **💡 Explicación:** ¿Has visto qué cosa más rara? El primer `println` suma `3 + 4` dentro del paréntesis y da `7`. El segundo, al no tener paréntesis, el `+` se convierte en concatenación de texto. Es decir, `"Resultado: " + 3` da `"Resultado: 3"`, y luego `+ 4` da `"Resultado: 34"`. Java, cuando ve un `String` con un `+`, dice "ah, estamos juntando texto" y convierte todo lo demás a texto también. Los paréntesis rompen esa lógica y fuerzan la suma matemática primero. Es como si en una conversación dijeran "tengo 3" y luego "4" y alguien entendiera "tengo 34". Los paréntesis aclaran: "¡NO, es una suma, 3+4=7!"

---

## Ejercicio 6: AceptaElReto.com — 116 ¡Hola mundo!

```java
public class Problema116 {
    public static void main(String[] args) {
        System.out.println("Hola mundo.");
    }
}
```

> **💡 Explicación:** El problema más fácil de AceptaElReto. Imprime exactamente "Hola mundo." con la H mayúscula, todo junto, y con el punto al final. No es "Hola Mundo", no es "hola mundo", no es "Hola mundo". Es "Hola mundo.". Este problema existe para que aprendas a usar la web: subir código, ver el veredicto, y sentir esa primera vez que ves "AC" (Accepted). Disfrútala.

---

## Ejercicio 7: CodeWars — Multiply

```java
public class Multiply {
    public static double multiply(double a, double b) {
        return a * b;
    }
}
```

> **💡 Explicación:** CodeWars te da la estructura de la clase y el método; tú solo tienes que escribir `return a * b;`. Es la primera kata por algo: es tan simple que hasta tu abuela podría hacerla (si tu abuela supiera Java). Pero tiene su miga: te enseña que en CodeWars los métodos tienen una firma exacta que debes respetar, y que `return` devuelve un valor. Si no pones `return`, el método devuelve `void` y fallan los tests. Es como si te pidieran un café y les dieras un vaso vacío.
