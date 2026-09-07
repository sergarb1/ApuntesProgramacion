# Revisión Unidad 12 — Programación Funcional

**Fecha:** 07/09/2026 · **Estado:** ✅ revisada (nueva unidad, creada tras el reordenamiento a 15 unidades)
**Alcance:** índice + 9 puntos + 5 boletines, en castellano y valenciano (30 archivos).

## Contexto

Nueva unidad insertada entre U11 (Genéricos y Mapas) y U13 (Ficheros y Regex). Emoji 🎯. Cubre RA6 (streams sobre colecciones) y RA7 (características avanzadas del lenguaje). La antigua U12-U14 se renumeró a U13-U15.

## Verificación realizada

- **Estructura**: 9 puntos (01-lambdas, 02-interfaces-funcionales, 03-referencias-metodos, 04-streams-basicos, 05-streams-intermedias, 06-streams-terminales, 07-streams-colecciones, 08-optional, 09-repaso-interactivo).
- **Compilación**: programa con `filter`, `map`, `distinct`, `mapToInt().sum()`, `sorted().skip().limit().collect()` compilado y ejecutado → `[2, 4, 6]`, `[4, 4]`, `[sol, mar, luna]`, `21`, `[3, 4]` ✓ (todas las salidas correctas).
- **Optional**: punto 08 cubre `ofNullable`, `orElse`, `orElseGet` (API moderna).
- **1:1 ES/VA**: nombres idénticos, ejercicios 1:1 (inicial 9, avanzado 9, extras 6 con katas y AER 219/105).
- **Boletines en orden**: `inicial → inicial-resuelto → avanzado → avanzado-resuelto → extras` (por-resolver primero) en el índice.
- **Referencias a unidades**: correctas (colecciones→U10, genéricos→U11, ficheros→U13, cierre→U13).

## Hallazgos

- 🟢 Sin errores técnicos en lambdas, interfaces funcionales, streams u Optional.

**Resultado: ✅ pasada** (build 455 páginas).