---
title: "09 · Repàs interactiu: domina la programació funcional"
description: "El tancament pràctic de la unitat, amb un pipeline que sembla màgia i un Optional que amaga un ensurt 🎯"
---

<p><small>El tancament pràctic de la unitat, amb un pipeline que sembla màgia i un Optional que amaga un ensurt 🎯</small></p>

> 🗺️ **Estàs en:** 🗺️ **U12 · Programació Funcional** → 09 · Repàs interactiu

---

## 📬 La idea en una frase

> **En este punt no aprenem res de nou: ho convertim tot en pràctica. I, com sempre, alguna cosa no funcionarà.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaben de donar-te este programa per a executar:*

```java
import java.util.*;
import java.util.stream.*;

public class Misterio {
    public static void main(String[] args) {
        List<String> nombres = List.of("ana", "bob", "carla", "david", "eva");

        long r = nombres.stream()
            .filter(n -> n.length() > 3)
            .map(String::toUpperCase)
            .count();

        System.out.println(r);
    }
}
```

**Què imprimixes per pantalla? Tria saviament:**

1. **`5`** → El `filter` no filtra res i el `map` convertix tots. ❌
2. **`3`** → `filter` deixa passar a `carla`, `david` i `eva`... no? ❌
3. **`2`** → ✅ Correcte de veritat: de `ana, bob, carla, david, eva` passen el filtre `carla` i `david` (les úniques amb més de 3 lletres). `map(String::toUpperCase)` les posa en majúscules, però no canvia la comptada. `count()` torna **2**.

> <details>
> <summary>🔄 Solució</summary>
>
> L'opció **3**: **`2`**. Les longituds són `ana`=3, `bob`=3, `carla`=5, `david`=5, `eva`=3. El `filter(n -> n.length() > 3)` deixa passar només `carla` i `david`. El `map` les convertix en `CARLA` i `DAVID`, però `count()` compta elements: no mira els valors transformats. La trampa està en `eva`: 3 lletres no superen a 3, i el `map` no canvia el nombre d'elements, només la seua forma.
>
> </details>

---

## 🔥 Fireside Chat: el Bucle For vs el Stream

> *Dues maneres de recórrer una llista es troben davant la màquina de cafè.*

**Bucle For:** — Mira, jo soc el clàssic. `for (String s : lista) { ... }`. Vaig element a element, decidisc jo el ritme, puc parar quan vull. El control total.

**Stream:** — ¡Ja! Tu controles el *com*. Jo només necessite que em digues el *què*: `lista.stream().filter(...).map(...).toList()`. Declares la recepta i jo cuine.

**Bucle For:** — I quan necessites modificar la llista mentre la recorres? Jo et deixe, amb compte. Tu ni ho intentes.

**Stream:** — Per a això existixen les col·leccions d'eixida. I quan t'oblides del `break` i et recorres mil elements de més, no em vingues plorant. A més, jo puc dir `limit(3)` i em pare sol. Saps què és peresa productiva?

**Bucle For:** — Val, val... però els meus primitius i els meus índexs continuen sent útils per a coses simples.

**Stream:** — Ningú diu que no. Jo brille quan el pipeline es torna complex: filtrar, transformar, ordenar i agrupar en tres línies en comptes de tres bucles aniuats. Tu per a allò simple, jo per a allò declaratiu. Tregua.

**Bucle For:** — Tregua. Al final, els dos recorrem.

> La lliçó: **usa el bucle quan el control importe i el stream quan vulgues declarar el resultat.** No és una guerra: és saber quan usar cada ferramenta. El stream no t'odia: t'està llevat treball.

---

## 🕵️ Qui Soc?

Endevina quin concepte de la unitat soc:

1. **Soc la fletxa que convertix un bloc de codi en un valor que viatja sol.**
2. **Soc la interfície funcional que respon `true` o `false` a una pregunta.**
3. **Soc l'operador que et deixa reciclar un mètode com si fóra una lambda.**
4. **Soc el flux peresós que no fa res fins que obris l'aixeta.**
5. **Soc l'aixeta final: sense mi, el stream no flueix.**
6. **Soc la capsa que accepta l'absència.**

<details>
<summary>🔄 Respostes</summary>

1. La **lambda** (`->`) — `(x) -> x * 2`.
2. **`Predicate<T>`** — `boolean test(T)`.
3. La **referència a mètode** (`::`) — `String::toUpperCase`.
4. El **`Stream`** — peresós i d'un sol ús.
5. L'**operació terminal** — `collect`, `reduce`, `count`, `forEach`.
6. **`Optional`** — la capsa que embolica un valor o la seua absència.

</details>

---

