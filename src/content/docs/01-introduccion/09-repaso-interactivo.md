---
title: "09 — Repaso"
description: "Sé el Código, Fireside, Quién Soy, Laboratorio, Crucigrama… 🧩"
---

<p><small>Sé el Código, Fireside, Quién Soy, Laboratorio, Crucigrama… 🧩</small></p>

> 🗺️ **Estás en:** 🚀 **U01 · Introducción a Java** → 09 · Repaso

---

**En este punto no aprendemos nada nuevo: lo convertimos todo en práctica. Y, como siempre, algo no funcionará.** 😈

---

## ⭐ Intenta pensar como el código, *my friend*...

Eres la JVM. Acaban de darte este programa para ejecutar:

```java
public class Misterio {
    public static void main(String[] args) {
        System.out.println("Café " + 1 + 2);
        System.out.println("Café " + (1 + 2));
    }
}
```

**¿Qué imprimes por pantalla? Elige sabiamente:**

1. **Café 3 y Café 3** → La JVM siempre suma los números, pase lo que pase. ❌
2. **Café 12 y Café 3** → En la primera línea, al encontrar texto antes del `+`, Java concatena de izquierda a derecha: "Café " + 1 es "Café 1", y luego + 2 da "Café 12". En la segunda línea, los paréntesis fuerzan la suma aritmética primero: (1 + 2) = 3, dando "Café 3".
3. **Café 1 2 y Café 12** → Los paréntesis no existen para la JVM. ❌

### 🔄 Solución

La opción 2. Cuando un operador `+` mezcla texto y números, Java concatena (une cadenas). Sin embargo, los paréntesis `(1 + 2)` obligan a realizar primero la suma aritmética. Este es el clásico ejercicio que separa los que han trabajado la unidad de los que han dormido.

---

## 🔥 Fireside Chat: JDK vs JRE

Dos veteranos del café discuten al lado de la taza humeante.

- **JRE**: — Mira, yo soy el entorno de ejecución (Java Runtime Environment). Llevo la JVM, las bibliotecas, todo lo necesario para ejecutar Java. Sin mí, tu `.class` corre ni de broma.
- **JDK**: — Ejecutar, ejecutar... ¿Y quién crea el `.class`? Yo. Llevo el compilador `javac`, el generador de Javadoc, la herramienta `jar`... Yo soy el kit completo de desarrollo (Java Development Kit). Tú eres solo la mitad servida.
- **JRE**: — Oye, que sin mí tú eres un catálogo de herramientas sin enchufar. Compilas un programa y... ¿dónde lo ejecutas? ¡En mi casa!
- **JDK**: (Sarcástico) — ¡Ah, claro! Como si yo no te trajera dentro. Cuando me instalan a mí, tú vienes incluido. Eres como el regalo que viene en el pack grande.
- **JRE**: — De acuerdo, pero para el usuario final que solo quiere usar aplicaciones Java ya hechas, ¿a quién llaman? ¡A mí! Soy más ligero y ocupo menos espacio.
- **JDK**: — Y sin compilador. O sea, un cocinero sin cuchillos. Hablaremos cuando quieras crear algo.
- **JRE**: (Suspiro) — Siempre el mismo argumento...

💡 **La lección:** El JDK incluye el JRE. Para programar y crear proyectos necesitas el JDK. Para ejecutar programas en la máquina del usuario final, bastaría con el JRE. Nunca pienses que son opciones excluyentes en un examen.

---

## 🕵️ ¿Quién soy?

Adivina qué concepto de la unidad soy:

1. Traduce tu código `.java` a bytecode. Soy un profesor de lengua muy puntillós: cualquier coma o llave mal puesta me ofende.
2. Soy la máquina de café: ejecuto el bytecode y funciono igual en cualquier sistema operativo.
3. Soy la puerta de entrada de tu programa. Si cambian mi nombre, Java no encuentra el inicio y todo se queda a oscuras.
4. Soy el detective de VS Code: te dejo parar el programa donde quieras (breakpoints) y espiar las variables paso a paso.

