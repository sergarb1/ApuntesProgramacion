---
title: "09 — Repàs interactiu"
description: "El tancament de la unitat amb chicha: endevina eixides, arregla bugs i dona't el luxe de patir amb honor 😈"
---

<p><small>El tancament de la unitat amb chicha: endevina eixides, arregla bugs i dona't el luxe de patir amb honor 😈</small></p>

> 🗺️ **Estàs en:** ⚡ **U05 · Algorítmica II: Tècniques** → 09 · Repàs interactiu

---

## 📬 La idea en una frase

> **En este punt no aprenem res de nou: ho convertim tot en pràctica. I, com sempre, alguna cosa no funcionarà.** 😈

---

## ⭐ Sé el Código, my friend...

> *Ets la JVM. Acaben de donar-te este programa per a executar:*

```java
public class MisterioRecursivo {
    static int contar(int n) {
        if (n <= 0) return 0;
        return 1 + contar(n / 2);
    }

    public static void main(String[] args) {
        System.out.println(contar(16));
        System.out.println(contar(100));
    }
}
```

**Què imprimixes per pantalla? Tria saviament:**

1. **`4` i `6`** → Recorda: cada crida dividix `n` entre 2 fins a arribar a 0. ❌
2. **`5` i `7`** → ✅ Correcte! `contar(16)`: 16→8→4→2→1→0, cinc salts. `contar(100)`: 100→50→25→12→6→3→1→0, set salts. És un comptador de divisions entre 2 (o siga, el "log₂" arredonit).
3. **`4` i `7`** → Compta els salts del primer: 16→8→4→2→1→0 són cinc passos, no quatre. ❌

> <details>
> <summary>🔄 Solució</summary>
>
> L'opció **2**. `contar(n)` retorna `1 + contar(n / 2)`: cada crida afig 1 i reduïx `n` a la meitat. Els passos fins a arribar a 0 són el log₂ arredonit cap amunt. Este és el clàssic que separa els que han fet la unitat dels que han dormit.
>
> </details>

---

## 🎯 Vertader o Fals

1. "Tota funció recursiva necessita un cas base." 
2. "El Fibonacci ingenu és O(n log n)."
3. "Quicksort és estable."
4. "Mergesort sempre és O(n log n), passe el que passe."
5. "La memoització convertix el Fibonacci de O(2ⁿ) a O(n)."
6. "En Java, `Arrays.sort()` usa TimSort per a tipus primitius."

<details>
<summary>🔄 Respostes</summary>

1. **Vertader.** Sense cas base, `StackOverflowError` assegurat.
2. **Fals.** El Fibonacci ingenu és **O(2ⁿ)**, exponencial.
3. **Fals.** Quicksort no és estable; l'estabilitat és de Mergesort.
4. **Vertader.** Per això és "el fiable": no té cas dolent.
5. **Vertader.** Cada Fibonacci es calcula una sola vegada.
6. **Fals.** Per a **primitius** usa Dual-Pivot Quicksort; TimSort és per a **objectes**.

</details>

---

## 🔥 Fireside Chat: Quicksort i Mergesort discuteixen

> *Dos veterans de l'ordenació discuteixen junt a la tassa humejant.*

**Quicksort:** — Escolta, col·lega. Jo sóc el més usat del planeta. En promig, jo orden més ràpid que tu amb la mateixa memòria. A tu et cal un array sencer de recanvi.

**Mergesort:** — ¿En promig? I què passa amb els teus mals dies? Quan et donen un array ja ordenat i el teu pivot és el primer element, te'n vas a O(n²) i plores. Jo mai. Sempre O(n log n), passe el que passe.

**Quicksort:** — ¡Això era abans! Ara use mediana de tres, o pivot aleatori, o dos pivots com el Dual-Pivot de Java. No em pilles en la mala.

**Mergesort:** — Vale, però digues-me, ets estable? Perquè quan ordene alumnes per nota i després per nom, jo conserve l'ordre dels empats. Tu els barreges com si repartirares cartes.

**Quicksort:** — Bé... l'estabilitat és per a dèbils. I la teua memòria O(n) no entra en un sistema encastat.

**Mergesort:** — I el teu O(n²) no entra en una base de dades. Saps què ordena discs sencers? Jo. Mergesort extern. Tot el dia. Tots els dies.

