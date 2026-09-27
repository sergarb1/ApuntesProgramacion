---
title: "09 · Repaso interactivo"
description: "Fireside, CONRAD, crucigrama y laboratorio: la fiesta de cierre de Funciones y métodos 🎉"
---

<p><small>Fireside, CONRAD, crucigrama y laboratorio: la fiesta de cierre de Funciones y métodos 🎉</small></p>

> 🗺️ **Estás en:** 🔧 **U05 · Funciones y métodos** → 09 · Repaso interactivo

---

## 📬 La idea en una frase

> **Este punto no enseña nada nuevo: destroza lo aprendido con preguntas, errores ajenos y un laboratorio hasta que lo tengas en las manos.**

---

## ⭐ Sé el Código, my friend...

**Pregunta 1 — la firma**

```java
public static double promedio(int a, int b, int c) {
    return (a + b + c) / 3;
}
```

**¿Qué le pasa a este método?**

- (A) Nada: compila y devuelve bien
- (B) Compila, pero devuelve un `int` con la parte decimal perdida
- (C) No compila: `double` no puede recibir la suma de tres `int`

> <details>
> <summary>🔄 Solución</summary>
>
> La **B**. `(a + b + c)` es `int` y `/ 3` también: división entera (`7` en vez de `7,33...`). Java **no** cambia a `double` solo porque la firma lo diga. Arreglo: `return (a + b + c) / 3.0;`.
>
> </details>

**Pregunta 2 — el orden**

```java
static void pintar(String texto, int veces) { ... }
pintar(3, "OK");
```

**¿Qué ocurre?**

- (A) Imprime `OK` tres veces
- (B) Imprime `3` tres veces
- (C) No compila: tipos al revés

> <details>
> <summary>🔄 Solución</summary>
>
> La **C**. El primer parámetro es `String` y llega un `int`: `incompatible types`. Los argumentos viajan en el mismo orden que los parámetros, sin excepciones.
>
> </details>

**Pregunta 3 — el pecado**

```java
static void doble(int n) {
    System.out.println(n * 2);
}
int r = doble(5);
```

**Elige sabiamente:**

1. **`10`** — el método imprime el doble y devuelve algo que se guarda ✗
2. **No compila** — `main` intenta guardar un `void` en un `int` ✓
3. **`0`** — Java rellena lo que falta con ceros ✗ (eso solo pasa en arrays)
4. **Imprime `10` y `r` queda en `0`** — suena lógico, pero `void` no es un valor ✗

> <details>
> <summary>🔄 Solución</summary>
>
> La **2**: la línea `int r = doble(5);` da `incompatible types: void cannot be converted to int`. El método `void` no produce valor: si quieres el doble en una variable, que lo **devuelva** (`static int doble(...)` con `return n * 2;`) y el `println` lo pones tú donde haga falta.
>
> </details>

---

## 🔥 Fireside Chat: `void` vs `return`

> *Dos veteranos del recorrido discuten junto a la máquina de caf.*

**`void`:** - Yo hago y me callo. Imprimir, guardar, borrar: efectos puros. El mundo me ve cambiar y no me necesita devolver nada.

**`return`:** - Y por eso cuando te necesitan para **calcular**, se pierden. A mí me guardan en variables, me comparan, me paso como argumento a otros diez métodos. Soy datos de verdad.

**`void`:** - Los efectos también son datos... bueno, efectos.

**`return`:** - ¿Y qué pasa cuando un novato te usa a mí pero le pones `System.out.println` dentro? Resultado: nadie recibe el valor, se imprime en el momento exacto en que a veces **no toca**, y el que llama no puede hacer nada con él.

**`void`:** - Eso no es culpa mía, es culpa de mezclar los oficios.

**`return`:** - Exacto. Calculas → devuelves. Decides → imprimes. Si tu método empieza por `calcular`, `obtener` o `es`, ven a mi casa.

**`void`:** - Trato. Yo para `imprimir` y `guardar`; tú para todo lo que otro método vaya a necesitar. Que el `main` sea el único que hable en voz alta.

> La lección: **`void` para efectos, `return` para valores.** Quien calcula devuelve; quien decide imprime.

---

## 🕵️ ¿Quién soy?

Adivina qué concepto de la unidad soy:

1. **Soy la variable que un método recibe al ser llamado, declarada en su firma.**
2. **Soy el valor que llega en la llamada, en el sitio exacto donde aprietas el gatillo.**
3. **Soy la región donde una variable existe: de la firma a la llave de cierre.**
4. **Soy el final del método: cierro la ejecución y entrego el valor prometido.**
5. **Soy la firma completa: nombre + tipos de los parámetros, mi carta de presentación.**
6. **Soy un método que devuelve `true` o `false`: `esPar`, `tieneSuspensa`, `todoPositivo`.**

<details>
<summary>🔄 Respuestas</summary>

1. **El parámetro** — vive en la declaración y se usa como variable dentro del método.
2. **El argumento** — el parámetro es la silla; el argumento es quien se sienta.
3. **El ámbito (scope)** — fuera de él, `cannot find symbol`.
4. **`return`** — y si algún camino de una firma con retorno no lo alcanza: `missing return statement`.
5. **La firma (firma del método)** — cambian los nombres de variables, no la firma.
6. **El predicado** — el patrón `boolean` que decora toda la POO futura.

</details>

---

## 🤖 CONRAD VS EL MUNDO: "El main que se hizo el listo"

> *CONRAD, nuestro compilador cascarrabias, ha encontrado una nota en la bandeja de errores.*

**CONRAD:** - ¡OTRA VEZ! Un alumno me dice: *CONRAD, quiero llamar a mi método desde `main`*. Y yo: *¿y el `static`?* *Pues... lo quité, que me parecía repetir.* ¡SIN `static` NO HAY `main`! `non-static method cannot be referenced from a static context`. El `main` es estático de nacimiento; hasta que no aprendas a crear objetos (U09, U10), todos tus métodos llevan `static`. No es decoración, es la entrada obligada.

*Y luego el clásico del retorno:* *mi método calcula bien pero me da `missing return statement`.* ¿Y los caminos? *¿Caminos?* ¡Claro! Si el `if` devuelve en una rama y el `else` no, hay un sendero que llega al final con la firma sin cumplir. Java no adivina tu intención: **todos los caminos cierran**.

*Y el de la variable fantasma:* *en `main` me dice `cannot find symbol: variable total`... pero la declaré en `sumar()`.* ¡PORQUE ES DE `sumar()`! Las locales mueren con su método. No hay ventanillas laterales entre casas: solo argumentos que entran y `return` que sale.

*Y el que más me hincha:* llaman `saludar()`... **sin `static`**... **sin `()`**... desde otro método... ¡LEED EL MENSAJE ENTERO, QUE LA PRIMERA LÍNEA DICE QUÉ Y LA SEGUNDA DÓNDE!

> CONRAD añade: si tu error desaparece al cambiar **una letra**, era un typo; si desaparece al añadir `()`, era la llamada; si desaparece al añadir `static`, era el contexto. El compilador te está dando clases gratis: léelas.

---

## 🎮 El juego de las decisiones

Elige la respuesta correcta para cada decisión (respuestas al final):

1. ¿Cuál es la diferencia real entre parámetro y argumento?
   - a) Ninguna, son sinónimos   b) Declaración vs llamada   c) Uno es de `int` y otro de `String`
2. ¿Qué imprime `System.out.println(truco(7));` con `truco` del punto 4?
   - a) `10`   b) `14`   c) `12`
3. ¿Pueden `a()` y `b()` tener ambas una variable `x`?
   - a) No: choca   b) Sí, son casas distintas   c) Solo si son `static`
4. ¿Qué error da `int r = suma(1, 2);` si `suma(int a, int b, int c)`?
   - a) `wrong number of arguments`   b) Nada, el tercero queda a 0   c) `missing return statement`
5. ¿Cuándo usas `void`?
   - a) Cuando no devuelves nada útil, solo haces un efecto   b) Cuando no sabes qué devolver   c) Cuando hay un solo parámetro
6. ¿Qué hace `return;` dentro de un método `int`?
   - a) Devuelve 0   b) No compila   c) Devuelve `null`

<details>
<summary>🔄 Soluciones</summary>

1. **b)** — parámetro en la declaración, argumento en la llamada.
2. **a)** — `10`: cae en la rama `x > 5` y devuelve `7 + 3`.
3. **b)** — cada método tiene su propio ámbito; dos `x` distintas.
4. **a)** — la firma pide 3 argumentos y llegan 2.
5. **a)** — `void` = solo efecto (imprimir, guardar); no hay valor que entregar.
6. **b)** — `return;` (vacío) solo es legal en `void`.

