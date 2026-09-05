# Revisión Unidad 04 — Arrays (nueva tras reordenamiento)

**Fecha:** 28/08/2026 · **Estado:** ✅ revisada (tras reordenamiento a 14 unidades)
**Alcance:** índice + 9 puntos + 5 boletines, en castellano y valenciano (30 archivos).

---

## Contexto del reordenamiento

La antigua U09 "Arrays y Colecciones" se dividió en **U04 Arrays** (puntos de teoría de arrays) y **U10 Colecciones** (colecciones). Esta unidad ahora va justo después de U03 (Estructuras de control), ANTES de algorítmica, corrigiendo el defecto pedagógico de que U04/U05 usaban arrays sin haberlos enseñado.

## Verificación realizada

- **Estructura**: 9 puntos (01-arrays-basicos → 09-repaso-interactivo), índice con RA6, 5 boletines `boletin-u04-*` (ES+VA).
- **Títulos**: unificados al estándar "NN · Título" con comillas.
- **Breadcrumbs/pies**: corregidos (el subagente dejó "U04 · Arrays" y `/04-arrays` correctos).
- **Referencias cruzadas**: corregidas las que apuntaban a la antigua U09 ("la U10" → "la U04" en argumentos, métodos String, boletines U01/U02/U07/U08); las que apuntan a colecciones (U10) son correctas.
- **Compilación**: `BeTheSort` (binarySearch tras sort → 3) y `BeTheArray` (duplicado → 12) verificados con javac.
- **Boletines**: redistribuidos desde el staging U09 (inicial: booleanos, NPE, mayor, pares, length vs length(), suma impares, búsqueda lineal, inverso, clase Arrays; avanzado: fusión, rotación, diagonales, estadísticas, buscaminas, ¿está ordenado?, inverso en el sitio, cuenta parejas, compactar ceros; extras: 4 katas + 2 AER con URLs reales).
- **1:1 ES/VA**: nombres idénticos, traducción natural.

## Hallazgos

- 🟢 **Títulos con `-` en vez de `·`** (del subagente): corregidos en los 18 archivos de puntos (ES+VA).
- 🟢 **Referencias a la antigua U09/arrays**: corregidas en 6 archivos (ES y VA).
- 🟢 **Índice VA U02** (unidad vecina): estaba corrupto (mojibake doble codificación) → reescrito limpio; punto `02-string-constantes-final` VA también reparado.

**Resultado: ✅ pasada** (build 353 páginas).