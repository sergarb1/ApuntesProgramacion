---
title: "09 · Introducció a ORM"
description: "El traductor automàtic entre les teues classes Java i les taules de la base de dades: què és un ORM, com mapeja i per què no t'ensarra d'aprendre SQL 🗄️🤖"
---

<p><small>El traductor automàtic entre les teues classes Java i les taules de la base de dades: què és un ORM, com mapeja i per què no t'ensarra d'aprendre SQL 🗄️🤖</small></p>

> 🗺️ **Estàs en:** 🗄️ **U14 · Persistència de dades: JDBC i introducció a ORM** → 09 · Introducció a ORM

---

## 📬 La idea en una frase

> **Un ORM (Object-Relational Mapping) és una capa de codi que converteix els teus objectes Java en files de taula i les teues consultes SQL en crides a mètodes, perquè tu et centres en el negoci i no en el catàleg.**

Has escrit JDBC a mà: `Connection`, `PreparedStatement`, `setXxx()`, `executeUpdate()`, tancar tot en l'ordre correcte... Funciona, és ràpid i aprens moltíssim. Però és **mol** codi repetitiu per al que fa: moure dades d'un lloc a un altre. Els ORM nàixeren exactament per a estalviar-te eixe treball mecànic.

---

## 🔎 Què és un ORM, concretament?

La base de dades pensa en **taules, files i columnes**. El teu programa pensa en **objectes, atributs i referències**. Parlen dos idiomes diferents i algú ha de traduir. Eixe traductor és el ORM:

| Concepte de la base de dades | Equivalent en Java |
|---|---|
| Taula | Classe (`@Entity`) |
| Fila | Objecte (instància) |
| Columna | Atribut |
| Clau primària (`id`) | Camp amb `@Id` |
| Clau forània | Referència a un altre objecte |
| `INSERT / UPDATE / DELETE` | `persist() / merge() / remove()` |
| `SELECT` | Mètode de busca (`find`, JPQL, criteris) |

En comptes de muntar el SQL i llegir el `ResultSet`, el ORM **fa el viatge d'anada i tornada per tu**: en guardar un objecte crea la fila, i en llegir una fila construïx l'objecte.

---

## ⚖️ JDBC vs ORM: la mateixa tasca, dos estils

Imagina guardar un contacte nou.

**A mà (JDBC):**

```java
String sql = "INSERT INTO contactos (nombre, email) VALUES (?, ?)";
try (Connection c = DriverManager.getConnection(url);
     PreparedStatement ps = c.prepareStatement(sql)) {
    ps.setString(1, "Ana");
    ps.setString(2, "ana@ejemplo.com");
    ps.executeUpdate();
}
```

**Amb un ORM (estil JPA):**

```java
Contacto ana = new Contacto("Ana", "ana@ejemplo.com");
em.persist(ana);   // una línia: el ORM genera l'INSERT per tu
```

El ORM construïx l'INSERT, passa els paràmetres, gestiona la connexió i, quans lliges, ompli el teu objecte camp a camp. Menys boilerplate, més lògica de negoci.

---

## 🧰 L'arsenal: JPA, Hibernate i companyia

No tots els ORM són iguals, i convé conéixer els noms que sentiràs en qualsevol entrevista:

- **JPA** (Java Persistence API): l'**especificació** de Java per a persistència. Són anotacions (`@Entity`, `@Table`, `@Column`) i una API estàndard, no un programa en si.
- **Hibernate**: la **implementació** de JPA més famosa. Si JPA és l'estàndard de tràfic, Hibernate és el cotxe que més circula.
- **Sessió i `EntityManager`:** l'objecte que gestiona les teues entitats. Les teues crides a `persist()` o `find()` passen per ell; ell decideix quan tocar la base de dades.
- **Càrrega perezosa (*lazy*) vs anticipada (*eager*):** el ORM pot traure els objectes relacionats només quan els necessites (lazy) o tot d'una (eager). Triar mal ací és l'origen de no pocs forats de rendiment.

> 💡 **Del curs a la indústria:** nosaltres hem usat SQLite + JDBC perquè és la forma més honesta d'entendre què passa sota el capó. En un projecte JPA el capó continua sent el mateix: connexions, SQL i transaccions... sol que el ORM ho condueix per tu.

