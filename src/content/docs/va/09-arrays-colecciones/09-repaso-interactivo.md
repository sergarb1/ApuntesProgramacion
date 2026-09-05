---
title: "09 — Repàs interactiu: domina l'aparcament"
description: "El tancament pràctic de la unitat, amb arrays, col·leccions i un remove() que ho liarà tot 😈"
---

<p><small>El tancament pràctic de la unitat, amb arrays, col·leccions i un remove() que ho liarà tot 😈</small></p>

> 🗺️ **Estàs en:** 📚 **U09 · Arrays i Col·leccions** → 09 · Repàs interactiu

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

## 🔥 Fireside Chat: Array vs ArrayList

> *Dues formes d'emmagatzemar dades s'enfronten davant la màquina de cafè.*

**Array:** — Mira, jo soc l'original. Ràpid, eficient, directe. Accés O(1) a qualsevol posició. Sóc la base de tot!

**ArrayList:** — Sí, però tens grandària fixa. Una volta que et crees amb 10 posicions, no pots tindre'n 11. Jo creixc i m'encongisc sota demanda. Soc flexible.

**Array:** — Però jo soc més ràpid en accés i més lleuger en memòria. Tu uses un array per dins i afigs overhead.

**ArrayList:** — Cert, però els meus mètodes `add()`, `remove()`, `contains()` em fan molt més còmode. Quantes línies necessites per a afegir un element a un array? Jo una: `lista.add(42)`.

**Array:** — Per a dades primitives soc més eficient. `int[]` ocupa menys que `ArrayList<Integer>` per l'autoboxing.

**ArrayList:** — Val, per a tipus primitius i rendiment extrem, usa arrays. Per a tot el demés, usa'm a mi. Tregua?

**Array:** — Tregua.

> La lliçó: **saps quants elements necessites i no canviarà? → array. No ho saps o canviarà? → ArrayList.** I per a rendiment pur amb primitius, l'array guanya sempre.

---

## 🕵️ Qui Soc?

Endevina quin concepte de la unitat soc:

1. **Soc l'aparcament de dades de grandària fixa: la meua longitud es pregunta sense parèntesis.**
2. **Soc el bucle peresós que recorre tot sense índex... però no puc modificar res.**
3. **Soc l'aparcament que creix sol i no pot guardar `int` a palpes.**
4. **Soc el porter que no deixa entrar ningú que ja estiga dins.**
5. **Soc el cambrer que recorre qualsevol col·lecció i permet esborrar sense liar-la.**
6. **Soc la classe estàtica que ordena, remena i troba el màxim de les teues col·leccions.**

<details>
<summary>🔄 Respostes</summary>

1. **L'array** — `length`, sense parèntesis, grandària fixa.
2. **El for-each** — llig tot, però és només de lectura.
3. **`ArrayList`** — redimensionable; per a números usa `Integer`.
4. **`HashSet`** — sense duplicats, sense ordre.
5. **`Iterator`** — `hasNext()`, `next()` i el sagrat `remove()`.
6. **`Collections`** — `sort`, `shuffle`, `max`, `min`...

</details>

---

## 🤬 CONRAD VS EL MÓN: "L'aparcament que no aparca"

> *CONRAD, el nostre compilador cascarrabutxes, opina sobre els clàssics del novell.*

**CONRAD:** — UNA ALTRA VEGADA! Ve un alumne i em diu: *CONRAD, el meu programa es cau*. I jo: val, quin error? *Pues una cosa de "out of bounds".* AI, MARE MEUA! Has intentat aparcar a la plaça 5 d'un aparcament de 5 places. Els índexs van de 0 a `length - 1`. Quantes voltes ho he de repetir?

*I després està el del `length`.* Escriu `numeros.length()` amb parèntesis. Però si és un atribut! Els claudàtors es fan servir per a accedir, no per a mesurar. El que porta parèntesis és `size()` de les col·leccions i `length()` dels `String`. Tres mons, tres sintaxis, i els tres al mateix examen.

