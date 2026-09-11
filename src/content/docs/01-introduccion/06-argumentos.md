---
title: "06 — Argumentos de línea de órdenes"
description: "El array args, cómo leerlo y usarlo 📬"
---

<p><small>El array args, cómo leerlo y usarlo 📬</small></p>

> 🗺️ **Estás en:** 🚀 **U01 · Introducción a Java** → 06 · Argumentos de línea de órdenes

---

**El parámetro "args" del "main" es un bolsillo donde Java mete todo lo que escribas después del nombre de tu programa al ejecutarlo.**

Cuando escribes `java MiPrograma hola mundo`, esas palabras sueltas (`hola`, `mundo`) no son casuales: Java las guarda en el array `args` para que tu programa las pueda usar.

---

## 🎒 ¿Qué es "args"?

Recuerda la firma del main:

```java
public static void main(String[] args)
```

`String[] args` significa: "un array de cadenas de texto llamado args". Un array es una lista de cosas (las verás a fondo más adelante en el curso). Aquí, la lista contiene **cada palabra que escribiste después del nombre de la clase al ejecutar**.

```java
public class UsoDeArgumentos {
    public static void main(String[] args) {
        System.out.println("Has escrito " + args.length + " palabras:");
        for (int i = 0; i < args.length; i++) {
            System.out.println("Palabra " + (i + 1) + ": " + args[i]);
        }
    }
}
```

Si ejecutas:

```bash
> java UsoDeArgumentos Java mola mucho
```

Verás:

```
Has escrito 3 palabras:
Palabra 1: Java
Palabra 2: mola
Palabra 3: mucho
```

---

## 🔢 Cómo se indexan las palabras

En Java, las listas empiezan a contar en 0, como casi todo en programación:

| Índice | Valor |
| --- | --- |
| `args[0]` | "Java" |
| `args[1]` | "mola" |
| `args[2]` | "mucho" |
| `args.length` | 3 (cuántos hay en total) |

- `args.length` te dice cuántos argumentos se han pasado (en este ejemplo, 3).
- `args[0]` es el primer elemento, `args[1]` el segundo... y así sucesivamente.
- Si ejecutas el programa sin argumentos, `args.length` valdrá 0 y el array estará vacío.

⚠️ **Advertencia:** cuidado con el error del aprendiz: `args[0]` es el **primer** argumento, no "el argumento número 0". El **primer** cuenta como índice 0. Es como las plantas de un edificio: la baja es la 0.

---

## 🧠 ¿Para qué sirve pasar argumentos?

Pasar argumentos por línea de órdenes es la forma más antigua y directa de "configurar" un programa sin tocar el código:

- **Datos de entrada**: `java Calculadora 5 3` → tu programa recibe 5 y 3.
- **Modos de ejecución**: `java App --verbose` o `java App --silencioso`.
- **Archivos**: `java Convertidor entrada.txt salida.txt`.
- **Programas reales**: los comandos de la terminal (como `git status` o `ls -la`) son exactamente esto: programas que reciben argumentos.

En la práctica, el array `args` aparece cada vez que quieras que tu programa hable con "el mundo exterior" **antes** de arrancar. Más adelante usarás el `Scanner` (U02) para pedir datos durante la ejecución; los args son la vía de entrada **antes** de ejecutarse.

---

## 🏫 Ejemplo guiado: el programa que te saluda

Vamos a hacer que tu programa sepa tu nombre sin preguntarlo:

```java
public class SaludoPersonal {
    public static void main(String[] args) {
        if (args.length > 0) {
            System.out.println("Hola, " + args[0] + ". ¡Bienvenido al curso!");
        } else {
            System.out.println("Hola, desconocido. ¿Olvidaste tu nombre?");
        }
    }
}
```

Si ejecutas `java SaludoPersonal Sergi`, saluda a Sergi. Si ejecutas `java SaludoPersonal`, te recuerda que no pasaste argumentos. El `if` aquí es un aperitivo de las estructuras de control que se verán en futuras unidades.

💡 **Detalle práctico:** cuando ejecutas desde el IDE (botón ▶), puedes configurar los argumentos en el menú *Run → Edit Configurations → Program arguments*. Escribe ahí `Sergi 20` y pulsa Run: tu programa los recibirá igual que si los teclearas en la terminal.

---

## 🎯 Mini-comprobación

1. Si ejecutas `java MiPrograma uno dos tres`, ¿cuánto vale `args.length` y qué contiene `args[2]`?
2. ¿Qué pasa si accedes a `args[5]` cuando solo hay 3 argumentos?
3. ¿Cómo saludas a la primera palabra que reciba tu programa?

**🔄 Respuestas**

1. `args.length` vale **3** y `args[2]` contiene "tres" (los índices empiezan en 0).
2. Explotará con `ArrayIndexOutOfBoundsException`: estás pidiendo un elemento que no existe.
3. Con `args[0]`, por ejemplo: `System.out.println("Hola, " + args[0]);`.

---

## ✅ Resumen en 3 frases

1. `args` es el array de cadenas que Java crea con todo lo que escribes después del nombre de tu clase.
2. Los índices empiezan en **0**: `args[0]` es el primer argumento y `args.length` dice cuántos hay.
3. Los argumentos son la forma de dar **datos de entrada** a un programa antes de que arranque.

---

## 🐛 Vocabulario rápido

| Término | Idea general |
| --- | --- |
| **Argumento** | Una palabra o valor que le pasas al programa en el momento de ejecutarlo. |
| **args** | El array (lista) de cadenas de texto donde Java guarda todos los argumentos recibidos. |
| **Array** | Una estructura de datos que guarda una lista de elementos ordenados y numerados desde 0. |
| **args.length** | La propiedad que indica la cantidad total de argumentos que tiene el array. |
| **Línea de órdenes** | La ventana de terminal o consola donde escribes comandos como `java`, para ejecutar programas. |
