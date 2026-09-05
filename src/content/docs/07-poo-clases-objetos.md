---
title: "U07 — POO: Clases y Objetos"
description: "El cortapastas y las galletas: cuando tu código pasa de ser una receta a un mundo de objetos que hablan entre sí 🏗️"
emoji: 🏗️
---

<p><small>El cortapastas y las galletas: cuando tu código pasa de ser una receta a un mundo de objetos que hablan entre sí 🏗️</small></p>

> 🗺️ **El mapa del paquete:** 🚪 Bienvenida → ☕ U01 → 🔤 U02 → 🔀 U03 → 🅿️ U04 → 🧩 U05 → ⚡ U06 → **🏗️ AQUÍ ESTÁS (U07)** → 🔒 U08 → 🧬 U09 → 📚 U10 → 🗺️ U11 → 📁 U12 → 🗄️ U13 → 🌐 U14

---

Bienvenido a la unidad donde tus programas dejan de ser *recetas de cocina* y se convierten en **mundos de cosas**. Hasta ahora has escrito programas lineales: esto, luego esto, luego esto. Pero el mundo real no funciona así. En el mundo real tienes *cosas*: un perro, un coche, un profesor de programación con gafas de pasta. Cada cosa tiene **atributos** (color, edad, número de ganas de corregir exámenes) y **comportamientos** (ladrar, acelerar, poner faltas de ortografía).

La **Programación Orientada a Objetos (POO)** es exactamente eso: escribir código como funciona el mundo real. Y en esta unidad vas a aprender la base de todo: las **clases** (el molde) y los **objetos** (la galleta). Construirás tus propias clases con atributos y métodos, las harás nacer con **constructores**, aprenderás a desambiguar con `this`, a razonar sobre **referencias y memoria**, y a exprimir la **sobrecarga** de métodos y el paso de parámetros.

Esta unidad es el **punto de inflexión del curso**: lo que aprendas aquí, lo usarás en todas las unidades que quedan. La POO no es un tema más: es el tema que hace que todos los demás tengan sentido.

Esta unidad se lee como un **libro de 9 capítulos**: los 8 primeros puntos son teoría en progresión y el 9º es un aterrizaje práctico para machacar todo lo aprendido.

---

## 🎯 Objetivo de la unidad

Al terminar, serás capaz de:

- Explicar qué es la **POO** y por qué existe (spoiler: no es para fastidiar, es para no volverte loco).
- Diferenciar **clase** (el cortapastas) de **objeto** (la galleta), y crear objetos con `new`.
- Definir **atributos** (las propiedades) y **métodos** (los comportamientos) de una clase.
- Usar **constructores** para que los objetos nazcan bien preparados, con o sin parámetros.
- Desambiguar atributos y parámetros con la palabra clave **`this`**, y llamar a un constructor desde otro.
- Razonar sobre **referencias, `null` y memoria**: qué guarda una variable de objeto y qué pinta el `heap`.
- Escribir **métodos sobrecargados** y entender el **paso por valor** (y por qué las referencias se portan "raro").
- Diseñar y crear una **clase completa** con sus métodos, de principio a fin.

---

## 🗺️ Mapa de la unidad

| Punto | Qué aprenderás | Dificultad |
|---|---|---|
| [01 · Qué es la POO](/ApuntesProgramacion/07-poo-clases-objetos/01-que-es-poo) | Programación procedural vs orientada a objetos y por qué el mundo real manda | Todos |
| [02 · Clases y objetos: el cortapastas y las galletas](/ApuntesProgramacion/07-poo-clases-objetos/02-clases-objetos) | El molde, la galleta, `new`, y tu primera clase | Todos |
| [03 · Atributos y métodos](/ApuntesProgramacion/07-poo-clases-objetos/03-atributos-metodos) | Las propiedades y los comportamientos de una clase, con sus tipos y parámetros | Todos |
| [04 · Constructores](/ApuntesProgramacion/07-poo-clases-objetos/04-constructores) | El método que prepara al objeto al nacer: por defecto y con parámetros | Todos |
| [05 · La palabra clave this](/ApuntesProgramacion/07-poo-clases-objetos/05-this) | Cuando los parámetros se llaman igual que los atributos (y cómo salir del lío) | Todos |
| [06 · Referencias, null y memoria](/ApuntesProgramacion/07-poo-clases-objetos/06-referencias-memoria) | Qué guarda una variable de objeto, el `heap`, `null` y el mítico `NullPointerException` | Todos |
| [07 · Sobrecarga y paso por valor](/ApuntesProgramacion/07-poo-clases-objetos/07-sobrecarga-paso-valor) | Varios métodos con el mismo nombre y qué se copia cuando llamas | Todos |
| [08 · Be the Code: diseña tu clase](/ApuntesProgramacion/07-poo-clases-objetos/08-be-the-code) | Diseñar y construir una clase completa paso a paso, sin mirar | ⭐⭐⭐ |
| [09 · Repaso interactivo](/ApuntesProgramacion/07-poo-clases-objetos/09-repaso-interactivo) | Sé el Código, Fireside, Laboratorio, Crucigrama y más | Todos |

