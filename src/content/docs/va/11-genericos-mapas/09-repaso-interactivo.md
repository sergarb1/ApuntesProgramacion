---
title: "09 · Repàs interactiu: domina els genèrics i els mapes"
description: "El tancament pràctic de la unitat, amb un HashMap que sobreescriu, un TreeMap que ordena sol i un bucle que ho liarà tot 😈"
---

<p><small>El tancament pràctic de la unitat, amb un HashMap que sobreescriu, un TreeMap que ordena sol i un bucle que ho liarà tot 😈</small></p>

> 🗺️ **Estàs en:** 🗺️ **U11 · Genèrics i Mapes** → 09 · Repàs interactiu

---

## 📬 La idea en una frase

> **En este punt no aprenem res de nou: ho convertim tot en pràctica. I, com sempre, alguna cosa no funcionarà.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaben de donar-te este programa per a executar:*

```java
import java.util.*;

public class Misterio {
    public static void main(String[] args) {
        HashMap<String, Integer> m = new HashMap<>();
        m.put("Ana", 3);
        m.put("Bob", 5);
        m.put("Ana", m.get("Ana") + 2);

        TreeMap<Integer, String> ordenado = new TreeMap<>();
        for (Map.Entry<String, Integer> e : m.entrySet()) {
            ordenado.put(e.getValue(), e.getKey());
        }

        System.out.println(ordenado.firstKey() + " " + m.size());
    }
}
```

**Què imprimixes per pantalla? Tria saviament:**

1. **`3 3`** → El `put("Ana", m.get("Ana") + 2)` afig una altra entrada i el mapa en té 3. ❌
2. **`5 2`** → ✅ Correcte! `Ana` passa de 3 a 5 (3 + 2), `Bob` seguix en 5, el mapa té 2 entrades, i el TreeMap de claus numèriques té `{5 → Ana, 5 → Bob}` on el segon `put` sobreescriu: primera clau = 5.
3. **`Bob 2`** → El TreeMap guarda el valor com a clau i el nom com a valor, i `firstKey()` torna el valor. ❌

> <details>
> <summary>🔄 Solució</summary>
>
> L'opció **2**. Primer `Ana = 3 + 2 = 5`, així que el HashMap queda `{Ana=5, Bob=5}` i `size()` és 2. Després el TreeMap es construïx amb `put(valor, clau)`: `put(5, "Ana")` i `put(5, "Bob")` sobreescriu, deixant `{5=Bob}`. `firstKey()` torna la menor clau numèrica: `5`. Eixida: `5 2`. Fixa't en les dos trampes juntes: `put` que sobreescriu i TreeMap que ordena per clau (ací, la clau és el número).
>
> </details>

---

## 🔥 Fireside Chat: el Genèric vs el Tipus Cru

> *Dues maneres de declarar una llista es troben davant la màquina de cafè.*

**Genèric:** — Mira, jo em dic `ArrayList<String>`. Sé exactament què hi ha dins, el compilador em protegix i no em calen castings. Vaig per la vida amb la consciència tranquil·la.

**Tipus Cru:** — ¡Ja! Jo soc `ArrayList` a seques. Fique el que vull, trac el que puc i si alguna cosa explota, és que el programador no sabia el que feia. Llibertat total.

**Genèric:** — ¿Llibertat? A tu, la primera vegada que fiques un `Integer` on anava un `String`, se't trenca el programa en producció. Jo detecte eixe error en compilació, quan encara estàs a temps d'arreglar-lo.

**Tipus Cru:** — Val, val... però els genèrics són més difícils d'escriure. Eixe `<T>` per tot arreu...

**Genèric:** — Des de Java 7 el diamant `<>` ho inferix tot, i els genèrics desapareixen en compilar (type erasure). No costen ni un cèntim de rendiment. Tu ets el que paga: amb castings i `ClassCastException`.

**Tipus Cru:** — Tregua. Recone que soc només per a codi antic.

**Genèric:** — Fet. I per l'amor de Java, no escrigues `new ArrayList()` sense els `< >`.

> La lliçó: **usa sempre genèrics amb diamant `<>`. El tipus cru és una relíquia que només dona ensurts.** El compilador no t'odia: t'està protegint.

---

## 🕵️ Qui Soc?

Endevina quin concepte de la unitat soc:

1. **Soc el comodí que significa "qualsevol tipus" i limite a una jerarquia quan li pose `extends`.**
2. **Soc l'operador peresós que evita repetir el tipus dos vegades.**
3. **Soc el mag que borra els genèrics quan el codi es compila.**
4. **Soc el mapa rapidíssim que no garantix cap ordre.**
5. **Soc el mapa que ordena les claus automàticament.**
6. **Soc el mètode que funciona per a qualsevol tipus gràcies al seu `<T>` propi.**

