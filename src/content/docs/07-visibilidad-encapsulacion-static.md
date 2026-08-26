---
title: "U07 — Visibilidad, Encapsulación y Static"
description: "Los candados de tu código: quién ve tus atributos, cómo blindarlos y qué pertenece a la clase y no al objeto 🔒"
emoji: 🔒
---

<p><small>Los candados de tu código: quién ve tus atributos, cómo blindarlos y qué pertenece a la clase y no al objeto 🔒</small></p>

> 🗺️ **El mapa del paquete:** 🚪 Bienvenida → ☕ U01 → 🔤 U02 → 🔀 U03 → 🧩 Fundamentos → ⚡ Técnicas → 🏗️ POO → **🔒 AQUÍ ESTÁS (U07)** → 🧬 Herencia → 📚 Colecciones → 🗺️ Genéricos → 📁 Ficheros → 🗄️ JDBC → 🌐 APIs

---

Bienvenido a la unidad de los candados. En la U06 aprendiste a crear clases y objetos: clases con atributos y métodos que se comportaban como *cosas* del mundo real. Pero había un problema escondido: **todo era público**. Cualquiera podía hacer `persona.edad = -666` y tu objeto quedaba hecho unos zorros. Vivir en una casa de cristal es incómodo, ¿verdad? Pues tu código también merece puertas, llaves y un buen candado.

Esta unidad tiene dos mitades que al final bailan juntas:

- **Visibilidad y encapsulación:** aprenderás a esconder tus atributos con `private` y a controlar cómo se leen y modifican con `public` (getters y setters). Es el pilar que sostiene la POO: tu objeto decide qué muestra y qué guarda, y nadie deja tu clase en un estado imposible.
- **Static:** aprenderás la diferencia entre lo que pertenece a cada **objeto** (cada gato tiene su nombre) y lo que pertenece a la **clase** (todos comparten el contador de gatos). Atributos estáticos, métodos estáticos y constantes `static final` que ni el tiempo se atreve a tocar.

En el camino descubrirás por qué `main` es `static` aunque no tuviera por qué, cómo se construye una clase utilitaria como `Math` (que nadie puede instanciar), y por qué los expertos dicen que los atributos `public` son como dejar la cartera abierta en el metro.

Esta unidad se lee como un **libro de 9 capítulos**: los 8 primeros puntos son teoría en progresión y el 9º es un aterrizaje práctico para machacar todo lo aprendido.

---

## 🎯 Objetivo de la unidad

Al terminar, serás capaz de:

- Explicar por qué **esconder** tus atributos es buena idea (y no paranoia).
- Distinguir los **4 niveles de visibilidad**: `public`, `protected`, package-private y `private`.
- **Encapsular** clases con atributos `private` y controlar el acceso con getters y setters `public`.
- **Validar** datos en los setters para que tu objeto nunca viva en un estado imposible.
- Conocer el **patrón JavaBeans** y las convenciones de nombres.
- Usar **atributos y métodos estáticos** (`static`) para lo que pertenece a la clase, no al objeto.
- Entender por qué `main` es `static` y crear **clases utilitarias** con constructor privado.
- Declarar **constantes de clase** con `static final` y saber cuándo usarlas.

---

## 🗺️ Mapa de la unidad

| Punto | Qué aprenderás | Dificultad |
|---|---|---|
| [01 · Visibilidad: el arte de no enseñarlo todo](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/01-visibilidad) | La casa de cristal: el problema de enseñar todos tus atributos al mundo | Todos |
| [02 · public, private y protected](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/02-public-private-protected) | Los 4 niveles de visibilidad y quién ve cada cosa de tu clase | Todos |
| [03 · Encapsulación: el pilar de la POO](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/03-encapsulacion) | Atributos privados, control de acceso y el patrón JavaBeans | Todos |
| [04 · Getters y setters](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/04-getters-setters) | El portero de la discoteca: leer y modificar atributos con validación | Todos |
| [05 · Atributos static](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/05-atributos-static) | Lo que pertenece a la clase, no al objeto: el grupo de WhatsApp | Todos |
| [06 · Métodos static y el main](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/06-metodos-static) | Llamar a métodos sin crear objetos y por qué `main` es estático | Todos |
| [07 · Constantes de clase: static final](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/07-constantes-static-final) | Valores inmutables en MAYÚSCULAS y las clases utilitarias | Todos |
| [08 · Be the Code: encapsula tu clase](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/08-be-the-code) | Convierte una clase sin blindar en una bien encapsulada, paso a paso | ⭐⭐⭐ |
| [09 · Repaso interactivo](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/09-repaso-interactivo) | Sé el Código, Fireside, Laboratorio, Crucigrama y más | Todos |

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

## ✅ Criterios de evaluación cubiertos (RA4)

**RA4: Desarrolla programas organizados en clases analizando y aplicando los principios de la programación orientada a objetos.**

| CE | Criterio | Dónde se cubre |
|---|---|---|
| RA4 a) | Se ha reconocido la sintaxis, estructura y componentes típicos de una clase. | ✅ Punto 1 |
| RA4 b) | Se han definido clases. | ✅ Puntos 3 y 8 |
| RA4 c) | Se han definido propiedades y métodos. | ✅ Puntos 2, 3 y 4 |
| RA4 d) | Se han creado constructores. | ✅ Puntos 3 y 4 |
| RA4 e) | Se han desarrollado programas que instancien y utilicen objetos de las clases creadas anteriormente. | ✅ Puntos 8 y 9 |
| RA4 f) | Se han utilizado mecanismos para controlar la visibilidad de las clases y de sus miembros. | ✅ Puntos 1 y 2 |
| RA4 h) | Se han creado y utilizado métodos estáticos. | ✅ Puntos 5, 6 y 7 |

> 📌 La herencia (RA4 g) y las interfaces (RA4 i) tienen su capítulo propio en la **U08**. Los conjuntos y librerías de clases (RA4 j) florecen en la **U09** y la **U10**. Aquí nos quedamos con visibilidad, encapsulación y static, que son los cimientos de todo lo demás.

---

## 🚪 ¿Por dónde empiezo?

- ¿Cero conocimientos? → Arranca en el [punto 1](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/01-visibilidad). Solo necesitas lo que viste en la U06.
- ¿Ya blindas atributos y quieres chicha? → Ve directo al [punto 5](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/05-atributos-static) y al [punto 6](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/06-metodos-static): ahí empieza el mundo estático.
- ¿Solo vienes a por los candados? → Salta al [punto 3](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/03-encapsulacion) y al [punto 4](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/04-getters-setters).
- ¿Vienes a repasar? → Haz el [Repaso interactivo](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/09-repaso-interactivo) y después los [boletines](/ApuntesProgramacion/boletines/boletin-u07-inicial).

**📍 Primer punto:** [01 · Visibilidad: el arte de no enseñarlo todo](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/01-visibilidad)  
**⏭️ Al acabar la unidad, continúa en [U08 · Herencia, Polimorfismo e Interfaces](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces).
