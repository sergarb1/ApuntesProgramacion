---
title: "U12 — Fitxers i Expressions Regulars"
description: "El GPS dels fitxers, el llapis que no oblida, la porta que es tanca sola i el detectiu de patrons: File, FileWriter, BufferedReader, NIO, serialització i regex 📁"
emoji: 📁
---

<p><small>El GPS dels fitxers, el llapis que no oblida, la porta que es tanca sola i el detectiu de patrons: File, FileWriter, BufferedReader, NIO, serialització i regex 📁</small></p>

> 🗺️ **El mapa del paquet:** 🚪 Benvinguda → ☕ U01 → 🔤 U02 → 🔀 U03 → 🅿️ U04 → 🧩 U05 → ⚡ U06 → 🏗️ U07 → 🔒 U08 → 🧬 U09 → 📚 U10 → 🗺️ U11 → **📁 ACÍ ETS (U12)** → 🗄️ U13 → 🌐 U14

---

En la U11 vas vore genèrics i mapes: les teues dades per fi viuen en memòria com voldries. Però hi ha un problema: quan el programa acaba, tot s'esfuma. Els arrays, els `ArrayList` i els `HashMap` moren amb el `main`. Hui això s'acaba. Els **fitxers** fan que les teues dades sobreviscuen al teu programa, i les **expressions regulars** et donen vista de superheroi per a buscar, validar i extraure qualsevol patró en un text.

Esta unitat té tres grans actes:

- **Fitxers de text:** la classe `File`, el GPS dels fitxers; `FileWriter` i `FileReader` + `BufferedReader`, el llapis i el lector de sempre; `try-with-resources`, la porta que es tanca sola; i `PrintWriter` i `Scanner`, el sergent que formata i el pop que tokenitza.
- **La forma moderna i la d'elit:** l'API **NIO** (`Files` i `Paths`), que fa en una línia el que abans costava cinc, i la **serialització**, que guarda objectes sencers en un fitxer com qui fica roba en una maleta.
- **Expressions regulars:** `Pattern` i `Matcher`, la taula de símbols, i les seues aplicacions amb `matches()`, `replaceAll()`, `split()` i grups de captura per a validar correus, DNIs i telèfons com un professional.

Pel camí entendràs per què `new File("ruta")` no crea res, què és això de l'infern de les contrabarres (`\\d`), per què no tancar un fitxer et pot costar les dades, i per què una regex no servix per a validar HTML (per molt que ho intentes).

> 📌 **Nota:** la consola (`System.out`, `printf`, `Scanner` pel teclat) ja la vas vore en la **U02**, punt 7. Ací el `Scanner` i el `PrintWriter` tornen, però jugant en la seua lliga: llegint i escrivint fitxers.

Esta unitat es llig com un **llibre de 9 capítols**: els 8 primers punts són teoria en progressió i el 9 és un aterratge pràctic per a deixar-ho tot ben lligat.

---

## 🎯 Objectiu de la unitat

En acabar, seràs capaç de:

- Localitzar i descriure fitxers i carpetes amb la classe **`File`** (`exists`, `isFile`, `isDirectory`, `length`, `listFiles`).
- Escriure text amb **`FileWriter`** (sobreescrivint o afegint) i llegir-lo amb **`FileReader`** + **`BufferedReader`** línia a línia.
- Tancar recursos sense plorar amb **`try-with-resources`** i explicar per què el `close()` importa.
- Formatar l'eixida amb **`PrintWriter`** i llegir fitxers amb **`Scanner`** (inclòs `useDelimiter`).
- Gestionar fitxers amb l'API moderna **NIO** (`Files` i `Paths`): llegir, escriure i consultar en una línia.
- Guardar i recuperar objectes sencers amb **`ObjectOutputStream`** i **`ObjectInputStream`** (serialització).
- Crear i compilar **expressions regulars** amb `Pattern` i `Matcher`, i dominar els símbols bàsics.
- Aplicar regex amb **`matches()`, `replaceAll()` i `split()`**, i usar **grups de captura** per a validar i extraure.

---

## 🗺️ Mapa de la unitat

