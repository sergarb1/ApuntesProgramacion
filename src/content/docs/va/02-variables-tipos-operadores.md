---
title: U02 — Variables, Tipus i Operadors
description: Les caixes del magatzem de la memòria i les màquines del gimnàs de dades 🔤
---

<p><small>Les caixes del magatzem de la memòria i les màquines del gimnàs de dades 🔤</small></p>

> 🗺️ **El mapa del paquet:** 🚪 Benvinguda → ☕ U01 → **🔤 ACI ETS (U02)** → 🔀 Control → 🅿️ Arrays → 🧩 Algorítmica → ⚡ Tècniques → 🏗️ POO → 🔒 Visibilitat → 🧬 Herència → 📚 Col·leccions → 🗺️ Genèrics → 📁 Fitxers → 🗄️ JDBC → 🌐 APIs

---

Benvingut al magatzem. En la U01 vas aprendre a dir-li a Java que et salude per consola, però un programa que només imprimix text és un lloro: repetix, però no pensa. Per a pensar necessita *guardar* coses. Edats, preus, notes, si fa fred o no... i per a això existixen les **variables**.

Imagina que la memòria del teu ordinador és un **magatzem gegant** ple de prestatgeries. Cada prestatgeria té caixes, i les variables són eixes caixes: cada una té una etiqueta perquè sàpies què hi ha dins. I quan les caixes s'omplin de números i text, arriben els **operadors**: les màquines de peses del gimnàs de dades que sumen, resten, comparen i transformen.

En esta unitat aprendràs a declarar variables dels **8 tipus primitius**, a guardar text amb `String`, a fer immutables algunes caixes amb `final`, a manipular-les amb operadors aritmètics, relacionals i lògics, a convertir-les entre tipus amb **casting**, a fer que el teu programa **escolte el teclat** amb `Scanner`, a donar format a l'eixida amb `printf` i a jugar a la loteria amb `Math.random()`.

Esta unitat es llig com un **llibre de 10 capítols**: els 9 primers punts són teoria en progressió i el 10 és un aterratge pràctic per a deixar-ho tot ben lligat.

---

## 🎯 Objectiu de la unitat

En acabar, seràs capaç de:

- Declarar i usar variables dels **8 tipus primitius** i saber què cap en cada caixa.
- Aplicar les regles de **nomenclatura** i distingir `int`, `long`, `double`, `char` i `boolean` amb un cop d'ull.
- Crear i usar `String` com una **classe** (no un primitiu) i entendre la seua immutabilitat.
- Declarar **constants** amb `final` i entendre per què el compilador s'enfada si les toques.
- Usar els operadors aritmètics `+ - * / %`, sobreviure a la **divisió entera** i respectar la **precedència**.
- Comparar valors amb operadors **relacionals**, combinar-los amb **lògics** (`&&`, `||`, `!`) i resumir decisions amb el **ternari**.
- Convertir entre tipus amb **casting** implícit i explícit, sabent quan es perd precisió.
- Llegir dades del teclat amb **`Scanner`**, donar format a l'eixida amb **`printf`** i generar nombres aleatoris amb **`Math.random()`**.
- Manejar els **mètodes de `String`** més usats per a manipular text.

---

## 🗺️ Mapa de la unitat

