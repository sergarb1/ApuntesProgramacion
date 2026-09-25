# Contexto: Pipeline de diagramas Excalidraw para Astro/Starlight

**ESTE DOCUMENTO CONTIENE INSTRUCCIONES ESTRICTAS PARA EL AGENTE DE IA.**

Objetivo: mantener un pipeline de diagramas Excalidraw gestionado mediante MCP + Skill, exportando exclusivamente a SVG estático en Astro.

---

## 0. Estado actual (verificado en este proyecto)

| Elemento | Estado |
| --- | --- |
| MCP `excalidraw` en `~/.config/opencode/opencode.json` | ✅ Configurado |
| Skill `excalidraw-skill` en `~/.config/opencode/skills/` | ✅ Instalada |
| Servidor canvas `http://127.0.0.1:3000` | Verificar con `npx -y mcp-excalidraw-server status` |

> **Ruta agnóstica:** `~/.config/opencode/` funciona en todos los SO con expansión de shell.
> En Windows, `~` = `%USERPROFILE%` (p. ej. `C:\Users\<user>\.config\opencode\`).
> **NO usar** `%APPDATA%\opencode\` (OpenCode no lo usa).

**Obligatorio para la IA:** invocar la skill `excalidraw-skill` (o leer su `SKILL.md`) ANTES de dibujar cualquier diagrama.

---

## 1. Roles: IA vs. Humano

### La IA SÍ debe hacer (automático)
1. Detectar SO y resolver rutas con variables de entorno agnósticas.
2. Verificar conexión: `npx -y mcp-excalidraw-server status` → debe dar `running: true`.
3. Crear `public/diagrams/` si no existe.
4. Seguir el workflow de generación (ver §3).
5. Validar visualmente con `describe` + `screenshot` hasta que el diagrama sea legible.
6. Exportar `.excalidraw` + `.svg` a `public/diagrams/`.
7. Insertar el Markdown con ruta absoluta correcta (ver §2).
8. Limpiar temporales y canvas antes del siguiente diagrama.

### La IA SOLO debe PEDIR al humano (nunca ejecutar ella misma)
1. **Abrir el navegador** en `http://127.0.0.1:3000` si `browserClients < 1`.
   - Sugerir el comando según SO, sin ejecutarlo:
     - Windows: `Start-Process "http://127.0.0.1:3000"`
     - macOS: `open "http://127.0.0.1:3000"`
     - Linux: `xdg-open "http://127.0.0.1:3000"`
2. **Instalar dependencias** o modificar `package.json` / `astro.config.mjs` (prohibido salvo petición explícita).
3. **Hacer commit o push** (solo si el usuario lo pide explícitamente).

---

## 2. Arquitectura de archivos (ESTRICTA)

| Artefacto | Ubicación exacta |
| --- | --- |
| SVG exportado | `public/diagrams/NOMBRE.svg` |
| Fuente editable | `public/diagrams/NOMBRE.excalidraw` |
| Diccionario de iconos | `docs/excalidraw-icons.md` |
| Referencia en Markdown | `![Descripción didáctica](/ApuntesProgramacion/diagrams/NOMBRE.svg)` |

**Base path del sitio:** `/ApuntesProgramacion` (definido en `astro.config.mjs`).
Todas las rutas Markdown de diagramas DEBEN incluir este prefijo.

### Restricciones de Astro/Starlight (PROHIBIDO / OBLIGATORIO)

- **PROHIBIDO** usar `@excalidraw/excalidraw` como componente React.
- **PROHIBIDO** guardar SVGs en `src/assets/` (Starlight/Astro no los servirá como se espera).
- **PROHIBIDO** crear páginas `.astro` o `.mdx` solo para renderizar diagramas.
- **OBLIGATORIO** usar SOLO la carpeta `public/diagrams/`.
- **OBLIGATORIO** ruta Markdown absoluta respecto a la raíz del sitio: `/ApuntesProgramacion/diagrams/NOMBRE.svg`.

---

## 3. Workflow de generación (Pipeline obligatorio)

Por cada diagrama, seguir EXACTAMENTE este orden:

### 3.1 Preparación
```bash
# Verificar servidor (IA)
npx -y mcp-excalidraw-server status
# Si browserClients < 1 → pedir al humano abrir http://127.0.0.1:3000 (ver §1)

# Limpiar canvas anterior (IA)
npx -y mcp-excalidraw-server clear --yes
```

### 3.2 Creación
1. Escribir los elementos JSON en un archivo temporal (p. ej. `%TEMP%\tmp-diagrama.json` o `$env:TEMP\tmp-diagrama.json`).
2. Añadir usando CLI (**no** `batch_create_elements` MCP, que no admite `fillStyle`):
```bash
npx -y mcp-excalidraw-server add "$TEMP/tmp-diagrama.json"
```

### 3.3 Iteración (validación visual)
1. `npx -y mcp-excalidraw-server describe` → revisar estructura.
2. `npx -y mcp-excalidraw-server screenshot --out preview.png` → revisar imagen.
3. Corregir solapes, textos truncados y flechas cruzadas hasta que sea legible y limpio.

### 3.4 Exportación
```bash
# Fuente editable
npx -y mcp-excalidraw-server export --out public/diagrams/NOMBRE.excalidraw

# Imagen SVG
npx -y mcp-excalidraw-server export_to_image --format svg --out public/diagrams/NOMBRE.svg
```

### 3.5 Validación del SVG
- Comprobar que el archivo pesa **> 1 KB**.
- Si está vacío o mide ~20x20 px: reintentar forzando viewport con `scrollToContent` (o MCP `set_viewport`) y reexportar.

### 3.6 Limpieza
```bash
npx -y mcp-excalidraw-server clear --yes
# Borrar el JSON temporal
```

---

## 4. Sistema de diseño pedagógico

**Prioridad absoluta: claridad lógica y pedagógica, no estética.**

### Reglas duras (restricciones, no sugerencias)

| Regla | Valor / acción |
| --- | --- |
| **Fuentes** | **SIEMPRE** `cascadia` para TODO (texto y código); `helvetica` solo si se pide. **PROHIBIDO** Virgil/Excalifont/Comic/manuscrita. Tras cada `update`, verificar `fontFamily` antes de exportar |
| `fillStyle` | **OBLIGATORIO** `"solid"` (el hachurado parece borrador) |
| Texto en cajas de contenido | **DENTRO** del `rectangle`/`ellipse` (bound-label, autocentra) |
| Zonas de agrupación | Fondos grandes **SIN** `text` interior; título = texto libre en esquina superior izquierda |
| Conexiones | **SIEMPRE** `startElementId` + `endElementId` |
| Etiqueta de flecha | Solo si ≤ 12 caracteres; omitir si ensucia |
| Margen mínimo (gap) | **≥ 120 px** entre zonas |
| Trazado | **PROHIBIDO** diagonales que crucen zonas; priorizar ortogonales / elbowed |
| Fondos | Claros; texto oscuro |
| Rojo | **SOLO** errores/fallos |
| Tamaño de texto | Cuerpo ≥ 16; títulos 20–28 |
| Tamaño de formas | ≥ 120×60 px |
| Rejilla | 20 px |

---

## 5. Gestión de iconos de red/sistemas

1. Buscar librerías `.excalidrawlib`.
2. Si se usan: extraer a JSON temporal → limpiar coordenadas → regenerar IDs → importar con `mode: "merge"`.
3. Guardar los iconos válidos resultantes en `docs/excalidraw-icons.md` para reutilizar.
4. Si no hay icono exacto: abstraer con formas simples (`rect` + `text`).

---

## 6. Integración y limpieza final

- Los documentos `.md` residen en `src/content/docs/` (ES) y `src/content/docs/va/` (VA).
- **Bilingüe obligatorio:** todo cambio de contenido aplica a ambos idiomas.
- Todos los textos alternativos (`alt`) en **español (es-ES)**, tono técnico y didáctico.
- Antes de commit:
  1. Eliminar archivos `.json` temporales.
  2. No alterar dependencias en `package.json` ni `astro.config.mjs`.
  3. Commit/push **SOLO** si el usuario lo solicita explícitamente.
