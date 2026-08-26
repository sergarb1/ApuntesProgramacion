---
title: 01 — ¿Qué es Java?
description: La trilogía del café y el secreto de la taza humeante ☕
---

<p><small>La trilogía del café y el secreto de la taza humeante ☕</small></p>

> 🗺️ **Estás en:** 🚀 **U01 · Introducción a Java** → 01 · ¿Qué es Java?

---

## 📬 La idea en una frase

> **Java es un lenguaje de programación que se ejecuta dentro de una máquina virtual (la JVM), lo que le permite ejecutarse igual en Windows, Linux o macOS: "escribe una vez, corre en cualquier sitio".**

Si tu ordenador es un cachorro muy listo pero con cero iniciativa, Java es uno de los idiomas que puedes usar para darle órdenes. Y la JVM es el intérprete que traduce tus órdenes al idioma concreto de cada cachorro.

---

## 🔍 ¿De dónde sale este lenguaje?

Java nació en **1995** en **Sun Microsystems**, y su historia tiene una de las curiosidades más divertidas del sector: se inspiró en la **máquina de café** de la oficina. Por eso el logo es una taza humeante. No me lo invento.

La idea de sus creadores era simple pero ambiciosa: un lenguaje que funcionara en **cualquier dispositivo**, sin importar el sistema operativo ni el hardware. Antes de Java, cada plataforma necesitaba su propia versión del programa. Java propuso la solución: no programar para el ordenador, sino para una **máquina virtual** que el ordenador simula.

> 💡 **Dato freak:** el lenguaje se llamó primero *Oak* (roble), por un árbol que se veía desde la oficina. Tuvieron que cambiarlo por motivos de marca registrada y, según la leyenda, el nombre "Java" se eligió por el café que tomaban durante las reuniones.

---

## 📦 ¿Qué es eso del bytecode?

Cuando escribes Java no escribes instrucciones de la CPU de tu ordenador: escribes instrucciones para la **JVM**. El proceso es así:

1. Tú escribes código fuente en un archivo `.java`.
2. El **compilador** (`javac`) lo traduce a *bytecode*: un idioma intermedio que entiende la JVM. El resultado es un archivo `.class`.
3. La **JVM** lee el bytecode y lo ejecuta en tu máquina concreta.

```
Tu código (.java)  --javac-->  bytecode (.class)  --JVM-->  ¡se ejecuta!
```

La gracia es que ese `.class` es el mismo para todas las plataformas: la JVM de Windows, la de Linux y la de macOS saben leerlo. Solo cambia la JVM, no tu programa.

---

## ☕ La trilogía del café: JVM, JRE y JDK

Aquí está el momento estrella de la unidad. Java funciona como una **cafetería de especialidad**, y tienes que memorizar quién es quién:

| Concepto | Es... | Analogía |
|---|---|---|
| **JVM** | La máquina que ejecuta el bytecode | La máquina de café: tiene su receta y funciona igual en cualquier sitio |
| **JRE** | Todo lo necesario para *ejecutar* Java | La cafetería entera: máquina, vasos, azúcar... |
| **JDK** | Todo lo necesario para *crear* programas | El kit completo para montar tu cafetería: máquina, granos, molinillo y manual de barista |

- **JVM (Java Virtual Machine)**: la máquina de café. Ejecuta el bytecode y viaja con tu programa a todas partes.
- **JRE (Java Runtime Environment)**: la cafetería entera. Tiene la JVM y las librerías necesarias para *ejecutar* café ya hecho. Si solo quieres ejecutar programas, te basta.
- **JDK (Java Development Kit)**: el kit para montar tu propia cafetería. Incluye el JRE más el compilador `javac`, el generador de documentación `javadoc` y otras herramientas de desarrollo. Si quieres *crear* programas, lo necesitas.

```java
// Imagina que esto es un grano de café verde:
public class Cafe {
    public static void main(String[] args) {
        System.out.println("☕ ¡Café listo!");
    }
}
```