</details>

---

## ⚡ Laboratorio de tortura: el programa sin nombre

> **Duración estimada:** 30 minutos
> **Herramienta:** tu IDE y un archivo nuevo

**El escenario:** copia este programa y haz que imprima `Media: 7.5`. Tiene **2 errores de compilación** y **1 error de lógica** que solo se nota en la salida.

```java
public class Tortura {
    public static void main(String[] args) {
        int r = media(6, 7, 8, 9);
        System.out.println("Media: " + r);
    }

    public static int media(int a, int b, int c, int d) {
        double m = (a + b + c + d) / 4;
        return m;
    }
}
```

**Tu tarea:** que compile y que imprima `Media: 7.5`. Si imprime `7`, has encontrado la lógica; si no compila, son las dos de compilación.

**Pistas para cuando te frustres (no antes):**

1. ¿Cuántos parámetros declara `media` y cuántos argumentos le pasas? *si cuadra, sigue.*
   <details><summary>¿Y si sigo atascado?</summary>4 y 4: eso está bien. Mira dentro del cuerpo: ¿qué tipo es `m` y qué tipo promete `return`?</details>
2. ¿Qué dice exactamente el error de la línea `return m;`?
   <details><summary>¿Y si sigo atascado?</summary>`incompatible types: double cannot be converted to int`. Una vía: cambiar la firma a `static double media(...)` y `double r` en `main`. Otra: dividir con `/ 4.0` y castear… pero entonces perderías los decimales: la vía buena es la primera.</details>
3. ¿Compila ya, pero imprime `Media: 7`?
   <details><summary>¿Y si sigo atascado?</summary>La división es entera: `(6+7+8+9)/4 = 30/4 = 7`. Con la firma `double` y `/ 4.0` sale `7.5` de verdad.</details>

<details>
<summary>🔄 Solución completa</summary>

```java
public class Tortura {
    public static void main(String[] args) {
        double r = media(6, 7, 8, 9);
        System.out.println("Media: " + r);
    }

    public static double media(int a, int b, int c, int d) {
        return (a + b + c + d) / 4.0;
    }
}
```

Errores: (1) `double m` no cabe en `return` de `int` → firma `double`; (2) `int r = ...` no recibe `double` → `double r`; (3) lógica: división entera → `4.0`.

</details>

---

## 🏆 Logros de esta unidad

| Logro | Cómo conseguirlo |
|---|---|
| 🗣️ **El Traductor** | Explicar en voz alta la diferencia entre parámetro y argumento sin dudar |
| 📤 **El Devolvedor** | Escribir un predicado (`esPar`) que cierre todos sus caminos a la primera |
| 🏠 **El Albañil de Ámbitos** | Diagnosticar un `cannot find symbol` de un vistazo (typo o fuera de casa) |
| 🧯 **El Bombero** | Arreglar los 7 tropiezos del punto 6 sin mirar la tabla |
| 🧱 **El Director de Orquesta** | Trocear un `main` de 30 líneas en 4 métodos con salida idéntica |
| 🛠️ **El Refactorizador** | Completar el Be the Code con la salida byte a byte igual que al inicio |

---

## 🤔 Atrévete a pensar

1. **Sin ejecutar:** ¿qué imprime?

```java
public class Misterio {
    static int f(int x) {
        if (x > 2) {
            return x + 1;
        }
        return f(x + 1);
    }

    public static void main(String[] args) {
        System.out.println(f(0));
    }
}
```

<details>
<summary>🔄 Respuesta</summary>

**`4`.** Cadena de llamadas: `f(0)` → `f(1)` → `f(2)` → `f(3)` → `3 > 2` es cierto → `3 + 1 = 4`. Fíjate en que `2 > 2` es falso, así que sigue encadenando. Ojo: estás mirando **recursión**, el plato fuerte de la U08.

</details>

2. ¿Por qué decimos que `main` debe leerse "como un resumen" y no como una receta?

3. Si todos tus métodos imprimen, ¿qué le falta a tu programa para ser reutilizable?

4. ¿Se te ocurre un caso legítimo en que un método `void` llame a otro `void` y el programa completo tenga sentido sin un solo `return` con valor?

---

## 🧩 Crucigrama de bits