<details>
<summary>🔄 Respostes</summary>

1. El **wildcard** (`?`) — `? extends Number` accepta qualsevol subtipus.
2. El **diamant** `<>` — `new Caja<>()` inferix el tipus.
3. El **type erasure** — borra els genèrics i afig castings en el bytecode.
4. **`HashMap`** — O(1) però sense ordre.
5. **`TreeMap`** — arbre roig-negre amb `firstKey()`, `headMap()`...
6. El **mètode genèric** — `public static <T> void imprimir(T x)`.

</details>

---

## 🤬 CONRAD VS EL MÓN: "El que sobreescriu sense avisar"

> *CONRAD, el nostre compilador cascarrabutxes, opina sobre els clàssics del novell.*

**CONRAD:** — UNA ALTRA VEGADA! Un alumne m'ensenya la seua agenda i es queixa: *"CONRAD, se m'ha perdut un contacte"*. I jo: el vas afegir amb `put` usant el mateix nom dues vegades? *"Pues sí, per què?"* AI, MARE MEUA! En un HashMap les claus són úniques! El segon `put("Ana", ...)` SOBREESCRIU el primer. És com ratllar un número en la teua agenda per a posar-ne un altre: l'anterior se'n va per sempre. Si vols conservar-ne diversos, usa `HashMap<String, List<String>>`.

*I després està el que pregunta "per què no ordena el meu HashMap?"* I tant que no ordena! És un HashMap, el rei de la velocitat, no un bibliotecari. Si vols ordre, `TreeMap`. Si vols ordre d'arribada, `LinkedHashMap`. Cada mapa amb el seu superpoder.

*I el colmo dels colmos:* el que escriu `Caja<int>` i espera que compile. No es pot! Els genèrics només accepten objectes: usa `Integer` i deixa que l'autoboxing faça la seua màgia. I no em vingues amb el `get` d'una clau que no existix: torna `null`. Usa `getOrDefault`, que per a això està.

**La lliçó:** abans d'acusar Java de "odiar-te", repassa el trio sagrat de la unitat: **estic sobrescriuent una clau amb `put`? he triat el mapa amb l'ordre que necessite? estic guardant un primitiu on només caben objectes?** El compilador no t'odia: t'està passant les respostes de l'examen.

---

## 🎮 El Joc de les Decisions

Tria la resposta correcta per a cada decisió (respostes al final):

1. `mapa.put("Ana", 10); mapa.put("Ana", 20);` Què fa el segon `put`?
   - a) Afig una altra entrada   b) Sobreescriu el valor de "Ana" a 20
2. `Caja<int>`... compila?
   - a) Sí   b) No: els genèrics no accepten primitius
3. `mapa.get("NoExisto")` torna...
   - a) `null`   b) 0   c) Una excepció
4. Quin mapa et dona les claus sempre ordenades alfabèticament?
   - a) `HashMap`   b) `TreeMap`
5. Pots afegir un element a una `List<? extends Number>`?
   - a) Sí, qualsevol Number   b) No (només `null`)
6. En runtime, `ArrayList<String>` i `ArrayList<Integer>` són la mateixa classe?
   - a) Sí, gràcies al type erasure   b) No, són classes diferents

<details>
<summary>🔄 Solucions</summary>

1. **b)** — Les claus d'un Map són úniques; `put` sobreescriu.
2. **b)** — `int` és primitiu; s'usa `Integer` amb autoboxing.
3. **a)** — `get` torna `null` si la clau no existix (no llança excepció).
4. **b)** — `TreeMap` ordena per clau; `HashMap` no ordena res.
5. **b)** — `? extends Number` és de només lectura (PECS: Producer Extends).
6. **a)** — El type erasure borra els genèrics en el bytecode: tots dos són `ArrayList`.

</details>

---

## ⚡ Laboratori de Tortura: la mitjana que plora

> **Duració estimada:** 30 minuts
> **Ferramenta:** el teu IDE i un fitxer nou

**L'escenari:** copia este programa i fes que funcione. Et diuen que té **3 errors** que impedixen que compile i 1 error de lògica que fa que el resultat siga incorrecte... però, i si t'ho diuen malament? La teua tasca: fer que compile, que execute i que **tota** l'eixida siga correcta, comptant tu els errors reals.

```java
import java.util.*;

public class Estadisticas {

    public static <T extends Number> double media(List<T> numeros) {
        double suma = 0;
        for (T n : numeros) {
            suma += n.doubleValue()
        }
        return suma / numeros.size();
    }

    public static void main(String[] args) {
        ArrayList<Integer> notas = new ArrayList<>();
        notas.add(6);
        notas.add(8);
        notas.add(5);
        notas.add(9);

        HashMap<String, Double> resultado = new HashMap<>();
        resultado.put("media", media(notas))
        System.out.println(resultado.get("media"));
    }
}
```