### 🔄 Respuestas

1. El compilador (`javac`): Traduce `.java` a `.class` y detesta los errores de sintaxis.
2. La JVM (Java Virtual Machine): La máquina virtual que ejecuta el bytecode igual en cualquier plataforma.
3. El método `main`: `public static void main(String[] args)` es el punto de inicio exacto que busca Java.
4. El depurador (debugger): Con breakpoints, Step Over (`F10`), Step Into (`F11`) y el panel de variables.

---

## 🤬 CONRAD VS EL MUNDO: "El compilador me odia"

**CONRAD**, nuestro compilador cascarrabías, opina sobre el clásico de los principiantes:

**CONRAD**: — ¡OTRA VEZ! Viene un alumno y me dice: "CONRAD, no compila". Y yo le pregunto: "Vale, ¿qué dice el mensaje de error?". Y me responde: "Ah, no lo sé, no me lo he leído". ¡Ay, madre mía! Te doy la línea exacta, el motivo y hasta la flechita `^` señalando el lugar exacto, y no lo lees? ¡Es como quejarse de que la comida está caliente sin mirar el plato!

Y después está el clásico: `Public` con mayúscula. ¿POR QUÉ? La palabra clave es `public`. En minúscula. Hace décadas que compilo y todavía veo `Public`, `string` con minúscula en lugar de `String`... ¡Y las clases que no coinciden con el nombre del archivo! ¡Si lo pone claro en el error!

💡 **La lección:** Antes de llorar sobre el teclado, lee el mensaje de error. Archivo, línea y motivo. El 90% de los errores de los principiantes se arreglan solos consultando esa información. El compilador no te odia: te está pasando las respuestas del examen.

---

## ⚡ Laboratorio de Tortura: el programa que no arranca

- Duración estimada: 20–30 minutos
- Herramienta: VS Code y un archivo `.java` nuevo
- El escenario: Copia este programa en un archivo llamado `Tortura.java` y haz que funcione. Tiene 3 errores que impiden que compile y 1 error de lógica que hace que el resultado sea incorrecto cuando lo arregles.

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

### 🛠️ Tu tarea

Conseguir que compile, que se ejecute y que toda la salida sea correcta.

### 💡 Pistas (solo si te bloqueas)

1. ¿Falta alguna llave `{` de apertura en la clase?
2. ¿`string` va en mayúscula o minúscula?
3. ¿Falta algún `;` al final de la línea de la suma?
4. Cuando consigas ejecutarlo, ¿por qué la suma sale `34` en lugar de 7? Recuerda cómo funciona el operador `+` con cadenas de texto.

### 🔄 Solución del Laboratorio

```java
public class Tortura {
    public static void main(String[] args) {
        int a = 3;
        int b = 4;
        System.out.println("La suma es: " + (a + b)); // Paréntesis para forzar la suma
        System.out.println("El producto es: " + (a * b));
    }
}
```

Salida correcta por pantalla:

```
La suma es: 7
El producto es: 12
```

---

## 🏆 Logros de esta unidad

| Logro | Cómo conseguirlo |
| --- | --- |
| **🏅 El Café de la Mañana** | Hay que explicar la diferencia entre JVM, JRE y JDK con la analogía de la cafetería sin mirar los apuntes. |
| **🏅 Primer Grito** | Ejecutar tu primer `HolaMundo.java` desde VS Code sin ayuda. |
| **🏅 Detective de Bugs** | Encontrar los 3+1 errores del Laboratorio de Tortura sin mirar la solución. |
| **🏅 Atajo Pro** | Hay que escribir un programa en VS Code usando solo los atajos `main + Tab` y `sysout + Tab`. |
| **🏅 Traductor** | Documentar una clase con Javadoc (`/** ... */`) y entender las etiquetas `@param` y `@return`. |

---

## 🧠 Atréverte a pensar

1. Sin ejecutar, ¿qué imprime este programa?

