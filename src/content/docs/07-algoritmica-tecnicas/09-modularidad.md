---
title: "09 · Modularidad"
description: "Un programa gigante no se domina: se parte. Paquetes, cohesión y acoplamiento para que tu código no se convierta en espagueti ⚡🧩"
---

<p><small>Un programa gigante no se domina: se parte. Paquetes, cohesión y acoplamiento para que tu código no se convierta en espagueti ⚡🧩</small></p>

> 🗺️ **Estás en:** ⚡ **U07 · Algorítmica II: técnicas avanzadas y modularidad** → 09 · Modularidad

---

## 📬 La idea en una frase

> **Modularidad es partir un programa en piezas con nombre, frontera y responsabilidad propia, para que cada pieza se entienda (y se arregle) por separado.**

En los puntos 3 a 8 dividiste *problemas* hasta hacerlos triviales. Ahora aplicas la misma estrategia al *código*: un programa de mil líneas en un solo archivo nadie lo entiende; mil líneas repartidas en módulos con sentido, sí. Divide y vencerás, pero esta vez en el editor.

---

## 🧩 ¿Por qué importa tanto?

- **Mantenibilidad:** cuando algo se rompe, buscas en el módulo responsable, no en un archivo con 1.500 líneas.
- **Trabajo en equipo:** dos personas pueden tocar módulos distintos sin pisarse. Sin fronteras, cada merge es una lotería.
- **Reutilización:** una pieza bien aislada (una utilidad de fechas, un algoritmo de ordenación) sirve en otros proyectos.
- **Testing:** se prueba una pieza pequeña en aislado, no el monstruo entero.
- **Comprensión:** puedes entender *un* módulo sin entender *todos*. Nadie entiende todo el sistema de golpe, y no hace falta.

---

## 📦 La pieza oficial en Java: el paquete

En Java, la unidad modular básica es el **paquete** (`package`): una carpeta con nombre que agrupa clases con la misma misión.

```java
package curso.algoritmos;          // este archivo vive en la carpeta curso/algoritmos/

public class Ordenacion {
    public static int[] burbuja(int[] datos) { /* ... */ }
}
```

Para usarlo desde otra clase, se importa:

```java
import curso.algoritmos.Ordenacion;   // "necesito la clase Ordenacion del paquete curso.algoritmos"

int[] ordenados = Ordenacion.burbuja(datos);
```

Convenciones que en el examen y en la vida real se cumplen:

1. El **directorio = paquete**: `curso.algoritmos` vive en `curso/algoritmos/`.
2. Nombres en **minúsculas y sin espacios** (`curso.algoritmos`, no `Curso.Algoritmos`).
3. Paquetes que expresan **misión**: `ordenes`, `pagos`, `utilidades`... no `cosas2`.
4. El punto (`.`) es el separador jerárquico: primero la empresa o el proyecto, luego la capa.

> 💡 **Analogía:** los paquetes son las estanterías de un taller. Las herramientas sueltas en la mesa siempre se pierden; las que viven en su cajón, aparecen cuando las buscas.

---

## 🎯 Cohesión alta, acoplamiento bajo

Dos palabras que resuelven el 90% de las dudas de diseño:

- **Cohesión (alta):** todo lo que hay dentro de un módulo va junto *porque tiene sentido*. Si tu módulo `facturas` contiene también recetas de cocina, la cohesión ha muerto.
- **Acoplamiento (bajo):** los módulos deben depender lo mínimo de los demás. Si para cambiar un nombre de archivo tienes que tocar cinco módulos, están demasiado pegados.

La regla de oro, en una frase: **un módulo, una responsabilidad; y que hable con los demás lo justo.**

---

## ✂️ Cómo decides los cortes

No hay una única respuesta, pero estas señales funcionan siempre:

1. **Nombre que se explica solo.** Si no sabes nombrar el módulo, todavía no sabes qué hace.
2. **Cambio repetido en el mismo sitio.** Dos funcionalidades que cambian juntas van al mismo módulo.
3. **Métodos cortos con una misión.** Una función que hace cinco cosas ya está pidiendo a gritos dividirse.
4. **Lo que se reutiliza, sube.** Si lo copias a otro sitio, es que quería ser su propio módulo.

> ⚠️ **[WARNING]** El extremo opuesto también enferma: **módulos de dos líneas** o una carpeta `utilidades` con 40 clases de todo tipo. Modular en exceso es ruido; el objetivo es *claridad*, no árboles infinitos de carpetas.

---

## 🔮 Lo que viene después

La modularidad es el puente perfecto hacia la POO: en la **U08** aprenderás que las **clases** son las piezas pequeñas, y en la **U09** que la **visibilidad** (`public`, `private`) decide qué cara muestra cada módulo al resto del mundo. Hoy pones las estanterías; mañana fabricas las piezas que van dentro.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué indica el `package curso.algoritmos;` de la primera línea de un archivo?
2. Si cambias un módulo y tienes que editar cinco más, ¿qué problema de diseño tienes: cohesión alta o acoplamiento excesivo?
3. ¿Por qué el directorio y el paquete deben coincidir?
4. Nombra dos ventajas de modularizar un programa para un equipo de trabajo.

<details>
<summary>🔄 Respuestas</summary>

1. Que la clase pertenece al paquete `curso.algoritmos` y que el archivo vive en la carpeta `curso/algoritmos/`.
2. **Acoplamiento excesivo**: los módulos dependen demasiado unos de otros.
3. Para que la herramienta (el compilador/IDE) encuentre la clase por su nombre: la ruta del paquete *es* la ruta de la carpeta.
4. Cualquiera de: trabajar en paralelo sin pisarse, arreglar fallos localizando el módulo, reutilizar piezas, probar partes aisladas, entender solo un trozo del sistema.

</details>

---

## ✅ Resumen en 3 frases

1. La **modularidad** parte el programa en piezas con nombre y responsabilidad propia, aplicando al código la misma «divide y vencerás» que usaste con los algoritmos.
2. En Java la pieza básica es el **paquete** (`package` / `import`), cuyo nombre coincide con la carpeta donde vive la clase.
3. Buen diseño = **cohesión alta** (todo junto va por sentido) y **acoplamiento bajo** (los módulos se hablan lo justo).

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Módulo | Pieza del programa con una misión |
> | Paquete | Carpeta de clases en Java (`package`) |
> | Cohesión | Cuánto tiene sentido que el código viva junto |
> | Acoplamiento | Cuánto depende un módulo de los otros |
> | Responsabilidad única | Un módulo, una misión |
> | `import` | Declarar qué pieza ajena necesitas usar |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/07-algoritmica-tecnicas) · **Anterior:** [08 · Otras técnicas algorítmicas](/ApuntesProgramacion/07-algoritmica-tecnicas/08-otras-tecnicas-algoritmicas) · **Siguiente:** [10 · Repaso interactivo](/ApuntesProgramacion/07-algoritmica-tecnicas/10-repaso-interactivo)
