# Revisión Unidad 01 — Introducción a Java

**Fecha:** 26/08/2026 · **Estado:** ✅ revisada y corregida
**Alcance:** índice + 9 puntos + 5 boletines, en castellano y valenciano (30 archivos).
**Método:** lectura completa bilingüe + compilación automática de bloques Java con `javac 25` + checklist es-ES/estructura/claridad.

---

## Resultado de la verificación técnica (javac)

- **44 bloques** de código Java detectados en los archivos de la unidad.
- **31 compilados OK** (programas completos autocontenidos).
- **9 omitidos** (fragmentos, bloques sin `main`, ejemplos con `Scanner`/input).
- **4 fallos de compilación**: todos son **errores intencionales** de ejercicios propuestos y tienen su versión resuelta que **sí compila**:

| Bloque | Archivo | Fallo esperado | Versión resuelta compila |
|---|---|---|---|
| `Erroneo` | punto 03 mini-chequeo | falta `;` | — (comprobar a mano) |
| `ErrorFinder` | boletín inicial propuesto | 4 errores intencionales | ✅ en `-resuelto` |
| `Completame` | boletín inicial propuesto | falta `;` y `}` | ✅ en `-resuelto` |
| `Detective` | boletín inicial propuesto | falta `;` y `}` | ✅ en `-resuelto` |

**Verificación técnica: ✅ PASADA** (los 4 fallos son los errores que el alumno debe encontrar).

---

## Hallazgos y estado

### 🔴 Crítico — corregido ✅

1. **Punto 07 · «El error del novato: 4 errores» (ES y VA)**
   El bloque tenía **5 errores** (el 5º era `SYSTEM.OUT.PRINTLN`, confirmado con `javac`: `package SYSTEM does not exist`).
   - **Corrección aplicada:** `SYSTEM.OUT.PRINTLN` → `System.out.println` en el bloque del enunciado (ES y VA). Recompilado: ahora produce **exactamente 4 errores**, coincidiendo con el enunciado y la solución.

### 🟡 Medio — corregido ✅

2. **Boletín inicial · Ejercicio 4 (ES y VA)**
   El enunciado decía «asegúrate de que los booleanos no lleven comillas», ambiguo con la salida esperada (el `true` sale como texto).
   - **Corrección aplicada:** enunciado aclarado en ES y VA: «`true` va como texto dentro de las comillas del `println`».

3. **Boletín inicial · Ejercicio 7 «Square(n) Sum»**
   - **Verificado:** la firma de la kata es `public static int squareSum(int[] n)`, idéntica a la solución del boletín. **Sin cambio necesario.**

### 🟢 Menor — corregido ✅

4. **Boletín extras (ES y VA)**
   Decía que CodeWars/AceptaElReto «cogen ritmo a partir de la unidad 3», aunque U01 ya incluye katas.
   - **Corrección aplicada:** matizado en ambos idiomas («ya has probado un primer contacto; el ritmo serio a partir de la unidad 3»).

5. **Boletín inicial VA · Ejercicio 4 y 9 — salida de ejemplo**
   Traducción parcial de la salida (`Edad`, `Lenguaje favorito` sin traducir).
   - **Corrección aplicada:** salida traducida a valenciano en propuesto y resuelto: `Nom`, `Edat`, `Llenguatge favorit`, `¿Emocionat?`; en el ejercicio 9 también `Frase: El codi ben escrit es comenta sol`.

6. **Punto 09 VA · nombres de sección**
   Secciones en valenciano no oracionales y `Post-Crèdits`.
   - **Corrección aplicada:** `Poscrèdits`, `Atreveix-te a pensar`, `Crucigrama de bits`, `Preguntes d'entrevista de treball` (coherente con el ES oracional).

### Sin cambio — decisiones documentadas

7. **Punto 05 · Javadoc con `@return` en método `void`** — humor deliberado auto-referencial. Se mantiene.
8. **Adelanto de conceptos** (`for`, `int`, `final`, `double`, `Scanner`, `while` en U01) — está avisado en el texto («lo verás en la U03»). Se mantiene como diseño pedagógico.

---

## Resumen de la revisión

| Dimensión | Estado |
|---|---|
| Corrección técnica Java | ✅ Pasada (44 bloques, 4 fallos intencionales explicados) |
| es-ES | ✅ Cumple |
| Claridad pedagógica | ✅ Nivel cero, analogías, humor, términos definidos |
| Estructura spec | ✅ Frontmatter, breadcrumb, mini-chequeo, resumen, vocabulario, navegación encadenada |
| Boletines 1:1 | ✅ Propuestos = resueltos; soluciones en `<details>` |
| VA | ✅ Traducción natural, mismos slugs, salidas y secciones coherentes |
| Coherencia global | ✅ Enlaces válidos, sin "Head First", "continúa en U02" correcto |

**Total hallazgos:** 1 🔴 + 3 🟡 + 3 🟢 = 7 → **6 corregidos, 1 verificado sin cambio, 2 documentados como diseño.**