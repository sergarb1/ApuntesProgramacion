---
title: "08 · Bones pràctiques: el decàleg del JDBC"
description: "Deu manaments per a no morir en l'intent: PreparedStatement sempre, try-with-resources, WHERE sempre i no tornar ResultSet 🗄️📜"
---

<p><small>Deu manaments per a no morir en l'intent: PreparedStatement sempre, try-with-resources, WHERE sempre i no tornar ResultSet 🗄️📜</small></p>

> 🗺️ **Estàs en:** 🗄️ **U13 · Connexió a BD amb JDBC** → 08 · Bones pràctiques

---

## 📬 La idea en una frase

> **Tot el que has aprés en esta unitat, resumit en 10 manaments: de "PreparedStatement sempre" a "confirma abans d'esborrar". Memoritza'ls i seràs l'ànima de l'oficina.**

Ja saps connectar, consultar, fer el CRUD, evitar la injecció, aplicar el DAO i gestionar transaccions. Este punt és el tancament de la teoria: la llista de coses que els programadors veterans van aprendre a base d'ensurts, i que tu pots aprendre en cinc minuts. Són els hàbits que separen qui escriu JDBC de qui el domestica.

---

## 📜 El decàleg del JDBC

1. **PreparedStatement sempre.** Mai concatenes SQL. L'SQL injection no és un mite: és Bobby Tables trucant a la teua porta.
2. **Try-with-resources.** `Connection`, `Statement` i `ResultSet` es tanquen sols. Connexió oberta que no es tanca = servidor que s'ennuega.
3. **No tornes `ResultSet`.** Torna llistes d'objectes (`List<Contacto>`). El `ResultSet` està lligat a la seua connexió: quan la tanques, mor amb ella.
4. **Captura `SQLException` amb missatge descriptiu.** No atrapes `Exception` a la babalà i no et quedes en silenci. `e.getMessage()` és el teu amic.
5. **Usa transaccions per a operacions múltiples.** Tot o res. Una transferència no es fa a mitges, i les teues dades tampoc.
6. **No exposes credencials en el codi.** La URL i les dades d'accés van en un fitxer de configuració (`config.properties`) o en variables d'entorn, no en un `static final String` de la classe. És com portar la contrasenya del banc escrita al front.
7. **Comprova les files afectades.** `executeUpdate()` et diu si l'operació va funcionar (`> 0`). Ignorar eixe valor és apostar a cegues.
8. **No faces consultes dins de bucles.** Una consulta en un bucle que recorre mil elements és mil viatges a la base de dades. Una sola consulta amb `JOIN` basta. El bucle és per a processar resultats, no per a fer consultes.
9. **`WHERE` sempre en `UPDATE` i `DELETE`.** O pagues les conseqüències. Sense `WHERE`, actualitzes o esborres la taula sencera i no hi ha volta enrere.
10. **Confirma abans d'esborrar.** L'usuari sempre s'equivoca. Un `DELETE` no té Ctrl+Z.

> 💡 **Consell:** els manaments 1, 2 i 9 són els que més vides han salvat. Si memoritzes només tres, que siguen eixos. Els altres set vénen de regal.

---

## 🔮 L'enigma

Tens dues taules en SQLite: `usuarios(id, nombre, email)` i `pedidos(id, usuario_id, total)`.

Vols obtindre tots els usuaris que han fet algun pedido amb total superior a **100 €**. Quantes consultes SQL necessites com a mínim si les fas "a la babalà"? I si uses `JOIN`?

<details>
<summary>🔄 Solució</summary>

**A la babalà (patró N+1):** primer una consulta per a llistar tots els usuaris (1 consulta) i després, per a cada usuari, una altra consulta que pregunte pels seus pedidos (N consultes, una per usuari). En total, **N + 1** consultes: si tens 1.000 usuaris, són 1.001 viatges a la base de dades. Lentíssim.

**Amb `JOIN`:** una sola consulta. La base de dades relaciona les dues taules internament i et torna només el que necessites.

```sql
SELECT DISTINCT u.nombre, u.email
FROM usuarios u
JOIN pedidos p ON p.usuario_id = u.id
WHERE p.total > 100;
```

**Una consulta, un viatge.** La lliçó del manament 8: el bucle processa resultats, però la base de dades és qui ha de fer el treball brut. Pregunta't sempre: estic fent N consultes on cabria una?

</details>

> 🕶️ **Don Tip:** una consulta amb `JOIN` és UNA sola crida a la base de dades. Fer una consulta per cada usuari en un bucle és el patró N+1, l'error de rendiment clàssic que cau en totes les entrevistes de treball.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quins tres manaments són els més importants segons este punt?
2. Per què no convé tornar un `ResultSet` des d'un mètode?
3. On han de viure les credencials de la base de dades?
4. Què és el patró N+1?

<details>
<summary>🔄 Respostes</summary>

1. **PreparedStatement sempre**, **try-with-resources** i **WHERE sempre** en UPDATE/DELETE.
2. Perquè el `ResultSet` està lligat a la seua connexió: en tancar-la, deixa de ser vàlid. Millor tornar `List<Contacto>`.
3. En un fitxer de configuració (`config.properties`) o variables d'entorn. Mai en el codi.
4. Fer 1 consulta per a llistar i N consultes dins d'un bucle: N+1 viatges a la base de dades on cabria una sola amb `JOIN`.

</details>

---

## ✅ Resum en 3 frases

1. El decàleg del JDBC són **10 hàbits** que t'estalvien desastres: `PreparedStatement` sempre, `try-with-resources`, `WHERE` sempre i comprovar files afectades, entre altres.
2. Dos errors de rendiment clàssics: **consultes en bucles** (patró N+1, s'arregla amb `JOIN`) i **tornar `ResultSet`** (s'arregla tornant llistes d'objectes).
3. La seguretat també és una bona pràctica: les **credencials mai van en el codi**, i els `DELETE` es **confirmen** abans d'executar-se.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Decàleg | Les 10 regles d'or del JDBC |
> | Patró N+1 | N consultes en un bucle on cabria una |
> | `JOIN` | Relacionar dues taules en una sola consulta |
> | Files afectades | El `int` de `executeUpdate()` que confirma el canvi |
> | `config.properties` | Fitxer on van la URL i les credencials |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/13-conexion-bases-datos) · **Anterior:** [07 · Transaccions](/ApuntesProgramacion/va/13-conexion-bases-datos/07-transacciones) · **Següent:** [09 · Repàs interactiu](/ApuntesProgramacion/va/13-conexion-bases-datos/09-repaso-interactivo)