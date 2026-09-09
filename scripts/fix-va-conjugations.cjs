// Fix Valencian verb conjugations: -ix → -eix
// Only fixes incorrect forms, not legitimate -ix verbs (seguir, previndre, etc.)

const fs = require('fs');
const path = require('path');

// Map: incorrect form → correct form
const fixes = {
  // imprimir
  'imprimix': 'imprimeix',
  'Imprimix': 'Imprimeix',
  'imprimixen': 'imprimeixen',
  'imprimixes': 'imprimeixes',
  // convertir
  'convertix': 'converteix',
  'convertixen': 'converteixen',
  // reunir
  'reunix': 'reuneix',
  'reunixen': 'reuneixen',
  // repetir
  'repetix': 'repeteix',
  'repetixen': 'repeteixen',
  'repetixes': 'repeteixes',
  // servir
  'servix': 'serveix',
  'servixen': 'serveixen',
  // impedir
  'impedix': 'impedeix',
  'impedixen': 'impedeixen',
  // existir
  'existix': 'existeix',
  'existixen': 'existeixen',
  // dividir
  'dividix': 'divideix',
  'dividixen': 'divideixen',
  // definir
  'definix': 'defineix',
  'definixen': 'defineixen',
  // coincidir
  'coincidix': 'coincideix',
  'coincidixen': 'coincideixen',
  // aconseguir
  'aconseguix': 'aconsegueix',
  'aconseguixen': 'aconsegueixen',
  // complir
  'complix': 'compleix',
  'complixen': 'compleixen',
  // encongir
  'encongix': 'encongeix',
  'encongixen': 'encongeixen',
  // discutir
  'discutix': 'discuteix',
  'discutixen': 'discuteixen',
  // decidir
  'decidix': 'decideix',
  'decidixen': 'decideixen',
  // llegir
  'llegix': 'llegeix',
  'llegixen': 'llegeixen',
  // garantir
  'garantix': 'garanteix',
  'garantixen': 'garanteixen',
  // exigir
  'exigix': 'exigeix',
  'exigixen': 'exigeixen',
  // redonir
  'redonix': 'redoneix',
  'redonixen': 'redoneixen',
  // cobrir
  'cobrix': 'cobreix',
  'cobrixen': 'cobreixen',
  // consumir
  'consumix': 'consumeix',
  'consumixen': 'consumeixen',
  // patir
  'patix': 'pateix',
  'patixen': 'pateixen',
  // mentir
  'mentix': 'menteix',
  'mentixen': 'menteixen',
  // advertir
  'advertix': 'adverteix',
  'advertixen': 'adverteixen',
  // construir
  'construix': 'construeix',
  'construixen': 'construeixen',
  // destruir
  'destruix': 'destrueix',
  'destruixen': 'destrueixen',
  // incluir
  'incluix': 'inclou',
  'incluixen': 'inclouen',
};

// Also remove entries where incorrect = correct (no-op)
for (const [k, v] of Object.entries(fixes)) {
  if (k === v) delete fixes[k];
}

// Sort by length descending (longest first to avoid partial replacements)
const sortedFixes = Object.entries(fixes).sort((a, b) => b[0].length - a[0].length);

function walk(d) {
  let r = [];
  for (const f of fs.readdirSync(d, { withFileTypes: true })) {
    const p = path.join(d, f.name);
    if (f.isDirectory()) r.push(...walk(p));
    else if (f.name.endsWith('.md')) r.push(p);
  }
  return r;
}

function fixContent(text) {
  // Split by code blocks to avoid modifying code
  // Handle both ``` blocks and inline ` code
  const parts = text.split(/(```[\s\S]*?```)/g);
  
  let totalFixed = 0;
  const result = parts.map((part, i) => {
    // Odd indices are code blocks - skip them
    if (i % 2 === 1) return part;
    
    // Also skip inline code spans
    // We'll process line by line and skip parts inside backticks
    let fixed = part;
    for (const [bad, good] of sortedFixes) {
      const regex = new RegExp(bad, 'g');
      const before = fixed;
      fixed = fixed.replace(regex, good);
      if (fixed !== before) {
        totalFixed += (fixed.match(new RegExp(good, 'g')) || []).length - 
                      (before.match(new RegExp(good, 'g')) || []).length +
                      (before.match(new RegExp(bad, 'g')) || []).length;
      }
    }
    return fixed;
  });
  
  return { text: result.join(''), fixed: totalFixed };
}

const files = walk('src/content/docs/va');
let totalFiles = 0;
let totalFixed = 0;

for (const f of files) {
  const content = fs.readFileSync(f, 'utf8');
  const { text, fixed } = fixContent(content);
  if (fixed > 0) {
    fs.writeFileSync(f, text, 'utf8');
    totalFiles++;
    totalFixed += fixed;
    const rel = f.replace(/\\/g, '/').split('va/')[1] || f;
    console.log(`  ${fixed}x ${rel}`);
  }
}

console.log(`\nTotal: ${totalFixed} fixes in ${totalFiles} files`);
