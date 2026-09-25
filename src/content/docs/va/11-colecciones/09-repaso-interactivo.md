---
title: "09 · Repàs interactiu: col·leccions, genèrics i mapes"
description: "El tancament pràctic de la unitat: un remove() que ho liarà tot, un HashMap que sobreescriu i un bucle que explotarà 😈"
---

<p><small>El tancament pràctic de la unitat: un remove() que ho liarà tot, un HashMap que sobreescriu i un bucle que explotarà 😈</small></p>

> 🗺️ **Estàs en:** 📚 **U11 · Col·leccions, genèrics i mapes** → 09 · Repàs interactiu

---

## 📬 La idea en una frase

> **En este punt no aprenem res de nou: ho convertim tot en pràctica. I, com sempre, alguna cosa no funcionarà.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaben de donar-te este programa per a executar:*

```java
import java.util.ArrayList;

public class Misterio {
    public static void main(String[] args) {
        ArrayList<Integer> lista = new ArrayList<>();
        lista.add(1);
        lista.add(2);
        lista.add(3);
        lista.add(4);

        lista.remove(1);
        lista.add(2, 10);

        for (int i = 0; i < lista.size(); i++) {
            System.out.print(lista.get(i) + " ");
        }
    }
}
```

**Què imprimeixes per pantalla? Tria saviament:**

1. **`1 3 4 10`** → El `remove(1)` esborra el 2, i després el `add(2, 10)` fica el 10 al final. ❌
2. **`1 2 3 10`** → El `remove(1)` esborra el 2, i el `add(2, 10)` inserix el 10 a la posició 2. ❌
3. **`1 3 10 4`** → ✅ Correcte! `remove(1)` esborra l'índex 1 (el `2`) → `{1, 3, 4}`. `add(2, 10)` inserix el 10 a l'índex 2, desplaçant el 4 → `{1, 3, 10, 4}`.

> <details>
> <summary>🔄 Solució</summary>
>
> L'opció **3**. `remove(1)` elimina per **índex** (no el valor 1): se'n va el `2`, que ocupava la posició 1. Després `add(2, 10)` inserix el 10 a la posició 2 i empeny el 4 una posició. Els índexs es desplacen, com les fitxes de dòmino.
>
> </details>

---

I ara la versió mapa, amb trampa doble:

```java
import java.util.*;

public class MisterioMapa {
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

**Què imprimeix este segon programa?**

1. **`3 3`** → El `put("Ana", m.get("Ana") + 2)` afegix una altra entrada i el mapa té 3. ❌
2. **`5 2`** → ✅ Correcte! `Ana` passa de 3 a 5 (3 + 2), `Bob` continua en 5, el mapa té 2 entrades, i el TreeMap de claus numèriques té `{5 → Ana, 5 → Bob}` on el segon `put` sobreescriu: primera clau = 5.
3. **`Bob 2`** → El TreeMap guarda el valor com a clau i el nom com a valor, i `firstKey()` torna el valor. ❌

> <details>
> <summary>🔄 Solució</summary>
>
> L'opció **2**. Primer `Ana = 3 + 2 = 5`, així que el HashMap queda `{Ana=5, Bob=5}` i `size()` és 2. Després el TreeMap es construïx amb `put(valor, clau)`: `put(5, "Ana")` i `put(5, "Bob")` sobreescriuen, deixant `{5=Bob}`. `firstKey()` torna la menor clau numèrica: `5`. Eixida: `5 2`. Fixa't en les dues trampes juntes: `put` que sobreescriu i TreeMap que ordena per clau (ací, la clau és el número).
>
> </details>

---

## 🔥 Fireside Chat: ArrayList vs LinkedList

> *Dos cosins de la família List s'enfronten davant la màquina de cafè.*

**ArrayList:** — Mira, jo soc el de tota la vida. Accés directe a qualsevol posició: `get(500)` i ja està. Contigu, ràpid, fiable.

**LinkedList:** — Sí, però tu, per a afegir al principi, desplaces tota la fila. Jo encadene els meus elements com una conga: cadascun sap qui va davant i qui darrere.

**ArrayList:** — I per a recórrer? Jo soc un array per dins, la CPU t'ho agraïx. Tu saltes d'anella en anella.

**LinkedList:** — Cert, però els meus mètodes `addFirst`, `addLast`, `removeFirst` són instantanis. Soc la reina de les cues i les piles. Com simules tu una cua de supermercat?

**ArrayList:** — Val, per a cues i piles eres tu. Per a la resta dels dies, jo. Tregua?

**LinkedList:** — Tregua.

> La lliçó: **accés aleatori i recorreguts freqüents? → ArrayList. Afegir/esborrar als extrems o simular cua/pila? → LinkedList.** Cada problema amb la seua llista.

---

## 🔥 Fireside Chat: el Genèric vs el Tipus Cru

> *Dues maneres de declarar una llista es troben davant de la mateixa màquina de cafè.*

**Genèric:** — Mira, jo me'n dic `ArrayList<String>`. Sé exactament què hi ha dins, el compilador em protegeix i no em fan falta castings. Visc amb la consciència tranquil·la.

**Tipus Cru:** — Ja! Jo soc `ArrayList` a seques. Fique el que vull, trec el que puc i si alguna cosa explota, és que el programador no sabia el que feia. Llibertat total.

**Genèric:** — Llibertat? A tu, la primera volta que fiques un `Integer` on anava un `String`, se't trenca el programa en producció. Jo detecte eixe error en compilació, quan encara estàs a temps d'arreglar-lo.

**Tipus Cru:** — Val, val... però els genèrics són més difícils d'escriure. Eixe `<T>` per tot arreu...

**Genèric:** — Des de Java 7 el diamant `<>` ho infereix tot, i els genèrics desapareixen en compilar (type erasure). No costen ni un cèntim de rendiment. Tu ets el que paga: amb castings i `ClassCastException`.

**Tipus Cru:** — Tregua. Reconec que soc només per a codi antic.

**Genèric:** — Fet. I per l'amor de Java, no escrigues `new ArrayList()` sense els `< >`.

> La lliçó: **usa sempre genèrics amb diamant `<>`. El tipus cru és una relíquia que només dona susts.** El compilador no t'odia: t'està protegint.

---

## 🕵️ Qui Soc?

Endevina quin concepte de la unitat soc:

1. **Soc l'aparcament que creix sol i no pot guardar `int` a pelo.**
2. **Soc el que encadena elements com una conga, perfecte per a cues i piles.**
3. **Soc el porter que no deixa entrar ningú que ja estiga dins.**
4. **Soc el que ordena tot el que fiques automàticament.**
5. **Soc el cambrer que recorre qualsevol col·lecció i permet esborrar sense liar-la.**
6. **Soc la classe estàtica que ordena, remena i troba el màxim de les teues col·leccions.**
7. **Soc el comodí que significa "qualsevol tipus" i limita a una jerarquia quan li pose `extends`.**
8. **Soc l'operador peresós que evita repetir el tipus dos voltes.**
9. **Soc el mag que borra els genèrics quan el codi es compila.**
10. **Soc el mapa rapidíssim que no garanteix cap ordre.**
11. **Soc el mapa que ordena les claus automàticament.**
12. **Soc el mètode que funciona per a qualsevol tipus gràcies al seu `<T>` propi.**

<details>
<summary>🔄 Respostes</summary>

1. **`ArrayList`** — redimensionable; per a números usa `Integer`.
2. **`LinkedList`** — `addLast`, `removeFirst`, la conga de Java.
3. **`HashSet`** — sense duplicats, sense ordre.
4. **`TreeSet`** — ordre natural automàtic (i LinkedHashSet per a l'ordre d'arribada).
5. **`Iterator`** — `hasNext()`, `next()` i el sagrat `remove()`.
6. **`Collections`** — `sort`, `shuffle`, `max`, `min`...
7. El **wildcard** (`?`) — `? extends Number` accepta qualsevol subtipus.
8. El **diamant** `<>` — `new Caja<>()` infereix el tipus.
9. El **type erasure** — borra els genèrics i afegix castings en el bytecode.
10. **`HashMap`** — O(1) però sense ordre.
11. **`TreeMap`** — arbre roig-negre amb `firstKey()`, `headMap()`...
12. El **mètode genèric** — `public static <T> void imprimir(T x)`.

</details>

---

## 🤬 CONRAD VS EL MÓN: "L'aparcament que no aparca"

> *CONRAD, el nostre compilador cascarrabutxes, opina sobre els clàssics del novell.*

**CONRAD:** — UNA ALTRA VEGADA! Ve un alumne i em diu: *CONRAD, el meu programa es cau*. I jo: val, quin error? *Pues una cosa de "ConcurrentModificationException".* AI, MARE MEUA! Estaves esborrant amb `lista.remove(...)` dins d'un `for-each`. El bucle està recorrent la llista mentre tu la canvies per darrere! Usa `iterator.remove()`, que per a això existeix.

*I després està el del `remove` amb números.* Escriu `numeros.remove(1)` creient que esborra el número 1. Però si `1` és un `int`! Ho interpreta com a **índex**. Per a esborrar el número 1 necessites `remove(Integer.valueOf(1))`. Índex o valor: decideix què vols esborrar.

*I el colmo dels colmos:* confon `HashSet` amb `TreeSet`. Es queixa que "el seu HashSet no ordena". I tant que no! Un `HashSet` és un porter, no un organitzador. Si vols ordre, `TreeSet` (ordre natural) o `LinkedHashSet` (ordre d'arribada). I no li fiques `null` a un `TreeSet`, que no sap comparar-lo amb res.

**La lliçó:** abans d'acusar Java de "odiar-te", repassa el trio sagrat de la unitat: **estic esborrant per índex o per valor? estic modificant una col·lecció mentre la recórre? he triat la col·lecció amb l'ordre que necessite?** El 90% dels errors d'esta unitat s'arreglen amb estes tres preguntes. El compilador no t'odia: t'està passant les respostes de l'examen.

---

I quan ja creies que CONRAD estava tranquil, arriba el del mapa:

**CONRAD:** — UNA ALTRA VEGADA! Un alumne m'ensenya la seua agenda i es queixa: *"CONRAD, se m'ha perdut un contacte"*. I jo: l'has afegit amb `put` usant el mateix nom dos voltes? *"Pues sí, ¿por?"* AI, MARE MEUA! En un HashMap les claus són úniques! El segon `put("Ana", ...)` SOBREESCRIU el primer. És com ratllar un número de la teua agenda per a posar-ne un altre: l'anterior se'n va per sempre. Si vols conservar-ne varis, usa `HashMap<String, List<String>>`.

*I després està el que pregunta "per què no ordena el meu HashMap?"* I tant que no ordena! És un HashMap, el rei de la velocitat, no un bibliotecari. Si vols ordre, `TreeMap`. Si vols ordre d'arribada, `LinkedHashMap`. Cada mapa amb el seu superpoder.

*I el colmo dels colmos:* el que escriu `Caja<int>` i espera que compile. No es pot! Els genèrics només accepten objectes: usa `Integer` i deixa que l'autoboxing faça la seua màgia. I no em vingues amb el `get` d'una clau que no existix: torna `null`. Usa `getOrDefault`, que per a això està.

**La lliçó:** repassa el trio sagrat del costat dels mapes: **estic sobreescrient una clau amb `put`? he triat el mapa amb l'ordre que necessite? estic guardant un primitiu on només caben objectes?** El compilador no t'odia: t'està passant les respostes de l'examen.

---

## 🎮 El Joc de les Decisions

Tria la resposta correcta per a cada decisió (respostes al final):

1. `ArrayList<Integer> l = new ArrayList<>(); l.add(7); l.remove(7);` Què esborra el `remove(7)`?
   - a) L'índex 7   b) L'objecte 7
2. Quina col·lecció et dona els elements sempre ordenats i sense duplicats?
   - a) `HashSet`   b) `TreeSet`
3. Què llança esborrar amb `lista.remove()` dins d'un `for-each`?
   - a) `ArrayIndexOutOfBoundsException`   b) `ConcurrentModificationException`
4. Quina col·lecció elimina duplicats mantenint l'ordre d'arribada?
   - a) `LinkedHashSet`   b) `TreeSet`
5. `Collections.sort(lista)`... què fa amb la llista original?
   - a) La modifica   b) Torna una llista nova
6. `mapa.put("Ana", 10); mapa.put("Ana", 20);` Què fa el segon `put`?
   - a) Afegix una altra entrada   b) Sobreescriu el valor de "Ana" a 20
7. `Caja<int>`... compila?
   - a) Sí   b) No: els genèrics no accepten primitius
8. `mapa.get("NoExisto")` torna...
   - a) `null`   b) 0   c) Una excepció
9. Quin mapa et dona les claus sempre ordenades alfabèticament?
   - a) `HashMap`   b) `TreeMap`
10. Pots afegir un element a una `List<? extends Number>`?
    - a) Sí, qualsevol Number   b) No (només `null`)
11. En runtime, `ArrayList<String>` i `ArrayList<Integer>` són la mateixa classe?
    - a) Sí, gràcies al type erasure   b) No, són classes distintes

<details>
<summary>🔄 Solucions</summary>

1. **b)** — Com `7` és un `Integer` i la llista és `Integer`, `remove(Object)` esborra l'objecte 7. Si passares un `int` a seques, el compilador triaria `remove(int)` = índex.
2. **b)** — `TreeSet` ordena automàticament. `HashSet` no ordena res.
3. **b)** — El `for-each` recorre amb un `Iterator` intern; esborrar per l'esquena llança `ConcurrentModificationException`.
4. **a)** — `LinkedHashSet` conserva l'ordre d'inserció.
5. **a)** — `sort`, `reverse`, `shuffle`... modifiquen la llista que els passes. Si la necessites intacta, copia-la abans.
6. **b)** — Les claus d'un Map són úniques; `put` sobreescriu.
7. **b)** — `int` és primitiu; es usa `Integer` amb autoboxing.
8. **a)** — `get` torna `null` si la clau no existix (no llança excepció).
9. **b)** — `TreeMap` ordena per clau; `HashMap` no ordena res.
10. **b)** — `? extends Number` és de només lectura (PECS: Producer Extends).
11. **a)** — El type erasure borra els genèrics en el bytecode: tots dos són `ArrayList`.

</details>

---

## ⚡ Laboratori de Tortura: la llista que plora

> **Duració estimada:** 30 minuts
> **Ferramenta:** el teu IDE i un fitxer nou

**L'escenari:** copia este programa i fes que funcione. Et diuen que té **3 errors** que impedeixen que compile i 1 error de lògica que fa que el resultat siga incorrecte... però, i si t'ho diuen malament? La teua tasca: fer que compile, que execute i que **tota** l'eixida siga correcta, comptant tu els errors reals.

```java
import java.util.ArrayList;

