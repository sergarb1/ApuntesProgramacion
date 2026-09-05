---
title: "09 — Repàs interactiu: controla les estructures"
description: El tancament pràctic de la unitat, amb decisions, bucles i una excepció que no funcionarà 😈
---

<p><small>El tancament pràctic de la unitat, amb decisions, bucles i una excepció que no funcionarà 😈</small></p>

> 🗺️ **Estàs en:** 🔀 **U03 · Estructures de Control i Excepcions** → 09 · Repàs interactiu

---

## 📬 La idea en una frase

> **En este punt no aprenem res de nou: ho convertim tot en pràctica. I, com sempre, alguna cosa no funcionarà.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaben de donar-te este programa per a executar:*

```java
public class Misteri {
    public static void main(String[] args) {
        int nota = 6;

        if (nota >= 5) {
            System.out.println("Aprovat");
        } else if (nota >= 7) {
            System.out.println("Notable");
        } else {
            System.out.println("Suspés");
        }
    }
}
```

**Què imprimixes per pantalla? Tria saviament:**

1. **`Notable`** → La nota 6 és més gran que 5, i quasi també que 7, així que Java tria la millor. ❌
2. **`Aprovat`** → ✅ Correcte! Java avalua de dalt a baix i es queda amb la **primera** condició que done `true`. Com que `nota >= 5` es complix, entra ací i s'oblida de la resta, encara que 6 no arribe a 7.
3. **`Suspés`** → L'`else` només s'executa si cap condició anterior es complix, i ací sí que es complix la primera. ❌

> <details>
> <summary>🔄 Solució</summary>
>
> L'opció **2**. L'ordre de les condicions mana: guanya el primer `if` que siga `true`. Si vols que un 6 siga "Notable", hauries de reordenar de la condició més exigent (7) a la més permissiva (5).
>
> </details>

---

## 🔥 Fireside Chat: if-else vs switch

> *Dos veterans del control de flux discuteixen al costat de la màquina de cafè.*

**if-else:** — Jo soc el clàssic. Condicions, rangs, comparacions... necessites decidir si alguna cosa és més gran que 5 o està entre 10 i 20? Crida'm a mi. Jo compare el que siga.

**switch:** — Clar, i t'omplires d'`else if` fins que el codi sembla l'escala d'un edifici. Amb mi poses la variable una vegada i cada cas en la seua línia. Net, directe, elegant.

**if-else:** — Elegant fins que t'oblides un `break` i el teu switch es convertix en un tobogan. Saps què és el fall-through? Una malson amb nom.

**switch:** — El fall-through s'usa a propòsit quan vull agrupar casos. I tu? Amb trenta `else if`, saps almenys quin va abans que quin?

**if-else:** — Jo suporte rangs! `>= 18`, `< 65`... Tu només servixes per a valors exactes. Un dia has de decidir per edat i aniràs a plorar.

**switch:** — Millor plorar que repetir una variable vint vegades. Cada un al seu terreny, no?

**if-else:** — Fet. Tu, valors exactes. Jo, rangs i condicions combinades. Així ningú no es fa mal.

> La lliçó: no hi ha guanyador. **`switch` per a valors concrets** (dia, menú, talla) i **`if`/`else if` per a rangs i mescles**. Triar bé és la mitat de l'examen.

---

## 🕵️ Qui Soc?

Endevina quin concepte de la unitat soc:

1. **Soc el semàfor: si la meua condició és `true`, deixe passar; si és `false`, redirigix a l'altre carril.**
2. **Soc el menú del restaurant: mires la meua variable i executes el `case` que coincidisca.**
3. **Soc la cinta de córrer que comprova abans de córrer: si la condició és `false` d'entrada, no faig ni un pas.**
4. **Soc el botó de parada: talle el bucle sencer tan bon punt aparec.**
5. **Soc l'avi de tots els errors: tot el que es llança hereta de mi.**
6. **Soc l'airbag: atrapar l'error perquè el programa no muera.**

