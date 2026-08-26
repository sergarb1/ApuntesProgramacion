---
title: 08 — throw y excepciones propias
description: Cuando te toca a ti lanzar la piedra y crear tu propio defecto 🎳
---

<p><small>Cuando te toca a ti lanzar la piedra y crear tu propio defecto 🎳</small></p>

> 🗺️ **Estás en:** 🔀 **U03 · Estructuras de Control y Excepciones** → 08 · throw y excepciones propias

---

## 📬 La idea en una frase

> **`throw` lanza una excepción cuando tú decides que algo no debe continuar, y creando tu propia excepción puedes ponerle el nombre que quieras al problema.**

Hasta ahora Java lanzaba las excepciones por ti. Pero hay un superpoder mejor: **tú** decides cuándo lanzarlas, y puedes inventarte tipos de error a tu medida.

---

## 🎳 throw: lanza la piedra

`throw` crea y lanza una excepción donde quieras. Es como decir "aquí algo está mal, que lo sepa todo el mundo":

```java
public class CuentaBancaria {
    public static void main(String[] args) {
        double saldo = 10.0;
        double retiro = 500.0;

        if (retiro > saldo) {
            throw new ArithmeticException("Saldo insuficiente: " + saldo);
        }

        saldo -= retiro;
        System.out.println("Nuevo saldo: " + saldo);
    }
}
```

Ese `throw new ArithmeticException("...")` detiene el programa con esa excepción. Y el mensaje que le pasas al constructor es lo que verás en `e.getMessage()`.

> 💡 **Detalle práctico:** `throw` y `throws` no son primos: son trillizos distintos. `throw` **lanza** una excepción (lo ves aquí). `throws` **anuncia** en la firma del método que puede lanzar excepciones controladas. `throw` va en el cuerpo; `throws`, en la cabecera.

---

## 🏗️ Excepciones propias: tu defecto a medida

¿Por qué conformarte con `ArithmeticException` cuando puedes tener una `SaldoInsuficienteException` con nombre de película? Crear tu propia excepción es **heredar de `Exception`** (o de `RuntimeException`) y listo:

```java
public class SaldoInsuficienteException extends RuntimeException {
    public SaldoInsuficienteException(String mensaje) {
        super(mensaje);
    }
}
```

Y ahora la usas:

```java
public class Cajero {
    public static void main(String[] args) {
        double saldo = 10.0;
        double retiro = 500.0;

        if (retiro > saldo) {
            throw new SaldoInsuficienteException("Solo tienes " + saldo + "€.");
        }

        System.out.println("Retirado: " + retiro);
    }
}
```

Salida (con el programa cortándose):

```
Exception in thread "main" SaldoInsuficienteException: Solo tienes 10.0€.
	at Cajero.main(Cajero.java:9)
```

> 💡 **Detalle práctico:** hereda de `Exception` si quieres **obligar** a los que la usen a capturarla (excepción controlada). Hereda de `RuntimeException` si prefieres que no les obligue (como las que viste en el punto 6). Para empezar, `RuntimeException` es más cómoda.

---

## ⚖️ checked vs unchecked: la burocracia de las excepciones

- **Checked (controladas)**: el compilador **te obliga** a capturarlas o a declararlas con `throws`. Heredan de `Exception` pero no de `RuntimeException`. Ejemplo: `IOException`.
- **Unchecked (no controladas)**: no te obligan a nada. Son `RuntimeException` y sus hijas.

```java
import java.io.IOException;

public class Buho {
    public static void main(String[] args) throws IOException {
        // como IOException es checked, DEBE ir en el throws
        // o estar dentro de un try/catch
    }
}
```

Si una excepción es checked y no la gestionas, **no compila**. Si es unchecked, el compilador te deja tranquilo (y el error explota en ejecución).

---

## 🏫 Ejemplo guiado: la máquina expendedora

Vamos a crear una excepción propia y un programa que la lance y la atrape:

```java
public class ProductoAgotadoException extends RuntimeException {
    public ProductoAgotadoException(String producto) {
        super("El producto " + producto + " está agotado.");
    }
}
```

