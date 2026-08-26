---
title: U01 — Introducció a Java
description: El teu primer cafè amb Java ☕
---

<p><small>El teu primer cafè amb Java ☕</small></p>

> 🗺️ **El mapa del paquet:** 🚪 Benvinguda → **☕ ACI ETS (U01)** → 🔤 Variables → 🔀 Control → 🧩 Algorítmica → ⚡ Tècniques → 🏗️ POO → 🔒 Visibilitat → 🧬 Herència → 📚 Col·leccions → 🗺️ Genèrics → 📁 Fitxers → 🗄️ JDBC → 🌐 APIs

---

Benvingut al curs de Programació en Java. Sabies que el teu ordinador és bàsicament un cadell molt llest però amb zero iniciativa? No fa res fins que li dones ordres precises. I per a això necessitem un **entorn de desenrotllament**, un llenguatge i moltes ganes de compilar.

Esta primera unitat et deixa a la porta del castell: instal·laràs el JDK, escriuràs el teu primer programa, coneixeràs la trilogia del cafè (JVM, JRE i JDK), usaràs el depurador com un detectiu i parlaràs amb la màquina mitjançant comentaris i arguments. No necessites experiència prèvia: només un editor de text i curiositat.

Esta unitat es llig com un **llibre de 9 capítols**: cada punt desenrotlla una idea completa i enllaça amb el següent.

---

## 🎯 Objectiu de la unitat

En acabar, seràs capaç de:

- Explicar la diferència entre **JDK, JRE i JVM** amb l'analogia de la cafeteria.
- Instal·lar i configurar un JDK i comprovar la instal·lació amb `java -version`.
- Escriure, compilar i executar el teu primer programa Java.
- Diseccionar el mètode `main` i entendre cada peça de l'esquelet d'un programa.
- Usar el **depurador** (breakpoints, step over/into, watch) com un detectiu.
- Escriure comentaris d'una línia, de bloc i **Javadoc**.
- Gestionar els **arguments de línia de comandes** amb `args`.
- Reconéixer i corregir els errors de compilació més típics del novat.
- Treballar amb un **IDE** i conéixer el teu flux de treball diari.

---

## 🗺️ Mapa de la unitat

| Punt | Què aprendràs | Nivell |
|---|---|---|
| [01 · Què és Java?](/ApuntesProgramacion/va/01-introduccion/01-que-es-java) | Història, bytecode, la trilogia JVM/JRE/JDK | Tots |
| [02 · Instal·lació del JDK](/ApuntesProgramacion/va/01-introduccion/02-instalacion-jdk) | Eclipse Temurin, `java -version`, PATH, IDE | Tots |
| [03 · El teu primer programa](/ApuntesProgramacion/va/01-introduccion/03-hola-mundo) | Hola Món, estructura, el mètode `main` | Tots |
| [04 · El depurador](/ApuntesProgramacion/va/01-introduccion/04-depurador) | Breakpoints, step over/into, watch | Tots |
| [05 · Comentaris i documentació](/ApuntesProgramacion/va/01-introduccion/05-comentarios) | `//`, `/* */`, `/** */` i Javadoc | Tots |
| [06 · Arguments de línia de comandes](/ApuntesProgramacion/va/01-introduccion/06-argumentos) | L'array `args`, com llegir-lo i usar-lo | Tots |
| [07 · El compilador i els seus errors](/ApuntesProgramacion/va/01-introduccion/07-errores-compilador) | Compilar vs executar, errors típics del novat | Tots |
| [08 · L'IDE i el teu flux de treball](/ApuntesProgramacion/va/01-introduccion/08-ide-flujo-trabajo) | Projectes, dreceres, crear/executar/depurar | Tots |
| [09 · Repàs interactiu](/ApuntesProgramacion/va/01-introduccion/09-repaso-interactivo) | Sé el Código, Fireside, Qui Soc, Laboratori, Crucigrama… | Tots |

> 📖 **Flux de lectura:** els 8 primers punts són teoria en progressió. El 9 és l'aterratge pràctic: llig-lo just després del 8 i abans d'obrir els butlletins.

---

## 📝 Butlletins de la unitat

> Practica amb els parells del curs: comença sempre pel resolt per a vore l'estil i després intenta el per-resoldre.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/va/boletines/boletin-u01-inicial-resuelto" class="elink">✅ Inicial resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u01-inicial" class="elink">🟢 Inicial per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u01-avanzado-resuelto" class="elink">💪 Avançat resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u01-avanzado" class="elink">⭐ Avançat per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u01-extras" class="elink">🔥 Extres</a>
</div>

---

## ✅ Criteris d'avaluació coberts (RA1)

**RA1: Reconeix l'estructura d'un programa informàtic, identificant i relacionant els elements propis del llenguatge de programació utilitzat.**

| CE | Criteri | On es cobreix |
|---|---|---|
| a) | Blocs que componen l'estructura d'un programa | ✅ Punts 3 i 7 |
| b) | Projectes de desenrotllament d'aplicacions | ✅ Punt 8 |
| c) | Entorns integrats de desenrotllament | ✅ Punts 2 i 8 |
| i) | Comentaris en el codi | ✅ Punt 5 |

> 📌 El depurador que es veu en el punt 4 posa les bases del RA3 (programes provats i depurats), que es completa en la U03.

---

## 🚪 Per on comence?

- ¿Cero coneixements? → Comença en el [punt 1](/ApuntesProgramacion/va/01-introduccion/01-que-es-java), no hi ha cap requisit previ.
- Ja saps què és un IDE? → Ves directe al [punt 3](/ApuntesProgramacion/va/01-introduccion/03-hola-mundo) i torna arrere només si et perds.
- Vens a repassar? → Fes el [Repàs interactiu](/ApuntesProgramacion/va/01-introduccion/09-repaso-interactivo) i els [butlletins](/ApuntesProgramacion/va/boletines/boletin-u01-inicial).

**📍 Primer punt:** [01 · Què és Java?](/ApuntesProgramacion/va/01-introduccion/01-que-es-java)  
**⏭️ En acabar la unitat, continua en [U02 · Variables, Tipus i Operadors](/ApuntesProgramacion/va/02-variables-tipos-operadores).**