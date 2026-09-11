---
title: "08 — El IDE y tu flujo de trabajo"
description: "Proyectos, atajos, crear/ejecutar/depurar 🛠️"
---

<p><small>Proyectos, atajos, crear/ejecutar/depurar 🛠️</small></p>

> 🗺️ **Estás en:** 🚀 **U01 · Introducción a Java** → 08 · El IDE y tu flujo de trabajo

---

**El IDE (Entorno de Desarrollo Integrado) es tu navaja suiza: editor, compilador, ejecutor y depurador, todo en una sola ventana.**

En el punto 2 instalaste el JDK y le echaste un primer vistazo al IDE/Editor. Ahora vas a montar tu flujo de trabajo diario: cómo se organiza un proyecto, cómo crear clases, ejecutarlas, depurarte y moverte con atajos en VS Code sin tocar el ratón.

---

## 🗂️ Anatomía de un proyecto en VS Code

Cuando creas un proyecto Java en VS Code, la extensión te genera una estructura de carpetas limpia. Las importantes son:

```
MiPrimerCurso/
├── src/          ← TU código (.java) vive aquí
│   └── HolaMundo.java
└── bin/ (o target)  ← el bytecode (.class) compilado automáticamente
    └── HolaMundo.class
```

- **src** (source): Tus archivos `.java`. Es lo que tú escribes y lo que se sube a Git.
- **bin / target**: Lo que genera el compilador en segundo plano. No se toca a mano y normalmente ni se sube a Git.

💡 **Detalle práctico:** No edites nunca los `.class`. Si borras la carpeta `bin`, VS Code la regenerará al compilar en segundo plano. Tu código fuente en `src` es la única fuente de verdad.

---

## 🔁 El ciclo de trabajo (tu nuevo bucle de vida)

Programar es un bucle de cuatro pasos que repetirás millones de veces:

1. **Editar**: Escribes o cambias código en `src`.
2. **Compilar**: VS Code compila automáticamente al guardar (`Ctrl + S`). Aquí se marcan los errores de sintaxis en rojo.
3. **Ejecutar**: Pulsas `Ctrl + F5` (o el botón ▶ Run). Aquí se detectan los errores de runtime.
4. **Depurar**: Si la lógica falla, pulsas `F5` (o Debug) y empieza el detective del punto 4.

***Editar → Compilar (Auto) → Ejecutar → Depurar → (Volver a Editar)***

⚠️ **Advertencia:** Ejecutar sin depurar (`Ctrl + F5`) y en modo depuración (`F5`) NO son lo mismo. Ejecutar normal ignora los breakpoints; Debug los respeta. Si pones un punto rojo y ejecutas sin depurar, el programa no se detendrá.

---

## ⌨️ Los atajos de VS Code que te harán parecer un pro

Deja el ratón en paz. Estos son los atajos esenciales para Java en VS Code:

| Atajo (Windows) | Acción |
| --- | --- |
| `main + Tab` (o `psvm`) | Escribe el esqueleto `public static void main(String[] args) {}` |
| `sysout + Tab` (o `sout`) | Escribe `System.out.println()` |
| `Ctrl + F5` | Ejecutar (Run Without Debugging) |
| `F5` | Ejecutar en modo depuración (Start Debugging) |
| `F10` / `F11` | Step Over / Step Into (depurador) |
| `Ctrl + /` | Comentar / descomentar la línea seleccionada |
| `Shift + Alt + ↓` | Duplicar la línea hacia abajo |
| `F12` | Ir a la definición (Go to Definition) |
| `F2` | Cambiar el nombre de un símbol/variable en todo el proyecto (Rename) |

🧠 **Truco de memoria**: `main` y `sysout` son los dos snippets que más escribirás en el curso. Escribes esas letras, pulsa Tab y VS Code te los rellena de golpe.

---

## 🧩 Autocompletado (IntelliSense): tu compañero silencioso

La extensión de Java mientras escribes te sugiere opciones, resalta errores en rojo antes de ejecutar y puede arreglar problemas con un clic (el icono de la bombilla 💡 o `Ctrl + .`):

- Escribes `Syste` y VS Code te ofrece `System` (con la S mayúscula que tanto cuesta al principio).
- Te falta una variable o importación y la bombilla 💡 te ofrece "Import 'java.util.Scanner'" o la corrección rápida.
- Seleccionas una variable, pulsas `F2` y le cambias el nombre: VS Code actualiza todas sus apariciones en el proyecto (esto es refactorizar).

**El autocompletado no es trampa**: es la razón por la cual la gente usa VS Code o un IDE en lugar de un bloc de notas. Tu código sale con menos errores tontos porque el editor te corrige mientras piensas.

---

## 🏫 Ejemplo guiado: de cero a ejecutar en 60 segundos en VS Code

1. **Nuevo proyecto:** Pulsa `Ctrl + Shift + P`, escribe `Java: Create Java Project`, elige `No build tools`, selecciona la carpeta de destino y ponle un nombre (por ejemplo, `MiPrimerCurso`).

2. **Nueva clase:** Dentro del explorador izquierdo, haz clic derecho sobre la carpeta `src` → New File → ponle de nombre `HolaMundo.java`.

3. Escribe `main` y pulsa Tab (aparece el método main). Dentro, escribe `sysout` y pulsa Tab:

```java
public class HolaMundo {
    public static void main(String[] args) {
        System.out.println("¡Hola desde VS Code!");
    }
}
```

4. Pulsa `Ctrl + F5` (Run). Mira la pestaña Terminal en la parte inferior de VS Code.

5. Pon un breakpoint en el `println` (clic a la izquierda del número de línea), pulsa `F5` (Debug) y observa el panel lateral izquierdo de variables.

Si has llegado al paso 5 sin pánico, tu flujo de trabajo está montado. A partir de aquí, el curso entero es rellenar este esqueleto de contenido.

---

## 🎯 Mini-comprobación

1. ¿Dónde viven tus archivos `.java` y dónde los `.class`?
2. ¿Cuál es la diferencia entre ejecutar con `Ctrl + F5` (Run) y con `F5` (Debug)?
3. ¿Qué escribe `main + Tab`?

**🔄 Respuestas**

1. Tus `.java` viven en `src`; los `.class` compilados en `bin` (o `target`). No edites los `.class`.
2. `Ctrl + F5` ejecuta normal (ignora los breakpoints); `F5` ejecuta en modo depuración (los respeta).
3. El esqueleto `public static void main(String[] args) {}` completo.

---

## ✅ Resumen en 3 frases

1. Un proyecto tiene `src` (tu código) y `bin` (bytecode): VS Code compila por ti en segundo plano al guardar.
2. Tu bucle diario es editar → compilar → ejecutar → depurar, y Run (`Ctrl + F5`) y Debug (`F5`) no son lo mismo.
3. Los atajos (`main`, `sysout`, `F10/F11`) y el autocompletado (IntelliSense) te hacen trabajar más rápido y con menos errores.

---

## 🐛 Vocabulario rápido

| Término | Idea general |
| --- | --- |
| **VS Code / IDE** | Editor + herramientas de Java en una sola aplicación |
| **Proyecto** | La carpeta raíz que agrupa tu código (`src`) y configuraciones |
| **src** | Carpeta de código fuente donde escribes tus archivos `.java` |
| **Refactorizar** | Modificar o reestructurar el código manteniendo su comportamiento exactamente igual |
| **Terminal / Consola** | La ventana inferior donde se imprime la salida de tus programas |
