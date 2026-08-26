---
title: 01 — Variables y tipos primitivos
description: Las cajas del almacén de la memoria y sus 8 tamaños distintos 📦
---

<p><small>Las cajas del almacén de la memoria y sus 8 tamaños distintos 📦</small></p>

> 🗺️ **Estás en:** 🔤 **U02 · Variables, Tipos y Operadores** → 01 · Variables y tipos primitivos

---

## 📬 La idea en una frase

> **Las variables son cajas etiquetadas en la memoria del ordenador, y Java te ofrece 8 tamaños de caja (los tipos primitivos) para que elijas el que mejor le va a cada dato.**

En la U01 tu programa solo gritaba texto por consola. Ahora vas a darle memoria: va a guardar tu edad, tu nombre, tu nota media y hasta si tienes hambre. Y para elegir bien la caja de cada dato, primero tienes que conocer el catálogo del almacén.

---

## 📦 La declaración: la receta de una caja

Para crear una caja (una variable) le dices a Java tres cosas: el **tipo** (tamaño y forma de la caja), el **nombre** (la etiqueta) y el **valor** (lo que metes dentro). La receta es:

```java
tipo nombreDeLaCaja = valorQueMetoDentro;
```

Ejemplos reales:

```java
int edad = 25;              // Caja etiquetada "edad" con un 25 dentro
double precio = 19.99;      // Caja con decimales
String nombre = "María";    // Caja mágica que guarda texto
boolean hambre = true;      // Caja de verdadero/falso (ahora mismo: true)
```

> 💡 **Detalle práctico:** las variables se llaman así porque... ¡varían! Puedes cambiar su contenido cuando quieras. `int edad = 25;` y, al día de tu cumpleaños, `edad = 26;`. La etiqueta es la misma, el contenido cambia.

---

## 🏷️ Las reglas de nomenclatura (o cómo no meter la pata)

Java es tiquismiquis con los nombres de las cajas. Estas son las reglas de oro:

- Pueden llevar letras, números, `_` y `$`. **Nada de espacios** ni de caracteres raros como `ñ` o `ç`.
- **No pueden empezar con número.** `1numero` es ilegal; `numero1` es legal. Como las matrículas de los coches.
- **Las mayúsculas importan**: `edad`, `Edad` y `EDAD` son tres cajas distintas. Como etiquetar "Zapatos", "zapatos" y "ZAPATOS".
- **No uses palabras reservadas**: `int`, `class`, `if`, `while`... son de Java, no tuyas.
- Usa **camelCase** para las variables: `miVariableEjemplo`. Como un camello, con joroba en medio.

```java
// ✅ Correcto
int numeroAlumnos = 30;
double notaMedia = 7.5;

// ❌ Incorrecto
int 1numero = 30;        // empieza por número
double nota media = 7.5; // espacio en el nombre
int class = 30;          // palabra reservada
```

---

## 📐 Los 8 primitivos: el catálogo de cajas

Java tiene **8 tipos primitivos**. Piensa en ellos como cajas de distintos tamaños en tu almacén:

| Tipo | Tamaño | Lo que cabe | Analogía |
|---|---|---|---|
| `byte` | 8 bits | -128 a 127 | Caja de cerillas |
| `short` | 16 bits | -32.768 a 32.767 | Caja de zapatos |
| `int` | 32 bits | -2.147M a 2.147M | Caja de mudanza (la que más usarás) |
| `long` | 64 bits | -9 cuatrillones a +9 cuatrillones | Contenedor de barco |
| `float` | 32 bits | Decimales de precisión simple | Vaso de agua |
| `double` | 64 bits | Decimales de precisión doble | Cubo de agua |
| `char` | 16 bits | Un solo carácter Unicode | Una letra en una caja de zapatos |
| `boolean` | 1 bit | `true` o `false` | Interruptor de luz |

Y así se declaran cada uno:

```java
byte nivel = 100;
short poblacion = 30000;
int habitantes = 1500000;           // El más usado
long distancia = 384400000L;        // La L al final es obligatoria
float precio = 12.99f;              // La f al final es obligatoria
double pi = 3.14159265359;
char letra = 'A';                   // Comillas SIMPLES para char
boolean esJavaDivertido = true;     // Esto es opinable
```

> 📝 **Nota:** usa `int` para casi todo lo numérico entero. Solo pasa a `long` si vas a contar estrellas. Usa `double` para decimales, a menos que ahorrar memoria sea tu fetiche.

