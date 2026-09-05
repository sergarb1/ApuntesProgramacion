---
title: "U06 — POO: Classes i Objectes"
description: "El tallagalletas i les galetes: quan el teu codi passa de ser una recepta a un món d'objectes que parlen entre ells 🏗️"
emoji: 🏗️
---

<p><small>El tallagalletas i les galetes: quan el teu codi passa de ser una recepta a un món d'objectes que parlen entre ells 🏗️</small></p>

> 🗺️ **El mapa del paquet:** 🚪 Benvinguda → ☕ U01 → 🔤 U02 → 🔀 U03 → 🧩 Fonaments → ⚡ Tècniques → **🏗️ ACÍ ETS (U06)** → 🔒 Visibilitat → 🧬 Herència → 📚 Col·leccions → 🗺️ Genèrics → 📁 Fitxers → 🗄️ JDBC → 🌐 APIs

---

Benvingut a la unitat on els teus programes deixen de ser *receptes de cuina* i es convertixen en **mons de coses**. Fins ara has escrit programes lineals: això, després això, després això. Però el món real no funciona així. Al món real tens *coses*: un gos, un cotxe, un professor de programació amb ulleres de pasta. Cada cosa té **atributs** (color, edat, nombre de ganes de corregir exàmens) i **comportaments** (lladrar, accelerar, posar faltes d'ortografia).

La **Programació Orientada a Objectes (POO)** és exactament això: escriure codi com funciona el món real. I en esta unitat aprendràs la base de tot: les **classes** (el motle) i els **objectes** (la galeta). Construiràs les teues pròpies classes amb atributs i mètodes, les faràs nàixer amb **constructors**, aprendràs a desambiguar amb `this`, a raonar sobre **referències i memòria**, i a exprimir la **sobrecàrrega** de mètodes i el pas de paràmetres.

Esta unitat és el **punt d'inflexió del curs**: el que aprengues ací, ho usaràs en totes les unitats que queden. La POO no és un tema més: és el tema que fa que tots els altres tinguen sentit.

Esta unitat es llig com un **llibre de 9 capítols**: els 8 primers punts són teoria en progressió i el 9 és un aterratge pràctic per a deixar-ho tot ben lligat.

---

## 🎯 Objectiu de la unitat

En acabar, seràs capaç de:

- Explicar què és la **POO** i per què existix (spoiler: no és per a fastidiar, és per a no tornar-te boig).
- Diferenciar **classe** (el tallagalletas) d'**objecte** (la galeta), i crear objectes amb `new`.
- Definir **atributs** (les propietats) i **mètodes** (els comportaments) d'una classe.
- Usar **constructors** perquè els objectes nasquen ben preparats, amb o sense paràmetres.
- Desambiguar atributs i paràmetres amb la paraula clau **`this`**, i cridar un constructor des d'un altre.
- Raonar sobre **referències, `null` i memòria**: què guarda una variable d'objecte i què pinta el `heap`.
- Escriure **mètodes sobrecarregats** i entendre el **pas per valor** (i per què les referències es porten "rar").
- Dissenyar i crear una **classe completa** amb els seus mètodes, de principi a fi.

---

## 🗺️ Mapa de la unitat

| Punt | Què aprendràs | Dificultat |
|---|---|---|
| [01 · Què és la POO](/ApuntesProgramacion/va/06-poo-clases-objetos/01-que-es-poo) | Programació procedural vs orientada a objectes i per què el món real mana | Tots |
| [02 · Classes i objectes: el tallagalletas i les galetes](/ApuntesProgramacion/va/06-poo-clases-objetos/02-clases-objetos) | El motle, la galeta, `new`, i la teua primera classe | Tots |
| [03 · Atributs i mètodes](/ApuntesProgramacion/va/06-poo-clases-objetos/03-atributos-metodos) | Les propietats i els comportaments d'una classe, amb els seus tipus i paràmetres | Tots |
| [04 · Constructors](/ApuntesProgramacion/va/06-poo-clases-objetos/04-constructores) | El mètode que prepara l'objecte en nàixer: per defecte i amb paràmetres | Tots |
| [05 · La paraula clau this](/ApuntesProgramacion/va/06-poo-clases-objetos/05-this) | Quan els paràmetres es diuen igual que els atributs (i com eixir de l'embolic) | Tots |
| [06 · Referències, null i memòria](/ApuntesProgramacion/va/06-poo-clases-objetos/06-referencias-memoria) | Què guarda una variable d'objecte, el `heap`, `null` i el mític `NullPointerException` | Tots |
| [07 · Sobrecàrrega i pas per valor](/ApuntesProgramacion/va/06-poo-clases-objetos/07-sobrecarga-paso-valor) | Diversos mètodes amb el mateix nom i què es copia quan crides | Tots |
| [08 · Be the Code: dissenya la teua classe](/ApuntesProgramacion/va/06-poo-clases-objetos/08-be-the-code) | Dissenyar i construir una classe completa pas a pas, sense mirar | ⭐⭐⭐ |
| [09 · Repàs interactiu](/ApuntesProgramacion/va/06-poo-clases-objetos/09-repaso-interactivo) | Sé el Código, Fireside, Laboratori, Crucigrama i més | Tots |

> 📖 **Flux de lectura:** els 8 primers punts són teoria en progressió. El 9 és l'aterratge pràctic: llig-lo just després del 8 i abans d'obrir els butlletins.

---

## 📝 Butlletins de la unitat

> Practica amb els parells del curs: comença sempre pel resolt per a vore l'estil i després intenta el per-resoldre.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/va/boletines/boletin-u06-inicial-resuelto" class="elink">✅ Inicial resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u06-inicial" class="elink">🟢 Inicial per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u06-avanzado-resuelto" class="elink">💪 Avançat resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u06-avanzado" class="elink">⭐ Avançat per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u06-extras" class="elink">🔥 Extres</a>
</div>

---

## ✅ Criteris d'avaluació coberts (RA2 + RA4)

**RA2: Escriu i prova programes senzills, reconeixent i aplicant els fonaments de la programació orientada a objectes.**

**RA4: Desenvolupa programes organitzats en classes analitzant i aplicant els principis de la programació orientada a objectes.**

| CE | Criteri | On es cobreix |
|---|---|---|
| RA2 a) | S'han identificat els fonaments de la programació orientada a objectes. | ✅ Punt 1 |
| RA2 b) | S'han escrit programes simples. | ✅ Tots |
| RA2 c) | S'han instanciat objectes a partir de classes predefinides. | ✅ Punts 2, 3 i 6 |
| RA2 d) | S'han utilitzat mètodes i propietats dels objectes. | ✅ Punts 3 i 8 |
| RA2 f) | S'han utilitzat paràmetres en la crida a mètodes. | ✅ Punts 7 i 8 |
| RA2 h) | S'han utilitzat constructors. | ✅ Punts 4 i 7 |
| RA4 a) | S'ha reconegut la sintaxi, estructura i components típics d'una classe. | ✅ Punts 2 i 3 |
| RA4 b) | S'han definit classes. | ✅ Punts 2 i 8 |
| RA4 c) | S'han definit propietats i mètodes. | ✅ Punts 3 i 8 |
| RA4 d) | S'han creat constructors. | ✅ Punts 4 i 7 |
| RA4 e) | S'han desenvolupat programes que instancien i utilitzen objectes de les classes creades anteriorment. | ✅ Punts 6 i 8 |

