---
title: "09 — Repàs interactiu: ordena i busca com un professional"
description: El tancament pràctic de la unitat, amb cerques, bombolles i un algoritme que no funcionarà 😈
---

<p><small>El tancament pràctic de la unitat, amb cerques, bombolles i un algoritme que no funcionarà 😈</small></p>

> 🗺️ **Estàs en:** 🧩 **U04 · Algorítmica I: Fonaments** → 09 · Repàs interactiu

---

## 📬 La idea en una frase

> **En este punt no aprenem res de nou: ho convertim tot en pràctica. I, com sempre, alguna cosa no funcionarà.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaben de donar-te este programa per a executar:*

```java
public class Misteri {
    public static void main(String[] args) {
        int[] dades = {10, 20, 30, 40, 50, 60};
        int esquerra = 0;
        int dreta = dades.length - 1;
        int objectiu = 40;
        int passos = 0;

        while (esquerra <= dreta) {
            int mig = esquerra + (dreta - esquerra) / 2;
            passos++;
            if (dades[mig] == objectiu) {
                System.out.println("Trobat en " + mig + " amb " + passos + " passos.");
                return;
            }
            if (dades[mig] < objectiu) {
                esquerra = mig + 1;
            } else {
                dreta = mig - 1;
            }
        }
        System.out.println("No hi és. Passos: " + passos);
    }
}
```

**Què imprimixes per pantalla? Tria saviament:**

1. **`Trobat en 3 amb 1 passos.`** → Confons el nombre de passos amb la posició: la cerca no arriba en una sola volta. ❌
2. **`Trobat en 3 amb 3 passos.`** → ✅ Correcte! Amb 6 elements, `mig` és `0 + (5-0)/2 = 2` → `dades[2] = 30`, que és menor que 40, així que `esquerra = 3`. Segona volta: `mig = 3 + (5-3)/2 = 4` → `dades[4] = 50`, que és major, així que `dreta = 3`. Tercera volta: `mig = 3 + (3-3)/2 = 3` → `dades[3] = 40`. Bingo en 3 passos! Amb `return` (estem en `main`) el programa acaba ací.
3. **`No hi és. Passos: 4.`** → El 40 és en l'array, només que la cerca binària no el caça a la primera. ❌

> <details>
> <summary>🔄 Solució</summary>
>
> L'opció **2**. Traça: `mig=2 (30<40) → esq=3`, `mig=4 (50>40) → der=3`, `mig=3 → 40!`. Són **3 passos** en la posició **3**. El `return` dins de `main` acaba el programa sense arribar a la línia del "No hi és".
>
> </details>

---

## 🔥 Fireside Chat: cerca lineal vs cerca binària

> *Dos veterans de la cerca discuteixen al costat de la màquina de cafè.*

**Lineal:** — Jo soc la bàsica. Recórrec element per element, sense exigir-li res a ningú. Desordenat? Sense problema. Cinc elements? Un moment. Un milió? Uns milions de passos, però vaig.

**Binària:** — Uns milions de passos. Quina generositat. Jo amb un milió tarde vint passos. Vint. Mentre tu sues, jo ja he acabat i estic demanant un altre cafè.

**Lineal:** — I qui t'ha donat permís per a ser tan intel·ligent? L'array **ordenat**. Si les dades arriben desordenades, tu no servixes ni per a obrir la porta. Jo, en canvi, funcione sempre. És la vida: sense exigir res, però sense grans alegries.

**Binària:** — Ordenar una vegada i buscar mil, i veuràs. Jo soc la que salva les apps amb milions d'usuaris. Tu eres... el pla B.

**Lineal:** — El pla B que no s'estavella. Quan el teu array està desordenat i a ningú li apeteix ordenar-lo, a mi em criden. I no em queixe.

**Binària:** — Val, cadascuna al seu terreny: tu, el xicotet i desordenat; jo, el gran i ordenat amb moltes cerques. ¿Tregua?

**Lineal:** — Tregua. Però que sàpies que en els arrays de 5 elements et guanye fins i tot a tu, amb els teus aires d'`esquerra + (dreta - esquerra) / 2`.

> La lliçó: cap no és millor "en general". **Lineal** per a dades xicotetes o desordenades; **binària** per a dades grans i ordenades amb moltes cerques. El context decidix.

---

## 🕵️ Qui Soc?

Endevina quin concepte de la unitat soc:

1. **Soc una recepta de cuina per a l'ordinador: finita, precisa i sense ambigüitats.**
2. **Recórrec l'array element per element fins a trobar l'objectiu. No exigisc ordre, però soc lenta amb dades grans.**
3. **Obric el diccionari per la meitat i descarte mitja tona de paper en cada intent. Exigisc ordre, o et torne escombraria sense avisar.**
4. **Soc el patós de l'ordenació: compare veïns i intercanvie, una vegada i una altra, fins que els grans pugen com bombolles.**
5. **Ordene com en el pòquer: col·loque cada carta nova en el seu lloc dins de la mà que ja tinc ordenada.**
6. **No mesure segons: mesure com creix el temps quan creixen les dades.**

