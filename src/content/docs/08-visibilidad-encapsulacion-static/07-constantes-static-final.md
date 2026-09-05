---
title: "07 — Constantes de clase: static final"
description: "Valores inmutables en MAYÚSCULAS y las clases utilitarias que nadie puede instanciar 🏛️"
---

<p><small>Valores inmutables en MAYÚSCULAS y las clases utilitarias que nadie puede instanciar 🏛️</small></p>

> 🗺️ **Estás en:** 🔒 **U08 · Visibilidad, Encapsulación y Static** → 07 · Constantes de clase: static final

---

## 📬 La idea en una frase

> **`static final` es una constante de clase: un valor que pertenece a la clase, no al objeto, y que nadie puede cambiar. Y si además le pones el constructor privado, tienes una clase utilitaria como `Math`.**

Recuerdas el `final` de la U02: una variable que no se puede cambiar. Ahora súmale `static` (de la clase, una sola copia) y tienes la fórmula perfecta para valores fijos de toda la aplicación: el IVA, el nombre de la app, el número máximo de usuarios...

---

## 🏷️ La constante de clase

Declaración canónica, con el nombre en **MAYÚSCULAS** y palabras separadas por `_`:

```java
public class Config {
    public static final String NOMBRE_APP = "Gestión DAM";
    public static final String VERSION = "2.1.0";
    public static final int MAX_USUARIOS = 100;
    public static final double IVA = 0.21;
}
```

Se usa así, sin crear ningún objeto:

```java
double precioConIva = precio * Config.IVA;
System.out.println("Bienvenido a " + Config.NOMBRE_APP);
```

¿Y si alguien intenta hacer `Config.IVA = 0.5`? **El compilador te lo prohíbe.** Es más firme que tus propósitos de Año Nuevo.

> 💡 **Detalle práctico:** junta las constantes en una clase dedicada (`Config`, `Constantes`, `Valores`) y tendrás un único sitio donde cambiar, por ejemplo, el IVA cuando toque. Ni un "número mágico" suelto por el código.

---

## 🔒 La regla de las MAYÚSCULAS

Es una **convención**, no una regla del lenguaje: las constantes se escriben en MAYÚSCULAS con `_`:

- `MAX_INTENTOS_LOGIN`
- `TIMEOUT_SEGUNDOS`
- `RUTA_LOG`

Cuando otro programador (o tú) vea `Config.MAX_USUARIOS` en un código, sabrá al instante que eso es una constante: no se toca, no se pregunta, no se negocia. El estilo dice mucho.

> ⚠️ **Advertencia:** ojo con la tentación de declarar todo `static final` porque "mola". Solo es constante lo que de verdad no va a cambiar. El día que el IVA suba, querrás cambiarlo en un sitio... y si es constante, lo cambias y ya.

---

## 🏛️ Las clases utilitarias: el "no necesito pareja" de Java

Una clase utilitaria es una clase que **solo tiene miembros estáticos**. Son como el amigo que está soltero y feliz: no necesita instanciarse para ser útil. La prueba: `Math`, que ya conoces.

¿Cómo evitamos que alguien haga `new StringUtils()`? Con un **constructor privado**:

```java
public class StringUtils {
    private StringUtils() {}  // Nadie puede hacer new StringUtils()

    public static boolean esVacio(String str) {
        return str == null || str.trim().isEmpty();
    }

    public static String invertir(String str) {
        return str == null ? null : new StringBuilder(str).reverse().toString();
    }

    public static String capitalizar(String str) {
        if (esVacio(str)) return str;
        return str.substring(0, 1).toUpperCase() + str.substring(1).toLowerCase();
    }
}
```

Desde fuera, todo es `StringUtils.invertir("hola")`. Intentar `new StringUtils()` da error de compilación: el constructor es privado, la clase "no necesita pareja".

> 📝 **Nota:** el constructor privado no es obligatorio para que funcione, pero es la **etiqueta** de una clase utilitaria bien hecha: le dice al mundo "no me instancies, soy pura utilidad".

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** antes de escribir un número suelto (un 100, un 0,21), pregúntate si es un *número mágico* que merece una constante con nombre. Los números mágicos son la pesadilla de quien mantiene tu código.

**Ejercicio: el validador del barrio**

Escribe (mentalmente) una clase `Validador` que sea utilitaria: constructor privado y un método `public static boolean esPar(int numero)` que devuelva `true` si el número es par.

¿Cómo comprobarías, sin crear objetos, que 42 es par?

<details>
<summary>🔄 Solución</summary>

```java
public class Validador {
    private Validador() {}

    public static boolean esPar(int numero) {
        return numero % 2 == 0;
    }
}
```

Y para usarla, sin `new`: `boolean resultado = Validador.esPar(42);` → `true`. El `%` del punto 3 de la U02 y el `static` de esta unidad, trabajando en equipo.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué significa `static final` y cómo se nombra?
2. ¿Por qué `Math` no se puede instanciar?
3. ¿Qué es un número mágico y cómo lo evitas?
4. ¿Puede cambiar una constante después de declararla?

<details>
<summary>🔄 Respuestas</summary>

1. Una constante de clase: pertenece a la clase (una sola copia) y no se puede cambiar. Se nombra en MAYÚSCULAS con `_`.
2. Porque su constructor es `private`: es una clase utilitaria, no hay motivos para crear objetos.
3. Un valor literal sin explicación (como `0.21` o `100`) tirado por el código. Lo evitas dándole nombre en una constante: `Config.IVA`.
4. No: el compilador prohíbe modificar una variable `final` después de su asignación inicial.

</details>

---

## ✅ Resumen en 3 frases

1. `static final` crea una **constante de clase**: una sola copia, inmutable, en MAYÚSCULAS.
2. Las **clases utilitarias** (como `Math`) solo tienen miembros estáticos y usan **constructor privado** para que nadie las instancie.
3. Evita los **números mágicos** dándoles nombre y juntándolos en una clase `Config`.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Constante | `static final`: valor fijo de la clase |
> | Número mágico | Valor literal sin nombre que debería ser constante |
> | Clase utilitaria | Solo estáticos, constructor privado |
> | Convención | Regla de estilo (MAYÚSCULAS) que todos siguen |
> | Constructor privado | Impide crear objetos de la clase |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/08-visibilidad-encapsulacion-static) · **Anterior:** [06 · Métodos static y el main](/ApuntesProgramacion/08-visibilidad-encapsulacion-static/06-metodos-static) · **Siguiente:** [08 · Be the Code: encapsula tu clase](/ApuntesProgramacion/08-visibilidad-encapsulacion-static/08-be-the-code)