---
title: U02 â€” Variables, Tipus i Operadors
description: Les caixes del magatzem de la memÃ²ria i les mÃ quines del gimnÃ s de dades ðŸ”¤
---

<p><small>Les caixes del magatzem de la memÃ²ria i les mÃ quines del gimnÃ s de dades ðŸ”¤</small></p>

> ðŸ—ºï¸ **El mapa del paquet:** ðŸšª Benvinguda â†’ â˜• U01 â†’ **ðŸ”¤ ACI ETS (U02)** â†’ ðŸ”€ Control â†’ ðŸ§© AlgorÃ­tmica â†’ âš¡ TÃ¨cniques â†’ ðŸ—ï¸ POO â†’ ðŸ”’ Visibilitat â†’ ðŸ§¬ HerÃ¨ncia â†’ ðŸ“š ColÂ·leccions â†’ ðŸ—ºï¸ GenÃ¨rics â†’ ðŸ“ Fitxers â†’ ðŸ—„ï¸ JDBC â†’ ðŸŒ APIs

---

Benvingut al magatzem. En la U01 vas aprendre a dir-li a Java que et salude per consola, perÃ² un programa que nomÃ©s imprimix text Ã©s un lloro: repetix, perÃ² no pensa. Per a pensar necessita *guardar* coses. Edats, preus, notes, si fa fred o no... i per a aixÃ² existixen les **variables**.

Imagina que la memÃ²ria del teu ordinador Ã©s un **magatzem gegant** ple de prestatgeries. Cada prestatgeria tÃ© caixes, i les variables sÃ³n eixes caixes: cada una tÃ© una etiqueta perquÃ¨ sÃ pies quÃ¨ hi ha dins. I quan les caixes s'omplin de nÃºmeros i text, arriben els **operadors**: les mÃ quines de pesos del gimnÃ s de dades que sumen, resten, comparen i transformen.

En esta unitat aprendrÃ s a declarar variables dels **8 tipus primitius**, a guardar text amb `String`, a fer immutables algunes caixes amb `final`, a manipular-les amb operadors aritmÃ¨tics, relacionals i lÃ²gics, a convertir-les entre tipus amb **casting**, i a fer que el teu programa **escolte el teclat** amb `Scanner` i jugue a la loteria amb `Math.random()`.

Esta unitat es llig com un **llibre de 9 capÃ­tols**: els 8 primers punts sÃ³n teoria en progressiÃ³ i el 9 Ã©s un aterratge prÃ ctic per a machacar tot el que has aprÃ¨s.

---

## ðŸŽ¯ Objectiu de la unitat

En acabar, serÃ s capaÃ§ de:

- Declarar i usar variables dels **8 tipus primitius** i saber quÃ¨ cap en cada caixa.
- Aplicar les regles de **nomenclatura** i distingir `int`, `long`, `double`, `char` i `boolean` amb un cop d'ull.
- Crear i usar `String` com una **classe** (no un primitiu) i entendre la seua immutabilitat.
- Declarar **constants** amb `final` i entendre per quÃ¨ el compilador s'enfada si les toques.
- Usar els operadors aritmÃ¨tics `+ - * / %`, sobreviure a la **divisiÃ³ entera** i respectar la **precedÃ¨ncia**.
- Comparar valors amb operadors **relacionals**, combinar-los amb **lÃ²gics** (`&&`, `||`, `!`) i resumir decisions amb el **ternari**.
- Convertir entre tipus amb **casting** implÃ­cit i explÃ­cit, sabent quan es perd precisiÃ³.
- Llegir dades del teclat amb **`Scanner`** i generar nombres aleatoris amb **`Math.random()`**.
- Manejar els **mÃ¨todes de `String`** mÃ©s usats per a manipular text.

---

## ðŸ—ºï¸ Mapa de la unitat

| Punt | QuÃ¨ aprendrÃ s | Nivell |
|---|---|---|
| [01 Â· Variables i tipus primitius](/ApuntesProgramacion/va/02-variables-tipos-operadores/01-variables-tipos-primitivos) | Declarar variables, nomenclatura i els 8 primitius | Tots |
| [02 Â· String, constants i final](/ApuntesProgramacion/va/02-variables-tipos-operadores/02-string-constantes-final) | `String`, immutabilitat, `==` vs `equals` i constants `final` | Tots |
| [03 Â· Operadors aritmÃ¨tics](/ApuntesProgramacion/va/02-variables-tipos-operadores/03-operadores-aritmeticos) | `+ - * / %`, divisiÃ³ entera, precedÃ¨ncia i `++`/`--` | Tots |
| [04 Â· Relacionals, lÃ²gics i ternari](/ApuntesProgramacion/va/02-variables-tipos-operadores/04-operadores-relacionales-logicos) | Comparacions, `&&`/`\|\|`/`!`, curtcircuit i ternari | Tots |
| [05 Â· Casting i conversions](/ApuntesProgramacion/va/02-variables-tipos-operadores/05-casting-conversiones) | ConversiÃ³ implÃ­cita i explÃ­cita, truncament i desbordament | Tots |
| [06 Â· Scanner: llegir pel teclat](/ApuntesProgramacion/va/02-variables-tipos-operadores/06-scanner-entrada-teclado) | `Scanner`, `nextInt`, `nextDouble` i `nextLine` | Tots |
| [07 Â· Math.random() i nombres aleatoris](/ApuntesProgramacion/va/02-variables-tipos-operadores/07-math-random-aleatorios) | `Math.random()`, la fÃ³rmula min-max i les ferramentes de `Math` | Tots |
| [08 Â· MÃ¨todes Ãºtils de String](/ApuntesProgramacion/va/02-variables-tipos-operadores/08-metodos-string) | `length`, `substring`, `replace`, `trim`, `charAt`â€¦ | Tots |
| [09 Â· RepÃ s interactiu](/ApuntesProgramacion/va/02-variables-tipos-operadores/09-repaso-interactivo) | SÃ© el CÃ³digo, Fireside, Qui Soc, Laboratori, Crucigramaâ€¦ | Tots |

