---
title: "03 · Parámetros: la entrada"
description: "Ingredientes que entran por la puerta: tipos, orden, varios a la vez y la diferencia entre parámetro y argumento 📥"
---

<p><small>Ingredientes que entran por la puerta: tipos, orden, varios a la vez y la diferencia entre parámetro y argumento 📥</small></p>

> 🗺️ **Estás en:** 🔧 **U05 · Funciones y métodos** → 03 · Parámetros: la entrada

---

## 📬 La idea en una frase

> **Los parámetros son las variables que un método recibe al ser llamado: tú pasas valores en los paréntesis y el método trabaja con ellos como si los hubiera escrito él mismo.**

---

## 🔁 El problema: el método de siempre

Nuestro `saludar()` solo sabe decir una cosa:

```java
static void saludar() {
    System.out.println("¡Hola, clase!");
}
```

Si mañana hay que saludar a "Marta", a "Youssef" y a toda la clase uno a uno, toca copiar y pegar con nombres distintos... o darle **entradas** al método:

```java
public class Saludos {
    public static void saludar(String nombre) {
        System.out.println("¡Hola, " + nombre + "!");
    }

    public static void main(String[] args) {
        saludar("Marta");
        saludar("Youssef");
        saludar("la clase entera");
    }
}
```

Salida:

```
¡Hola, Marta!
¡Hola, Youssef!
¡Hola, la clase entera!
```

Una sola receta, tres platos. El método ya no decide qué datos usa: **se los pasas**.

---

## 📥 Cómo se declaran

```java
public static void saludar(String nombre) {
//                          ^^^^^^^^^^^^
//                          parámetro: tipo + nombre
```

- Cada parámetro lleva **tipo** y **nombre**, como una variable: `String nombre`, `int edad`, `double nota`.
- Varios parámetros se separan con **coma**, y cada uno repite su tipo: `String nombre, int edad`.
- Dentro del cuerpo, los parámetros se usan **como variables normales**: se leen, se concatenan, se comparan.

```java
public static void presentar(String nombre, int edad) {
    System.out.println(nombre + " tiene " + edad + " años.");
}

public static double areaRectangulo(double base, double altura) {
    return base * altura;   // ¡ya sabemos devolver! detalle en el punto 4
}
```

> 💡 **Consejo:** nombra los parámetros por lo que **son**, no por el orden: `double base, double altura` se entiende; `double x, double y` obliga a leer el cuerpo cada vez.

### Parámetro ≠ argumento

Dos palabras, dos momentos, la misma confusión eterna:

```java
//                parámetros (en la declaración)
static int sumar(int a, int b) { return a + b; }

//               argumentos (en la llamada)
int r = sumar(3, 4);
```

| Momento | Nombre | Ejemplo |
|---|---|---|
| Declarar el método | **Parámetros** | `int a, int b` |
| Llamar al método | **Argumentos** | `3, 4` |

En las charlas de pasillo todo el mundo dice "parámetros" para los dos. En un examen o en una entrevista, la distinción te hace sonar a profesional.

---

## 🎯 Reglas de las entradas

1. **El orden importa:** `presentar("Ana", 20)` no es lo mismo que `presentar(20, "Ana")` (esta última ni compila: Java espera un `String` primero).
2. **El número importa:** `sumar(3)` y `sumar(3, 4, 5)` no coinciden con la firma → error de compilación.
3. **El tipo debe encajar:** un `int` se acepta donde se pide `double` (ampliación automática), pero un `String` donde se pide `int` es un muro:
   `incompatible types: String cannot be converted to int`.
4. Cada llamada crea **sus propias copias** de los argumentos: `sumar(3, 4)` y `sumar(10, 20)` viajan con sus valores, sin pisarse (para primitivos y valores simples, esto es así; los objetos guardan alguna sorpresa para la U09).

> ⚠️ **Advertencia:** si llamas `saludar();` a un método que espera un `String`, no hay "salteo elegante": `error: method saludar in class ... cannot be applied to given types`. Los parámetros no son opcionales.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuando un método tiene muchos parámetros del mismo tipo (`int fila, int columna`), comete el crimen de cambiar el orden y verás cómo todo el programa empieza a apuntar a la casilla equivocada. Por eso se nombran bien y se pasan en orden.

**Ejercicio: la llamada confusa**

```java
public class Confusion {
    static void pintar(String color, int veces) {
        for (int i = 0; i < veces; i++) {
            System.out.print(color);
        }
        System.out.println();
    }

    public static void main(String[] args) {
        pintar("verde", 3);
        pintar(2, "azul");
    }
}
```

**¿Qué ocurre?**

- (A) Imprime `verdeverdeverde` y luego `azulazulazul`
- (B) Compila e imprime `verdeverdeverde` y `2222...` (bucle raro)
- (C) No compila: en la segunda llamada, argumentos en orden incorrecto
- (D) No compila: `pintar` necesita `return`

<details>
<summary>🔄 Solución</summary>

La **C**. El primer parámetro es `String` y el segundo `int`; en `pintar(2, "azul")` llega un `int` donde debe ir el `String` → `incompatible types`. El orden de los argumentos es parte de la firma.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. En `static void log(String mensaje, int nivel)`, ¿cuáles son los parámetros y qué le pasas en `log("Fallo", 3)`?
2. ¿Por qué `sumar(1, 2, 3)` no compila si `sumar(int a, int b)` está bien escrito?
3. ¿Qué palabra describe a `3` y `4` en `sumar(3, 4)`: parámetro o argumento?
4. ¿Se puede llamar a un método sin paréntesis, como `saludar;`?

<details>
<summary>🔄 Respuestas</summary>

1. Parámetros: `String mensaje` e `int nivel`. Argumentos: `"Fallo"` y `3`.
2. Porque la firma admite **2** argumentos y la llamada envía **3**: `wrong number of arguments`.
3. **Argumentos** (los parámetros viven en la declaración).
4. No. Sin `()` no es una llamada: `saludar;` es una expresión sin efecto (y ni eso compila como la esperas). Llamada = `saludar();`.

</details>

---

## ✅ Resumen en 3 frases

1. Los **parámetros** (tipo + nombre) se declaran entre paréntesis y dentro del método se usan como variables.
2. En la llamada pasas **argumentos** cuyo **orden, número y tipo** deben encajar con la firma.
3. Varios parámetros se separan por coma y cada uno lleva su tipo: `String nombre, int edad`.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Parámetro | Variable de la entrada, en la declaración |
> | Argumento | Valor que pasas en la llamada |
> | Firma | Nombre + tipos de los parámetros |
> | Ampliación | `int` cabe en `double` sin avisar |
> | Copia del argumento | Cada llamada trabaja con su propio valor |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/05-funciones) · **Anterior:** [02 · Tu primer método](/ApuntesProgramacion/05-funciones/02-primer-metodo) · **Siguiente:** [04 · return: la salida](/ApuntesProgramacion/05-funciones/04-return-valores)