public class Estadisticas {

    public static int mayor(ArrayList<Integer> notas) {
        int max = notas.get(0);
        for (int i = 1; i < notas.size(); i++) {
            if (notas.get(i) > max) {
                max = notas.get(i)
            }
        }
        return max;
    }

    public static void main(String[] args) {
        ArrayList<Integer> notas = new ArrayList<>();
        notas.add(6);
        notas.add(8);
        notas.add(5);
        notas.add(9);

        System.out.println("La mayor es: " + mayor(notas))
    }
}
```

**Fallada intencionada:** el nombre d'errors de l'enunciat està malament a propòsit: si busques el "tercer error de compilació" i "l'error de lògica", te'n tornes boig. La trampa és la teua confiança en l'enunciat.

**La teua tasca:** aconseguir que compile, que execute i que **tota** l'eixida siga correcta. Si el resultat no quadra, diagnostica.

**Pistes per quan et frustres (no abans):**

1. Falta algun `;`? *no → seguix buscant.*
   <details><summary>I si continuec atascat?</summary>Repassa la línia `max = notas.get(i)` i l'última del `main`: totes dues necessiten `;`.</details>
2. Compila ja? *no → mira els tipus i els imports.*
   <details><summary>I si continuec atascat?</summary>El mètode `mayor` rep un `ArrayList<Integer>` i el `main` el crea igual: els tipus quadren. Mira una altra volta els `;`.</details>
3. Creus que hi ha un error de lògica que canvia la nota màxima? *Torna a llegir el codi amb calma i no et fies de l'enunciat.*
   <details><summary>Solució final</summary>

Els **errors de compilació**:

1. Falta el `;` al final de `max = notas.get(i)`.
2. Falta el `;` al final de `System.out.println(...)`.

L'**error de lògica**: no existix. La condició `notas.get(i) > max` és correcta i torna el major (9). Eixa era la fallada intencionada: l'enunciat diu "3 errors de compilació i 1 de lògica", però només hi ha 2 faltes de `;` i cap lògica trencada. L'error "amagat" era la teua confiança en l'enunciat. El resultat correcte és `La mayor es: 9`.

```java
import java.util.ArrayList;

