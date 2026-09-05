---
title: "10 · Repaso interactivo: la caja que no cabía"
description: El cierre práctico de la unidad, con un bug de truncamiento que no va a gustar a nadie 😈
---

<p><small>El cierre práctico de la unidad, con un bug de truncamiento que no va a gustar a nadie 😈</small></p>

> 🗺️ **Estás en:** 🔤 **U02 · Variables, Tipos y Operadores** → 10 · Repaso interactivo

---

## 📬 La idea en una frase

> **En este punto no aprendemos nada nuevo: lo convertimos todo en práctica. Y, como siempre, algo no va a funcionar.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaban de darte este programa para ejecutar:*

```java
public class Misterio {
    public static void main(String[] args) {
        int nota = 7;
        int sobre = 10;
        System.out.println("Nota " + nota + sobre);
        System.out.println("Nota " + (nota + sobre));
        System.out.println(nota / 2 + " de nota media");
    }
}
```

**¿Qué imprimes por pantalla? Elige sabiamente:**

1. **`Nota 710`, `Nota 17` y `3 de nota media`** → ✅ ¡Correcto! En la primera línea, al ver texto antes del `+`, Java concatena: `"Nota " + 7` es `"Nota 7"` y luego `+ 10` da `"Nota 710"`. En la segunda, los paréntesis fuerzan la suma: `Nota 17`. Y `7 / 2` es división entera: 3.
2. **`Nota 17`, `Nota 17` y `3.5 de nota media`** → Los paréntesis no cambian nada y la división entera se redondea. ❌
3. **`Nota 710`, `Nota 17` y `3.5 de nota media`** → La división de dos enteros da decimales. ❌

> <details>
> <summary>🔄 Solución</summary>
>
> La opción **1**. Cuando un `+` mezcla texto y números, Java concatena. Los paréntesis `(nota + sobre)` obligan a sumar primero. Y `7 / 2` con enteros trunca: **3**, no 3.5. Tres trampas de la unidad en un solo programa. Brutal.
>
> </details>

---

## 🔥 Fireside Chat: int vs double

> *Dos cajas del almacén discuten junto a la estantería de los datos.*

**int:** — Yo soy la caja de mudanza. Compacta, exacta, sin decimales. En mí no hay espacio para tonterías. 17 dividido entre 5 son 3 y se acabó.

**double:** — *arquea una ceja* ¿3? ¿En serio? Para mí son 3.4. Yo guardo los decimales de verdad. Los precios, las notas medias, las temperaturas... todo eso vive en mi casa.

**int:** — Sí, y cuando intentas meter un número mío en tu caja, va todo bien. Pero cuando intentas meter tú el tuyo en la mía... ¡tienes que pedir permiso con `(int)` y aun así pierdes céntimos por el camino!

**double:** — *encogiendo de hombros* Es el precio de la precisión. Yo guardo más dígitos que tú. ¿Sabes cuántas veces he visto a novatos escribir `(int)(Math.random() * 6 + 1)` y llorar porque el dado nunca salía 6?

**int:** — Vale, vale... ¿Y para contar? ¿Para un bucle? ¿Para una edad? A mí me llaman a mí. Contar con decimales no tiene sentido.

**double:** — Y medir, calcular medias y precios, me llaman a mí. Somos un equipo: tú para lo entero, yo para lo fino.

**int:** — *gruñe* Un equipo. Bah. Pero... vale. Tú y yo, y `long` para los astronómicos y `char` para las letras. Todos en el mismo almacén.

> La lección: **`int` es para lo entero, `double` para lo decimal**. Confundirlos en una división (o en un casting mal puesto) produce los errores más clásicos de esta unidad.

---

## 🕵️ ¿Quién soy?

Adivina qué concepto de la unidad soy:

1. **Soy el superglue del almacén: una vez que metes algo en mí, no sale ni con palanca. Me escriben en MAYÚSCULAS para que todos me respeten.**
2. **Comparo dos valores y solo sé decir dos palabras: `true` y `false`. Soy el juez de la discusión.**
3. **Soy la caja mágica del texto: no soy primitiva, soy una clase, y si intentas cambiarme, tiro lo viejo y creo uno nuevo.**
4. **Soy el oído del programa: espero a que escribas por teclado y luego paso lo que leíste a una variable.**
5. **Soy el casino: te doy un número entre 0 y 1, y si me multiplicas y me conviertes a `int`, te hago un dado.**

