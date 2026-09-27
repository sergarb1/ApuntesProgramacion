---
title: "08 · Be the Code"
description: "Refactoriza un programa de notas en casa, paso a paso, sin copiar soluciones: los verbos, las firmas y el main que se lee solo 🛠️"
---

<p><small>Refactoriza un programa de notas en casa, paso a paso, sin copiar soluciones: los verbos, las firmas y el main que se lee solo 🛠️</small></p>

> 🗺️ **Estás en:** 🔧 **U05 · Funciones y métodos** → 08 · Be the Code

---

## 📬 La idea en una frase

> **Este punto no tiene teoría nueva: tiene un programa de 30 líneas que debes trocear con tus manos. Solo pides pistas cuando te atasques de verdad.**

El programa de antes (todo en `main`) es tu taller de hoy. Tu misión: convertirlo en una orquesta de métodos sin cambiar lo que imprime. Si lo has hecho a mano, dominas la unidad entera.

---

## 🛠️ Tu punto de partida

```java
import java.util.Scanner;

public class InformeNotas {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        double suma = 0;
        boolean haySuspensa = false;

        for (int i = 0; i < 5; i++) {
            System.out.print("Nota " + (i + 1) + ": ");
            double nota = teclado.nextDouble();
            suma += nota;
            if (nota < 5) {
                haySuspensa = true;
            }
        }

        double media = suma / 5;
        System.out.println("Media: " + media);

        if (haySuspensa) {
            System.out.println("Hay suspensa: a por ello.");
        } else if (media >= 7) {
            System.out.println("¡Notaza!");
        } else {
            System.out.println("Aprobado con rodillas.");
        }
    }
}
```

Antes de escribir nada, responde en papel (en serio, en papel):

1. ¿Cuántos **verbos con nombre propio** ves? (pista: tres: leer, calcular, mostrar)
2. ¿Qué datos necesita cada uno y **qué devuelve** cada uno?
3. ¿Qué queda en `main` después de trocear?

---

## 🪜 Paso a paso (pistas que no regalan el final)

1. Crea `static double[] leerNotas(int cantidad)` debajo de `main`.
   <details><summary>🪶 Atascado?</summary>Usa un `Scanner` **dentro** del método, un `for` de `cantidad` vueltas y un array `double[] notas = new double[cantidad]`. Devuelve `notas` al final.</details>
2. Crea `static double calcularMedia(double[] notas)`.
   <details><summary>🪶 Atascado?</summary>Suma las notas en un bucle y divide entre `notas.length`. El array entra como parámetro; nada de variables globales.</details>
3. Crea `static boolean tieneSuspensa(double[] notas)`.
   <details><summary>🪶 Atascado?</summary>Bucle: si alguna nota es menor que 5, `return true` en el acto. Si el bucle acaba, `return false` (todos los caminos cierran).</details>
4. Crea `static void mostrarVeredicto(double media, boolean suspensa)`.
   <details><summary>🪶 Atascado?</summary>Los datos ya están calculados: este método solo **cuenta** el resultado. Dos parámetros, sin `return`.</details>
5. Reescribe `main` como resumen: leer → media → suspensa → mostrar.
   <details><summary>🪶 Atascado?</summary>Cuatro llamadas, cero bucles en `main`. Ejecuta y compara la salida con la original.</details>

<details>
<summary>🔄 Solución completa</summary>

```java
import java.util.Scanner;

public class InformeNotas {

    public static void main(String[] args) {
        double[] notas = leerNotas(5);
        double media = calcularMedia(notas);
        boolean suspensa = tieneSuspensa(notas);
        mostrarVeredicto(media, suspensa);
    }

    static double[] leerNotas(int cantidad) {
        Scanner teclado = new Scanner(System.in);
        double[] notas = new double[cantidad];
        for (int i = 0; i < cantidad; i++) {
            System.out.print("Nota " + (i + 1) + ": ");
            notas[i] = teclado.nextDouble();
        }
        return notas;
    }

    static double calcularMedia(double[] notas) {
        double suma = 0;
        for (int i = 0; i < notas.length; i++) {
            suma += notas[i];
        }
        return suma / notas.length;
    }

    static boolean tieneSuspensa(double[] notas) {
        for (int i = 0; i < notas.length; i++) {
            if (notas[i] < 5) {
                return true;
            }
        }
        return false;
    }

    static void mostrarVeredicto(double media, boolean suspensa) {
        System.out.println("Media: " + media);
        if (suspensa) {
            System.out.println("Hay suspensa: a por ello.");
        } else if (media >= 7) {
            System.out.println("¡Notaza!");
        } else {
            System.out.println("Aprobado con rodillas.");
        }
    }
}
```

</details>

> ⚠️ **Advertencia:** la salida debe ser **idéntica** antes y después. Si cambia, has movido una línea de más: vuelve al paso anterior (refactorizar es cambiar la forma, nunca el comportamiento).

---

## 🧪 El Lío: el refactor malogrado

Tu compañero refactorizó y ahora esto **no compila**:

```java
public class MalRefactor {
    public static void main(String[] args) {
        double m = media(3, 4, 5);
        System.out.println(m);
    }

    static void media(int a, int b, int c) {
        double resultado = (a + b + c) / 3.0;
        System.out.println(resultado);
    }
}
```

**Pistas (no mires la solución aún):**

1. ¿Qué quiere `main` hacer con el resultado de `media`?
2. ¿Qué tipo dice la firma que devuelve...?
3. ¿Qué pasa con el `println` de dentro: es oficio de `media` o de quien llama?

<details>
<summary>🔄 Solución</summary>

`main` intenta guardar en `double m` el resultado de un método `void`: `void cannot be converted to double`. Dos arreglos posibles; el correcto es:

```java
static double media(int a, int b, int c) {
    return (a + b + c) / 3.0;
}
```

y quitar el `println` de dentro (o dejarlo si `media` es de verdad "mostrar media"… pero entonces no se llamaría `media`). Calcula → devuelve; quien llama imprime.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué dos preguntas te haces de cada verbo antes de crear su método? (entradas y salidas)
2. ¿Por qué `leerNotas` devuelve `double[]` y no imprime las notas?
3. ¿Qué debe pasar si troceas bien y ejecutas?
4. ¿Cuál es la señal de que has troceado mal?

<details>
<summary>🔄 Respuestas</summary>

1. ¿Qué **parámetros** necesita? ¿Qué **retorno** tiene (o es `void`)?
2. Para que `main` decida después: calcular media, buscar suspensas… los datos viven más allá del leer.
3. La salida es idéntica al programa original.
4. Cambió el comportamiento, o `main` sigue con bucles dentro (no lo has convertido en resumen).

</details>

---

## ✅ Resumen en 3 frases

1. Trocear = **verbo → método** con firma clara, mover el código y dejar una llamada en `main`.
2. El `main` final se lee como un resumen: leer → calcular → mostrar, sin un solo `for`.
3. Refactorizar **nunca** cambia la salida: si cambia, se revierte el paso.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Refactorizar | Reorganizar sin cambiar el comportamiento |
> | Extraer método | Sacar un bloque a su propia función |
> | Resumen en `main` | Líneas que se leen como el plan del programa |
> | Firma clara | Nombre + parámetros + retorno que se entienden solos |
> | Antes/después | Prueba de que la refactorización fue limpia |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/05-funciones) · **Anterior:** [07 · Divide el problema](/ApuntesProgramacion/05-funciones/07-divide-problema) · **Siguiente:** [09 · Repaso interactivo](/ApuntesProgramacion/05-funciones/09-repaso-interactivo)
