---
title: "07 — El compilador y sus errores"
description: "Compilar vs ejecutar, errores típicos del principiante ⚠️"
---

<p><small>Compilar vs ejecutar, errores típicos del principiante ⚠️</small></p>

> 🗺️ **Estás en:** 🚀 **U01 · Introducción a Java** → 07 · El compilador y sus errores

---

**El compilador no te odia: es un profesor de lengua puntillós que marca cada coma mal puesta. Aprender a leer sus mensajes es aprender a programar.**

Toda tu carrera estará llena de mensajes de error. Los aprendices los temen; los profesionales los leen como quien lee una carta. En este punto aprenderás a entender qué te dice `javac` (y por qué Java es tan puntillós).

---

## 🔍 Compilar ≠ ejecutar

Dos momentos distintos, dos familias de errores:

| Momento | Comando | Qué ocurre |
| --- | --- | --- |
| **Compilar** | `javac MiPrograma.java` | El compilador traduce tu código a bytecode. Si hay errores de sintaxis, se queja aquí. |
| **Ejecutar** | `java MiPrograma` | La JVM ejecuta el bytecode. Aquí pueden aparecer errores de runtime (en tiempo de ejecución). |

```
Tu código (.java)  --javac-->  bytecode (.class)  --java-->  salida
       (errores de compilación aquí)                (errores de ejecución aquí)
```

- **Errores de compilación**: el compilador detecta que has escrito mal alguna cosa. Te dice la **línea exacta** y el motivo. No se genera el `.class`.
- **Errores de ejecución (runtime)**: el programa compila, pero explota al correr (por ejemplo, `ArrayIndexOutOfBoundsException` del punto 6).
- **Errores de lógica**: todo "funciona", pero el resultado es incorrecto. El más peligroso: ni el compilador ni el runtime te avisan. Aquí entra el depurador del punto 4.

---

## 😤 El error del aprendiz: 4 errores en un programa

Este código está fatal. Encuentra los 4 errores antes de mirar la solución:

```java
Public class Calculadora
public static void main(string[] args) {
    System.out.println("Suma: " + 5 + 3)
    System.out.println("Resta: " + (5 - 3));
} }
```

### 🔄 Los 4 errores

1. `Public` debería ser **`public`** (minúscula). Java es sensible a las mayúsculas.
2. Falta **`{`** después de `Calculadora`. La clase necesita su llave de apertura.
3. `string[] args` debería ser **`String[] args`** (la S mayúscula importa: `String` es una clase, no existe `string`).
4. Falta el **`;`** al final de la primera línea del `println`.

Java es muy puntillós, como un profesor de lengua con las comas: `public`, `String` y `System` empiezan en mayúscula o mayúsculas concretas, y cada frase termina en `;`.

---

## 🔎 Cómo leer un mensaje de error de javac

Cuando algo no compila, `javac` te muestra algo así:

```
Calculadora.java:3: error: ';' expected
System.out.println("Suma: " + 5 + 3)
                                  ^
1 error
```

Tres datos clave:

1. **"Calculadora.java:3"** → el archivo y la **línea** donde está el problema (mira la `^`).
2. **"error: ';' expected"** → el *qué*: esperaba un punto y coma.
3. **El "^"** → el punto exacto donde se ha atascado.

💡 **Consejo:** el error suele estar en la línea marcada, pero a veces es la **anterior**: si falta un `{` o un `;`, javac a veces se da cuenta una línea más tarde. Empieza mirando la línea de la `^` y, si no, sube una.

---

## 🚨 Errores típicos del aprendiz (y su remedio)

| Error | Mensaje típico | Remedios |
| --- | --- | --- |
| **Public en lugar de public** | `class, interface, or enum expected` | Los nombres y palabras clave en Java son exactos: `public`, `class`, `String`, `System`. |
| **Falta ;** | `';' expected` | Toda instrucción u orden en Java debe terminar obligatoriamente en `;`. |
| **Falta { o }** | `reached end of file while parsing` o `class, interface...` | Comprueba que cada llave de apertura `{` tenga su correspondiente llave de cierre `}`. |
| **string en lugar de String** | `cannot find symbol` | `String` es una clase y siempre se escribe con la S inicial mayúscula. |
| **Nombre de clase diferente del archivo** | `class X is public, should be declared in a file named X.java` | La clase public tiene que tener exactamente el mismo nombre que el archivo `.java` (respetando mayúsculas y minúsculas). |
| **system en lugar de System** | `cannot find symbol: variable system` | `System` va con S mayúscula, mientras que `out` y `println` van en minúsculas. |

🧠 **Truco de memoria:** los nombres de las *clases* (`String`, `System`, `Scanner`...) empiezan en mayúscula; los nombres de *variables y métodos* (`out`, `println`, `main`) en minúscula. Cuando dudes, mira cómo lo escribió Java.

---

## 🧩 EL LÍO: el código revuelto

Tu jefe ha dejado este código hecho un desastre. Las líneas están revueltas. ¿Eres capaz de ordenarlas para que sea un programa Java válido que imprima "La suma es: 8"?

```
System.out.println("La suma es: " + (a + b));

int a = 5;

public class CalculoLioso {

System.out.println("Calculando...");

public static void main(String[] args) {

int b = 3;
```

**Pista**: busca primero dónde empieza la clase y el método `main`.

### 🔄 Solución

```java
public class CalculoLioso {
    public static void main(String[] args) {
        int a = 5;
        int b = 3;
        System.out.println("Calculando...");
        System.out.println("La suma es: " + (a + b));
    }
}
```

La clase es el contenedor, el main es la puerta de entrada, las instrucciones van dentro del main, en orden. Como una receta: los ingredientes se declaran antes de usarlos.

---

## 🎯 Mini-comprobación

1. ¿Qué significa `Calculadora.java:3: error: ';' expected`?
2. ¿Por qué `Public` (con P mayúscula) da error?
3. ¿Cuál es la diferencia entre un error de compilación y uno de lógica?

**🔄 Respuestas**

1. Que en el archivo `Calculadora.java`, en la línea 3, `javac` esperaba un `;` y no lo encontró (mira la `^`).
2. Porque Java es sensible a las mayúsculas: la palabra reservada es `public`, en minúscula exacta.
3. El de compilación impide generar el `.class` (lo detecta `javac`). El de lógica compila y ejecuta, pero el resultado es incorrecto: nadie te avisa, solo el depurador (o el sentido común).

---

## ✅ Resumen en 3 frases

1. Compilar (`javac`) y ejecutar (`java`) son momentos distintos con errores distintos.
2. El mensaje de error te dice **archivo, línea y motivo**: aprende a leerlo en vez de temerlo.
3. Los fallos clásicos (mayúsculas, `;`, `{}`, nombre de la clase) se corrigen con un vistazo... una vez que sabes qué mirar.

---

## 🐛 Vocabulario rápido

| Término | Idea general |
| --- | --- |
| **Compilar** | Traducir el código fuente (`.java`) a bytecode (`.class`) que entiende la JVM. |
| **Error de compilación** | El compilador detecta un fallo de sintaxis y se niega a generar el bytecode. |
| **Error de runtime** | El programa compila bien, pero falla o se bloquea durante la ejecución. |
| **Error de lógica** | El programa se ejecuta sin errores, pero el resultado no es el que se esperaba. |
| **Sensible a mayúsculas** | Java distingue mayúsculas de minúsculas (Case-sensitive): "Public" no es lo mismo que "public". |
