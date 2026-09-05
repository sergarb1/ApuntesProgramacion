# Revisión Unidad 08 — Herencia, Polimorfismo e Interfaces

**Fecha:** 27/08/2026 · **Estado:** ✅ revisada y corregida
**Alcance:** índice + 9 puntos + 5 boletines, en castellano y valenciano (30 archivos).
**Método:** lectura completa bilingüe + compilación y ejecución con `javac 25` de los bloques clave + checklist es-ES/estructura/claridad.

---

## Resultado de la verificación técnica (javac)

- **Compilado y ejecutado:** encadenado `super` (punto 02) → `Soy un vehículo / Soy un coche deportivo / Soy un coche deportivo` ✓; polimorfismo (punto 04) → `Hola desde B / C / C` ✓ y `Coche acelera` ✓; **ejercicio 9 avanzado** (vehículos con combustible) tras corregir el bucle infinito; **Kaprekar** → `3 8 5 0 7` ✓.
- Salidas del resto verificadas por traza manual (familia musical, cadena de constructores, gatos, etc.).

**Verificación técnica: ✅ PASADA** (tras las correcciones).

---

## Hallazgos y estado

### 🔴 Crítico — corregido ✅

1. **Boletín avanzado · Ejercicio 9 (ES y VA): bucle infinito en el `while`**
   La solución usaba `while (v.combustible > 0)` con `abstract void mover()`. Cuando el combustible quedaba por debajo del gasto (pero > 0), `mover()` imprimía "Sin combustible" sin reducir el combustible → **bucle infinito**. Rediseñado: `abstract boolean mover()` devuelve `true` si pudo moverse y el `while (v.mover())` lo usa. Enunciado y resuelto actualizados en ES y VA.
2. **Boletín avanzado-resuelto · Ejercicio 9: `public abstract class Vehiculo` junto a `public class Circuito` en el mismo archivo** → error de compilación ("class Vehiculo is public, should be declared in a file named Vehiculo.java"). Quitado el `public` de `Vehiculo`/`Vehicle` (ES y VA).

### 🟡 Medio — corregido ✅

3. **Boletín inicial-resuelto · Ejercicio 5 (ES y VA): salida incorrecta**
   El enunciado usa clases `X/Y/Z` (referencias `X, X, Y` y objetos `Y, Z, Z`), pero el resuelto decía `Y / C / C` (clases que no existen en el enunciado). Corregido a `Y / Z / Z` con la explicación actualizada.

### 🟢 Menor — corregido ✅

4. **Índice ES:** "hierarquías" → "jerarquías" (línea 100).
5. **Punto 09 · Crucigrama:** `CLASSCASTEXCEPTION` tiene 18 letras, no 16. Corregido en ES y VA.

### Sin cambio — decisiones documentadas

6. **Kata "Adam and Eve"** (`boletin-U08-extras`): la solución incluye una clase `Human` con constructor público y getters; es válida para la kata real (la verificación de CodeWars comprueba la jerarquía `Man`/`Woman extends Human` y el método estático `God.create()`). Aceptable.
7. **AceptaElReto 100 (Kaprekar):** la solución maneja repdigits con retorno `8` y el caso `6174` con `0`, coherente con la corrección de la U04. Verificado ejecutando la entrada de ejemplo → `3 8 5 0 7`.

---

## Resumen de la revisión

| Dimensión | Estado |
|---|---|
| Corrección técnica Java | ✅ Pasada (bucle infinito y visibilidad corregidos, salidas verificadas) |
| es-ES | ✅ Cumple (vocabulario, números, mayúsculas) |
| Claridad pedagógica | ✅ Nivel cero, analogías (chaqueta del padre, contrato, boceto), EL RING y Fireside |
| Estructura spec | ✅ Frontmatter comillado, breadcrumb, mini-chequeo, resumen, vocabulario, navegación encadenada |
| Boletines 1:1 | ✅ Propuestos = resueltos (ES y VA) |
| VA | ✅ Traducción natural, mismos slugs, títulos coherentes |
| Coherencia global | ✅ Enlaces válidos, sin "Head First", "continúa en U09" correcto |

**Total hallazgos:** 2 🔴 + 1 🟡 + 2 🟢 = 5 → **todos corregidos** (+2 documentados sin cambio).