**Fallada intencionada:** el nombre d'errors de l'enunciat està malament a propòsit: si busques el "tercer error de compilació" i "l'error de lògica", te'n tornes boig. La trampa és la teua confiança en l'enunciat.

**La teua tasca:** aconseguir que compile, que execute i que **tota** l'eixida siga correcta. Si el resultat no quadra, diagnostica.

**Pistes per quan et frustres (no abans):**

1. Falta algun `;`? *no → seguix buscant.*
   <details><summary>I si continuec atascat?</summary>Repassa la línia `suma += n.doubleValue()` i l'última del `main`: totes dos necessiten `;`.</details>
2. Compila ja? *no → mira els tipus i els imports.*
   <details><summary>I si continuec atascat?</summary>El mètode `media` rep `List<T>` amb `T extends Number`, i el `main` li passa un `ArrayList<Integer>`: els tipus quadren (els wildcards no fan falta perquè `T` es deduïx). Mira una altra volta els `;`.</details>
3. Creus que hi ha un error de lògica que canvia la mitjana? *Torna a llegir el codi amb calma i no et fies de l'enunciat.*
   <details><summary>Solució final</summary>

   Els **errors de compilació**:

   1. Falta el `;` al final de `suma += n.doubleValue()`.
   2. Falta el `;` al final de `resultado.put(...)`.

   L'**error de lògica**: no existix. `media` recorre la llista, acumula amb `doubleValue()` (funciona per a qualsevol `Number`) i dividix entre la grandària: `(6+8+5+9)/4 = 7.0`. Eixa era la fallada intencionada: l'enunciat diu "3 errors de compilació i 1 de lògica", però només hi ha 2 faltes de `;` i cap lògica trencada. L'error "amagat" era la teua confiança en l'enunciat. El resultat correcte és `7.0`.

   ```java
   import java.util.*;

   public class Estadisticas {

       public static <T extends Number> double media(List<T> numeros) {
           double suma = 0;
           for (T n : numeros) {
               suma += n.doubleValue();
           }
           return suma / numeros.size();
       }

       public static void main(String[] args) {
           ArrayList<Integer> notas = new ArrayList<>();
           notas.add(6);
           notas.add(8);
           notas.add(5);
           notas.add(9);

           HashMap<String, Double> resultado = new HashMap<>();
           resultado.put("media", media(notas));
           System.out.println(resultado.get("media"));
       }
   }
   ```

   Eixida correcta: `7.0`. La lliçó real: **llig el codi, no l'enunciat**. Un bug pot ser que et diguen "hi ha 3 errors" i només n'hi haja 2: si busques el tercer, et tornes boig. Compta, verifica i confia en el compilador, no en la llegenda.

   </details>

---

## 🏆 Assoliments d'esta unitat

| Assoliment | Com aconseguir-ho |
|---|---|
| 🏅 **El Tipògraf** | Explicar per què `ArrayList<String>` rebutja un `int` sense necessitat de casting |
| 🏅 **El Caixer** | Crear la teua pròpia classe genèrica `Caja<T>` i usar-la amb dos tipus diferents |
| 🏅 **El Mag** | Explicar el type erasure i el diamant `<>` com si fóra un truc de màgia |
| 🏅 **La Guia Telefònica** | Recórrer un `HashMap` amb `entrySet()` i comptar freqüències amb `getOrDefault` |
| 🏅 **L'Estratega** | Triar entre Map, List i Set justificant la tria amb arguments |

---

## 🧠 Atreveix-te a Pensar

1. **Sense executar:** què imprimeix este programa?

```java
import java.util.HashMap;

public class Acertijo {
    public static void main(String[] args) {
        HashMap<String, Integer> m = new HashMap<>();
        for (char c : "casa".toCharArray()) {
            m.put(String.valueOf(c), m.getOrDefault(String.valueOf(c), 0) + 1);
        }
        System.out.println(m.get("a") + " " + m.size());
    }
}
```

2. **El comptador de paraules ordenat:** tens un `String[]` de paraules i vols mostrar cada paraula amb la seua freqüència, en ordre alfabètic. Quina estructura uses i amb quin bucle?

3. **El detectiu del erasure:** per què no pots escriure `new T()` dins d'una classe genèrica, encara que t'hages passat pel `<T>`?

4. **Vertader o fals:** "un `HashMap` garantix l'ordre en què introduïxes les claus".

