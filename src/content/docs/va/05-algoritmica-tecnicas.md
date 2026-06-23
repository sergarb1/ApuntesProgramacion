---
title: "Unidad 5: Algorítmica II — Técnicas Avanzadas"
---

Benvingut, valent explorador de la pila de llamades. Fins ara has sobreviscut a arrays, bucles, objectes i condicions. Has dominat l'art de fer que l'ordinador faça el que li dius. Però el bosc s'enfosqueix. Ha arribat l'hora d'enfrontar-te als algorismes que **canvien la teua forma de pensar** (i de pas, et fan quedar genial en les entrevistes tècniques de Google, que mai se sap).

En esta unitat deixarem arrere els bucles obvis i ens endinsem en la **recursivitat** i **dividix i venceràs**. No tingues por. Respira fondo. I recorda: per a entendre la recursivitat, primer has d'entendre la recursivitat.

Anem allà.

---

## 1. Recursivitat: una funció que es crida a si mateixa (sense tornar-se boja)

La recursivitat és quan una funció s'invoca a si mateixa. Sí, sona a bucle infinit i a mal de cap. Però amb una **condició de parada** ben posada, és una de les ferramentes més elegants i potents que existixen en programació.

Pensa-ho així: en lloc de resoldre el problema sencer de colp, resols una xicoteta part i li passes la resta a... tu mateix. Com quan neteges la teua habitació: agarras una cosa del sòl i després tornes a cridar a la mateixa funció "limpiarHabitacion" amb el que queda. Eventualment no queda res, i has acabat.

### Les dos cares de la moneda recursiva

> [!NOTE]
> Tota funció recursiva necessita **dos parts** imprescindibles. Si et falta una, estàs mort:
> - **Cas base**: la condició que deté la recursió. Sense això, el teu programa s'executa fins que la JVM es cansa i et llança un `StackOverflowError`.
> - **Cas recursiu**: la crida a si mateixa, normalment amb una versió més xicoteta del mateix problema.

L'estructura general és sempre la mateixa:

```java
public static tipo funcion(parametros) {
    if (/* condicion de parada */) {
        return /* valor base */;
    } else {
        // hacer algo
        return funcion(/* version mas pequena */);
    }
}
```

### La pila de llamades (call stack) — l'origen de tota la diversió

Cada volta que una funció es crida, Java reserva un trocet de memòria en el **stack** (la pila). Eixe trocet es diu **stack frame** i guarda: els paràmetres de la funció, les variables locals, i la direcció de tornada per a quan la funció acabe.

Si crides a una funció 5 voltes, tens 5 frames en el stack. Si la crides 10.000 voltes... bum. `StackOverflowError`.

```java
public class StackExplorer {

    static int prof = 0;

    static void recursivo() {
        prof++;
        System.out.println("Llamada numero: " + prof);
        recursivo(); // ¡no hay caso base!
    }

    public static void main(String[] args) {
        try {
            recursivo();
        } catch (StackOverflowError e) {
            System.out.println("Stack explotó en la llamada: " + prof);
        }
    }
}
```

Prova-ho. Veuràs que el número varia segons la teua màquina i la JVM. Normalment entre 10.000 i 20.000 crides. No és infinit. Res ho és.

> [!WARNING]
> Sense cas base, no hi ha pietat. El stack té un límit i Java no et va a salvar. Cada frame ocupa espai, i quan el got es desborda, la JVM diu "fins ací hem arribat".

### Recursivitat vs iteració: el duel

| Aspecte | Recursivitat | Iteració (bucles) |
|---|---|---|
| Llegibilitat | Molt elegant per a problemes jeràrquics | Més verbosa però clara |
| Memòria | Gasta stack (cada crida = frame nou) | Només variables locals |
| Velocitat | Més lenta (overhead de crides) | Més ràpida |
| Stack overflow | Risc real si profunditat és alta | No aplica |
| Casos ideals | Arbres, grafs, backtracking, dividix i venceràs | Recorreguts lineals, processament simple |

La regla d'or: **usa recursivitat quan el problema siga inherentment recursiu** (arbres, expressions anidades, algorismes d'ordenació avançats). Per a la resta, un `for` de tota la vida.

---

## 2. Exemples clàssics (els clàssics per alguna cosa ho són)

Anem a vore tres exemples que et perseguiran la resta de la teua carrera. Acostuma-t'hi. Apareixen en exàmens, entrevistes, i conversacions d'ascensor amb altres programadors.

