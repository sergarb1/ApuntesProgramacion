---
title: "06 — Referencias, null y memoria"
description: "Qué guarda de verdad una variable de objeto, qué pinta el heap y por qué el NullPointerException te va a despertar por la noche 🕳️"
---

<p><small>Qué guarda de verdad una variable de objeto, qué pinta el heap y por qué el NullPointerException te va a despertar por la noche 🕳️</small></p>

> 🗺️ **Estás en:** 🏗️ **U07 · POO: Clases y Objetos** → 06 · Referencias, null y memoria

---

## 📬 La idea en una frase

> **Una variable de objeto no guarda el objeto: guarda la dirección (la referencia) donde el objeto vive en el heap. Y `null` es una referencia que no apunta a nada.**

En el punto 2 tenías una duda pendiente: qué pasa con `Galleta g3 = g1`. Esa duda se llama **referencias**, y es de las pocas cosas de esta unidad que de verdad merecen que las veas venir. Porque cuando lo entiendes, el 90% de los "bugs mágicos" dejan de ser mágicos.

---

## 📬 La carta frente a la casa

Piensa en las variables primitivas como en las direcciones postales: `int a = 5` guarda el **5** directamente, como una foto en tu cartera. Pero una variable de objeto guarda **la dirección de la casa**, no la casa entera:

```java
Galleta g = new Galleta();
```

- La galleta (el objeto) vive en una zona de memoria llamada **heap**.
- La variable `g` guarda un número que es *la dirección* de esa galleta en el heap.

Ese número se llama **referencia**. Tú nunca lo ves (Java lo esconde), pero es la clave de todo lo que pasa en este punto.

> 💡 **Tip:** cuando haces `new`, Java fabrica el objeto en el heap y te entrega un "plano de localización". Tu variable guarda ese plano. Copiar el plano no copia la casa.

---

## 👯 El alias: dos variables, un objeto

Aquí está el momento que lo cambia todo:

```java
Galleta g1 = new Galleta();
g1.sabor = "Chocolate";

Galleta g2 = g1;          // NO crea otra galleta
g2.sabor = "Vainilla";    // ¿qué sabor tiene g1 ahora?

System.out.println(g1.sabor);  // "Vainilla" 😱
```

`g2 = g1` copia la **referencia**, no el objeto. Ahora `g1` y `g2` apuntan a **la misma galleta**. Cambiar el sabor con `g2` cambia la galleta que también ve `g1`. Es el famoso **alias**: dos nombres, una sola galleta.

> ⚠️ **Advertencia:** este es el clásico que cae en los exámenes "¿Qué imprime?". La regla: **copiar una variable de objeto copia la dirección, no el objeto**. Si quieres una copia independiente, tendrías que crear un objeto nuevo (`new`) y copiar atributo a atributo (o usar lo que verás en la U10).

---

## ⚰️ `null`: la referencia al vacío

Una variable de objeto que aún no apunta a nada vale `null`:

```java
Galleta g;          // sin inicializar: aún no apunta a nada
Galleta h = null;   // explícitamente "no hay galleta"
Galleta i = new Galleta();   // apunta a una galleta de verdad
```

`null` significa "referencia que no apunta a ningún objeto". Y aquí viene el monstruo:

```java
Galleta h = null;
h.sabor = "Chocolate";   // 💥 NullPointerException
```

Si intentas tocar un atributo o llamar un método de una referencia `null`, Java lanza **`NullPointerException`** (NPE): el programa muere en el acto. Es el error más famoso y odiado de Java.

> 💡 **Tip:** cuando veas un `NullPointerException` en tu programa, busca la variable que vale `null` y pregúntate: *¿cuándo debía apuntar a un objeto y no lo hizo?* El 90% de las veces es un objeto que nunca se creó con `new` o un atributo sin inicializar.

---

## 🏠 Primitivos vs referencias: el resumen

| | Primitivos (`int`, `double`...) | Referencias (objetos) |
|---|---|---|
| Qué guarda la variable | El **valor** directamente | La **dirección** del objeto en el heap |
| Comparar con `==` | Compara valores | Compara **direcciones** (¿mismo objeto?) |
| Valor "vacío" | `0`, `false`, `0.0` | `null` |
| Copiar | Copia el valor | Copia la dirección (alias) |