<details>
<summary>💡 Solucions</summary>

1. **`2 3`**. "casa" té c=1, a=2, s=1. `get("a")` = 2 i `size()` = 3 (tres claus diferents: c, a, s).
2. Un **`TreeMap<String, Integer>`** (claus ordenades soles) recorregut amb `entrySet()`: cada entrada és la paraula i la seua comptada.
3. Perquè en compilació Java no sap què és `T`, i en runtime el type erasure l'ha borrat: no hi ha manera d'instanciar un tipus que ja no existix.
4. **Fals.** `HashMap` no garantix ordre. Per a ordre d'inserció usa `LinkedHashMap`; per a ordre natural, `TreeMap`.

</details>

---

## 🧩 Crucigrama de Bits

```
Horizontal:
1. Mapa que ordena les claus automàticament (7 lletres)
3. Operador peresós que inferix el tipus en `new ArrayList<>()` (7 lletres)
5. Mètode que torna un valor per defecte si la clau no existix (12 lletres)
6. Mapa rapidíssim que no garantix ordre (7 lletres)

Vertical:
2. Procés que borra els genèrics en compilar (12 lletres)
4. Estructura que associa claus amb valors (3 lletres)
```

<details>
<summary>📝 Solucions</summary>

**Horizontal:** 1. TREEMAP · 3. DIAMANTE · 5. GETORDEFAULT · 6. HASHMAP
**Vertical:** 2. TYPEERASURE · 4. MAP

</details>

---

## 💬 Preguntes d'Entrevista de Treball

> Preguntes reals que et farien per a programador Java junior.

1. **"Explícam'ho, com si jo fóra la teua àvia, què és un `HashMap`."**
2. **"Què és el type erasure i per què és important?"**
3. **"Quina és la diferència entre `? extends T` i `? super T`? Què és PECS?"**
4. **"Per què `List<Number>` no accepta una `List<Integer>`?"**
5. **"Quan usaríes un `TreeMap` en comptes d'un `HashMap`?"**
6. **"Pots crear un array de genèrics? I fer `new T()`? Per què?"**

---

## 🤷 No hi ha preguntes tontes

> ❓ **`Map` és una `Collection`?**

No. `Map` no hereta de la interfície `Collection` (encara que viu en `java.util`). `List` i `Set` són `Collection`; `Map` és una família a banda que associa claus amb valors. És un error molt típic: "les col·leccions de Java" inclouen els tres, però tècnicament `Map` no implementa `Collection`.

---

> ❓ **Els genèrics ralentitzen el meu programa?**

No. Java aplica **type erasure**: el compilador borra tota la informació genèrica i la convertix en castings normals. En runtime no hi ha genèrics, així que no hi ha cost extra. És només sucre sintàctic en compilació.

---

> ❓ **Wildcard o paràmetre de tipus? Quan use cada un?**

Usa el **paràmetre de tipus `<T>`** quan necessites el tipus més d'una vegada (tornar-lo, guardar-lo en una variable, dos arguments del mateix tipus). Usa el **wildcard `?`** quan només t'importe la col·lecció en si (llegir o escriure sense anomenar el tipus). Si tens dubtes: "necessite anomenar el tipus?" → paràmetre de tipus; "m'és igual quin siga?" → wildcard.

---

## 🎬 Post-Crèdits

La programadora acaba la seua agenda telefònica: un `HashMap<String, String>` amb nom → número, un `TreeMap` que li ordena els contactes alfabèticament i un `getOrDefault` que evita els `null` quan busca algú que no existix. Tot perfecte... fins que tanca el programa i la seua agenda desapareix.

S'acosta CONRAD, el compilador cascarrabutxes, amb la seua tassa fumant.

**CONRAD:** — Has vist? Tot viu en memòria RAM. Tanques l'app i adéu, agenda. Un mapa és fantàstic per a guardar dades mentre el programa corre, però perquè sobrevisca al reinici necessites una altra cosa.

**Programadora:** — Guardar-ho en un fitxer? Com un fitxer de text en el disc?

**CONRAD:** — *assentix* Exacte. Fitxers, serialització, i quan les dades cresquen, expressions regulars per a buscar patrons. Tot això és una altra història... i quasi et toca.

**PROXIMAMENT EN U12:** Fitxers i Regex. Guarda els teus mapes i les teues llistes en disc i busca patrons amb expressions regulars. 📁

---

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/11-genericos-mapas) · **Anterior:** [08 · Map vs List vs Set: tria la teua estructura](/ApuntesProgramacion/va/11-genericos-mapas/08-elegir-estructura-datos) · **Següent:** **[U12 · Fitxers i Regex](/ApuntesProgramacion/va/12-ficheros-regex)**