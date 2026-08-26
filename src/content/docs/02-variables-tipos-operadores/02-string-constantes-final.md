---
title: 02 — String, constantes y final
description: La caja mágica del texto y las cajas con superglue 🔤
---

<p><small>La caja mágica del texto y las cajas con superglue 🔤</small></p>

> 🗺️ **Estás en:** 🔤 **U02 · Variables, Tipos y Operadores** → 02 · String, constantes y final

---

## 📬 La idea en una frase

> **`String` es una clase (no un primitivo) que guarda texto, es inmutable como una foto, y `final` es el superglue que convierte cualquier caja en una constante que no se puede tocar.**

En el punto 1 viste las 8 cajas primitivas. Pero los programas también guardan texto: nombres, mensajes, contraseñas... Para eso existe `String`. Y cuando quieras que un valor no cambie jamás, lo declaras `final`. Vamos a las dos.

---

## 🔤 String: la caja mágica que no es una caja

`String` **no es primitivo**: es una **clase**. Pero se comporta tan natural que parece primitivo. Es como un amigo que encaja tan bien en tu grupo que jurarías que es de la familia.

```java
String saludo = "Hola, DAM";           // La forma normal
String nombre = new String("Ana");     // También se puede crear así (usa un constructor)
```

Fíjate en la segunda línea: `new String(...)` es un **constructor**. Aún no estudias POO a fondo (eso llega en la U06), pero ya puedes instanciar objetos de clases predefinidas como `String`. La primera línea es un atajo que Java te da para no escribir `new String(...)` cada vez.

> 💡 **Detalle práctico:** `String` va con **comillas dobles** `"..."`. Las comillas simples `'...'` son solo para `char`, un único carácter.

---

## 🧊 La inmutabilidad: no toques, que se rompe

Los `String` son **inmutables**: una vez creados, no se pueden cambiar. Cuando haces esto:

```java
String texto = "Hola";
texto = texto + " mundo";    // Java NO modifica "Hola"
```

...en realidad Java tira el `"Hola"` a la basura y crea un `"Hola mundo"` nuevo. El texto original sigue ahí, congelado, para siempre. Es como si cada vez que quisieras poner un cartel nuevo tuvieras que quemar el anterior.

> ⚠️ **Advertencia:** esta inmutabilidad es la razón por la que comparar `String` con `==` es peligroso. Comparar con `==` pregunta *"¿son el mismo objeto?"*, no *"¿tienen el mismo texto?"*. Para comparar contenido usa `.equals()`.

---

## 🧲 `==` vs `.equals()`: la trampa clásica

```java
String a = "Hello";
String b = "Hello";
String c = new String("Hello");

System.out.println(a == b);       // true
System.out.println(a == c);       // false
System.out.println(a.equals(c));  // true
```

¿Por qué `a == b` da `true` y `a == c` da `false`, si los tres textos son "Hello"?

- `a` y `b` apuntan al **mismo objeto** en el "pool de Strings": Java reutiliza literales iguales.
- `c` se creó con `new String(...)`, así que es un objeto **nuevo y distinto**.
- `==` compara **referencias** (¿son la misma caja?); `.equals()` compara **contenido** (¿tienen lo mismo dentro?).

> ⚠️ **Advertencia:** regla de oro: **los `String` siempre se comparan con `.equals()`**. Si usas `==`, tarde o temprano te morderá en un examen.

---

## 🔒 Constantes con `final`: cajas con superglue

Las constantes se declaran con `final`. Una vez que metes algo ahí dentro, no sale ni con palanca:

```java
final double IVA = 0.21;
final int MAXIMO_INTENTOS = 3;
final String NOMBRE_APP = "Gestión DAM";

IVA = 0.10;  // ERROR de compilación: ¡no puedes reasignar una constante!
```

Por convención, las constantes se escriben **EN_MAYÚSCULAS_CON_GUIONES_BAJOS**, como si estuvieran gritando "¡SOY INMUTABLE!". Esto le dice a cualquier programador (incluido tu yo del futuro) que ese valor no se debe tocar.