<details>
<summary>🔄 Respostes</summary>

1. **L'`if`/`else`** — decidix entre dos camins segons una condició booleana.
2. **El `switch`** — tria entre diversos `case` segons el valor d'una variable.
3. **El `while`** — comprova abans d'executar (el `do-while` és el que corre primer).
4. **El `break`** — acaba el bucle (i també el `switch`).
5. **`Throwable`** — la classe arrel d'`Error` i `Exception`.
6. **El `catch`** — atrapar l'excepció perquè el programa sobrevisca.

</details>

---

## 🤬 CONRAD VS EL MÓN: "El bucle que no s'acaba"

> *CONRAD, el nostre compilador cascarrabutxes, opina sobre el clàssic del novell.*

**CONRAD:** — UNA ALTRA VEGADA! Ve un alumne i em diu: *CONRAD, el meu programa es queda penjat*. I jo: val, què té el bucle? *Pues no ho sé, no l'he mirat.* AI, MARE MEUA! Un `while` sense res que canvie la condició dins és un cotxe sense frens, t'ho explique amb plastilina?

*I després està el que escriu* `while (x > 0) { x = x + 1; }` *quan volia restar. Puja en comptes de baixar. No és un bucle infinit, és un bucle que ascendix fins a l'infinit. Com si volgueres buidar una piscina tirant-hi més aigua.*

*I el colmo:* `if (x = 5)`. Amb UN igual. Això no és una condició, és una assignació! T'ho dic des de la U02 i ho continuec veient. El doble igual `==` es queda a casa quan toca comparar.

**La lliçó:** abans d'acusar l'ordinador de "congelar-se", mira el bucle: alguna cosa modifica la condició cap a `false`? El `continue` es salta l'actualització? Uses `==` o t'has quedat en `=`? El 90% dels programes "penjats" s'arreglen amb un cop d'ull a estes tres preguntes.

---

## 🎮 El Joc de les Decisions

Tria la resposta correcta per a cada decisió (respostes al final):

1. Què imprimix `int n = 4; String r = n >= 5 ? "A" : "B";`?
   - a) `A`   b) `B`
2. Quantes voltes fa `for (int i = 0; i < 3; i++)`?
   - a) 3   b) 4
3. Què imprimix un `switch` amb `case 1` i `case 2` seguits sense `break` entre ells, si la variable val 1?
   - a) Només el `case 1`   b) El `case 1` i després el `case 2`
4. Quin és el resultat de `10 / 0`?
   - a) `ArithmeticException`   b) Un nombre enorme

<details>
<summary>🔄 Solucions</summary>

1. **b)** — 4 no és més gran o igual que 5, així que el ternari retorna `"B"`.
2. **a)** — `i` val 0, 1 i 2: tres voltes. Amb `< 3` mai no entra amb `i = 3`.
3. **b)** — Sense `break`, el `case 1` es desborda al `case 2` (fall-through).
4. **a)** — Dividir entre zero llança `ArithmeticException` en temps d'execució.

</details>

---

## ⚡ Laboratori de Tortura: la màquina que plora

> **Durada estimada:** 30 minuts
> **Eina:** el teu IDE i un fitxer nou

**L'escenari:** copia este programa i fes que funcione. Té **3 errors** que impedixen que compile i 1 error de lògica que fa que el resultat siga incorrecte quan el arregles.

```java
public class Tortura
    public static void main(string[] args) {
        int suma = 0;
        for (int i = 1; i <= 10; i++) {
            if (i % 2 == 0) continue;
            suma = suma - i;
        }
        System.out.println("La suma dels senars és: " + suma)
        System.out.println("El nombre de senars és: " + 5);
    }
}
```

**Fallada intencionada:** un dels errors sembla correcte a simple vista perquè "es veu bé", però fa que el programa compte malament.

