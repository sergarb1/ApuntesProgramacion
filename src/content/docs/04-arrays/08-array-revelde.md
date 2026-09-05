---
title: "08 · Array-revelde: errores comunes y depuración"
description: "La galería de monstruos de los arrays: excepciones, null, comparaciones que no comparan y cómo cazarlos con calma 🐛"
---

<p><small>La galería de monstruos de los arrays: excepciones, null, comparaciones que no comparan y cómo cazarlos con calma 🐛</small></p>

> 🗺️ **Estás en:** 🅿️ **U04 · Arrays** → 08 · Array-revelde: errores comunes y depuración

---

## 📬 La idea en una frase

> **Los arrays no se rebelan por maldad: se rebelan porque olvidas los límites. Conocer los 6 monstruos típicos es la mitad de la batalla; saber depurar es la otra mitad.**

A estas alturas ya has escrito tus primeros arrays. Y, si eres humano, ya te has estrellado una vez (o dos, o cincuenta). Este punto recopila los errores más comunes del universo array para que los reconozcas al instante y dejes de llorar sobre el teclado.

---

## 👹 La galería de monstruos

### Monstruo 1: la `ArrayIndexOutOfBoundsException`

El rey del mambo. Sales de las plazas válidas (`0` a `length - 1`).

```java
int[] a = {10, 20, 30};
System.out.println(a[3]); // Index 3 out of bounds for length 3
```

> 🔍 **Diagnóstico:** el mensaje te dice el índice y la longitud. Si pides `a[3]` y hay 3 plazas (0, 1, 2), el problema está en el `<=` de tu bucle o en un índice calculado mal. Lee el mensaje: no es un misterio, es una pista.

### Monstruo 2: la `NullPointerException`

Recorre un array de objetos recién creado y tocas una plaza sin objeto.

```java
String[] nombres = new String[3];
System.out.println(nombres[0].toUpperCase()); // BOOM: null no tiene métodos
```

> 🔍 **Diagnóstico:** las plazas de un `String[]` nuevo están llenas de `null`. Pregunta antes: `if (nombres[i] != null) { ... }` o crea los objetos al inicio.

### Monstruo 3: imprimir sin `Arrays.toString`

```java
int[] a = {1, 2, 3};
System.out.println(a); // [I@6d06d69c
```

> 🔍 **Diagnóstico:** imprime la dirección de memoria, no los datos. Siempre `Arrays.toString(a)` (o `Arrays.deepToString` para 2D). Lo viste en el punto 4 y no te cansarás de verlo.

### Monstruo 4: comparar con `==`

```java
int[] a = {1, 2, 3};
int[] b = {1, 2, 3};
System.out.println(a == b);            // false: ¿son el MISMO objeto?
System.out.println(a.equals(b));       // false también: los arrays no sobreescriben equals
System.out.println(Arrays.equals(a, b)); // true: esto compara contenido
```

> 🔍 **Diagnóstico:** `==` y `equals` comparan **referencias**. Para comparar contenido: `Arrays.equals(a, b)`.

### Monstruo 5: confundir `length`, `length()` y `size()`

```java
int[] a = {1, 2, 3};
String s = "Hola";
System.out.println(a.length());  // no compila: array usa length (atributo)
System.out.println(s.length);    // no compila: String usa length() (método)
```

> 🔍 **Diagnóstico:** la regla de oro: **array → `length`** (sin paréntesis), **`String` → `length()`**, **colección → `size()`**. Los exámenes adoran esta trampa.

### Monstruo 6: intentar modificar con `for-each`

```java
int[] a = {1, 2, 3};
for (int n : a) {
    n = n * 10;   // ¿sube los valores? NO: cambia una copia
}
System.out.println(Arrays.toString(a)); // [1, 2, 3]
```

> 🔍 **Diagnóstico:** el `for-each` es de solo lectura. La variable `n` es una copia del valor de la plaza. Para modificar, `for` con índice: `a[i] = a[i] * 10;`.

---

## 🤬 CONRAD VS EL MUNDO: "El array que no se calla"

> *CONRAD, nuestro compilador cascarrabias, tiene la taza llena y los arrays rotos sobre la mesa.*

**CONRAD:** — ¡OTRA VEZ! Me traen un programa y me dicen: *CONRAD, me da ArrayIndexOutOfBoundsException*. Y yo: ¿y tú qué has hecho? *Pues recorrer el array.* ¿CON QUÉ? *Pues con un for... creo.* ¡AY, MADRE MÍA! ¿Un for con qué condición? *Pues `i <= numeros.length`...* ¡¿`<=`?! ¡PERO SI TE LO DIJE EN EL PUNTO 2! El último índice válido es `length - 1`. `<=` te lleva a la plaza fantasma y de ahí no vuelve nadie.

*Y luego están los que preguntan por qué les sale null. Pregunta: ¿qué tienes en la plaza?* No sé, la creé con `new String[10]`. *¿Y cuántas plazas has llenado?* Pues... bueno... ¡AH! ¡NINGUNA! Un `String[]` recién creado es una fila de `null`. Si no metes objetos, no hay objetos. ¿Es tan difícil?