```java
public class MaquinaExpendedora {
    public static void main(String[] args) {
        int stock = 0;
        String producto = "Refresco";

        try {
            if (stock == 0) {
                throw new ProductoAgotadoException(producto);
            }
            System.out.println("Aquí tienes tu " + producto);
        } catch (ProductoAgotadoException e) {
            System.out.println("Lo sentimos: " + e.getMessage());
        }

        System.out.println("La máquina sigue funcionando. 🤖");
    }
}
```

Salida:

```
Lo sentimos: El producto Refresco está agotado.
La máquina sigue funcionando. 🤖
```

¿Ves la magia? El `throw` lanza tu excepción, el `catch` la atrapa por su **nombre propio** y el programa sobrevive. Ese nombre convierte un error genérico en un mensaje que hasta tu jefa entiende.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** si una condición "imposible" ocurre en tu código, es mejor `throw` que dejar que el programa siga con datos rotos. Una excepción temprana vale más que un bug que aparece dos semanas después.

**Ejercicio: el controlador de notas**

Crea (en papel o en el IDE) una excepción propia `NotaInvalidaException` que herede de `RuntimeException`, y un método que la lance si una nota no está entre 0 y 10. ¿Qué hereda tu excepción de su padre?

<details>
<summary>🔄 Solución</summary>

```java
public class NotaInvalidaException extends RuntimeException {
    public NotaInvalidaException(double nota) {
        super("La nota " + nota + " no está entre 0 y 10.");
    }
}
```

Uso:

```java
public class Notas {
    public static void main(String[] args) {
        double nota = 15;
        if (nota < 0 || nota > 10) {
            throw new NotaInvalidaException(nota);
        }
        System.out.println("Nota válida: " + nota);
    }
}
```

Tu excepción hereda de `RuntimeException` (que a su vez hereda de `Exception` y de `Throwable`) todo el comportamiento de lanzarse y capturarse, el constructor que recibe un mensaje (con `super(mensaje)`) y el método `getMessage()`. Tú solo pones el nombre y el mensaje.

</details>

---

## 🎯 Mini-chequeo

1. ¿Qué hace la palabra clave `throw`?
2. ¿Cómo se crea una excepción propia?
3. ¿Cuál es la diferencia entre `throw` y `throws`?
4. ¿Qué diferencia hay entre checked y unchecked?

<details>
<summary>🔄 Respuestas</summary>

1. **Lanza** una excepción en el punto del código donde la colocas: `throw new MiExcepcion("...");`.
2. Heredando de `Exception` o de `RuntimeException` y añadiendo (opcionalmente) un constructor que llame a `super(mensaje)`.
3. `throw` lanza una excepción (en el cuerpo del método); `throws` declara en la firma que el método puede lanzar excepciones checked.
4. Las **checked** te obligan a capturarlas o declararlas (`throws`); las **unchecked** (`RuntimeException` y hijas) no te obligan.

</details>

---

## ✅ Resumen en 3 frases

1. `throw` lanza una excepción donde tú decides, con el mensaje que quieras.
2. Crear tu propia excepción es **heredar de `Exception` o `RuntimeException`** y ponerle un constructor con mensaje.
3. `throw` (lanzar) ≠ `throws` (declarar), y las excepciones **checked** obligan a gestionarlas mientras las **unchecked** no.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `throw` | Lanza una excepción: `throw new MiExcepcion()` |
> | `throws` | Declara en la firma que el método puede lanzar algo |
> | Excepción propia | Clase que hereda de `Exception` o `RuntimeException` |
> | Checked | Excepción que el compilador te obliga a gestionar |
> | Unchecked | Excepción sin obligación de captura (`RuntimeException`) |
> | `super(mensaje)` | Pasa el mensaje a la clase padre |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/03-estructuras-control-excepciones) · **Anterior:** [07 · try, catch y finally](/ApuntesProgramacion/03-estructuras-control-excepciones/07-try-catch-finally) · **Siguiente:** [09 · Repaso interactivo](/ApuntesProgramacion/03-estructuras-control-excepciones/09-repaso-interactivo)