<details>
<summary>🔄 Respuestas</summary>

1. **`final`** — El modificador que convierte una variable en constante.
2. **Un operador relacional** (`==`, `<`, `>`, ...) — Siempre devuelve un `boolean`.
3. **`String`** — Clase inmutable que guarda texto.
4. **`Scanner`** — Lee del teclado con métodos `next...`.
5. **`Math.random()`** — El generador de números aleatorios.

</details>

---

## 🤬 CONRAD VS EL MUNDO: "El compilador odia tu memoria"

> *CONRAD, nuestro compilador cascarrabias, opina sobre los clásicos del novato en esta unidad.*

**CONRAD:** — ¡OTRA VEZ! Llega un alumno y me da esto: `long distancia = 3000000000;` sin la L. Y yo: *eso es un int, y no cabe, leñe.* Pero él no me escucha. ¿Por qué? ¡Porque cree que ya lo sabe todo!

*Y luego el precio:* `float precio = 19.99;`. Un `double` suelto dentro de una caja `float`... y va y le falta la `f`. ¡LA F, HOMBRE! Es una letra, una sola. ¿Tan difícil es? Y `char letra = "A"` con comillas dobles. ¡Las simples, las simples! Es como confundir un piso con una escalera.

*Y el rey del mambo:* `String nombre = "Ana";` y luego `if (nombre == "Ana")`. ¿PERO TÚ TE HAS LEÍDO EL PUNTO 2? `==` compara referencias, no texto. Es que te estoy dando el examen con las respuestas y me lo devuelves en blanco.

**La lección:** en esta unidad, el compilador es tu mejor amigo: `long` necesita L, `float` necesita f, `char` usa comillas simples y los `String` se comparan con `.equals()`. Aprende la lista de cuatro y te ahorrarás el 80% de las broncas.

---

## ⚡ Laboratorio de tortura: el programa que cobra mal

> **Duración estimada:** 30 minutos
> **Herramienta:** tu IDE y un archivo nuevo

**El escenario:** copia este programa en tu IDE y haz que funcione. Es un cajero que calcula cuántos billetes de 5 € te da el banco por un reintegro. Tiene **3 errores** que impiden que compile y 1 error de lógica que hace que el resultado sea incorrecto cuando lo arregles.

```java
import java.util.Scanner;

public class Tortura {
    public static void main(string[] args)
        Scanner sc = new Scanner(System.in);
        System.out.print("Cantidad a retirar: ");
        int cantidad = sc.nextInt()
        double billetes5 = cantidad / 5.0;
        System.out.println("Te dan " + billetes5 + " billetes de 5");
        sc.close();
    }
}
```

**Fallo intencionado:** uno de los errores parece correcto a simple vista porque "se ve bien", pero cambia por completo la salida del programa.

**Tu tarea:** conseguir que compile, que ejecute y que **toda** la salida sea correcta. Prueba con `cantidad = 17`: ¿cuántos billetes de 5 deberían ser?

**Pistas para cuando te frustres (no antes):**

1. ¿Hay algún `;` que falte? *no → sigue buscando.*
   <details><summary>¿Y si sigo atascado?</summary>La línea del `nextInt()` termina sin punto y coma. El `;` existe para que Java sepa dónde acaba cada orden.</details>
2. ¿Compila ya? *no → mira el mensaje de error y las mayúsculas.*
   <details><summary>¿Y si sigo atascado?</summary>Son dos cosas: `string` debe ser `String` (la clase con mayúscula) y falta el `{` que abre el cuerpo del `main`.</details>
3. ¿Ejecuta pero el número de billetes sale con decimales? *Es el error de lógica: mezcla de tipos.*
   <details><summary>Solución final</summary>

Los **3 errores de compilación**:

1. `string[] args` → `String[] args` (la clase `String` con mayúscula).
2. Falta el `{` que abre el cuerpo del `main` después de `main(string[] args)`.
3. Falta el `;` al final de `int cantidad = sc.nextInt()`.

