---
title: 07 — try, catch y finally
description: "El airbag del código: que un error no destroce tu programa 🛡️"
---

<p><small>El airbag del código: que un error no destroce tu programa 🛡️</small></p>

> 🗺️ **Estás en:** 🔀 **U03 · Estructuras de Control y Excepciones** → 07 · try, catch y finally

---

## 📬 La idea en una frase

> **`try` protege el código peligroso, `catch` atrapa la excepción si aparece y `finally` se ejecuta siempre, ocurra lo que ocurra.**

En el punto 6 viste que un `InputMismatchException` mata tu programa. Ahora toca blindarlo: el `try`/`catch`/`finally` es el airbag del código.

---

## 🛡️ La estructura completa

```java
try {
    // código peligroso
} catch (TipoDeExcepcion e) {
    // qué hacer si aparece esa excepción
} finally {
    // se ejecuta SIEMPRE, con o sin excepción
}
```

```java
import java.util.InputMismatchException;
import java.util.Scanner;

public class LectorBlindado {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        try {
            System.out.print("¿Cuántos años tienes? ");
            int edad = sc.nextInt();
            System.out.println("Naciste hace " + edad + " años.");
        } catch (InputMismatchException e) {
            System.out.println("Eso no es un número. No me hagas esto.");
        }

        System.out.println("El programa sigue vivo. 🎉");
        sc.close();
    }
}
```

Si escribes `hola`, ya no explota: el `catch` atrapa el error, imprime un mensaje simpático y **el programa continúa**.

> 💡 **Detalle práctico:** el `finally` es opcional y suele usarse para limpiar recursos (cerrar `Scanner`, ficheros...). Se ejecuta **siempre**: si hubo excepción, si no la hubo, e incluso si el `try` tenía un `return`.

---

## 🎯 Captura múltiple: varios catch en fila

Puedes capturar varios tipos de excepción, cada uno con su tratamiento. **El orden importa: primero las más específicas, después las generales.**

```java
try {
    int[] numeros = {1, 2};
    int indice = 5;
    int divisor = 0;
    System.out.println(numeros[indice] / divisor);
} catch (ArithmeticException e) {
    System.out.println("División entre cero.");
} catch (ArrayIndexOutOfBoundsException e) {
    System.out.println("Índice fuera del array.");
} catch (RuntimeException e) {
    System.out.println("Algo raro pasó en tiempo de ejecución.");
}
```

En Java 7+ existe una forma compacta para varios tipos con el mismo tratamiento, separados por `|`:

```java
} catch (ArithmeticException | ArrayIndexOutOfBoundsException e) {
    System.out.println("Matemática o índice: fallaste por aquí.");
}
```

> ⚠️ **Advertencia:** un `catch (Exception e)` al principio se comería las excepciones más específicas. Regla: de lo más concreto a lo más general, como en los `else if`.

---

## 🧽 La variable e: el botín del error

El `e` del `catch` es el objeto excepción atrapado. Puedes preguntarle cosas:

```java
catch (Exception e) {
    System.out.println("Mensaje: " + e.getMessage());
    e.printStackTrace();   // imprime el stack trace completo (para depurar)
}
```

> ⚠️ **Advertencia:** un `catch` **vacío** (sin nada dentro) es un pecado mortal: te tragas el error y no te das ni cuenta de que pasó. Como un testigo que no habla en un juicio. Como mínimo, imprime un mensaje.

---

## 🏫 Ejemplo guiado: el menú a prueba de bombas

Reunamos `do-while`, `try` y `catch`: un menú que repite hasta elegir bien y que no explota si escribes basura:

```java
import java.util.InputMismatchException;
import java.util.Scanner;

public class MenuBlindado {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int opcion = 0;
        boolean valida = false;

        do {
            System.out.println("1. Jugar  2. Salir");
            System.out.print("Elige: ");

            try {
                opcion = sc.nextInt();
                valida = (opcion == 1 || opcion == 2);
                if (!valida) {
                    System.out.println("Opción no válida, inténtalo otra vez.");
                }
            } catch (InputMismatchException e) {
                System.out.println("Eso no es un número.");
                sc.next();   // descarta el texto basura del buffer
            }
        } while (!valida);

        System.out.println("Has elegido la opción " + opcion);
        sc.close();
    }
}
```

> 💡 **Detalle práctico:** fíjate en `sc.next()` dentro del `catch`: sin él, el texto basura seguiría en el buffer del `Scanner` y el siguiente `nextInt()` fallaría otra vez. Atrapar la excepción y **limpiar el buffer** son dos pasos del mismo baile.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** la pregunta clave ante un `try` es: *¿qué puede fallar aquí y cómo lo manejo?* Un `catch` que solo existe "por si acaso" pero no hace nada es humo.

**Ejercicio: el detective del orden**

Este código tiene un problema de orden en los `catch`. Sin ejecutar, explica qué ocurre:

```java
try {
    int[] numeros = {10, 20};
    System.out.println(numeros[3]);
} catch (Exception e) {
    System.out.println("Atrapado por Exception.");
} catch (ArrayIndexOutOfBoundsException e) {
    System.out.println("Atrapado por ArrayIndexOutOfBoundsException.");
}
```

<details>
<summary>🔄 Solución</summary>

**No compila.** Java se queja en el segundo `catch`: como `ArrayIndexOutOfBoundsException` es una subclase de `Exception`, el primer `catch` ya la atraparía todo, y Java no permite un catch "inalcanzable". Los `catch` deben ir **del más específico al más general**: primero `ArrayIndexOutOfBoundsException`, después `Exception`.

</details>

---

## 🎯 Mini-chequeo

1. ¿Qué hace el bloque `finally` y cuándo se ejecuta?
2. ¿En qué orden deben ir los `catch`?
3. ¿Qué peligro tiene un `catch` vacío?
4. ¿Por qué conviene llamar a `sc.next()` tras un `InputMismatchException`?

<details>
<summary>🔄 Respuestas</summary>

1. Se ejecuta **siempre**, haya o no excepción; sirve para limpiar recursos.
2. **Del más específico al más general**; si no, el general "se come" a los demás y no compila.
3. Te tragas el error sin enterarte: el programa sigue, pero con un fallo oculto. Mínimo: imprime un mensaje.
4. Porque el texto basura se queda en el buffer del `Scanner` y el siguiente `nextInt()` volvería a fallar.

</details>

---

## ✅ Resumen en 3 frases

1. `try` protege el código peligroso y `catch` atrapa la excepción para que el programa **no muera**.
2. Los `catch` van **del más específico al más general**, y nunca dejes un `catch` vacío.
3. `finally` se ejecuta siempre, ideal para cerrar `Scanner`, ficheros y demás recursos.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `try` | Bloque con código que puede lanzar excepciones |
> | `catch` | Bloque que atrapa una excepción y la maneja |
> | `finally` | Bloque que se ejecuta siempre |
> | Captura múltiple | Varios `catch` seguidos, del específico al general |
> | `e.getMessage()` | Mensaje del error atrapado |
> | Stack trace | Rastro de llamadas donde ocurrió el fallo |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/03-estructuras-control-excepciones) · **Anterior:** [06 · Excepciones básicas](/ApuntesProgramacion/03-estructuras-control-excepciones/06-excepciones-basicas) · **Siguiente:** [08 · throw y excepciones propias](/ApuntesProgramacion/03-estructuras-control-excepciones/08-throw-excepciones-propias)
