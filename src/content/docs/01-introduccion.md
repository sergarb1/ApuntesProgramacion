---
title: U01 — Introducción a Java
description: Tu primer café con Java ☕
---

<p><small>Tu primer café con Java ☕</small></p>

> 🗺️ **El mapa del paquete:** 🚪 Bienvenida → **☕ AQUÍ ESTÁS (U01)** → 🔤 U02 → 🔀 U03 → 🅿️ U04 → 🧩 U05 → ⚡ U06 → 🏗️ U07 → 🔒 U08 → 🧬 U09 → 📚 U10 → 🗺️ U11 → 📁 U12 → 🗄️ U13 → 🌐 U14

---

Bienvenido al curso de Programación en Java. ¿Sabías que tu ordenador es básicamente un cachorro muy listo pero con cero iniciativa? No hace nada hasta que le das órdenes precisas. Y para eso necesitamos un **entorno de desarrollo**, un lenguaje y muchas ganas de compilar.

Esta primera unidad te deja en la puerta del castillo: vas a instalar el JDK, a escribir tu primer programa, a conocer la trilogía del café (JVM, JRE y JDK), a usar el depurador como un detective y a hablar con la máquina mediante comentarios y argumentos. No necesitas experiencia previa: solo un editor de texto y curiosidad.

Esta unidad se lee como un **libro de 9 capítulos**: cada punto desarrolla una idea completa y enlaza con el siguiente.

---

## 🎯 Objetivo de la unidad

Al terminar, serás capaz de:

- Explicar la diferencia entre **JDK, JRE y JVM** con la analogía de la cafetería.
- Instalar y configurar un JDK y comprobar tu instalación con `java -version`.
- Escribir, compilar y ejecutar tu primer programa Java.
- Diseccionar el método `main` y entender cada pieza del esqueleto de un programa.
- Usar el **depurador** (breakpoints, step over/into, watch) como un detective.
- Escribir comentarios de una línea, de bloque y **Javadoc**.
- Manejar los **argumentos de línea de comandos** con `args`.
- Reconocer y corregir los errores de compilación más típicos del novato.
- Trabajar con un **IDE** y conocer tu flujo de trabajo diario.

---

## 🗺️ Mapa de la unidad

| Punto | Qué aprenderás | Nivel |
|---|---|---|
| [01 · ¿Qué es Java?](/ApuntesProgramacion/01-introduccion/01-que-es-java) | Historia, bytecode, la trilogía JVM/JRE/JDK | Todos |
| [02 · Instalación del JDK](/ApuntesProgramacion/01-introduccion/02-instalacion-jdk) | Eclipse Temurin, `java -version`, PATH, IDE | Todos |
| [03 · Tu primer programa](/ApuntesProgramacion/01-introduccion/03-hola-mundo) | Hola Mundo, estructura, el método `main` | Todos |
| [04 · El depurador](/ApuntesProgramacion/01-introduccion/04-depurador) | Breakpoints, step over/into, watch | Todos |
| [05 · Comentarios y documentación](/ApuntesProgramacion/01-introduccion/05-comentarios) | `//`, `/* */`, `/** */` y Javadoc | Todos |
| [06 · Argumentos de línea de comandos](/ApuntesProgramacion/01-introduccion/06-argumentos) | El array `args`, cómo leerlo y usarlo | Todos |
| [07 · El compilador y sus errores](/ApuntesProgramacion/01-introduccion/07-errores-compilador) | Compilar vs ejecutar, errores típicos del novato | Todos |
| [08 · El IDE y tu flujo de trabajo](/ApuntesProgramacion/01-introduccion/08-ide-flujo-trabajo) | Proyectos, atajos, crear/ejecutar/depurar | Todos |
| [09 · Repaso interactivo](/ApuntesProgramacion/01-introduccion/09-repaso-interactivo) | Sé el Código, Fireside, Quién Soy, Laboratorio, Crucigrama… | Todos |

> 📖 **Flujo de lectura:** los 8 primeros puntos son teoría en progresión. El 9º es el aterrizaje práctico: léelo justo después del 8º y antes de abrir los boletines.

---

## 📝 Boletines de la unidad

> Practica con los pares del curso: empezar siempre el resuelto para ver el estilo y luego intentar el por-resolver.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/boletines/boletin-u01-inicial-resuelto" class="elink">✅ Inicial resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u01-inicial" class="elink">🟢 Inicial por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u01-avanzado-resuelto" class="elink">💪 Avanzado resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u01-avanzado" class="elink">⭐ Avanzado por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u01-extras" class="elink">🔥 Extras</a>
</div>

---

## ✅ Criterios de evaluación cubiertos (RA1)

**RA1: Reconoce la estructura de un programa informático, identificando y relacionando los elementos propios del lenguaje de programación utilizado.**

| CE | Criterio | Dónde se cubre |
|---|---|---|
| a) | Bloques que componen la estructura de un programa | ✅ Puntos 3 y 7 |
| b) | Proyectos de desarrollo de aplicaciones | ✅ Punto 8 |
| c) | Entornos integrados de desarrollo | ✅ Puntos 2 y 8 |
| i) | Comentarios en el código | ✅ Punto 5 |

> 📌 El depurador que se ve en el punto 4 sienta las bases del RA3 (probado y depurado de programas), que se completa en la U03.

---

## 🚪 ¿Por dónde empiezo?

- ¿Cero conocimientos? → Arranca en el [punto 1](/ApuntesProgramacion/01-introduccion/01-que-es-java), no hay ningún requisito previo.
- ¿Ya sabes qué es un IDE? → Ve directo al [punto 3](/ApuntesProgramacion/01-introduccion/03-hola-mundo) y vuelve atrás solo si te pierdes.
- ¿Vienes a repasar? → Haz el [Repaso interactivo](/ApuntesProgramacion/01-introduccion/09-repaso-interactivo) y los [boletines](/ApuntesProgramacion/boletines/boletin-u01-inicial).

**📍 Primer punto:** [01 · ¿Qué es Java?](/ApuntesProgramacion/01-introduccion/01-que-es-java)  
**⏭️ Al acabar la unidad, continúa en [U02 · Variables, Tipos y Operadores](/ApuntesProgramacion/02-variables-tipos-operadores).**