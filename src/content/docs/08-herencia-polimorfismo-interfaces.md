---
title: "U08 — Herencia, Polimorfismo e Interfaces"
description: "Cuando tus clases heredan, se disfrazan y firman contratos: extends, super, override, abstract e interfaces 🧬"
emoji: 🧬
---

<p><small>Cuando tus clases heredan, se disfrazan y firman contratos: extends, super, override, abstract e interfaces 🧬</small></p>

> 🗺️ **El mapa del paquete:** 🚪 Bienvenida → ☕ U01 → 🔤 U02 → 🔀 U03 → 🧩 Fundamentos → ⚡ Técnicas → 🏗️ POO → 🔒 U07 → **🧬 AQUÍ ESTÁS (U08)** → 📚 Colecciones → 🗺️ Genéricos → 📁 Ficheros → 🗄️ JDBC → 🌐 APIs

---

Hasta ahora tus clases eran islas: cada una con sus atributos, sus métodos y sus secretos bien guardados. Pero en la vida real las cosas no son islas: un perro *es un* animal, un coche *es un* vehículo, y un profesor *es un* empleado. Las cosas **heredan** características de sus padres y, encima, añaden las suyas. Pues tu código hace exactamente lo mismo.

Esta unidad es el corazón de la POO. Y tiene tres grandes actos:

- **Herencia (`extends`):** una clase hija obtiene todo lo que tiene su clase padre y puede mejorarlo. Aprenderás a usar `super` para llamar a la superclase, `@Override` para sobrescribir métodos y `protected` para compartir secretos solo con la familia.
- **Polimorfismo:** el mismo método, mil comportamientos. Una variable de tipo `Animal` puede apuntar a un `Perro`, un `Gato` o una `Vaca`, y cada uno hace su sonido. Verás `instanceof`, downcasting y la mítica clase `Object`, el tatarabuelo de todo.
- **Abstracción e interfaces:** clases abstractas que no se pueden instanciar (bocetos) e interfaces que son contratos. Aquí se decide si tu código es un caos o una obra de arte.

En el camino descubrirás por qué `toString()` te está mintiendo si no lo sobrescribes, qué pasa cuando haces un downcasting a lo loco (spoiler: `ClassCastException`), y por qué los entrevistadores de trabajo adoran preguntar "¿cuándo usarías una clase abstracta y cuándo una interfaz?".

Esta unidad se lee como un **libro de 9 capítulos**: los 8 primeros puntos son teoría en progresión y el 9º es un aterrizaje práctico para machacar todo lo aprendido.

---

## 🎯 Objetivo de la unidad

Al terminar, serás capaz de:

- **Heredar** de una clase con `extends` y distinguir IS-A de HAS-A.
- Usar **`super`** para llamar a constructores y métodos de la superclase.
- **Sobrescribir** métodos con `@Override` y saber cuándo (y cuándo no) hacerlo.
- Proteger miembros con **`protected`** y diseñar **jerarquías de clases** sensatas.
- Explicar el **polimorfismo dinámico** (dynamic binding) y usarlo con colecciones y parámetros.
- Aplicar **`instanceof` y downcasting** con seguridad.
- Sobrescribir **`toString()`, `equals()` y `hashCode()`** de la clase `Object`.
- Diseñar **clases abstractas** con métodos abstractos y el patrón template method.
- Implementar **interfaces**, usar métodos `default` y decidir cuándo usar `abstract class` vs `interface`.

---

## 🗺️ Mapa de la unidad

| Punto | Qué aprenderás | Dificultad |
|---|---|---|
| [01 · Herencia: cuando tus hijos siguen tus pasos](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/01-herencia) | `extends`, qué se hereda y qué no, IS-A vs HAS-A, el árbol genealógico | Todos |
| [02 · super y @Override](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/02-super-override) | Llamar a la superclase, sobrescribir métodos y encadenar constructores | Todos |
| [03 · protected y jerarquías de clases](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/03-protected-jerarquias) | El miembro que solo ve la familia, árboles de clases y la clase base frágil | Todos |
| [04 · Polimorfismo: el camaleón de la POO](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/04-polimorfismo) | Dynamic binding, referencias polimórficas, colecciones y parámetros | Todos |
| [05 · instanceof y downcasting](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/05-instanceof-downcasting) | Preguntar quién eres y bajar la referencia sin romper nada | Todos |
| [06 · La clase Object: el tatarabuelo](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/06-clase-object) | `toString()`, `equals()` y `hashCode()` bien sobrescritos | Todos |
| [07 · Clases abstractas](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/07-clases-abstractas) | Bocetos que no se instancian, métodos abstractos y template method | Todos |
| [08 · Interfaces: el contrato que firmas](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/08-interfaces) | `implements`, polimorfismo, métodos `default` y abstract vs interface | Todos |
| [09 · Repaso interactivo](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/09-repaso-interactivo) | Sé el Código, Fireside, Laboratorio, Crucigrama y más | Todos |

