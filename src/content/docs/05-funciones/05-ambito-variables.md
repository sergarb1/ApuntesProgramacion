---
title: "05 · Ámbito de variables"
description: "Las variables viven dentro de su método y no se salen: por qué tu `total` no puede chocar con la de al lado ni escaparse de casa 🏠"
---

<p><small>Las variables viven dentro de su método y no se salen: por qué tu <code>total</code> no puede chocar con la de al lado ni escaparse de casa 🏠</small></p>

> 🗺️ **Estás en:** 🔧 **U05 · Funciones y métodos** → 05 · Ámbito de variables

---

## 📬 La idea en una frase

> **El ámbito (scope) es el trozo de código donde una variable existe: dentro de un método solo viven sus parámetros y sus locales, y lo que nace ahí muere ahí.**

---

## 🏠 Cada método es una casa

```java
public class Casas {
    public static void sumar() {
        int total = 10;
        total += 5;
        System.out.println(total);   // 15
    }

    public static void restar() {
        int total = 100;
        total -= 5;
        System.out.println(total);   // 95
    }

    public static void main(String[] args) {
        sumar();
        restar();
        // System.out.println(total);  →  ¡error!
    }
}
```

Dos métodos con una variable llamada `total` **a la vez**: cero problemas, porque son dos `total` distintas, una en cada casa. En cambio, si `main` intenta usar `total` sin declararlo:

```
error: cannot find symbol: variable total
```

Java no lo encuentra porque **no existe** fuera de `sumar()`. El método terminó, su pila de ejecución se deshizo y `total` ya no está.

> 💡 **Consejo:** cuando veas `cannot find symbol` en una variable, casi siempre es una de dos: la has mal escrito (typo) o estás intentando usarla **fuera de su casa**.

---

## 📏 Las reglas del ámbito

1. **Parámetros y locales** de un método se ven **dentro de ese método** (de su firma a su llave de cierre).
2. **Un bloque también es una casa pequeña:** una variable declarada dentro de un `if` o de un `for` no existe fuera de sus llaves (ya lo viste en la U04).

```java
for (int i = 0; i < 10; i++) { ... }
// System.out.println(i);  →  cannot find symbol: variable i
```

3. **El orden importa dentro del método:** solo puedes usar una variable **después** de declararla.
4. **Dos hermanas no se pelean:** cada método tiene su propio espacio; repetir nombres entre métodos es normal y sano.
5. Al terminar el método, sus variables **mueren**: sus valores no sobreviven (salvo lo que el método devuelve con `return` o lo que imprime).

```
main:            sumar:
┌──────────┐     ┌──────────────┐
│ (nada)    │     │ total = 10   │  ← existe solo aquí
└──────────┘     │ total = 15   │
                 └──────────────┘  ← y aquí desaparece
```

---

## 🚪 Lo que entra por la puerta también es de la casa

Los **parámetros** son variables como las demás: se declaran al inicio del método y mueren con él.

```java
public static int triplicar(int numero) {
    int resultado = numero * 3;  // dos variables de la casa
    return resultado;
}
```

Y aquí llega la consecuencia bonita: como Java copia los argumentos al entrar, **tu método puede usar el valor que le pasas, pero no reescribe la variable de quien llama**:

```java
int puntos = 10;
triplicar(puntos);
System.out.println(puntos);   // sigue siendo 10
```

`triplicar` trabajó con su **copia** de `puntos`. Para "devolver" cambios, el método devuelve el nuevo valor con `return` y quien llama lo guarda. (¿Y qué pasa con los arrays, que sí se modifican desde dentro? Ese misterio lo resuelves en la U06, punto 5. Y la versión completa, con objetos, en la U09.)

> ⚠️ **Advertencia:** no intentes "guardar" el resultado de un método en una variable de otro método. Los métodos solo comparten lo que se **pasan** (argumentos) o lo que se **devuelven** (`return`). No hay ventanillas laterales.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** si necesitas recordar algo de un método a otro, no escondas una variable: **devuélvelo** con `return` y que la decisión la tome quien llama.

**Ejercicio: ¿existe esta variable?**

```java
public class Alcance {
    public static void a() {
        int x = 1;
    }

    public static void b() {
        System.out.println(x);
    }

    public static void main(String[] args) {
        b();
    }
}
```

**¿Qué pasa?**

- (A) Imprime `1`
- (B) Imprime `0`
- (C) No compila: `x` no existe en `b()`
- (D) Compila, pero lanza excepción al ejecutar

<details>
<summary>🔄 Solución</summary>

La **C**. `x` vive y muere dentro de `a()`. El método `b()` no la conoce: es un `cannot find symbol` de compilación, ni siquiera llega a ejecutarse. Las variables no viajan entre métodos por arte de magia.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Pueden dos métodos tener una variable local llamada `contador` a la vez?
2. ¿Existe `i` del `for` fuera de sus llaves?
3. ¿Sobrevive `resultado` al terminar el método que la declara?
4. Mi método no cambia el `saldo` que le pasé. ¿Es un bug?

<details>
<summary>🔄 Respuestas</summary>

1. Sí: cada una vive en su método, son dos variables distintas.
2. No. Su ámbito termina en la llave de cierre del `for`.
3. No. Las locales mueren al salir del método; solo sobrevive lo que devuelvas.
4. No es un bug: los argumentos primitivos llegan **copiados**. Si necesitas el resultado, devuélvelo con `return`.

</details>

---

## ✅ Resumen en 3 frases

1. El **ámbito** de una variable es el trozo de código donde existe: su método (o su bloque `if`/`for`) y nada más.
2. Dentro caben **parámetros** y **locales**; al terminar el método desaparecen y otro método no puede verlas.
3. Entre métodos solo viaja lo que se **pasa** (argumentos copiados) o lo que se **devuelve** (`return`).

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Ámbito / scope | Región donde una variable existe |
> | Variable local | Declarada dentro de un método o bloque |
> | Parámetro | Variable de entrada del método |
> | `cannot find symbol` | Estás usando una variable fuera de su casa |
> | Copia del argumento | El método trabaja con su propio duplicado |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/05-funciones) · **Anterior:** [04 · return: la salida](/ApuntesProgramacion/05-funciones/04-return-valores) · **Siguiente:** [06 · Errores frecuentes](/ApuntesProgramacion/05-funciones/06-errores-frecuentes)
