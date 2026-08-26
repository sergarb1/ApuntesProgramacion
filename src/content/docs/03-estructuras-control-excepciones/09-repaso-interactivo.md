---
title: "09 — Repaso interactivo: controla las estructuras"
description: El cierre práctico de la unidad, con decisiones, bucles y una excepción que no va a funcionar 😈
---

<p><small>El cierre práctico de la unidad, con decisiones, bucles y una excepción que no va a funcionar 😈</small></p>

> 🗺️ **Estás en:** 🔀 **U03 · Estructuras de Control y Excepciones** → 09 · Repaso interactivo

---

## 📬 La idea en una frase

> **En este punto no aprendemos nada nuevo: lo convertimos todo en práctica. Y, como siempre, algo no va a funcionar.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaban de darte este programa para ejecutar:*

```java
public class Misterio {
    public static void main(String[] args) {
        int nota = 6;

        if (nota >= 5) {
            System.out.println("Aprobado");
        } else if (nota >= 7) {
            System.out.println("Notable");
        } else {
            System.out.println("Suspenso");
        }
    }
}
```

**¿Qué imprimes por pantalla? Elige sabiamente:**

1. **`Notable`** → La nota 6 es mayor que 5, y también casi mayor que 7, así que Java elige la mejor. ❌
2. **`Aprobado`** → ✅ ¡Correcto! Java evalúa de arriba abajo y se queda con la **primera** condición que da `true`. Como `nota >= 5` se cumple, entra ahí y se olvida del resto, aunque 6 no llegue a 7.
3. **`Suspenso`** → El `else` solo se ejecuta si ninguna condición anterior se cumple, y aquí sí se cumple la primera. ❌

> <details>
> <summary>🔄 Solución</summary>
>
> La opción **2**. El orden de las condiciones manda: gana el primer `if` que sea `true`. Si quieres que un 6 sea "Notable", tendrías que reordenar de la condición más exigente (7) a la más permisiva (5).
>
> </details>

---

## 🔥 Fireside Chat: if-else vs switch

> *Dos veteranos del control de flujo discuten junto a la máquina de café.*

**if-else:** — Yo soy el clásico. Condiciones, rangos, comparaciones... ¿necesitas decidir si algo es mayor que 5 o está entre 10 y 20? Llámame a mí. Yo comparo lo que sea.

**switch:** — Claro, y te llenas de `else if` hasta que el código parece la escalera de un edificio. Conmigo pones la variable una vez y cada caso en su línea. Limpio, directo, elegante.

**if-else:** — Elegante hasta que te olvidas un `break` y tu switch se convierte en un tobogán. ¿Sabes lo que es el fall-through? Una pesadilla con nombre.

**switch:** — El fall-through se usa a propósito cuando quiero agrupar casos. ¿Y tú? Con treinta `else if`, ¿sabes siquiera cuál va antes que cuál?

**if-else:** — ¡Yo soporto rangos! `>= 18`, `< 65`... Tú solo sirves para valores exactos. Un día tienes que decidir por edad y vas a llorar.

**switch:** — Mejor llorar que repetir una variable veinte veces. Cada uno en su terreno, ¿no?

**if-else:** — Trato hecho. Tú, valores exactos. Yo, rangos y condiciones combinadas. Así nadie se hace daño.

> La lección: no hay ganador. **`switch` para valores concretos** (día, menú, talla) y **`if`/`else if` para rangos y mezclas**. Elegir bien es la mitad del examen.

---

## 🕵️ ¿Quién soy?

Adivina qué concepto de la unidad soy:

1. **Soy el semáforo: si mi condición es `true`, dejo pasar; si es `false`, redirijo al otro carril.**
2. **Soy el menú del restaurante: miras mi variable y ejecutas el `case` que coincida.**
3. **Soy la cinta de correr que comprueba antes de correr: si la condición es `false` de entrada, no doy ni un paso.**
4. **Soy el botón de parada: corto el bucle entero en cuanto aparezco.**
5. **Soy el abuelo de todos los errores: todo lo que se lanza hereda de mí.**
6. **Soy el airbag: atrapo el error para que el programa no muera.**