<details>
<summary>🔄 Respostes</summary>

1. **L'algoritme** — seqüència finita, precisa i sense ambigüitat de passos.
2. **La cerca lineal** — O(n), no exigix ordre.
3. **La cerca binària** — O(log n), exigix array ordenat.
4. **L'ordenació bombolla** — intercanvia veïns, O(n²).
5. **L'ordenació per inserció** — col·loca cada element en el seu lloc, O(n²) amb O(n) en quasi ordenats.
6. **La notació Big O** — descriu la taxa de creixement del temps d'execució.

</details>

---

## 🤬 CONRAD VS EL MÓN: "L'algoritme que no s'acaba"

> *CONRAD, el nostre compilador cascarrabutxes, opina sobre el clàssic del novell.*

**CONRAD:** — UNA ALTRA VEGADA! Ve un alumne i em diu: *CONRAD, la meua cerca binària es queda penjada*. I jo: val, què té el bucle? *Pues no ho sé, no l'he mirat.* AI, MARE MEUA! Un `while (esquerra <= dreta)` que en lloc d'`esquerra = mig + 1` posa `esquerra = mig`... saps què passa? El segment no es reduïx. `esquerra` es queda atascada i el bucle dona voltes com un gat perseguint-se la cua. Ensenyant-li l'algoritme a un robot aspirador amb direcció pròpia.

*I després està el de la bombolla:* `for (int j = 0; j < array.length; j++)` i dins `array[j + 1]`. DE VERITAT? Quan `j` arriba al final, `j + 1` ix de l'array. A què esperes, que et llance l'`ArrayIndexOutOfBoundsException` per a llegir el missatge? El missatge ja t'està dient l'índex, la línia i el motiu. LLEGIX-LO.

*I el clàssic:* *el meu algoritme ordena però molt a poc a poc*. Ja. I què vas usar? *Bombolla*. Amb un array de mig milió. Saps quants intercanvis són? Els que són. I no és culpa de l'algoritme, que avisa en l'etiqueta: "O(n²), per a arrays xicotets". L'algoritme no té la culpa que no llegires l'etiqueta.

**La lliçó:** els bucles dels algoritmes es pengen per dos motius: o la condició mai no avança cap a `false`, o l'índex ix de l'array. Abans de plorar sobre el teclat, comprova eixes dos coses. El 90% dels "algoritmes penjats" s'arreglen amb un cop d'ull.

---

## 🎮 El Joc de les Decisions

Tria la resposta correcta per a cada decisió (respostes al final):

1. Quina és la complexitat de la cerca binària?
   - a) O(n)   b) O(log n)   c) O(1)
2. Quants passos màxims necessita la cerca binària per a un array de 1.024 elements?
   - a) 10   b) 1.024   c) 11
3. Què retorna `buscar(new int[]{}, 5)` amb una cerca binària ben feta?
   - a) `-1`   b) `0`   c) `Exception`
4. Quina d'estes és O(n²)?
   - a) Un bucle seqüencial   b) Dos bucles anidats   c) Accedir a `array[0]`

<details>
<summary>🔄 Solucions</summary>

1. **b)** — O(log n): descartar la meitat en cada pas.
2. **a)** — 10 passos: log₂(1.024) = 10.
3. **a)** — `-1`: el bucle ni tan sols entra (0 <= -1 és `false`) i retorna el "no trobat".
4. **b)** — Dos bucles anidats multipliquen: n × n.

</details>

---

## ⚡ Laboratori de Tortura: la màquina que no ordena

> **Durada estimada:** 30 minuts
> **Eina:** el teu IDE i un fitxer nou

**L'escenari:** copia este programa i fes que funcione. Té **3 errors** que impedixen que compile o que falle en execució, i 1 error de lògica que fa que el resultat siga incorrecte quan el arregles.

```java
public class Tortura
    public static void main(String[] args) {
        int[] dades = {3, 1, 4, 2};
        for (int i = 0; i < dades.length; i++) {
            for (int j = 0; j < dades.length; j++) {
                if (dades[j] < dades[j + 1]) {
                    int temp = dades[j];
                    dades[j] = dades[j + 1];
                    dades[j + 1] = temp;
                }
            }
        }
        for (int n : dades) System.out.print(n + " ")
    }
}
```

**Fallada intencionada:** un dels errors sembla correcte a simple vista perquè "es veu bé", però fa que el programa falle en execució tan bon punt arranca.

**La teua tasca:** aconseguir que compile, que execute i que imprimisca `1 2 3 4`. Si el resultat no quadra, diagnostica.

