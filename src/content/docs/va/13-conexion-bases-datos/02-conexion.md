---
title: "02 · Connexió a SQLite: els 5 passos i Connection"
description: "El ritual dels 5 passos per a connectar Java amb SQLite i la interfície Connection, la canonada per on viatgen les teues consultes 🗄️🔗"
---

<p><small>El ritual dels 5 passos per a connectar Java amb SQLite i la interfície Connection, la canonada per on viatgen les teues consultes 🗄️🔗</small></p>

> 🗺️ **Estàs en:** 🗄️ **U13 · Connexió a BD amb JDBC** → 02 · Connexió a SQLite

---

## 📬 La idea en una frase

> **Connectar-se a SQLite és un ritual de 5 passos: `DriverManager.getConnection("jdbc:sqlite:instituto.db")` et torna una `Connection`, i eixa canonada serà la que use la resta del codi.**

Si el punt 1 era conéixer JDBC de lluny, ací t'hi acostes a saludar. Obrir una connexió és el primer que fa qualsevol programa amb base de dades, i també el que més voltes oblidem tancar. Anem a muntar el ritual complet i a entendre què és exactament eixe objecte `Connection` que usaràs en cada exercici de la unitat.

---

## 🪜 Els 5 passos (i el bonus no opcional)

Tot programa JDBC seguix esta escala:

1. **Carregar el controlador** — des de Java 6, automàtic. Només te'n recordes que existix quan lliges codi antic.
2. **Establir la connexió** — `DriverManager.getConnection(url)` et torna una `Connection`.
3. **Crear un Statement** — `con.createStatement()` (o `con.prepareStatement(sql)`, ho veuràs al punt 4).
4. **Executar la consulta** — `executeQuery()` per a SELECT, `executeUpdate()` per a INSERT/UPDATE/DELETE.
5. **Processar els resultats** — recórrer el `ResultSet` amb `next()`.

I el **bonus no opcional**: tancar-ho tot. En Java modern, `try-with-resources` ho fa sol (ho vas vore a la U12 amb els fitxers; ací és exactament la mateixa idea). Un recurs que no es tanca és una fuga: en un servidor, cada connexió oberta consumix memòria i hi ha un límit. Arriba el següent `getConnection()` i... "Too many connections".

> 💡 **Consell:** memoritza els 5 passos en ordre. El pas 4 i el 5 es repetixen en cada consulta que escrigues la resta de la teua vida. I el bonus de tancar... que no se t'oblide mai.

---

## 🔗 Connection: la canonada

`Connection` és la interfície que representa la connexió oberta amb la base de dades. És la canonada per on viatgen les teues consultes. Per a SQLite, que no té usuari ni contrasenya, la URL és simplement la ruta d'un fitxer:

```java
String url = "jdbc:sqlite:instituto.db";
Connection con = DriverManager.getConnection(url);
```

> 📝 **Nota:** si el fitxer `instituto.db` no existix, SQLite el crea automàticament. No has de muntar la base de dades a mà abans de connectar: la primera vegada que la uses, ja hi serà.

El famós protocol "jdbc:sqlite:" és la URL estàndard: `jdbc` és el protocol, `sqlite` és el subprotocol (quina base de dades) i la resta és el destí (per a MySQL seria una cosa com `jdbc:mysql://localhost:3306/instituto`).

### SQLException, la que et perseguirà

`DriverManager.getConnection(...)` llança **`SQLException`**, una excepció *checked*: el compilador t'obliga a capturar-la o declarar-la. Vas aprendre les excepcions a la U03; ací conviuràs amb esta a diari. El correcte no és empassar-te-la en silenci, sinó mostrar què ha passat:

```java
try {
    Connection con = DriverManager.getConnection(url);
    System.out.println("Connectat a SQLite!");
} catch (SQLException e) {
    System.err.println("Error de connexió: " + e.getMessage());
    System.err.println("Codi d'error: " + e.getErrorCode());
    System.err.println("Estat SQL: " + e.getSQLState());
}
```

> ⚠️ **Advertència:** no faces mai `catch (Exception e) {}` i et quedes tan ample. Això és tapar la llum del "check engine" amb esparadrap: l'error continua sent-hi, només que ja ningú el veu. Captura `SQLException`, i si vols saber més, usa `getErrorCode()` i `getSQLState()`.

---

## 🧼 La connexió completa amb try-with-resources

El patró que usaràs a tota la unitat. Obri la connexió, fes el que hagis de fer i oblida't d'històries:

```java
String url = "jdbc:sqlite:instituto.db";

try (Connection con = DriverManager.getConnection(url)) {
    System.out.println("Connectat. Base de dades llesta.");

    // ací anirien les consultes (Statement, ResultSet...)

} catch (SQLException e) {
    System.err.println("Error BD: " + e.getMessage());
}
// la Connection es tanca sola en eixir del try
```

`try-with-resources` tanca els recursos en **ordre invers** al d'obertura. Si obris `Connection`, `Statement` i `ResultSet`, es tanquen ResultSet → Statement → Connection. Sol i sense que hagis de pensar. És màgic, i és la forma correcta.

> 💡 **Consell:** no compartisques una `Connection` entre fils (ho veuràs més avant): no és *thread-safe*. Si algun dia necessites diverses connexions alhora, usa un pool de connexions com HikariCP. Per a este curs, una connexió per operació amb `try-with-resources` és més que suficient.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què torna `DriverManager.getConnection(url)`?
2. Què fa SQLite si el fitxer de la base de dades no existix?
3. Quina excepció llança `getConnection()` i per què no pots ignorar-la?
4. En quin ordre es tanquen els recursos amb `try-with-resources`?

<details>
<summary>🔄 Respostes</summary>

1. Una **`Connection`**, la canonada cap a la base de dades.
2. El crea automàticament. No has de muntar la base de dades a mà.
3. **`SQLException`**, una checked que el compilador t'obliga a gestionar.
4. En ordre invers al d'obertura: ResultSet → Statement → Connection.

</details>

---

## ✅ Resum en 3 frases

1. Connectar-se a SQLite és un **ritual de 5 passos** el cor del qual és `DriverManager.getConnection("jdbc:sqlite:instituto.db")`.
2. `Connection` és la **canonada** per on viatgen les teues consultes; si no la tanques, es queda oberta i esgota els recursos del servidor.
3. `getConnection()` llança **`SQLException`** (checked), i la forma correcta de treballar és embolicar-ho tot en **`try-with-resources`** perquè es tanque sol.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `DriverManager` | La classe que repartix connexions (`getConnection`) |
> | `Connection` | La canonada oberta cap a la base de dades |
> | URL JDBC | `jdbc:sqlite:archivo.db` — protocol, subprotocol i destí |
> | `SQLException` | La checked que t'acompanya en tot JDBC |
> | `try-with-resources` | Tancament automàtic de recursos, ordre invers |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/13-conexion-bases-datos) · **Anterior:** [01 · Què és JDBC](/ApuntesProgramacion/va/13-conexion-bases-datos/01-que-es-jdbc) · **Següent:** [03 · Statement i ResultSet: consultar dades](/ApuntesProgramacion/va/13-conexion-bases-datos/03-statement-resultset)