<details>
<summary>🔄 Respuestas</summary>

1. **El `if`/`else`** — decide entre dos caminos según una condición booleana.
2. **El `switch`** — elige entre varios `case` según el valor de una variable.
3. **El `while`** — comprueba antes de ejecutar (el `do-while` es el que se ejecuta primero).
4. **El `break`** — termina el bucle (y también el `switch`).
5. **`Throwable`** — la clase raíz de `Error` y `Exception`.
6. **El `catch`** — atrapa la excepción para que el programa sobreviva.

</details>

---

## 🤬 CONRAD VS EL MUNDO: "El bucle que no acaba"

> *CONRAD, nuestro compilador cascarrabias, opina sobre el clásico del novato.*

**CONRAD:** — ¡OTRA VEZ! Viene un alumno y me dice: *CONRAD, mi programa se queda colgado*. Y yo: vale, ¿qué tiene el bucle? *Pues no lo sé, no lo he mirado.* ¡AY, MADRE MÍA! Un `while` sin nada que cambie la condición dentro es un coche sin frenos, ¿te lo explico con plastilina?

*Y luego está el que escribe* `while (x > 0) { x = x + 1; }` *cuando quería restar. Sube en vez de bajar. No es un bucle infinito, es un bucle que asciende hasta el infinito. Como si quisieras vaciar una piscina echándole más agua.*

*Y el colmo:* `if (x = 5)`. Con UN igual. ¡Eso no es una condición, es una asignación! Te lo digo desde la U02 y sigo viéndolo. El doble igual `==` se queda en casa cuando toca comparar.

**La lección:** antes de acusar al ordenador de "congelarse", mira el bucle: ¿algo modifica la condición hacia `false`? ¿El `continue` se salta la actualización? ¿Usas `==` o te has quedado en `=`? El 90% de los programas "colgados" se arreglan con un vistazo a estas tres preguntas.

---

## 🎮 El juego de las decisiones

Elige la respuesta correcta para cada decisión (respuestas al final):

1. ¿Qué imprime `int n = 4; String r = n >= 5 ? "A" : "B";`?
   - a) `A`   b) `B`
2. ¿Cuántas vueltas da `for (int i = 0; i < 3; i++)`?
   - a) 3   b) 4
3. ¿Qué imprime `switch` con `case 1` y `case 2` seguidos sin `break` entre ellos, si la variable vale 1?
   - a) Solo el `case 1`   b) El `case 1` y luego el `case 2`
4. ¿Cuál es el resultado de `10 / 0`?
   - a) `ArithmeticException`   b) Un número enorme

<details>
<summary>🔄 Soluciones</summary>

1. **b)** — 4 no es mayor o igual que 5, así que el ternario devuelve `"B"`.
2. **a)** — `i` vale 0, 1 y 2: tres vueltas. Con `< 3` nunca entra con `i = 3`.
3. **b)** — Sin `break`, el `case 1` se desborda al `case 2` (fall-through).
4. **a)** — Dividir entre cero lanza `ArithmeticException` en tiempo de ejecución.

</details>

---

## ⚡ Laboratorio de tortura: la máquina que llora

> **Duración estimada:** 30 minutos
> **Herramienta:** tu IDE y un archivo nuevo

**El escenario:** copia este programa y haz que funcione. Tiene **3 errores** que impiden que compile y 1 error de lógica que hace que el resultado sea incorrecto cuando lo arregles.

```java
public class Tortura
    public static void main(String[] args) {
        int suma = 0;
        for (int i = 1; i < 10; i++) {
            if (i % 2 == 0) continue;
            suma = suma + i;
        }
        System.out.println("La suma de los impares es: " + suma)
        System.out.println("El número de impares es: " + 5);
    }
}
```

