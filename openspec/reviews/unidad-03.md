# Revisión Unidad 03 — Estructuras de Control y Excepciones

**Fecha:** 26/08/2026 · **Estado:** ✅ revisada y corregida
**Alcance:** índice + 9 puntos + 5 boletines, en castellano y valenciano (30 archivos).
**Método:** lectura completa bilingüe + compilación de bloques Java con `javac 25` + checklist es-ES/estructura/claridad.

---

## Resultado de la verificación técnica (javac)

- **108 bloques** de código detectados en teoría + boletines (ES + VA).
- **39 programas completos compilados OK** + **3 verificados manualmente** (`Cajero`, `MaquinaExpendedora`, `Notas` dependen de excepciones propias definidas en bloques separados; compilan con su clase, confirmado).
- **66 omitidos**: fragmentos sin `main`, programas con `Scanner`/input, o bloques con errores intencionales.
- **Laboratorio (punto 09)** verificado: la versión rota produce errores de compilación y la solución imprime `25` y `5` correctamente.

**Verificación técnica: ✅ PASADA** (0 errores reales).

---

## Hallazgos y estado

### 🔴 Crítico — corregido ✅

1. **Punto 09 · Laboratorio de tortura (ES y VA)**
   El código roto no cuadraba con el enunciado:
   - Decía «3 errores de compilación + 1 de lógica», pero solo había 2 de compilación (falta `{`, falta `;`).
   - **No había error de lógica**: con `i < 10` la suma de impares da 25 correctamente, y «El número de impares es: 5» también es correcto. La solución del texto se contradecía a sí misma.
   - **Rediseñado**: 3 errores de compilación reales (falta `{`, `string[]`→`String[]`, falta `;`) + 1 de lógica real (`suma = suma - i;` → compila pero da -25). Verificado por ejecución: la versión rota falla, la solución imprime 25 y 5.

### 🟡 Medio — corregido ✅

2. **Punto 02 · tipos que admite `switch` (ES y VA)**
   «Antes solo admitía `int`, `char` y `String` (a partir de Java 7 también `String`)» — contradictorio. Corregido: «Admite tipos enteros, `char` y `enum`; a partir de Java 7 también `String`».

3. **Boletín avanzado · Ejercicio 5 (Escapista) (ES y VA)**
   La solución mostraba primero una salida **incorrecta** (`11 12 21 22 31 32`) y luego la corregía con una nota. Confirmado por ejecución: la salida real es `11 12 13 21 22 23 31 41` (el `break exterior` nunca se dispara porque el `continue exterior` salta antes). Reescribida la solución directa y limpia.

### 🟢 Menor — corregido ✅

4. **Índice VA · «chicha»**
   «amb molta chicha extra» → «amb molta cosa extra» (castellanismo en valenciano).

### Sin cambio — decisiones documentadas

5. **Puntos 03/06 · fragmentos con `Scanner` sin `import`**
   Son fragmentos ilustrativos, no programas completos. El `import` se muestra en los programas completos del punto 06. Aceptable.

6. **`throw new ArithmeticException(...)` en `CuentaBancaria` (punto 08)**
   Usa `ArithmeticException` para un caso de negocio; es un ejemplo simple y didáctico. Aceptable.

---

## Resumen de la revisión

| Dimensión | Estado |
|---|---|
| Corrección técnica Java | ✅ Pasada (39 programas OK + 3 manuales, 0 errores) |
| es-ES | ✅ Cumple |
| Claridad pedagógica | ✅ Nivel cero, analogías, humor, términos definidos |
| Estructura spec | ✅ Frontmatter, breadcrumb, mini-chequeo, resumen, vocabulario, navegación encadenada |
| Boletines 1:1 | ✅ Propuestos = resueltos (ES y VA) |
| VA | ✅ Traducción natural, mismos slugs |
| Coherencia global | ✅ Enlaces válidos, sin "Head First", "continúa en U04" correcto |

**Total hallazgos:** 1 🔴 + 2 🟡 + 1 🟢 = 4 → **todos corregidos** (+2 documentados sin cambio).