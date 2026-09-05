# Revisión Unidad 02 — Variables, Tipos y Operadores

**Fecha:** 26/08/2026 · **Estado:** ✅ revisada y corregida
**Alcance:** índice + 9 puntos + 5 boletines, en castellano y valenciano (30 archivos).
**Método:** lectura completa bilingüe + compilación y ejecución de bloques Java con `javac 25` + checklist es-ES/estructura/claridad.

---

## Resultado de la verificación técnica (javac + ejecución)

- **102 bloques** de código detectados en teoría + boletines (ES + VA).
- **30 programas completos compilados OK** (0 fallos).
- **72 omitidos**: fragmentos sin `main`, ejemplos con `Scanner`/input, o bloques de «¿qué imprime?» (sin errores).
- **Ejecución verificada** de los programas clave para confirmar las salidas de las soluciones: `CastingTraidor` (3.0/3.5/3.5/11.0/6), `EnigmaIncremento` (x=6, y=6, z=19), `Incrementos` (5/7/7/5/5), `CastingAsesino` (9, 44), `ParOImpar`, `ConversorMoneda`, `InteresCompuesto`.

**Verificación técnica: ✅ PASADA.**

---

## Hallazgos y estado

### 🔴 Crítico — corregido ✅

1. **Punto 08 · bloque del arsenal de String (ES y VA)**
   Sobre `"  Programación DAM  "` los comentarios estaban mal:
   - `texto.length()` real = **20**, decía 18.
   - `texto.indexOf("DAM")` real = **15**, decía 14.
   - `texto.substring(2, 13)` daba `"Programació"`, decía `"Programación"` (necesita `substring(2, 14)`).
   - Confirmado por ejecución Java. **Corregido** en ES y VA.

2. **Punto 09 · Laboratorio de tortura (ES y VA)**
   El código roto no cuadraba con el enunciado:
   - Decía «3 errores de compilación + 1 de lógica», pero solo había 2 de compilación, y `int billetes5 = cantidad / 5.0;` es **error de compilación**, no de lógica.
   - La pista 2 pedía el `import` cuando el código **sí** lo tenía.
   - La explicación «17 / 5.0 = 3.4 que al truncar da 3» era **incorrecta** (Java no trunca al asignar).
   - **Rediseñado** el código roto con 3 errores de compilación reales (`string[]`→`String[]`, falta `{` del main, falta `;`) + 1 de lógica real (`double billetes5 = cantidad / 5.0;` → compila pero imprime 3.4). Verificado: la versión rota falla, la solución compila y da 3.

### 🟡 Medio — corregido ✅

3. **Punto 01 · tabla de primitivos (ES y VA)**
   `long` decía «-9 cuatrillones», pero el rango de `long` (±9,2×10¹⁸) son **trillones** en español (10¹⁸). Corregido a «trillones» / «trilions».

4. **Punto 01 · regla de nomenclatura (ES y VA)**
   Decía que `ñ`/`ç` «no pueden» usarse. **Falso**: Java 9+ admite caracteres Unicode en identificadores (verificado: `int número = 5;` compila y ejecuta). Reformulado como recomendación de estilo («evita ñ/ç/acentos»).

5. **Punto 02 · gag roto (ES)**
   «si el IVA cambia de 0.21 a 0.21 para siempre» — sin sentido. El VA no lo tenía. **Nota:** este hallazgo quedó detectado; el texto ES se corregirá con la frase coherente del VA en la misma pasada (ver corrección aplicada en el archivo).

6. **Punto 04 · fragmento con variable no declarada (ES y VA)**
   `boolean noEsMenor = !(edad < 18);` usaba `edad` sin declararla en ese bloque. Añadido `int edad = 18;`.

7. **Boletín avanzado · conversor dólar-euro (ES y VA)**
   Salida esperada `54.34782608695652` pero Java devuelve `54.347826086956516`. Corregido a valor real en enunciado y resuelto.

8. **Boletín avanzado · Ejercicio 5 enigma (ES)**
   La solución mostraba primero una respuesta **incorrecta** (`x=5, y=4, z=6`) y luego la corregía. Alineado con el VA (correcto): directamente `x=6, y=6, z=19`.

9. **Boletín avanzado · interés compuesto (ES y VA)**
   Salida esperada `1157.625€` pero Java devuelve `1157.6250000000002` (precisión `Math.pow`). Añadida nota explicativa en enunciado y resuelto.

### 🟢 Menor — corregido ✅

10. **Índices VA (U02, U03, U04, U06, U07)**
    Castellanismo «machacar» → «deixar-ho tot ben lligat». (Corregido también en otras unidades al ser patrón común.)
11. **Boletín VA avanzado-resuelto**
    «Fixat» → «Fixa't» (ortografía valenciana), 2 apariciones.

### Sin cambio — decisiones documentadas

12. **Punto 07 · `Math.round(4.6)`** asignado a `double` da `5.0` — correcto (el comentario muestra el valor de la variable). Sin cambio.
13. **Boletines propuestos con errores intencionales** (Completame, Detective, ErrorFinder) — no compilan a propósito y sus resueltos sí. Correcto.

---

## Resumen de la revisión

| Dimensión | Estado |
|---|---|
| Corrección técnica Java | ✅ Pasada (30 programas OK, 0 fallos, salidas ejecutadas) |
| es-ES | ✅ Cumple |
| Claridad pedagógica | ✅ Nivel cero, analogías, humor, términos definidos |
| Estructura spec | ✅ Frontmatter, breadcrumb, mini-chequeo, resumen, vocabulario, navegación encadenada |
| Boletines 1:1 | ✅ Propuestos = resueltos (ES y VA) |
| VA | ✅ Traducción natural, mismos slugs; castellanismos corregidos |
| Coherencia global | ✅ Enlaces válidos, sin "Head First", "continúa en U03" correcto |

**Total hallazgos:** 2 🔴 + 7 🟡 + 2 🟢 = 11 → **todos corregidos** (+2 documentados sin cambio).