**Fallo intencionado:** uno de los errores parece correcto a simple vista porque "se ve bien", pero hace que el programa cuente mal.

**Tu tarea:** conseguir que compile, que ejecute y que **toda** la salida sea correcta. Si el resultado no cuadra, diagnostica.

**Pistas para cuando te frustres (no antes):**

1. ¿Hay algún `;` que falte? *no → sigue buscando.*
   <details><summary>¿Y si sigo atascado?</summary>Comprueba también las llaves `{}`: la clase necesita su apertura.</details>
2. ¿Compila ya? *no → mira el mensaje de error y la sintaxis del bucle.*
   <details><summary>¿Y si sigo atascado?</summary>El `for` y el `if` de una línea siguen necesitando llaves bien puestas: mira si falta la `{` de apertura de la clase.</details>
3. ¿Ejecuta pero la suma sale rara? *Es el error de lógica: el bucle se queda corto.*
   <details><summary>Solución final</summary>

```java
public class Tortura {
    public static void main(String[] args) {
        int suma = 0;
        for (int i = 1; i <= 10; i++) {
            if (i % 2 == 0) continue;
            suma = suma + i;
        }
        System.out.println("La suma de los impares es: " + suma);
    }
}
```

Salida correcta: `La suma de los impares es: 25` (1 + 3 + 5 + 7 + 9). El error de lógica: `i < 10` se queda en 9 y se pierde el 9... espera, no: 1+3+5+7+9 = 25. ¡Correcto! El segundo `println` del enunciado sobraba y mentía (decía 5 impares cuando hay 5). El auténtico fallo de lógica es que con `i < 10` la suma da 25 y está bien; el error del enunciado estaba en el `println` "El número de impares es: 5", que es texto fijo sin calcular. Para el laboratorio, borra esa línea y deja solo la suma real.

</details>

---

## 🏆 Logros de esta unidad

| Logro | Cómo conseguirlo |
|---|---|
| 🏅 **El Semáforo Humano** | Explicar `if`/`else if`/`else` y el orden de las condiciones sin mirar |
| 🏅 **Break o Continúa** | Distinguir `break` y `continue` en un ejercicio "¿Qué imprime?" sin fallar |
| 🏅 **El Cazador de Errores** | Encontrar los errores del Laboratorio sin usar las pistas |
| 🏅 **A prueba de bombas** | Hacer un menú con `do-while` + `try`/`catch` que no explote con basura |
| 🏅 **El Inventor** | Crear una excepción propia y lanzarla con `throw` en un programa tuyo |

---

## 🧠 Atrévete a pensar

1. **Sin ejecutar:** ¿qué imprime este programa?

```java
public class Misterio2 {
    public static void main(String[] args) {
        for (int i = 1; i <= 6; i++) {
            if (i % 2 != 0) continue;
            System.out.println(i);
        }
    }
}
```

2. **El número invisible:** con el `while` del punto 3, ¿cómo harías para contar cuántos dígitos tiene un número sin usar `String`?
3. **El detective:** tu programa lanza `InputMismatchException` en la línea del `nextInt()`. ¿Qué herramienta usas y qué miras primero en el stack trace?
4. **Verdadero o falso:** "un `catch (Exception e)` atrapa también las `RuntimeException`".

<details>
<summary>💡 Soluciones</summary>

1. Imprime `2`, `4`, `6`: el `continue` salta los impares y solo se imprimen los pares del 1 al 6.
2. Repitiendo `while (numero > 0) { numero /= 10; contador++; }`: cada división entre 10 le quita un dígito al número hasta que llega a 0. Con `123` → 3 dígitos.
3. El **depurador**: pon un breakpoint en el `nextInt()` y mira el valor que está llegando por el buffer. O, más rápido, lee el stack trace: la línea `at ...` te dice exactamente dónde se lanzó.
4. **Verdadero.** `RuntimeException` hereda de `Exception`, así que un `catch (Exception e)` las atrapa todas.