> ðŸ“– **Flux de lectura:** els 8 primers punts sÃ³n teoria en progressiÃ³. El 9 Ã©s l'aterratge prÃ ctic: llig-lo just desprÃ©s del 8 i abans d'obrir els butlletins.

---

## ðŸ“ Butlletins de la unitat

> Practica amb els parells del curs: comenÃ§a sempre pel resolt per a vore l'estil i desprÃ©s intenta el per-resoldre.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/va/boletines/boletin-u02-inicial-resuelto" class="elink">âœ… Inicial resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u02-inicial" class="elink">ðŸŸ¢ Inicial per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u02-avanzado-resuelto" class="elink">ðŸ’ª AvanÃ§at resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u02-avanzado" class="elink">â­ AvanÃ§at per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u02-extras" class="elink">ðŸ”¥ Extres</a>
</div>

---

## âœ… Criteris d'avaluaciÃ³ coberts (RA2 + RA1)

**RA1: Reconeix l'estructura d'un programa informÃ tic, identificant i relacionant els elements propis del llenguatge de programaciÃ³ utilitzat.**

**RA2: Escriu i prova programes senzills, reconeixent i aplicant els fonaments de la programaciÃ³ orientada a objectes.**

| CE | Criteri | On es cobreix |
|---|---|---|
| RA1 d) | S'han identificat els distints tipus de variables i la utilitat especÃ­fica de cada un. | âœ… Punt 1 |
| RA1 e) | S'ha modificat el codi d'un programa per a crear i utilitzar variables. | âœ… Punt 1 |
| RA1 f) | S'han creat i utilitzat constants i literals. | âœ… Punt 2 |
| RA1 g) | S'han classificat, reconegut i utilitzat en expressions els operadors del llenguatge. | âœ… Punts 3 i 4 |
| RA1 h) | S'ha comprovat el funcionament de les conversions de tipus explÃ­cites i implÃ­cites. | âœ… Punt 5 |
| RA2 b) | S'han escrit programes simples. | âœ… Tots |
| RA2 c) | S'han instanciat objectes a partir de classes predefinides. | âœ… Punts 2 i 6 |
| RA2 d) | S'han utilitzat mÃ¨todes i propietats dels objectes. | âœ… Punts 6 i 8 |
| RA2 e) | S'han escrit crides a mÃ¨todes estÃ tics. | âœ… Punt 7 |
| RA2 g) | S'han incorporat i utilitzat llibreries d'objectes. | âœ… Punt 6 |
| RA2 h) | S'han utilitzat constructors. | âœ… Punts 2 i 6 |

> ðŸ“Œ El `Scanner` del punt 6 i els mÃ¨todes de `String` del punt 8 planten la llavor del RA5 (entrada i eixida d'informaciÃ³), que floreix en la U11.

---

## ðŸšª Per on comence?

- Cero coneixements? â†’ ComenÃ§a en el [punt 1](/ApuntesProgramacion/va/02-variables-tipos-operadores/01-variables-tipos-primitivos). NomÃ©s necessites el que vas vore en la U01.
- Ja saps declarar variables i vols cim? â†’ Ves directe al [punt 6](/ApuntesProgramacion/va/02-variables-tipos-operadores/06-scanner-entrada-teclado) i al [punt 7](/ApuntesProgramacion/va/02-variables-tipos-operadores/07-math-random-aleatorios): ahÃ­ comencen els programes interessants.
- NomÃ©s vens a per operadors? â†’ Salta al [punt 3](/ApuntesProgramacion/va/02-variables-tipos-operadores/03-operadores-aritmeticos) i al [punt 4](/ApuntesProgramacion/va/02-variables-tipos-operadores/04-operadores-relacionales-logicos).
- Vens a repassar? â†’ Fes el [RepÃ s interactiu](/ApuntesProgramacion/va/02-variables-tipos-operadores/09-repaso-interactivo) i desprÃ©s els [butlletins](/ApuntesProgramacion/va/boletines/boletin-u02-inicial).

**ðŸ“ Primer punt:** [01 Â· Variables i tipus primitius](/ApuntesProgramacion/va/02-variables-tipos-operadores/01-variables-tipos-primitivos)  
**â­ï¸ En acabar la unitat, continua en [U03 Â· Estructures de Control](/ApuntesProgramacion/va/03-estructuras-control-excepciones).**