### 2.1. Factorial — el "Hello World" de la recursivitat

```java
public class Factorial {

    static int fact(int n) {
        if (n <= 1) return 1;          // caso base
        return n * fact(n - 1);        // caso recursivo
    }

    public static void main(String[] args) {
        System.out.println("fact(5) = " + fact(5));   // 120
        System.out.println("fact(0) = " + fact(0));   // 1
        System.out.println("fact(7) = " + fact(7));   // 5040
    }
}
```

Què passa quan cridem a `fact(4)`? Pas a pas:

```
fact(4) → 4 * fact(3)
       → 4 * (3 * fact(2))
       → 4 * (3 * (2 * fact(1)))
       → 4 * (3 * (2 * 1))
       → 4 * (3 * 2)
       → 4 * 6
       → 24
```

Primer "baixa" fins al cas base, després "puja" fent les multiplicacions. Com un ascensor que baixa al soterrani i torna a pujar obrint portes.

### 2.2. Fibonacci (versió ingènua — no faces això a casa)

```java
public class FiboNaive {

    static long fibo(int n) {
        if (n <= 1) return n;
        return fibo(n - 1) + fibo(n - 2);
    }

    public static void main(String[] args) {
        long inicio = System.currentTimeMillis();
        System.out.println("fibo(40) = " + fibo(40));
        long fin = System.currentTimeMillis();
        System.out.println("Tiempo: " + (fin - inicio) + " ms");
    }
}
```

Executa això. Seran uns segons d'infern. El problema? `fibo(40)` genera un **arbre de crides monstruós**. Cada crida es bifurca en dos, que es bifurquen en dos, etc. El número total de crides és aproximadament O(2ⁿ).

```
                         fibo(5)
                        /       \
                  fibo(4)       fibo(3)
                 /       \      /     \
           fibo(3)    fibo(2) fibo(2) fibo(1)
           /    \      /   \   /   \
      fibo(2) fibo(1) ...  ... ...  ...
      /    \
 fibo(1) fibo(0)
```

Compta les voltes que es crida a `fib(1)`. Exacte, massa. És com preguntar-li al teu company una i altra volta la mateixa pregunta esperant una resposta diferent. Això, senyor meu, és bogeria.

> [!TIP]
> Este és l'exemple perfecte per a entendre per què **l'eficiència importa**. Un algorisme que es veu bonic en codi pot ser un desastre en temps d'execució. Fibonacci naive és el rei dels algorismes bonics però inútils per a números grans.

### 2.3. Fibonacci optimitzat (amb memoització — ara sí)

```java
public class FiboOptimizado {

    static long[] memo;

    static long fibo(int n) {
        if (n <= 1) return n;
        if (memo[n] != 0) return memo[n];      // ya lo calculamos antes
        memo[n] = fibo(n - 1) + fibo(n - 2);
        return memo[n];
    }

    public static void main(String[] args) {
        int n = 92;
        memo = new long[n + 1];
        long inicio = System.currentTimeMillis();
        System.out.println("fibo(" + n + ") = " + fibo(n)); // instantáneo
        long fin = System.currentTimeMillis();
        System.out.println("Tiempo: " + (fin - inicio) + " ms");
    }
}
```

Què canvia? Guardem els resultats en un array (`memo[]`) per a no recalcular. Si ja hem calculat `fib(10)`, el tornem directament. Cada fibonacci es calcula **una sola volta**.

La millora és brutal: de **O(2ⁿ) a O(n)**. Eixa és la major pujada de nivell des que vas passar de pedra a pokéball.

> [!NOTE]
> Això es diu **memoització** (sí, sense la "r"). És la base de la programació dinàmica, que veuràs en unitats més avançades. Consistix en: "si ja ho vaig calcular, no ho torne a calcular, ho guarde en un mapa o array i ho reutilice".

### 2.4. Suma d'un array

```java
public class SumArray {

    static int sumar(int[] arr, int i) {
        if (i == arr.length) return 0;              // caso base: no hay más elementos
        return arr[i] + sumar(arr, i + 1);           // caso recursivo
    }

    public static void main(String[] args) {
        int[] nums = {3, 8, 2, 10, 5};
        System.out.println("Suma: " + sumar(nums, 0)); // 28

        int[] vacio = {};
        System.out.println("Suma vacia: " + sumar(vacio, 0)); // 0
    }
}
```

Este exemple és quasi idèntic al factorial, però recorrent un array. L'índex `i` avança fins a arribar a `arr.length`. En eixe moment, tornem 0 i comencem a sumar cap amunt.