> 📝 **Nota:** en la U02 viste que `String` se compara con `equals`, no con `==`. Ahora tienes el porqué: `String` es un objeto, así que `==` compara referencias, no contenido. Los literales iguales de `String` a veces comparten dirección (el *string pool*), por eso `"Hola" == "Hola"` puede dar `true` por pura casualidad. No confíes nunca en eso: usa `equals`.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** dibuja el heap. Por cada `new`, una cajita con su etiqueta. Por cada variable, una flecha hacia su cajita (o hacia el vacío si es `null`). Después solo tienes que seguir las flechas.

**Ejercicio: el lío de las flechas**

Sin ejecutar, ¿qué imprime este programa?

```java
public class Cuenta {
    int saldo;
}

public class Main {
    public static void main(String[] args) {
        Cuenta a = new Cuenta();
        a.saldo = 100;

        Cuenta b = a;
        b.saldo += 50;

        Cuenta c = new Cuenta();
        c.saldo = a.saldo;

        a = null;

        System.out.println(b.saldo);
        System.out.println(c.saldo);
    }
}
```

<details>
<summary>🔄 Solución</summary>

Imprime **`150`** y **`150`**.

- `b = a` hace que ambos apunten a la misma cuenta, así que `b.saldo += 50` sube el saldo de *esa* cuenta a 150 (que también ve `a`).
- `c = new Cuenta()` es un objeto nuevo; `c.saldo = a.saldo` copia el **valor** 150.
- `a = null` desconecta la variable `a`, pero la cuenta sigue viva porque `b` la apunta. Si nadie apuntara al objeto, el recolector de basura lo reciclaría (eso también existe, y te alegra la vida).

Resumen: **`b` y `c` imprimen 150, pero por razones distintas**: `b` porque comparte la cuenta con `a`, `c` porque le copiaste el valor.

</details>

---

## ❓ ¡No hay preguntas tontas!

> **Q:** ¿Se puede comparar una referencia con `null` para saber si apunta a algo?
>
> **A:** Sí, y es súper útil: `if (galleta == null) { ... }` o `if (galleta != null) { ... }`. Es la forma de blindar tu código contra los NPE: *"si no es null, haz cosas; si es null, salta del barco"*.

> **Q:** ¿Qué pasa con los objetos que ya no tienen ninguna variable apuntándolos? ¿Quedan ahí para siempre?
>
> **A:** No. Java tiene un **recolector de basura** (garbage collector) que detecta los objetos "huérfanos" (sin referencias) y libera su memoria. Tú no tienes que hacer nada: es la criada invisible de Java. En C++ eso era manual y dolía.

> **Q:** ¿Y si hago `null` a todas las variables que apuntan al mismo objeto?
>
> **A:** Cuando la última referencia desaparece, el recolector se lleva el objeto. Es la forma de "matar" un objeto: quitarle todos los apuntadores. No hay `delete` en Java; hay que dejar de mirarlo hasta que desaparezca.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué guarda una variable de objeto: el objeto o su dirección?
2. ¿Qué hace `Galleta g2 = g1;`? ¿Crea otra galleta?
3. ¿Qué significa `null`?
4. ¿Qué excepción lanza Java si usas una referencia `null`?

<details>
<summary>🔄 Respuestas</summary>

1. La **dirección** (la referencia), no el objeto. El objeto vive en el **heap**.
2. **No.** Copia la referencia: `g1` y `g2` apuntan al **mismo objeto** (alias).
3. Que la referencia **no apunta a ningún objeto**.
4. **`NullPointerException`** (NPE).

</details>

---

## ✅ Resumen en 3 frases

1. Una variable de objeto guarda la **referencia** (la dirección en el heap), no el objeto; por eso copiarla crea un **alias**.
2. **`null`** es una referencia que no apunta a nada, y usarla provoca la temida **`NullPointerException`**.
3. Los primitivos guardan el valor (y se comparan con `==`); los objetos guardan direcciones (y se comparan con `equals`).

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Referencia | La dirección donde vive el objeto |
> | Heap | La zona de memoria donde viven los objetos |
> | Alias | Dos variables apuntando al mismo objeto |
> | `null` | Referencia que no apunta a nada |
> | NPE | `NullPointerException`, el crash por usar `null` |
> | Garbage collector | El que recicla objetos sin referencias |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/07-poo-clases-objetos) · **Anterior:** [05 · La palabra clave this](/ApuntesProgramacion/07-poo-clases-objetos/05-this) · **Siguiente:** [07 · Sobrecarga y paso por valor](/ApuntesProgramacion/07-poo-clases-objetos/07-sobrecarga-paso-valor)