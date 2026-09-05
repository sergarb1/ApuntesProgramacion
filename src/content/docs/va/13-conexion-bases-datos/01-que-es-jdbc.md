---
title: "01 · Què és JDBC"
description: "JDBC, l'USB de les bases de dades: Java parla amb SQLite, MySQL o PostgreSQL gràcies a un controlador. I la dependència Maven que ho encén tot 🗄️🔌"
---

<p><small>JDBC, l'USB de les bases de dades: Java parla amb SQLite, MySQL o PostgreSQL gràcies a un controlador. I la dependència Maven que ho encén tot 🗄️🔌</small></p>

> 🗺️ **Estàs en:** 🗄️ **U13 · Connexió a BD amb JDBC** → 01 · Què és JDBC

---

## 📬 La idea en una frase

> **JDBC (Java Database Connectivity) és el traductor universal entre el teu codi Java i qualsevol base de dades que tinga un controlador: tant fa SQLite, MySQL o PostgreSQL, el codi que escrius és quasi el mateix.**

En la U12 vas aprendre a guardar dades en fitxers: llistes planes, text pla, fitxers solts. Però un fitxer no sap respondre a «dóna'm tots els alumnes majors de 18». Per a això estan les **bases de dades relacionals**: taules, files, columnes i consultes. I perquè Java puga parlar-hi existix JDBC, un conjunt d'interfícies del paquet `java.sql`. Benvingut al punt on el teu programa comença a tindre memòria de llarg termini.

---

## 🔌 JDBC: l'USB de les bases de dades

Pensa en JDBC com el port USB: tant fa què hi endollis (SQLite, MySQL, PostgreSQL, Oracle...), la clavilla és la mateixa. Cada base de dades aporta el seu **controlador** (en anglés, *driver*): un `.jar` que sap traduir les crides genèriques de JDBC al dialecte d'eixa base de dades en concret.

```
El teu programa Java  ──JDBC──▶  Controlador  ──▶  Base de dades
   (java.sql)          (genèric)   (l'endoll)        (SQLite, MySQL...)
```

La regla d'or: si canvies de base de dades i vas usar SQL estàndard, només canvies el **controlador** i la **URL de connexió**. La resta del codi ni se n'assabenta. Eixa és la màgia de JDBC.

> 💡 **Consell:** el paquet `java.sql` conté les interfícies clau: `Connection`, `Statement`, `PreparedStatement` i `ResultSet`. Este punt les presenta; els següents les desmunten una a una.

---

## 🗄️ SQLite: la base de dades d'entrenament

Per a aprendre no necessites muntar un servidor ni obrir ports. **SQLite** és una base de dades que viu en un **únic fitxer local**: sense servidor, sense usuari, sense contrasenya. Si el fitxer no existix, SQLite el crea sol la primera vegada que et connectes. Perfecta per a practicar, i de passada és la que usen un munt d'aplicacions reals.

> 📝 **Nota:** en el curs usem SQLite perquè no necessita instal·lació. Tot el que aprens ací (CRUD, PreparedStatement, transaccions) funciona igual en MySQL o PostgreSQL canviant el controlador i la URL.

---

## 📦 La dependència Maven

Per a usar el controlador de SQLite en un projecte Maven, afegixes esta dependència al `pom.xml`:

```xml
<dependency>
    <groupId>org.xerial</groupId>
    <artifactId>sqlite-jdbc</artifactId>
    <version>3.45.1.0</version>
</dependency>
```

Quan Maven la descarrega, el controlador queda al teu *classpath* i Java el troba sol. Des de Java 6 no necessites ni escriure `Class.forName(...)` per a carregar-lo: JDBC 4.0 s'auto-descobrix. Si veus `Class.forName()` en tutorials antics, és que eixe tutorial es va escriure quan es feia a mà. No passa res si el poses; tampoc passa res si no el poses.

> ⚠️ **Advertència:** si Maven no troba la classe `org.sqlite.JDBC` en executar, el 99% de les voltes és que la dependència no està al `pom.xml` o no s'ha descarregat. Primer revisa això, i després el teu codi.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què significa JDBC i en quin paquet viu?
2. Quin paper fa el controlador (driver)?
3. Per què SQLite és ideal per a aprendre?
4. Què has de canviar si passes de SQLite a MySQL?

<details>
<summary>🔄 Respostes</summary>

1. **Java Database Connectivity**, un conjunt d'interfícies en el paquet `java.sql`.
2. Traduïx les crides genèriques de JDBC al dialecte d'una base de dades concreta. És l'endoll.
3. Perquè no necessita servidor: viu en un únic fitxer local que es crea sol.
4. Només el controlador (la dependència) i la URL de connexió. El codi SQL estàndard es queda igual.

</details>

---

## ✅ Resum en 3 frases

1. **JDBC** és el pont estàndard de Java cap a qualsevol base de dades amb controlador: interfícies en `java.sql` que no canvien encara que canvie la base de dades.
2. Cada base de dades (SQLite, MySQL, PostgreSQL...) aporta el seu **controlador**, que traduïx les crides genèriques al seu dialecte.
3. Usem **SQLite** perquè és un únic fitxer sense servidor, i a Maven s'afig amb una dependència d'una línia.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | JDBC | Java Database Connectivity: el pont Java ↔ base de dades |
> | Controlador (driver) | L'endoll específic per a cada base de dades |
> | `java.sql` | El paquet amb les interfícies de JDBC |
> | SQLite | Base de dades en un únic fitxer, sense servidor |
> | Dependència Maven | La línia al `pom.xml` que porta el controlador |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/13-conexion-bases-datos) · **Anterior:** — · **Següent:** [02 · Connexió a SQLite: els 5 passos i Connection](/ApuntesProgramacion/va/13-conexion-bases-datos/02-conexion)