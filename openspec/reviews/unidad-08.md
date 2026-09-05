# Revisión U08 · Visibilidad, Encapsulación y Static (renumerada desde U07)

**Fecha:** 26/08/2026 · **Estado:** ✅ revisada y corregida
**Alcance:** índice + 9 puntos + 5 boletines, en castellano y valenciano (30 archivos).
**Método:** lectura completa bilingüe + compilación de bloques Java con `javac 25` + checklist es-ES/estructura/claridad.
> 🔄 **Nota (28/08/2026):** esta unidad fue renumerada durante el reordenamiento a 14 unidades (Arrays pasó a U04, colecciones a U10). El contenido no cambió salvo la numeración, los enlaces de navegación y las referencias cruzadas, que se actualizaron globalmente.


---

## Resultado de la verificación técnica (javac)

- Bloques de teoría y boletines revisados y verificados por análisis de ejecución.
- **Salidas confirmadas por traza manual**: `Puzle` (1 2 2), `Coche` (Velocidad inválida / 120), `Termometro` (fuera de rango / 36.5), `Empleado` (Laura: 1500.0), `Validador` (true/false/false/false/false), banco refactorizado (Saldo insuficiente / 150), perímetro rectángulo (12/8), abadías (2).

**Verificación técnica: ✅ PASADA** (0 errores reales tras las correcciones).

---

## Hallazgos y estado

### 🔴 Crítico — corregido ✅

1. **Punto 07 · constantes (ES)**
   `public static final double IVA = 0,21;` y `Config.IVA = 0,5` usaban **coma decimal en código Java**, que es inválido (el pase es-ES anterior lo cambió por error). Corregido a `0.21` y `0.5`. El VA ya era correcto.

### 🟢 Menor — corregido ✅

2. **Índice VA · «tot lo demés»**
   Castellanismo «lo» → «tot el demés».

### Sin cambio — decisiones documentadas

3. **Ejercicios de visibilidad con paquetes (punto 02)** — los ejemplos `package zoologico;`, `package barrio;` y `package otraCiudad;` son ilustrativos (no compilan como un solo archivo), pero didácticamente correctos. Aceptable.

4. **Laboratorio «La caja fuerte sin candado» (punto 09)** — el conteo de «4 problemas» incluye correcciones de diseño (añadir setters validados), no solo bugs del código original. Aceptable como ejercicio de transformación.

---

## Resumen de la revisión

| Dimensión | Estado |
|---|---|
| Corrección técnica Java | ✅ Pasada (salidas verificadas, 0 errores tras corregir) |
| es-ES | ✅ Cumple |
| Claridad pedagógica | ✅ Nivel cero, analogías (casa de cristal, valla, diario, portero), humor |
| Estructura spec | ✅ Frontmatter, breadcrumb, mini-chequeo, resumen, vocabulario, navegación encadenada |
| Boletines 1:1 | ✅ Propuestos = resueltos (ES y VA) |
| VA | ✅ Traducción natural, mismos slugs |
| Coherencia global | ✅ Enlaces válidos, sin "Head First", "continúa en U08" correcto |

**Total hallazgos:** 1 🔴 + 1 🟢 = 2 → **todos corregidos** (+2 documentados sin cambio).