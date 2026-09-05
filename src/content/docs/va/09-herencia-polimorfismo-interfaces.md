---
title: "U09 — Herència, Polimorfisme i Interfícies"
description: "Quan les teues classes hereden, es disfressen i firmen contractes: extends, super, override, abstract i interfícies 🧬"
emoji: 🧬
---

<p><small>Quan les teues classes hereden, es disfressen i firmen contractes: extends, super, override, abstract i interfícies 🧬</small></p>

> 🗺️ **El mapa del paquet:** 🚪 Benvinguda → ☕ U01 → 🔤 U02 → 🔀 U03 → 🅿️ U04 → 🧩 U05 → ⚡ U06 → 🏗️ U07 → 🔒 U08 → **🧬 ACÍ ETS (U09)** → 📚 U10 → 🗺️ U11 → 📁 U12 → 🗄️ U13 → 🌐 U14

---

Fins ara les teues classes eren illes: cadascuna amb els seus atributs, els seus mètodes i els seus secrets ben guardats. Però en la vida real les coses no són illes: un gos *és un* animal, un cotxe *és un* vehicle, i un professor *és un* empleat. Les coses **hereden** característiques dels seus pares i, a més, afigen les seues. Doncs el teu codi fa exactament el mateix.

Esta unitat és el cor de la POO. I té tres grans actes:

- **Herència (`extends`):** una classe filla obté tot el que té la seua classe pare i pot millorar-ho. Aprendràs a usar `super` per a cridar la superclasse, `@Override` per a sobreescriure mètodes i `protected` per a compartir secrets només amb la família.
- **Polimorfisme:** el mateix mètode, mil comportaments. Una variable de tipus `Animal` pot apuntar a un `Gos`, un `Gat` o una `Vaca`, i cadascun fa el seu so. Veuràs `instanceof`, downcasting i la mítica classe `Object`, el besavi de tot.
- **Abstracció i interfícies:** classes abstractes que no es poden instanciar (esbossos) i interfícies que són contractes. Ací es decidix si el teu codi és un caos o una obra d'art.

Pel camí descobriràs per què `toString()` et mentix si no el sobreescrius, què passa quan fas un downcasting a la babalà (spoiler: `ClassCastException`), i per què els entrevistadors de treball adoren preguntar "quan usaríes una classe abstracta i quan una interfície?".

Esta unitat es llig com un **llibre de 9 capítols**: els 8 primers punts són teoria en progressió i el 9 és un aterratge pràctic per a deixar-ho tot ben lligat.

---

## 🎯 Objectiu de la unitat

En acabar, seràs capaç de:

- **Heredar** d'una classe amb `extends` i distingir IS-A de HAS-A.
- Usar **`super`** per a cridar constructors i mètodes de la superclasse.
- **Sobreescriure** mètodes amb `@Override` i saber quan (i quan no) fer-ho.
- Protegir membres amb **`protected`** i dissenyar **jerarquies de classes** sensates.
- Explicar el **polimorfisme dinàmic** (dynamic binding) i usar-lo amb col·leccions i paràmetres.
- Aplicar **`instanceof` i downcasting** amb seguretat.
- Sobreescriure **`toString()`, `equals()` i `hashCode()`** de la classe `Object`.
- Dissenyar **classes abstractes** amb mètodes abstractes i el patró template method.
- Implementar **interfícies**, usar mètodes `default` i decidir quan usar `abstract class` vs `interface`.

---

## 🗺️ Mapa de la unitat

| Punt | Què aprendràs | Dificultat |
|---|---|---|
| [01 · Herència: quan els teus fills seguixen els teus passos](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/01-herencia) | `extends`, què s'hereda i què no, IS-A vs HAS-A, l'arbre genealògic | Tots |
| [02 · super i @Override](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/02-super-override) | Cridar la superclasse, sobreescriure mètodes i encadenar constructors | Tots |
| [03 · protected i jerarquies de classes](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/03-protected-jerarquias) | El membre que només veu la família, arbres de classes i la classe base fràgil | Tots |
| [04 · Polimorfisme: el camaleó de la POO](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/04-polimorfismo) | Dynamic binding, referències polimòrfiques, col·leccions i paràmetres | Tots |
| [05 · instanceof i downcasting](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/05-instanceof-downcasting) | Preguntar qui eres i baixar la referència sense trencar res | Tots |
| [06 · La classe Object: el besavi de tot](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/06-clase-object) | `toString()`, `equals()` i `hashCode()` ben sobreescrits | Tots |
| [07 · Classes abstractes](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/07-clases-abstractas) | Esbossos que no s'instancien, mètodes abstractes i template method | Tots |
| [08 · Interfícies: el contracte que signes](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/08-interfaces) | `implements`, polimorfisme, mètodes `default` i abstract vs interface | Tots |
| [09 · Repàs interactiu](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/09-repaso-interactivo) | Sé el Código, Fireside, Laboratori, Crucigrama i més | Tots |

