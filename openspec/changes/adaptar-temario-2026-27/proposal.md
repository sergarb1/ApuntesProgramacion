# adaptar-temario-2026-27 — Reestructurar el temario al nuevo plan de unidades

## Contexto

El curso pasa a un nuevo plan de unidades didácticas (UD1–UD14 + anexo APIs) que reordena
contentidos: colecciones y genéricos/mapas se imparten como una única unidad, la programación
funcional pasa a ser la U12, ficheros la U13 y la conexión a bases de datos la U14. Las UDs 1 y 2
(pensamiento computacional e introducción a Java) no se tocan.

## Cambio propuesto

- **Fusión completa de U11 (Colecciones) + U12 (Genéricos y Mapas)** en una sola unidad
  `11-colecciones` («Colecciones, genéricos y mapas»): índice único de 9 puntos que integra los
  15 puntos de contenido actuales, y 5 boletines `boletin-U11-*` fusionados a partir de los 10
  actuales.
- **Renumeración** de unidades y boletines (ES y VA): `13-programacion-funcional` → `12-…`,
  `14-ficheros-regex` → `13-…`, `15-conexion-bases-datos` → `14-…`; boletines `u13→u12`,
  `u14→u13`, `u15→u14`. Actualización de frontmatter, breadcrumbs, navegación y cross-links.
- **U16 (APIs web) se mantiene como unidad 16 marcada como extra** (material de ampliación no
  evaluable) en sidebar, landing e índice de la unidad.
- **Actualización de navegación**: sidebar en `astro.config.mjs`, landing `index.md` + `va/index.md`,
  y `AGENTS.md` (lista de unidades).
- **Arreglo de enlaces de boletines rotos** detectados en los índices de unidad (`boletin-U122-*`,
  `boletin-U123-*`, … no coinciden con los slugs reales en minúscula).

## Aceptación

- 14 unidades estándar (índice + 9 puntos) + U16 extra, en castellano y valenciano, con YAML válido.
- 5 boletines por unidad con el orden estándar (inicial → inicial-resuelto → avanzado →
  avanzado-resuelto → extras) y soluciones 1:1.
- Sin enlaces rotos a unidades/boletines renumerados o fusionados.
- `npm run build` sin errores.
- Revisión lingüística es-ES y sincronía VA.