**Quicksort:** — *sospira* Vale. Cada un és millor on el seu cap el posa. Però tots sabem qui té més fama.

> La lliçó: **cap no guanya sempre**. Quicksort brilla amb dades a l'atzar i poca memòria; Mergesort amb estabilitat i garanties. El professional tria segons el context, no segons la marca.

---

## 🕵️ Qui Sóc?

Endevina quin concepte de la unitat sóc:

1. **Em crid a mi mateixa amb un problema més xicotet, fins que arribe a un cas que ja es resol sol.**
2. **Sóc la variable que dividix l'array en menors i majors, i la meua elecció decidix si l'algorisme vola o s'arrossega.**
3. **Sóc el pas en què dues llistes ordenades es combinen en una de sola, comparant el primer de cada una.**
4. **Sóc la tècnica que guarda els resultats ja calculats per a no repetir treball.**

<details>
<summary>🔄 Respostes</summary>

1. **La recursivitat** — cas base + cas recursiu.
2. **El pivot** — cor de la partició de Quicksort.
3. **La fusió (merge)** — el cor de Mergesort.
4. **La memoització** — de O(2ⁿ) a O(n) en Fibonacci.

</details>

---

## 🧩 Completa el codi

Este factorial recursiu té **3 buits**. Ompli'ls:

```java
public class FactorialHuecos {

    static int fact(int n) {
        if (_____) return 1;         // buit 1: cas base
        return _____;                // buit 2: cas recursiu
    }

    public static void main(String[] args) {
        System.out.println("fact(5) = " + _____);   // buit 3: la crida
    }
}
```

<details>
<summary>🔄 Solució</summary>

```java
public class FactorialHuecos {

    static int fact(int n) {
        if (n <= 1) return 1;         // buit 1
        return n * fact(n - 1);       // buit 2
    }

    public static void main(String[] args) {
        System.out.println("fact(5) = " + fact(5));   // buit 3 → 120
    }
}
```

</details>

---

## 🤬 CONRAD VS EL MÓN: "La teua recursió ha explotat"

> *CONRAD, el nostre compilador cascarràs, opina sobre el clàssic del novençà.*

**CONRAD:** — ¡UNA ALTRA VEGADA! Ve un alumne i em diu: *CONRAD, el meu programa dona StackOverflowError*. I jo: vale, has mirat el teu cas base? *Què cas?* ¡AI, MARE MEUA! Hem estat tres unitats perquè em digues "què cas"!

*I el pitjor ve després. Em mostra el codi i veig:* `return fibo(n - 1) + fibo(n - 2);` per a `n = 50`. ¿PERÒ TU SAPS EL QUE ÉS AIXÒ? Això no és un programa, és una declaració d'intencions suïcides. `fibo(50)` són milers de milions de crides. El meu stack tremola només de vore-ho.

*I després, el súmmum:* agafa l'array ja ordenat, tria el primer element com a pivot, i em pregunta per què Quicksort va tan lent. Que per què? ¡Perquè has convertit O(n log n) en O(n²), campió! ¡Tria el del mig, o mediana de tres, o tira un dau!

**La lliçó:** abans de plorar sobre el teclat, revisa els tres sospitosos habituals: **cas base**, **complexitat real** (estàs duplicant treball?) i **elecció del pivot**. El 90% dels drames d'esta unitat s'arreglen només mirant eixos tres.

---

## ⚡ Laboratori de Tortura: el programa que no ordena

> **Durada estimada:** 30 minuts
> **Ferramenta:** el teu IDE i un fitxer nou

**L'escenari:** este programa hauria d'ordenar, però té **3 errors** que el trenquen. Troba'ls i fes que l'eixida siga `[1, 2, 3, 4, 5, 6, 7]`.

```java
public class TorturaOrdenacion {

    static void quicksort(int[] arr, int inicio, int fin) {
        if (inicio > fin) return;

        int pivote = arr[inicio];
        int i = inicio + 1;

        for (int j = inicio + 1; j <= fin; j++) {
            if (arr[j] < pivote) {
                int tmp = arr[i];
                arr[i] = arr[j];
                arr[j] = tmp;
                i++;
            }
        }

        quicksort(arr, inicio, i - 1);
        quicksort(arr, i, fin);
    }

    public static void main(String[] args) {
        int[] datos = {7, 3, 5, 1, 6, 2, 4};
        quicksort(datos, 0, datos.length - 1);
        System.out.println(java.util.Arrays.toString(datos));
    }
}
```