*I el colmo dels colmos:* esborra elements amb `lista.remove(...)` dins d'un `for-each` i es queixa que Java "li té mania". I tant que et llança `ConcurrentModificationException`! Estàs canviant la llista mentre el bucle la recorre! Usa `iterator.remove()`, que per a això existix.

**La lliçó:** abans d'acusar Java de "odiar-te", repassa el trio sagrat de la unitat: **l'índex està entre 0 i `length - 1`? estic usant `length`, `length()` o `size()` segons toca? estic modificant una col·lecció mentre la recórre?** El 90% dels errors d'esta unitat s'arreglen amb estes tres preguntes. El compilador no t'odia: t'està passant les respostes de l'examen.

---

## 🎮 El Joc de les Decisions

Tria la resposta correcta per a cada decisió (respostes al final):

1. `int[] a = new int[5];` Quant val `a[0]`?
   - a) `null`   b) `0`
2. `ArrayList<Integer> l = new ArrayList<>(); l.add(7); l.remove(7);` Què esborra el `remove(7)`?
   - a) L'índex 7   b) L'objecte 7
3. Què llança `arr[arr.length]`?
   - a) `NullPointerException`   b) `ArrayIndexOutOfBoundsException`
4. Quina col·lecció et dona els elements sempre ordenats i sense duplicats?
   - a) `HashSet`   b) `TreeSet`
5. `String[] s = {"a", "b"};` i `System.out.println(s.length);` Compila?
   - a) Sí   b) No, falta `()`

<details>
<summary>🔄 Solucions</summary>

1. **b)** — Els `int` per defecte valen `0`, no `null` (això era per a objectes).
2. **b)** — Com `7` és un `Integer` i la llista és `Integer`, `remove(Object)` esborra l'objecte 7. Si fos un `int` a seques (com en `ArrayList<Integer>`, compte), el compilador triaria `remove(int)` = índex. Ací l'autoboxing fa que siga objecte.
3. **b)** — La plaça `length` no existix: `ArrayIndexOutOfBoundsException`.
4. **b)** — `TreeSet` ordena automàticament. `HashSet` no ordena res.
5. **a)** — `s.length` és un atribut vàlid, sense parèntesis. Compila i mostra 2.

</details>

---

## ⚡ Laboratori de Tortura: l'array que plora

> **Duració estimada:** 30 minuts
> **Ferramenta:** el teu IDE i un fitxer nou

**El escenari:** copia este programa i fes que funcione. Té **3 errors** que impedixen que compile i 1 error de lògica que fa que el resultat siga incorrecte quan l'arregles.

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

**Fallada intencionada:** un dels errors sembla correcte a simple vista perquè "es veu bé", però canvia per complet el resultat del programa.

**La teua tasca:** aconseguir que compile, que execute i que **tota** l'eixida siga correcta. Si el resultat no quadra, diagnostica.

**Pistes per quan et frustres (no abans):**

1. Falta algun `;`? *no → seguix buscant.*
   <details><summary>I si continuec atascat?</summary>Repassa la línia `max = notas.get(i)` i l'última del `main`: totes dues necessiten `;`.</details>
2. Compila ja? *no → mira els tipus i els imports.*
   <details><summary>I si continuec atascat?</summary>El mètode `mayor` rep un `ArrayList<Integer>` i el `main` el crea igual: els tipus quadren. Mira una altra volta els `;`.</details>
3. Executa però la nota màxima ix rara? *És l'error de lògica: el signe de la condició.*
   <details><summary>Solució final</summary>

Els **3 errors de compilació**:

1. Falta el `;` al final de `max = notas.get(i)`.
2. Falta el `;` al final de `System.out.println(...)`.
3. No hi ha tercer error de compilació: mira bé. En realitat només hi ha **2** faltes de `;`... i un error de lògica.

