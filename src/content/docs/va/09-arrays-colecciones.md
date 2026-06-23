---
title: "Unidad 8: Arrays y Colecciones"
nav_order: 8
---
🎯 **Objectius d'aprenentatge**
- Declarar i recórrer arrays unidimensionals i multidimensionals
- Usar el bucle for-each per a llegir col·leccions
- Elegir la col·lecció adequada segons el problema
- Utilitzar iteradors per a recórrer i modificar col·leccions
- Conéixer les diferències entre ArrayList, LinkedList, HashSet i TreeSet

## Arrays: L'Aparcament de Dades

### El Problema: Tens 100 Gats i un Sol Nom

Imagina que tens 100 gats i necessites guardar els seus noms. Podries fer això:

```java
String gato1 = "Bigotes";
String gato2 = "Garfield";
String gato3 = "Misifú";
// ... 97 líneas después ...
String gato100 = "Calcetines";
```

Però aleshores arriba el gat 101 i el teu programa es cau. O pitjor: vols saber quants gats comencen amb "M" i has d'escriure 100 `if`. L'esquena ja et fa mal només de pensar-ho.

> **⚠️ Advertència:** Si alguna volta escrius `gato1`, `gato2`, `gato3`, ... `gatoN` al teu codi, en algun lloc un programador sènior plora. Els arrays existeixen exactament per a això.

### L'Array: El Teu Primer Aparcament

Un array és com un pàrquing de diverses plantes. Cada plaça té un número (índex) i a cada plaça només caben cotxes del mateix tipus (bé, i les seues subclasses).

```java
String[] gatos = new String[100];
// Has creat un parking amb 100 places per a Strings
```

La primera plaça és la 0, no la 1. Això confon a tothom al principi. Accepta-ho.

> **💡 Consell:** Pensar en els índexs com a distàncies des de la primera posició. La primera casa està a 0 passos de tu, no a 1.

### Com Ficar Coses al Pàrquing

```java
String[] gatos = new String[3];
gatos[0] = "Bigotes";
gatos[1] = "Garfield";
gatos[2] = "Misifú";
gatos[3] = "Calcetines"; // ¡BOOM!
```

Què passa en l'última línia? T'estavellaràs.

### ¡BOOM! L'ArrayIndexOutOfBoundsException

```java
int[] numeros = new int[5];
numeros[0] = 10;
numeros[1] = 20;
numeros[2] = 30;
numeros[3] = 40;
numeros[4] = 50;
numeros[5] = 60; // Index 5 out of bounds for length 5
```

> **⚠️ Advertència:** L'array és un objecte (està al heap), però la referència està a la pila (stack). Quan passes un array a un mètode, passes la referència, no les dades. Compte! Si modifiques l'array dins del mètode, els canvis afecten a l'original.

### El Duo Inseparable: for + Array

Els arrays i els bucles `for` són com el pa i la mantega. Mai no veuràs l'un sense l'altre.

```java
String[] gatos = {"Bigotes", "Garfield", "Misifú", "Calcetines"};

for (int i = 0; i < gatos.length; i++) {
    System.out.println("Gato " + i + ": " + gatos[i]);
}
```

Fixa't: `gatos.length` NO porta parèntesis. No és un mètode, és un atribut. Els Strings usen `length()`. Els arrays usen `length`. És un parany mortal en els exàmens.

### ⭐ BE THE CODE, MY FRIEND:

> 🕶️ **Don Tip:** Els arrays tenen mida fixa. Una vegada creats, no pots afegir ni traure elements.

```java
public class BeTheArray {
    public static void main(String[] args) {
        int[] arr = new int[4];
        arr[0] = 2;
        arr[1] = 4;
        arr[2] = 6;
        arr[3] = 8;

        for (int i = 0; i < arr.length; i++) {
            arr[i] = arr[i] * 2;
        }

        System.out.println(arr[2]);
    }
}
```