```
Horizontal:
1. Lo que declara el método: tipo + nombre de cada entrada (10 letras)
3. Método que devuelve true o false (9 letras)
5. Tipo de dato sin valor: "____ media(3, 4);" (4 letras)
6. Donde vive una variable: su _______ (6 letras)

Vertical:
2. Lo que pasa en la llamada: "sumar(3, 4)" son ____ (9 letras)
4. Promesa de la firma que cumple return (7 letras)
7. Palabra que cierra el método y entrega (6 letras)
```

<details>
<summary>🔄 Soluciones</summary>

**Horizontal:** 1. PARÁMETROS · 3. PREDICADO · 5. VOID · 6. ÁMBITO
**Vertical:** 2. ARGUMENTOS · 4. FIRMA · 7. RETURN

</details>

---

## 💬 Preguntas de entrevista de trabajo

> Preguntas reales que te harían para programador Java junior.

1. **"Explícame, como si yo fuera tu abuela, la diferencia entre un parámetro y un argumento."**
2. **"Escribe un método que devuelva `true` si todos los números de una lista son positivos. ¿Por qué `boolean` y no un `println`?"**
3. **"¿Qué es el ámbito de una variable y por qué existe?"**
4. **"Tu método compila pero el resultado no llega a `main`. ¿Por qué puede ser?"**
5. **"¿Cuándo harías un método `void` y cuándo con retorno? Dame un ejemplo de cada uno."**
6. **"Refactoriza un `main` de 40 líneas. ¿Por dónde empiezas y cómo compruebas que no lo has roto?"**

---

## 🤷 No hay preguntas tontas

> ❓ **¿Por qué Java me obliga a poner `static` si yo solo quiero llamar a mi método?**

Porque `main` es estático: se ejecuta **sin** crear ningún objeto. Un método no estático pertenece a un objeto, y no hay objeto al que pertenecer. De momento todos tus métodos son de clase (`static`); cuando crees tu primer objeto en la U09 y veas `static` en detalle en la U10, esto hará *clic* y no volverás a dudar.

---

> ❓ **¿Puedo llamar a un método desde otro método que está encima o debajo?**

Sí, sin restricciones de orden: todo el mundo se conoce dentro de una clase. `main` puede llamar a `calcularMedia` aunque esté escrita 50 líneas más abajo.

---

> ❓ **Si paso `x` por parámetro, ¿por qué mi método no puede cambiar mi `x`?**

Porque recibe una **copia** (para tipos primitivos). Es un diseño deliberado: los métodos no reescriben lo de nadie a escondidas; si hay un resultado nuevo, lo **devuelven** con `return`. Con arrays la cosa cambia (se pasa la referencia) y lo verás en la U06.

---

> ❓ **¿Un método puede llamar a sí mismo?**

Puede, y se llama **recursión**. Es potente y peligroso: si nunca llega a su caso base, se acaba la pila y explota. Toca en la U08, Algorítmica II, con guantes.

---

## 🎬 Poscréditos

El novato termina de trocear su informe de notas: `main` tiene cuatro líneas, cada verbo vive en su sitio y la salida es idéntica a la de la mañana. Se acerca CONRAD, el compilador cascarrabias, con su taza humeante.

**CONRAD:** - Vaya. Cuatro métodos, cero bucles en `main` y ni un solo `println` donde no tocaba. ¿Seguro que eres el mismo que empezó la unidad con todo en 40 líneas seguidas?

**Novato:** - *sonríe* Empecé copiando y pegando, y he terminado con un programa que se lee como una lista de la compra. ¿Y ahora qué?

**CONRAD:** - *toma un sorbo* Ahora esos datos quieren crecer: cinco notas se han convertido en cien, y guardarlos en variables sueltas es un infierno. Necesitas un aparcamiento de verdad: arrays, índices y `length`. Otro plato, y viene justo después.

El novato guarda su proyecto, cierra el IDE y siente que ya no escribe bloques de código: **escribe planes con nombres**.

**PRÓXIMAMENTE EN U06:** Arrays. El aparcamiento de datos del mismo tipo: crear, rellenar, recorrer y no salirse nunca del último índice. 🅿️

---

📚 [Volver al índice de la unidad](/ApuntesProgramacion/05-funciones) · **Anterior:** [08 · Be the Code](/ApuntesProgramacion/05-funciones/08-be-the-code) · **Siguiente:** **[U06 · Arrays](/ApuntesProgramacion/06-arrays)**
