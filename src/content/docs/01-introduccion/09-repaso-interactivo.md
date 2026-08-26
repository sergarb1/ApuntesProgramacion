---
title: "09 — Repaso interactivo: consolida lo aprendido"
description: El cierre práctico de la unidad, con chicha y un bug que no va a funcionar 😈
---

<p><small>El cierre práctico de la unidad, con chicha y un bug que no va a funcionar 😈</small></p>

> 🗺️ **Estás en:** 🚀 **U01 · Introducción a Java** → 09 · Repaso interactivo

---

## 📬 La idea en una frase

> **En este punto no aprendemos nada nuevo: lo convertimos todo en práctica. Y, como siempre, algo no va a funcionar.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaban de darte este programa para ejecutar:*

```java
public class Misterio {
    public static void main(String[] args) {
        System.out.println("Café " + 1 + 2);
        System.out.println("Café " + (1 + 2));
    }
}
```

**¿Qué imprimes por pantalla? Elige sabiamente:**

1. **`Café 3` y `Café 3`** → La JVM siempre suma los números, ocurra lo que ocurra. ❌
2. **`Café 12` y `Café 3`** → ✅ ¡Correcto! En la primera línea, al ver texto antes del `+`, Java concatena: `"Café " + 1` es `"Café 1"` y luego `+ 2` da `"Café 12"`. En la segunda, los paréntesis fuerzan la suma primero: `Café 3`.
3. **`Café 1 2` y `Café 12`** → Los paréntesis no existen para la JVM. ❌

> <details>
> <summary>🔄 Solución</summary>
>
> La opción **2**. Cuando un `+` mezcla texto y números, Java concatena (une cadenas). Los paréntesis `(1 + 2)` obligan a sumar primero. Este es el clásico que separa a los que han hecho la unidad de los que han dormido.
>
> </details>

---

## 🔥 Fireside Chat: JDK vs JRE

> *Dos veteranos del café discuten junto a la taza humeante.*

**JRE:** — Mira, yo soy el entorno de ejecución. Traigo la JVM, las librerías, todo lo necesario para *ejecutar* Java. Sin mí, tu `.class` no se ejecuta ni de coña.

**JDK:** — Ejecutar, ejecutar... ¿Y quién crea el `.class`? Yo. Traigo el compilador `javac`, el `javadoc`, el `jar`... Yo soy el kit completo. Tú eres solo la mitad servida.

**JRE:** — Oye, que sin mí tú eres un catálogo de herramientas sin enchufar. Compilas un programa y... ¿dónde lo ejecutas? En mi casa.

**JDK:** — *sarcástico* Ah, claro, como si yo no te llevara dentro. Cuando instalo yo, vienes tú incluido. Eres como el regalo que se incluye en el pack grande.

**JRE:** — Vale, pero para el usuario final que solo quiere *usar* programas Java, ¿a quién llaman? ¡A mí! Soy más ligero, menos complejo.

**JDK:** — Y sin compilador. O sea, un cocinero sin receta. Hablaremos cuando quieras *crear* algo.

**JRE:** — *suspiro* Siempre el mismo argumento.

> La lección: el **JDK incluye al JRE**. Para crear programas necesitas el JDK. Para ejecutarlos ya instalados, te basta el JRE. Nunca te pongas del lado de uno solo en un examen.

---

## 🕵️ ¿Quién soy?

Adivina qué concepto de la unidad soy:

1. **Traduzco tu código `.java` a bytecode. Soy un profesor de lengua muy puntilloso: cualquier coma mal puesta me ofende.**
2. **Soy la máquina de café: ejecuto el bytecode y funciono igual en cualquier sistema operativo.**
3. **Soy la puerta de entrada de tu programa. Si cambio mi nombre, Java no encuentra la entrada y todo se queda a oscuras.**
4. **Soy el detective del IDE: te dejo parar el programa donde quieras y espiar las variables.**

<details>
<summary>🔄 Respuestas</summary>

1. **El compilador (`javac`)** — Traduce `.java` a `.class` y odia los errores de sintaxis.
2. **La JVM** — La Java Virtual Machine, igual en cualquier plataforma.
3. **El método `main`** — `public static void main(String[] args)` es el botón de inicio exacto que Java busca.
4. **El depurador** — Con breakpoints, Step Over/Into y Watch.

</details>

---

## 🤬 CONRAD VS EL MUNDO: "El compilador me odia"

