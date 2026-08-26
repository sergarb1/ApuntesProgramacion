---
title: 02 — Instalación del JDK
description: Montando el chiringuito sin que sobren tornillos 🔧
---

<p><small>Montando el chiringuito sin que sobren tornillos 🔧</small></p>

> 🗺️ **Estás en:** 🚀 **U01 · Introducción a Java** → 02 · Instalación del JDK

---

## 📬 La idea en una frase

> **Para crear programas Java necesitas el JDK. Instalarlo es más fácil que montar un mueble de Ikea, y no te sobrarán tornillos.**

En el punto anterior viste que el JDK es el kit completo para *crear* programas. Ahora toca ponerlo en tu máquina y comprobar que todo funciona.

---

## 🛒 ¿Qué JDK instalo?

El Java original de Sun/Oracle ha tenido una vida movida con las licencias. Hoy la opción más sensata para estudiar es:

- **Eclipse Temurin** (antes AdoptOpenJDK): un JDK **libre, gratuito y mantenido por la comunidad**. Es el heredero de confianza del OpenJDK.
- **Oracle JDK**: la versión oficial de Oracle. Perfecta para empresas, pero con licencia más restrictiva.
- **OpenJDK**: el proyecto de referencia, del que salen los demás.

> 💡 **Consejo:** si usas [Eclipse Temurin](https://adoptium.net/) te ahorrarás dolores de cabeza. Es como el JDK oficial pero sin humos raros. Descarga el instalador según tu sistema (Windows x64, macOS, Linux) y déjalo con los valores por defecto.

La versión a elegir: la **última LTS** (soporte a largo plazo). A día de hoy, cualquier 17, 21 o superior te sirve para todo el curso. No te obsesiones con las versiones: los apuntes funcionan con todas.

---

## 🚀 Los primeros pasos

### Paso 1: instalar

Ejecuta el instalador de Temurin y acepta los valores por defecto. En Windows, marca la opción de añadir el JDK al `PATH` si te la ofrece (así podrás usar `java` desde cualquier terminal).

### Paso 2: verificar

Abre una terminal (PowerShell en Windows, la terminal que prefieras en Linux/macOS) y escribe:

```
> java -version
openjdk version "21" 2026-01-01
OpenJDK Runtime Environment (build 21+35)
OpenJDK 64-Bit Server VM (build 21+35, mixed mode)

> javac -version
javac 21
```

Si ves algo parecido, ¡enhorabuena! Tienes poderes de compilación. Si en cambio te dice `'java' no se reconoce como un comando interno o externo`, significa que el `PATH` no está bien configurado: busca en el menú de Windows "Editar las variables de entorno del sistema" y añade la carpeta `bin` del JDK a la variable `Path`.

> 💡 **¿Qué es el PATH?** Es la lista de carpetas donde Windows busca los comandos que escribes. Si la carpeta `...\jdk-21\bin` está en el `PATH`, al escribir `java` Windows la encuentra. Sin ella, Windows se encoge de hombros.

### Paso 3: ¿por qué hay dos comandos?

- `java`: **ejecuta** programas (arranca la JVM con tu bytecode).
- `javac`: **compila** código fuente `.java` a bytecode `.class`.

Se necesitan los dos: `javac` convierte tu código y `java` lo pone en marcha. Los verás juntos todo el curso.

---

## 🛠️ El IDE: tu navaja suiza

El JDK es el motor, pero la mayor parte del tiempo no escribirás código en un bloc de notas: usarás un **IDE** (Entorno de Desarrollo Integrado). El IDE reúne en una sola aplicación:

- **Editor de código** con colores, autocompletado y resaltado de errores mientras escribes.
- **Compilador y ejecutor** con un botón: ya no necesitas teclear `javac` y `java` a mano (aunque es bueno saberlo).
- **Depurador** integrado, el arma secreta que usarás en el punto 4.
- **Gestión de proyectos**: tus programas no son solo archivos sueltos, sino *proyectos* con estructura.

| IDE | Puntos fuertes |
|---|---|
| **IntelliJ IDEA** (Community) | El favorito del sector; autocompletado bestial. Algo más pesado al arrancar |
| **NetBeans** | Simple, oficial de Oracle, perfecto para empezar |
| **Eclipse** | Clásico, muy usado en empresas, un pelín más denso |

> 💡 **Recomendación para el curso:** IntelliJ IDEA Community Edition si tu ordenador lo soporta; NetBeans si quieres algo más ligero. Los tres valen: el IDE es una herramienta, no el objetivo.

---

## 🏫 Ejemplo guiado: tu primer proyecto

Vamos a dejar todo montado antes de escribir código:

1. Abre tu IDE y elige **New Project**.
2. Selecciona **Java** y asegúrate de que apunta al JDK que instalaste (el IDE lo detecta solo).
3. Dale un nombre al proyecto (por ejemplo, `MiPrimerCurso`).
4. El IDE te crea una estructura de carpetas (la verás en el punto 8).
5. Crea una clase nueva llamada `HolaMundo` y escribe dentro:

```java
public class HolaMundo {
    public static void main(String[] args) {
        System.out.println("¡Hola, Mundo! Llevo años esperando a que me crearas.");
    }
}
```

6. Pulsa el botón **Run** (el triángulo verde ▶) y mira la consola.

Si ves el mensaje en la consola, tu chiringuito está montado: JDK + IDE + primer programa. Estás oficialmente dentro.

> ⚠️ **Advertencia:** no confundas la consola del IDE con la terminal del sistema. La consola del IDE es donde se imprimen los `System.out.println` al ejecutar. Si no ves salida, busca la pestaña "Console" / "Salida".

---

## 🎯 Mini-chequeo

1. ¿Qué comando comprueba que tu instalación funciona?
2. ¿Para qué sirve el `PATH` y qué pasa si el JDK no está en él?
3. ¿Cuál es la diferencia entre `java` y `javac`?

<details>
<summary>🔄 Respuestas</summary>

1. `java -version` (y también `javac -version`).
2. El `PATH` es la lista de carpetas donde el sistema busca los comandos. Sin él, al escribir `java` el sistema responde que no reconoce el comando.
3. `javac` **compila** el código fuente a bytecode; `java` **ejecuta** el bytecode con la JVM.

</details>

---

## ✅ Resumen en 3 frases

1. Instala **Eclipse Temurin** (un JDK libre) y verifica con `java -version` y `javac -version`.
2. `javac` compila, `java` ejecuta, y el `PATH` es la dirección postal que el sistema necesita para encontrarlos.
3. Un **IDE** (IntelliJ, NetBeans o Eclipse) reúne editor, compilador y depurador: es tu navaja suiza.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | PATH | Lista de carpetas donde el sistema busca comandos |
> | IDE | Entorno integrado: editor + compilador + depurador |
> | LTS | Versión con soporte a largo plazo (la recomendada) |
> | Terminal | La ventana donde escribes comandos como `java` |
> | Proyecto | La carpeta donde viven tus clases y configuraciones |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/01-introduccion) · **Anterior:** [01 · ¿Qué es Java?](/ApuntesProgramacion/01-introduccion/01-que-es-java) · **Siguiente:** [03 · Tu primer programa](/ApuntesProgramacion/01-introduccion/03-hola-mundo)