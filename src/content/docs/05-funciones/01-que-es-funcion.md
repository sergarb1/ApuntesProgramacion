---
title: "01 · ¿Qué es una función?"
description: "La receta con nombre que convierte el código repetido en una sola línea: por qué existe y qué demonios es un método 🔧"
---

<p><small>La receta con nombre que convierte el código repetido en una sola línea: por qué existe y qué demonios es un método 🔧</small></p>

> 🗺️ **Estás en:** 🔧 **U05 · Funciones y métodos** → 01 · ¿Qué es una función?

---

## 📬 La idea en una frase

> **Una función es una receta con nombre: recibe datos por la puerta, hace una cosa bien explicada y devuelve el resultado; tú solo llamas por su nombre.**

---

## 🍳 El problema: el párrafo infinito

Mira este `main` de un cuaderno de notas:

```java
public class Notas {
    public static void main(String[] args) {
        // Calcular la media de 3 notas
        double media = (8 + 7 + 9) / 3.0;
        System.out.println("Media 1: " + media);

        // Calcular la media de otras 3 notas... otra vez
        double media2 = (6 + 5 + 10) / 3.0;
        System.out.println("Media 2: " + media2);

        // Y mañana, con 30 alumnos, copiar y pegar 30 veces
    }
}
```

El cálculo está escrito **dos veces**. Si mañana cambias la fórmula (¿y si las notas tienen peso?), tendrás que buscar y arreglar todas las copias: una olvidada y el programa ya miente. Programar copiando y pegando es como cocinar repitiendo cada paso del recetario en voz alta en cada plato: funciona... hasta que tienes comensales.

> ⚠️ **Advertencia:** si alguna vez escribes `// Calcular la media` más de un programa en el mismo archivo, en algún lugar un programador senior vuelve a llorar. El código repetido no es código: es deuda con intereses.

---

## 📖 La receta con nombre

Una **función** (en jerga: un **método**) es exactamente eso: una receta con nombre en el recetario.

| Receta de cocina | Función en Java |
|---|---|
| El nombre ("Tortilla de patatas") | El **nombre** del método (`calcularMedia`) |
| Los ingredientes que te pasan | Los **parámetros** (los datos de entrada) |
| Los pasos dentro de la receta | El **cuerpo** (el código entre `{` y `}`) |
| El plato que sale | El **valor que devuelve** (o nada, si solo hace algo) |

Tú no recitas la receta entera cada vez: dices **"tortilla"** y la cocina trabaja. Con lo mismo: dices `calcularMedia(...)` y el programa ejecuta ese trozo de código en su sitio.

```java
double notaMedia = calcularMedia(8, 7, 9);
System.out.println("Media 1: " + notaMedia);
```

Dos líneas donde antes había tres... y lo mejor: la fórmula **solo está escrita una vez**. Cuando cambie, cambiará en un solo sitio.

---

## 🔧 ¿Función o método? (no, no es lo mismo... bueno, sí)

Curso honesto sobre la terminología:

- **Función** es el concepto general: entradas → proceso → salidas. En Python, JavaScript o C las llamas funciones.
- **Método** es esa misma idea **viviendo dentro de una clase**, que es donde vive todo en Java (ya lo viste en la U02: hasta `main` está dentro de una clase).

En la práctica, todo el mundo usa ambos nombres para lo mismo, y en este curso también lo haremos. Si en una entrevista te preguntan la diferencia, ahí tienes la respuesta exacta: **en Java, las funciones son métodos de una clase**.

> 💡 **Consejo:** "método" es la palabra que verás en la documentación de Java y en los errores del compilador. "Función" es la que oirás en las charlas. Saber las dos te salva de quedarte fuera de la conversación.

---

## 🧰 Qué gana tu programa al trocearlo

1. **No repites código.** La fórmula se escribe una vez y se usa 30 veces.
2. **Se lee mejor.** `mostrarMedia(...)` explica qué pasa; cinco líneas de aritmética a medias no.
3. **Se prueba por partes.** Puedes comprobar que `calcularMedia` funciona sin ejecutar el programa entero.
4. **Se repara sin miedo.** Arreglas el trozo roto (el método) y el resto no se entera.

Es el mismo instinto de la descomposición de la U01, pero esta vez con herramienta: antes **pensabas** el problema por partes; ahora el lenguaje te deja **escribir** cada parte por separado.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** el nombre del método es documentación. Un método llamado `hacerCosas` es una confesión; uno llamado `calcularIVA` es un plan.

**Ejercicio: el vidente de salidas**

```java
public class Vidente {
    static void saludar() {
        System.out.println("Hola, mundo");
    }

    public static void main(String[] args) {
        saludar();
        saludar();
    }
}
```

**¿Qué imprime?**

- (A) `Hola, mundo` una vez
- (B) `Hola, mundo` dos veces
- (C) Nada: los métodos no se ejecutan solos
- (D) Error de compilación

<details>
<summary>🔄 Solución</summary>

La **B**. `saludar()` se llama dos veces desde `main`, y cada llamada ejecuta su cuerpo: dos `Hola, mundo`. Un método no se ejecuta solo al declararlo: solo cuando alguien lo llama. (La C es la trampa clásica de "si está escrito, se ejecuta".)

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué tres cosas "típicas" tiene una función (según la tabla de la receta)?
2. ¿Se ejecuta el cuerpo de un método solo por estar escrito en el archivo?
3. ¿Es `main` una función? ¿Y `saludar()` de tu propio programa?
4. Menciona dos ventajas de trocear el código en métodos.

<details>
<summary>🔄 Respuestas</summary>

1. Un **nombre**, unas **entradas** (parámetros) y un **resultado** que devuelve (o nada).
2. No. Se ejecuta cuando alguien lo **llama**.
3. `main` es el método especial por el que arranca el programa; `saludar()` es un método normal. En Java, ambos son métodos (funciones dentro de una clase).
4. Cualquiera de: no repetir código, legibilidad, probar por partes, reparar sin romper el resto (y la cuarta corona: cambiar la fórmula en un solo sitio).

</details>

---

## ✅ Resumen en 3 frases

1. Una **función/método** es una receta con nombre: recibe datos, hace una cosa y devuelve algo (o no).
2. Su ventaja es **escribir una vez, usar muchas**: el código repetido desaparece y el cambio afecta a un solo sitio.
3. En Java todo método vive dentro de una clase, por eso "función" y "método" son la misma herramienta con dos nombres.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Función / Método | Receta con nombre: entradas → proceso → salida |
> | Parámetro | Dato que la función recibe por la puerta |
> | Retorno | Valor que la función devuelve al terminar |
> | Llamada | Ejecutar un método: `nombre(...)` |
> | Cuerpo | El código entre `{` y `}` del método |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/05-funciones) · **Anterior:** [Índice de la unidad](/ApuntesProgramacion/05-funciones) · **Siguiente:** [02 · Tu primer método](/ApuntesProgramacion/05-funciones/02-primer-metodo)