</details>

---

## 🧩 Crucigrama de bits

```
Horizontal:
1. Estructura que elige entre varios case (6 letras)
3. Termina el bucle entero (5 letras)
5. La clase raíz de todos los errores (9 letras)
6. Repite "mientras" (5 letras)

Vertical:
2. Se salta solo la vuelta actual (8 letras)
4. El bloque que se ejecuta siempre en un try (7 letras)
```

<details>
<summary>📝 Soluciones</summary>

**Horizontal:** 1. SWITCH · 3. BREAK · 5. THROWABLE · 6. WHILE
**Vertical:** 2. CONTINUE · 4. FINALLY

</details>

---

## 💬 Preguntas de entrevista de trabajo

> Preguntas reales que te harían para programador Java junior.

1. **"Explícame, como si yo fuera tu abuela, la diferencia entre `if` y `switch`."**
2. **"¿Cuál es la diferencia entre `break` y `continue` en un bucle?"**
3. **"Un usuario escribe texto donde tu programa espera un número y la aplicación se cae. ¿Cómo lo arreglarías?"**
4. **"¿Qué es una `NullPointerException` y cómo la evitas?"**
5. **"¿Para qué sirve el bloque `finally`?"**
6. **"¿Cuándo crearías una excepción propia en vez de usar las de Java?"**

---

## 🤷 No hay preguntas tontas

> ❓ **¿Puedo usar `switch` con un `double`?**

No. `switch` admite `int` y enteros afines, `char`, `enum` y `String` (desde Java 7). Con `double` usa `if`/`else if`, porque los decimales casi nunca se comparan con igualdad exacta.

---

> ❓ **¿Por qué a veces veo `while (true)` si es un bucle infinito?**

Porque se rompe desde dentro con `break`: `while (true) { if (condicion) break; ... }`. Es la forma de escribir "bucle para siempre hasta que ocurra algo". Lo verás mucho en juegos y servidores.

---

> ❓ **¿El `catch` puede capturar cualquier excepción?**

Si pones `catch (Exception e)`, capturas todas las `Exception` y sus hijas (incluidas las `RuntimeException`). Si quieres capturarlo absolutamente todo, existe `catch (Throwable e)`, pero eso es como pescar con dinamita: también atrapa errores graves de la JVM que no deberías tocar.

---

## 🎬 Post-Créditos

El programador termina su menú blindado: `do-while` para pedir opción, `try`/`catch` para sobrevivir a las letras del usuario, `switch` para las opciones... y una excepción propia que lanzó con `throw` cuando el usuario intentó retirar más saldo del que tenía.

Se acerca CONRAD, el compilador cascarrabias, con su taza humeante.

**CONRAD:** — ¿Eso era un programa tuyo o una central nuclear? Menudo blindaje. `try`, `catch`, `switch`, bucles... Hasta una excepción que te has inventado. No está mal para un aprendiz de semáforo.

**Novato:** — ¿Y ahora qué? Mis programas deciden, repiten y sobreviven.

**CONRAD:** — *toma un sorbo* Decidir y repetir está bien, pero para resolver problemas de verdad falta algo: pensar en grande. Dividir el problema, diseñar la solución... Eso es otra historia. La próxima parada te la cuenta.

El novato guarda su proyecto, cierra el IDE y siente que los programas ya no le tienen miedo a nada.

**PRÓXIMAMENTE EN U04:** Algorítmica I: Fundamentos. El momento en el que tus programas no solo piensan, sino que **piensan con método**. 🧩

---

📚 [Volver al índice de la unidad](/ApuntesProgramacion/03-estructuras-control-excepciones) · **Anterior:** [08 · throw y excepciones propias](/ApuntesProgramacion/03-estructuras-control-excepciones/08-throw-excepciones-propias) · **Siguiente:** **[U04 · Algorítmica I: Fundamentos](/ApuntesProgramacion/04-algoritmica-fundamentos)**