---

## 🎒 ¿Qué caja uso para cada dato?

Elegir el tipo correcto es como elegir la maleta del viaje: ni un microbus para dos personas, ni un Smart para una familia de cinco. La práctica hace al maestro:

- **`int`**: edades, contadores, puntuaciones, casi todo entero.
- **`double`**: precios, notas medias, temperaturas, cualquier decimal.
- **`boolean`**: respuestas de sí/no: "¿ha aprobado?", "¿hay conexión?".
- **`char`**: una sola letra: la inicial de un nombre, una calificación 'A', 'B', 'C'.
- **`long`**: números astronómicos, milisegundos, identificadores gigantes.

> ⚠️ **Advertencia:** cuando dudes entre `int` y `double`, piensa: ¿este dato puede llevar decimales? Si sí → `double`. Si no → `int`. Simple.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** antes de escribir código, hazte siempre la misma pregunta: *¿qué tipo de dato es esto y en qué caja cabe?* El 90% de los errores de esta unidad vienen de meter mal la caja.

**Ejercicio: El guardia del almacén**

Eres el guardia de un almacén de datos. Te dan estas declaraciones y te preguntan: **¿cuáles compilan y cuáles no?** Marca las que fallarían y por qué:

```java
int a = 150;                 // ¿compila?
int b = 10.5;                // ¿compila?
double c = 7;                // ¿compila?
char d = "A";                // ¿compila?
boolean e = "true";          // ¿compila?
long f = 3000000000L;        // ¿compila?
int g = 3000000000;          // ¿compila?
```

<details>
<summary>🔄 Solución</summary>

- `int a = 150;` ✅ Compila. Un 150 cabe de sobra en un `int`.
- `int b = 10.5;` ❌ **No compila.** Un `int` no admite decimales; eso sería un `double`.
- `double c = 7;` ✅ Compila. Un entero cabe dentro de un `double` (conversión implícita, lo verás en el punto 5).
- `char d = "A";` ❌ **No compila.** `char` usa comillas simples `'A'`; las dobles son para `String`.
- `boolean e = "true";` ❌ **No compila.** `true` sin comillas es el booleano; `"true"` con comillas es texto.
- `long f = 3000000000L;` ✅ Compila. La `L` le dice a Java "esto es un long, no un int".
- `int g = 3000000000;` ❌ **No compila.** Tres mil millones no cabe en un `int` (tope: 2.147M). Sería un `long`.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué tamaño de caja usarías para guardar el número de habitantes de la Tierra (más de 8.000 millones)?
2. ¿Por qué `char letra = "A";` no compila y `char letra = 'A';` sí?
3. ¿Cuál es la diferencia entre `float` y `double` en una frase?
4. ¿Por qué `Edad`, `edad` y `EDAD` son tres variables distintas?

<details>
<summary>🔄 Respuestas</summary>

1. **`long`** — más de 2.147 millones no cabe en un `int`.
2. Porque `char` va con **comillas simples** `'A'` (un solo carácter); las comillas dobles son para `String`.
3. El `double` tiene **doble precisión** (64 bits) y el `float` precisión simple (32 bits): el `double` guarda más decimales exactos.
4. Porque **las mayúsculas importan**: cada variación del nombre es una caja distinta en el almacén.

</details>

---

## ✅ Resumen en 3 frases

1. Una variable es una **caja etiquetada** en memoria: tipo (tamaño), nombre (etiqueta) y valor (contenido).
2. Java tiene **8 tipos primitivos**, y elegir el correcto (normalmente `int` o `double`) es medio examen.
3. Las reglas de nomenclatura (camelCase, sin espacios, sin palabras reservadas, mayúsculas que importan) te ahorran errores de compilación tontos.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Variable | Caja etiquetada donde guardas un dato que puede cambiar |
> | Tipo primitivo | Uno de los 8 tipos básicos de datos de Java |
> | Declarar | Crear la variable: `tipo nombre = valor;` |
> | Literal | El valor escrito tal cual: `25`, `"María"`, `true` |
> | camelCase | Convención de nombres: `miVariableEjemplo` |
> | Palabra reservada | Palabra de Java que no puedes usar como nombre |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/02-variables-tipos-operadores) · **Anterior:** [Índice de la unidad](/ApuntesProgramacion/02-variables-tipos-operadores) · **Siguiente:** [02 · String, constantes y final](/ApuntesProgramacion/02-variables-tipos-operadores/02-string-constantes-final)
