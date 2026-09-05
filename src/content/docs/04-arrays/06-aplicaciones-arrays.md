---
title: "06 · Aplicaciones de los arrays"
description: "Arrays de String, de char, de objetos y de tablas: cuando el parking deja de ser teoría y empieza a trabajar 💼"
---

<p><small>Arrays de String, de char, de objetos y de tablas: cuando el parking deja de ser teoría y empieza a trabajar 💼</small></p>

> 🗺️ **Estás en:** 🅿️ **U04 · Arrays** → 06 · Aplicaciones de los arrays

---

## 📬 La idea en una frase

> **Los arrays no son solo para números: guardas nombres, palabras, caracteres, objetos y hasta tablas enteras. Todo lo que se pueda contar, se puede meter en un parking.**

Hasta ahora has aparcado números. Pero en la vida real los datos tienen nombres: alumnos, asignaturas, temperaturas, películas... Este punto te enseña a guardar **cosas** (no solo números) en tus arrays, y a darles un uso de verdad.

---

## 📝 Arrays de String: la lista de la clase

El array más humano que existe: una lista de nombres.

```java
String[] clase = {"Ana", "Bruno", "Carla", "Diego"};

for (String alumno : clase) {
    System.out.println("Hola, " + alumno);
}
```

Cada plaza guarda una `String`. Nada nuevo en la sintaxis: lo que cambia es lo que guardas. Y con ellos puedes hacer cosas propias de texto:

```java
String[] frutas = {"pera", "manzana", "pera", "uva"};

int peras = 0;
for (String fruta : frutas) {
    if (fruta.equals("pera")) {
        peras++;
    }
}
System.out.println("Hay " + peras + " peras.");
```

> ⚠️ **Advertencia:** con `String` nunca compares con `==`. Usa `.equals()`. Lo viste en la U02 y en los arrays es igual de obligatorio: `fruta == "pera"` compara referencias, no texto.

### El más famoso de todos: `args`

El array de `String` más usado del curso lo llevas escribiendo desde la U01: `main(String[] args)`. En el punto 5 viste que contiene los argumentos de la línea de comandos. Pues eso: un `String[]` de verdad, como el de tu clase.

---

## 🔤 `char[]` vs `String`

Un `char[]` es un array de caracteres. Y ojo: se parece muchísimo a una `String`... pero no es lo mismo.

```java
char[] vocales = {'a', 'e', 'i', 'o', 'u'};

for (int i = 0; i < vocales.length; i++) {
    System.out.print(vocales[i] + " ");
}
```

| Cosa | `String` | `char[]` |
|---|---|---|
| ¿Inmutable? | Sí: no se puede cambiar | No: puedes tocar cada plaza |
| Métodos | `length()`, `charAt()`, `substring()`... | No tiene (usas bucles) |
| ¿Se puede modificar una letra? | No (creas otra) | Sí: `vocales[0] = 'A';` |
| Pasar a método | Se comporta como inmutable | Se comparte como cualquier objeto |

> 💡 **Consejo:** si necesitas "cambiar una letra", con `String` no puedes. Una opción es pasarla a `char[]`, modificarla y volver a construir la `String`. En la U12 (ficheros y regex) esta idea te va a salir varias veces.

---

## 🧍 Arrays de objetos: el parking de personas

Aquí es donde el parking brilla de verdad. Los arrays no solo guardan primitivos o `String`: guardan **objetos** de cualquier clase. Como aún no has creado tus propias clases (eso es la U06), usa una sencilla para el ejemplo:

```java
class Alumno {
    String nombre;
    int nota;

    Alumno(String nombre, int nota) {
        this.nombre = nombre;
        this.nota = nota;
    }
}
```

```java
Alumno[] alumnos = new Alumno[3];
alumnos[0] = new Alumno("Ana", 8);
alumnos[1] = new Alumno("Bruno", 5);
alumnos[2] = new Alumno("Carla", 10);

int aprobados = 0;
for (Alumno a : alumnos) {
    if (a.nota >= 5) {
        aprobados++;
    }
}
System.out.println("Aprobados: " + aprobados);
```

> ⚠️ **Advertencia:** un `Alumno[]` recién creado está lleno de `null`, no de alumnos. `new Alumno[3]` crea 3 plazas vacías; si accedes a `alumnos[0].nombre` sin crear el objeto antes, `NullPointerException` al instante. Primero `new Alumno(...)`, después usar.

