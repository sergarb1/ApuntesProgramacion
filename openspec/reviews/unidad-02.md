# Revisión Unidad 02 — Variables, Tipos y Operadores (actualizada)

**Fecha:** 28/08/2026 · **Estado:** ✅ revisada (tras reordenamiento a 14 unidades)
**Alcance:** índice + 10 puntos + 5 boletines, en castellano y valenciano.

---

## Cambios tras el reordenamiento

1. **Nuevo punto 07 · Consola: salida formateada y errores de entrada** (`07-consola-salida-formateada.md`, ES+VA): cubre `printf`, `String.format`, `NumberFormat` y los errores del Scanner (`InputMismatchException`, `hasNextInt()`, `close()`). Desplaza los antiguos 07-09 a 08-10 (Math.random→08, Métodos String→09, Repaso→10).
2. **Boletines ampliados** (regla "al modificar puntos, mover/ampliar boletines"):
   - Inicial: ejercicios 10-12 (printf con conversiones, la nota con dos decimales, la propina con dos decimales).
   - Avanzado: ejercicios 10-11 (ticket de compra con NumberFormat, la edad a prueba de bombas con hasNextInt).
   - Extras: kata Get the Middle Character (7 kyu).
   Los ejercicios se migraron desde los boletines de la antigua U11 (consola), ahora U12 (solo ficheros y regex).
3. **Navegación renumerada**: breadcrumbs "Estás en", pies Anterior/Siguiente, mapa del índice (10 filas), flujo de lectura ("9 primeros puntos... el 10º").

## Verificación

- **Compilación**: `Formateo` (punto 07) → "Trabajo: 5 horas a 12,5 €/hora = 62,50 €" ✓.
- **1:1 ES/VA**: ejercicios 10-12 (inicial) y 10-11 (avanzado) presentes en resueltos y VA.
- **Reparación de codificación**: el índice VA de U02 estaba corrupto (mojibake por doble codificación UTF-8/CP1252); reescrito limpio. El punto `02-string-constantes-final` VA también reparado.
- **Referencias cruzadas**: "formatos de salida bonitos llegan en la U12" → corregido a "usa printf (lo viste en el punto 7)"; "la U10" (arrays) → "la U04" en métodos de String.

**Resultado: ✅ pasada** (build 353 páginas).