> 📖 **Flux de lectura:** els 8 primers punts són teoria en progressió. El 9 és l'aterratge pràctic: llig-lo just després del 8 i abans d'obrir els butlletins.

---

## 📝 Butlletins de la unitat

> Practica amb els parells del curs: comença sempre pel resolt per a vore l'estil i després intenta el per-resoldre.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/va/boletines/boletin-u09-inicial-resuelto" class="elink">✅ Inicial resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u09-inicial" class="elink">🟢 Inicial per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u09-avanzado-resuelto" class="elink">💪 Avançat resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u09-avanzado" class="elink">⭐ Avançat per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u09-extras" class="elink">🔥 Extres</a>
</div>

---

## ✅ Criteris d'avaluació coberts (RA4 i RA7)

**RA4: Desenvolupa programes organitzats en classes analitzant i aplicant els principis de la programació orientada a objectes.**

| CE | Criteri | On es cobreix |
|---|---|---|
| RA4 a) | S'ha reconegut la sintaxi, estructura i components típics d'una classe. | ✅ Punt 1 |
| RA4 b) | S'han definit classes. | ✅ Punts 7 i 8 |
| RA4 d) | S'han creat constructors. | ✅ Punts 2 i 7 |
| RA4 e) | S'han desenvolupat programes que instancien i utilitzen objectes de les classes creades anteriorment. | ✅ Punts 4, 8 i 9 |
| RA4 g) | S'han definit i utilitzat classes heredades. | ✅ Punts 1, 2 i 3 |
| RA4 i) | S'han definit i utilitzat interfícies. | ✅ Punt 8 |

**RA7: Desenvolupa programes, aplicant característiques avançades dels llenguatges orientats a objectes i de l'entorn de programació.**

| CE | Criteri | On es cobreix |
|---|---|---|
| RA7 a) | S'han identificat els conceptes d'herència, superclasse i subclasse. | ✅ Punt 1 |
| RA7 b) | S'han utilitzat modificadors per a bloquejar i forçar l'herència de classes i mètodes. | ✅ Punts 2 i 7 |
| RA7 c) | S'ha reconegut la incidència dels constructors en l'herència. | ✅ Punt 2 |
| RA7 d) | S'han creat classes heredades que sobreescriguen la implementació de mètodes de la superclasse. | ✅ Punts 2 i 4 |
| RA7 e) | S'han dissenyat i aplicat jerarquies de classes. | ✅ Punts 3 i 7 |
| RA7 f) | S'han provat i depurat les jerarquies de classes. | ✅ Punt 9 |
| RA7 g) | S'han realitzat programes que implementen i utilitzen jerarquies de classes. | ✅ Punts 4, 8 i 9 |

> 📌 El resultat d'aprenentatge **RA4** es recolza en la U07 (definir classes) i la U08 (visibilitat), i culmina ací amb herència i interfícies. La **RA7** es tanca amb esta unitat: jerarquies, sobrescriptura i contractes. Les col·leccions (RA6) arriben en la **U10**.

---

## 🚪 Per on comence?

- Cero coneixements? → Comença en el [punt 1](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/01-herencia). Només necessites el que vas vore en les unitats 06 i 07.
- Ja heredes i vols el contracte? → Ves directe al [punt 7](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/07-clases-abstractas) i al [punt 8](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/08-interfaces): ací està la mitat abstracta de la unitat.
- Només vens a per el polimorfisme? → Salta al [punt 4](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/04-polimorfismo) i al [punt 5](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/05-instanceof-downcasting).
- Vens a repassar? → Fes el [Repàs interactiu](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/09-repaso-interactivo) i després els [butlletins](/ApuntesProgramacion/va/boletines/boletin-u09-inicial).

**📍 Primer punt:** [01 · Herència: quan els teus fills seguixen els teus passos](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/01-herencia)  
**⏭️ En acabar la unitat, continua en [U10 · Col·leccions](/ApuntesProgramacion/va/10-colecciones).**