> [!TIP]
> Pensat en la recursivitat com si pelares una ceba. Llevat una capa (un element), i el que queda és el mateix problema però més xicotet. Eventualment no queda ceba.

---

## 3. Dividix i venceràs (Divide & Conquer)

L'estratègia és tan antiga com Juli Cèsar, però aplicada a algorismes continua sent igual d'efectiva. El principi és senzill:

1. **Dividir** el problema en subproblemes més xicotets i manejables.
2. **Conquistar** cada subproblema recursivament (crides recursives).
3. **Combinar** les solucions dels subproblemes per a obtindre la solució del problema original.

```
Input gran
     │
     ├──Dividir──→ Subproblema A    → Conquistar (recursiu) → Combinar ──→ Output
     └──Dividir──→ Subproblema B    → Conquistar (recursiu) ──┘
```

 Els dos reis indiscutibles d'esta tècnica són els algorismes d'ordenació més famosos del món: **Quicksort** i **Mergesort**. Mereixen secció pròpia. I corbata.

---

## 4. Quicksort — el ràpid (quan li eix bé)

Creat per Tony Hoare en 1959. Sí, té més anys que els teus pares. I continua sent l'algorisme d'ordenació més usat del món. Per alguna cosa serà.

### Com funciona

1. Triem un **pivot** (un element de l'array).
2. Col·loquem tots els elements **menors** que el pivot a la seua esquerra, i els **majors** a la seua dreta. Això es diu **particionar**.
3. Apliquem el mateix procés recursivament a les dos meitats (esquerra i dreta del pivot).

Quan l'array té 0 o 1 elements... ja està ordenat. Cas base.

### Implementació

```java
public class Quicksort {

    static void qs(int[] arr, int izq, int der) {
        if (izq >= der) return;   // caso base: 0 o 1 elementos

        int pivote = arr[(izq + der) / 2];  // elegimos el del medio
        int i = izq, j = der;

        // partición
        while (i <= j) {
            while (arr[i] < pivote) i++;
            while (arr[j] > pivote) j--;
            if (i <= j) {
                int tmp = arr[i];
                arr[i] = arr[j];
                arr[j] = tmp;
                i++;
                j--;
            }
        }

        // llamadas recursivas a cada mitad
        qs(arr, izq, j);
        qs(arr, i, der);
    }

    public static void main(String[] args) {
        int[] datos = {9, 3, 7, 1, 8, 2, 6, 4, 5};
        qs(datos, 0, datos.length - 1);
        System.out.println(java.util.Arrays.toString(datos));
    }
}
```

**Execució pas a pas** amb `{3, 1, 4, 1, 5, 9, 2, 6}`:

```
Array inicial:  [3, 1, 4, 1, 5, 9, 2, 6]
Pivote = 5 (posición media)
Posiciones i=0, j=7

1. i avanza hasta encontrar 9 (≥5), j retrocede hasta encontrar 2 (≤5)
2. Intercambiamos 9 y 2 → [3, 1, 4, 1, 5, 2, 9, 6]
3. i=5, j=4 → i > j, terminamos partición
4. Llamada recursiva izquierda: [3, 1, 4, 1, 5, 2]
5. Llamada recursiva derecha: [9, 6]
...
```

> [!TIP]
> El secret de Quicksort està en la partició. Si aconseguixes que els elements es repartisquen més o menys equilibradament, l'algorisme vola. Si no... prepara els O(n²).

### Elecció del pivot

| Estratègia | Avantatge | Desavantatge |
|---|---|---|
| Primer element | Simple | Pèssim si array ja ordenat |
| Últim element | Simple | Pèssim si array ja ordenat |
| Element central | Millor equilibri | Seguix tenint casos dolents |
| Mediana de tres (primer, mig, últim) | Molt robust | Un poc més de càlcul |
| Aleatori | Evita el cas pitjor en la pràctica | Aleatorietat no determinista |

### Complexitat

- **Cas mitjà**: O(n log n) — quasi sempre.
- **Millor cas**: O(n log n) — quan el pivot dividix sempre en meitats iguals.
- **Pitjor cas**: O(n²) — quan l'array ja està ordenat i tries el primer o últim pivot.

> [!WARNING]
> Si tries sempre el primer element com a pivot i l'array ja està ordenat, Quicksort es torna més lent que una tortuga amb ressaca. O(n²). Literalment pitjor que un `for` anidat cutre.

### És estable?

**No**. Durant la partició, dos elements iguals poden intercanviar-se de posició. Si necessites estabilitat (ordre original d'elements iguals), millor usa Mergesort.

---

## 5. Mergesort — el fiable (sempre complix el que promet)

Creat per John von Neumann en 1945. Sí, el mateix de l'arquitectura d'ordinadors. El tio no parava.

### Com funciona

1. **Dividir** l'array en dos meitats (per la meitat exactament, no cal triar pivot).
2. **Ordenar** cada meitat recursivament.
3. **Fusionar** (merge) les dos meitats ordenades en un únic array ordenat.

```
[7, 3, 9, 1, 8, 2, 6, 4]
         │
    ┌────┴────┐
 [7, 3, 9, 1] [8, 2, 6, 4]
    │            │
  ┌──┴──┐      ┌──┴──┐
 [7, 3] [9, 1] [8, 2] [6, 4]
   │      │      │      │
 ┌─┴─┐  ┌─┴─┐  ┌─┴─┐  ┌─┴─┐
 [7] [3] [9] [1] [8] [2] [6] [4]   ← cas base
   │      │      │      │
 └─┬─┘  └─┬─┘  └─┬─┘  └─┬─┘
 [3, 7] [1, 9] [2, 8] [4, 6]       ← fusionar
    │            │
  ┌──┴──┐      ┌──┴──┐
 [1, 3, 7, 9] [2, 4, 6, 8]          ← fusionar
    │            │
  ┌──┴────────────┘
 [1, 2, 3, 4, 6, 7, 8, 9]          ← fusionar
```

### Implementació

```java
public class Mergesort {

    static void ms(int[] arr, int izq, int der) {
        if (izq >= der) return;  // caso base

        int mid = (izq + der) / 2;
        ms(arr, izq, mid);                   // ordenar mitad izquierda
        ms(arr, mid + 1, der);               // ordenar mitad derecha
        fusionar(arr, izq, mid, der);         // combinar las dos mitades
    }

    static void fusionar(int[] arr, int izq, int mid, int der) {
        int[] tmp = new int[der - izq + 1];
        int i = izq, j = mid + 1, k = 0;

        // Comparar elementos de las dos mitades
        while (i <= mid && j <= der)
            tmp[k++] = (arr[i] <= arr[j]) ? arr[i++] : arr[j++];

        // Copiar lo que quede de la mitad izquierda
        while (i <= mid) tmp[k++] = arr[i++];

        // Copiar lo que quede de la mitad derecha
        while (j <= der) tmp[k++] = arr[j++];

        // Copiar el array temporal al original
        System.arraycopy(tmp, 0, arr, izq, tmp.length);
    }

    public static void main(String[] args) {
        int[] datos = {9, 3, 7, 1, 8, 2, 6, 4, 5};
        ms(datos, 0, datos.length - 1);
        System.out.println(java.util.Arrays.toString(datos));
    }
}
```

### Complexitat

- **Sempre**: O(n log n). No importa com estiga l'array. Mergesort no té cas dolent.
- **Memòria**: O(n) extra per l'array temporal `tmp`. Eixe és el seu punt feble.

### És estable?

**Sí**. Quan dos elements són iguals, el de l'esquerra va primer en la fusió. Això manté l'ordre original d'elements iguals, una cosa que Quicksort no pot garantir.

> [!NOTE]
> Estabilitat no és un concepte teòric avorrit. És important quan ordenes per múltiples criteris. Per exemple, si ordenes una llista d'alumnes per nota i després per nom, vols que els que tenen la mateixa nota mantinguen l'ordre alfabètic. Mergesort t'ho dona. Quicksort et fa plorar.

---

## 6. Comparació: quan use cada un?

No hi ha un "millor algorisme" universal. Tot depend del context. Ací tens una guia pràctica per a prendre decisions:

| Situació | Tria |
|---|---|
| Array xicotet (< 50 elements) | Dona igual, usa `Arrays.sort()` |
| Array gran amb dades a l'atzar | **Quicksort** (anirà genial en mitjana) |
| Array gran, quasi ordenat o amb molts duplicats | **Mergesort** o Quicksort amb mediana de tres |
| Necessites estabilitat (ordre relatiu) | **Mergesort** |
| La memòria és justa (sistema encastat, mòbil) | **Quicksort** (O(log n) vs O(n)) |
| No et paguen per pensar | `Arrays.sort()` i a seguir amb la teua vida |
| L'array és enorme i les dades estan en disc | Mergesort extern (s'usa en bases de dades) |

En Java, `Arrays.sort()` per a tipus primitius usa **Dual-Pivot Quicksort** (una versió millorada amb dos pivots). Per a objectes usa **TimSort** (una mescla de Mergesort i Insertion Sort). Per alguna cosa Will Smith no canta sobre algorismes d'ordenació.

### Rendiment en la pràctica

| Algorisme | n=10 | n=100 | n=1.000 | n=10.000 | n=100.000 | n=1.000.000 |
|---|---|---|---|---|---|---|
| Quicksort | ~0 ms | ~0 ms | ~0 ms | ~1 ms | ~15 ms | ~120 ms |
| Mergesort | ~0 ms | ~0 ms | ~0 ms | ~2 ms | ~20 ms | ~150 ms |
| Burbuja (per a plorar) | ~0 ms | ~1 ms | ~100 ms | ~10.000 ms | no esperes |

> [!WARNING]
> Mai, baix cap concepte, uses Burbuja (Bubble Sort) en producció. És O(n²), lent, i els teus companys t'odiaràn. És com usar un caragol per a repartir pizzes. Existix, però no hauria.

---

## 7. ⭐ BE THE CODE, MY FRIEND: implementa Quicksort des de zero

> 🕶️ **Don Tip:** Dividix i venceràs: tria un pivot, partix l'array en menors i majors, i repetix recursivament. Si domines eixe patró, Quicksort és teu.

Tanca esta pàgina. Obri un editor de text en blanc. No miris ni una línia del que has llegit fins ara.

Escriu Quicksort des de zero. La firma del mètode ha de ser:

```java
static void quicksort(int[] arr, int inicio, int fin)
```

Quan acabes, dona-li un ull al teu codi i compara'l amb el d'esta unitat.

**Nivells d'assoliment:**

- ⭐ Ho tens, però has hagut de mirar el codi una volta. Aprovat raspadet.
- ⭐⭐ T'ha eixit a la primera i funciona. Eres una màquina.
- ⭐⭐⭐ T'ha eixit a la primera, sense errors d'off-by-one, i a més has triat mediana de tres com a pivot. No necessites este curs. Vés a donar una xarrada TED.

> [!TIP]
> Pista mental gratuïta: necessites tres coses — triar un pivot, partir l'array en dos zones (menors i majors), i cridar recursivament a cada costat. Si memoritzes eixe patró, Quicksort és teu per a sempre.

---

## 8. No Hi Ha Preguntes Tontes!

### La recursivitat és més lenta que un bucle?

Quasi sempre, sí. Cada crida recursiva afig overhead: crear un stack frame, guardar variables, calcular direcció de retorn, etc. Per a operacions simples com sumar un array, un `for` sempre guanya. **Però** hi ha problemes que s'expressen de forma molt més natural amb recursivitat: arbres, expressió de paréntesis anidats, recorregut de laberints, backtracking. La regla és: usa bucles per a lo simple, recursivitat per a lo complex.

### Què és exactament un StackOverflowError?

El **call stack** és una regió de memòria on la JVM guarda informació de cada crida a funció. Cada crida ocupa un espai (stack frame) que conté: paràmetres, variables locals, i la direcció de retorn.

Quan fas massa crides recursives (o una recursió infinita), el stack s'ompli. La següent crida ya no cap. La JVM diu "no puc més" i et llança un `StackOverflowError`.

És com omplir un got d'aigua: cada gota és una crida. Arriba un punt en què una gota més ho desborda tot.

```
Stack memòria:
┌──────────────────────┐
│ main()               │  ← frame 1
├──────────────────────┤
│ recursivo() n=1      │  ← frame 2
├──────────────────────┤
│ recursivo() n=2      │  ← frame 3
├──────────────────────┤
│ ...                  │  ← ...
├──────────────────────┤
│ recursivo() n=10000  │  ← ¡BUM! Stack Overflow
└──────────────────────┘
```

### Què és tail recursion? Java l'optimitza?

**Tail recursion** (recursió de cua) és quan la crida recursiva és la **última operació** que realitza la funció. No hi ha cap operació pendent després de la crida.

```java
// Sin tail recursion — hay una multiplicación pendiente
static int factNormal(int n) {
    if (n <= 1) return 1;
    return n * factNormal(n - 1);  // la multiplicación espera a que vuelva
}

// Con tail recursion — la llamada es lo último
static int factTail(int n, int acum) {
    if (n <= 1) return acum;
    return factTail(n - 1, n * acum);  // nada pendiente después
}
```

En llenguatges funcionals com Scala, Haskell o Scheme, el compilador detecta tail recursion i la convertix en un bucle internament (no gasta stack). **Java no fa això**. Ni ara ni en el futur previsible. Si crides a `factTail(10000, 1)` en Java, explota igual.

> [!NOTE]
> Encara que Java no optimitze tail recursion, escriure funcions amb tail recursion és un bon hàbit: clarifica la teua intenció, és més fàcil de llegir, i si algun dia uses un llenguatge que sí ho faça, ya ho domines.

### Puc usar recursivitat sense saber-ho?

Sí, constantment. Cada volta que crides a `Arrays.sort()`, estàs usant Quicksort o Mergesort recursiu per davall. Quan recorres un sistema de fitxers amb `File.listFiles()`, la JVM pot usar recursivitat internament. La recursivitat no és una característica exòtica: és el pa de cada dia de la computació.

### I si la meua recursivitat explota el stack? Què faig?

Tens diverses opcions:
1. **Augmentar la grandària del stack** de la JVM: `java -Xss2m MiPrograma` (a 2 MB).
2. **Convertir a iteratiu** (usa una pila explícita amb un `Stack<T>` o `Deque<T>`).
3. **Usar una tècnica diferent** que no requerisca tanta profunditat.
4. **Acceptar la derrota** i buscar un altre treball. (No, és broma. Fes l'opció 1 o 2).

### Dividir i venceràs només servix per a ordenar arrays?

Per a res. És un dels paradigmes més universals de la computació. Ací tens aplicacions famoses:

- **Cerca binària**: partix un array ordenat per la meitat i busca en el costat correcte. O(log n).
- **Multiplicació de matrius (Strassen)**: dividix matrius grans en submatrius. O(n²·⁸⁰⁷) en lloc de O(n³).
- **Transformada Ràpida de Fourier (FFT)**: dividix senyals digitals en freqüències. Base del JPEG, MP3, WiFi.
- **Convex Hull**: troba el polígon convex mínim que conté un conjunt de punts.
- **Algorisme de Karatsuba**: multiplica números grans més ràpid que el mètode tradicional.

Una volta entens Dividir i Venceràs, comences a vore patrons per tot arreu. És com quan aprens una paraula nova i de sobte la veus per tot arreu.

### 🔮 L'ENIGMA

Estàs en un laberint amb 3 interruptors. Cadascun controla una bombeta en una habitació tancada. Només pots entrar a l'habitació UNA vegada. Com esbrines quin interruptor encén quina bombeta?

Pista: les bombetes no sols s'encenen, també es calfen.

> 🕶️ **Don Tip:** Si una bombeta ha estat encesa molt de temps, estarà calenta encara que l'apagues. Utilitza-ho al teu favor.

---

## Resum de la unitat

| Concepte | Clau |
|---|---|
| Recursivitat | Cas base + cas recursiu. Sense cas base = StackOverflowError |
| Factorial | O(n). L'exemple canònic de recursivitat lineal |
| Fibonacci naive | O(2ⁿ). No ho uses per a res seriós |
| Fibonacci optimitzat | O(n) amb memoització. La diferència entre lent i ràpid |
| Dividir i venceràs | Dividir, conquistar, combinar. Paradigma universal |
| Quicksort | O(n log n) mitjana, O(n²) pitjor, inestable. El més ràpid en la pràctica |
| Mergesort | O(n log n) sempre, estable, O(n) memòria extra. El més fiable |
| Partició | El cor de Quicksort. Com repartir elements al voltant del pivot |
| Fusió | El cor de Mergesort. Com combinar dos arrays ordenats |
| Estabilitat | Mergesort la manté, Quicksort no. Important per a ordenacions multi-criteri |
| Tail recursion | Quan la crida recursiva és l'últim. Java no l'optimitza |
| Stack overflow | El límit del call stack. Cada crida costa memòria |

> [!NOTE]
> Esta unitat cobrix els RA2 (ús d'estructures de control avançades incloent recursivitat) i RA6 (aplicació d'algorismes d'ordenació, anàlisi de complexitat i elecció justificada de l'algorisme segons el context). Efectivament, la programació no és només escriure codi que funcione: és pensar en **com** fer-ho eficient, triar la ferramenta adequada, i entendre què passa davall del capó.

En la següent unitat explorarem **estructures de dades avançades**: arbres, grafs i taules hash. Prepara't per a dibuixar fletxes i quadradets. Molts quadradets.

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
