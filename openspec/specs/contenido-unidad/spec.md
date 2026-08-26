# contenido-unidad — Estándar de calidad de las unidades didácticas

> Barra de calidad "libro de verdad" que toda unidad (U01–U13) debe cumplir tras su ampliación. Prioridad: utilidad real para personas que parten de cero en Java.

## ADDED Requirements

### Requirement: Nivel de entrada cero

Cada punto de teoría debe ser comprensible para una persona sin conocimientos previos de programación.

#### Scenario: Definición de términos en el primer uso
- **WHEN** un lector sin conocimientos de Java lee cualquier punto de la unidad
- **THEN** cada término técnico o acrónimo (JVM, JDK, bytecode, IDE, breakpoint...) se define con lenguaje llano en su primer uso y no se asume jerga previa

#### Scenario: Analogía cotidiana
- **WHEN** se explica un concepto abstracto de programación
- **THEN** el texto incluye al menos una analogía de la vida diaria (cafetería, cocina, cartero, clase, barrio...) que aterrice el concepto

### Requirement: Tamaño de capítulo de libro

Cada punto debe tratarse en profundidad, no como resumen.

#### Scenario: Punto de teoría ampliado
- **WHEN** un revisor abre un punto de teoría de la unidad
- **THEN** el punto contiene contexto introductorio, explicación del concepto en varios párrafos, al menos una tabla o comparativa, un ejemplo concreto resuelto en Java y un mini-chequeo final; resultado objetivo ≈110–200 líneas por punto

#### Scenario: Detalle mínimo por sección temática
- **WHEN** el punto trata una sección temática (tipos de datos, estructuras de control, colecciones...)
- **THEN** cada elemento de esa sección tiene su propia explicación desarrollada y no una mera enumeración

### Requirement: Cierre Head First obligatorio

La unidad conserva las secciones de estilo Head First del proyecto.

#### Scenario: Secciones de consolidación presentes
- **WHEN** termina la lectura de la unidad
- **THEN** el punto 09 contiene: ⭐ Sé el Código, 🔥 Fireside Chat, 🕵️ ¿Quién Soy?, 🤬 CONRAD VS EL MUNDO, ⚡ Laboratorio de tortura, 🧠 Atrévete a pensar, 🧩 Crucigrama de bits, 💬 Entrevista de trabajo, 🤷 No hay preguntas tontas y 🎬 Post-Créditos

#### Scenario: Laboratorio con fallo intencionado
- **WHEN** se ejecuta el laboratorio de la unidad
- **THEN** incluye SIEMPRE un fallo intencionado que el alumno debe diagnosticar, con pistas escalonadas

### Requirement: Todo ejercicio con solución

No hay preguntas abiertas sin solución disponible sin spoilear.

#### Scenario: Soluciones ocultas
- **WHEN** el punto incluye ejercicios o adivinanzas
- **THEN** las soluciones se presentan dentro de bloque `<details><summary>...</summary>...</details>`

### Requirement: Coherencia factual y de estilo

El contenido es consistente con el resto del curso.

#### Scenario: Terminología unificada
- **WHEN** se usan conceptos compartidos con otras unidades (main, JVM, clase, objeto, método, array, Scanner...)
- **THEN** el término se usa con idéntico significado y ejemplos coherentes con el resto del curso

#### Scenario: Post-Créditos con continuidad
- **WHEN** se cierra la unidad
- **THEN** la escena de Post-Créditos enlaza de forma coherente con la siguiente unidad ("PRÓXIMAMENTE EN U0X") y ambas se corresponden; la última unidad (U13) usa "🏁 Fin del viaje" sin PRÓXIMAMENTE

### Requirement: Cobertura de criterios de evaluación

Cada unidad declara qué CEs cubre del RA correspondiente.

#### Scenario: Tabla de CEs en el índice de unidad
- **WHEN** un revisor consulta la página índice de la unidad
- **THEN** existe una tabla de criterios de evaluación del resultado de aprendizaje con su estado de cobertura (✅/apartado), construida desde `openspec/specs/ra-ce/spec.md`

### Requirement: Flujo de lectura encadenado

Cuando la unidad se amplía a varios archivos, el flujo de lectura entre puntos debe ser natural y navegable.

#### Scenario: Navegación entre puntos
- **WHEN** un usuario termina un punto de la unidad
- **THEN** puede continuar con el siguiente punto de forma obvia (enlace "Siguiente", "Anterior" y "Volver al índice de la unidad"), sin saltos bruscos de lógica

#### Scenario: Referencias cruzadas
- **WHEN** un punto menciona contenido de otra unidad o de otro punto
- **THEN** hay un enlace cruzado al punto correspondiente o una indicación clara ("se verá en U07")

### Requirement: Bilingüe obligatorio

Cada unidad se publica en castellano (raíz `/`) y valenciano (`/va/`).

#### Scenario: Archivos espejo
- **WHEN** se crea o modifica un archivo de una unidad en castellano
- **THEN** existe su versión valenciana equivalente en `src/content/docs/va/` con la misma estructura, contenido y calidad, traducida de forma natural (no literal)

#### Scenario: Mismo YAML y navegación
- **WHEN** se valida el YAML y la navegación de un lote
- **THEN** tanto las páginas de raíz como las de `/va/` pasan las mismas verificaciones (bad=0, "Volver al índice", enlace "Siguiente")

### Requirement: Boletines con pares resueltos

Los boletines viven en `src/content/docs/boletines/` (y `src/content/docs/va/boletines/`).

#### Scenario: Nombre y estructura
- **WHEN** se revisa una unidad
- **THEN** existen `boletin-UXX-inicial.md`, `boletin-UXX-inicial-resuelto.md`, `boletin-UXX-avanzado.md`, `boletin-UXX-avanzado-resuelto.md` (y el `boletin-UXX-extras.md` si procede), con mínimo 8 ejercicios y el resuelto 1:1 con soluciones en `<details>`

## Requirement: Lenguaje es-ES obligatorio

Todo el texto destinado al usuario está escrito en español de España natural, sin latinamericanismos evitables ni calcos innecesarios del inglés.

#### Scenario: Vocabulario peninsular
- **WHEN** se redacta o revisa cualquier párrafo, tabla, explicación o ejercicio en castellano
- **THEN** no aparecen formas como computadora, prender/prendida, celular, laptop, empacar, cómputo, monitorear, rmar cuando significa montar, manejar cuando significa gestionar, ni driver o email en prosa cuando exista una alternativa española natural, ni números con formato estadounidense

#### Scenario: Mayúsculas en títulos
- **WHEN** se redacta un título o nombre de sección en español
- **THEN** se utiliza estilo oracional: primera palabra y nombres propios en mayúscula, manteniendo las siglas y denominaciones técnicas en su forma oficial

#### Scenario: Terminología técnica
- **WHEN** se utiliza un término técnico inglés asentado
- **THEN** se mantiene cuando sea la forma habitual en informática
- **WHEN** exista un anglicismo evitable con una forma española natural
- **THEN** se utiliza la forma española

#### Scenario: Código y sintaxis técnica
- **WHEN** el término aparece dentro de código, comandos, identificadores, rutas, parámetros o sintaxis de protocolos
- **THEN** no se modifica por motivos lingüísticos