## 🤬 CONRAD VS EL MÓN: "El que oblida l'aixeta"

> *CONRAD, el nostre compilador cascarrabutxes, opina sobre els clàssics del novell.*

**CONRAD:** — UNA ALTRA VEGADA! Un alumne m'ensenya el seu programa i es queixa: *"CONRAD, no em imprimeix res"*. I jo: has posat una operació terminal? *"Una què?"* AI, MARE MEUA! `lista.stream().filter(...).map(...)` sense terminal no fa RES! El stream és peresós, com la meua paciència. Pos-li un `collect`, un `count` o un `forEach`, o la cinta es queda parada per sempre.

*I després està el que intenta recórrer el mateix stream dos vegades.* "Per què em dona error al segon `count()`?" I tant! Perquè la cinta ja es va buidar! Un stream es consumeix amb la primera terminal. Si vols comptar dos coses, crea dos streams. És com voler menjar la mateixa pizza dues vegades: impossible, ja està al teu estómac.

*I el colmo dels colmos:* el que fa `Optional.of(objetoQuePuedeSerNull)` i s'estranya de la `NullPointerException`. `of` és per a allò segur! Si pot vindre `null`, `ofNullable`. I no em vingues amb `get()` a cegues sobre una capsa que pot estar buida: això és `NoSuchElementException` assegurada. `orElse`, `ifPresent`, `orElseThrow`... la capsa té porta, usa-la.

**La lliçó:** abans d'acusar Java de "odiar-te", repassa el trio sagrat de la unitat: **hi ha una operació terminal? estic reutilitzant un stream ja consumit? estic obrint un `Optional` buit sense xarxa?** El compilador no t'odia: t'està passant les respostes de l'examen.

---

## 🎮 El Joc de les Decisions

Tria la resposta correcta per a cada decisió (respostes al final):

1. `nombres.stream().map(String::length)` sense operació terminal... s'executa el `map`?
   - a) Sí, a l'acte   b) No, fins que arribe una terminal
2. Pots fer `lista.add(...)` sobre una llista tornada per `toList()`?
   - a) Sí   b) No: és immutable
3. `Optional<String> o = Optional.empty(); o.get()`... què passa?
   - a) Torna `null`   b) Llança `NoSuchElementException`
4. `reduce(0, Integer::sum)` sobre un `Stream<Integer>`... què torna?
   - a) `int`   b) `Optional<Integer>`
5. `Collectors.groupingBy(Function.identity())` torna un...
   - a) `Map<T, List<T>>`   b) `List<T>`
6. Després de `stream.count()`, pots usar el mateix stream per a una altra cosa?
   - a) Sí   b) No: queda consumit

<details>
<summary>🔄 Solucions</summary>

1. **b)** — El stream és peresós; les intermèdies no s'executen fins a la terminal.
2. **b)** — `toList()` torna una llista immutable. Per a poder modificar-la, `collect(Collectors.toList())`.
3. **b)** — `get()` sobre una capsa buida llança `NoSuchElementException`. Usa `orElse` o `ifPresent`.
4. **a)** — Amb identitat, `reduce` torna el valor directe (`int`). Sense identitat (`reduce((a, b) -> ...)`) tornaria `Optional<Integer>`.
5. **a)** — `groupingBy` torna un `Map` amb les claus agrupades i les seues llistes d'elements.
6. **b)** — Un stream només es recorre una vegada; la primera terminal el consumeix.

</details>

---

## ⚡ Laboratori de Tortura: l'estadística que no arranca

> **Duració estimada:** 30 minuts
> **Ferramenta:** el teu IDE i un fitxer nou

**L'escenari:** copia este programa i fes que funcione. Et diuen que té **3 errors** que impedixen que compile i 1 error de lògica que fa que el resultat siga incorrecte... però, i si t'ho diuen malament? La teua tasca: fer que compile, que execute i que **tota** l'eixida siga correcta, comptant tu els errors reals.

```java
import java.util.*;
import java.util.stream.*;

public class Estadisticas {

    public static void main(String[] args) {
        List<Integer> notas = List.of(7, 8, 3, 9, 5);

        long aprobados = notas.stream()
            .filter(n -> n >= 5)
            .count;                                    // línea A

        List<Integer> dobladas = notas.stream()
            .map(n -> n * 2)
            .toList();                                 // línea B

        int total = dobladas.stream()
            .reduce(0, (a, b) -> a + b);               // línea C

        System.out.println(aprobados + " " + dobladas + " " + total);
    }
}
```

**Fallada intencionada:** el nombre d'errors de l'enunciat està malament a propòsit: si busques el "tercer error de compilació" i "l'error de lògica", te'n tornes boig. La trampa és la teua confiança en l'enunciat.

