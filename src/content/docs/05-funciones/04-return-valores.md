---
title: "04 · return: la salida"
description: "Devolver resultados como una máquina bien educada: tipos que coinciden, caminos que cierran y el pecado de imprimir cuando debes devolver 📤"
---

<p><small>Devolver resultados como una máquina bien educada: tipos que coinciden, caminos que cierran y el pecado de imprimir cuando debes devolver 📤</small></p>

> 🗺️ **Estás en:** 🔧 **U05 · Funciones y métodos** → 04 · return: la salida

---

## 📬 La idea en una frase

> **Un método con `return` calcula y entrega un valor al que lo llamó; un método `void` solo ejecuta algo y se calla. La firma promete el tipo y `return` cumple la promesa.**

---

## 📤 Dos oficios, dos firmas

Hasta ahora tus métodos **hacían** cosas (imprimían). Ahora van a **entregar** cosas:

```java
public static int sumar(int a, int b) {
    return a + b;
}
//     ^^^
//     la firma dice "devuelvo int" y return lo cumple
```

Quien llama recibe el valor **y puede usarlo**:

```java
int total = sumar(3, 4);          // 7 en una variable
System.out.println(sumar(3, 4));  // 7 directo al println
int doble = sumar(sumar(1, 2), 3); // devuelto como argumento: 6
```

La regla de oro: **el tipo del `return` debe encajar con el tipo de la firma**. `int` con `int`, `double` con `double`, `String` con `String`. Si la firma dice `double` y devuelves `7`, Java lo acepta (el entero se amplía). Si dice `String` y devuelves `7`, es un muro: `incompatible types: int cannot be converted to String`.

### `void`: la firma que no promete nada

```java
public static void imprimirResultado(int x) {
    System.out.println("Resultado: " + x);
    // sin return (o con un return; vacío opcional)
}
```

`void` = "no devuelvo nada, solo hago mi trabajo". ¿Cómo eliges?

| Usa **retorno** cuando... | Usa **void** cuando... |
|---|---|
| Otro método necesita el resultado | Solo hay que producir un efecto (imprimir, guardar, pintar) |
| La tarea es "calcular" | La tarea es "hacer" |
| Quieres probar el valor por separado | El resultado ya se ve en pantalla o en fichero |

> 💡 **Consejo:** si tu método se llama `calcular...`, `get...`, `es...` o `devolver...`, casi seguro debe **devolver**. Si se llama `imprimir...`, `mostrar...` o `guardar...`, casi seguro es `void`. El nombre del método y su firma cuentan la misma historia.

---

## 🛤️ `return` corta la ejecución

El primer `return` que se ejecuta **termina el método al instante**: lo que haya debajo no se ejecuta nunca.

```java
public static String clasificar(int nota) {
    if (nota >= 5) {
        return "Aprobado";
    }
    return "Suspenso";   // solo se alcanza si la línea anterior no se ejecutó
}
```

Dos `return` en el mismo método son legales (y muy útiles), siempre que **todos los caminos posibles terminen en uno**:

```java
public static int maximo(int a, int b) {
    if (a > b) {
        return a;
    } else {
        return b;   // todos los caminos cierran ✓
    }
}
```

Si un camino llega al final sin `return`:

```java
public static int peligro(int a) {
    if (a > 0) {
        return a;
    }
    // ¿y si a <= 0?  →  error: missing return statement
}
```

CONRAD se pone rojo: `error: missing return statement`. Java no adivina: **exige** que la firma no pueda quedar sin cumplir.

> ⚠️ **Advertencia:** código tras un `return` incondicional no se ejecuta jamás (`unreachable statement` es su forma de protesta). Y si una rama devuelve `int` y otra `double`... la firma solo admite uno: decide.

---

## 🎭 El pecado de imprimir cuando debes devolver

El error conceptual más común de la unidad:

```java
// ❌ Imprime la media... pero quien llama no se entera
public static void media(int a, int b) {
    System.out.println((a + b) / 2.0);
}

// ✅ Devuelve la media; el que llama decide qué hacer
public static double media(int a, int b) {
    return (a + b) / 2.0;
}
```

Con la versión `void`, `main` no puede guardar la media, compararla ni reutilizarla: se imprimió y desapareció. Con `return`, el valor entra en el programa como datos de verdad.

Regla práctica: **`System.out.println` es para `main` (o para métodos cuyo oficio sea mostrar), no para los métodos que calculan.** El que calcula calcula; el que decide imprime.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `return true;` / `return false;` en un método que empieza por `es`, `tiene` o `puede` es el patrón más rentable del lenguaje: convierte preguntas en booleanos reutilizables.

**Ejercicio: la adivinanza del retorno**

```java
public static int truco(int x) {
    if (x > 10) {
        return x * 2;
    } else if (x > 5) {
        return x + 3;
    }
    return 1;
}
```

**¿Qué devuelve `truco(7)` y `truco(12)`?**

- (A) `10` y `24`
- (B) `14` y `24`
- (C) `10` y `12`
- (D) Compila, pero `truco(7)` no devuelve nada

<details>
<summary>🔄 Solución</summary>

La **A**: `10` y `24`. `truco(7)` no cumple `x > 10`, cae en `x > 5` y devuelve `7 + 3 = 10`. `truco(12)` cumple la primera rama y devuelve `12 * 2 = 24`. Traza el camino línea a línea sin fiarte de las ganas: eso es exactamente lo que hace el truco.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. En `public static boolean esPar(int n)`, ¿qué dos líneas debe tener como mínimo el cuerpo?
2. ¿Qué error da un método `int` sin `return` en algunos caminos?
3. ¿Cuál es la diferencia entre `void imprimir(int x)` y `int devolver(int x)` para quien llama?
4. ¿Se puede hacer `return` sin valor en un método `int`?

<details>
<summary>🔄 Respuestas</summary>

1. Al menos un `return` con boolean: `return n % 2 == 0;` (puede tener más ramas con `if`).
2. `missing return statement` (error de compilación).
3. `void` solo produce un efecto (imprimir); `int` entrega un valor que quien llama puede guardar, comparar o reutilizar.
4. No. `return;` (vacío) solo vale en métodos `void`; un `int` necesita `return expresión;`.

</details>

---

## ✅ Resumen en 3 frases

1. La firma promete un tipo de retorno y cada camino del cuerpo lo cumple con `return expresión;`.
2. `return` **termina el método** al ejecutarse; si algún camino llega al final sin `return` (y no es `void`), no compila.
3. Los métodos **calculan** devolviendo; imprimir es oficio de quien decide (normalmente `main`).

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `return` | Entrega un valor y cierra el método |
> | `void` | Firma sin retorno: solo ejecuta |
> | `missing return statement` | Algún camino no cumple la firma |
> | Predicado | Método que devuelve `boolean` (`esPar`) |
> | Ampliación | `int` cabe en `double` al devolver |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/05-funciones) · **Anterior:** [03 · Parámetros: la entrada](/ApuntesProgramacion/05-funciones/03-parametros) · **Siguiente:** [05 · Ámbito de variables](/ApuntesProgramacion/05-funciones/05-ambito-variables)