> **⭐ BE THE CODE, MY FRIEND**
>
> > 🕶️ **Don Tip:** Les variables de tipus array guarden una referència, no les dades. Assignar un array a un altre no copia les dades.
>
> **Què imprimeix?**
> - (A) 6
> - (B) 8
> - (C) 12
> - (D) 16
>
> **Resposta: (C) 12.** L'array original és {2,4,6,8}. Després del bucle, cada element es multiplica per 2: {4,8,12,16}. arr[2] = 12.

### ⭐ BE THE CODE, MY FRIEND: L'Array Rebel

> 🕶️ **Don Tip:** Quan passes un array a un mètode, passes la referència. Si el modifiques dins, canvia fora.

```java
public class BeTheArrayRevelde {
    public static void main(String[] args) {
        int[] nums = {1, 2, 3, 4, 5};
        for (int i = 0; i < nums.length; i++) {
            nums[i] = nums[i] * nums[i];
        }
        System.out.println(nums[2]);
    }
}
```

> **⭐ BE THE CODE, MY FRIEND**
>
> > 🕶️ **Don Tip:** Els arrays es passen per referència. Les variables primitives es passen per valor.
>
> **Què imprimeix?**
> - (A) 3
> - (B) 6
> - (C) 9
> - (D) 25
>
> **Resposta: (C) 9.** S'eleva cada número al quadrat: {1,4,9,16,25}. nums[2] = 9.

### for-each: La Variant Peresosa

Si no necessites l'índex (només vols llegir els valors), hi ha una sintaxi més curta:

```java
String[] gatos = {"Bigotes", "Garfield", "Misifú"};

for (String gato : gatos) {
    System.out.println("Miau: " + gato);
}
```

Es llig: "per a cada String gat en gats, fes això".

> **📝 Nota:** El for-each és de només lectura. No pots modificar l'array original dins del bucle. Bé, pots intentar-ho, però el canvi es perd en l'èter.

### Arrays Multidimensionals: El Pàrquing de Diverses Plantes

Necessites una taula amb files i columnes? Usa un array bidimensional.

```java
int[][] tabla = new int[3][4]; // 3 files, 4 columnes
tabla[0][0] = 1; // fila 0, columna 0
tabla[1][2] = 5; // fila 1, columna 2
// ...
```

Java també permet "arrays d'arrays" irregulars (cada fila amb diferent nombre de columnes):

```java
int[][] irregular = new int[3][];
irregular[0] = new int[2];
irregular[1] = new int[5];
irregular[2] = new int[3];
```

Per a què serveix? Triangles, piràmides, o simplement dades que no formen un rectangle perfecte.

### Recórrer un Array 2D

```java
int[][] matriz = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};

for (int i = 0; i < matriz.length; i++) {
    for (int j = 0; j < matriz[i].length; j++) {
        System.out.print(matriz[i][j] + " ");
    }
    System.out.println();
}
```

> **💡 Consell:** Nomena els índexs d'arrays multidimensionals com `fila` i `col` o `i` i `j`. NO uses `x` i `y` tret que realment treballes amb coordenades. El teu jo del futur t'ho agrairà.

### La Classe Arrays: La Teua Navalla Suïssa

Java proporciona la classe `java.util.Arrays` amb mètodes utilitat:

```java
import java.util.Arrays;

int[] numeros = {5, 2, 8, 1, 9};

Arrays.sort(numeros);                // {1, 2, 5, 8, 9}
int pos = Arrays.binarySearch(numeros, 5); // 2
int[] copia = Arrays.copyOf(numeros, 3);   // {1, 2, 5}
String texto = Arrays.toString(numeros);   // "[1, 2, 5, 8, 9]"
boolean igual = Arrays.equals(a, b);       // compara dos arrays
Arrays.fill(numeros, 0);                   // tot a zeros
```

> **⚠️ Advertència:** `array1.equals(array2)` NO compara els elements. Compara si són el MATEIX objecte en memòria. Usa SEMPRE `Arrays.equals()` per a comparar contingut. El teu cap t'ho agrairà.