**Pistes per quan et frustres (no abans):**

1. Hi ha algun `;` que falte? *no → seguix buscant.*
   <details><summary>I si encara estic atascat?</summary>Comprova també les claus `{}`: la classe necessita la seua obertura, i l'últim `for` necessita el seu `;`.</details>
2. Compila ja? *no → mira el missatge d'error.*
   <details><summary>I si encara estic atascat?</summary>La classe `Tortura` necessita `{` d'obertura.</details>
3. Compila però explota en executar? *És l'error d'índexs: el bucle interior arriba massa lluny.*
   <details><summary>I si encara estic atascat?</summary>`j < dades.length` accedix a `dades[j + 1]` fora de l'array. Ha de ser `j < dades.length - 1 - i` (i l'exterior `i < dades.length - 1`).</details>
4. Executa i imprimix `4 3 2 1`? *És l'error de lògica: el signe de la comparació ordena al revés.*
   <details><summary>Solució final</summary>

Els **3 errors** que impedixen compilar o executar:

1. Falta la `{` d'obertura de la classe després de `Tortura`.
2. Falta el `;` al final de `System.out.print(n + " ")`.
3. `j < dades.length` accedix a `dades[j + 1]` fora de l'array: `ArrayIndexOutOfBoundsException`. Ha de ser `j < dades.length - 1 - i`.

L'**error de lògica**: `dades[j] < dades[j + 1]` ordena **de major a menor**. Compila i executa perfectament, però imprimix `4 3 2 1` en lloc de `1 2 3 4`. La bombolla puja el major cap al final comparant amb `>`, no amb `<`.

```java
public class Tortura {
    public static void main(String[] args) {
        int[] dades = {3, 1, 4, 2};
        for (int i = 0; i < dades.length - 1; i++) {
            for (int j = 0; j < dades.length - 1 - i; j++) {
                if (dades[j] > dades[j + 1]) {
                    int temp = dades[j];
                    dades[j] = dades[j + 1];
                    dades[j + 1] = temp;
                }
            }
        }
        for (int n : dades) System.out.print(n + " ");
    }
}
```

Eixida correcta: `1 2 3 4`. Amb la versió trencada, una vegada arreglats els altres errors, la comparació `<` donava `4 3 2 1`: el signe era la pista de l'error de lògica.

</details>

---

## 🏆 Assoliments d'esta unitat

| Assoliment | Com aconseguir-lo |
|---|---|
| 🏅 **El Receptari Humà** | Explicar què és un algoritme i les seues 5 propietats sense mirar |
| 🏅 **El Cercador Jedi** | Escriure cerca binària a mà i que funcione a la primera |
| 🏅 **El Crupier** | Explicar la inserció amb l'analogia de les cartes, sense mirar |
| 🏅 **L'Analista** | Calcular Big O d'un fragment de codi en menys d'un minut |
| 🏅 **El Cap de Magatzem** | Triar l'algoritme correcte per a cada escenari del punt 7 |
| 🏅 **El Caçador d'Errors** | Trobar els 3+1 errors del Laboratori sense usar les pistes |

---

## 🧠 Atreveix-te a Pensar

1. **Sense executar:** què imprimix este programa?

```java
public class Misteri2 {
    public static void main(String[] args) {
        int[] dades = {2, 4, 6, 8};
        int comptador = 0;

        for (int i = 0; i < dades.length; i++) {
            for (int j = i + 1; j < dades.length; j++) {
                if (dades[i] < dades[j]) {
                    comptador++;
                }
            }
        }
        System.out.println(comptador);
    }
}
```

2. **La còpia que es desordena:** què li passa a la bombolla si en lloc de comparar `>` compares `>=`? Afecta l'estabilitat de l'algoritme?
3. **El detectiu:** la teua cerca binària retorna `-1` per a un nombre que SÍ és en l'array. Quina ferramenta uses i quines variables mires primer?
4. **Vertader o fals:** "la cerca binària funciona amb qualsevol array, només que a vegades és més lenta".

<details>
<summary>💡 Solucions</summary>

1. Imprimix **`6`**. El bucle doble compta les parelles `(i, j)` amb `i < j` on `dades[i] < dades[j]`. Amb `{2,4,6,8}` totes les parelles complixen: 4 · 3 / 2 = 6.
2. Amb `>=` la bombolla seguiria ordenant, però **romp l'estabilitat**: dos elements iguals podrien intercanviar-se, canviant el seu ordre relatiu. La versió amb `>` (estricte) manté l'ordre dels iguals.
3. El **depurador**: posa un breakpoint en el `while` i observa `esquerra`, `dreta` i `mig` en cada volta. Si `dreta` mai no baixa o `esquerra` no avança amb `mig + 1`, eixe és el fall. El clàssic off-by-one.
4. **Fals.** Amb un array desordenat no és que siga lenta: retorna **resultats incorrectes sense avisar**. No hi ha error, hi ha escombraria silenciosa.