> 📖 **Flujo de lectura:** los 8 primeros puntos son teoría en progresión. El 9º es el aterrizaje práctico: léelo justo después del 8º y antes de abrir los boletines.

---

## 📝 Boletines de la unidad

> Practica con los pares del curso: empieza siempre por el resuelto para ver el estilo y luego intenta el por-resolver.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/boletines/boletin-u08-inicial-resuelto" class="elink">✅ Inicial resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u08-inicial" class="elink">🟢 Inicial por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u08-avanzado-resuelto" class="elink">💪 Avanzado resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u08-avanzado" class="elink">⭐ Avanzado por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u08-extras" class="elink">🔥 Extras</a>
</div>

---

## ✅ Criterios de evaluación cubiertos (RA4 y RA7)

**RA4: Desarrolla programas organizados en clases analizando y aplicando los principios de la programación orientada a objetos.**

| CE | Criterio | Dónde se cubre |
|---|---|---|
| RA4 a) | Se ha reconocido la sintaxis, estructura y componentes típicos de una clase. | ✅ Punto 1 |
| RA4 b) | Se han definido clases. | ✅ Puntos 7 y 8 |
| RA4 d) | Se han creado constructores. | ✅ Puntos 2 y 7 |
| RA4 e) | Se han desarrollado programas que instancien y utilicen objetos de las clases creadas anteriormente. | ✅ Puntos 4, 8 y 9 |
| RA4 g) | Se han definido y utilizado clases heredadas. | ✅ Puntos 1, 2 y 3 |
| RA4 i) | Se han definido y utilizado interfaces. | ✅ Punto 8 |

**RA7: Desarrolla programas, aplicando características avanzadas de los lenguajes orientados a objetos y del entorno de programación.**

| CE | Criterio | Dónde se cubre |
|---|---|---|
| RA7 a) | Se han identificado los conceptos de herencia, superclase y subclase. | ✅ Punto 1 |
| RA7 b) | Se han utilizado modificadores para bloquear y forzar la herencia de clases y métodos. | ✅ Puntos 2 y 7 |
| RA7 c) | Se ha reconocido la incidencia de los constructores en la herencia. | ✅ Punto 2 |
| RA7 d) | Se han creado clases heredadas que sobrescriban la implementación de métodos de la superclase. | ✅ Puntos 2 y 4 |
| RA7 e) | Se han diseñado y aplicado jerarquías de clases. | ✅ Puntos 3 y 7 |
| RA7 f) | Se han probado y depurado las jerarquías de clases. | ✅ Punto 9 |
| RA7 g) | Se han realizado programas que implementen y utilicen jerarquías de clases. | ✅ Puntos 4, 8 y 9 |

> 📌 El resultado de aprendizaje **RA4** se apoya en la U06 (definir clases) y la U07 (visibilidad), y culmina aquí con herencia e interfaces. La **RA7** se cierra con esta unidad: jerarquías, sobrescritura y contratos. Las colecciones (RA6) llegan en la **U09**.

---

## 🚪 ¿Por dónde empiezo?

- ¿Cero conocimientos? → Arranca en el [punto 1](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/01-herencia). Solo necesitas lo que viste en las unidades 06 y 07.
- ¿Ya heredas y quieres el contrato? → Ve directo al [punto 7](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/07-clases-abstractas) y al [punto 8](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/08-interfaces): ahí está la mitad abstracta de la unidad.
- ¿Solo vienes a por el polimorfismo? → Salta al [punto 4](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/04-polimorfismo) y al [punto 5](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/05-instanceof-downcasting).
- ¿Vienes a repasar? → Haz el [Repaso interactivo](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/09-repaso-interactivo) y después los [boletines](/ApuntesProgramacion/boletines/boletin-u08-inicial).

**📍 Primer punto:** [01 · Herencia: cuando tus hijos siguen tus pasos](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/01-herencia)  
**⏭️ Al acabar la unidad, continúa en [U09 · Arrays y Colecciones](/ApuntesProgramacion/09-arrays-colecciones).