| Punt | Què aprendràs | Dificultat |
|---|---|---|
| [01 · La classe File: el teu explorador de fitxers](/ApuntesProgramacion/va/12-ficheros-regex/01-clase-file) | El GPS que localitza fitxers sense llegir-ne el contingut | Tots |
| [02 · Escriure i llegir text: FileWriter, FileReader i BufferedReader](/ApuntesProgramacion/va/12-ficheros-regex/02-escribir-leer-texto) | El llapis que no oblida i el lector que no s'ennuega | Tots |
| [03 · try-with-resources: tancar sense plorar](/ApuntesProgramacion/va/12-ficheros-regex/03-try-with-resources) | La porta que es tanca sola: adéu al `close()` manual | Tots |
| [04 · PrintWriter i Scanner + File](/ApuntesProgramacion/va/12-ficheros-regex/04-printwriter-scanner-file) | El sergent que formata i el pop que tokenitza | Tots |
| [05 · NIO: Files i Paths (la forma moderna)](/ApuntesProgramacion/va/12-ficheros-regex/05-nio-files-paths) | Llegir, escriure i consultar fitxers en una línia | Tots |
| [06 · Serialització: guardar objectes amb ObjectOutputStream](/ApuntesProgramacion/va/12-ficheros-regex/06-serializacion) | El teu objecte sencer en una maleta: `Serializable` | Tots |
| [07 · Expressions regulars: Pattern i Matcher](/ApuntesProgramacion/va/12-ficheros-regex/07-regex-basica) | El motle, el text i l'infern de les contrabarres | Tots |
| [08 · Regex en acció: matches, replaceAll, split i validacions](/ApuntesProgramacion/va/12-ficheros-regex/08-regex-aplicaciones) | Validar correus, DNIs, telèfons i extraure amb grups | Tots |
| [09 · Repàs interactiu](/ApuntesProgramacion/va/12-ficheros-regex/09-repaso-interactivo) | Sé el Código, Fireside, Laboratori, Crucigrama i més | Tots |

> 📖 **Flux de lectura:** els 8 primers punts són teoria en progressió. El 9 és l'aterratge pràctic: llig-lo just després del 8 i abans d'obrir els butlletins.

---

## 📝 Butlletins de la unitat

> Practica amb els parells del curs: comença sempre pel resolt per a vore l'estil i després intenta el per-resoldre.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/va/boletines/boletin-u12-inicial-resuelto" class="elink">✅ Inicial resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u12-inicial" class="elink">🟢 Inicial per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u12-avanzado-resuelto" class="elink">💪 Avançat resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u12-avanzado" class="elink">⭐ Avançat per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u12-extras" class="elink">🔥 Extres</a>
</div>

---

## ✅ Criteris d'avaluació coberts (RA5)

**RA5: Realitza operacions d'entrada i eixida d'informació, utilitzant procediments específics del llenguatge i llibreries de classes.**

| CE | Criteri | On es cobreix |
|---|---|---|
| RA5 c) | S'han reconegut les possibilitats d'entrada / eixida del llenguatge i les llibreries associades. | ✅ Punts 1, 4 i 5 |
| RA5 d) | S'han utilitzat fitxers per a emmagatzemar i recuperar informació. | ✅ Punts 1, 2, 3, 4, 5 i 6 |
| RA5 e) | S'han creat programes que utilitzen diversos mètodes d'accés al contingut dels fitxers. | ✅ Punts 2, 4, 5 i 6 |

> 📌 Els CEs **RA5 a)** (consola) i **RA5 b)** (format) es van cobrir en la **U02**, punt 7. Esta unitat completa la RA5 amb els fitxers i les llibreries d'E/S.

---

## ✅ Criteris d'avaluació coberts (RA6)

**RA6: Escriu programes que manipulen informació, seleccionant i utilitzant tipus avançats de dades.**

| CE | Criteri | On es cobreix |
|---|---|---|
| RA6 g) | S'han utilitzat expressions regulars en la cerca de patrons en cadenes de text. | ✅ Punts 7, 8 i 9 |

> 📌 La **RA6** es completa amb la **U04** (arrays, CE a), la **U10** (col·leccions, CEs b, c, d i e) i la **U11** (genèrics i mapes, CE f). Esta unitat aporta el CE g: les expressions regulars.

---

## 🚪 Per on comence?

- Vens de la U11 i vols l'essencial? → Comença en el [punt 1](/ApuntesProgramacion/va/12-ficheros-regex/01-clase-file) i el [punt 2](/ApuntesProgramacion/va/12-ficheros-regex/02-escribir-leer-texto): localitzar i llegir fitxers de text.
- Ja saps escriure i llegir i vols la forma moderna? → Salta al [punt 3](/ApuntesProgramacion/va/12-ficheros-regex/03-try-with-resources) (tancar sense plorar) i al [punt 5](/ApuntesProgramacion/va/12-ficheros-regex/05-nio-files-paths) (NIO en una línia).
- Només vens a per les regex? → Ves directe al [punt 7](/ApuntesProgramacion/va/12-ficheros-regex/07-regex-basica) i al [punt 8](/ApuntesProgramacion/va/12-ficheros-regex/08-regex-aplicaciones): el detectiu de patrons.
- Vens a repassar? → Fes el [Repàs interactiu](/ApuntesProgramacion/va/12-ficheros-regex/09-repaso-interactivo) i després els [butlletins](/ApuntesProgramacion/va/boletines/boletin-u12-inicial).

**📍 Primer punt:** [01 · La classe File: el teu explorador de fitxers](/ApuntesProgramacion/va/12-ficheros-regex/01-clase-file)  
**⏭️ En acabar la unitat, continua en [U13 · Connexió a BD amb JDBC](/ApuntesProgramacion/va/13-conexion-bases-datos).**