### ⭐ BE THE CODE, MY FRIEND: La Cerca Binària

> 🕶️ **Don Tip:** Arrays.binarySearch() requereix l'array ORDENAT. Si no, el resultat és impredictible.

```java
import java.util.Arrays;

public class BeTheSort {
    public static void main(String[] args) {
        int[] datos = {42, 17, 8, 99, 3};
        Arrays.sort(datos);

        int indice = Arrays.binarySearch(datos, 42);
        System.out.println(indice);
    }
}
```

> **⭐ BE THE CODE, MY FRIEND**
>
> > 🕶️ **Don Tip:** La cerca binària només funciona en arrays ordenats. No ho oblides.
>
> **Què imprimeix?**
> - (A) 0
> - (B) 3
> - (C) 4
> - (D) 99
>
> **Resposta: (B) 3.** Després d'ordenar: {3, 8, 17, 42, 99}. 42 està a l'índex 3.

### Arrays i Mètodes: Passant el Testimoni

```java
public static void main(String[] args) {
    int[] edades = {10, 20, 30};
    modificar(edades);
    System.out.println(edades[0]); // 99
}

public static void modificar(int[] arr) {
    arr[0] = 99; // Modifica l'original perquè és la mateixa referència
}
```

Això funciona perquè Java passa la referència de l'objecte array per valor. L'array no es copia, només es copia l'adreça de memòria on està.

### ❓ No Hi Ha Preguntes Tontes!

> **❓ No Hi Ha Preguntes Tontes!**
> **P:** Per què el primer índex és 0 i no 1? Això no és natural!
> **R:** Perquè en la memòria, l'índex és el desplaçament des de la direcció base de l'array. El primer element està en la direcció base + 0. Java no va inventar això per a fastidiar-te; ve de les cavernes del llenguatge C.
>
> **P:** Puc tindre un array de mida 0?
> **R:** Sí. `int[] buit = new int[0];`. No pots ficar res, però no dona error. Útil quan no saps si tindràs dades.
>
> **P:** Passa alguna cosa si cree un array d'objectes però no els inicialitze?
> **R:** Els arrays d'objectes s'inicialitzen amb `null`. Si intentes cridar un mètode en un element null, obtens `NullPointerException`. No és divertit.
>
> **P:** Quina diferència hi ha entre `null` i "buit"?
> **R:** Un array buit (`new int[0]`) existeix però no té elements. Una referència null significa que no hi ha cap array. És com la diferència entre un pàrquing buit i un pàrquing que no s'ha construït.
>
> **P:** Els arrays poden canviar de mida?
> **R:** No. Són immutables en mida. Si necessites que cresca, crea'n un de nou i copia les dades amb `System.arraycopy()` o `Arrays.copyOf()`.

### ❓ No Hi Ha Preguntes Tontes! (Arrays i Memòria)