> 📖 **Flujo de lectura:** los 8 primeros puntos son teoría en progresión. El 9º es el aterrizaje práctico: léelo justo después del 8º y antes de abrir los boletines.

---

## 📝 Boletines de la unidad

> Practica con los pares del curso: empieza siempre por el resuelto para ver el estilo y luego intenta el por-resolver.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/boletines/boletin-u07-inicial-resuelto" class="elink">✅ Inicial resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u07-inicial" class="elink">🟢 Inicial por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u07-avanzado-resuelto" class="elink">💪 Avanzado resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u07-avanzado" class="elink">⭐ Avanzado por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u07-extras" class="elink">🔥 Extras</a>
</div>

---

## ✅ Criterios de evaluación cubiertos (RA2 + RA4)

**RA2: Escribe y prueba programas sencillos, reconociendo y aplicando los fundamentos de la programación orientada a objetos.**

**RA4: Desarrolla programas organizados en clases analizando y aplicando los principios de la programación orientada a objetos.**

| CE | Criterio | Dónde se cubre |
|---|---|---|
| RA2 a) | Se han identificado los fundamentos de la programación orientada a objetos. | ✅ Punto 1 |
| RA2 b) | Se han escrito programas simples. | ✅ Todos |
| RA2 c) | Se han instanciado objetos a partir de clases predefinidas. | ✅ Puntos 2, 3 y 6 |
| RA2 d) | Se han utilizado métodos y propiedades de los objetos. | ✅ Puntos 3 y 8 |
| RA2 f) | Se han utilizado parámetros en la llamada a métodos. | ✅ Puntos 7 y 8 |
| RA2 h) | Se han utilizado constructores. | ✅ Puntos 4 y 7 |
| RA4 a) | Se ha reconocido la sintaxis, estructura y componentes típicos de una clase. | ✅ Puntos 2 y 3 |
| RA4 b) | Se han definido clases. | ✅ Puntos 2 y 8 |
| RA4 c) | Se han definido propiedades y métodos. | ✅ Puntos 3 y 8 |
| RA4 d) | Se han creado constructores. | ✅ Puntos 4 y 7 |
| RA4 e) | Se han desarrollado programas que instancien y utilicen objetos de las clases creadas anteriormente. | ✅ Puntos 6 y 8 |

> 📌 El punto 6 (referencias y memoria) y el 7 (paso por valor) son la base para entender el **RA2 c) y f)** en profundidad. Los modificadores de visibilidad (RA4 f), la herencia (RA4 g) y los métodos estáticos (RA4 h) tienen su propio capítulo en la **U08** (Visibilidad y Static) y en la **U09** (Herencia), así que aquí los dejamos descansando.

---

## 🚪 ¿Por dónde empiezo?

- ¿Cero conocimientos de POO? → Arranca en el [punto 1](/ApuntesProgramacion/07-poo-clases-objetos/01-que-es-poo). Solo necesitas lo que viste hasta la U06.
- ¿Ya sabes qué es una clase y quieres chicha? → Ve directo al [punto 4](/ApuntesProgramacion/07-poo-clases-objetos/04-constructores) y al [punto 5](/ApuntesProgramacion/07-poo-clases-objetos/05-this): ahí empieza el baile serio.
- ¿Te flipan los retos? → Haz el [punto 8](/ApuntesProgramacion/07-poo-clases-objetos/08-be-the-code) sin mirar el código de los puntos anteriores. Diseña tu clase con honor.
- ¿Vienes a repasar? → Haz el [Repaso interactivo](/ApuntesProgramacion/07-poo-clases-objetos/09-repaso-interactivo) y después los [boletines](/ApuntesProgramacion/boletines/boletin-u07-inicial).

**📍 Primer punto:** [01 · Qué es la POO](/ApuntesProgramacion/07-poo-clases-objetos/01-que-es-poo)  
**⏭️ Al acabar la unidad, continúa en [U08 · Visibilidad, Encapsulación y Static](/ApuntesProgramacion/08-visibilidad-encapsulacion-static).**