L'**error de lògica**: cap. Espera... si només hi ha 2 faltes de `;`, on és el tercer error que impedix compilar? **No existix tal tercer error.** Eixa era la fallada intencionada: l'enunciat diu "3 errors", però només hi ha 2 faltes de `;`. L'error "amagat" era la teua confiança en l'enunciat. El resultat correcte és `La mayor es: 9`.

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
| 🏅 **L'Aparcador** | Explicar la diferència entre `length`, `length()` i `size()` sense equivocar-te |
| 🏅 **Caçador de BOOM** | Trobar l'índex que provoca una `ArrayIndexOutOfBoundsException` sense pistes |
| 🏅 **El Porter** | Usar `HashSet` per a eliminar duplicats d'una llista en un exercici real |
| 🏅 **El Llest del remove** | Explicar per què `remove(1)` i `remove(Integer.valueOf(1))` fan coses diferents |
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

2. **L'array fantasma:** tens `int[] datos = {4, 1, 3};`. Com el convertixes en `{1, 3, 4}` sense escriure un algoritme d'ordenació a mà?
3. **El detectiu del heap:** el teu programa imprimeix `null` quan esperaves un nom guardat en un array de `String`. Quin valor té l'array i què ho va provocar?
4. **Vertader o fals:** "un `for-each` pot modificar els elements d'un `ArrayList<Integer>` fent `elemento = 99`".

<details>
<summary>💡 Solucions</summary>

1. **`2`**. El bucle recorre els índexs 0, 1, 2. Només el `2` (índex 1) és parell: `suma = 2`.
2. Amb `Arrays.sort(datos)`. Després `Arrays.toString(datos)` imprimeix `[1, 3, 4]`. No cal reinventar la bombolla.
3. Les places d'un `String[]` acabat de crear valen `null`. Si mai no assignares el nom (o assignares `null`), la plaça seguix en `null`. Imprimir un `null` no dona error; cridar `nombre.toUpperCase()` sobre ell, sí.
4. **Fals.** El for-each és de només lectura: `elemento = 99` només canvia la variable local del bucle, mai la col·lecció. Per a modificar, usa `set(índex, valor)` o el `for` clàssic.

</details>

---

## 🧩 Crucigrama de Bits

```
Horizontal:
1. Classe estàtica que ordena i remena col·leccions (11 lletres)
3. Excepció per eixir-te de les places vàlides d'un array (26 lletres)
5. Bucle de només lectura: "per a cada X en Y" (7 lletres)
6. Classe llista que creix sola i usa size() (9 lletres)

Vertical:
2. Col·lecció que no deixa entrar duplicats (7 lletres)
4. Col·lecció que manté els elements ordenats (7 lletres)
```

<details>
<summary>📝 Solucions</summary>

**Horizontal:** 1. COLLECTIONS · 3. ARRAYINDEXOUTOFBOUNDSEXCEPTION · 5. FOR-EACH · 6. ARRAYLIST
**Vertical:** 2. HASHSET · 4. TREESET

</details>

---

## 💬 Preguntes d'Entrevista de Treball

> Preguntes reals que et farien per a programador Java junior.

1. **"Explícam'ho, com si jo fóra la teua àvia, què és un array."**
2. **"Quina és la diferència entre un array i un `ArrayList`?"**
3. **"Per què els índexs comencen en 0?"**
4. **"Què és l'autoboxing i per què `ArrayList<int>` no compila?"**
5. **"Com elimines un element d'una col·lecció mentre la recórres? Què passa si uses `list.remove()`?"**
6. **"Quan usaríes `HashSet` en comptes de `ArrayList`?"**

---

## 🤷 No hi ha preguntes tontes

> ❓ **Els arrays poden canviar de grandària?**

No. Són immutables en grandària. Si necessites que cresca, crea'n un de nou i copia les dades amb `Arrays.copyOf()` o `System.arraycopy()`. O, millor, usa un `ArrayList`, que fa això per tu.

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

**PROXIMAMENT EN U10:** Genèrics i Mapes. El moment en què les teues col·leccions aprenen a parlar de si mateixes amb `<T>` i a guardar parelles de clau-valor. 🗺️

---

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/09-arrays-colecciones) · **Anterior:** [08 · Iterator i la classe Collections](/ApuntesProgramacion/va/09-arrays-colecciones/08-iterator-collections) · **Següent:** **[U10 · Genèrics i Mapes](/ApuntesProgramacion/va/10-genericos-mapas)**