**Pistes per quan et frustres (no abans):**

1. El cas base usa `>` o `>=`? Què passa amb una zona d'un sol element? *pista: `inicio == fin` té un sol element, ja ordenat.*
   <details><summary>I si continue atascat?</summary>El cas base hauria de ser `if (inicio >= fin) return;`.</details>
2. On hauria d'anar el pivot en acabar la partició? *pista: ell també és un element de l'array.*
   <details><summary>I si continue atascat?</summary>Falta intercanviar el pivot (a `arr[inicio]`) amb `arr[i - 1]` abans de les crides recursives.</details>
3. I les crides recursives de la dreta, quina zona cobrixen? *pista: amb el pivot a `i - 1`, la zona dreta comença en `i`.*
   <details><summary>Solució final</summary>

```java
public class TorturaOrdenacion {

    static void quicksort(int[] arr, int inicio, int fin) {
        if (inicio >= fin) return;

        int pivote = arr[inicio];
        int i = inicio + 1;

        for (int j = inicio + 1; j <= fin; j++) {
            if (arr[j] < pivote) {
                int tmp = arr[i];
                arr[i] = arr[j];
                arr[j] = tmp;
                i++;
            }
        }

        // el pivot al seu lloc: just abans de la zona de majors
        int tmp = arr[inicio];
        arr[inicio] = arr[i - 1];
        arr[i - 1] = tmp;

        quicksort(arr, inicio, i - 2);
        quicksort(arr, i, fin);
    }

    public static void main(String[] args) {
        int[] datos = {7, 3, 5, 1, 6, 2, 4};
        quicksort(datos, 0, datos.length - 1);
        System.out.println(java.util.Arrays.toString(datos));
    }
}
```

Eixida correcta: `[1, 2, 3, 4, 5, 6, 7]`.

</details>

---

## 🏆 Assoliments d'esta unitat

| Assoliment | Com aconseguir-lo |
|---|---|
| 🏅 **El Màgic del Stack** | Explicar cas base, cas recursiu i pila de crides sense mirar |
| 🏅 **Recursionista** | Implementar factorial i palíndrom recursius sense ajuda |
| 🏅 **Domador de Fibonacci** | Baixar `fibo(50)` de O(2ⁿ) a O(n) amb memoització |
| 🏅 **El Ràpid** | Implementar Quicksort des de zero sense mirar el codi |
| 🏅 **El Fiable** | Implementar Mergesort des de zero, amb la seua fusió, sense mirar |
| 🏅 **Enginyer de Dades** | Triar amb criteri entre Quicksort, Mergesort i `Arrays.sort()` segons el context |

---

## 🧠 Atreveix-te a Pensar

1. **Sense executar:** què imprimix este programa?

```java
public class Misterio2 {
    static int misterio(int n) {
        if (n == 0) return 0;
        return n % 10 + misterio(n / 10);
    }

    public static void main(String[] args) {
        System.out.println(misterio(1234));
    }
}
```

2. **L'iteratiu que no es rendix:** escriu una versió **iterativa** (amb bucle) de `fact(n)`. Quina preferixes i per què?
3. **El detectiu de l'IDE:** el teu Quicksort "funciona" amb arrays xicotets però desordena els grans. Quina tècnica de depuració uses i en quin pas et fixes primer? *pista: els índexs de la partició.*
4. **Vertader o fals:** "Mergesort és millor que Quicksort sempre perquè no té cas dolent."

<details>
<summary>💡 Solucions</summary>

1. **`10`** — suma les xifres: 4 + 3 + 2 + 1 = 10. És una suma de dígits recursiva.
2. `int r = 1; for (int i = 2; i <= n; i++) r *= i; return r;`. L'iteratiu no gasta stack i sol ser més ràpid, però el recursiu expressa millor la definició matemàtica. Per a un examen, domina els dos.
3. El **depurador** amb breakpoints en la partició. Observa com canvien `i` i `j` (o `i` i el pivot) i on es creuen: els errors d'off-by-one en els límits de la partició són el clàssic.
4. **Fals.** Mergesort és més *fiable* (garantix O(n log n)), però gasta O(n) de memòria i no guanya en velocitat pràctica amb arrays en memòria. "Millor" depén del context: eixa és tota la lliçó del punt 6.

