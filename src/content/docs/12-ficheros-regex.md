---
title: "U12 — Ficheros y Expresiones Regulares"
description: "El GPS de los archivos, el lápiz que no olvida, la puerta que se cierra sola y el detective de patrones: File, FileWriter, BufferedReader, NIO, serialización y regex 📁"
emoji: 📁
---

<p><small>El GPS de los archivos, el lápiz que no olvida, la puerta que se cierra sola y el detective de patrones: File, FileWriter, BufferedReader, NIO, serialización y regex 📁</small></p>

> 🗺️ **El mapa del paquete:** 🚪 Bienvenida → ☕ U01 → 🔤 U02 → 🔀 U03 → 🅿️ U04 → 🧩 U05 → ⚡ U06 → 🏗️ U07 → 🔒 U08 → 🧬 U09 → 📚 U10 → 🗺️ U11 → **📁 AQUÍ ESTÁS (U12)** → 🗄️ U13 → 🌐 U14

---

En la U11 viste genéricos y mapas: tus datos por fin viven en memoria como quisieras. Pero hay un problema: cuando el programa termina, todo se esfuma. Los arrays, los `ArrayList` y los `HashMap` mueren con el `main`. Hoy eso se acaba. Los **ficheros** hacen que tus datos sobrevivan a tu programa, y las **expresiones regulares** te dan vista de superhéroe para buscar, validar y extraer cualquier patrón en un texto.

Esta unidad tiene tres grandes actos:

- **Ficheros de texto:** la clase `File`, el GPS de los archivos; `FileWriter` y `FileReader` + `BufferedReader`, el lápiz y el lector de siempre; `try-with-resources`, la puerta que se cierra sola; y `PrintWriter` y `Scanner`, el sargento que formatea y el pulpo que tokeniza.
- **La forma moderna y la de élite:** la API **NIO** (`Files` y `Paths`), que hace en una línea lo que antes costaba cinco, y la **serialización**, que guarda objetos enteros en un archivo como quien mete ropa en una maleta.
- **Expresiones regulares:** `Pattern` y `Matcher`, la tabla de símbolos, y sus aplicaciones con `matches()`, `replaceAll()`, `split()` y grupos de captura para validar correos, DNIs y teléfonos como un profesional.

Por el camino entenderás por qué `new File("ruta")` no crea nada, qué es eso del "infierno de las contrabarras" (`\\d`), por qué no cerrar un archivo puede costarte los datos, y por qué una regex no sirve para validar HTML (por más que lo intentes).

> 📌 **Nota:** la consola (`System.out`, `printf`, `Scanner` por teclado) ya la viste en la **U02**, punto 7. Aquí el `Scanner` y el `PrintWriter` vuelven, pero jugando en su liga: leyendo y escribiendo archivos.

Esta unidad se lee como un **libro de 9 capítulos**: los 8 primeros puntos son teoría en progresión y el 9º es un aterrizaje práctico para machacar todo lo aprendido.

---

## 🎯 Objetivo de la unidad

Al terminar, serás capaz de:

- Localizar y describir archivos y carpetas con la clase **`File`** (`exists`, `isFile`, `isDirectory`, `length`, `listFiles`).
- Escribir texto con **`FileWriter`** (sobrescribiendo o añadiendo) y leerlo con **`FileReader`** + **`BufferedReader`** línea a línea.
- Cerrar recursos sin llorar con **`try-with-resources`** y explicar por qué el `close()` importa.
- Formatear la salida con **`PrintWriter`** y leer archivos con **`Scanner`** (incluido `useDelimiter`).
- Manejar archivos con la API moderna **NIO** (`Files` y `Paths`): leer, escribir y consultar en una línea.
- Guardar y recuperar objetos enteros con **`ObjectOutputStream`** y **`ObjectInputStream`** (serialización).
- Crear y compilar **expresiones regulares** con `Pattern` y `Matcher`, y dominar los símbolos básicos.
- Aplicar regex con **`matches()`, `replaceAll()` y `split()`**, y usar **grupos de captura** para validar y extraer.

---

## 🗺️ Mapa de la unidad