> *CONRAD, nuestro compilador cascarrabias, opina sobre el clásico del novato.*

**CONRAD:** — ¡OTRA VEZ! Viene un alumno y me dice: *CONRAD, no compila*. Y yo: vale, ¿qué dice el error? *Pues no sé, no lo he leído.* ¡Ay, madre mía! Te doy la línea exacta, el motivo y hasta la flechita `^` señalando el sitio, ¿y no lo lees? Es como quejarse de que la sopa está fría sin mirarla. 

*Y luego está el clásico:* `Public` con mayúscula. ¿POR QUÉ? La palabra es `public`. Con minúscula. Así, pequeñita. Llevo 25 años compilando y sigo viendo `Public`, `String` sin la S... ¡Y las clases que no coinciden con el nombre del archivo! ¡Si lo pide el propio archivo!

**La lección:** antes de llorar sobre el teclado, **lee el mensaje de error**. Archivo, línea, motivo. El 90% de los errores del novato se arreglan solos con esa información. El compilador no te odia: te está pasando las respuestas del examen.

---

## ⚡ Laboratorio de tortura: el programa que no arranca

> **Duración estimada:** 30 minutos
> **Herramienta:** tu IDE y un archivo nuevo

**El escenario:** copia este programa en tu IDE y haz que funcione. Tiene **3 errores** que impiden que compile y 1 error de lógica que hace que el resultado sea incorrecto cuando lo arregles.

```java
public class Tortura
    public static void main(string[] args) {
        int a = 3;
        int b = 4;
        System.out.println("La suma es: " + a + b)
        System.out.println("El producto es: " + (a * b));
    }
}
```

**Fallo intencionado:** uno de los errores parece correcto a simple vista porque "se ve bien", pero cambia por completo la salida del programa.

**Tu tarea:** conseguir que compile, que ejecute y que **toda** la salida sea correcta. Si el resultado no cuadra, diagnostica.

**Pistas para cuando te frustres (no antes):**

1. ¿Hay algún `;` que falte? *no → sigue buscando.*
   <details><summary>¿Y si sigo atascado?</summary>Comprueba también las llaves `{}`: la clase necesita su apertura.</details>
2. ¿Compila ya? *no → mira el mensaje de error y las mayúsculas.*
   <details><summary>¿Y si sigo atascado?</summary>`string` debe ser `String`, y `public` va en minúscula.</details>
3. ¿Ejecuta pero la suma sale rara? *Es el error de lógica: el `+` sin paréntesis concatena en vez de sumar.*
   <details><summary>Solución final</summary>

```java
public class Tortura {
    public static void main(String[] args) {
        int a = 3;
        int b = 4;
        System.out.println("La suma es: " + (a + b));
        System.out.println("El producto es: " + (a * b));
    }
}
```

Salida correcta: `La suma es: 7` y `El producto es: 12`.

</details>

---

## 🏆 Logros de esta unidad

| Logro | Cómo conseguirlo |
|---|---|
| 🏅 **El Café de la Mañana** | Explicar JVM, JRE y JDK con la analogía de la cafetería sin mirar |
| 🏅 **Primer Grito** | Ejecutar tu Hola Mundo sin ayuda en el IDE |
| 🏅 **Detective de Bugs** | Encontrar los 3+1 errores del Laboratorio sin usar las pistas |
| 🏅 **Atajo Pro** | Escribir un programa usando solo `psvm` + `sout` y atajos |
| 🏅 **Traductor** | Generar la documentación Javadoc de una clase tuya y abrir los HTML |

---

## 🧠 Atrévete a pensar

1. **Sin ejecutar:** ¿qué imprime este programa?

```java
public class Misterio2 {
    public static void main(String[] args) {
        System.out.print("Uno ");
        System.out.println("Dos");
        System.out.print("Tres");
    }
}
```

2. **El saludo que no saluda:** en el ejemplo `Saludos` del punto 3, ¿cómo harías para que `saludo()` también se ejecutara, sin cambiar el método en sí?
3. **El detective del IDE:** tu programa "funciona" pero imprime `La suma es: 34` en vez de `7`. ¿Qué herramienta usas y qué líneas examinas primero?
4. **Verdadero o falso:** "`javac` y `java` hacen lo mismo: el primero es para Windows y el segundo para Linux."

<details>
<summary>💡 Soluciones</summary>

