---
title: "06 · Errores frecuentes"
description: "Los 7 tropiezos de todo el mundo con los métodos: código roto, error real de CONRAD y su arreglo 🧯"
---

<p><small>Los 7 tropiezos de todo el mundo con los métodos: código roto, error real de CONRAD y su arreglo 🧯</small></p>

> 🗺️ **Estás en:** 🔧 **U05 · Funciones y métodos** → 06 · Errores frecuentes

---

## 📬 La idea en una frase

> **Los errores con métodos no son aleatorios: tienen nombre, mensaje y arreglo. Aprende los siete y el 90% de tus horas de frustración se evaporan.**

---

## 🧯 La galería de los 7 tropiezos

### 1. Falta el `return` (o no todos los caminos cierran)

```java
public static int doble(int n) {
    if (n > 0) {
        return n * 2;
    }
    // ¿y si n <= 0?
}
```

`error: missing return statement`. **Arreglo:** cierra todos los caminos con `return`.

### 2. Argumentos en orden o tipo incorrecto

```java
static void pintar(String color, int veces) { ... }
pintar(3, "rojo");
```

`error: incompatible types: int cannot be converted to String`. **Arreglo:** respeta el orden y el tipo de la firma; repasa la llamada con los ojos en la declaración.

### 3. Número de argumentos que no cuadra

```java
static int suma(int a, int b) { return a + b; }
int r = suma(1, 2, 3);
```

`error: wrong number of arguments`. **Arreglo:** la firma manda: 2 parámetros = 2 argumentos, ni uno más ni uno menos.

### 4. Imprimir cuando debes devolver

```java
static void media(int a, int b) {
    System.out.println((a + b) / 2.0);   // void, sin retorno
}
double m = media(3, 4);   // ← esto no compila: void no es un valor
```

`error: incompatible types: void cannot be converted to double`. **Arreglo:** que el método `return` el resultado; imprimir es cosa de quien llama.

### 5. Olvidar `static` al llamar desde `main`

```java
void saludar() { ... }              // sin static
public static void main(String[] a) {
    saludar();                      // ← ¡PROHIBIDO de momento!
}
```

`error: non-static method saludar() cannot be referenced from a static context`. **Arreglo:** de esta unidad, tus métodos llevan `static`. La explicación completa (y la alternativa con objetos) vive en la U10.

### 6. Llamar como si fuera sentencia suelta

```java
saludar        // falta () y ;
saludar()      // falta el ;
```

**Arreglo:** la llamada es `saludar();` — con paréntesis (aunque no lleve argumentos) y con punto y coma.

### 7. Copiar y pegar... el método equivocado

```java
mostrarTotal();
mostrarTotal();   // querías llamar a mostrarMedia()
```

Sin error de compilación: **el más peligroso de los siete**. Compila, ejecuta y miente. **Arreglo:** lee el nombre de cada llamada como si lo escribiera un desconocido (porque dentro de dos semanas lo serás).

> 📝 **Nota:** los errores 1-6 los ve CONRAD en rojo antes de ejecutar. El 7 es de ejecución: por eso el nombre del método y la prueba manual importan tanto.

---

## 🩺 Cómo diagnosticar sin perderte

Cuando falle un método, haz las preguntas en este orden:

1. **¿Compila?** → Lee el mensaje de CONRAD: `cannot find symbol` (nombre mal escrito o fuera de ámbito), `wrong number of arguments`, `incompatible types` (tipo/orden), `missing return statement`.
2. **¿Compila pero no hace lo esperado?** → ¿Llamaste al método correcto (7)? ¿Le pasaste los argumentos en el orden que crees (2)?
3. **¿Imprime algo raro?** → Traza la llamada: ¿quién imprime y quién devuelve? ¿Estás usando la copia que llega por parámetro?

> ⚠️ **Advertencia:** no pegues el error en el buscador antes de leerlo entero. El 95% de los errores de esta unidad dicen en la primera línea **qué** está mal y en la segunda **dónde**.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuando todo compile y el resultado sigue sin cuadrar, imprime (o mejor: devuelve) los valores a mitad de camino. Depurar es mirar, no adivinar.

**Ejercicio: el taller de arreglos**

Este método debería devolver el mayor de dos números, pero tiene **2 errores** (uno de compilación y uno de lógica):

```java
public static int mayor(int a, int b) {
    if (a > b) {
        return a
    }
    return 0;
}
```

**¿Cuáles son y cómo quedan?**

<details>
<summary>🔄 Solución</summary>

1. **Compilación:** falta `;` tras `return a` → `return a;`.
2. **Lógica:** el segundo camino devuelve `0` en lugar de `b`: cuando `a <= b`, el mayor es `b`.

Versión correcta:

```java
public static int mayor(int a, int b) {
    if (a > b) {
        return a;
    }
    return b;
}
```

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué error da `int r = media(3, 4);` si `media` es `void` y solo imprime?
2. ¿Qué tres mensajes busca primero al no compilar una llamada?
3. ¿Por qué el error 7 (llamar al método equivocado) no lo detecta el compilador?
4. ¿Qué palabra falta en `void log(String s) { System.out.println(s) }`?

<details>
<summary>🔄 Respuestas</summary>

1. `void cannot be converted to int`: nada de `void` puede guardarse en una variable.
2. `cannot find symbol`, `wrong number of arguments`, `incompatible types` (y `missing return statement` si el fallo está en el cuerpo).
3. Porque el nombre y los argumentos son correctos **sintácticamente**: solo el programador sabe que querías el otro método.
4. El `;` tras el `println` (y ese error aparece al compilar la clase, no solo al llamar).

</details>

---

## ✅ Resumen en 3 frases

1. Los errores de métodos son **siete familias**: return, orden/tipo de argumentos, número de argumentos, void-vs-retorno, `static`, puntuación de la llamada y nombre equivocado.
2. Los seis primeros los atrapa el compilador; el séptimo lo detecta **tu cerebro** al leer nombres en voz alta.
3. Diagnostica siempre en orden: compila → mensaje de error → traza de la llamada.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `missing return statement` | Algún camino no devuelve lo que la firma promete |
> | `wrong number of arguments` | Argumentos ≠ parámetros |
> | `incompatible types` | El tipo no encaja (orden incluido) |
> | `static context` | Llamar a algo de clase desde `main` (detalles en U10) |
> | Error de lógica | Compila y ejecuta, pero miente |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/05-funciones) · **Anterior:** [05 · Ámbito de variables](/ApuntesProgramacion/05-funciones/05-ambito-variables) · **Siguiente:** [07 · Divide el problema](/ApuntesProgramacion/05-funciones/07-divide-problema)
