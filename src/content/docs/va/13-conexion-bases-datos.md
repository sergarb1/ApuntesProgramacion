---
title: "U13 — Connexió a Bases de Dades amb JDBC"
description: "Java aprén a parlar amb les bases de dades: JDBC, SQLite, Connection, Statement, PreparedStatement, el patró DAO i transaccions. Tot amb humor i sense perdre la connexió 🗄️"
emoji: 🗄️
---

<p><small>Java aprén a parlar amb les bases de dades: JDBC, SQLite, Connection, Statement, PreparedStatement, el patró DAO i transaccions. Tot amb humor i sense perdre la connexió 🗄️</small></p>

> 🗺️ **El mapa del paquet:** 🚪 Benvinguda → ☕ U01 → 🔤 U02 → 🔀 U03 → 🅿️ U04 → 🧩 U05 → ⚡ U06 → 🏗️ U07 → 🔒 U08 → 🧬 U09 → 📚 U10 → 🗺️ U11 → 📁 U12 → **🗄️ ACÍ ETS (U13)** → 🌐 U14

---

En la U12 vas tancar el tracte amb els **fitxers**: guardar i llegir informació al disc. Hui pugem de nivell. Eixa informació deixa de viure en un fitxer solt i passa a una **base de dades relacional**, amb les seues taules, les seues claus i les seues regles. I Java, és clar, hi parlarà. La ferramenta es diu **JDBC** (Java Database Connectivity) i és el pont oficial entre el teu codi i qualsevol base de dades amb controlador.

Esta unitat té tres grans actes:

- **Connectar i consultar:** què és JDBC, com es munta la dependència de **SQLite** a Maven i el ritual dels 5 passos per a obrir una connexió (`Connection`), llançar consultes (`Statement`) i llegir els resultats (`ResultSet`).
- **El CRUD segur:** inserir, llegir, actualitzar i esborrar amb **`PreparedStatement`**, la vacuna contra l'**SQL injection** (pregunta-li a Bobby Tables), i el **patró DAO** perquè l'SQL no es cole en la teua lògica de negoci.
- **La integritat:** **transaccions** amb `commit` i `rollback` per a operacions de tot-o-res, i un decàleg de bones pràctiques perquè la teua connexió no siga una fuga de recursos.

Pel camí coneixeràs `SQLException`, l'excepció checked que t'acompanyarà a cada pas, i entendràs per què `executeQuery()` i `executeUpdate()` són com la porta d'embarcament i la del maleter: cada operació té la seua.

Esta unitat es llig com un **llibre de 9 capítols**: els 8 primers punts són teoria en progressió i el 9 és un aterratge pràctic per a deixar-ho tot ben lligat.

---

## 🎯 Objectiu de la unitat

En acabar, seràs capaç de:

- Explicar **què és JDBC** i per què servix per a qualsevol base de dades amb controlador.
- Configurar la dependència de **SQLite** a Maven i connectar el teu programa amb `DriverManager.getConnection()`.
- Executar consultes amb **`Statement`** i llegir els resultats amb **`ResultSet`** usant `next()` i els `getXxx("columna")`.
- Aplicar el **CRUD complet** (INSERT, SELECT, UPDATE, DELETE) amb `executeQuery()` i `executeUpdate()`.
- Usar **`PreparedStatement`** amb placeholders `?` i evitar l'**SQL injection** sense excuses.
- Aplicar el **patró DAO** (interfície + implementació) per a separar l'SQL de la lògica de negoci.
- Gestionar **transaccions** amb `commit()`, `rollback()` i savepoints per a operacions atòmiques.
- Escriure codi JDBC seguint el **decàleg de bones pràctiques**: `try-with-resources`, files afectades i `WHERE` sempre.

---

## 🗺️ Mapa de la unitat

| Punt | Què aprendràs | Dificultat |
|---|---|---|
| [01 · Què és JDBC](/ApuntesProgramacion/va/13-conexion-bases-datos/01-que-es-jdbc) | JDBC, SQLite i la dependència Maven que ho posa tot en marxa | Tots |
| [02 · Connexió a SQLite](/ApuntesProgramacion/va/13-conexion-bases-datos/02-conexion) | Els 5 passos del ritual i la interfície `Connection` | Tots |
| [03 · Statement i ResultSet](/ApuntesProgramacion/va/13-conexion-bases-datos/03-statement-resultset) | Executar consultes i processar files amb `next()` i `getXxx` | Tots |
| [04 · CRUD complet](/ApuntesProgramacion/va/13-conexion-bases-datos/04-crud) | Inserir, llegir, actualitzar i esborrar amb `executeQuery` i `executeUpdate` | Tots |
| [05 · PreparedStatement i SQL injection](/ApuntesProgramacion/va/13-conexion-bases-datos/05-preparedstatement) | Placeholders `?`, `setXxx` i la història de Bobby Tables | Tots |
| [06 · El patró DAO](/ApuntesProgramacion/va/13-conexion-bases-datos/06-pattern-dao) | Interfície + implementació: l'SQL no trepitja la teua lògica de negoci | Tots |
| [07 · Transaccions](/ApuntesProgramacion/va/13-conexion-bases-datos/07-transacciones) | `commit`, `rollback` i savepoints: tot o res | Tots |
| [08 · Bones pràctiques](/ApuntesProgramacion/va/13-conexion-bases-datos/08-buenas-practicas) | El decàleg del JDBC: recursos, files afectades i `WHERE` sempre | Tots |
| [09 · Repàs interactiu](/ApuntesProgramacion/va/13-conexion-bases-datos/09-repaso-interactivo) | Sé el Código, Fireside, Laboratori, Crucigrama i més | Tots |

