# Revisión Unidad 05 — Algorítmica II: Técnicas

**Fecha:** 26/08/2026 · **Estado:** ✅ revisada y corregida
**Alcance:** índice + 9 puntos + 5 boletines, en castellano y valenciano (30 archivos).
**Método:** lectura completa bilingüe + compilación y ejecución de bloques Java con `javac 25` + checklist es-ES/estructura/claridad.

---

## Resultado de la verificación técnica (javac + ejecución)

- **81 bloques** de código detectados en teoría + boletines (ES + VA).
- **48 programas completos compilados OK** (0 fallos).
- **33 omitidos**: fragmentos, katas, o bloques con errores intencionales.
- **Ejecución verificada** de las soluciones clave: `FiboContador` (fibo(30)=832040, 2692537 llamadas), `PotenciaRapida` (2^20=1048576), `HanoiContador` (7), `CambioMonedas` (1×100,1×50,1×20,1×2,1×1), `MisterioRecursivo` (5,7), `GuardianPalindromos` (true,true,false), `TorturaOrdenacion` ([1..7]).

**Verificación técnica: ✅ PASADA** (0 errores reales tras las correcciones).

---

## Hallazgos y estado

### 🔴 Crítico — corregido ✅

1. **Boletín inicial-resuelto · Ejercicio 8 (ES y VA)**
   `esPalindromo("reconocer", 0, 9)` pero "reconocer" tiene 9 letras (índices 0-8) → `charAt(9)` lanza **`StringIndexOutOfBoundsException`** (confirmado por ejecución). Corregido a `0, 8`.

2. **Boletín avanzado-resuelto · Ejercicio 3 (ES y VA)**
   Índices erróneos en las frases:
   - `"Anita lava la tina"` (length 18) con `fin=16` no cubría la última letra → daba `false` en vez de `true`. Corregido a `fin=17`.
   - `"Dábale arroz a la zorra el abad"` (length 31) con `fin=32` → `charAt(32)` excepción.
   - Además, la frase "Dábale..." **no es palíndromo con `Character.toLowerCase()`**: los acentos no se normalizan (`'á' != 'a'`), por lo que daba `false` (confirmado por ejecución). **Sustituida** por `"La ruta natural"` (palíndroma sin tildes) en enunciado y solución, y añadida una nota explicando el tema de los acentos.

3. **Punto 04 · traza de Quicksort (ES y VA)**
   La "Ejecución paso a paso" decía «Pivote = 5» con `{3,1,4,1,5,9,2,6}`, pero la implementación (`arr[(izq+der)/2]`) elige `arr[3]` = **1**. La traza no cuadraba con el código. Reescrita con la traza real (pivote 1, intercambios 0↔3, i=2/j=0).

4. **Punto 08 · salida del CambioMonedas (ES y VA)**
   La salida decía `3×1` céntimo, pero con 173 céntimos el resultado real es `1×100, 1×50, 1×20, 1×2, 1×1` (confirmado por ejecución). Corregido.

### 🟢 Menor — corregido ✅

5. **Boletín extras · Kata 4 (ES y VA)**
   «El firmante siempre da una semilla» → «El enunciado siempre da una semilla» (palabra errónea).

### Sin cambio — decisiones documentadas

6. **Blockquotes `> [!NOTE]`/`[!WARNING]`/`[!TIP]`** en los puntos 01-08 (estilo GitHub Alerts) frente a `> 💡`/`> ⚠️` del resto del curso. Inconsistencia de formato, pero funcional en Starlight. Se documenta por si se quiere unificar en el futuro.

7. **`> [!NOTE]` factorial `long`**: `fact(20)` ≈ 2,43×10¹⁸, al límite de `long`. Correcto.

---

## Resumen de la revisión

| Dimensión | Estado |
|---|---|
| Corrección técnica Java | ✅ Pasada (48 programas OK + ejecución de salidas, 0 errores tras corregir) |
| es-ES | ✅ Cumple |
| Claridad pedagógica | ✅ Nivel cero, analogías (ascensor, póker, cebolla), humor |
| Estructura spec | ✅ Frontmatter, breadcrumb, mini-chequeo, resumen, vocabulario, navegación encadenada |
| Boletines 1:1 | ✅ Propuestos = resueltos (ES y VA) |
| VA | ✅ Traducción natural, mismos slugs |
| Coherencia global | ✅ Enlaces válidos, sin "Head First", "continúa en U06" correcto |

**Total hallazgos:** 4 🔴 + 1 🟢 = 5 → **todos corregidos** (+2 documentados sin cambio).