**La teua tasca:** aconseguir que compile, que execute i que **tota** l'eixida siga correcta. Si el resultat no quadra, diagnostica.

**Pistes per quan et frustres (no abans):**

1. Hi ha algun `;` que falte? *no → seguix buscant.*
   <details><summary>I si encara estic atascat?</summary>Comprova també les claus `{}`: la classe necessita la seua obertura.</details>
2. Compila ja? *no → mira el missatge d'error i les majúscules.*
   <details><summary>I si encara estic atascat?</summary>Són dos coses: `string` ha de ser `String` (la classe amb majúscula) i falta el `;` al final de la primera línia del `println`.</details>
3. Executa però la suma ix rara? *És l'error de lògica: el signe.*
   <details><summary>Solució final</summary>

Els **3 errors de compilació**:

1. Falta la `{` que obri el cos de la classe després de `Tortura`.
2. `string[] args` → `String[] args` (la classe `String` amb majúscula).
3. Falta el `;` al final de `System.out.println("La suma dels senars és: " + suma)`.

L'**error de lògica**: `suma = suma - i;` resta en lloc de sumar. Compila perfectament, però amb els senars 1, 3, 5, 7 i 9 la suma ix **-25** en lloc de 25. Un signe és l'únic que separa el teu programa de la veritat.

```java
public class Tortura {
    public static void main(String[] args) {
        int suma = 0;
        for (int i = 1; i <= 10; i++) {
            if (i % 2 == 0) continue;
            suma = suma + i;
        }
        System.out.println("La suma dels senars és: " + suma);
        System.out.println("El nombre de senars és: " + 5);
    }
}
```