```java
public class Misterio2 {
    public static void main(String[] args) {
        System.out.print("Uno ");
        System.out.println("Dos");
        System.out.print("Tres");
    }
}
```

2. El saludo que no saluda: En un programa donde tienes un método `public static void saludo()`, ¿cómo haces para que se ejecute si solo está definido fuera de `main`?

3. El detective de VS Code: Tu programa se ejecuta, pero imprime "La suma es: 34" en lugar de 7. ¿Qué herramienta piensas usar y cómo lo investigas?

4. Verdadero o falso: "javac y java hacen lo mismo: el primero es para Windows y el segundo para Linux."

### 💡 Soluciones a las preguntas

1. Imprime:

```
Uno Dos
Tres
```

(`print` no añade salto de línea al final, pero `println` sí. Después de "Tres" no hay salto).

2. Hay que añadir la llamada `saludo();` dentro del método `main`. En Java, solo se ejecuta automáticamente lo que se llama directa o indirectamente desde el método `main`.

3. Usas el depurador (`F5`): Pones un breakpoint en la línea del `println`, avanzas con `F10` (Step Over) y inspeccionas el panel lateral de variables. Verás cómo `"La suma es: " + 3` se convierte en `"La suma es: 3"` y luego `+ 4` da `"La suma es: 34"`. La solución es añadir paréntesis `(a + b)`.

4. Falso. `javac` es el compilador (`.java` → `.class`) y `java` es el ejecutor de la JVM. Ambos se utilizan en cualquier sistema operativo (Windows, Linux, macOS).

---

## 💬 Preguntas de entrevista de trabajo

Preguntas reales que te harían para programador Java júnior.

1. **"Explícame, como si fuera tu abuela, la diferencia entre JDK, JRE y JVM."**
2. **"¿Qué es el método `main` y por qué tiene esa firma exacta?"**
3. **"Un programa compila pero hace lo que no debe. ¿Cuál es tu proceso para arreglarlo?"**
4. **"¿Qué es un array y qué pasa si accedes a un índice que no existe?"**
5. **"¿Cómo le pasas datos a un programa Java sin que te los pida por teclado?"**

---

## 🤷 No hay preguntas tontas

❓ **¿Puedo escribir Java en un bloc de notas o necesito sí o sí un IDE?**

Puedes, y de hecho es un buen ejercicio: `notepad MiPrograma.java`, `javac MiPrograma.java`, `java MiPrograma`. Pero el IDE te ahorra errores tontos con el autocompletado y te da el depurador. Los profes usan IDE; los masoquistas, bloc de notas.

❓ **¿Por qué el primer `println` de Hola Mundo tenía "args" si no lo uso?**

`String[] args` es obligatorio en la firma del `main` aunque no lo uses. Java lo espera sí o sí. Es como la firma en un contrato: está aunque no se ejecute esa cláusula. En el punto 6 viste cómo usarlo.

❓ **¿Java y JavaScript son primos?**

No, ni siquiera son del mismo planeta. Java es a JavaScript como un perro es a un perrito caliente. El nombre fue una estrategia de marketing de Netscape para montarse en el boom de Java.

---

## 🎬 Poscréditos

El programador aprendiz acaba su primer programa, lo compila y lo ejecuta. Todo perfecto. Entonces se acerca CONRAD, el compilador cascarrabías, con cara de pocos amigos y una taza humeante en la mano.

**CONRAD:** — Muy bonito el Hola Mundo. ¿Y ahora qué? ¿Vas a imprimir texto toda la vida? Los programas de verdad *guardan* datos, *calculan* y *deciden*. Sin variables, sin tipos, sin operadores... esto es un triler de cartas.

**Aprendiz:** — ¿Y eso cuándo se aprende?

**CONRAD:** — *da un trago* La próxima parada. Ya te veo declarando tu primer `int`... y cometiendo tu primer error de tipo. Espérame, que yo estaré ahí para reírme.

El aprendiz guarda su proyecto, cierra el IDE y siente que esto solo acaba de empezar.
