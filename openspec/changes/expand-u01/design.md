# expand-u01 — Design

## Formato por archivo

### Índice `01-introduccion.md`

- Frontmatter: `title: "U01 — Introducción a Java"`, `description: ... ☕`
- `<p><small>desc</small></p>`
- `> 🗺️ El mapa del paquete:` ruta del viaje con emojis, "☕ AQUÍ ESTÁS (U01)"
- Bienvenida (párrafos, tono conversacional)
- `## 🎯 Objetivo de la unidad` (lista de capacidades)
- `## 🗺️ Mapa de la unidad` (tabla: Punto | Qué aprenderás | Nivel) con enlaces a los 9 puntos
- `> 📖 Flujo de lectura`
- `## 📝 Boletines de la unidad` (div `.ejercicio-links` con 5 enlaces)
- `## ✅ Criterios de evaluación cubiertos (RA1)` (tabla CE | Criterio | Dónde se cubre)
- `## 🚪 ¿Por dónde empiezo?`
- Primer punto + `⏭️ Al acabar la unidad, continúa en U02`

### Punto de teoría `01-introduccion/0X-*.md`

- Frontmatter: `title: "0X — Título"`, `description: ... 💡`
- Breadcrumb: `> 🗺️ Estás en: 🚀 U01 · Introducción a Java → 0X · Título`
- `## 📬 La idea en una frase`
- Secciones con analogías, tablas y ejemplos Java
- `## 🎯 Mini-chequeo` con `<details>`
- `## ✅ Resumen en 3 frases`
- `> 🐛 Vocabulario rápido` (tabla)
- Footer: `📚 [Volver al índice] · **Anterior:** ... · **Siguiente:** [0X+1]`

### Punto 09 `09-head-first.md`

- Todas las secciones: ⭐ Sé el Código, 🔥 Fireside Chat, 🕵️ ¿Quién Soy?, 🤬 CONRAD VS EL MUNDO, ⚡ Laboratorio de Tortura (fallo intencionado), 🏆 Logros, 🧠 Atrévete a Pensar, 🧩 Crucigrama de Bits, 💬 Entrevista de trabajo, 🤷 No Hay Preguntas Tontas, 🎬 Poscréditos ("PRÓXIMAMENTE EN U02").

### Boletines

- `boletin-U01-inicial.md`: conserva ejercicios 1-6 del actual `boletin-01-inicial.md` + amplía a 8+.
- `boletin-U01-inicial-resuelto.md`: 1:1 con el inicial, soluciones en `<details>`.
- `boletin-U01-avanzado.md`: base = actual `boletin-01-intermedio.md`, ampliado a 8+ con **Pista:** en enunciados.
- `boletin-U01-avanzado-resuelto.md`: 1:1 con el avanzado.
- `boletin-U01-extras.md`: conserva el aviso actual.

## Continuidad narrativa

- Personaje CONRAD = compilador cascarrabias. Secciones Head First adaptadas a Java.
- Poscréditos enlaza con U02 (variables, tipos y operadores).

## URLs

- ES: `/ApuntesProgramacion/01-introduccion`, `/ApuntesProgramacion/01-introduccion/0X-*`, `/ApuntesProgramacion/boletines/boletin-U01-*`
- VA: `/ApuntesProgramacion/va/...` análogo