| Punto | Qué aprenderás | Dificultad |
|---|---|---|
| [01 · La clase File: tu explorador de archivos](/ApuntesProgramacion/12-ficheros-regex/01-clase-file) | El GPS que localiza archivos sin leer su contenido | Todos |
| [02 · Escribir y leer texto: FileWriter, FileReader y BufferedReader](/ApuntesProgramacion/12-ficheros-regex/02-escribir-leer-texto) | El lápiz que no olvida y el lector que no se atraganta | Todos |
| [03 · try-with-resources: cerrar sin llorar](/ApuntesProgramacion/12-ficheros-regex/03-try-with-resources) | La puerta que se cierra sola: adiós al `close()` manual | Todos |
| [04 · PrintWriter y Scanner + File](/ApuntesProgramacion/12-ficheros-regex/04-printwriter-scanner-file) | El sargento que formatea y el pulpo que tokeniza | Todos |
| [05 · NIO: Files y Paths (la forma moderna)](/ApuntesProgramacion/12-ficheros-regex/05-nio-files-paths) | Leer, escribir y consultar archivos en una línea | Todos |
| [06 · Serialización: guardar objetos con ObjectOutputStream](/ApuntesProgramacion/12-ficheros-regex/06-serializacion) | Tu objeto entero en una maleta: `Serializable` | Todos |
| [07 · Expresiones regulares: Pattern y Matcher](/ApuntesProgramacion/12-ficheros-regex/07-regex-basica) | El molde, el texto y el infierno de las contrabarras | Todos |
| [08 · Regex en acción: matches, replaceAll, split y validaciones](/ApuntesProgramacion/12-ficheros-regex/08-regex-aplicaciones) | Validar correos, DNIs, teléfonos y extraer con grupos | Todos |
| [09 · Repaso interactivo](/ApuntesProgramacion/12-ficheros-regex/09-repaso-interactivo) | Sé el Código, Fireside, Laboratorio, Crucigrama y más | Todos |

> 📖 **Flujo de lectura:** los 8 primeros puntos son teoría en progresión. El 9º es el aterrizaje práctico: léelo justo después del 8º y antes de abrir los boletines.

---

## 📝 Boletines de la unidad

> Practica con los pares del curso: empieza siempre por el resuelto para ver el estilo y luego intenta el por-resolver.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/boletines/boletin-u12-inicial-resuelto" class="elink">✅ Inicial resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u12-inicial" class="elink">🟢 Inicial por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u12-avanzado-resuelto" class="elink">💪 Avanzado resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u12-avanzado" class="elink">⭐ Avanzado por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u12-extras" class="elink">🔥 Extras</a>
</div>

---

## ✅ Criterios de evaluación cubiertos (RA5)

**RA5: Realiza operaciones de entrada y salida de información, utilizando procedimientos específicos del lenguaje y librerías de clases.**

| CE | Criterio | Dónde se cubre |
|---|---|---|
| RA5 c) | Se han reconocido las posibilidades de entrada / salida del lenguaje y las librerías asociadas. | ✅ Puntos 1, 4 y 5 |
| RA5 d) | Se han utilizado ficheros para almacenar y recuperar información. | ✅ Puntos 1, 2, 3, 4, 5 y 6 |
| RA5 e) | Se han creado programas que utilicen diversos métodos de acceso al contenido de los ficheros. | ✅ Puntos 2, 4, 5 y 6 |

> 📌 Los CEs **RA5 a)** (consola) y **RA5 b)** (formatos) se cubrieron en la **U02**, punto 7. Esta unidad completa la RA5 con los ficheros y las librerías de E/S.

---

## ✅ Criterios de evaluación cubiertos (RA6)

**RA6: Escribe programas que manipulen información, seleccionando y utilizando tipos avanzados de datos.**

| CE | Criterio | Dónde se cubre |
|---|---|---|
| RA6 g) | Se han utilizado expresiones regulares en la búsqueda de patrones en cadenas de texto. | ✅ Puntos 7, 8 y 9 |

> 📌 La **RA6** se completa con la **U04** (arrays, CE a), la **U10** (colecciones, CEs b, c, d y e) y la **U11** (genéricos y mapas, CE f). Esta unidad aporta el CE g: las expresiones regulares.

---

## 🚪 ¿Por dónde empiezo?

- ¿Vienes de la U11 y quieres lo esencial? → Arranca en el [punto 1](/ApuntesProgramacion/12-ficheros-regex/01-clase-file) y el [punto 2](/ApuntesProgramacion/12-ficheros-regex/02-escribir-leer-texto): localizar y leer archivos de texto.
- ¿Ya sabes escribir y leer y quieres la forma moderna? → Salta al [punto 3](/ApuntesProgramacion/12-ficheros-regex/03-try-with-resources) (cerrar sin llorar) y al [punto 5](/ApuntesProgramacion/12-ficheros-regex/05-nio-files-paths) (NIO en una línea).
- ¿Solo vienes a por las regex? → Ve directo al [punto 7](/ApuntesProgramacion/12-ficheros-regex/07-regex-basica) y al [punto 8](/ApuntesProgramacion/12-ficheros-regex/08-regex-aplicaciones): el detective de patrones.
- ¿Vienes a repasar? → Haz el [Repaso interactivo](/ApuntesProgramacion/12-ficheros-regex/09-repaso-interactivo) y después los [boletines](/ApuntesProgramacion/boletines/boletin-u12-inicial).

**📍 Primer punto:** [01 · La clase File: tu explorador de archivos](/ApuntesProgramacion/12-ficheros-regex/01-clase-file)  
**⏭️ Al acabar la unidad, continúa en [U13 · Conexión a BD con JDBC](/ApuntesProgramacion/13-conexion-bases-datos).**