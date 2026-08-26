# Curso Programación Java — DAM/DAW

**CC BY-SA 4.0** — Sergi Garcia Barea

## Descripción
Curso completo de Programación en Java para DAM/DAW (o cualquier persona que quiera iniciarse), organizado en 15 unidades didácticas en Markdown. Cada unidad indica al final qué RAs oficiales del BOE cubre. Publicado como web estática con **Astro + Starlight** + GitHub Pages.

## Unidades (14)
```
01-introduccion.md                    → RA1
02-variables-tipos-operadores.md      → RA2
03-estructuras-control-excepciones.md → RA3
04-algoritmica-fundamentos.md         → RA2, RA6
05-algoritmica-tecnicas.md            → RA2, RA6
06-poo-clases-objetos.md              → RA2, RA4
07-visibilidad-encapsulacion-static.md → RA4
08-herencia-polimorfismo-interfaces.md → RA4, RA7
09-arrays-colecciones.md              → RA6
10-genericos-mapas.md                 → RA6
11-consola-ficheros-regex.md          → RA5
12-conexion-bases-datos.md            → RA9
13-apis-web.md                        → RA5
14-proyecto-final.md                  → RA5, RA6, RA9
```

## Boletines (5 por unidad)
```
boletin-XX-inicial.md             → Propuestos fáciles (ejercicios diferentes del resuelto)
boletin-XX-inicial-resuelto.md    → Mismos ejercicios que inicial.md con soluciones.
boletin-XX-intermedio.md          → Propuestos intermedios (ejercicios diferentes del resuelto)
boletin-XX-intermedio-resuelto.md → Mismos ejercicios que intermedio.md con soluciones.
boletin-XX-extras.md              → CodeWars + AceptaElReto con pistas.
```

## Estilo
Humor, secciones "⭐ Be the Code", "¡No hay preguntas tontas!", [NOTE]/[WARNING]/[TIP] en blockquotes, lenguaje conversacional en castellano y valenciano. Formato Markdown compatible con Google Docs (importación directa).

## 🗣️ Requisito lingüístico (es-ES)
Todo el contenido dirigido al usuario en castellano debe estar redactado en **español de España natural (es-ES)**. Este requisito NO aplica a `src/content/docs/va/` (valenciano).

### Vocabulario peninsular
| Evitar | Preferir |
| --- | --- |
| prender / prendida | encender / encendida |
| empacar / desempacar | empaquetar / desempaquetar |
| cómputo | procesamiento |
| hacer click / Click derecho | hacer clic / clic derecho |
| driver (en prosa) | controlador |
| armar (= montar) | montar |
| bajar una descarga | descargar |
| correr un programa/servicio | ejecutar / arrancar |
| email (en prosa) | correo |
| manejar (= gestionar) | gestionar |
| monitorear / monitoreo | monitorizar / monitorización |
| computadora | ordenador |
| celular | móvil |
| laptop / notebook | portátil |
| mouse | ratón |

Sustitución siempre contextual: no tocar `aprender`/`comprender`/`sorprender`; conservar `manejar` como destreza ("saber manejar una herramienta"); conservar términos técnicos ingleses asentados (`router`, `socket`, `software`, `backup`, `timeout`...) y todo lo que esté dentro de código, comandos, identificadores o sintaxis.

### Mayúsculas
Estilo oracional español en títulos y encabezados: solo la primera palabra y los nombres propios; siglas y denominaciones técnicas con su forma oficial (`JVM`, `POO`, `DNI`, `HTTP`); sin Title Case ni encabezados en mayúsculas salvo marcas deliberadas del proyecto (`Fireside Chat`, `BE THE CODE`, nombres de katas CodeWars).

### Números
Formato numérico español: punto para miles (`65.536`), coma para decimales (`2,4 GHz`), espacio antes del símbolo (`0,50 €`). Nunca modificar números dentro de código, IPs, versiones, rutas ni salidas de programa.

### Comprobación obligatoria
Antes de dar por terminado cualquier contenido nuevo o modificado:
1. Revisar vocabulario es-ES.
2. Revisar mayúsculas de títulos.
3. Revisar formato numérico.
4. Comprobar que código e identificadores siguen intactos.
5. Lectura final: ¿suena natural para un profesor de España?
6. **Checklist de unidades:** cada unidad nueva o ampliada debe superar esta revisión lingüística completa antes de cerrarse (ver también la nota 13).

## Bilingüe obligatorio
**Cualquier cambio debe aplicarse SIEMPRE en ambos idiomas:**
- `src/content/docs/` → Castellano (raíz `/`)
- `src/content/docs/va/` → Valenciano (`/va/`)

Ambos deben mantener la misma estructura, contenido y calidad. Las traducciones al valenciano deben ser naturales, no literales.