> **❓ No Hi Ha Preguntes Tontes!**
> **P:** Els arrays de primitius guarden els valors al heap o al stack?
> **R:** L'objecte array (amb tots els seus elements) està al heap. La variable que el referència està al stack. L'array és un objecte, encara que siga de `int`.
>
> **P:** Es pot canviar la mida d'un array després de crear-lo?
> **R:** No, els arrays tenen mida fixa. Pensar en ells com a places de pàrquing ja construïdes. Si necessites més, toca construir (crear) un nou pàrquing.
>
> **P:** Què passa si use `Arrays.sort()` en un array de Strings?
> **R:** Els ordena alfabèticament (segons l'ordre natural de String, que és lexicogràfic). Compte amb majúscules: "Zebra" va abans que "abc" perquè les majúscules tenen menor valor Unicode.

### 🥊 EL RING: Array vs ArrayList

Dues formes d'emmagatzemar dades s'enfronten.

**Array:** «Jo soc l'original. Ràpid, eficient, directe. Accés O(1) a qualsevol posició. Soc la base de tot!»

**ArrayList:** «Sí, però tens mida fixa. Una vegada et crees amb 10 posicions, no pots tindre'n 11. Jo creixe i encongisc sota demanda. Soc flexible.»

**Array:** «Però jo soc més ràpid en accés i més lleuger en memòria. ArrayList utilitza un array per dins i afegeix overhead.»

**ArrayList:** «Cert, però els meus mètodes `add()`, `remove()`, `contains()` em fan molt més còmode. Quantes línies de codi necessites per a afegir un element a un array? Jo una: `lista.add(42)`.»

**Array:** «Per a dades primitives soc més eficient. `int[]` ocupa menys que `ArrayList<Integer>` per l'autoboxing.»

**ArrayList:** «Val, per a tipus primitius i rendiment extrem, utilitza arrays. Per a tot lo demás, utilitza'm a mi. Tregua?»

**Array:** «Tregua.»

> 🕶️ **Don Tip:** Regla pràctica: saps quants elements necessites i no canviarà? Usa array. No ho saps o canviarà? Usa ArrayList.

### Resum Ràpid

```java
int[] arr = new int[10];        // Parking per a 10 enters
int[] arr2 = {1, 2, 3};         // Inicialització directa
arr.length;                     // Mida (sense parèntesis)
arr[0];                         // Primer element
arr[arr.length - 1];            // Últim element
int[][] mat = new int[3][4];    // Parking de 3 plantes, 4 places
Arrays.sort(arr);               // Ordenar
Arrays.toString(arr);           // Imprimir bonic
Arrays.equals(a, b);            // Comparar contingut
Arrays.copyOf(arr, n);          // Copiar els primers n
Arrays.binarySearch(arr, val);  // Buscar (requereix ordenació)
```

---

## Col·leccions: Quan un Array Es Queda Xicotet

### El Problema: El Teu Array S'ha Quedat Sense Places

Has creat un array de 10 places. Han arribat 11 gats. Què fas?

```java
String[] gatos = new String[10]; // 10 places, 11 gats... mal assumpte
```

Amb un array clàssic hauries de crear-ne un de nou, copiar-ho tot, i després afegir el que falta. És com aparcar al carrer perquè el pàrquing està ple.

```java
String[] gatosMasGrande = new String[gatos.length + 1];
System.arraycopy(gatos, 0, gatosMasGrande, 0, gatos.length);
gatosMasGrande[gatosMasGrande.length - 1] = "Bigotes Jr.";
gatos = gatosMasGrande; // Ara apunta al nou array
```

Funciona, però és tediós. I si has de borrar un element al mig, és pitjor. Necessites alguna cosa que cresca i s'enculla sola.

### El Java Collections Framework (JCF)

Per a això està el JCF: una família de classes i interfícies a `java.util` que manegen grups d'objectes com si foren de goma.

### ❓ No Hi Ha Preguntes Tontes!

> **❓ No Hi Ha Preguntes Tontes!**
> **P:** Per què no usar sempre ArrayList i oblidar-me dels arrays?
> **R:** Els arrays són més ràpids i consumeixen menys memòria. Per a un milió d'elements, la diferència es nota. Usa'ls quan sàpies la mida per endavant.
>
> **P:** Què significa `<String>`?
> **R:** És un *generic*. Li diu a la col·lecció: "Només accepte Strings". Si intentes ficar un `int`, et falla en compilació, no en execució. És la teua xarxa de seguretat.

### ArrayList: El Pàrquing que Creix Sol

ArrayList és com un array, però amb superpoders: es redimensiona automàticament quan et passes de capacitat.

```java
import java.util.ArrayList;

ArrayList<String> gatos = new ArrayList<>();
gatos.add("Bigotes");      // [Bigotes]
gatos.add("Garfield");     // [Bigotes, Garfield]
gatos.add("Misifú");      // [Bigotes, Garfield, Misifú]
gatos.remove(1);           // [Bigotes, Misifú]  - adeu, Garfield
gatos.get(0);              // "Bigotes"
gatos.size();              // 2 (NO length, es size())
gatos.contains("Misifú");  // true
gatos.indexOf("Bigotes");  // 0
```

> **⚠️ Advertència:** ArrayList usa `size()`, no `length`. Array usa `length`, no `size()`. String usa `length()`, no `length` ni `size()`. Cadascú té la seua pròpia forma de preguntar quant mesura. És un parany en el 90% dels exàmens.

### ArrayList NO guarda primitius

No pots fer `ArrayList<int>`. Els genèrics només funcionen amb objectes. Usa les classes wrapper:

```java
ArrayList<Integer> numeros = new ArrayList<>();
numeros.add(42);               // autoboxing: int → Integer
int n = numeros.get(0);        // unboxing: Integer → int
```

Des de Java 5, l'autoboxing/unboxing és automàtic, però per dins continua havent-hi objectes Integer.

### ⭐ BE THE CODE, MY FRIEND: L'ArrayList Misteriós

> 🕶️ **Don Tip:** ArrayList creix sol. No necessites definir mida, però cada operació té el seu cost.

```java
import java.util.ArrayList;

public class BeTheList {
    public static void main(String[] args) {
        ArrayList<Integer> lista = new ArrayList<>();
        lista.add(10);
        lista.add(20);
        lista.add(30);
        lista.add(1, 15);
        lista.remove(Integer.valueOf(20));

        for (Integer n : lista) {
            System.out.print(n + " ");
        }
    }
}
```

> **⭐ BE THE CODE, MY FRIEND**
>
> > 🕶️ **Don Tip:** ArrayList utilitza arrays per dins. Quan s'ompli, en crea un de nou i copia.
>
> **Què imprimeix?**
> - (A) 10 20 30
> - (B) 10 15 30
> - (C) 10 15 20 30
> - (D) 10 15
>
> **Resposta: (B) 10 15 30.** S'afig 15 a l'índex 1 → {10,15,20,30}. Després se borra l'objecte Integer(20) → {10,15,30}.

### ⭐ BE THE CODE, MY FRIEND: Suma d'ArrayList

> 🕶️ **Don Tip:** Recórrer un ArrayList amb for-each és més llegible que amb índexs.

```java
import java.util.ArrayList;

public class BeTheSum {
    public static void main(String[] args) {
        ArrayList<Integer> nums = new ArrayList<>();
        for (int i = 1; i <= 5; i++) {
            nums.add(i * 10);
        }
        int total = 0;
        for (int n : nums) {
            if (n % 20 == 0) {
                total += n;
            }
        }
        System.out.println(total);
    }
}
```

> **⭐ BE THE CODE, MY FRIEND**
>
> > 🕶️ **Don Tip:** El for-each és de només lectura. No pots modificar la col·lecció mentre la recorres.
>
> **Què imprimeix?**
> - (A) 30
> - (B) 60
> - (C) 90
> - (D) 150
>
> **Resposta: (B) 60.** La llista és {10, 20, 30, 40, 50}. Els múltiples de 20 són 20 i 40. 20 + 40 = 60.

### LinkedList: La Conga Line

LinkedList és una llista enllaçada. Cada element sap qui està davant i darrere, com en una conga. És lenta si busques per índex, però rapidíssima per a afegir/borrar al principi o al final.

```java
import java.util.LinkedList;

LinkedList<String> cola = new LinkedList<>();
cola.addLast("Persona 1");   // al final
cola.addLast("Persona 2");
cola.addFirst("Colat");     // es cola al principi
String primero = cola.removeFirst(); // "Colat" - se'n va
```

> **💡 Consell:** Usa `LinkedList` quan necessites una cua (FIFO) o una pila (LIFO). Per a accés aleatori freqüent, usa `ArrayList`. LinkedList busca element per element. ArrayList va directe a l'índex.

### HashSet: El Porter que No Deixa Duplicats

HashSet és com una discoteca: no deixa entrar a ningú que ja estiga dins. No importa l'ordre, només l'exclusivitat.

```java
import java.util.HashSet;

HashSet<String> invitados = new HashSet<>();
invitados.add("Ana");
invitados.add("Bob");
invitados.add("Ana"); // No passa res, Ana ja està
System.out.println(invitados.size()); // 2, no 3
```

Com sap si un element ja està? Usa `hashCode()` i `equals()`. Si el teu objecte no els sobreescriu bé, HashSet farà coses rares.

> **⚠️ Advertència:** Si sobreescrius `equals()` en una classe, SOBREESCRIU `hashCode()`. Sempre. Si dos objectes són iguals segons `equals()`, han de tindre el mateix `hashCode()`. Si no, HashSet es tornarà boig. Repetisc: **sempre**.

### Operacions Típiques amb HashSet

```java
HashSet<String> set = new HashSet<>();
set.add("rojo");
set.add("verde");
set.add("azul");
set.remove("rojo");
set.contains("verde");   // true
set.isEmpty();          // false
set.clear();            // ho buida tot
```

### TreeSet: L'Organitzat

TreeSet és com un HashSet que s'ordena sol. Internament usa un arbre roig-negre. Tot el que fiques s'ordena automàticament.

```java
import java.util.TreeSet;

TreeSet<String> ordenado = new TreeSet<>();
ordenado.add("Zara");
ordenado.add("Ana");
ordenado.add("Bob");
System.out.println(ordenado); // [Ana, Bob, Zara] - ordre alfabètic

// Mètodes extra útils
ordenado.first();  // "Ana"
ordenado.last();   // "Zara"
ordenado.headSet("Bob"); // [Ana] - elements abans de Bob
```

> **💡 Consell:** Necessites elements ordenats automàticament? Usa TreeSet. Només necessites eliminar duplicats? Usa HashSet (és més ràpid: O(1) vs O(log n)).

### Iterator: El Cambrer que Pren Nota Un a Un

Iterator recorre una col·lecció sense que t'importe com està implementada per dins. És com un cambrer: "Què vol? I vosté? I vosté?"

```java
import java.util.Iterator;

ArrayList<String> platos = new ArrayList<>();
platos.add("Tortilla");
platos.add("Paella");
platos.add("Croquetas");

Iterator<String> it = platos.iterator();
while (it.hasNext()) {
    String plato = it.next();
    if (plato.equals("Paella")) {
        it.remove(); // BORRA de la llista ORIGINAL
    }
}
// Ara platos = [Tortilla, Croquetas]
```

> **⚠️ Advertència:** Mai no faces `llista.remove(element)` mentre uses un for-each. Llançaràs `ConcurrentModificationException`. Usa SEMPRE `iterator.remove()` si necessites borrar durant el recorregut.

### Collections: L'Amic Utilitari

Igual que `Arrays` per a arrays, `Collections` és l'amic de les col·leccions:

```java
import java.util.Collections;

ArrayList<String> lista = new ArrayList<>();
lista.add("Zara");
lista.add("Ana");
lista.add("Bob");

Collections.sort(lista);        // [Ana, Bob, Zara]
Collections.reverse(lista);     // [Zara, Bob, Ana]
Collections.shuffle(lista);     // ordre aleatori
Collections.max(lista);         // "Zara" (ordre alfabètic)
Collections.min(lista);         // "Ana"
Collections.frequency(lista, "Ana"); // 1
Collections.replaceAll(lista, "Ana", "Ana María");
Collections.rotate(lista, 2);   // roda 2 posicions
```

### ⭐ BE THE CODE, MY FRIEND: Collections en Acció

> 🕶️ **Don Tip:** Collections.sort() ordena la llista original. Si no vols modificar-la, copia-la abans.

```java
import java.util.*;

public class BeTheCollections {
    public static void main(String[] args) {
        ArrayList<Integer> nums = new ArrayList<>();
        nums.add(5);
        nums.add(1);
        nums.add(8);
        nums.add(3);

        Collections.sort(nums);
        Collections.reverse(nums);

        System.out.println(nums.get(1));
    }
}
```

> **⭐ BE THE CODE, MY FRIEND**
>
> > 🕶️ **Don Tip:** Els mètodes estàtics de Collections són molt potents. sort, shuffle, reverse, binarySearch...
>
> **Què imprimeix?**
> - (A) 1
> - (B) 3
> - (C) 5
> - (D) 8
>
> **Resposta: (C) 5.** Sort → {1,3,5,8}. Reverse → {8,5,3,1}. get(1) = 5.

### ❓ No Hi Ha Preguntes Tontes! (Col·leccions)

> **❓ No Hi Ha Preguntes Tontes!**
> **P:** Quan use ArrayList i quan LinkedList?
> **R:** Usa ArrayList per al 95% dels casos. LinkedList només quan necessites afegir/borrar molt al principi o estàs implementant una cua/pila. ArrayList és més simple i més ràpid en accés aleatori.
>
> **P:** HashSet vs TreeSet?
> **R:** HashSet és més ràpid (O(1) vs O(log n)), però no ordena. TreeSet ordena automàticament però és més lent. Si no necessites ordre, usa HashSet. Punt.
>
> **P:** Es poden mesclar tipus en una col·lecció sense genèrics?
> **R:** Sí, però és com llançar un dau. Si poses `ArrayList llista = new ArrayList();` (sense <>) pots ficar qualsevol cosa, però al traure'l has de fer casting i creuar els dits. Amb genèrics, el compilador et protegeix.
>
> **P:** Què passa si afegisc un null a un HashSet?
> **R:** HashSet admet un únic null. TreeSet no admet null perquè necessita comparar elements per a ordenar i... com compares null amb alguna cosa?
>
> **P:** Què és més ràpid, for-each o iterator?
> **R:** Internament són quasi el mateix. El for-each usa iterator per darrere. Usa el que et resulte més llegible.

### Resum Ràpid: Col·leccions

```java
ArrayList<String> a = new ArrayList<>();       // Llista dinàmica
LinkedList<String> l = new LinkedList<>();     // Llista doblement enllaçada
HashSet<String> s = new HashSet<>();           // Sense duplicats, sense ordre
TreeSet<String> t = new TreeSet<>();           // Sense duplicats, ordenat

a.add(e);         // afegir
a.get(i);         // obtindre per índex
a.remove(i);      // borrar per índex
a.remove(e);      // borrar objecte
a.size();         // mida
a.contains(e);    // conté?
a.isEmpty();      // està buit?

Collections.sort(lista);
Collections.reverse(lista);
Collections.shuffle(lista);
Collections.min(lista);
Collections.max(lista);
```

---

## Exercicis Proposats

### Exercici 1: L'Invers
Escriu un programa que cree un array de 10 enters, els ompliga amb números del 1 al 10, i després els imprimisca en ordre invers.

### Exercici 2: Buscamines Simplificat
Crea un array bidimensional de 5x5 que represente un camp de mines. Ompli'l amb 5 mines (representades com a `true`) en posicions aleatòries. L'usuari introdueix coordenades (fila, columna) i el programa diu si hi ha mina o no. Si encerta una mina, el joc acaba.

### Exercici 3: Estadístiques de Classe
Demana a l'usuari les notes de 20 alumnes, guarda-les en un array, i calcula:
- La nota mitjana
- La nota més alta
- La nota més baixa
- Quants alumnes van aprovar (nota >= 5)

### Exercici 4: Eliminar Duplicats
Escriu un programa que lligca una llista de paraules des del teclat (acaba amb "FI") i les mostre sense duplicats, en el mateix ordre en què van aparéixer la primera volta. Pista: usa un `LinkedHashSet` per a mantindre l'ordre d'inserció.

### Exercici 5: Llista de la Compra
Crea un programa que gestione una llista de la compra usant `ArrayList<String>`. Ha de permetre: afegir, eliminar, marcar com a comprat i mostrar la llista.

---

**RAs treballats en aquesta unitat:**
- **RA6** - Tipus avançats: Arrays i col·leccions

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
