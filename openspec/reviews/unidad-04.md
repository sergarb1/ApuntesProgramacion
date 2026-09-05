# Revisión Unidad 04 — Algorítmica I: Fundamentos

**Fecha:** 26/08/2026 · **Estado:** ✅ revisada y corregida
**Alcance:** índice + 9 puntos + 5 boletines, en castellano y valenciano (30 archivos).
**Método:** lectura completa bilingüe + compilación y ejecución de bloques Java con `javac 25` + checklist es-ES/estructura/claridad.

---

## Resultado de la verificación técnica (javac + ejecución)

- **74 bloques** de código detectados en teoría + boletines (ES + VA).
- **26 programas completos compilados OK** (0 fallos).
- **48 omitidos**: fragmentos, métodos sin `main`, katas, o bloques con errores intencionales (retos `TU CÓDIGO AQUÍ`, laboratorio, `BurbujaLiosa`).
- **Ejecución verificada** de las soluciones clave: búsqueda lineal (23→4), binaria (31→6), burbuja e inserción (arrays ordenados correctamente), `BombollaRecuento` (**7** intercambios), `ContadorIntercambios` (5), Misterio binaria (**3 pasos, posición 3**), `BombollaMinima` (1 2 3).

**Verificación técnica: ✅ PASADA** (0 errores reales).

---

## Hallazgos y estado

### 🔴 Crítico — corregido ✅

1. **Punto 09 · Misterio (Sé el Código) (ES y VA)**
   Las opciones estaban **intercambiadas**:
   - La opción correcta es `Encontrado en 3 con 3 pasos` (verificado por ejecución), pero estaba marcada como ❌.
   - La opción `Encontrado en 3 con 1 pasos` estaba marcada como ✅, con una explicación que se contradecía («¡Bingo en 3 pasos!»).
   - **Corregido** en ES y VA: opción 2 marcada como correcta, opción 1 como incorrecta.

2. **Boletín avanzado-resuelto · Ejercicio 3 (ES y VA)**
   La solución decía `Intercambios: 6` sobre `{9, 3, 7, 1, 5}`, pero la ejecución real da **7**. Corregido a 7 en ES y VA.

3. **Punto 09 · Laboratorio de tortura (ES y VA)**
   El «error de lógica» duplicaba el error de índices (ambos eran `j < datos.length`). Rediseñado: el error de lógica ahora es la comparación invertida (`datos[j] < datos[j+1]` → ordena de mayor a menor, imprime `4 3 2 1`). La solución ordena a `1 2 3 4`. Verificado por ejecución.

### 🟢 Menor — corregido ✅

4. **Punto 06 · encabezado (ES)**
   `## 📏 las reglas prácticas de Big O` → `Las reglas...` (mayúscula inicial). El VA ya estaba correcto (`Les regles`).

5. **Índice VA (U04)**
   «machaques» → «domines» y «molta chicha» → «molta cosa» (castellanismos en valenciano).

### Sin cambio — decisiones documentadas

6. **`BurbujaLiosa` (punto 08)** — bloque con errores intencionales (`j < arr.length` con `arr[j+1]`): es el ejercicio de detectar errores. Correcto.

7. **Fragmentos de código con métodos sin `main`** (buscar, ordenar...) — son métodos de ejemplo, no programas completos; los programas de prueba están en los boletines. Aceptable.

---

## Resumen de la revisión

| Dimensión | Estado |
|---|---|
| Corrección técnica Java | ✅ Pasada (26 programas OK + ejecución de salidas, 0 errores) |
| es-ES | ✅ Cumple |
| Claridad pedagógica | ✅ Nivel cero, analogías (cocina, diccionario, cartas), humor |
| Estructura spec | ✅ Frontmatter, breadcrumb, mini-chequeo, resumen, vocabulario, navegación encadenada |
| Boletines 1:1 | ✅ Propuestos = resueltos (ES y VA) |
| VA | ✅ Traducción natural, mismos slugs |
| Coherencia global | ✅ Enlaces válidos, sin "Head First", "continúa en U05" correcto |

**Total hallazgos:** 3 🔴 + 2 🟢 = 5 → **todos corregidos** (+2 documentados sin cambio).