</details>

---

## 🧩 Crucigrama de Bits

```
Horitzontal:
1. La condició que deté la recursió (5,4)
3. Algorisme estable del punt 5 (9)
5. Tècnica que guarda resultats ja calculats (12)
6. La variable que dividix l'array en Quicksort (6)

Vertical:
2. El que llança la JVM quan l'stack s'ompli (8,7)
4. Ordenar sense arrays auxiliars (7)
7. Repartir elements al voltant del pivot (11)
```

<details>
<summary>📝 Solucions</summary>

**Horitzontal:** 1. CAS BASE · 3. MERGESORT · 5. MEMOITZACIÓ · 6. PIVOT
**Vertical:** 2. STACKOVERFLOW · 4. IN-PLACE · 7. PARTICIONAR

</details>

---

## 💬 Preguntes d'Entrevista de Treball

> Preguntes reals que et farien per a programador Java júnior.

1. **"Explica'm, com si jo fóra la teua àvia, què és la recursivitat i per què a voltes dona StackOverflowError."**
2. **"Quan usaries Quicksort i quan Mergesort? Justifica."**
3. **"El factorial recursiu amb `n = 100000` et rebenta la pila. Què fas?"**
4. **"Què és la memoització i quin problema resol?"**
5. **"Si `Arrays.sort()` ja ordena, per a què aprendre a implementar Quicksort?"**

---

## 🤷 No hi ha preguntes tontes

> ❓ **Puc escriure recursivitat amb bucles i oblidar-me de tot això?**

Pots, però et perdràs l'elegància en els problemes jeràrquics (arbres, jocs, laberints) i la comprensió de com funcionen per dins Quicksort, Mergesort i el backtracking. A més, quasi qualsevol entrevista tècnica et preguntarà per això. No és obligatori, però dol no saber-ho.

---

> ❓ **Per què `fibo(92)` dona el màxim que cap en `long` i no puc anar més enllà?**

Perquè `long` té un límit (9.223.372.036.854.775.807) i `fibo(93)` ja el supera. Si necessites nombres més grans, hauràs d'usar `BigInteger`, que pot créixer tant com la memòria ho permeta.

---

> ❓ **Mergesort és el que usa Java per defecte? Jurava que era Quicksort.**

Els dos, segons el tipus: **Dual-Pivot Quicksort** per a primitius i **TimSort** (una mescla amb Mergesort) per a objectes. Java no és dogmàtic: usa el millor per a cada cas. Eixe és el mateix criteri que et demanem a tu en el punt 6.

---

## 🎬 Post-Crèdits

El programador novençà acaba el seu Quicksort, l'executa i... funciona a la primera. Es frega els ulls. El seu company Mergesort, eixe maratonià fiable, li somriu des de l'altre monitor.

**Novençà:** — No m'ho crec. He escrit un Quicksort sense mirar!

**CONRAD:** — *apareix amb cara de pocs amics* Bonic. Ara digues-me: quan usaries Mergesort en el seu lloc?

**Novençà:** — Quan necessite estabilitat... o quan l'array arribe quasi ordenat i em faça por el pivot.

**CONRAD:** — *assenteix, quasi emocionat* Mira per on. Ja no només escrius algorismes: penses en ells. Això es diu ser enginyer. *pausa* Però no et relaxes, que la pròxima unitat t'espera amb objectes, classes i algun constructor que et farà plorar.

**Novençà:** — Plorar? Jo ja domine la recursivitat.

**CONRAD:** — *riu malèvol* Això deia l'altre abans de trobar-se amb `this`.

El novençà guarda el seu projecte, i sent que alguna cosa ha canviat en la seua manera de pensar. La recursivitat ja no li fa por: l'entén. I l'entén perquè, per a entendre la recursivitat, primer va entendre la recursivitat.

**PRÒXIMAMENT EN U06:** POO: Classes i Objectes. El moment en què els teus programes deixen de ser funcions soltes i es convertixen en **ciutadans amb atributs i mètodes**. 🏗️

---

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/05-algoritmica-tecnicas) · **Anterior:** [08 · Altres tècniques algorísmiques](/ApuntesProgramacion/va/05-algoritmica-tecnicas/08-otras-tecnicas-algoritmicas) · **Següent:** **[U06 · POO: Classes i Objectes](/ApuntesProgramacion/va/06-poo-clases-objetos)**