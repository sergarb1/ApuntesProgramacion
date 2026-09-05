---
title: "07 · Transaccions: commit, rollback i savepoints"
description: "Operacions de tot o res: setAutoCommit(false), commit per a confirmar, rollback per a desfer i savepoints per a no desfer-ho tot 🗄️🎭"
---

<p><small>Operacions de tot o res: setAutoCommit(false), commit per a confirmar, rollback per a desfer i savepoints per a no desfer-ho tot 🗄️🎭</small></p>

> 🗺️ **Estàs en:** 🗄️ **U13 · Connexió a BD amb JDBC** → 07 · Transaccions

---

## 📬 La idea en una frase

> **Una transacció agrupa diverses operacions en un "tot o res": `setAutoCommit(false)` obri el parèntesi, `commit()` el tanca confirmant, i `rollback()` el tanca desfent-ho tot.**

Fins ara cada `executeUpdate()` es guardava al moment. Però què passa quan una operació depén d'una altra? Pensa en una transferència bancària: traure 50 € d'un compte i posar-los en un altre. Si la segona operació falla, et quedes amb 50 € volant al limbe. Això no pot passar. Ací entren les transaccions.

---

## 🎭 El problema: el limbe dels diners

Imagina estes dues operacions:

```java
// Operació 1: traure 50 € a Ana
stmt.executeUpdate("UPDATE cuentas SET saldo = saldo - 50 WHERE titular = 'Ana'");

// Operació 2: posar 50 € a Luis
stmt.executeUpdate("UPDATE cuentas SET saldo = saldo + 50 WHERE titular = 'Luis'");
```

Sense transaccions, cada `UPDATE` es confirma sol. Si l'operació 2 llança una `SQLException`, la 1 ja s'ha executat: Ana és més pobra i Luis no és més ric. El sistema queda **inconsistent**. Les dades ja no quadren, i ningú sap com arreglar-ho.

> ⚠️ **Advertència:** sense transaccions, si falla la segona operació, la primera ja es va executar. El sistema queda inconsistent. Usa transaccions per a operacions **atòmiques** (tot o res): com un pont que o està sencer o no està.

---

## 🔄 setAutoCommit(false): obrir el parèntesi

Per defecte, JDBC usa **auto-commit**: cada sentència es confirma al moment. Per a agrupar operacions, el desactivem i decidim nosaltres quan es confirma:

```java
public void transferir(int idOrigen, int idDestino) {
    String quitar = "UPDATE cuentas SET saldo = saldo - 50 WHERE id = ?";
    String poner  = "UPDATE cuentas SET saldo = saldo + 50 WHERE id = ?";

    try (Connection con = DriverManager.getConnection(URL)) {
        con.setAutoCommit(false);   // obrim la transacció

        try (PreparedStatement q = con.prepareStatement(quitar);
             PreparedStatement p = con.prepareStatement(poner)) {

            q.setInt(1, idOrigen);
            q.executeUpdate();

            if (idOrigen == idDestino) {
                throw new SQLException("Destí invàlid: mateix compte");
            }

            p.setInt(1, idDestino);
            p.executeUpdate();

            con.commit();           // tot bé: confirmem
            System.out.println("Transferència OK");

        } catch (SQLException e) {
            con.rollback();         // alguna cosa va fallar: desfem tot
            System.err.println("Va fallar, tot desfet: " + e.getMessage());
        }
    } catch (SQLException e) {
        System.err.println("Error de connexió: " + e.getMessage());
    }
}
```

El flux és clar: **obrir** amb `setAutoCommit(false)`, fer totes les operacions, i al final **`commit()`** si tot va bé o **`rollback()`** si alguna cosa va fallar. El `rollback()` està al `catch` intern: qualsevol `SQLException` de les dues operacions el dispara i la base de dades torna a com estava.

> 💡 **Consell:** el `setAutoCommit(false)` va abans de les operacions, sobre la connexió. El `commit()` i el `rollback()` també són mètodes de la `Connection`. Tot gira al voltant d'eixe objecte.

---

## 📍 Savepoints: no desfer-ho tot

De vegades una transacció té diverses fases i no vols desfer tot si falla l'última. Un **savepoint** és una marca intermèdia: pots fer `rollback` fins a eixe punt i conservar l'anterior.

```java
con.setAutoCommit(false);

Savepoint sp = con.setSavepoint("despresDInserir");
// ... més operacions ...

if (algoMal) {
    con.rollback(sp);   // torna al savepoint, no desfà tot
} else {
    con.commit();       // tot bé
}
```

És com en un videojoc: `setSavepoint` guarda la partida, `rollback(sp)` et torna a eixa partida guardada en comptes de començar de zero, i `commit()` guarda el final definitiu. Útil quan una transacció llarga té una part que saps que sempre ix bé i una altra que pot fallar.

> 📝 **Nota:** els savepoints s'usen menys del que pareix. El 90% de les voltes et basta amb `commit()`/`rollback()` en bloc. Però saber que existixen t'estalviarà un ensurt el dia que els necessites.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quin mètode de `Connection` obri una transacció?
2. Què fa `commit()`? I `rollback()`?
3. On se sol posar el `rollback()` en un mètode típic?
4. Què et permet fer un `Savepoint`?

<details>
<summary>🔄 Respostes</summary>

1. `con.setAutoCommit(false)`. Amb `true` (el normal) cada sentència es confirma sola.
2. `commit()` confirma totes les operacions; `rollback()` les desfà totes.
3. Al `catch (SQLException e)` del bloc d'operacions: si alguna cosa falla, es desfà tot.
4. Fer `rollback` fins a eixe punt concret en comptes de desfer tota la transacció.

</details>

---

## ✅ Resum en 3 frases

1. Una **transacció** agrupa operacions en un tot-o-res: `setAutoCommit(false)` l'obri, `commit()` la confirma i `rollback()` la desfà.
2. Sense transaccions, una operació que falla a mitges deixa les dades **inconsistents** (com els diners que desapareixen del limbe).
3. Els **savepoints** marquen punts intermedis per a poder desfer només una part de la transacció.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Transacció | Un grup d'operacions que van juntes o no van |
> | `setAutoCommit(false)` | Obri la transacció: tu controles el moment |
> | `commit()` | Confirmar-ho tot: es guarda |
> | `rollback()` | Desfer-ho tot: com si no haguera passat |
> | `Savepoint` | Marca intermèdia per a desfer només fins ací |
> | Atòmic | Tot o res, sense estats a mitges |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/13-conexion-bases-datos) · **Anterior:** [06 · El patró DAO](/ApuntesProgramacion/va/13-conexion-bases-datos/06-pattern-dao) · **Següent:** [08 · Bones pràctiques](/ApuntesProgramacion/va/13-conexion-bases-datos/08-buenas-practicas)