---
title: "U07 — Visibilitat, Encapsulació i Static"
description: "Els cadenats del teu codi: qui veu els teus atributs, com blinda'ls i què pertany a la classe i no a l'objecte 🔒"
emoji: 🔒
---

<p><small>Els cadenats del teu codi: qui veu els teus atributs, com blinda'ls i què pertany a la classe i no a l'objecte 🔒</small></p>

> 🗺️ **El mapa del paquet:** 🚪 Benvinguda → ☕ U01 → 🔤 U02 → 🔀 U03 → 🧩 Fonaments → ⚡ Tècniques → 🏗️ POO → **🔒 ACÍ ETS (U07)** → 🧬 Herència → 📚 Col·leccions → 🗺️ Genèrics → 📁 Fitxers → 🗄️ JDBC → 🌐 APIs

---

Benvingut a la unitat dels cadenats. En la U06 vas aprendre a crear classes i objectes: classes amb atributs i mètodes que es comportaven com *coses* del món real. Però hi havia un problema amagat: **tot era públic**. Qualsevol podia fer `persona.edad = -666` i el teu objecte quedava fet un desastre. Viure en una casa de vidre és incòmode, oi? Doncs el teu codi també mereix portes, claus i un bon cadenat.

Esta unitat té dues mitats que al final ballen juntes:

- **Visibilitat i encapsulació:** aprendràs a amagar els teus atributs amb `private` i a controlar com es llig i es modifica amb `public` (getters i setters). És el pilar que sosté la POO: el teu objecte decidix què mostra i què guarda, i ningú deixa la teua classe en un estat impossible.
- **Static:** aprendràs la diferència entre el que pertany a cada **objecte** (cada gat té el seu nom) i el que pertany a la **classe** (tots compartixen el comptador de gats). Atributs estàtics, mètodes estàtics i constants `static final` que ni el temps s'atrevix a tocar.

Pel camí descobriràs per què `main` és `static` encara que no hauria de ser-ho, com es construïx una classe utilitària com `Math` (que ningú pot instanciar), i per què els experts diuen que els atributs `public` són com portar la cartera oberta al metro.

Esta unitat es llig com un **llibre de 9 capítols**: els 8 primers punts són teoria en progressió i el 9 és un aterratge pràctic per a deixar-ho tot ben lligat.

---

## 🎯 Objectiu de la unitat

En acabar, seràs capaç de:

- Explicar per què **amagar** els teus atributs és bona idea (i no paranoia).
- Distingir els **4 nivells de visibilitat**: `public`, `protected`, package-private i `private`.
- **Encapsular** classes amb atributs `private` i controlar l'accés amb getters i setters `public`.
- **Validar** dades en els setters perquè el teu objecte mai no visca en un estat impossible.
- Conéixer el **patró JavaBeans** i les convencions de noms.
- Usar **atributs i mètodes estàtics** (`static`) per al que pertany a la classe, no a l'objecte.
- Entendre per què `main` és `static` i crear **classes utilitàries** amb constructor privat.
- Declarar **constants de classe** amb `static final` i saber quan usar-les.

---

## 🗺️ Mapa de la unitat

| Punt | Què aprendràs | Dificultat |
|---|---|---|
| [01 · Visibilitat: l'art de no ensenyar-ho tot](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static/01-visibilidad) | La casa de vidre: el problema d'ensenyar tots els teus atributs al món | Tots |
| [02 · public, private i protected](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static/02-public-private-protected) | Els 4 nivells de visibilitat i qui veu cada cosa de la teua classe | Tots |
| [03 · Encapsulació: el pilar de la POO](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static/03-encapsulacion) | Atributs privats, control d'accés i el patró JavaBeans | Tots |
| [04 · Getters i setters](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static/04-getters-setters) | El porter de la discoteca: llegir i modificar atributs amb validació | Tots |
| [05 · Atributs static](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static/05-atributos-static) | El que pertany a la classe, no a l'objecte: el grup de WhatsApp | Tots |
| [06 · Mètodes static i el main](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static/06-metodos-static) | Cridar mètodes sense crear objectes i per què `main` és estàtic | Tots |
| [07 · Constants de classe: static final](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static/07-constantes-static-final) | Valors immutables en MAJÚSCULES i les classes utilitàries | Tots |
| [08 · Be the Code: encapsula la teua classe](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static/08-be-the-code) | Convertix una classe sense blindar en una ben encapsulada, pas a pas | ⭐⭐⭐ |
| [09 · Repàs interactiu](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static/09-repaso-interactivo) | Sé el Código, Fireside, Laboratori, Crucigrama i més | Tots |

> 📖 **Flux de lectura:** els 8 primers punts són teoria en progressió. El 9 és l'aterratge pràctic: llig-lo just després del 8 i abans d'obrir els butlletins.

---

## 📝 Butlletins de la unitat

> Practica amb els parells del curs: comença sempre pel resolt per a vore l'estil i després intenta el per-resoldre.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/va/boletines/boletin-u07-inicial-resuelto" class="elink">✅ Inicial resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u07-inicial" class="elink">🟢 Inicial per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u07-avanzado-resuelto" class="elink">💪 Avançat resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u07-avanzado" class="elink">⭐ Avançat per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u07-extras" class="elink">🔥 Extres</a>
</div>

---

## ✅ Criteris d'avaluació coberts (RA4)

**RA4: Desenvolupa programes organitzats en classes analitzant i aplicant els principis de la programació orientada a objectes.**

| CE | Criteri | On es cobreix |
|---|---|---|
| RA4 a) | S'ha reconegut la sintaxi, estructura i components típics d'una classe. | ✅ Punt 1 |
| RA4 b) | S'han definit classes. | ✅ Punts 3 i 8 |
| RA4 c) | S'han definit propietats i mètodes. | ✅ Punts 2, 3 i 4 |
| RA4 d) | S'han creat constructors. | ✅ Punts 3 i 4 |
| RA4 e) | S'han desenvolupat programes que instancien i utilitzen objectes de les classes creades anteriorment. | ✅ Punts 8 i 9 |
| RA4 f) | S'han utilitzat mecanismes per a controlar la visibilitat de les classes i dels seus membres. | ✅ Punts 1 i 2 |
| RA4 h) | S'han creat i utilitzat mètodes estàtics. | ✅ Punts 5, 6 i 7 |

> 📌 L'herència (RA4 g) i les interfícies (RA4 i) tenen el seu capítol propi en la **U08**. Els conjunts i llibreries de classes (RA4 j) floreixen en la **U09** i la **U10**. Ací ens quedem amb visibilitat, encapsulació i static, que són els fonaments de tot lo demés.

---

## 🚪 Per on comence?

- Cero coneixements? → Comença en el [punt 1](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static/01-visibilidad). Només necessites el que vas vore en la U06.
- Ja blindes atributs i vols cim? → Ves directe al [punt 5](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static/05-atributos-static) i al [punt 6](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static/06-metodos-static): ací comença el món estàtic.
- Només vens a per els cadenats? → Salta al [punt 3](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static/03-encapsulacion) i al [punt 4](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static/04-getters-setters).
- Vens a repassar? → Fes el [Repàs interactiu](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static/09-repaso-interactivo) i després els [butlletins](/ApuntesProgramacion/va/boletines/boletin-u07-inicial).

**📍 Primer punt:** [01 · Visibilitat: l'art de no ensenyar-ho tot](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static/01-visibilidad)  
**⏭️ En acabar la unitat, continua en [U08 · Herència, Polimorfisme i Interfícies](/ApuntesProgramacion/va/08-herencia-polimorfismo-interfaces).