# Revisión Unidad 10 — Colecciones (nueva tras reordenamiento)

**Fecha:** 28/08/2026 · **Estado:** ✅ revisada (tras reordenamiento a 14 unidades)
**Alcance:** índice + 9 puntos + 5 boletines, en castellano y valenciano (30 archivos).

---

## Contexto del reordenamiento

La antigua U09 "Arrays y Colecciones" se dividió en **U04 Arrays** y **U10 Colecciones**. Esta unidad va justo después de U09 (Herencia), como corresponde: las colecciones necesitan equals/hashCode (U08), genéricos/wrappers y el concepto de objeto. Emoji 📚.

## Verificación realizada

- **Estructura**: 9 puntos (01-arraylist-jcf, 02-linkedlist, 03-hashset, 04-treeset-linkedhashset, 05-iterator, 06-collections, 07-elegir-coleccion, 08-be-the-code, 09-repaso-interactivo), índice con RA6, 5 boletines `boletin-u10-*` (ES+VA).
- **Renombrado interno**: `02-linkedlist-hashset` → `02-linkedlist` y `03-iterator-collections` → `05-iterator`; los archivos viejos eliminados; cadena Anterior/Siguiente encadenada.
- **Repaso**: purgado de arrays (Fireside Array vs ArrayList → ArrayList vs LinkedList, laboratorio "el array que llora" → "la lista que llora", crucigrama con CONCURRENTMODIFICATIONEXCEPTION 31 letras verificado).
- **Boletines**: redistribuidos (remove por índice vs valor, ArrayList misterioso, cola del supermercado, intersección/unión de conjuntos, eliminar duplicados con LinkedHashSet, el remove que rompe el baile, filtrar con Iterator, TreeSet, katas Roman/arrayDiff/deleteNth, AER 158 y 168).
- **Compilación**: `Misterio` (ArrayList) → "1 3 10 4" ✓ (coincide con el resuelto).
- **1:1 ES/VA**: nombres idénticos (incluidos renombrados), traducción natural.

## Hallazgos

- 🟢 **Títulos con `-` en vez de `·`**: corregidos en los 18 archivos de puntos (ES+VA).
- 🟢 **Referencias a la antigua U09**: corregidas donde apuntaban a arrays; las de herencia (U09) y ficheros (U12) son correctas.

**Resultado: ✅ pasada** (build 353 páginas).