</details>

---

## 🧩 Crucigrama de Bits

```
Horitzontal:
1. Notació que mesura com creix el temps (3 lletres + espai + 1 lletra: "O" més una altra lletra)
3. La complexitat de la cerca binària (comença per "log")
5. Algoritme que intercanvia veïns fins a ordenar (8 lletres)
6. Seqüència finita i precisa de passos (9 lletres)

Vertical:
2. Senyal de "no trobat" que retornen les cerques (2 lletres)
4. Algoritme que col·loca cada carta en el seu lloc (9 lletres)
```

<details>
<summary>📝 Solucions</summary>

**Horitzontal:** 1. BIGO · 3. LOG · 5. BOMBOLLA · 6. ALGORITME
**Vertical:** 2. MENYS (el -1) · 4. INSERCIÓ

</details>

---

## 💬 Preguntes d'Entrevista de Treball

> Preguntes reals que et farien per a programador Java júnior.

1. **"Explica'm, com si jo fóra la teua àvia, la diferència entre cerca lineal i cerca binària."**
2. **"Què és la notació Big O i per què és important?"**
3. **"Escriu una cerca binària en la pissarra. Ara digues-me què passa si l'array no està ordenat."**
4. **"Quan usaries l'ordenació per inserció en comptes de la bombolla?"**
5. **"Què és l'off-by-one i com l'evites en la cerca binària?"**
6. **"Un algoritme O(n²) tarda 1 segon amb 1.000 elements. Quant tardarà amb 2.000? I amb 10.000?"**

---

## 🤷 No hi ha preguntes tontes

> ❓ **Puc usar `Arrays.sort()` i `Arrays.binarySearch()` de Java en comptes d'escriure els algoritmes?**

En els teus programes reals, sí: Java porta utilitats ordenades, eficients i provades, i veuràs `Arrays.sort()` prompte. Però en esta unitat l'objectiu és **entendre la idea** que hi ha davall. És com aprendre a fer una suma a mà abans d'usar la calculadora: no és que la calculadora siga dolenta, és que necessites saber què estàs fent. I en una entrevista, l'entrevistador vol vore que ho entens, no que saps importar `java.util.Arrays`.

---

> ❓ **Per què cal dir "log n" i no simplement "pocs passos"?**

Perquè "pocs passos" no servix per a comparar: pocs comparat amb què. El logaritme en base 2 et diu exactament **quantes vegades pots partir per la meitat** abans d'arribar a 1. I quan algú et diu "és O(log n)", tu saps exactament què significa. La precisió és el sou del programador.

---

> ❓ **Si bombolla i inserció són totes dos O(n²), per què es diu que la inserció és millor?**

Per dos motius: en el **cas mitjà** fa menys intercanvis (desplaça, no intercanvia de tres en tres), i en **arrays quasi ordenats** és O(n) de veritat, mentre que la bombolla sense flag continua fent passades senceres. En la pràctica, amb arrays xicotets, la inserció nota la diferència. Amb arrays grans, cap de les dos: ací arriba la U05.

---

## 🎬 Post-Crèdits

El programador acaba el seu catàleg: ordena les notes amb inserció, i quan un client pregunta per la seua nota, respon amb cerca binària en un parpelleig. Està content. S'acosta CONRAD, el compilador cascarrabutxes, amb la seua tassa humejant.

**CONRAD:** — Oi, no està mal. Inserció per a ordenar, binària per a buscar... I a més saps dir-me per què no vas usar la bombolla per al milió de dades. Segur que eres el mateix que va començar esta unitat amb el "posa sal al gust"?

**Novell:** — *somriu* Vaig començar amb una recepta de truita i he acabat ordenant el catàleg en 20 passos. I ara què?

**CONRAD:** — *fa un glop* Tot això és l'escalfament. Bombolla, inserció, lineal, binària... són els fonaments. El següent nivell usa tècniques que partixen els problemes en trossos, es criden a si mateixes i ordenen arrays d'un milió en un sospir. Un altre tipus de bèsties.

El novell guarda el seu projecte, tanca l'IDE i sent que ja no busca ni ordena: **pensa en termes d'algoritmes**.

**PRÒXIMAMENT EN U05:** Algorítmica II: Tècniques. Divideix i venç, QuickSort, MergeSort i recursivitat. El moment en què ordenar un milió de dades deixa de ser una utopia. ⚡

---

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/04-algoritmica-fundamentos) · **Anterior:** [08 · Be the Code: cerca binària des de zero](/ApuntesProgramacion/va/04-algoritmica-fundamentos/08-be-the-code) · **Següent:** **[U05 · Algorítmica II: Tècniques](/ApuntesProgramacion/va/05-algoritmica-tecnicas)**