> 📖 **Flux de lectura:** els 8 primers punts són teoria en progressió. El 9 és l'aterratge pràctic: llig-lo just després del 8 i abans d'obrir els butlletins.

---

## 📝 Butlletins de la unitat

> Practica amb els parells del curs: comença sempre pel resolt per a vore l'estil i després intenta el per-resoldre.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/va/boletines/boletin-u13-inicial-resuelto" class="elink">✅ Inicial resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u13-inicial" class="elink">🟢 Inicial per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u13-avanzado-resuelto" class="elink">💪 Avançat resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u13-avanzado" class="elink">⭐ Avançat per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u13-extras" class="elink">🔥 Extres</a>
</div>

---

## ✅ Criteris d'avaluació coberts (RA9)

**RA9: Gestiona informació emmagatzemada en bases de dades relacionals mantenint la integritat i la consistència de les dades.**

| CE | Criteri | On es cobreix |
|---|---|---|
| RA9 a) | S'han identificat les característiques i mètodes d'accés a sistemes gestors de bases de dades relacionals. | ✅ Punts 1 i 2 |
| RA9 b) | S'han programat connexions amb bases de dades. | ✅ Punt 2 |
| RA9 c) | S'ha escrit codi per a emmagatzemar informació en bases de dades. | ✅ Punts 4 i 5 |
| RA9 d) | S'han creat programes per a recuperar i mostrar informació emmagatzemada en bases de dades. | ✅ Punts 3 i 4 |
| RA9 e) | S'han efectuat esborrats i modificacions sobre la informació emmagatzemada. | ✅ Punt 4 |
| RA9 f) | S'han creat aplicacions que executin consultes sobre bases de dades. | ✅ Punts 3, 5 i 9 |
| RA9 g) | S'han creat aplicacions per a possibilitar la gestió d'informació present en bases de dades relacionals. | ✅ Punts 6 i 9 |

> 📌 Esta unitat cobrix la **RA9** completa. El camí fins ací: la **U03** et va ensenyar les excepcions (i `SQLException` és checked, et perseguirà), la **U07/U08** et va donar les classes i interfícies amb què muntar els POJO i el DAO, i la **U12** et va deixar el `try-with-resources` llest per a tancar connexions. Tot el material anterior cobra sentit ara: és hora que els teus objectes dormisquen en una base de dades.

---

## 🚪 Per on comence?

- Vens de la U12 (fitxers) i vols l'essencial? → Comença en el [punt 1](/ApuntesProgramacion/va/13-conexion-bases-datos/01-que-es-jdbc) i el [punt 2](/ApuntesProgramacion/va/13-conexion-bases-datos/02-conexion): connectar és el 90% de la batalla.
- Ja connectes i vols gestionar dades? → Ves directe al [punt 4](/ApuntesProgramacion/va/13-conexion-bases-datos/04-crud) (el CRUD) i al [punt 5](/ApuntesProgramacion/va/13-conexion-bases-datos/05-preparedstatement) (fer-ho sense que et pirategen).
- Només vens a pels trucs? → Salta al [punt 5](/ApuntesProgramacion/va/13-conexion-bases-datos/05-preparedstatement) (l'SQL injection) i al [punt 8](/ApuntesProgramacion/va/13-conexion-bases-datos/08-buenas-practicas) (el decàleg).
- Vens a repassar? → Fes el [Repàs interactiu](/ApuntesProgramacion/va/13-conexion-bases-datos/09-repaso-interactivo) i després els [butlletins](/ApuntesProgramacion/va/boletines/boletin-u13-inicial).

**📍 Primer punt:** [01 · Què és JDBC](/ApuntesProgramacion/va/13-conexion-bases-datos/01-que-es-jdbc)  
**⏭️ En acabar la unitat, continua en [U14 · Servir i Consumir APIs amb Web](/ApuntesProgramacion/va/14-apis-web).**