---
title: "05 · PreparedStatement i SQL injection"
description: "Concatena strings en SQL i Bobby Tables esborrarà la teua taula d'alumnes. La vacuna es diu PreparedStatement i els seus placeholders ? 🗄️💉"
---

<p><small>Concatena strings en SQL i Bobby Tables esborrarà la teua taula d'alumnes. La vacuna es diu PreparedStatement i els seus placeholders ? 🗄️💉</small></p>

> 🗺️ **Estàs en:** 🗄️ **U13 · Connexió a BD amb JDBC** → 05 · PreparedStatement i SQL injection

---

## 📬 La idea en una frase

> **Mai construïscues SQL concatenant strings amb dades de l'usuari: és SQL injection. La vacuna és `PreparedStatement`, que separa l'SQL de les dades amb placeholders `?` i l'ompli de forma segura.**

Al punt 3 vas vore `Statement` i va quedar clar que servix per a consultes fixes. Ací arriba el moment en què et dic per què, així que hi haja **dades de l'usuari** de per mig, el `Statement` es convertix en una bomba de rellotgeria. I de passada coneixeràs Bobby Tables, el xiquet més famós de la història de les bases de dades.

---

## 💣 Concatenar SQL: la bomba

Imagina una cerca d'alumnes per nom. La forma innocent (i fatal) de muntar-la:

```java
// PERILL: això és una bomba
String sql = "SELECT * FROM alumnos WHERE nombre = '" + inputUsuario + "'";
```

Ara, un "usuari" escriu això al camp de cerca:

```
Luis'; DROP TABLE alumnos; --
```

La consulta que s'executa acaba sent:

```sql
SELECT * FROM alumnos WHERE nombre = 'Luis'; DROP TABLE alumnos; --'
```

Fixa't: tanca la cometa amb `'`, acaba la consulta amb `;`, **esborra la taula** amb `DROP TABLE alumnos`, i comenta la resta amb `--`. Adéu, taula d'alumnes. Això és **SQL Injection** i passa de veritat, en aplicacions reals, cada dia.

> ⚠️ **Advertència:** MAI construïscues SQL concatenant strings amb dades de l'usuari. És com deixar les claus posades al cotxe amb un cartell a la porta que posa "PASSE VOSTÉ".

### La història de Bobby Tables

```
Madre: "He criat al meu fill perquè siga un programador acurat,
        no un hacker que robe dades."
Fill:  "Hola, em dic Robert'); DROP TABLE Students; --"
```

No sigues Bobby Tables. Usa PreparedStatement.

---

## 💉 PreparedStatement al rescat

La solució és separar el **codi SQL** de les **dades**. L'SQL es prepara amb placeholders `?` i els valors es passen després, per separat:

```java
String sql = "SELECT * FROM alumnos WHERE nombre = ?";
PreparedStatement pstmt = conexion.prepareStatement(sql);
pstmt.setString(1, nombre);
ResultSet rs = pstmt.executeQuery();
```

El controlador escapa les dades automàticament: si l'usuari escriu `Robert'); DROP TABLE Students; --`, es tracta com un **valor**, no com a codi. La taula es queda on està.