public class Estadisticas {

    public static int mayor(ArrayList<Integer> notas) {
        int max = notas.get(0);
        for (int i = 1; i < notas.size(); i++) {
            if (notas.get(i) > max) {
                max = notas.get(i);
            }
        }
        return max;
    }

    public static void main(String[] args) {
        ArrayList<Integer> notas = new ArrayList<>();
        notas.add(6);
        notas.add(8);
        notas.add(5);
        notas.add(9);

        System.out.println("La mayor es: " + mayor(notas));
    }
}
```

Eixida correcta: `La mayor es: 9`. La lliçó real: **llig el codi, no l'enunciat**. Compta, verifica i confia en el compilador, no en la llegenda.

</details>

---

## ⚡ Laboratori de Tortura: la mitjana que plora

> **Duració estimada:** 30 minuts
> **Ferramenta:** el teu IDE i un fitxer nou

**L'escenari:** el mateix joc, ara amb genèrics i mapes. Et diuen que té **3 errors** de compilació i 1 de lògica... t'ho creus?

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

**Pistes per quan et frustres (no abans):**

1. Falta algun `;`? *no → seguix buscant.*
   <details><summary>I si continuec atascat?</summary>Repassa la línia `suma += n.doubleValue()` i l'última del `main`: totes dues necessiten `;`.</details>
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

   Eixida correcta: `7.0`. La lliçó real: **llig el codi, no l'enunciat**. Compta, verifica i confia en el compilador, no en la llegenda.

   </details>

---

## 🏆 Assoliments d'esta unitat

| Assoliment | Com aconseguir-ho |
|---|---|
| 🏅 **L'Aparcador** | Explicar per què `remove(1)` i `remove(Integer.valueOf(1))` fan coses diferents |
| 🏅 **El Porter** | Usar `HashSet` per a eliminar duplicats d'una llista en un exercici real |
| 🏅 **El Conguer** | Muntar una cua FIFO amb `LinkedList` sense que es cole ningú |
| 🏅 **El Doctor Iterator** | Esborrar elements d'una col·lecció durant un recorregut sense `ConcurrentModificationException` |
| 🏅 **El Tipògraf** | Explicar per què `ArrayList<String>` rebutja un `int` sense necessitat de casting |
| 🏅 **El Caixer** | Crear la teua pròpia classe genèrica `Caja<T>` i usar-la amb dos tipus diferents |
| 🏅 **El Mag** | Explicar el type erasure i el diamant `<>` com si fóra un truc de màgia |
| 🏅 **La Guia Telefònica** | Recórrer un `HashMap` amb `entrySet()` i comptar freqüències amb `getOrDefault` |
| 🏅 **L'Estratega** | Triar entre Map, List i Set justificant la tria amb arguments |

---

## 🧠 Atreveix-te a Pensar

1. **Sense executar:** què imprimeix este programa?

```java
import java.util.ArrayList;