El bucle es idéntico al de los números: cambia el contenido, no la mecánica. Esto se llama **recorrer una colección de objetos**, y vas a hacerlo muchísimo el resto del curso.

---

## 🗂️ Arrays de arrays: los datos en tabla

El último clásico: guardar varias listas a la vez. Si tienes las notas de varios alumnos en varias asignaturas, una tabla `double[][]` es la forma natural:

```java
double[][] notas = {
    {8.0, 7.5, 9.0},   // Ana: Matemáticas, Lengua, Inglés
    {5.0, 6.0, 4.5},   // Bruno
    {9.5, 8.0, 10.0},  // Carla
};

for (int i = 0; i < notas.length; i++) {
    double suma = 0;
    for (int j = 0; j < notas[i].length; j++) {
        suma += notas[i][j];
    }
    System.out.println("Alumno " + i + ": media " + (suma / notas[i].length));
}
```

Cada fila es un alumno y cada columna una asignatura. Con dos bucles anidados (los del punto 3) recorres toda la tabla y calculas lo que necesites. Los programas que "llevan la cuenta" de la vida real son, en el fondo, esto.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuando un array guarda objetos, el bucle no cambia nada: recorre, pregunta, acumula. Lo único nuevo es que preguntas por **atributos** (`a.nota`), no por valores sueltos.

**Ejercicio: la búsqueda de la película**

```java
public class BeTheCatalogo {
    public static void main(String[] args) {
        String[] peliculas = {"Alien", "Matrix", "Gladiator", "Matrix", "Coco"};
        String buscada = "Matrix";
        int cuantas = 0;

        for (String p : peliculas) {
            if (p.equals(buscada)) {
                cuantas++;
            }
        }

        System.out.println(cuantas);
    }
}
```

**¿Qué imprime?**

- (A) 1
- (B) 2
- (C) 3
- (D) Matrix

<details>
<summary>🔄 Solución</summary>

La **B**. El for-each recorre las 5 películas y el `if` cuenta cuántas veces aparece `"Matrix"`. Aparece en las posiciones 1 y 3: dos veces. Fíjate en el `.equals()`: con `==` compararías referencias y `"Matrix"` no sería igual a ninguna, porque son objetos distintos en memoria.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué hay en las plazas de un `Alumno[]` recién creado?
2. ¿Por qué `fruta == "pera"` es un error con `String`?
3. ¿Puedes modificar una letra de una `String`? ¿Y de un `char[]`?
4. ¿Qué bucle usarías para sumar una fila de una tabla `double[][]`?

<details>
<summary>🔄 Respuestas</summary>

1. `null`. `new Alumno[3]` crea 3 plazas vacías; hay que crear los objetos con `new Alumno(...)`.
2. Porque `==` compara referencias (¿es el mismo objeto?), no el contenido. Con `String` hay que usar `.equals()`.
3. No, `String` es inmutable. Sí, `char[]` no lo es: `vocales[0] = 'A'` funciona.
4. Un `for` anidado, o un `for` por la fila concreta: `for (int j = 0; j < notas[i].length; j++)`.

</details>

---

## ✅ Resumen en 3 frases

1. Los arrays guardan **lo que sea**: `String`, `char`, objetos propios y tablas enteras, con la misma mecánica de siempre.
2. Con `String` usa **`.equals()`** y recuerda que un array de objetos recién creado está lleno de **`null`**.
3. Los **arrays de objetos** (recorres atributos) y los **arrays 2D** (recorres filas y columnas) son la base de los programas que gestionan datos de la vida real.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Array de objetos | Parking donde cada plaza guarda un objeto (`Alumno`, `String`...) |
> | `null` | El valor por defecto de las plazas de objetos recién creadas |
> | Inmutable | Que no se puede cambiar; la `String` lo es |
> | `char[]` | Array de caracteres, modificable, sin métodos propios |
> | Tabla de datos | `double[][]`: filas y columnas para datos reales |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/04-arrays) · **Anterior:** [05 · Arrays y métodos](/ApuntesProgramacion/04-arrays/05-arrays-metodos) · **Siguiente:** [07 · Be the Code: el parking se gestiona](/ApuntesProgramacion/04-arrays/07-be-the-code)