**La teua tasca:** aconseguir que compile, que execute i que **tota** l'eixida siga correcta. Si el resultat no quadra, diagnostica.

**Pistes per quan et frustres (no abans):**

1. Hi ha algun error de compilació? *sí → busca la línia sospitosa.*
   <details><summary>I si continuec atascat?</summary>Repassa la línia A: `count` sense parèntesis no és una crida a mètode, és una referència. Necessita `count()`.</details>
2. Compila ja? *sí → ara pensa en l'eixida.*
   <details><summary>I si continuec atascat?</summary>`notas` = {7, 8, 3, 9, 5}. El `filter(n -> n >= 5)` deixa passar 7, 8, 9 i 5: quatre aprovats. `map(n -> n * 2)` els dobla i `toList()` els arreplega. `reduce(0, (a, b) -> a + b)` suma la llista doblada. Cap error de lògica a l'aguait.</details>
3. Creus que hi ha un error de lògica que canvia el resultat? *Torna a llegir el codi amb calma i no et fies de l'enunciat.*
   <details><summary>Solució final</summary>

   L'**únic error de compilació**:

   1. Línia A: falta el `()` — `count` sense parèntesis és una referència a mètode, no una crida. Ha de ser `count()`.

   L'**error de lògica**: no existix. `aprobados` = 4 (7, 8, 9, 5 aproven; el 3 es queda fora). `dobladas` = `[14, 16, 6, 18, 10]` (tota la llista es dobla, també el 3). `total` = `14 + 16 + 6 + 18 + 10` = `64`. Eixida: `4 [14, 16, 6, 18, 10] 64`.

   Eixa era la fallada intencionada: l'enunciat diu "3 errors de compilació i 1 de lògica", però només hi ha 1 falta de `()` i cap lògica trencada. L'error "amagat" era la teua confiança en l'enunciat.

   ```java
   import java.util.*;
   import java.util.stream.*;

   public class Estadisticas {

       public static void main(String[] args) {
           List<Integer> notas = List.of(7, 8, 3, 9, 5);

           long aprobados = notas.stream()
               .filter(n -> n >= 5)
               .count();

           List<Integer> dobladas = notas.stream()
               .map(n -> n * 2)
               .toList();

           int total = dobladas.stream()
               .reduce(0, (a, b) -> a + b);

           System.out.println(aprobados + " " + dobladas + " " + total);
       }
   }
   ```

   Eixida correcta: `4 [14, 16, 6, 18, 10] 64`. La lliçó real: **llig el codi, no l'enunciat**. Un bug pot ser que et diguen "hi ha 3 errors" i només n'hi haja 1: si busques els altres dos, et tornes boig. Compta, verifica i confia en el compilador, no en la llegenda.

   </details>

---

## 🏆 Assoliments d'esta unitat

| Assoliment | Com aconseguir-ho |
|---|---|
| 🏅 **L'Arquer** | Explicar la sintaxi `->` de les lambdes amb un exemple d'un paràmetre sense parèntesis |
| 🏅 **El Sastre** | Vestir una lambda amb `Predicate`, `Function`, `Consumer` i `Supplier` sense consultar la xurrera |
| 🏅 **El Reciclador** | Reescriure tres lambdes com a referències a mètode (`::`) |
| 🏅 **El Mestre de la Cinta** | Muntar un pipeline `filter → map → sorted → limit → collect` i predir la seua eixida |
| 🏅 **L'Acceptador** | Gestionar un `Optional` buit amb `orElse` i `ifPresent` sense llançar cap excepció |

---

## 🧠 Atreveix-te a Pensar

1. **Sense executar:** què imprimeix este programa?

```java
import java.util.*;
import java.util.stream.*;

public class Acertijo {
    public static void main(String[] args) {
        List<String> palabras = List.of("sol", "mar", "luna", "sol", "luna", "cielo");
        long distintas = palabras.stream().distinct().count();
        List<String> orden = palabras.stream().distinct().sorted().toList();
        System.out.println(distinctas + " " + orden);
    }
}
```

2. **La mitjana d'aprovats:** tens una `List<Integer>` amb notes. Com calcules, amb streams, la mitjana de les notes que són 5 o més? Què torna `average()` si cap nota aprova?

3. **El detectiu del pipeline:** per què `stream.map(...).filter(...)` sense operació terminal no imprimeix absolutament res?

4. **Vertader o fals:** "un `Stream` es pot recórrer tantes vegades com vulgues".

<details>
<summary>💡 Solucions</summary>