> 📌 El punt 6 (referències i memòria) i el 7 (pas per valor) són la base per a entendre el **RA2 c) i f)** en profunditat. Els modificadors de visibilitat (RA4 f), l'herència (RA4 g) i els mètodes estàtics (RA4 h) tenen el seu propi capítol en la **U07** (Visibilitat i Static) i en la **U08** (Herència), així que ací els deixem descansant.

---

## 🚪 Per on comence?

- Cero coneixements de POO? → Arranca en el [punt 1](/ApuntesProgramacion/va/06-poo-clases-objetos/01-que-es-poo). Només necessites el que vas vore fins a la U05.
- Ja saps què és una classe i vols cim? → Ves directe al [punt 4](/ApuntesProgramacion/va/06-poo-clases-objetos/04-constructores) i al [punt 5](/ApuntesProgramacion/va/06-poo-clases-objetos/05-this): ací comença el ball seriós.
- Et flipen els reptes? → Fes el [punt 8](/ApuntesProgramacion/va/06-poo-clases-objetos/08-be-the-code) sense mirar el codi dels punts anteriors. Dissenya la teua classe amb honor.
- Vens a repassar? → Fes el [Repàs interactiu](/ApuntesProgramacion/va/06-poo-clases-objetos/09-repaso-interactivo) i després els [butlletins](/ApuntesProgramacion/va/boletines/boletin-u06-inicial).

**📍 Primer punt:** [01 · Què és la POO](/ApuntesProgramacion/va/06-poo-clases-objetos/01-que-es-poo)  
**⏭️ En acabar la unitat, continua en [U07 · Visibilitat, Encapsulació i Static](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static).**