# Revisión Unidad 14 — Servir y Consumir APIs con Web

**Fecha:** 28/08/2026 · **Estado:** ✅ revisada (expandida al estándar)
**Alcance:** índice + 9 puntos + 5 boletines, en castellano y valenciano (30 archivos).

## Verificación realizada

- **Estructura**: 9 puntos (01-protocolo-http, 02-servidor-minimo, 03-sirviendo-html, 04-get-post, 05-devolviendo-json, 06-proyecto-rest, 07-httpclient, 08-httpclient-avanzado, 09-repaso-interactivo), índice con RA5 (c, f, g, h), cierre de curso motivador.
- **Compilación**: servidor mínimo con `HttpServer` compilado OK (javac).
- **Punto 02 (HttpServer)**: verificado — createContext, HttpExchange, sendResponseHeaders, error "Address already in use", correctos.
- **1:1 ES/VA**: nombres idénticos, ejercicios 1:1 (inicial 9, avanzado 9, extras 6 con katas de URLs/IP y AER 396/462).
- **Referencias a unidades**: correctas (colecciones→U10, genéricos→U11, ficheros→U12, JDBC→U13).

## Hallazgos

### 🟡 Medio — corregido ✅

1. **Índice (ES y VA)**: la nota RA5 decía "se completa con la **U11** (consola y formatos)" — error: la consola/formatos están en **U02** (punto 7). Corregido a U02 en ambos idiomas.

**Resultado: ✅ pasada** (build 425 páginas).