1. **`4 [cielo, luna, mar, sol]`**. `distinct()` deixa `sol, mar, luna, cielo` (4 de diferents). El segon stream ordena les 4 alfabèticament: `cielo, luna, mar, sol`.
2. Amb `notas.stream().filter(n -> n >= 5).mapToInt(n -> n).average()`. `average()` torna un `OptionalDouble`: si no hi ha aprovats, la capsa està buida i aterres amb `orElse(0)`.
3. Perquè el stream és **peresós**: les operacions intermèdies només preparen la cinta. Sense una terminal (`collect`, `count`, `forEach`...), no s'executa res.
4. **Fals.** Un stream és d'un sol ús: la primera operació terminal el consumeix. Per a repetir, crea un altre stream.

</details>

---

## 🧩 Crucigrama de Bits

```
Horizontal:
1. Expressió sense nom que viatja com un valor (6 lletres)
3. Operació terminal que combina tots els elements en un (6 lletres)
5. Classe que embolica un valor o la seua absència (8 lletres)
7. Operació intermèdia que deixa passar només el que complix una condició (6 lletres)

Vertical:
2. Interfície funcional que torna `boolean` (9 lletres)
4. El flux de dades peresós de Java (6 lletres)
6. Operador que transforma cada element (3 lletres)
```

<details>
<summary>📝 Solucions</summary>

**Horizontal:** 1. LAMBDA · 3. REDUCE · 5. OPTIONAL · 7. FILTER
**Vertical:** 2. PREDICATE · 4. STREAM · 6. MAP

</details>

---

## 💬 Preguntes d'Entrevista de Treball

> Preguntes reals que et farien per a programador Java junior.

1. **"Explícam'ho, com si jo fóra la teua àvia, què és una lambda."**
2. **"Què és una interfície funcional i què té a veure amb les lambdes?"**
3. **"Quina és la diferència entre una operació intermèdia i una terminal en un stream?"**
4. **"Per què `Optional` és millor que tornar `null`?"**
5. **"Què fa `groupingBy` i què torna?"**
6. **"Quina és la diferència entre `map` i `reduce`?"**

---

## 🤷 No hi ha preguntes tontes

> ❓ **Una lambda és un objecte?**

Sí. Una lambda és un objecte de la classe anònima que implementa la seua interfície funcional. `Predicate<Integer> p = n -> n % 2 == 0;` crea per darrere un objecte que implementa `Predicate<Integer>`. El compilador fa la màgia; tu només escrius la fletxa.

---

> ❓ **Puc guardar una lambda en una variable?**

Sí, però no en una variable de tipus `int` ni `String`: necessita una variable de tipus **interfície funcional**. `Predicate<Integer> esPar = n -> n % 2 == 0;` és perfectament legal. La lambda viatja com qualsevol altre valor.

---

> ❓ **Un `Stream` guarda dades? I quan es buida?**

No guarda res: és una vista sobre una font (llista, array...). Es buida en arribar una operació terminal. Les dades originals continuen intactes en la seua col·lecció; el que es consumeix és la cinta.

---

> ❓ **Puc usar streams amb arrays, que en la U04 eren una altra cosa?**

Clar: `Arrays.stream(miArray)` convertix un array en flux, i `Arrays.stream(int[])` a més dona un `IntStream` amb mètodes com `sum()` i `average()`. Els arrays i els streams no competixen: es passen el relleu.

---

## 🎬 Post-Crèdits

La programadora acaba el seu analitzador de notes: un pipeline de streams que filtra els aprovats, calcula la mitjana amb `average()` i guarda el resultat en un `Optional` per si un dia no hi ha notes que analitzar. Tot perfecte... fins que tanca el programa i les seues estadístiques desapareixen.

S'acosta CONRAD, el compilador cascarrabutxes, amb la seua tassa fumant.

**CONRAD:** — Has vist? Tot viu en memòria RAM. Tanques l'app i adéu, estadístiques. Un stream és fantàstic per a processar dades mentre el programa corre, però perquè sobrevisquen al reinici necessites una altra cosa.

**Programadora:** — Guardar-les en un fitxer? Com un fitxer de text en el disc?

**CONRAD:** — *assentix* Exacte. Fitxers, i quan les dades cresquen, expressions regulars per a buscar patrons. La teua cinta transportadora processa; el fitxer conserva. Tot això és una altra història... i quasi et toca.

**PROXIMAMENT EN U13:** Fitxers i Regex. Guarda els resultats dels teus streams en disc i busca patrons amb expressions regulars. 📁

---

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/12-programacion-funcional) · **Anterior:** [08 · Optional: el que accepta l'absència](/ApuntesProgramacion/va/12-programacion-funcional/08-optional) · **Següent:** **[U13 · Fitxers i Regex](/ApuntesProgramacion/va/13-ficheros-regex)**