Eixida correcta: `La suma dels senars és: 25` i `El nombre de senars és: 5` (els senars de l'1 al 10 són 1, 3, 5, 7 i 9: cinc). Amb la versió trencada, la suma eixia `-25`, i això era la pista del signe.

</details>

---

## 🏆 Assoliments d'esta unitat

| Assoliment | Com aconseguir-lo |
|---|---|
| 🏅 **El Semàfor Humà** | Explicar `if`/`else if`/`else` i l'ordre de les condicions sense mirar |
| 🏅 **Break o Continua** | Distingir `break` i `continue` en un exercici "Què imprimeix?" sense fallar |
| 🏅 **El Caçador d'Errors** | Trobar els errors del Laboratori sense usar les pistes |
| 🏅 **A prova de bombes** | Fer un menú amb `do-while` + `try`/`catch` que no explote amb porqueria |
| 🏅 **L'Inventor** | Crear una excepció pròpia i llançar-la amb `throw` en un programa teu |

---

## 🧠 Atreveix-te a Pensar

1. **Sense executar:** què imprimix este programa?

```java
public class Misteri2 {
    public static void main(String[] args) {
        for (int i = 1; i <= 6; i++) {
            if (i % 2 != 0) continue;
            System.out.println(i);
        }
    }
}
```

2. **El nombre invisible:** amb el `while` del punt 3, com faries per a contar quants dígits té un nombre sense usar `String`?
3. **El detectiu:** el teu programa llança `InputMismatchException` en la línia del `nextInt()`. Quina eina uses i què mires primer en el stack trace?
4. **Vertader o fals:** "un `catch (Exception e)` atrapar també les `RuntimeException`".

<details>
<summary>💡 Solucions</summary>

1. Imprimix `2`, `4`, `6`: el `continue` salta els senars i només s'imprimixen els parells de l'1 al 6.
2. Repetint `while (numero > 0) { numero /= 10; comptador++; }`: cada divisió entre 10 li lleva un dígit al nombre fins que arriba a 0. Amb `123` → 3 dígits.
3. El **depurador**: posa un breakpoint en el `nextInt()` i mira el valor que està arribant pel buffer. O, més ràpid, llig el stack trace: la línia `at ...` et diu exactament on es va llançar.
4. **Vertader.** `RuntimeException` hereta d'`Exception`, així que un `catch (Exception e)` les atrapar totes.

</details>

---

## 🧩 Crucigrama de Bits

```
Horitzontal:
1. Estructura que tria entre diversos case (6 lletres)
3. Acaba el bucle sencer (5 lletres)
5. La classe arrel de tots els errors (9 lletres)
6. Repetix "mentres" (5 lletres)

Vertical:
2. Es salta només la volta actual (8 lletres)
4. El bloc que s'executa sempre en un try (7 lletres)
```

<details>
<summary>📝 Solucions</summary>

**Horitzontal:** 1. SWITCH · 3. BREAK · 5. THROWABLE · 6. WHILE
**Vertical:** 2. CONTINUE · 4. FINALLY

</details>

---

## 💬 Preguntes d'Entrevista de Treball

> Preguntes reals que et farien per a programador Java júnior.

1. **"Explica'm, com si jo fóra la teua àvia, la diferència entre `if` i `switch`."**
2. **"Quina és la diferència entre `break` i `continue` en un bucle?"**
3. **"Un usuari escriu text on el teu programa espera un nombre i l'aplicació es cau. Com ho arreglaries?"**
4. **"Què és una `NullPointerException` i com l'evites?"**
5. **"Per a què servix el bloc `finally`?"**
6. **"Quan crearíes una excepció pròpia en comptes d'usar les de Java?"**

---

## 🤷 No hi ha preguntes tontes

> ❓ **Puc usar `switch` amb un `double`?**

No. `switch` admet `int` i enters afins, `char`, `enum` i `String` (des de Java 7). Amb `double` usa `if`/`else if`, perquè els decimals quasi mai no es comparen amb igualtat exacta.

---

> ❓ **Per què a vegades veig `while (true)` si és un bucle infinit?**

Perquè es trenca des de dins amb `break`: `while (true) { if (condicio) break; ... }`. És la forma d'escriure "bucle per sempre fins que passe alguna cosa". Ho veuràs molt en jocs i servidors.

---

> ❓ **El `catch` pot capturar qualsevol excepció?**

Si poses `catch (Exception e)`, captures totes les `Exception` i les seues filles (incloses les `RuntimeException`). Si vols capturar-ho absolutament tot, existix `catch (Throwable e)`, però això és com pescar amb dinamita: també atrapa errors greus de la JVM que no hauries de tocar.

---

## 🎬 Post-Crèdits

El programador acaba el seu menú blindat: `do-while` per a demanar opció, `try`/`catch` per a sobreviure a les lletres de l'usuari, `switch` per a les opcions... i una excepció pròpia que va llançar amb `throw` quan l'usuari va intentar retirar més saldo del que tenia.

S'acosta CONRAD, el compilador cascarrabutxes, amb la seua tassa humejant.

**CONRAD:** — Això era un programa teu o una central nuclear? Quin blindatge. `try`, `catch`, `switch`, bucles... Fins i tot una excepció que t'has inventat. No està malament per a un aprenent de semàfor.

**Novell:** — I ara què? Els meus programes decidixen, repetixen i sobreviuen.

**CONRAD:** — *fa un glop* Decidir i repetir està bé, però per a resoldre problemes de veritat falta una cosa: pensar en gran. Dividir el problema, dissenyar la solució... Això és una altra història. La pròxima parada t'ho conta.

El novell guarda el seu projecte, tanca l'IDE i sent que els programes ja no li tenen por a res.

**PRÒXIMAMENT EN U05:** Algorítmica I: Fonaments. El moment en què els teus programes no només pensen, sinó que **pensen amb mètode**. 🧩

---

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/03-estructuras-control-excepciones) · **Anterior:** [08 · throw i excepcions pròpies](/ApuntesProgramacion/va/03-estructuras-control-excepciones/08-throw-excepciones-propias) · **Següent:** **[U04 · Arrays](/ApuntesProgramacion/va/04-arrays)**