El **error de lógica**: `double billetes5 = cantidad / 5.0;` compila, pero con `cantidad = 17` imprime **3.4** billetes... y un cajero no te puede dar 3.4 billetes. La solución es usar **división entera**: `int billetes5 = cantidad / 5;`

```java
import java.util.Scanner;

public class Tortura {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Cantidad a retirar: ");
        int cantidad = sc.nextInt();
        int billetes5 = cantidad / 5;
        System.out.println("Te dan " + billetes5 + " billetes de 5");
        sc.close();
    }
}
```

Para `cantidad = 17`: `17 / 5` con enteros da **3** billetes (y sobran 2 €). Con la versión rota, `cantidad / 5.0` daba 3.4, que como `double` sí se imprime tal cual: el cajero "te daba 3.4 billetes". La división entera es lo que hace el trabajo limpio.

</details>

---

## 🏆 Logros de esta unidad

| Logro | Cómo conseguirlo |
|---|---|
| 🏅 **El Guardia del Almacén** | Explicar los 8 tipos primitivos y qué cabe en cada caja sin mirar |
| 🏅 **El Equilibrista** | Resolver `int y = x++ + ++x;` sin ejecutar y sin llorar |
| 🏅 **El Traductor de Texto** | Normalizar un nombre con `trim().toUpperCase().substring(...)` en una línea |
| 🏅 **El Dado Trucado** | Generar 10 números aleatorios entre 1 y 6 sin que salga nunca un 0 |
| 🏅 **El Coyote del Scanner** | Evitar el lío de `nextLine()` tras `nextInt()` sin que nadie te lo recuerde |

---

## 🧠 Atrévete a pensar

1. **Sin ejecutar:** ¿qué imprime este programa?

```java
public class Misterio2 {
    public static void main(String[] args) {
        int a = 10;
        int b = 3;
        System.out.println("a/b = " + a / b);
        System.out.println("a/b real = " + (double) a / b);
        System.out.println("a%b = " + a % b);
    }
}
```

2. **El precio que no cuadra:** un programa calcula `double total = precio * 0.21;` con `precio = 100` y muestra `21.000000000000004`. ¿Qué le pasa a Java? ¿Cómo lo arreglarías solo con herramientas de esta unidad?

3. **El ternario encadenado:** escribe un ternario (o varios encadenados) que asigne a `categoria` el valor `"niño"`, `"adulto"` o `"jubilado"` según si la edad es `< 12`, `< 65` o `>= 65`.

4. **Verdadero o falso:** "`Math.random() * 5` puede devolver el número 5." Justifica.

<details>
<summary>💡 Soluciones</summary>

1.
```
a/b = 3
a/b real = 3.3333333333333335
a%b = 1
```
La primera es división entera (trunca). La segunda fuerza decimal con `(double) a` antes de dividir.

2. Java usa **coma flotante binaria**: `0.21` no se puede representar exactamente en binario, así que quedan residuos como `21.000000000000004`. Puedes dejarlo visualmente limpio redondeando con `Math.round(total * 100) / 100.0`, o usar `printf` (lo viste en el punto 7) para formatear la salida sin tocar el número.

3.
```java
String categoria = edad < 12 ? "niño" : (edad < 65 ? "adulto" : "jubilado");
```
Los ternarios se pueden encadenar: si la primera condición es falsa, evaluamos la segunda.

4. **Falso.** `Math.random()` devuelve entre `0.0` y `0.999...` (el 1 nunca se incluye). Al multiplicar por 5, el máximo es `4.999...`, que tras `(int)` da 4. `(int)(Math.random() * 5)` da de **0 a 4**.

</details>

---

## 🧩 Crucigrama de bits

```
Horizontal:
1. Operador que da el resto de una división (1 letra)
3. Modificador que hace una variable constante (5 letras)
5. Clase para leer del teclado (7 letras)
7. Método que quita los espacios de los extremos (4 letras)

Vertical:
2. Tipo que guarda texto (6 letras)
4. Clase con métodos estáticos como random y round (4 letras)
6. Tipo primitivo de verdadero o falso (7 letras)
```