---

## 🐘 La cara oculta: allò que el ORM no t'arregla

Un ORM no és màgia, i saber els seus límits és el que et separa de qui només va copiar un tutorial:

1. **El SQL continua sent teu.** El ORM genera consultes senzilles, però una consulta amb tres `JOIN` i un agregat la escrius tu (o la genera el ORM, però has de llegir-la i entendre-la).
2. **N+1 també, però amagat.** Recórrer una llista i que cada objecte carrega els seus fills a escondides = N+1 una altra volta. El ORM l'amplifica si no el vigiles.
3. **Capa de rendiment.** De vegades el ORM fa *dos* viatges on tu n'hauries fet un. Medir continua sent obligatori.
4. **Corba d'aprenentatge.** Configurar proveïdors, dialectes, mapatges... té el seu cost inicial.
5. **El desajust objecte-relacional.** Classes amb herència i taules planes no encaixen sempre net: per això el tema es diu *mapeig* i no *traducció perfecta*.

> ⚠️ **[WARNING]** Un ORM no substituïx a SQL, l'**amaga**. Si no entens allò que hi ha davall (INSERT, transaccions, índexs), quan algo falla no sabrás ni per on començar a mirar. Per això ho veiem al final de la unitat: primer el motor, després el GPS.

---

## 🧭 I per què ho veem ara?

Perquè l'ordre importa: quan algú diga «esta app usa Hibernate i no escrivim SQL», tu ja sabràs respondre **què està fent exactament davall** (el teu `persist()` d'una línia és l'`PreparedStatement` del capítol 5, amb vestit i corbata). I quan el ORM et falla a les 3 de la matinada, tu seràs qui obri el log i vaja el SQL real.

Eixa és la promesa d'este punt: **no memoritzar un framework, sinó entendre la idea** que hi ha darrere de tots ells.

---

## 🎯 Mini-comprovació

Posa't a prova en 30 segons (les respostes estan amagades):

1. Què traduïx un ORM: d'objectes a taules o de taules a objectes?
2. En JPA, què és `@Entity` i què és Hibernate?
3. Quin és el risc clàssic de rendiment que un ORM pot amagar?
4. Per què no substituïx a SQL?

<details>
<summary>🔄 Respostes</summary>

1. **En les dos direccions**: en guardar traduïx objectes → files; en llegir, files → objectes.
2. `@Entity` és una anotació de l'especificació **JPA** (marca la classe com a entitat persistent); **Hibernate** és la implementació que fa el treball real.
3. El patró **N+1**: cada objecte que carregues dispara consultes addicionals sense que ho veges a primera vista.
4. Perquè genera consultes senzilles i amaga la mecànica; per a consultes complexes, rendiment o depuració, continues necessitant entendre SQL.

</details>

---

## ✅ Resum en 3 frases

1. Un **ORM** mapeja classes → taules i objectes → files, i traduïx crides a mètodes (`persist`, `find`) en SQL per a estalviar-te el JDBC mecànic.
2. **JPA** és l'especificació de Java (anotacions + API) i **Hibernate** és la seua implementació més usada; treballen amb un `EntityManager` i entitats anotades.
3. No substituïx a SQL: **amaga** el treball repetitiu, però les consultes complexes, el rendiment (N+1) i la depuració continuen sent cosa teua.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | ORM | Capa que traduïx objectes ↔ taules |
> | JPA | Especificació de persistència de Java (anotacions + API) |
> | Hibernate | Implementació de JPA més estesa |
> | Entitat | Classe mapada a una taula (`@Entity`) |
> | `EntityManager` | El "mandatari" que executa la persistència |
> | Lazy / eager | Carregar dades tard (quan toca) o tot d'una |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/14-conexion-bases-datos) · **Anterior:** [08 · Bones pràctiques](/ApuntesProgramacion/va/14-conexion-bases-datos/08-buenas-practicas) · **Següent:** [10 · Repàs interactiu](/ApuntesProgramacion/va/14-conexion-bases-datos/10-repaso-interactivo)
