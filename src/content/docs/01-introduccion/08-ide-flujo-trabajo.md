---
title: 08 — El IDE y tu flujo de trabajo
description: Tu navaja suiza para no vivir en la terminal 🗡️
---

<p><small>Tu navaja suiza para no vivir en la terminal 🗡️</small></p>

> 🗺️ **Estás en:** 🚀 **U01 · Introducción a Java** → 08 · El IDE y tu flujo de trabajo

---

## 📬 La idea en una frase

> **El IDE (Entorno de Desarrollo Integrado) es tu navaja suiza: editor, compilador, ejecutor y depurador, todo en una sola ventana.**

En el punto 2 instalaste el JDK y le diste un primer vistazo al IDE. Ahora vas a montar el flujo de trabajo diario: cómo se organiza un proyecto, cómo crear clases, ejecutarlas, depurarlas y moverte con atajos sin tocar el ratón.

---

## 🗂️ Anatomía de un proyecto

Cuando creas un proyecto Java, el IDE te genera una estructura de carpetas. Las importantes son:

```
MiPrimerCurso/
├── src/               ← TU código (.java) vive aquí
│   └── HolaMundo.java
└── out/  (o target)   ← el bytecode (.class) compilado
    └── HolaMundo.class
```

- **`src`** (source): tus archivos `.java`. Es lo que tú escribes y lo que se sube a Git.
- **`out` / `target`**: lo que genera el compilador. No se toca a mano y normalmente ni se sube a Git.

> 💡 **Detalle práctico:** no edites nunca los `.class`. Si borras `src` y editas `out`, el IDE lo regenerará al compilar. Tu código fuente es la única fuente de verdad.

---

## 🔁 El ciclo de trabajo (tu nuevo bucle de vida)

Programar es un bucle de cuatro pasos que repetirás millones de veces:

1. **Editar**: escribes o cambias código en `src`.
2. **Compilar**: el IDE compila al guardar (o al pulsar Build). Aquí mueren los errores de sintaxis.
3. **Ejecutar**: pulsas ▶ (Run). Aquí mueren los errores de runtime.
4. **Depurar**: si la lógica falla, pulsas 🐞 (Debug) y empiezas el detective del punto 4.

```
Editar → Compilar → Ejecutar → Depurar → (volver a Editar)
```

> ⚠️ **Advertencia:** el botón ▶ (Run) y el 🐞 (Debug) NO son lo mismo. Run ejecuta sin breakpoints; Debug los respeta. Si pones un breakpoint y pulsas ▶, el programa no se detendrá y pensarás que el depurador está roto.

---

## ⌨️ Los atajos que te harán parecer un pro

Deja el ratón en paz. Estos son los atajos esenciales (valen para IntelliJ y similares):

| Atajo (Windows) | Acción |
|---|---|
| `psvm` + Tab | Escribe el esqueleto `public static void main(String[] args) {}` |
| `sout` + Tab | Escribe `System.out.println()` |
| `Shift + F10` | Ejecutar (Run) |
| `Shift + F9` | Ejecutar en modo depuración (Debug) |
| `F8` / `F7` | Step Over / Step Into (depurador) |
| `Ctrl + /` | Comentar / descomentar la línea |
| `Ctrl + D` | Duplicar la línea |
| `Ctrl + B` | Ir a la definición (navegar) |

> 🧠 **Truco de memoria:** `psvm` = *public static void main* y `sout` = *System.out*. Son los dos fragmentos que más escribirás en el curso. Aprende los atajos y el IDE te los rellena solo.

---

## 🧩 Autocompletado: tu compañero silencioso

El IDE mientras escribes te sugiere, resalta errores en rojo antes de compilar y puede **arreglar** problemas con un clic (la bombilla 💡):

- Escribes `Syste` y el IDE te ofrece `System` (con la S mayúscula que tanto cuesta).
- Escribes una línea sin `;` y la bombilla te ofrece "Insert semicolon".
- Renombras una variable y el IDE actualiza todas sus apariciones: es *refactorizar*.

El autocompletado no es trampa: es la razón por la que la gente usa IDE en lugar de un bloc de notas. Tu código sale con menos errores tontos porque el IDE te corrige mientras piensas.

---

## 🏫 Ejemplo guiado: de cero a ejecutar en 60 segundos

1. **Nuevo proyecto**: File → New → Project → Java. Nómbralo `MiPrimerCurso`.
2. **Nueva clase**: clic derecho en `src` → New → Java Class. Nómbrala `HolaMundo`.
3. Escribe `psvm` y pulsa Tab: aparece el `main`. Dentro, escribe `sout` + Tab y escribe tu mensaje:

```java
public class HolaMundo {
    public static void main(String[] args) {
        System.out.println("¡Hola desde mi IDE!");
    }
}
```

4. Pulsa **Shift + F10** (Run). Mira la consola del IDE.
5. Pon un breakpoint en el `println`, pulsa **Shift + F9** (Debug) y observa el panel de variables.

Si has llegado al paso 5 sin pánico, tu flujo de trabajo está montado. A partir de aquí, el curso entero es llenar este esqueleto de contenido.

---

## 🎯 Mini-chequeo

1. ¿Dónde viven tus archivos `.java` y dónde los `.class`?
2. ¿Qué diferencia hay entre los botones ▶ (Run) y 🐞 (Debug)?
3. ¿Qué escribe `psvm` + Tab?

<details>
<summary>🔄 Respuestas</summary>

1. Tus `.java` viven en `src`; los `.class` compilados en `out`/`target`. No edites los `.class`.
2. ▶ ejecuta normal (ignora los breakpoints); 🐞 ejecuta en modo depuración (los respeta).
3. El esqueleto `public static void main(String[] args) {}` completo.

</details>

---

## ✅ Resumen en 3 frases

1. Un proyecto tiene `src` (tu código) y `out` (bytecode): el IDE compila por ti.
2. Tu bucle diario es **editar → compilar → ejecutar → depurar**, y Run y Debug no son lo mismo.
3. Los atajos (`psvm`, `sout`, F8/F7) y el autocompletado te hacen más rápido y con menos errores tontos.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | IDE | Editor + compilador + ejecutor + depurador en una app |
> | Proyecto | La carpeta que agrupa tu código y configuraciones |
> | src | Carpeta de código fuente |
> | Refactorizar | Cambiar código manteniendo su comportamiento |
> | Consola del IDE | Donde se imprime la salida de tus programas |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/01-introduccion) · **Anterior:** [07 · El compilador y sus errores](/ApuntesProgramacion/01-introduccion/07-errores-compilador) · **Siguiente:** [09 · Repaso interactivo](/ApuntesProgramacion/01-introduccion/09-repaso-interactivo)