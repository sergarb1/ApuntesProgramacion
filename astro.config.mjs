import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

export default defineConfig({
  site: 'https://sergarb1.github.io/ApuntesProgramacion',
  base: '/ApuntesProgramacion',
  integrations: [
    starlight({
      title: {
        es: 'Apuntes Programación Java',
        va: 'Apunts Programació Java',
      },
      description: 'Curso completo de Programación en Java para DAM/DAW. CC BY-SA 4.0 — Sergi Garcia Barea',
      customCss: [
        './src/styles/custom.css',
        '@fontsource/geist-sans',
      ],
      locales: {
        root: { label: 'Español', lang: 'es' },
        va: { label: 'Valencià', lang: 'va' },
      },
      defaultLocale: 'root',
      social: [
        { icon: 'github', label: 'GitHub', href: 'https://github.com/sergarb1/ApuntesProgramacion' },
      ],
      head: [
        { tag: 'meta', attrs: { name: 'theme-color', content: '#2d8a4e' } },
        { tag: 'link', attrs: { rel: 'icon', type: 'image/png', href: '/ApuntesProgramacion/favicon.png' } },
      ],
      sidebar: [
        {
          slug: 'index',
          label: 'Inicio',
          translations: { va: 'Inici' },
        },
        {
          label: '📚 Unidades',
          translations: { va: '📚 Unitats' },
          items: [
            { slug: '01-introduccion', label: '🚀 1. Introducción a Java', translations: { va: '🚀 1. Introducció a Java' } },
            { slug: '02-variables-tipos-operadores', label: '🔤 2. Variables, Tipos y Operadores', translations: { va: '🔤 2. Variables, Tipus i Operadors' } },
            { slug: '03-estructuras-control-excepciones', label: '🔀 3. Estructuras de Control', translations: { va: '🔀 3. Estructures de Control i Excepcions' } },
            { slug: '04-algoritmica-fundamentos', label: '🧩 4. Algorítmica I: Fundamentos', translations: { va: '🧩 4. Algorítmica I: Fonaments' } },
            { slug: '05-algoritmica-tecnicas', label: '⚡ 5. Algorítmica II: Técnicas', translations: { va: '⚡ 5. Algorítmica II: Tècniques' } },
            { slug: '06-poo-clases-objetos', label: '🏗️ 6. POO: Clases y Objetos', translations: { va: '🏗️ 6. POO: Classes i Objectes' } },
            { slug: '07-visibilidad-encapsulacion-static', label: '🔒 7. Visibilidad y Static', translations: { va: '🔒 7. Visibilitat, Encapsulació i Static' } },
            { slug: '08-herencia-polimorfismo-interfaces', label: '🧬 8. Herencia, Polimorfismo e Interfaces', translations: { va: '🧬 8. Herència, Polimorfisme i Interfícies' } },
            { slug: '09-arrays-colecciones', label: '📚 9. Arrays y Colecciones', translations: { va: '📚 9. Arrays i Col·leccions' } },
            { slug: '10-genericos-mapas', label: '🗺️ 10. Genéricos y Mapas', translations: { va: '🗺️ 10. Genèrics i Mapes' } },
            { slug: '11-consola-ficheros-regex', label: '📁 11. Consola, Ficheros y Regex', translations: { va: '📁 11. Consola, Fitxers i Expressions Regulars' } },
            { slug: '12-conexion-bases-datos', label: '🗄️ 12. Conexión a BD con JDBC', translations: { va: '🗄️ 12. Connexió a BD amb JDBC' } },
            { slug: '13-apis-web', label: '🌐 13. Servir y Consumir APIs con Web', translations: { va: '🌐 13. Servir i Consumir APIs amb Web' } },

          ],
        },
        {
          label: '📝 Boletines',
          translations: { va: '📝 Butlletins' },
          items: [
            ['🚀','🔤','🔀','🧩','⚡','🏗️','🔒','🧬','📚','🗺️','📁','🗄️','🌐'].flatMap((emoji, i) => {
              const n = i + 1, nn = String(n).padStart(2,'0');
              return [{
                label: `${emoji} Boletín Unidad ${nn}`,
                translations: { va: `${emoji} Butlletí Unitat ${nn}` },
                items: [
                  { slug: `boletin-${nn}-inicial-resuelto`, label: '✅ Inicial resuelto', translations: { va: '✅ Inicial resolt' } },
                  { slug: `boletin-${nn}-inicial`, label: '🟢 Inicial por resolver', translations: { va: '🟢 Inicial per resoldre' } },
                  { slug: `boletin-${nn}-intermedio-resuelto`, label: '💪 Intermedio resuelto', translations: { va: '💪 Intermedi resolt' } },
                  { slug: `boletin-${nn}-intermedio`, label: '📝 Intermedio por resolver', translations: { va: '📝 Intermedi per resoldre' } },
                  { slug: `boletin-${nn}-extras`, label: '⭐ Extras', translations: { va: '⭐ Extres' } },
                ],
              }];
            }),
          ],
        },
      ],
    }),
  ],
});
