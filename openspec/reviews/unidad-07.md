# Revisión U07 · POO: Clases y Objetos (renumerada desde U06)

**Fecha:** 26/08/2026 · **Estado:** ✅ revisada y corregida
**Alcance:** índice + 9 puntos + 5 boletines, en castellano y valenciano (30 archivos) + corrección de coherencia en U04 (Kaprekar).
**Método:** lectura completa bilingüe + compilación y ejecución de bloques Java con `javac 25` + checklist es-ES/estructura/claridad.
> 🔄 **Nota (28/08/2026):** esta unidad fue renumerada durante el reordenamiento a 14 unidades (Arrays pasó a U04, colecciones a U10). El contenido no cambió salvo la numeración, los enlaces de navegación y las referencias cruzadas, que se actualizaron globalmente.


---

## Resultado de la verificación técnica (javac + ejecución)

- Bloques de teoría y boletines compilados y ejecutados.
- **Soluciones verificadas por ejecución**: `CuentaBancaria` (punto 08, "Seat va a 50" en el laboratorio corregido), `Kaprekar` U06 (3524→3, 1111→8, 6174→0, 5555→8), taller de coches (150/90), área círculo (19.63), fracción (5/6), bloque Building blocks (48/88).

**Verificación técnica: ✅ PASADA** (0 errores reales tras las correcciones).

---

## Hallazgos y estado

### 🔴 Crítico — corregido ✅

1. **Punto 09 · Laboratorio de tortura (ES y VA)**
   El «error de lógica» duplicaba el error de compilación (`new Coche()` sin argumentos). Rediseñado: el error de lógica ahora es real y distinto — `velocidad -= inc` **resta** en vez de sumar (imprime `Seat va a -50`). La solución compila y da `Seat va a 50`. Verificado por ejecución.

2. **Coherencia cross-unidad — Kaprekar (AceptaElReto 100) en U04**
   El avanzado-resuelto y el extras de U04 tenían una solución con `while (numero != 6174)` que **hace bucle infinito para repdigits** (1111 → 0 → 0 → ...), y el texto decía «la diferencia da 0 y el bucle acaba» (incorrecto). El problema oficial de AceptaElReto pide **8** para repdigits (confirmado: la solución de U06 avanzado-resuelto lo maneja correctamente).
   - **Corregido** en `boletin-U04-avanzado-resuelto.md`, `boletin-U04-extras.md` y sus enunciados (ES y VA): añadido `esRepdigit` → 8, actualizado el ejemplo (1111 → `8`).

### 🟡 Medio — corregido ✅

3. **Boletín inicial · Ejercicio 8 «El taller de coches» (ES y VA)**
   El método se llamaba `acelelar` (typo por `acelerar`) en el código del enunciado y del resuelto. Corregido a `acelerar` (4 apariciones).

### 🟢 Menor — corregido ✅

4. **Índice VA · «eixir del lío»**
   Castellanismo «lío» → «eixir de l'embolic».

### Sin cambio — decisiones documentadas

5. **Misterio (Sé el Código) del punto 09** — el bloque pone `Galleta` y `Main` como clases públicas en el mismo código (no compila como archivo único, pero es un ejercicio conceptual de «¿qué imprime?» con la respuesta correcta limón/vainilla). Aceptable para la didáctica del repaso.

6. **Puntos 03-08** — usan atributos sin `private` (se ven en U07). Correcto pedagógicamente.

---

## Resumen de la revisión

| Dimensión | Estado |
|---|---|
| Corrección técnica Java | ✅ Pasada (soluciones ejecutadas, 0 errores tras corregir) |
| es-ES | ✅ Cumple |
| Claridad pedagógica | ✅ Nivel cero, analogías (cortapastas, galletas, taquillas), humor |
| Estructura spec | ✅ Frontmatter, breadcrumb, mini-chequeo, resumen, vocabulario, navegación encadenada |
| Boletines 1:1 | ✅ Propuestos = resueltos (ES y VA) |
| VA | ✅ Traducción natural, mismos slugs |
| Coherencia global | ✅ Enlaces válidos, sin "Head First", "continúa en U07" correcto; **coherencia Kaprekar U04↔U06 restaurada** |

**Total hallazgos:** 2 🔴 + 1 🟡 + 1 🟢 = 4 → **todos corregidos** (+2 documentados sin cambio).