## Stack tecnológico
- **Framework:** [Astro](https://astro.build/) + [Starlight](https://starlight.astro.build/)
- **Tema:** Verde calma (#2d8a4e) + degradados + Geist Sans
- **Idiomas:** Castellano (raíz `/`) y Valenciano (`/va/`)
- **Selector idioma:** Botón verde destacado en la cabecera (CSS personalizado)
- **Buscador:** Pagefind integrado (Starlight)
- **PDF:** `starlight-to-pdf` (generar PDF completo del sitio, por idioma)
- **EPUB:** Pandoc (generar EPUB con sintaxis coloreada y portada)
- **Fuente:** Geist Sans (Vercel)
- **Despliegue:** GitHub Actions → GitHub Pages (`main` branch)

## Estructura del proyecto
```
src/content/docs/            → Markdown (castellano, raíz)
src/content/docs/va/         → Markdown (valenciano)
src/content/docs/index.md    → Portada (imagen principal) + cards unidades + barra descargas + boletin-cards + licencia
src/styles/custom.css        → CSS premium (paleta, botón idioma, hero, cards, download-bar)
public/portada.png           → Imagen de portada para PDF/EPUB (castellano, también en web)
public/portada_val.png       → Imagen de portada en valenciano para PDF/EPUB y web
public/                      → PDFs y EPUBs exportados
public/epub/                 → EPUBs generados (ApuntesProgramacion-cast.epub, -val.epub)
public/pdf/                  → PDFs generados (ApuntesProgramacion-es.pdf, -va.pdf)
portada.png                  → Portada común para PDF/EPUB (original en raíz, castellano)
portada_val.png              → Portada en valenciano para PDF/EPUB (raíz)
scripts/
  pdf-cover.html             → Portada del PDF con imagen + título superpuesto (castellano)
  pdf-cover-va.html          → Portada del PDF en valenciano
  pdf-header.html            → Header vacío (elimina la hora de impresión por defecto)
  pdf-footer.html            → Pie con número de página y línea decorativa
  generate-epub.ps1          → Genera EPUB con Pandoc
  epub.css                   → CSS para bloques de código en EPUB
  generate-boletines.ps1     → Genera boletines desde plantillas
  transform-boletines.ps1    → Transforma boletines entre idiomas
  gen.ps1                    → Utilidad de generación
  gen-avanzado-extras.ps1    → Genera ejercicios avanzados/extras
  boletines.ps1              → Utilidad de boletines
strip_solutions.py           → Script para quitar soluciones de boletines resuelto
astro.config.mjs             → Config principal (sidebar, i18n, plugins, emojis unidades)
.github/workflows/deploy.yml → CI/CD para GitHub Pages
```

## Descargas
- **PDF:** `npm run pdf:es` / `npm run pdf:va` (genera PDF por idioma con portada, sin header hora, footer estilizado)
- **EPUB:** `npm run epub:all` (genera EPUB castellano + valenciano con portada y sintaxis coloreada)
- Los enlaces de descarga están disponibles en la página de inicio (`index.md`)

## CI/CD
- `.nojekyll` en raíz del repo para evitar build Jekyll de GitHub Pages
- `actions/checkout@v5` + `actions/setup-node@v5` con Node 24
- `actions/upload-pages-artifact@v5` + `actions/deploy-pages@v5` (Node 24, sin warnings)

## Google Docs
Cada .md se importa directamente a Google Docs:
1. Abrir docs.google.com → Archivo → Importar
2. Seleccionar el .md → se renderiza con títulos, código, tablas y listas

## Referencias externas
- **CodeWars**: katas recomendadas por unidad (8kyu→5kyu según dificultad)
- **AceptaElReto.com**: problemas del concurso ProgramaMe referenciados por número

## Comandos
```bash
npm run dev       # Servidor local (http://localhost:4321/ApuntesProgramacion)
npm run build     # Build estático en dist/
npm run preview   # Previsualizar build
npm run pdf:es    # Generar PDF castellano en public/pdf/
npm run pdf:va    # Generar PDF valenciano en public/pdf/
npm run pdf:local:es  # PDF castellano desde localhost
npm run pdf:local:va  # PDF valenciano desde localhost
npm run epub      # Generar EPUB castellano en public/epub/
npm run epub:all  # Generar EPUB ambos idiomas
```

## Notas
- Extras (CodeWars + AceptaElReto): solo desde unidad 3 (las dos primeras no tienen contenido relacionado)
- Los .md en `va/` deben mantenerse siempre sincronizados con los de castellano
- `starlight-llm-actions` eliminado por incompatibilidad; PDF por página con Ctrl+P del navegador
- `ca/` renombrado a `va/` para usar el código ISO correcto del valenciano
- Las unidades en el sidebar llevan emojis temáticos (🚀, 🔤, 🔀, 🧩, ⚡, 🏗️, 🔒, 🧬, 📚, 🗺️, 📁, 🗄️, 🌐)
- El layout de la web usa las 3 columnas por defecto de Starlight (sidebar, contenido, TOC derecho)
- `portada.png` se usa como portada común para PDF y EPUB, y se muestra en la web como hero de la landing (castellano)
- `portada_val.png` es la portada en valenciano para web, PDF y EPUB
- Las rutas de la portada en `index.md` y `pdf-cover.html` usan URL absoluta (`https://sergarb1.github.io/ApuntesProgramacion/portada.png`) para que funcionen tanto en web como en PDF generado
- Sección de boletines dedicada al final de la landing (`📝 Boletines`); las cards de unidades no incluyen boletines
- `Ver unidad` en las cards es un botón verde degradado (`.unit-link` en `custom.css`)
- PDF generado con `--preceding-html scripts/pdf-cover.html` (portada castellano) o `scripts/pdf-cover-va.html` (portada valenciano), `--header scripts/pdf-header.html` (vacío, elimina hora), `--footer scripts/pdf-footer.html` (numeración estilizada)
- **13 · Lingüística:** todo contenido en castellano cumple el «Requisito lingüístico (es-ES)» de la sección Estilo (vocabulario peninsular, mayúsculas oracionales, formato numérico español); revisión obligatoria antes de cerrar cualquier unidad o boletín.
