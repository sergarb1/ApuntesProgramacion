# expand-u01 — Ampliar U01 Introducción a Java al estándar completo

## Contexto

La unidad U01 existe como un solo archivo `src/content/docs/01-introduccion.md` (~300 líneas). Debe ampliarse al estándar "índice + 9 puntos" del proyecto ApuntesRedes, conservando TODO el contenido factual actual y expandiéndolo, en castellano y valenciano.

## Cambio propuesto

- Crear `src/content/docs/01-introduccion.md` como índice de la unidad (≈80-100 líneas).
- Crear `src/content/docs/01-introduccion/` con 8 puntos de teoría + `09-head-first.md`.
- Mover y renombrar los boletines a `src/content/docs/boletines/` con el patrón `boletin-U01-*` (inicial/intermedio→avanzado/extras + resueltos).
- Duplicar todo en `src/content/docs/va/`.
- Actualizar el sidebar en `astro.config.mjs` (grupo por unidad) y la landing `index.md` + `va/index.md`.

## Aceptación

- 15 archivos por idioma (índice + 9 puntos + 5 boletines) con YAML válido (bad=0).
- Navegación: cada punto tiene "Volver al índice de la unidad" y enlace "Siguiente".
- `npm run build` sin errores.
- Boletines con mínimo 8 ejercicios y resueltos 1:1.