| Punt | Què aprendràs | Nivell |
|---|---|---|
| [01 · Variables i tipus primitius](/ApuntesProgramacion/va/02-variables-tipos-operadores/01-variables-tipos-primitivos) | Declarar variables, nomenclatura i els 8 primitius | Tots |
| [02 · String, constants i final](/ApuntesProgramacion/va/02-variables-tipos-operadores/02-string-constantes-final) | `String`, immutabilitat, `==` vs `equals` i constants `final` | Tots |
| [03 · Operadors aritmètics](/ApuntesProgramacion/va/02-variables-tipos-operadores/03-operadores-aritmeticos) | `+ - * / %`, divisió entera, precedència i `++`/`--` | Tots |
| [04 · Relacionals, lògics i ternari](/ApuntesProgramacion/va/02-variables-tipos-operadores/04-operadores-relacionales-logicos) | Comparacions, `&&`/`\|\|`/`!`, curtcircuit i ternari | Tots |
| [05 · Casting i conversions](/ApuntesProgramacion/va/02-variables-tipos-operadores/05-casting-conversiones) | Conversió implícita i explícita, truncament i desbordament | Tots |
| [06 · Scanner: llegir pel teclat](/ApuntesProgramacion/va/02-variables-tipos-operadores/06-scanner-entrada-teclado) | `Scanner`, `nextInt`, `nextDouble` i `nextLine` | Tots |
| [07 · Consola: eixida amb format i errors d'entrada](/ApuntesProgramacion/va/02-variables-tipos-operadores/07-consola-salida-formateada) | `printf`, `String.format`, `NumberFormat` i errors del `Scanner` | Tots |
| [08 · Math.random() i nombres aleatoris](/ApuntesProgramacion/va/02-variables-tipos-operadores/08-math-random-aleatorios) | `Math.random()`, la fórmula min-max i les ferramentes de `Math` | Tots |
| [09 · Mètodes útils de String](/ApuntesProgramacion/va/02-variables-tipos-operadores/09-metodos-string) | `length`, `substring`, `replace`, `trim`, `charAt`… | Tots |
| [10 · Repàs interactiu](/ApuntesProgramacion/va/02-variables-tipos-operadores/10-repaso-interactivo) | Sé el Código, Fireside, Qui Soc, Laboratori, Crucigrama… | Tots |

> 📖 **Flux de lectura:** els 9 primers punts són teoria en progressió. El 10 és l'aterratge pràctic: llig-lo just després del 9 i abans d'obrir els butlletins.

---

## 📝 Butlletins de la unitat

> Practica amb els parells del curs: comença sempre pel resolt per a vore l'estil i després intenta el per-resoldre.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/va/boletines/boletin-u02-inicial-resuelto" class="elink">✅ Inicial resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u02-inicial" class="elink">🟢 Inicial per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u02-avanzado-resuelto" class="elink">💪 Avançat resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u02-avanzado" class="elink">⭐ Avançat per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u02-extras" class="elink">🔥 Extres</a>
</div>

---

## ✅ Criteris d'avaluació coberts (RA2 + RA1)

**RA1: Reconeix l'estructura d'un programa informàtic, identificant i relacionant els elements propis del llenguatge de programació utilitzat.**

**RA2: Escriu i prova programes senzills, reconeixent i aplicant els fonaments de la programació orientada a objectes.**

| CE | Criteri | On es cobreix |
|---|---|---|
| RA1 d) | S'han identificat els distints tipus de variables i la utilitat específica de cada un. | ✅ Punt 1 |
| RA1 e) | S'ha modificat el codi d'un programa per a crear i utilitzar variables. | ✅ Punt 1 |
| RA1 f) | S'han creat i utilitzat constants i literals. | ✅ Punt 2 |
| RA1 g) | S'han classificat, reconegut i utilitzat en expressions els operadors del llenguatge. | ✅ Punts 3 i 4 |
| RA1 h) | S'ha comprovat el funcionament de les conversions de tipus explícites i implícites. | ✅ Punt 5 |
| RA2 b) | S'han escrit programes simples. | ✅ Tots |
| RA2 c) | S'han instanciat objectes a partir de classes predefinides. | ✅ Punts 2 i 6 |
| RA2 d) | S'han utilitzat mètodes i propietats dels objectes. | ✅ Punts 6, 7 i 9 |
| RA2 e) | S'han escrit crides a mètodes estàtics. | ✅ Punt 8 |
| RA2 g) | S'han incorporat i utilitzat llibreries d'objectes. | ✅ Punt 6 |
| RA2 h) | S'han utilitzat constructors. | ✅ Punts 2 i 6 |

> 📌 El `Scanner` del punt 6, l'eixida amb format del punt 7 i els mètodes de `String` del punt 9 planten la llavor del RA5 (entrada i eixida d'informació), que floreix en la U12.

---

## 🚪 Per on comence?

- Cero coneixements? → Comença en el [punt 1](/ApuntesProgramacion/va/02-variables-tipos-operadores/01-variables-tipos-primitivos). Només necessites el que vas vore en la U01.
- Ja saps declarar variables i vols cim? → Ves directe al [punt 6](/ApuntesProgramacion/va/02-variables-tipos-operadores/06-scanner-entrada-teclado) i al [punt 8](/ApuntesProgramacion/va/02-variables-tipos-operadores/08-math-random-aleatorios): allà comencen els programes interessants.
- Només vens a per operadors? → Salta al [punt 3](/ApuntesProgramacion/va/02-variables-tipos-operadores/03-operadores-aritmeticos) i al [punt 4](/ApuntesProgramacion/va/02-variables-tipos-operadores/04-operadores-relacionales-logicos).
- Vens a repassar? → Fes el [Repàs interactiu](/ApuntesProgramacion/va/02-variables-tipos-operadores/10-repaso-interactivo) i després els [butlletins](/ApuntesProgramacion/va/boletines/boletin-u02-inicial).

**📍 Primer punt:** [01 · Variables i tipus primitius](/ApuntesProgramacion/va/02-variables-tipos-operadores/01-variables-tipos-primitivos)  
**⏭️ En acabar la unitat, continua en [U03 · Estructures de Control](/ApuntesProgramacion/va/03-estructuras-control-excepciones).