public class Acertijo {
    public static void main(String[] args) {
        ArrayList<Integer> l = new ArrayList<>();
        l.add(1);
        l.add(2);
        l.add(3);
        int suma = 0;
        for (int i = 0; i < l.size(); i++) {
            if (l.get(i) % 2 == 0) {
                suma += l.get(i);
            }
        }
        System.out.println(suma);
    }
}
```

2. **El netejador de llistes:** tens un `ArrayList<Integer>` amb repetits. Com el deixes sense duplicats però mantenint l'ordre de primera aparició, en dos línies?
3. **El detectiu del TreeSet:** tens un `TreeSet<String>` i vols saber quants elements van abans que `"Bob"` en l'ordre natural. Quin mètode uses i què torna?
4. **Vertader o fals:** "un `for-each` pot modificar els elements d'un `ArrayList<Integer>` fent `elemento = 99`".
5. **Sense executar:** què imprimeix este programa?

```java
import java.util.HashMap;

public class AcertijoMapa {
    public static void main(String[] args) {
        HashMap<String, Integer> m = new HashMap<>();
        for (char c : "casa".toCharArray()) {
            m.put(String.valueOf(c), m.getOrDefault(String.valueOf(c), 0) + 1);
        }
        System.out.println(m.get("a") + " " + m.size());
    }
}
```

6. **El comptador de paraules ordenat:** tens un `String[]` de paraules i vols mostrar cada paraula amb la seua freqüència, en ordre alfabètic. Quina estructura uses i amb quin bucle?
7. **El detectiu del erasure:** per què no pots escriure `new T()` dins d'una classe genèrica, encara que t'hages passat pel `<T>`?
8. **Vertader o fals:** "un `HashMap` garanteix l'ordre en què introduïxes les claus".

<details>
<summary>💡 Solucions</summary>

1. **`2`**. El bucle recorre els índexs 0, 1, 2. Només el `2` (índex 1) és parell: `suma = 2`.
2. Amb un `LinkedHashSet`: `LinkedHashSet<Integer> set = new LinkedHashSet<>(lista);` i després `new ArrayList<>(set)`. Duplicats fora, ordre d'arribada dins.
3. `headSet("Bob")` — torna el subconjunt amb els elements que van abans que `"Bob"` en l'ordre natural.
4. **Fals.** El for-each és de només lectura: `elemento = 99` només canvia la variable local del bucle, mai la col·lecció. Per a modificar, usa `set(índex, valor)` o el `for` clàssic.
5. **`2 3`**. "casa" té c=1, a=2, s=1. `get("a")` = 2 i `size()` = 3 (tres claus diferents: c, a, s).
6. Un **`TreeMap<String, Integer>`** (claus ordenades soles) recorregut amb `entrySet()`: cada entrada és la paraula i la seua comptada.
7. Perquè en compilació Java no sap què és `T`, i en runtime el type erasure l'ha borrat: no hi ha manera d'instanciar un tipus que ja no existix.
8. **Fals.** `HashMap` no garanteix ordre. Per a ordre d'inserció usa `LinkedHashMap`; per a ordre natural, `TreeMap`.

</details>

---

## 🧩 Crucigrama de Bits

**Col·leccions:**

```
Horizontal:
1. Classe estàtica que ordena i remena col·leccions (11 lletres)
3. Excepció per modificar una col·lecció mentre es recorre (31 lletres)
5. Bucle de només lectura: "per a cada X en Y" (7 lletres)
6. Classe llista que creix sola i usa size() (9 lletres)

