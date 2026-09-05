# Revisión Unidad 12 — Ficheros y Expresiones Regulares

**Fecha:** 28/08/2026 · **Estado:** ✅ revisada (expandida al estándar)
**Alcance:** índice + 9 puntos + 5 boletines, en castellano y valenciano (30 archivos).

## Contexto

La antigua U11 "Consola, Ficheros y Regex" perdió la sección de consola (movida a U02 punto 7) y ahora es SOLO **Ficheros y Expresiones Regulares**. Emoji 📁. Cubre RA5 (c, d, e) y RA6 (g).

## Verificación realizada

- **Estructura**: 9 puntos (01-clase-file, 02-escribir-leer-texto, 03-try-with-resources, 04-printwriter-scanner-file, 05-nio-files-paths, 06-serializacion, 07-regex-basica, 08-regex-aplicaciones, 09-repaso-interactivo).
- **Compilación**: validador de correo/DNI/teléfono con regex verificado. **Error real encontrado y corregido** (ver abajo).
- **1:1 ES/VA**: nombres idénticos, ejercicios 1:1 (inicial 9, avanzado 9, extras 6 con katas y AER 108/140).
- **Referencias a consola**: apuntan a U02 punto 7 (nota en el índice), correcto.

## Hallazgos

### 🟡 Medio — corregido ✅

1. **Punto 08 · ValidadorRegex (ES y VA)**: `esDNIValido` hacía `dni.toUpperCase()` antes de matchear, pero el ejemplo esperaba `false` para `"12345678z"` (minúscula). Con `toUpperCase()` daba `true`, contradiciendo la explicación. Corregido quitando el `toUpperCase()`: ahora `"12345678z"` → `false` como indica el texto. Verificado por compilación y ejecución: `true, false, true, false, true, false`.

**Resultado: ✅ pasada** (build 425 páginas).