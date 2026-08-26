---
title: "01 — if, else if y else: el semáforo del código"
description: Cuando tu programa aprende a decidir (y a tomarse los semáforos en serio) 🚦
---

<p><small>Cuando tu programa aprende a decidir (y a tomarse los semáforos en serio) 🚦</small></p>

> 🗺️ **Estás en:** 🔀 **U03 · Estructuras de Control y Excepciones** → 01 · if, else if y else

---

## 📬 La idea en una frase

> **`if` es el semáforo del código: si la condición es `true`, deja pasar al bloque; si es `false`, lo redirige al `else` (o se queda esperando).**

En la U02 tus programas juzgaban con operadores relacionales y ternarios, pero esa justicia duraba una línea. Ahora llega la justicia de verdad: bloques enteros de código que se ejecutan o no según lo que decida Java.

---

## 🚦 El semáforo: if y else

La estructura básica es esta:

```java
if (condicion) {
    // código que se ejecuta si condicion es true
} else {
    // código que se ejecuta si condicion es false
}
```

```java
int edad = 17;

if (edad >= 18) {
    System.out.println("Puedes votar.");
} else {
    System.out.println("Aún no puedes votar.");
}
```

> ⚠️ **Advertencia:** el `else` es **opcional**. Un `if` solo, sin `else`, es perfectamente legal: si la condición falla, Java sigue como si nada.

---

## 🔀 else if: cuando hay más de dos caminos

¿Y si el semáforo tiene tres colores? Ahí entra el `else if`, que se encadena:

```java
int nota = 7;

if (nota >= 9) {
    System.out.println("Sobresaliente");
} else if (nota >= 7) {
    System.out.println("Notable");
} else if (nota >= 5) {
    System.out.println("Aprobado");
} else {
    System.out.println("Suspenso");
}
```

Java evalúa las condiciones **en orden, de arriba abajo**. En cuanto una da `true`, se ejecuta su bloque y **se salta el resto**. El `else` final atrapa a todos los que no entraron.

> 💡 **Detalle práctico:** el orden importa. Si empezaras por `nota >= 5`, la nota 7 entraría en el "Aprobado" y nunca llegaría al "Notable". Ordena las condiciones de la más exigente a la más permisiva.

---

## 🪆 If anidados: semáforos dentro de semáforos

Un `if` puede vivir dentro de otro. Útil cuando quieres decidir *dentro* de una decisión:

```java
int edad = 20;
boolean tieneCarnet = true;

if (edad >= 18) {
    if (tieneCarnet) {
        System.out.println("Puedes conducir.");
    } else {
        System.out.println("Te falta el carnet.");
    }
} else {
    System.out.println("Aún no puedes conducir.");
}
```

> ⚠️ **Advertencia:** no conviertas tus programas en las Torres Kio. Más de 3 niveles de anidamiento es señal de que estás haciendo las cosas raro: en la U04 aprenderás a aplanarlo.

---

## 🎚️ El ternario: el if de bolsillo

Del punto 4 de la U02 lo conoces como "un if-else en una línea". Aquí está su momento de gloria:

```java
int edad = 21;
String mensaje = (edad >= 18) ? "Mayor de edad" : "Menor de edad";
System.out.println(mensaje);
```

La regla de oro: ternario para **asignar un valor** en una línea; `if`/`else` cuando el bloque es largo o hace más que asignar.

```java
// ✅ Bien: ternario para elegir valor
double precioFinal = (dia.equals("viernes")) ? precio * 0.9 : precio;

// ✅ Bien: if cuando hay varias líneas por rama
if (saldo < 0) {
    System.out.println("Estás en números rojos.");
    System.out.println("Revisa tus gastos.");
} else {
    System.out.println("Saldo sano.");
}
```

---

## 🏫 Ejemplo guiado: la discoteca municipal

Vamos a montar el control de acceso de una discoteca con entrada reducida:

```java
public class Discoteca {
    public static void main(String[] args) {
        int edad = 16;
        boolean acompanado = true;

        if (edad >= 18) {
            System.out.println("Entra, mayor de edad.");
        } else if (edad >= 16 && acompanado) {
            System.out.println("Entra, pero con tu acompañante.");
        } else {
            System.out.println("Lo siento, vuelve en unos años.");
        }
    }
}
```

Salida:

```
Entra, pero con tu acompañante.
```

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuando veas una cadena de `if`/`else if`, pregúntate siempre: *¿el orden es de la condición más estricta a la más laxa?* Ese es el 90% de los bugs de esta unidad.

**Ejercicio: el semáforo confuso**

Sin ejecutar, calcula qué imprime este programa:

```java
public class Semaforo {
    public static void main(String[] args) {
        int nota = 8;
        String resultado;

        if (nota >= 5) {
            resultado = "Aprobado";
        } else if (nota >= 7) {
            resultado = "Notable";
        } else if (nota >= 9) {
            resultado = "Sobresaliente";
        } else {
            resultado = "Suspenso";
        }

        System.out.println(resultado);
    }
}
```

<details>
<summary>🔄 Solución</summary>

Imprime **`Aprobado`**. El orden está invertido: como el primer `if` pide `nota >= 5` y 8 cumple, Java entra ahí y no mira las demás condiciones, aunque 8 también cumpliría `nota >= 7` y `nota >= 9`. Las condiciones correctas irían de la más exigente (9) a la más permisiva (5). La lección: **el primer `if` que se cumple gana**, aunque no sea el que querías.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué hace Java si un `if` es `false` y no hay `else`?
2. ¿En qué orden debes encadenar las condiciones de un `else if`?
3. ¿Cuándo prefieres un ternario a un `if`/`else`?
4. ¿Qué imprimiría `String s = 5 > 3 ? "A" : "B";`?

<details>
<summary>🔄 Respuestas</summary>

1. Sigue ejecutando la siguiente línea: el `if` se ignora en silencio.
2. De la más **exigente** a la más **permisiva**, porque el primer `true` se queda con la decisión.
3. Cuando solo quieres **asignar un valor** en una línea y las dos ramas son cortas.
4. **`"A"`** — porque 5 > 3 es `true`.

</details>

---

## ✅ Resumen en 3 frases

1. `if` / `else if` / `else` son el **semáforo** del código: ejecutan un bloque u otro según una condición booleana.
2. Las condiciones se evalúan **en orden** y gana la primera que dé `true`, así que ordena de la más estricta a la más laxa.
3. El **ternario** resume un if-else de dos valores en una línea, pero para bloques largos usa el `if` clásico.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Condición | Expresión booleana que decide: `edad >= 18` |
> | Rama | Cada uno de los caminos posibles (`if`, `else`) |
> | Anidar | Meter un `if` dentro de otro `if` |
> | Ternario | `condición ? valor1 : valor2`, un if-else en una línea |
> | Cortocircuito | Java deja de evaluar cuando la primera condición ya decide |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/03-estructuras-control-excepciones) · **Anterior:** [Índice de la unidad](/ApuntesProgramacion/03-estructuras-control-excepciones) · **Siguiente:** [02 · switch](/ApuntesProgramacion/03-estructuras-control-excepciones/02-switch)
