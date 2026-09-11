---
title: "03 — Tu primer programa"
description: "Hola Mundo, estructura, el método main 💻"
---

<p><small>Hola Mundo, estructura, el método main 💻</small></p>

> 🗺️ **Estás en:** 🚀 **U01 · Introducción a Java** → 03 · Tu primer programa

---

*Programar es hablarle a un extraterrestre muy literal: si le dices "saluda", no lo hace. Tienes que decirle* cómo, *cuándo* y *por qué*.

El ordenador es tonto, pero preciso: no interpreta, **ejecuta**. Cada línea, en orden, sin saltarse ninguna. Tu primer programa va a gritar "¡Hola!" por la consola, y a partir de aquí todo es añadir más órdenes.

---

## 👋 Hola Mundo, el ritual de iniciación

Todo programador empieza por aquí. Es como el primer café de la mañana: no es opcional.

```java
public class HolaMundo {
    public static void main(String[] args) {
        System.out.println("¡Hola, Mundo! Llevo años esperando a que me crearas.");
    }
}
```

Compílalo (`javac HolaMundo.java`) y ejecútalo (`java HolaMundo`), o pulsa el botón ▶ de tu IDE. La consola dirá:

```
¡Hola, Mundo! Llevo años esperando a que me crearas.
```

---

## 🔬 Disección de Hola Mundo

Diseccionaremos esto como si fuera una rana en biología:

- **`public class HolaMundo`**: declaras una clase. Piensa que le dices a Java: "Oye, voy a crear una cosa que se llama HolaMundo". `public` significa que es accesible desde fuera y la clase tiene que llamarse igual que el archivo.
- **`public static void main(String[] args)`**: este es el **botón de inicio**. Cuando ejecutas el programa, Java busca esta línea y dice "¡por aquí se empieza!".
- **`System.out.println(...)`**: es **la voz** del programa. Le dices que grite algo por la consola. `print` imprime sin saltar de línea; `println` imprime y salta de línea.

```java
public class MiPrimerPrograma {
    public static void main(String[] args) {
        // Este es mi primer programa
        System.out.println("¡Holaaaa, mundo!");
        System.out.println("Estoy aprendiendo Java");
        System.out.println("Y me está gustando (de momento)");
    }
}
```

💡 **Detalle práctico:** cada instrucción termina con `;`. Es el punto final de cada frase. Sin él, el compilador piensa que la frase continúa y se enlaza. Los `{}` delimitan los bloques: los de la clase contienen la clase, los del main contienen las órdenes.

---

## 🗝️ ¿Por qué `public static void main(String[] args)`?

Parece un hechizo de Harry Potter. Desgranamos cada palabra:

| Palabra | Qué significa |
| --- | --- |
| **public** | Java puede encontrarlo desde fuera: el botón es visible |
| **static** | Puede llamarse sin necesidad de crear un objeto |
| **void** | No devuelve ningún valor: hace su trabajo y se calla |
| **main** | El nombre exacto que Java busca al arrancar. No vale otro |
| **String[] args** | Un bolsillo donde puedes meter argumentos al ejecutar (punto 6) |

El main es **obligatorio tal cual**. Si cambias `main` por `inicio`, Java no lo encuentra y el programa no hace nada.

---

## 🚪 El método que no se llama

Aquí va una de las trampas favoritas en los exámenes. Observa:

```java
public class Saludos {
    public static void main(String[] args) {
        System.out.println("¡Hola desde el método main!");
    }

    public static void saludo() {
        System.out.println("Esto nunca se ejecuta...");
    }
}
```

¿Se ejecutará correctamente? **Sí**, pero solo imprime la primera línea. El método `saludo()` existe, pero como nunca lo llamas desde `main`, se queda aquí haciendo el vago. Java solo ejecuta lo que está dentro del `main` (salvo que explícitamente llames otros métodos). El método `saludo()` es como un actor que tiene el guion aprendido, pero nunca sube al escenario.

🧠 **Truco de memoria:** `main` es la puerta de entrada de la casa. Puede haber muchas habitaciones (métodos), pero nadie entra por la ventana. Si no llamas a la puerta, las habitaciones se quedan vacías.

---

## ⭐ Intenta pensar como el código: tú eres la JVM

Serás Java por un momento. Toma papel y boli (o mentalmente). Te dan este código:

```java
public class Ordenador {
    public static void main(String[] args) {
        int x = 5;
        int y = 10;
        int z = x + y;
        System.out.println("El resultado es: " + z);
    }
}
```

Sigue los pasos como si fueras la JVM:

1. Encuentras la clase `Ordenador`.
2. Buscas el método `main` — aquí está.
3. Creas un espacio llamado `x` y metes un 5.
4. Creas `y` y metes un 10.
5. Creas `z`, sumas `x` e `y` (15), lo guardas.
6. Gritas por pantalla: "El resultado es: 15".

**🔄 Solución**

La salida es exactamente:

```
El resultado es: 15
```

Si tu respuesta es diferente, vuelve a empezar: el ordenador no interpreta, *ejecuta*, línea a línea.

---

## 🎯 Mini-comprobación

1. ¿Qué pasa si renombro `main` a `inicio`?
2. ¿Imprime lo mismo `System.out.print("Hola")` que `System.out.println("Hola")`?
3. ¿Por qué falta un `;` en el código de abajo? Señala el error:

```java
public class Erroneo {
    public static void main(String[] args) {
        System.out.println("Me falta algo")
    }
}
```

**🔄 Respuestas**

1. Java no encuentra la puerta de entrada: el programa compila (en algunos entornos) pero al ejecutar no hace nada, o da error. La firma tiene que ser exacta.
2. No. `print` no salta de línea; `println` sí. En pantalla se nota: `print("Hola")` seguido de `print("Mundo")` muestra `HolaMundo` pegado.
3. Falta el `;` al final de `System.out.println("Me falta algo")`. El compilador se quejará esperando el punto y coma.

---

## ✅ Resumen en 3 frases

1. Todo programa tiene una **clase** (contenedor) y un **método main** (puerta de entrada).
2. `System.out.println()` es la voz del programa y el **`";"`** es el punto final de cada frase.
3. La JVM ejecuta **línea a línea, en orden**: tú decides qué entra por la puerta.

---

## 🐛 Vocabulario rápido

| Término | Idea general |
| --- | --- |
| **Clase** | El contenedor del código (una "cosa" en Java) |
| **Método** | Un bloque de órdenes con nombre |
| **main** | El método que Java ejecuta al arrancar |
| **println** | Imprime texto y salta de línea |
| **Consola / Terminal** | La ventana de texto donde se imprime la salida del programa |