Vertical:
2. Col·lecció que no deixa entrar duplicats (7 lletres)
4. Col·lecció que manté els elements ordenats (7 lletres)
```

<details>
<summary>📝 Solucions (col·leccions)</summary>

**Horizontal:** 1. COLLECTIONS · 3. CONCURRENTMODIFICATIONEXCEPTION · 5. FOREACH · 6. ARRAYLIST
**Vertical:** 2. HASHSET · 4. TREESET

</details>

**Genèrics i mapes:**

```
Horizontal:
1. Mapa que ordena les claus automàticament (7 lletres)
3. Operador peresós que inferix el tipus en `new ArrayList<>()` (7 lletres)
5. Mètode que torna un valor per defecte si la clau no existix (12 lletres)
6. Mapa rapidíssim que no garanteix ordre (7 lletres)

Vertical:
2. Procés que borra els genèrics en compilar (12 lletres)
4. Estructura que associa claus amb valors (3 lletres)
```

<details>
<summary>📝 Solucions (genèrics i mapes)</summary>

**Horizontal:** 1. TREEMAP · 3. DIAMANTE · 5. GETORDEFAULT · 6. HASHMAP
**Vertical:** 2. TYPEERASURE · 4. MAP

</details>

---

## 💬 Preguntes d'Entrevista de Treball

> Preguntes reals que et farien per a programador Java junior.

1. **"Explícam'ho, com si jo fóra la teua àvia, què és un `ArrayList`."**
2. **"Quina és la diferència entre `ArrayList` i `LinkedList`?"**
3. **"Què és l'autoboxing i per què `ArrayList<int>` no compila?"**
4. **"Com elimines un element d'una col·lecció mentre la recórres? Què passa si uses `list.remove()`?"**
5. **"Quan usaríes `HashSet` en comptes de `ArrayList`?"**
6. **"Quina és la diferència entre `Collection` i `Collections`?"**
7. **"Explícam'ho, com si jo fóra la teua àvia, què és un `HashMap`."**
8. **"Què és el type erasure i per què és important?"**
9. **"Quina és la diferència entre `? extends T` i `? super T`? Què és PECS?"**
10. **"Per què `List<Number>` no accepta una `List<Integer>`?"**
11. **"Quan usaríes un `TreeMap` en comptes d'un `HashMap`?"**
12. **"Pots crear un array de genèrics? I fer `new T()`? Per què?"**

---

## 🤷 No hi ha preguntes tontes

> ❓ **`Collection` i `Collections` són el mateix?**

No. `Collection` és la **interfície** arrel de la família (List, Set, Queue la implementen). `Collections` és la **classe utilitària** de mètodes estàtics (`sort`, `shuffle`, `max`...). Una és un contracte; l'altra, una navalla suïssa.

---

> ❓ **I si mescle tipus en una col·lecció sense genèrics?**

Pots: `ArrayList lista = new ArrayList();` accepta qualsevol cosa. Però en traure-la tot és `Object` i has de fer casting creuant els dits. Amb genèrics (`ArrayList<String>`), el compilador et protegix i et casca abans que el lio arribe a l'execució.

---

> ❓ **`for-each` i `iterator` són el mateix?**

Quasi. El `for-each` usa un `Iterator` per darrere. La diferència: amb l'`Iterator` tens el mètode `remove()`, que et permet esborrar durant el recorregut. Si només lliges, usa el for-each: és més curt i llegible.

---

> ❓ **`Map` és una `Collection`?**

No. `Map` no hereta de la interfície `Collection` (encara que viu en `java.util`). `List` i `Set` són `Collection`; `Map` és una família a banda que associa claus amb valors. És un error molt típic: "les col·leccions de Java" inclouen els tres, però tècnicament `Map` no implementa `Collection`.

---

> ❓ **Els genèrics ralentitzen el meu programa?**

No. Java aplica **type erasure**: el compilador borra tota la informació genèrica i la converteix en castings normals. En runtime no hi ha genèrics, així que no hi ha cost extra. És només sucre sintàctic en compilació.

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

**PRÒXIMAMENT EN U13:** Fitxers i expressions regulars (Regex). Guarda els teus mapes i les teues llistes en disc i busca patrons amb expressions regulars. 📁

---

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/11-colecciones) · **Anterior:** [08 · TreeMap i com triar estructura](/ApuntesProgramacion/va/11-colecciones/08-treemap-elegir-estructura) · **Següent:** **[U12 · Programació funcional (Streams i Lambdas)](/ApuntesProgramacion/va/12-programacion-funcional)**
