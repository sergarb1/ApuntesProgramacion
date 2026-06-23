# ☕ Apuntes Programación Java — DAM/DAW

Curso completo de **Programación en Java** para los ciclos de **Desarrollo de Aplicaciones Multiplataforma (DAM) y Desarrollo de Aplicaciones Web (DAW)**, o para cualquier persona que quiera iniciarse en la programación. Material bilingüe (castellano / valencià) con un enfoque práctico y progresivo.

🌐 **Web del curso:** [sergarb1.github.io/ApuntesProgramacion](https://sergarb1.github.io/ApuntesProgramacion/)

---

## 📚 Unidades

| # | Unidad | RA |
|---|--------|----|
| 1 | 🚀 Introducción a Java y Entornos de Desarrollo | RA1 |
| 2 | 🔤 Variables, Tipos de Datos y Operadores | RA2 |
| 3 | 🔀 Estructuras de Control y Excepciones | RA3 |
| 4 | 🧩 Algorítmica I: Fundamentos | RA2, RA6 |
| 5 | ⚡ Algorítmica II: Técnicas | RA2, RA6 |
| 6 | 🏗️ POO: Clases y Objetos | RA2, RA4 |
| 7 | 🔒 Visibilidad, Encapsulación y Static | RA4 |
| 8 | 🧬 Herencia, Polimorfismo e Interfaces | RA4, RA7 |
| 9 | 📚 Arrays y Colecciones | RA6 |
| 10 | 🗺️ Genéricos y Mapas | RA6 |
| 11 | 📁 Consola, Ficheros y Regex | RA5 |
| 12 | 🗄️ Conexión a BD con JDBC | RA9 |
| 13 | 🌐 Servir y Consumir APIs con Web | RA5 |
| 14 | Proyecto Final | RA5, RA6, RA9 |

## 📝 65 Boletines de ejercicios

Cada unidad tiene **5 boletines** con dificultad progresiva:
- 🟢 **Inicial** — Propuestos (ejercicios básicos)
- ✅ **Inicial resuelto** — Con soluciones paso a paso
- 📝 **Intermedio** — Propuestos (nivel creciente)
- 💪 **Intermedio resuelto** — Con soluciones
- ⭐ **Extras** — CodeWars + AceptaElReto

## 📖 Estilo pedagógico

Tono conversacional en castellano y valenciano, con humor, secciones ⭐ **Be the Code**, ❓ **¡No Hay Preguntas Tontas!**, y [NOTE]/[WARNING]/[TIP] en blockquotes.

---

## ⬇️ Descargas

| Formato | Castellano | Valenciano |
|---------|-----------|------------|
| **PDF** | [ApuntesProgramacion-es.pdf](https://sergarb1.github.io/ApuntesProgramacion/pdf/ApuntesProgramacion-es.pdf) | [ApuntesProgramacion-va.pdf](https://sergarb1.github.io/ApuntesProgramacion/pdf/ApuntesProgramacion-va.pdf) |
| **EPUB** | [ApuntesProgramacion-cast.epub](https://sergarb1.github.io/ApuntesProgramacion/epub/ApuntesProgramacion-cast.epub) | [ApuntesProgramacion-val.epub](https://sergarb1.github.io/ApuntesProgramacion/epub/ApuntesProgramacion-val.epub) |

---

## 🚀 Desarrollo

```bash
npm install
npm run dev           # local: http://localhost:4321/ApuntesProgramacion
npm run build         # genera dist/
npm run pdf:es        # PDF castellano en public/pdf/
npm run pdf:va        # PDF valenciano en public/pdf/
npm run pdf:local:es  # PDF castellano desde localhost
npm run pdf:local:va  # PDF valenciano desde localhost
npm run epub:all      # EPUB ambos idiomas en public/epub/
```

## ⚙️ Tecnologías

- **Framework:** [Astro](https://astro.build/) + [Starlight](https://starlight.astro.build/)
- **Idiomas:** Castellano (`es`) y Valenciano (`va`)
- **Fuente:** Geist Sans (Vercel)
- **PDF:** `starlight-to-pdf` (portada, numeración, sin header hora)
- **EPUB:** Pandoc con sintaxis coloreada
- **Buscador:** Pagefind
- **Despliegue:** GitHub Actions → GitHub Pages

---

## 📄 Licencia

**CC BY-SA 4.0** — *Sergi Garcia Barea*

[Licencia Creative Commons Atribución-CompartirIgual 4.0 Internacional](https://creativecommons.org/licenses/by-sa/4.0/deed.es)