Els `?` són **placeholders posicionals** i comencen en **1** (no en 0, com els arrays... trampa clàssica d'examen):

| Tipus | Mètode |
|---|---|
| String | `setString(i, valor)` |
| int | `setInt(i, valor)` |
| double | `setDouble(i, valor)` |
| boolean | `setBoolean(i, valor)` |
| Date | `setDate(i, valor)` (usa `java.sql.Date`) |
| null | `setNull(i, Types.TIPO)` |

> 💡 **Consell:** per a moltes consultes iguals, `PreparedStatement` pot ser **més ràpid** que `Statement`, perquè la base de dades compila la consulta una sola volta i reutilitza el pla. La seguretat la tens gratis, i de regal ve la velocitat.

---

## 🧪 Guia de placeholders

Diversos `?`, en ordre. El primer és el `1`, el segon el `2`, i així successivament:

```java
String sql = "SELECT * FROM alumnos WHERE curso = ? AND edad > ? ORDER BY nombre";
try (PreparedStatement pstmt = conexion.prepareStatement(sql)) {
    pstmt.setString(1, "DAM");
    pstmt.setInt(2, 18);
    try (ResultSet rs = pstmt.executeQuery()) {
        while (rs.next()) {
            System.out.println(rs.getString("nombre"));
        }
    }
}
```

¿Veu qué net? No hi ha concatenació, no hi ha cometes escapades, no hi ha risc d'injecció. Només `?` nets i ordenats. Els placeholders només valen per a **valors**, mai per a noms de taula o columna: `SELECT * FROM ?` no funciona, i no hauria de funcionar: un identificador no s'escapa, es tria al codi.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** PreparedStatement prevé l'SQL injection perquè separa el codi SQL de les dades. Mai concatenes strings en SQL, ni en broma.

**Exercici: detecta l'intent d'atac**

Un alumne t'ensenya este codi i et pregunta si és segur:

```java
String nombre = sc.nextLine();
String sql = "SELECT * FROM alumnos WHERE nombre = '" + nombre + "'";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
```

**Què respondries?** És segur? Què passaria si l'usuari escriguera `Ana'; DELETE FROM matriculas; --`? Com ho arreglaries?

<details>
<summary>🔄 Solució</summary>

**No és segur, és SQL injection en estat pur.** Amb `Ana'; DELETE FROM matriculas; --`, l'SQL es convertix en un `SELECT` que acaba abans d'hora i després executa `DELETE FROM matriculas` (la instrucció que el `--` comenta només en la part sobrera). S'esborrarien totes les matrícules.

La solució: `PreparedStatement` amb placeholder.

```java
String sql = "SELECT * FROM alumnos WHERE nombre = ?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, nombre);
ResultSet rs = pstmt.executeQuery();
```

Ara `Ana'; DELETE FROM matriculas; --` és només un nom estrany que es busca tal qual. La taula respira tranquil·la.

</details>

---

## 🥊 El ring: Statement vs PreparedStatement

Dues formes d'executar SQL discutiXen davant la màquina de cafè.

**Statement:** — Jo soc l'original. Senzill, directe. `stmt.executeQuery("SELECT * FROM usuarios")`. Per a consultes fixes soc perfecte.

**PreparedStatement:** — Sí, però concatenar strings en SQL és una bomba de rellotgeria. Injecció SQL, errors de sintaxi amb cometes... Jo separo l'SQL de les dades amb `?` i soc segur.

**Statement:** — Per a una consulta fixa, una sola volta, per què he de preparar res?

**PreparedStatement:** — A més, jo faig cache del pla d'execució. Si executes la mateixa consulta diverses voltes amb diferents paràmetres, soc més ràpid. I en Java, quasi sempre executes la mateixa consulta amb diferents valors.

**Statement:** — Val, però jo servisc per a DDL: CREATE TABLE, ALTER...

**PreparedStatement:** — Cert. Per a DDL usa Statement. Per a DML (SELECT, INSERT, UPDATE, DELETE) usa PreparedStatement. Tracte?

**Statement:** — Tracte.

> 🕶️ **Don Tip:** usa sempre `PreparedStatement` per a consultes amb dades d'usuari. No és només seguretat: és més ràpid en consultes repetitives i més llegible.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. En quin número comencen els índexs dels `?` en un `PreparedStatement`?
2. Què fa la base de dades amb `Robert'); DROP TABLE Students; --` si uses PreparedStatement?
3. Pots usar `?` per al nom d'una taula?
4. Per què `PreparedStatement` pot ser més ràpid en consultes repetides?

<details>
<summary>🔄 Respostes</summary>

1. En **1**. El primer `?` és el `setXxx(1, ...)`. No hi ha cap `?` a la posició 0.
2. Ho tracta com un **valor** de text, escapat. No s'executa cap instrucció extra.
3. No. Els `?` només valen per a valors, no per a identificadors.
4. Perquè la base de dades **compila la consulta una sola volta** i reutilitza el pla d'execució.

</details>

---

## ✅ Resum en 3 frases

1. Concatenar SQL amb dades de l'usuari és **SQL injection**: una entrada com `'; DROP TABLE alumnos; --` pot esborrar taules senceres.
2. **`PreparedStatement`** separa l'SQL de les dades amb placeholders `?` i els `setXxx(i, valor)` (índexs des de 1), escapant els valors automàticament.
3. És la forma **segura**, la més **ràpida** per a consultes repetides i l'única que no et farà passar vergonya en una entrevista de treball.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | SQL injection | Injectar instruccions SQL a través de dades d'usuari |
> | Placeholder | El `?` que reserva el buit per a un valor |
> | `setXxx(i, valor)` | Ompli el placeholder número `i` (des de 1) |
> | Escapar | Neutralitzar caràcters perillosos d'un text |
> | Bobby Tables | El xiquet que t'ensenya per què no concatenar |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/13-conexion-bases-datos) · **Anterior:** [04 · CRUD complet](/ApuntesProgramacion/va/13-conexion-bases-datos/04-crud) · **Següent:** [06 · El patró DAO](/ApuntesProgramacion/va/13-conexion-bases-datos/06-pattern-dao)