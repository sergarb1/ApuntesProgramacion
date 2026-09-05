---
title: "09 · Repàs interactiu: domina les col·leccions"
description: "El tancament pràctic de la unitat, amb col·leccions, un remove() que ho liarà tot i un bucle que explotarà 😈"
---

<p><small>El tancament pràctic de la unitat, amb col·leccions, un remove() que ho liarà tot i un bucle que explotarà 😈</small></p>

> 🗺️ **Estàs en:** 📚 **U10 · Col·leccions** → 09 · Repàs interactiu

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

**Què imprimixes per pantalla? Tria saviament:**

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

## 🕵️ Qui Soc?

Endevina quin concepte de la unitat soc:

1. **Soc l'aparcament que creix sol i no pot guardar `int` a palpes.**
2. **Soc el que encadena elements com una conga, perfecte per a cues i piles.**
3. **Soc el porter que no deixa entrar ningú que ja estiga dins.**
4. **Soc el que ordena tot el que fiques automàticament.**
5. **Soc el cambrer que recorre qualsevol col·lecció i permet esborrar sense liar-la.**
6. **Soc la classe estàtica que ordena, remena i troba el màxim de les teues col·leccions.**

<details>
<summary>🔄 Respostes</summary>

1. **`ArrayList`** — redimensionable; per a números usa `Integer`.
2. **`LinkedList`** — `addLast`, `removeFirst`, la conga de Java.
3. **`HashSet`** — sense duplicats, sense ordre.
4. **`TreeSet`** — ordre natural automàtic (i LinkedHashSet per a l'ordre d'arribada).
5. **`Iterator`** — `hasNext()`, `next()` i el sagrat `remove()`.
6. **`Collections`** — `sort`, `shuffle`, `max`, `min`...

</details>

---

## 🤬 CONRAD VS EL MÓN: "L'aparcament que no aparca"

> *CONRAD, el nostre compilador cascarrabutxes, opina sobre els clàssics del novell.*

**CONRAD:** — UNA ALTRA VEGADA! Ve un alumne i em diu: *CONRAD, el meu programa es cau*. I jo: val, quin error? *Pues una cosa de "ConcurrentModificationException".* AI, MARE MEUA! Estaves esborrant amb `lista.remove(...)` dins d'un `for-each`. El bucle està recorrent la llista mentre tu la canvies per darrere! Usa `iterator.remove()`, que per a això existix.

*I després està el del `remove` amb números.* Escriu `numeros.remove(1)` creient que esborra el número 1. Però si `1` és un `int`! Ho interpreta com a **índex**. Per a esborrar el número 1 necessites `remove(Integer.valueOf(1))`. Índex o valor: decidix què vols esborrar.

*I el colmo dels colmos:* confon `HashSet` amb `TreeSet`. Es queixa que "el seu HashSet no ordena". I tant que no! Un `HashSet` és un porter, no un organitzador. Si vols ordre, `TreeSet` (ordre natural) o `LinkedHashSet` (ordre d'arribada). I no li fiques `null` a un `TreeSet`, que no sap comparar-lo amb res.

**La lliçó:** abans d'acusar Java de "odiar-te", repassa el trio sagrat de la unitat: **estic esborrant per índex o per valor? estic modificant una col·lecció mentre la recórre? he triat la col·lecció amb l'ordre que necessite?** El 90% dels errors d'esta unitat s'arreglen amb estes tres preguntes. El compilador no t'odia: t'està passant les respostes de l'examen.

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

<details>
<summary>🔄 Solucions</summary>

1. **b)** — Com `7` és un `Integer` i la llista és `Integer`, `remove(Object)` esborra l'objecte 7. Si passares un `int` a seques, el compilador triaria `remove(int)` = índex.
2. **b)** — `TreeSet` ordena automàticament. `HashSet` no ordena res.
3. **b)** — El `for-each` recorre amb un `Iterator` intern; esborrar per l'esquena llança `ConcurrentModificationException`.
4. **a)** — `LinkedHashSet` conserva l'ordre d'inserció.
5. **a)** — `sort`, `reverse`, `shuffle`... modifiquen la llista que els passes. Si la necessites intacta, copia-la abans.

</details>

