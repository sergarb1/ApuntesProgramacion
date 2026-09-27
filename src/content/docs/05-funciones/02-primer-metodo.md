---
title: "02 · Tu primer método"
description: "Desmontamos la firma `public static void` en cuatro palabras y escribimos la primera receta del recetario 🍳"
---

<p><small>Desmontamos la firma <code>public static void</code> en cuatro palabras y escribimos la primera receta del recetario 🍳</small></p>

> 🗺️ **Estás en:** 🔧 **U05 · Funciones y métodos** → 02 · Tu primer método

---

## 📬 La idea en una frase

> **Declarar un método es escribir su receta (`public static void nombre() { ... }`); llamarlo es decir su nombre con paréntesis y punto y coma para que ejecute su cuerpo.**

---

## ✍️ La primera receta

Este es un programa completo con un método propio:

```java
public class Saludo {
    public static void saludar() {
        System.out.println("¡Hola, clase!");
    }

    public static void main(String[] args) {
        saludar();
        saludar();
    }
}
```

Salida:

```
¡Hola, clase!
¡Hola, clase!
```

Dos partes: **`saludar()`** es la receta (declarada arriba), y en `main` la **llamamos** dos veces. Fíjate en los dos detalles de escritura:

- La **declaración** no lleva punto y coma al final: termina con su bloque `{ ... }`.
- La **llamada** sí lleva `;`, porque es una sentencia, igual que `int x = 5;`.

---

## 🔍 La firma, palabra por palabra

```java
public static void saludar() {
```

| Palabra | Qué significa | Cuándo la verás explicada |
|---|---|---|
| `public` | Visible desde cualquier parte | U10 (visibilidad) |
| `static` | Pertenece a la clase, no a un objeto | U10 (métodos static) |
| `void` | **No devuelve** nada | Punto 4 de esta unidad |
| `saludar()` | El nombre y sus paréntesis | Hoy |

De momento escribes **siempre** `public static` delante de tus métodos. No te les olvides: sin `static`, `main` no podrá llamarlos (la explicación completa llega en la U10, cuando ya sepas qué es un objeto).

> 📝 **Nota:** el nombre sigue la convención camelCase: `calcularMedia`, `mostrarMenu`, `esPar`. Sin espacios, sin tildes, y la primera palabra en minúscula. Java es perezoso con los acentos y puntual con las mayúsculas.

### Las reglas del juego

1. Los métodos se declaran **dentro de la clase**, nunca dentro de otro método (ni siquiera dentro de `main`).
2. El **orden no importa**: puedes llamar a un método declarado más abajo del todo. Java no lee de arriba abajo; busca por nombre.
3. Cada método es una isla con su propio nombre: dos métodos no pueden llamarse igual **con los mismos parámetros** (eso lo verás en la U09, con la sobrecarga).

> ⚠️ **Advertencia:** el error de compilación `cannot find symbol` al llamar a un método casi siempre significa que le has puesto otro nombre del que tiene, o que lo estás llamando desde fuera de la clase.

---

## 🎬 `main` también es un método

Aquí está la revelación del día: `main` no es especial porque sea mágico, sino porque la JVM **lo busca por ese nombre exacto** para arrancar tu programa:

```java
public static void main(String[] args) {
```

- `public` → la JVM debe poder verlo.
- `static` → la JVM lo llama **sin crear un objeto** de tu clase.
- `void` → devuelve nada (solo ejecuta).
- `String[] args` → el array de argumentos de la línea de comandos (lo viste en la U02).

Todo lo que llevas usando desde la U02 era... un método más. La diferencia es que tú solo llamabas a uno sin darte cuenta. Ahora llamas a todos los que te apetezca.

```java
public class Reencuentro {
    public static void main(String[] args) {
        saludar();               // llamamos a un método nuestro
        System.out.println("Seguir con el programa...");
    }

    public static void saludar() {
        System.out.println("Hola de nuevo");
    }
}
```

Funciona aunque `saludar` esté **debajo** de `main`. Regla 2: el orden no importa.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** si `main` necesita llamar a un método, ese método casi siempre necesita `static`. Sin `static`, tendrás que esperar a la U10 para que las cosas encajen.

**Ejercicio: la firma rota**

¿Cuál de estos métodos **compila**?

```java
// Opción A
static public void contar() {
    System.out.println("1");
}

// Opción B
public static contar() {
    System.out.println("1");
}

// Opción C
public static void contar {
    System.out.println("1");
}

// Opción D
public static void contar() System.out.println("1");
```

<details>
<summary>🔄 Solución</summary>

La **A**. `static` y `public` pueden ir en cualquier orden: ambas son modificadores. La B olvida el tipo de retorno (`void`). La C olvida los paréntesis `()`. La D olvida las llaves `{ }`: el cuerpo **siempre** va entre llaves.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. Escribe la firma completa de un método llamado `despedir` que no devuelve nada.
2. ¿Qué línea (y en qué sitio) ejecuta el cuerpo de `despedir()`?
3. ¿Puede `main` estar declarado DESPUÉS de `despedir` en la clase? ¿Y al revés?
4. ¿Cuál es la diferencia de puntuación entre declarar y llamar?

<details>
<summary>🔄 Respuestas</summary>

1. `public static void despedir() { ... }`
2. Una **llamada** como `despedir();` (con punto y coma), por ejemplo dentro de `main`.
3. Sí a ambas: el orden de los métodos dentro de la clase no importa.
4. Declarar termina en `{ ... }` **sin** `;`; llamar es una sentencia y lleva `;`.

</details>

---

## ✅ Resumen en 3 frases

1. Un método se declara con su firma (`public static void nombre() {...}`) dentro de la clase y se **ejecuta solo cuando lo llamas**.
2. `public static void main(String[] args)` es un método más: la JVM lo llama al arrancar porque tiene ese nombre exacto.
3. El orden de los métodos no importa; lo que importa es el nombre correcto y no declarar un método dentro de otro.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Firma | La línea completa: modificadores + retorno + nombre + parámetros |
> | Declaración | Definir la receta (con su cuerpo `{...}`) |
> | Llamada | Ejecutar el método: `nombre(args);` |
> | `static` | De clase: se usa sin crear objetos (detalle en U10) |
> | `void` | "No devuelvo nada" |
> | camelCase | `calcularMedia`: minúscula al inicio, mayúsculas entre palabras |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/05-funciones) · **Anterior:** [01 · ¿Qué es una función?](/ApuntesProgramacion/05-funciones/01-que-es-funcion) · **Siguiente:** [03 · Parámetros: la entrada](/ApuntesProgramacion/05-funciones/03-parametros)