> 💡 **Detalle práctico:** ¿por qué usar constantes y no escribir el número directamente? Porque si el IVA cambia de 0.21 a 0.21 para siempre... no, en serio: si cambia mañana, solo editas **una línea**, no las 50 donde usaste el 0.21. Eso es lo que se llama *mantener el código*.

---

## 🏫 Ejemplo guiado: la factura que no se puede tocar

Vamos a montar un mini-programa que calcula el precio final de un producto con IVA. La magia: el IVA es `final` y el nombre de la app también.

```java
public class Factura {
    public static void main(String[] args) {
        final double IVA = 0.21;
        final String NOMBRE_APP = "Factura Express";

        double precioBase = 50.0;
        double ivaAplicado = precioBase * IVA;
        double precioFinal = precioBase + ivaAplicado;

        System.out.println(NOMBRE_APP + " — precio base: " + precioBase + "€");
        System.out.println("IVA (" + (IVA * 100) + "%): " + ivaAplicado + "€");
        System.out.println("Total: " + precioFinal + "€");
    }
}
```

Salida:

```
Factura Express — precio base: 50.0€
IVA (21.0%): 10.5€
Total: 60.5€
```

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuando veas `==` con dos `String`, sospecha. Pregúntate primero: *¿están comparando referencias o contenido?*

**Ejercicio: ¿Qué imprime este lío de Strings?**

Sin ejecutar, di qué imprime exactamente este código:

```java
String x = "Java";
String y = "Java";
String z = new String("Java");
System.out.println(x == y);
System.out.println(x == z);
System.out.println(x.equals(z));
```

<details>
<summary>🔄 Solución</summary>

Imprime `true`, `false` y `true`.

- `x == y` → **true**: los dos literales apuntan al mismo objeto del pool de Strings.
- `x == z` → **false**: `z` es un objeto nuevo creado con `new`, no comparte referencia.
- `x.equals(z)` → **true**: el contenido es el mismo. `equals` compara texto, no referencias.

Clásico de examen. Si lo aciertas a la primera, esta unidad la llevas bien.

</details>

---

## 🎯 Mini-chequeo

1. ¿`String` es un tipo primitivo? ¿Por qué?
2. ¿Qué significa que un `String` sea inmutable?
3. ¿Qué pasa si intentas reasignar una variable declarada como `final`?
4. ¿Por qué se comparan los `String` con `.equals()` y no con `==`?

<details>
<summary>🔄 Respuestas</summary>

1. **No**, es una **clase**. Se comporta como primitivo pero tiene métodos y se crea con `new` (aunque Java te da el atajo de los literales).
2. Que una vez creado, su valor **no se puede modificar**: cada "cambio" crea un String nuevo.
3. Error de **compilación**. `final` es el superglue: lo que entra, no sale.
4. Porque `==` compara **referencias** (¿mismo objeto?) y `.equals()` compara **contenido** (¿mismo texto?), que es lo que normalmente quieres.

</details>

---

## ✅ Resumen en 3 frases

1. `String` es una **clase** que guarda texto entre comillas dobles y es **inmutable**: cada cambio crea un objeto nuevo.
2. Los `String` se comparan con **`.equals()`**, nunca con `==` (que solo compara referencias y te da sorpresas).
3. `final` convierte una variable en **constante** (por convención, en MAYÚSCULAS), y el compilador se enfada si intentas cambiarla.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `String` | Clase de Java que guarda cadenas de texto |
> | Inmutable | Que no se puede modificar una vez creado |
> | `final` | Modificador que convierte una variable en constante |
> | Constructor | El mecanismo que crea un objeto (`new String(...)`) |
> | Pool de Strings | Zona donde Java reutiliza literales iguales |
> | `.equals()` | Método que compara el contenido de dos objetos |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/02-variables-tipos-operadores) · **Anterior:** [01 · Variables y tipos primitivos](/ApuntesProgramacion/02-variables-tipos-operadores/01-variables-tipos-primitivos) · **Siguiente:** [03 · Operadores aritméticos](/ApuntesProgramacion/02-variables-tipos-operadores/03-operadores-aritmeticos)