<details>
<summary>📝 Soluciones</summary>

**Horizontal:** 1. % · 3. FINAL · 5. SCANNER · 7. TRIM
**Vertical:** 2. STRING · 4. MATH · 6. BOOLEAN

</details>

---

## 💬 Preguntas de entrevista de trabajo

> Preguntas reales que te harían para programador Java junior.

1. **"Explícame, como si yo tuviera ocho años, qué es una variable y qué es un tipo primitivo."**
2. **"¿Por qué `double nota = 7/2;` da `3.0` y no `3.5`? ¿Y cómo lo arreglarías?"**
3. **"¿Cuándo usarías `int` y cuándo `long`? Pon un ejemplo de cada uno."**
4. **"¿Qué es un casting y qué riesgos tiene hacer un casting de `double` a `int`?"**
5. **"¿Cómo lees un número entero y una línea de texto desde el teclado sin que el texto se quede vacío?"**

---

## 🤷 No hay preguntas tontas

> ❓ **¿Por qué a veces pongo `L` al final de un `long` y otras veces no?**

Porque depende del número. Si el número cabe en un `int` (máximo 2.147 millones), `long x = 100;` va sin `L` (Java lo promociona solo). Si supera ese límite, `long x = 3000000000;` necesita la `L` para que Java no intente meterlo en un `int` y se queje.

---

> ❓ **¿`Math.random()` es un método del objeto `Math`?**

No exactamente: `Math` es una **clase**, y `random()`, `pow()`, `round()`... son **métodos estáticos**. No creas ningún objeto de `Math`; llamas directamente `Math.random()`. Es la diferencia entre "llamar a la clase" y "llamar al objeto", que verás a fondo en la U08.

---

> ❓ **Si escribo `int nota = (int) 7.99;`, ¿me da 8 por redondeo?**

No. El casting **trunca**, no redondea: `(int) 7.99` da **7**. Para redondear de verdad usa `Math.round(7.99)`. El truncamiento corta con hacha; el redondeo negocia.

---

> ❓ **¿Puedo sumar un `String` y un número así, sin más?**

Sí: `"Resultado: " + 5` da `"Resultado: 5"`. Java convierte el número a texto y lo concatena. Eso se llama **concatenación**. El problema viene cuando te olvidas de los paréntesis: `"Suma: " + 5 + 3` da `"Suma: 53"`. ¡Los paréntesis son vida!

---

## 🎬 Poscréditos

El programador novato termina su cajero de billetes, lo compila y lo ejecuta. Funciona. Entonces se acerca CONRAD, el compilador cascarrabias, con cara de pocos amigos y una caja etiquetada `double` en la mano.

**CONRAD:** — Muy bonito tu cajero. Declaras variables, haces castings, lees del teclado... casi parece un programa de verdad. Pero hay un problema.

**Novato:** — ¿Qué problema?

**CONRAD:** — *señala el código con desprecio* Tu programa solo hace UNA cosa. La ejecutas y se acabó. Si el usuario quiere probar otro reintegro... ¿tiene que volver a ejecutar? Los programas de verdad **deciden** y **repiten**. Eligen entre caminos y dan vueltas hasta que se acaba la condición.

**Novato:** — ¿Y eso cuándo se aprende?

**CONRAD:** — *sonríe malvado* La próxima parada. Ya te veo escribiendo tu primer `if`... y tu primer bucle infinito. Espérame, que yo estaré ahí para reírme.

El novato guarda su proyecto, cierra el IDE y siente que el almacén de datos ya tiene dueño.

**PRÓXIMAMENTE EN U03:** Estructuras de control y excepciones. El momento en que tus programas dejan de hacer *una* cosa y empiezan a *decidir* y *repetir*. 🔀

---

📚 [Volver al índice de la unidad](/ApuntesProgramacion/02-variables-tipos-operadores) · **Anterior:** [09 · Métodos útiles de String](/ApuntesProgramacion/02-variables-tipos-operadores/09-metodos-string) · **Siguiente:** **[U03 · Estructuras de Control](/ApuntesProgramacion/03-estructuras-control-excepciones)**