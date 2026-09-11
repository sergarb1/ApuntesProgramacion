---
title: "02 — Instalación del JDK"
description: "OpenJDK, java -version, PATH, IDE ☕"
---

<p><small>OpenJDK, java -version, PATH, IDE ☕</small></p>

> 🗺️ **Estás en:** 🚀 **U01 · Introducción a Java** → 02 · Instalación del JDK

---

**Para crear programas Java necesitas el JDK. Instalarlo es más fácil que montar un mueble de Ikea, y no te sobrarán tornillos.**

En el punto anterior viste que el JDK es el kit completo para *crear* programas. Ahora toca ponerlo en tu máquina y comprobar que todo funciona.

---

## 🛒 ¿Qué JDK instalo?

El Java original de Sun/Oracle ha tenido una vida movida con las licencias. Hoy la mejor opción y la más sensata para estudiar es ir directamente a la fuente oficial y libre:

1. **OpenJDK**: Es el proyecto de referencia, libre y de código abierto, del cual salen todas las demás distribuciones. **Es nuestra opción principal y la recomendada, más sencillo de instalar en Linux.**
   - [https://openjdk.org/index.html](https://openjdk.org/index.html)
2. **Eclipse Temurin** (antes AdoptOpenJDK): Una distribución excelente basada directamente en OpenJDK, libre, gratuita y mantenida por la fundación Eclipse.
   - [https://adoptium.net/es/temurin/releases](https://adoptium.net/es/temurin/releases)
3. **Oracle JDK**: La versión comercial de Oracle. Válida para entornos empresariales, pero con una licencia más restrictiva. **Más sencillo de instalar en Windows**
   - [https://www.oracle.com/java/technologies/downloads/](https://www.oracle.com/java/technologies/downloads/)

**La versión a elegir:** Elegirás la última versión **LTS** (*soporte a largo plazo*). Hoy en día, cualquier versión 17, 26 o superior te sirve para todo el curso. No te obsesiones con el número exacto: todo lo que aprendemos funciona exactamente igual en todas ellas.

---

## 🚀 Los primeros pasos

### Paso 1: Instalar

Ejecuta el instalador de OpenJDK y acepta los valores por defecto. En Windows, asegúrate de marcar la opción de añadir el JDK al PATH si te la ofrece el instalador (así podrás usar `java` y `javac` desde cualquier terminal sin tener que configurar nada a mano).

### Paso 2: Verificar

Abre una terminal (PowerShell o CMD en Windows, o la terminal en Linux/macOS) y escribe:

```bash
> java -version
openjdk version "21.0.2" 2024-01-16
OpenJDK Runtime Environment (build 21.0.2+13-LTS)
OpenJDK 64-Bit Server VM (build 21.0.2+13-LTS, mixed mode)
```

Y después comprueba el compilador:

```bash
> javac -version
javac 21.0.2
```

Si ves una salida parecida, enhorabuena. ¡Tienes poderes de compilación activos.

Si, en cambio, el sistema te dice `'java' no se reconoce como un comando interno o externo`, significa que el PATH no está bien configurado: busca en el menú de Windows "Editar las variables de entorno del sistema" y añade la ruta de la carpeta `bin` de tu instalación de OpenJDK a la variable `Path`.

### 💡 ¿Qué es el PATH?

El "PATH" es la lista de carpetas donde tu sistema operativo busca los programas y comandos que escribes en la terminal. Si la carpeta `...\jdk-26\bin` (o similar) está en el PATH, al escribir `java` el sistema la encuentra a la primera. Sin esa configuración, el sistema no sabe dónde está instalado tu JDK.

### Paso 3: ¿Por qué hay dos comandos?

- **`javac`**: Es el compilador. Convierte tu código fuente (`.java`) en bytecode (`.class`).
- **`java`**: Es el ejecutor. Arranca la JVM para ejecutar el bytecode que has compilado previamente.

**Se necesitan los dos**: primero **`javac`** traduce tu código y después **`java`** lo pone en marcha. Los verás trabajar estrechamente durante todo el curso.

---

## 🛠️ El IDE: tu navaja suiza

El JDK es el motor, pero la mayor parte del tiempo no escribirás código en un bloc de notas: usarás un IDE (Entorno de Desarrollo Integrado) o un editor avanzado como VS Code. El IDE reúne en una sola aplicación:

- Editor de código con colores, autocompletado y resaltado de errores mientras escribes.
- Compilador y ejecutor con un botón: ya no necesitas teclear `javac` y `java` a mano (aunque es bueno saber cómo funciona).
- Depurador integrado.
- Gestión de proyectos: tus programas no son solo archivos sueltos, sino proyectos con estructura.

| IDE / Editor | Puntos fuertes |
| --- | --- |
| **VS Code** | La opción recomendada. Muy ligero, moderno y altamente personalizable. Con la extensión Extension Pack for Java ofrece un entorno completo y excelente. |
| **IntelliJ IDEA (Community)** | El favorito del sector profesional; autocompletado bestial. Un poco más pesado al arrancar. |
| **NetBeans** | Simple, oficial de Oracle, perfecto para empezar. |
| **Eclipse** | Clásico, mucho usado en empresas, un pelín más denso. |

💡 **Recomendación para el curso:** VS Code con el plugin de Java (Extension Pack for Java) es la mejor opción por su ligereza y versatilidad. También puedes usar IntelliJ IDEA Community Edition si tu ordenador lo soporta, o NetBeans si quieres algo más tradicional. Todos valen: el IDE es una herramienta, no el objetivo.

---

## 🏫 Ejemplo guiado: tu primer proyecto en VS Code

Lo dejaremos todo montado antes de escribir código:

1. Abre VS Code y asegúrate de tener instalado el plugin Extension Pack for Java.
2. Pulsa `Ctrl + Shift + P` (o `Cmd + Shift + P` en Mac) para abrir la paleta de comandos, escribe `Java: Create Java Project` y selecciona `No build tools`.
3. Elige la carpeta donde quieres guardar el proyecto y dale un nombre (por ejemplo, `MiPrimerCurso`).
4. VS Code te creará la estructura del proyecto con una carpeta `src`.
5. Dentro de la carpeta `src`, crea un archivo llamado `HolaMundo.java` y escribe dentro:

```java
public class HolaMundo {
    public static void main(String[] args) {
        System.out.println("¡Hola, Mundo! Llevo años esperando a que me crearas.");
    }
}
```

6. Haz clic en el botón Run ▶ (que aparecerá justo encima del método main) o pulsa `F5` y mira la terminal/consola.

Si ves el mensaje en la pantalla, tu puestito está montado: JDK + VS Code + primer programa. Estás oficialmente dentro.

⚠️ **Advertencia:** no confundas la consola/terminal del IDE con la terminal del sistema. La consola de VS Code es donde se imprimen los `System.out.println` al ejecutar. Si no ves la salida, busca la pestaña Terminal o Output / Salida.

---

## 🎯 Mini-comprobación

1. ¿Qué comando comprueba que tu instalación funciona?
2. ¿Para qué sirve el PATH y qué pasa si el JDK no está en él?
3. ¿Cuál es la diferencia entre `java` y `javac`?

**🔄 Respuestas**

1. `java -version` (y también `javac -version`).
2. El PATH es la lista de carpetas donde el sistema busca los comandos. Sin él, al escribir `java` el sistema responde que no reconoce el comando.
3. `javac` compila el código fuente a bytecode; `java` ejecuta el bytecode con la JVM.

---

## ✅ Resumen en 3 frases

1. Instala OpenJDK (un JDK libre) y verifica con `java -version` y `javac -version`.
2. `javac` compila, `java` ejecuta, y el PATH es la dirección postal que el sistema necesita para encontrarlos.
3. Un IDE o editor como VS Code (con el plugin de Java) reúne editor, compilador y depurador: es tu navaja suiza.

---

## 🐛 Vocabulario rápido

| Término | Idea general |
| --- | --- |
| **PATH** | Lista de carpetas donde el sistema busca comandos |
| **IDE / Editor** | Entorno integrado: editor + compilador + depurador |
| **LTS** | Versión con soporte a largo plazo (la recomendada) |
| **Terminal** | La ventana donde escribes comandos como `java` |
| **Proyecto** | La carpeta donde viven tus clases y configuraciones |