El JDK compila esto a bytecode (café molido), el JRE lo pasa por la JVM y... ¡tachán! café en tu pantalla.

> ⚠️ **Advertencia:** no confundas JDK con JRE. El JDK es el *cuchillo del chef*; el JRE es el *plato servido*. El JDK incluye el JRE, así que instalando el JDK tienes las dos cosas. Instalar solo el JRE te permite ejecutar programas, pero no crearlos.

---

## 🌍 ¿Por qué sigue vivo Java tantos años después?

No es nostalgia. Java sigue siendo uno de los lenguajes más demandados del mundo porque:

- **Es multiplataforma**: el mismo programa se ejecuta en móviles, servidores, cajeros y hasta en la lavadora inteligente.
- **Domina el mundo empresarial**: las grandes empresas (banca, seguros, logística) llevan décadas construyendo sus sistemas en Java.
- **Es el lenguaje oficial de Android** (en su variante Kotlin convive, pero Java sigue omnipresente).
- **Tiene una comunidad enorme**: cualquier error que tengas, probablemente alguien ya lo resolvió hace diez años en un foro.
- **Es exigente, y eso te hace mejor**: Java te obliga a ser ordenado. Los programadores que aprenden con Java suelen escribir código más limpio.

---

## 🏫 Ejemplo guiado: recorrer tu primer programa

Ya has visto `Cafe`. Vamos a fijar las piezas de cualquier programa Java antes de que lo diseñes tú en el punto 3:

```java
public class MiPrimerPrograma {
    public static void main(String[] args) {
        System.out.println("¡Holaaaa, mundo!");
        System.out.println("Estoy aprendiendo Java");
        System.out.println("Y me está gustando (de momento)");
    }
}
```

- `public class MiPrimerPrograma`: declaras una clase llamada `MiPrimerPrograma`. La clase es el contenedor de tu programa.
- `public static void main(String[] args)`: el "botón de inicio". Java busca esta línea al arrancar.
- `System.out.println(...)`: la voz del programa; grita texto por la consola.

> 💡 **Detalle práctico:** la clase pública debe llamarse **exactamente igual que el archivo**. Si el archivo se llama `MiPrimerPrograma.java`, la clase debe ser `MiPrimerPrograma`. Esto es una regla de Java, no un capricho.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Cuál es la diferencia entre JDK y JRE en una frase?
2. ¿Qué hace el compilador `javac` con tu código `.java`?
3. ¿Por qué el logo de Java es una taza humeante?

<details>
<summary>🔄 Respuestas</summary>

1. El **JDK sirve para crear** programas (incluye compilador); el **JRE sirve para ejecutarlos**. El JDK contiene al JRE.
2. Lo traduce a **bytecode** (un archivo `.class`) que la JVM puede ejecutar.
3. Porque el lenguaje se inspira en la máquina de café de la oficina de Sun Microsystems: "escribe una vez, corre en cualquier sitio" (como el café, que se prepara igual en cualquier cafetería).

</details>

---

## ✅ Resumen en 3 frases

1. Java ejecuta su código dentro de una **máquina virtual (JVM)**, lo que le da portabilidad total.
2. **JDK** crea (compila a bytecode), **JRE** ejecuta, **JVM** transporta: como Amazon pero con café.
3. Java sigue siendo rey en el mundo empresarial y aprenderlo te forma como programador ordenado.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | JVM | La máquina virtual que ejecuta el bytecode |
> | JRE | Entorno de ejecución (JVM + librerías) |
> | JDK | Kit de desarrollo (compilador + JRE + herramientas) |
> | Bytecode | Código intermedio que entiende la JVM |
> | Compilador | Traductor de código fuente a bytecode |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/01-introduccion) · **Anterior:** [Índice de la unidad](/ApuntesProgramacion/01-introduccion) · **Siguiente:** [02 · Instalación del JDK](/ApuntesProgramacion/01-introduccion/02-instalacion-jdk)