*Y el favorito de todos:* no me funciona el bucle que duplica. *Muéstramelo.* Es un `for-each` que hace `n = n * 2`. *¿Y esperabas cambiar el array?* Pues sí. ¡EL `for-each` NO MODIFICA! Es como un robot lector de matrículas: lee, pero no repinta. Para repintar, índice y corchetes.

**La lección:** los seis monstruos tienen nombre, mensaje y cura. El 90% de los "arrays rebeldes" se arreglan mirando el mensaje de error con calma y recordando las reglas de oro: límites (`0` a `length-1`), `null` en objetos, `Arrays.toString` para imprimir, `Arrays.equals` para comparar, `length` sin paréntesis y `for` con índice para modificar.

---

## 🐛 Depurar arrays sin perder la cabeza

Cuando un array se porta mal, sigue este orden:

1. **Imprime el array completo** con `Arrays.toString()` en cada paso. Ver los datos a la vista arregla la mitad de los misterios.
2. **Comprueba los límites antes de tocar.** Si vas a acceder a `a[i + 1]`, que `i` no llegue a `length - 1`. Pregunta siempre: ¿puede salirse?
3. **Usa el depurador del IDE.** Pon un *breakpoint* en el bucle y observa `i` en cada vuelta. Si se pasa de `length - 1`, lo ves a la primera.
4. **Papel y boli.** Con un array de 3 elementos y un objetivo que no esté, simula el bucle a mano. Sí, en pleno siglo XXI, y sigue funcionando.
5. **Aísla el error.** Divide el problema: primero rellena y comprueba que el contenido es correcto; después el bucle; después el cálculo. Si algo falla, sabrás qué tramo es.

> 💡 **Consejo:** el mensaje de excepción de Java no es tu enemigo: es un detective que te dice la línea y el motivo. `Index 5 out of bounds for length 5` no deja lugar a dudas. LÉELO antes de tocar nada.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuando algo falle, pregunta antes "¿qué esperaba?" y después "¿qué he escrito?". El 90% de las veces la diferencia entre las dos respuestas está en un `<=`, un `null` o un `==`.

**Ejercicio: el cazador de monstruos**

```java
public class CazaMonstruos {
    public static void main(String[] args) {
        int[] datos = new int[5];
        for (int i = 1; i <= datos.length; i++) {
            datos[i] = i * 10;
        }
        System.out.println(java.util.Arrays.toString(datos));
    }
}
```

**¿Qué ocurre?**

- (A) Imprime `[10, 20, 30, 40, 50]`
- (B) Imprime `[0, 10, 20, 30, 40]`
- (C) `ArrayIndexOutOfBoundsException`
- (D) `NullPointerException`

<details>
<summary>🔄 Solución</summary>

La **C**. El bucle va de `i = 1` a `i = 5` inclusive (`<=`). Cuando `i` vale 5, hace `datos[5] = 50`, pero las plazas válidas van de 0 a 4. Monstruo 1 en acción. Y de paso, la plaza 0 se queda sin tocar (a `0`), porque el bucle empieza en 1: otro pequeño susto para los despistados.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué excepción lanzas al acceder a `a[a.length]`?
2. ¿Qué hay en `String[] s = new String[3]` en cada plaza?
3. ¿Cómo comparas dos arrays para saber si tienen el mismo contenido?
4. ¿Con qué bucle puedes modificar los elementos de un array?

<details>
<summary>🔄 Respuestas</summary>

1. `ArrayIndexOutOfBoundsException`: el índice `length` no existe, las plazas terminan en `length - 1`.
2. `null` en las tres. Las plazas de objetos recién creadas están vacías hasta que las llenas con `new`.
3. Con `Arrays.equals(a, b)`. `==` y `a.equals(b)` comparan referencias, no contenido.
4. Con el `for` clásico con índice (`a[i] = ...`). El `for-each` es de solo lectura.

</details>

---

## ✅ Resumen en 3 frases

1. Los **seis monstruos** de los arrays son: índice fuera de rango, `null`, imprimir sin `toString`, comparar con `==`, confundir `length`/`length()`/`size()` y modificar con `for-each`.
2. El **mensaje de la excepción es una pista**: te dice la línea y el motivo. Léeselo antes de tocar nada.
3. Depurar un array es **ver los datos** (`Arrays.toString`), **respetar los límites** y aislar el tramo que falla, con boli o con *breakpoint*.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Monstruo | Error típico con nombre y cura (`ArrayIndexOutOfBounds`, `NullPointer`...) |
> | `Arrays.toString` | La forma de imprimir un array legible |
> | `Arrays.equals` | Comparar contenido de dos arrays |
> | Valor centinela | Valor especial que representa "vacío" en primitivos |
> | *Breakpoint* | Punto de parada del depurador para inspeccionar variables |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/04-arrays) · **Anterior:** [07 · Be the Code: el parking se gestiona](/ApuntesProgramacion/04-arrays/07-be-the-code) · **Siguiente:** [09 · Repaso interactivo](/ApuntesProgramacion/04-arrays/09-repaso-interactivo)