---

## ⚡ Laboratori de Tortura: la llista que plora

> **Duració estimada:** 30 minuts
> **Ferramenta:** el teu IDE i un fitxer nou

**L'escenari:** copia este programa i fes que funcione. Et diuen que té **3 errors** que impedixen que compile i 1 error de lògica que fa que el resultat siga incorrecte... però, i si t'ho diuen malament? La teua tasca: fer que compile, que execute i que **tota** l'eixida siga correcta, comptant tu els errors reals.

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

Eixida correcta: `La mayor es: 9`. La lliçó real: **llig el codi, no l'enunciat**. Un bug pot ser que et diguen "hi ha 3 errors" i només n'hi haja 2: si busques el tercer, et tornes boig. Compta, verifica i confia en el compilador, no en la llegenda.

</details>

---

## 🏆 Assoliments d'esta unitat

| Assoliment | Com aconseguir-ho |
|---|---|
| 🏅 **L'Aparcador** | Explicar per què `remove(1)` i `remove(Integer.valueOf(1))` fan coses diferents |
| 🏅 **El Porter** | Usar `HashSet` per a eliminar duplicats d'una llista en un exercici real |
| 🏅 **El Conguer** | Muntar una cua FIFO amb `LinkedList` sense que es cole ningú |
| 🏅 **La Navalla Suïssa** | Ordenar i manipular una llista amb `Collections` en una sola línia |
| 🏅 **El Doctor Iterator** | Esborrar elements d'una col·lecció durant un recorregut sense `ConcurrentModificationException` |

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

<details>
<summary>💡 Solucions</summary>

1. **`2`**. El bucle recorre els índexs 0, 1, 2. Només el `2` (índex 1) és parell: `suma = 2`.
2. Amb un `LinkedHashSet`: `LinkedHashSet<Integer> set = new LinkedHashSet<>(lista);` i després `new ArrayList<>(set)`. Duplicats fora, ordre d'arribada dins.
3. `headSet("Bob")` — torna el subconjunt amb els elements que van abans que `"Bob"` en l'ordre natural.
4. **Fals.** El for-each és de només lectura: `elemento = 99` només canvia la variable local del bucle, mai la col·lecció. Per a modificar, usa `set(índex, valor)` o el `for` clàssic.

</details>

---

## 🧩 Crucigrama de Bits

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
<summary>📝 Solucions</summary>

**Horizontal:** 1. COLLECTIONS · 3. CONCURRENTMODIFICATIONEXCEPTION · 5. FOREACH · 6. ARRAYLIST
**Vertical:** 2. HASHSET · 4. TREESET

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

## 🎬 Post-Crèdits

La programadora acaba el seu gestor de reserves d'un aparcament virtual: un `ArrayList` de matrícules que creix amb cada cotxe que arriba, un `HashSet` per a no deixar entrar matrícules repetides i un `Iterator` que trau els cotxes sense trencar la llista. Funciona. Fins que intenta ordenar les matrícules i descobrix que un `HashSet` no ordena res.

S'acosta CONRAD, el compilador cascarrabutxes, amb la seua tassa fumant.

**CONRAD:** — Has vist? Un `HashSet` és un porter, no un organitzador. Per a ordenar necessites un `TreeSet`, o un `ArrayList` amb `Collections.sort()`. Cada col·lecció amb la seua missió.

**Programadora:** — Val... però ara mateix tot cap en una llista. Què faig quan necessite guardar el número de plaça de cada matrícula? Dues llistes paral·leles?

**CONRAD:** — *assentix* Estàs pensant en mapes: associar una clau amb un valor. Matrícula → plaça. Això no ho resol cap llista. Però això és una altra història, i quasi et toca.

**PROXIMAMENT EN U11:** Genèrics i Mapes. El moment en què les teues col·leccions aprenen a parlar de si mateixes amb `<T>` i a guardar parelles de clau-valor. 🗺️

---

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/10-colecciones) · **Anterior:** [08 · Be the Code: col·leccions en acció](/ApuntesProgramacion/va/10-colecciones/08-be-the-code) · **Següent:** **[U11 · Genèrics i Mapes](/ApuntesProgramacion/va/11-genericos-mapas)**