# Revisión Unidad 13 — Conexión a Bases de Datos con JDBC

**Fecha:** 28/08/2026 · **Estado:** ✅ revisada (expandida al estándar)
**Alcance:** índice + 9 puntos + 5 boletines, en castellano y valenciano (30 archivos).

## Verificación realizada

- **Estructura**: 9 puntos (01-que-es-jdbc, 02-conexion, 03-statement-resultset, 04-crud, 05-preparedstatement, 06-pattern-dao, 07-transacciones, 08-buenas-practicas, 09-repaso-interactivo), índice con RA9 (a-g), 5 boletines `boletin-u13-*`.
- **Punto 05 (PreparedStatement y SQL injection)**: revisado en detalle — concatenación vulnerable, historia de Bobby Tables, placeholders desde índice 1, `setXxx`, limitación (no `?` para identificadores). Técnicamente correcto.
- **1:1 ES/VA**: nombres idénticos, ejercicios 1:1 (inicial 9, avanzado 9, extras 6 con katas SQL y AER 245/424).
- **Referencias a unidades**: correctas (excepciones→U03, POJO/DAO→U07/U08, try-with-resources→U12, cierre→U14).

## Hallazgos

- 🟢 Los bloques de JDBC requieren SQLite/Maven para ejecutarse; la revisión se hizo por análisis de sintaxis y coherencia (patrón estándar JDBC). No se ejecutaron contra una BD real (requiere dependencia), pero el código sigue el patrón correcto.

**Resultado: ✅ pasada** (build 425 páginas).