1. `Uno Dos` en una línea y `Tres` en la siguiente (sin salto después de "Tres"). `print` no salta de línea, `println` sí.
2. Añadiendo la llamada dentro del `main`: `saludo();` después del primer `println`. Solo se ejecuta lo que se llama desde `main`.
3. El **depurador**: pon un breakpoint en la línea de la suma y observa con Step Over cómo se concatena `"La suma es: " + 3` → `"La suma es: 3"` y luego `+ 4` → `"La suma es: 34"`. La solución es `(a + b)`.
4. **Falso.** `javac` compila (`.java` → `.class`) y `java` ejecuta (la JVM ejecuta el `.class`). Ambos sirven en cualquier sistema.

</details>

---

## 🧩 Crucigrama de bits

```
Horizontal:
1. Entorno de Desarrollo Integrado (3 letras)
3. El método que Java busca al arrancar (4 letras)
5. Kit completo para crear programas (3 letras)
6. Código intermedio que entiende la JVM (8 letras)

Vertical:
2. Máquina virtual que ejecuta el bytecode (3 letras)
4. Imprime texto sin saltar de línea (5 letras)
```

<details>
<summary>📝 Soluciones</summary>

**Horizontal:** 1. IDE · 3. MAIN · 5. JDK · 6. BYTECODE
**Vertical:** 2. JVM · 4. PRINT

</details>

---

## 💬 Preguntas de entrevista de trabajo

> Preguntas reales que te harían para programador Java junior.

1. **"Explícame, como si yo fuera tu abuela, la diferencia entre JDK, JRE y JVM."**
2. **"¿Qué es el método `main` y por qué tiene esa firma exacta?"**
3. **"Un programa compila pero hace lo que no debe. ¿Cuál es tu proceso para arreglarlo?"**
4. **"¿Qué es un array y qué pasa si accedes a un índice que no existe?"**
5. **"¿Cómo le pasas datos a un programa Java sin que te los pida por teclado?"**

---

## 🤷 No hay preguntas tontas

> ❓ **¿Puedo escribir Java en un bloc de notas o necesito sí o sí un IDE?**

Puedes, y de hecho es un buen ejercicio: `notepad MiPrograma.java`, `javac MiPrograma.java`, `java MiPrograma`. Pero el IDE te ahorra errores tontos con el autocompletado y te da el depurador. Los pros usan IDE; los masoquistas, bloc de notas.

---

> ❓ **¿Por qué el primer `println` de Hola Mundo tenía "args" si no lo uso?**

`String[] args` es obligatorio en la firma del `main` aunque no lo uses. Java lo espera sí o sí. Es como la firma en un contrato: está aunque no se ejecute esa cláusula. En el punto 6 viste cómo usarlo.

---

> ❓ **¿Java y JavaScript son primos?**

No, ni siquiera son del mismo planeta. Java es a JavaScript como un perro es a un perrito caliente. El nombre fue una estrategia de marketing de Netscape para montarse en el boom de Java.

---

## 🎬 Poscréditos

El programador novato termina su primer programa, lo compila y lo ejecuta. Todo perfecto. Entonces se acerca CONRAD, el compilador cascarrabias, con cara de pocos amigos y una taza humeante en la mano.

**CONRAD:** — Muy bonito el Hola Mundo. ¿Y ahora qué? ¿Vas a imprimir texto toda tu vida? Los programas de verdad *guardan* datos, *calculan* y *deciden*. Sin variables, sin tipos, sin operadores... esto es un triler de cartas.

**Novato:** — ¿Y eso cuándo se aprende?

**CONRAD:** — *toma un sorbo* La próxima parada. Ya te veo declarando tu primer `int`... y cometiendo tu primer error de tipos. Espérame, que yo estaré ahí para reírme.

El novato guarda su proyecto, cierra el IDE y siente que esto solo acaba de empezar.

**PRÓXIMAMENTE EN U02:** Variables, tipos de datos y operadores. El momento en el que tus programas dejan de decir "Hola" y empiezan a *calcular*. 🔤

---

📚 [Volver al índice de la unidad](/ApuntesProgramacion/01-introduccion) · **Anterior:** [08 · El IDE y tu flujo de trabajo](/ApuntesProgramacion/01-introduccion/08-ide-flujo-trabajo) · **Siguiente:** **[U02 · Variables, Tipos y Operadores](/ApuntesProgramacion/02-variables-tipos-operadores)**