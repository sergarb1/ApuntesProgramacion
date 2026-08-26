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
            {
              label: '🚀 1. Introducción a Java',
              translations: { va: '🚀 1. Introducció a Java' },
              items: [
                { slug: '01-introduccion', label: '📌 Índice de la unidad', translations: { va: '📌 Índex de la unitat' } },
                { slug: '01-introduccion/01-que-es-java', label: '01 · ¿Qué es Java?', translations: { va: '01 · Què és Java?' } },
                { slug: '01-introduccion/02-instalacion-jdk', label: '02 · Instalación del JDK', translations: { va: '02 · Instal·lació del JDK' } },
                { slug: '01-introduccion/03-hola-mundo', label: '03 · Tu primer programa', translations: { va: '03 · El teu primer programa' } },
                { slug: '01-introduccion/04-depurador', label: '04 · El depurador', translations: { va: '04 · El depurador' } },
                { slug: '01-introduccion/05-comentarios', label: '05 · Comentarios y documentación', translations: { va: '05 · Comentaris i documentació' } },
                { slug: '01-introduccion/06-argumentos', label: '06 · Argumentos de línea de comandos', translations: { va: '06 · Arguments de línia de comandes' } },
                { slug: '01-introduccion/07-errores-compilador', label: '07 · El compilador y sus errores', translations: { va: '07 · El compilador i els seus errors' } },
                { slug: '01-introduccion/08-ide-flujo-trabajo', label: '08 · El IDE y tu flujo de trabajo', translations: { va: "08 · L'IDE i el teu flux de treball" } },
                { slug: '01-introduccion/09-repaso-interactivo', label: '09 · Repaso interactivo', translations: { va: '09 · Repàs interactiu' } },
              ],
            },
            {
              label: '🔤 2. Variables, Tipos y Operadores',
              translations: { va: '🔤 2. Variables, Tipus i Operadors' },
              items: [
                { slug: '02-variables-tipos-operadores', label: '📌 Índice de la unidad', translations: { va: '📌 Índex de la unitat' } },
                { slug: '02-variables-tipos-operadores/01-variables-tipos-primitivos', label: '01 · Variables y tipos primitivos', translations: { va: '01 · Variables i tipus primitius' } },
                { slug: '02-variables-tipos-operadores/02-string-constantes-final', label: '02 · String, constantes y final', translations: { va: '02 · String, constants i final' } },
                { slug: '02-variables-tipos-operadores/03-operadores-aritmeticos', label: '03 · Operadores aritméticos', translations: { va: '03 · Operadors aritmètics' } },
                { slug: '02-variables-tipos-operadores/04-operadores-relacionales-logicos', label: '04 · Relacionales, lógicos y ternario', translations: { va: '04 · Relacionals, lògics i ternari' } },
                { slug: '02-variables-tipos-operadores/05-casting-conversiones', label: '05 · Casting y conversiones', translations: { va: '05 · Casting i conversions' } },
                { slug: '02-variables-tipos-operadores/06-scanner-entrada-teclado', label: '06 · Scanner: leer por teclado', translations: { va: '06 · Scanner: llegir pel teclat' } },
                { slug: '02-variables-tipos-operadores/07-math-random-aleatorios', label: '07 · Math.random() y números aleatorios', translations: { va: '07 · Math.random() i nombres aleatoris' } },
                { slug: '02-variables-tipos-operadores/08-metodos-string', label: '08 · Métodos útiles de String', translations: { va: '08 · Mètodes útils de String' } },
                { slug: '02-variables-tipos-operadores/09-repaso-interactivo', label: '09 · Repaso interactivo', translations: { va: '09 · Repàs interactiu' } },
              ],
            },
            {
              label: '🔀 3. Estructuras de Control',
              translations: { va: '🔀 3. Estructures de Control i Excepcions' },
              items: [
                { slug: '03-estructuras-control-excepciones', label: '📌 Índice de la unidad', translations: { va: '📌 Índex de la unitat' } },
                { slug: '03-estructuras-control-excepciones/01-if-else', label: '01 · if, else if y else', translations: { va: '01 · if, else if i else' } },
                { slug: '03-estructuras-control-excepciones/02-switch', label: '02 · switch', translations: { va: '02 · switch' } },
                { slug: '03-estructuras-control-excepciones/03-bucles-while-do-while', label: '03 · Bucles: while y do-while', translations: { va: '03 · Bucles: while i do-while' } },
                { slug: '03-estructuras-control-excepciones/04-bucle-for', label: '04 · Bucle for y bucles anidados', translations: { va: '04 · Bucle for i bucles anidats' } },
                { slug: '03-estructuras-control-excepciones/05-break-continue', label: '05 · break, continue y etiquetas', translations: { va: '05 · break, continue i etiquetes' } },
                { slug: '03-estructuras-control-excepciones/06-excepciones-basicas', label: '06 · Excepciones básicas', translations: { va: '06 · Excepcions bàsiques' } },
                { slug: '03-estructuras-control-excepciones/07-try-catch-finally', label: '07 · try, catch y finally', translations: { va: '07 · try, catch i finally' } },
                { slug: '03-estructuras-control-excepciones/08-throw-excepciones-propias', label: '08 · throw y excepciones propias', translations: { va: '08 · throw i excepcions pròpies' } },
                { slug: '03-estructuras-control-excepciones/09-repaso-interactivo', label: '09 · Repaso interactivo', translations: { va: '09 · Repàs interactiu' } },
              ],
            },
            {
              label: '🧩 4. Algorítmica I: Fundamentos',
              translations: { va: '🧩 4. Algorítmica I: Fonaments' },
              items: [
                { slug: '04-algoritmica-fundamentos', label: '📌 Índice de la unidad', translations: { va: '📌 Índex de la unitat' } },
                { slug: '04-algoritmica-fundamentos/01-que-es-algoritmo', label: '01 · Qué es un algoritmo', translations: { va: '01 · Què és un algoritme' } },
                { slug: '04-algoritmica-fundamentos/02-busqueda-lineal', label: '02 · Búsqueda lineal', translations: { va: '02 · Cerca lineal' } },
                { slug: '04-algoritmica-fundamentos/03-busqueda-binaria', label: '03 · Búsqueda binaria', translations: { va: '03 · Cerca binària' } },
                { slug: '04-algoritmica-fundamentos/04-ordenacion-burbuja', label: '04 · Ordenación burbuja', translations: { va: '04 · Ordenació bombolla' } },
                { slug: '04-algoritmica-fundamentos/05-ordenacion-insercion', label: '05 · Ordenación por inserción', translations: { va: '05 · Ordenació per inserció' } },
                { slug: '04-algoritmica-fundamentos/06-complejidad-big-o', label: '06 · Complejidad algorítmica: Big O', translations: { va: '06 · Complexitat algorísmica: Big O' } },
                { slug: '04-algoritmica-fundamentos/07-elegir-algoritmo', label: '07 · Elegir el algoritmo adecuado', translations: { va: "07 · Triar l'algoritme adequat" } },
                { slug: '04-algoritmica-fundamentos/08-be-the-code', label: '08 · Be the Code: búsqueda binaria desde cero', translations: { va: '08 · Be the Code: cerca binària des de zero' } },
                { slug: '04-algoritmica-fundamentos/09-repaso-interactivo', label: '09 · Repaso interactivo', translations: { va: '09 · Repàs interactiu' } },
              ],
            },
            {
              label: '⚡ 5. Algorítmica II: Técnicas',
              translations: { va: '⚡ 5. Algorítmica II: Tècniques' },
              items: [
                { slug: '05-algoritmica-tecnicas', label: '📌 Índice de la unidad', translations: { va: '📌 Índex de la unitat' } },
                { slug: '05-algoritmica-tecnicas/01-recursividad', label: '01 · Recursividad', translations: { va: '01 · Recursivitat' } },
                { slug: '05-algoritmica-tecnicas/02-recursividad-ejemplos-clasicos', label: '02 · Recursividad: ejemplos clásicos', translations: { va: '02 · Recursivitat: exemples clàssics' } },
                { slug: '05-algoritmica-tecnicas/03-divide-y-venceras', label: '03 · Divide y vencerás', translations: { va: '03 · Divide i venceràs' } },
                { slug: '05-algoritmica-tecnicas/04-quicksort', label: '04 · Quicksort', translations: { va: '04 · Quicksort' } },
                { slug: '05-algoritmica-tecnicas/05-mergesort', label: '05 · Mergesort', translations: { va: '05 · Mergesort' } },
                { slug: '05-algoritmica-tecnicas/06-comparacion-ordenacion', label: '06 · Comparación: cuándo usar cada ordenación', translations: { va: '06 · Comparació: quan usar cada ordenació' } },
                { slug: '05-algoritmica-tecnicas/07-be-the-code-quicksort', label: '07 · Be the Code: quicksort desde cero', translations: { va: '07 · Be the Code: quicksort des de zero' } },
                { slug: '05-algoritmica-tecnicas/08-otras-tecnicas-algoritmicas', label: '08 · Otras técnicas algorítmicas', translations: { va: '08 · Altres tècniques algorísmiques' } },
                { slug: '05-algoritmica-tecnicas/09-repaso-interactivo', label: '09 · Repaso interactivo', translations: { va: '09 · Repàs interactiu' } },
              ],
            },
            {
              label: '🏗️ 6. POO: Clases y Objetos',
              translations: { va: '🏗️ 6. POO: Classes i Objectes' },
              items: [
                { slug: '06-poo-clases-objetos', label: '📌 Índice de la unidad', translations: { va: '📌 Índex de la unitat' } },
                { slug: '06-poo-clases-objetos/01-que-es-poo', label: '01 · Qué es la POO', translations: { va: '01 · Què és la POO' } },
                { slug: '06-poo-clases-objetos/02-clases-objetos', label: '02 · Clases y objetos: el cortapastas y las galletas', translations: { va: '02 · Classes i objectes: el tallagalletas i les galetes' } },
                { slug: '06-poo-clases-objetos/03-atributos-metodos', label: '03 · Atributos y métodos', translations: { va: '03 · Atributs i mètodes' } },
                { slug: '06-poo-clases-objetos/04-constructores', label: '04 · Constructores', translations: { va: '04 · Constructors' } },
                { slug: '06-poo-clases-objetos/05-this', label: '05 · La palabra clave this', translations: { va: '05 · La paraula clau this' } },
                { slug: '06-poo-clases-objetos/06-referencias-memoria', label: '06 · Referencias, null y memoria', translations: { va: '06 · Referències, null i memòria' } },
                { slug: '06-poo-clases-objetos/07-sobrecarga-paso-valor', label: '07 · Sobrecarga y paso por valor', translations: { va: '07 · Sobrecàrrega i pas per valor' } },
                { slug: '06-poo-clases-objetos/08-be-the-code', label: '08 · Be the Code: diseña tu clase', translations: { va: '08 · Be the Code: dissenya la teua classe' } },
                { slug: '06-poo-clases-objetos/09-repaso-interactivo', label: '09 · Repaso interactivo', translations: { va: '09 · Repàs interactiu' } },
              ],
            },
            {
              label: '🔒 7. Visibilidad y Static',
              translations: { va: '🔒 7. Visibilitat, Encapsulació i Static' },
              items: [
                { slug: '07-visibilidad-encapsulacion-static', label: '📌 Índice de la unidad', translations: { va: '📌 Índex de la unitat' } },
                { slug: '07-visibilidad-encapsulacion-static/01-visibilidad', label: '01 · Visibilidad: el arte de no enseñarlo todo', translations: { va: '01 · Visibilitat: l\'art de no ensenyar-ho tot' } },
                { slug: '07-visibilidad-encapsulacion-static/02-public-private-protected', label: '02 · public, private y protected', translations: { va: '02 · public, private i protected' } },
                { slug: '07-visibilidad-encapsulacion-static/03-encapsulacion', label: '03 · Encapsulación: el pilar de la POO', translations: { va: '03 · Encapsulació: el pilar de la POO' } },
                { slug: '07-visibilidad-encapsulacion-static/04-getters-setters', label: '04 · Getters y setters', translations: { va: '04 · Getters i setters' } },
                { slug: '07-visibilidad-encapsulacion-static/05-atributos-static', label: '05 · Atributos static', translations: { va: '05 · Atributs static' } },
                { slug: '07-visibilidad-encapsulacion-static/06-metodos-static', label: '06 · Métodos static y el main', translations: { va: '06 · Mètodes static i el main' } },
                { slug: '07-visibilidad-encapsulacion-static/07-constantes-static-final', label: '07 · Constantes de clase: static final', translations: { va: '07 · Constants de classe: static final' } },
                { slug: '07-visibilidad-encapsulacion-static/08-be-the-code', label: '08 · Be the Code: encapsula tu clase', translations: { va: '08 · Be the Code: encapsula la teua classe' } },
                { slug: '07-visibilidad-encapsulacion-static/09-repaso-interactivo', label: '09 · Repaso interactivo', translations: { va: '09 · Repàs interactiu' } },
              ],
            },
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
          items:
            ['🚀','🔤','🔀','🧩','⚡','🏗️','🔒','🧬','📚','🗺️','📁','🗄️','🌐'].flatMap((emoji, i) => {
              const n = i + 1;
              if (n <= 7) {
                const nn = String(n).padStart(2,'0');
                return [{
                  label: `${emoji} Boletín Unidad ${nn}`,
                  translations: { va: `${emoji} Butlletí Unitat ${nn}` },
                  items: [
                    { slug: `boletines/boletin-u${nn}-inicial-resuelto`, label: '✅ Inicial resuelto', translations: { va: '✅ Inicial resolt' } },
                    { slug: `boletines/boletin-u${nn}-inicial`, label: '🟢 Inicial por resolver', translations: { va: '🟢 Inicial per resoldre' } },
                    { slug: `boletines/boletin-u${nn}-avanzado-resuelto`, label: '💪 Avanzado resuelto', translations: { va: '💪 Avançat resolt' } },
                    { slug: `boletines/boletin-u${nn}-avanzado`, label: '⭐ Avanzado por resolver', translations: { va: '⭐ Avançat per resoldre' } },
                    { slug: `boletines/boletin-u${nn}-extras`, label: '🔥 Extras', translations: { va: '🔥 Extres' } },
                  ],
                }];
              }
              const nn = String(n).padStart(2,'0');
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
        },
      ],
    }),
  ],
});
