---
title: "Unidad 4: Algorítmica I — Fundamentos"
nav_order: 4
---
🎯 **Objectius d'aprenentatge**
- Entendre què és un algorisme i com dissenyar-lo
- Implementar cerca lineal i binària en Java
- Implementar ordenació bombolla i inserció
- Analitzar la complexitat algorísmica amb notació Big O
- Triar l'algorisme adequat segons el context

## Què és un Algorisme? (L'Art de Donar Instruccions Precises)

Un **algorisme** és una seqüència de passos finita, ordenada i sense ambigüitats que resol un problema. Bàsicament, és una recepta de cuina, però per al teu ordinador.

Quan cuines una truita de creïlles, segueixes un algorisme mental:
1. Pelar les creïlles
2. Tallar-les en rodanxes fines
3. Fregir-les en oli abundant
4. Batir els ous
5. Barrejar-ho tot i quallar

Si un pas és ambigu ("posa sal al gust"), cada persona ho interpreta diferent. Un algorisme de veritat no deixa espai a la interpretació: cada pas ha de ser **precís** i **determinista**.

> **📝 Nota:**
>
> La paraula "algorisme" ve del matemàtic persa **Al-Juarismi** (segle IX). Va escriure un llibre sobre com fer càlculs amb nombres indis. Segles després, els informàtics li vam robar la paraula.

### Algorismes en Programació

En informàtica, els algorismes més clàssics es dividixen en dos grans famílies:

- **Cerca**: trobar un element dins d'un conjunt de dades.
- **Ordenació**: posar un conjunt de dades en un ordre determinat (numèric, alfabètic, etc.).

I d'això va esta unitat: de buscar i ordenar com un professional.

```java
// El algoritmo más simple que existe: sumar dos números
public class AlgoritmoSimple {
    public static void main(String[] args) {
        int a = 5;
        int b = 3;
        int resultado = a + b;  // Esto ES un algoritmo: pasos precisos que producen un resultado
        System.out.println("5 + 3 = " + resultado);
    }
}
```

> **⚠️ Advertència:**
>
> No tot codi és un algorisme. Un algorisme és la *idea*. El codi és la *materialització*. Pots implementar el mateix algorisme en Java, Python o assemblador. L'essència és la mateixa.

### Propietats d'un Algorisme

Perquè un algorisme siga considerat com a tal, ha de complir:

1. **Finit**: ha de terminar en algun moment. Si s'executa per sempre, no és un algorisme, és un malson.
2. **Precís**: cada pas ha d'estar definit sense ambigüitat.
3. **Entrada**: ha de rebre zero o més valors d'entrada.
4. **Eixida**: ha de produir almenys un valor d'eixida.
5. **Eficaç**: ha de resoldre el problema en temps finit.

## Cerca Lineal: El Cercador de Sabates Perdudes

Imagina que perds una sabatilla en la teua habitació. Què fas? Mires davall del llit, darrere de la porta, en l'armari... bàsicament **revises cada lloc fins a trobar-la**.

Doncs això és la **cerca lineal**: recorres un array element per element fins a trobar el que busques. És simple, directa, i funciona inclús si les dades estan desordenades.

```java
public class BusquedaLineal {

    public static int buscar(int[] array, int objetivo) {
        for (int i = 0; i < array.length; i++) {
            if (array[i] == objetivo) {
                return i;  // ¡Encontrado! Devuelve la posición
            }
        }
        return -1;  // No está en el array
    }

    public static void main(String[] args) {
        int[] numeros = {34, 12, 56, 78, 23, 9, 45, 67};

        int resultado = buscar(numeros, 23);
        if (resultado != -1) {
            System.out.println("¡Encontrado el 23 en la posición " + resultado + "!");
        } else {
            System.out.println("El 23 no está en el array.");
        }

        resultado = buscar(numeros, 99);
        if (resultado == -1) {
            System.out.println("El 99 no está. Como unas zapatillas que nunca aparecen.");
        }
    }
}
```

### Anàlisi: Com de ràpid és?

En el **millor cas**, l'element està en la primera posició → trobes en 1 pas.

En el **pitjor cas**, l'element està al final o no existix → recorres els `n` elements sencers.

Diem que la seua **complexitat és O(n)** — lineal. Si l'array té 10 elements, tardes ~10 passos; si en té 10.000, tardes ~10.000 passos. Creix al mateix ritme que les dades.

> **💡 Consell:**
>
> La cerca lineal és com buscar en la teua nevera: si és xicoteta, tant li fa el mètode. Però si tens un magatzem de 10.000 ítems, necessites alguna cosa millor.

## Cerca Binària: El Cercador Jedi

La **cerca binària** és com buscar una paraula en el diccionari. No obris per la pàgina 1 i passes d'una en una. Obris per la meitat, veus si la paraula està abans o després, i descartes mitja tona de paper en cada intent.

**Requisit imprescindible: l'array ha d'estar ordenat.** Si no, este mètode no funciona.

```java
public class BusquedaBinaria {

    public static int buscar(int[] array, int objetivo) {
        int izquierda = 0;
        int derecha = array.length - 1;

        while (izquierda <= derecha) {
            int medio = izquierda + (derecha - izquierda) / 2;  // Mitad del segmento

            if (array[medio] == objetivo) {
                return medio;  // ¡Bingo!
            }

            if (array[medio] < objetivo) {
                izquierda = medio + 1;  // Descartamos la mitad izquierda
            } else {
                derecha = medio - 1;    // Descartamos la mitad derecha
            }
        }
        return -1;  // No encontrado
    }

    public static void main(String[] args) {
        // OJO: tiene que estar ORDENADO
        int[] numeros = {2, 5, 8, 12, 19, 24, 31, 37, 42, 50, 58, 63};

        int resultado = buscar(numeros, 31);
        System.out.println("31 encontrado en posición: " + resultado);  // 6

        resultado = buscar(numeros, 3);
        System.out.println("3 encontrado en: " + resultado);  // -1
    }
}
```

### Per què `izquierda + (derecha - izquierda) / 2` en lloc de `(izquierda + derecha) / 2`?

Perquè si l'array és molt gran (prop de `Integer.MAX_VALUE` elements), `izquierda + derecha` pot desbordar-se. La fórmula alternativa evita eixe problema. És un clàssic bug que va aparéixer inclús en la biblioteca de Java original.

> **⚠️ Advertència:**
>
> Si executes cerca binària sobre un array **no ordenat**, els resultats són brossa. No hi ha error de compilació, no hi ha excepció. Simplement obtens la resposta equivocada. Com buscar "berenar" en un diccionari que té les paraules a l'atzar.

### Anàlisi: O(log n)

En cada pas, la cerca binària **descartada la meitat** de l'array restant.

- Array de 16 elements → 4 passos màxims
- Array de 32 elements → 5 passos
- Array de 1024 elements → 10 passos
- Array de 1.000.000 elements → 20 passos

Això és **O(log n)**, o complexitat logarítmica. Creix molt a poc a poc inclús amb dades enormes. És la diferència entre preguntar a 1000 persones una per una vs. preguntar "està a l'esquerra o a la dreta?" i descartar-ne 500 de colp.

```java
public class DemoComplejidad {
    public static void main(String[] args) {
        // Simulación visual de pasos necesarios
        System.out.println("n\tLineal\tBinaria");
        System.out.println("--------------------");
        for (int n = 10; n <= 1000000; n *= 10) {
            int pasosLineal = n;
            int pasosBinaria = (int)(Math.log(n) / Math.log(2));
            System.out.println(n + "\t" + pasosLineal + "\t\t" + pasosBinaria);
        }
    }
}
```

Eixida esperada:
```
n	Lineal	Binaria
--------------------
10		10		4
100		100		7
1000		1000		10
10000		10000		14
100000	100000		17
1000000	1000000	20
```

Amb un milió d'elements, la cerca lineal necessita un milió de passos. La binària només **20**. Llig això una altra volta. **20.**

> **📝 Nota:**
>
> `log₂(n)` en informàtica s'assumix sempre en base 2. No confongues amb el logaritme decimal de tota la vida. Quan un informàtic diu "log n", pensa en "meitat, meitat, meitat...".

## Ordenació Bombolla: Simple però Torta

L'**ordenació bombolla** (bubble sort) és l'algorisme d'ordenació més senzill d'entendre... i el més lent dels que valen la pena. Funciona així:

> Va recorrent l'array. Si l'element actual és major que el següent, intercanvia'ls. Repetix fins que no hi haja intercanvis.

Els elements grans "pugen com bombolles" cap al final de l'array. D'ací el nom.

```java
public class Burbuja {

    public static void ordenar(int[] array) {
        int n = array.length;
        boolean huboIntercambio;

        for (int i = 0; i < n - 1; i++) {
            huboIntercambio = false;

            for (int j = 0; j < n - 1 - i; j++) {
                if (array[j] > array[j + 1]) {
                    // Intercambio
                    int temp = array[j];
                    array[j] = array[j + 1];
                    array[j + 1] = temp;
                    huboIntercambio = true;
                }
            }

            // Si no hubo intercambio, el array ya está ordenado
            if (!huboIntercambio) break;
        }
    }

    public static void main(String[] args) {
        int[] datos = {64, 34, 25, 12, 22, 11, 90};

        System.out.print("Antes: ");
        for (int n : datos) System.out.print(n + " ");

        ordenar(datos);

        System.out.print("\nDespués: ");
        for (int n : datos) System.out.print(n + " ");
        // 11 12 22 25 34 64 90
    }
}
```

### Per què és tan lent?

Dos bucles aniuats. Per a un array de `n` elements:

- Primer bucle: `n` voltes
- Segon bucle: ~`n` voltes (en realitat `n-i-1`, però a grans trets `n`)

**Total: ~n × n = n² operacions.** Complexitat **O(n²)**.

Per a 10 elements → 100 operacions (bé).
Per a 1000 elements → 1.000.000 d'operacions (comença a doldre).
Per a 1.000.000 d'elements → 1.000.000.000.000 operacions (el teu ordinador demana la jubilació).

> **💡 Consell:**
>
> Bombolla només s'usa en dos situacions: (1) estàs aprenent, (2) saps que l'array tindrà < 50 elements. Per a tot lo demés, hi ha millors alternatives.

### L'Optimització del Flag

Fixat't en la variable `huboIntercambio`. Si en una passada completa no intercanviem res, és que l'array ja està ordenat i podem parar. Esta optimització no millora el pitjor cas (array invertit), però ajuda en arrays quasi ordenats.

## Ordenació per Inserció: Com Ordenar Cartes en la Mà

L'**ordenació per inserció** (insertion sort) és com ordenar les cartes que et repartixen al pòker. Agafes una carta nova i la col·loques en el seu lloc dins de les que ja tens ordenades en la mà.

```java
public class Insercion {

    public static void ordenar(int[] array) {
        for (int i = 1; i < array.length; i++) {
            int clave = array[i];  // La carta que vamos a colocar
            int j = i - 1;

            // Desplazar elementos mayores hacia la derecha
            while (j >= 0 && array[j] > clave) {
                array[j + 1] = array[j];
                j--;
            }
            array[j + 1] = clave;  // Colocar la carta en su sitio
        }
    }

    public static void main(String[] args) {
        int[] datos = {9, 5, 1, 4, 3};

        System.out.print("Antes: ");
        for (int n : datos) System.out.print(n + " ");

        ordenar(datos);

        System.out.print("\nDespués: ");
        for (int n : datos) System.out.print(n + " ");
        // 1 3 4 5 9
    }
}
```

### Com funciona pas a pas?

Donat `{9, 5, 1, 4, 3}`:

```
Paso 0: [9] | 5 1 4 3   → la "mano" empieza con el 9
Paso 1: [5 9] | 1 4 3   → 5 se coloca a la izquierda del 9
Paso 2: [1 5 9] | 4 3   → 1 se coloca al principio
Paso 3: [1 4 5 9] | 3   → 4 se cuela entre el 1 y el 5
Paso 4: [1 3 4 5 9]     → 3 se coloca entre el 1 y el 4
```

### Anàlisi i Quan és bona?

També és **O(n²)** en el pitjor cas (array invertit). Però:

- **Millor cas (array quasi ordenat)**: O(n). Només fa una passada. És rapidíssim.
- És **estable**: manté l'ordre relatiu d'elements iguals.
- **No necessita memòria extra** (ordena in-place).
- És **més ràpid que bombolla** en la pràctica, encara que tots dos siguen O(n²).

> **💡 Consell:**
>
> L'ordenació per inserció és la reina de les dades **quasi ordenades**. Si saps que el teu array té 100 elements i ja està "quasi bé" (només uns pocs fora de lloc), inserció et va a sorprendre. S'usa com a pas final en algorismes avançats (TimSort, usat per Java i Python).

```java
public class Comparacion {
    public static void main(String[] args) {
        // Demostración: inserción vs burbuja con array casi ordenado
        int[] casiOrdenado = {1, 2, 3, 4, 6, 5, 7, 8, 9, 10};
        // Solo el 6 y el 5 están intercambiados

        int[] burbuja = casiOrdenado.clone();
        int[] insercion = casiOrdenado.clone();

        // Con burbuja da varias pasadas aunque casi esté ordenado
        // Con inserción resuelve en un suspiro
        System.out.println("Inserción es ideal cuando tienes que añadir");
        System.out.println("un elemento a un array ya ordenado.");
    }
}
```

## Complexitat Algorísmica: Big O per a Mortals

La **notació Big O** descriu com creix el temps d'execució d'un algorisme quan creix la quantitat de dades d'entrada. No et dona el temps exacte en segons (això depén del maquinari), et dona la **tendència**.

### Les Complexitats Més Comunes

| Notació | Nom | Exemple | Per a n=1000 |
|----------|--------|---------|-------------|
| O(1) | Constant | Accedir a un array per índex | 1 operació |
| O(log n) | Logarítmica | Cerca binària | ~10 ops |
| O(n) | Lineal | Cerca lineal | 1000 ops |
| O(n log n) | Quasi lineal | Ordenació ràpida (ho veuràs més avant) | ~10.000 ops |
| O(n²) | Quadràtica | Bombolla, inserció | 1.000.000 ops |
| O(2ⁿ) | Exponencial | Fibonacci recursiu sense optimitzar | ¡inviable! |

```java
public class EjemplosComplejidad {

    // O(1) — CONSTANTE: siempre igual, no importa el tamaño
    public static int obtenerPrimero(int[] array) {
        return array[0];  // Un solo paso, siempre
    }

    // O(n) — LINEAL: crece proporcional a n
    public static int sumar(int[] array) {
        int suma = 0;
        for (int num : array) {
            suma += num;  // n pasos
        }
        return suma;
    }

    // O(n²) — CUADRÁTICA: dos bucles anidados
    public static void imprimirPares(int[] array) {
        for (int i = 0; i < array.length; i++) {
            for (int j = 0; j < array.length; j++) {
                System.out.println(array[i] + ", " + array[j]);  // n × n pasos
            }
        }
    }

    public static void main(String[] args) {
        int[] datos = {10, 20, 30, 40, 50};

        System.out.println("O(1): " + obtenerPrimero(datos));
        System.out.println("O(n): " + sumar(datos));
        System.out.println("O(n²): mira la consola llenándose de pares...");
        imprimirPares(datos);
    }
}
```

### Regles Pràctiques de Big O

1. **Ignora constants**: O(2n) és el mateix que O(n). El 2 no importa quan n tendix a infinit.
2. **Queda't amb el terme dominant**: O(n² + n) → O(n²). El n² es menja el n quan n creix.
3. **Els bucles aniuats multipliquen**: un bucle dins d'un altre → n × n → O(n²).
4. **Els bucles seqüencials sumen**: un bucle i després un altre → O(n + n) → O(2n) → O(n).

> **📝 Nota:**
>
> "Big O" descriu el **pitjor cas** (o cota superior). Si dius que cerca lineal és O(n), estàs dient "com a molt, tardarà el mateix que recórrer tot l'array". Existixen també Big Omega Ω (millor cas) i Big Theta Θ (cas mitjà), però amb Big O en tens suficient per a començar.

```java
public class ReglasBigO {
    public static void main(String[] args) {
        // REGLA 1: Las constantes no importan
        // O(2n) → O(n)
        // O(100n) → O(n)

        // REGLA 2: El término dominante se queda
        // O(n² + 5n + 1) → O(n²)
        // O(n + log n) → O(n)
        // O(n! + n²) → O(n!)

        // REGLA 3: Bucles anidados → multiplica
        // for(i...) { for(j...) } → O(n * m) → O(n²)

        // REGLA 4: Bucles secuenciales → suma
        // for(i...) { } for(i...) { }
        // O(n + n) → O(2n) → O(n)

        System.out.println("Big O no es magia, es simplificar.");
        System.out.println("Pregúntate: ¿qué pasa cuando n se hace MUY grande?");
    }
}
```

## ⭐ BE THE CODE, MY FRIEND: Implementa Cerca Binària des de Zero

> 🕶️ **Don Tip:** La cerca binària reduïx el problema a la meitat en cada pas. Centra't en els límits `izquierda` i `derecha` — l'error més comú és no actualitzar-los bé.

Este exercici és un clàssic en entrevistes tècniques de Google, Amazon i companyia. Si algun dia vols treballar en una FAANG, la cerca binària la tens que saber escriure dormit, borratxo i amb una mà lligada a l'esquena.

**Instruccions:**

Sense mirar el codi de dalt, implementa el mètode `busquedaBinaria` que rep un array ordenat d'enters i un objectiu, i torna la posició de l'objectiu o -1 si no existix.

```java
/**
 * Implementa este método:
 * 
 * public static int busquedaBinaria(int[] array, int objetivo)
 *
 * Requisitos:
 * - No uses Arrays.binarySearch() — el sentido es programarlo
 * - No mires el código de la unidad — fuerza tu cerebro a recordar
 * - Piénsalo así: coge el medio, compara, descarta la mitad, repite
 */
public class RetoBinaria {

    public static int busquedaBinaria(int[] array, int objetivo) {
        // 🧠 TU CÓDIGO AQUÍ
        return -1;
    }

    public static void main(String[] args) {
        int[] pruebas = {1, 3, 5, 7, 9, 11, 13, 15, 17, 19};

        System.out.println("Probando búsqueda binaria...");
        System.out.println("El 7 está en posición: " + busquedaBinaria(pruebas, 7));  // 3
        System.out.println("El 13 está en posición: " + busquedaBinaria(pruebas, 13)); // 6
        System.out.println("El 8 está en posición: " + busquedaBinaria(pruebas, 8));  // -1
        System.out.println("El 19 está en posición: " + busquedaBinaria(pruebas, 19)); // 9
        System.out.println("El 1 está en posición: " + busquedaBinaria(pruebas, 1));   // 0
        System.out.println("Primer elemento fuera: " + busquedaBinaria(new int[]{}, 5)); // -1
    }
}
```

**Pistes (si t'encalles):**

- Necessites dos punters: `izquierda` i `derecha`.
- Calcula el `medio` com `izquierda + (derecha - izquierda) / 2`.
- Si `array[medio] == objetivo`, torna `medio`.
- Si `array[medio] < objetivo`, mou `izquierda` a `medio + 1`.
- Si `array[medio] > objetivo`, mou `derecha` a `medio - 1`.
- El bucle termina quan `izquierda > derecha`.
- Array buit → directament `-1`.

> **💡 Consell:**
>
> L'error més comú en cerca binària (inclús en programadors amb 10 anys d'experiència) és el **off-by-one**: `<=` o `<`? `medio + 1` o `medio`? Dibuixa l'array en un paper amb 3 elements i simula els casos. El paper i boli són les teues millors ferramentes de debugging.

### Solució (intenta-ho abans de mirar)

```java
public static int busquedaBinaria(int[] array, int objetivo) {
    if (array == null || array.length == 0) return -1;

    int izquierda = 0;
    int derecha = array.length - 1;

    while (izquierda <= derecha) {
        int medio = izquierda + (derecha - izquierda) / 2;

        if (array[medio] == objetivo) {
            return medio;
        } else if (array[medio] < objetivo) {
            izquierda = medio + 1;
        } else {
            derecha = medio - 1;
        }
    }
    return -1;
}
```

### 🧩 EL LÍO

El departament de qualitat ha rebut este algoritme d'ordenació. Alguna cosa fa olor de cremat. Identifica els errors i explica per què no funciona:

```java
public class BurbujaLiosa {
    public static void ordenar(int[] arr) {
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr.length; j++) {
                if (arr[j] > arr[j + 1]) {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
    }
}
```

Pista: hi ha un error d'índexs i un altre de rendiment.

> 🕶️ **Don Tip:** Quan un bucle accedix a `arr[j + 1]`, assegura't que `j + 1` no isca de l'array. També pensa: recorres menys elements en cada passada?

## No Hi Ha Preguntes Tontes!

> **Q:** Per què no usem sempre cerca binària si és tan ràpida?
>
> **A:** Perquè requerix que les dades estiguen **ordenades**. Ordenar també costa temps. Si has d'ordenar cada volta que busques, perds l'avantatge. La cerca binària és ideal quan ordenes una vegada i busques moltes voltes.

> **Q:** Big O servix per a alguna cosa en el món real o és només teoria d'examen?
>
> **A:** Servix i molt. Quan la teua app web comença a anar lenta amb 1000 usuaris, la diferència entre O(n) i O(n²) és la diferència entre "prendre un café mentre carrega" i "jubilar-te abans que acabe". Les empreses tech (Google, Amazon, Netflix) maten per eficiència. Un algorisme roín en producció costa diners reals en servidors.

> **Q:** Hi ha algorismes d'ordenació més ràpids que O(n²)?
>
> **A:** Sí, i els veuràs en la següent unitat. QuickSort, MergeSort i HeapSort són de l'ordre **O(n log n)**, que és molt més ràpid que O(n²). Per exemple, per a 1.000.000 d'elements, O(n log n) són ~20 milions d'operacions; O(n²) són 1 bilió.

> **Q:** Puc barrejar tipus de cerca i ordenació?
>
> **A:** Clar. És molt comú ordenar amb QuickSort i després buscar amb binària. O si l'array és molt xicotet (< 50), usar cerca lineal encara que estiga ordenat, perquè la sobrecàrrega de la binària no compensa.

> **Q:** Val, però... quan use cada algorisme d'ordenació?
>
> **A:** Regla pràctica:
> - Array xicotet (< 50 elements) → qualseval val, usa inserció per simplicitat.
> - Array quasi ordenat → **inserció** arrasa.
> - Array gran → no uses bombolla ni inserció. Espera a la pròxima unitat.
> - Array enorme amb memòria limitada → **HeapSort**.
> - Array enorme i necessites estabilitat → **MergeSort**.
> - Array enorme i velocitat bruta → **QuickSort**.

> **Q:** Què significa que un algorisme siga "estable"?
>
> **A:** Un algorisme d'ordenació és estable si manté l'ordre relatiu d'elements amb el mateix valor. Per exemple, si tens dos usuaris amb edat 25 ("Ana" abans que "Luis"), un algorisme estable els deixa en eixe ordre. Inserció i MergeSort són estables; Bombolla es pot fer estable o no segons la implementació; QuickSort no ho és per defecte.

> **Q:** I tot això servix per a aprovar el mòdul?
>
> **A:** Servix per a aprovar el mòdul, per a les entrevistes tècniques, per a escriure codi que no done pena, i perquè quan algú diga "és O(n²)" tu sàpques exactament per què és roín. Així que sí, posa atenció.

### 🔮 EL ACERTIJO

Tens 9 monedes aparentment idèntiques. Una d'elles és falsa i pesa menys que les altres. Disposes d'una balança de dos platets. Quin és el nombre mínim de pesades que necessites per a trobar la moneda falsa?

Pista: no les peses una per una. Usa divideix i venceràs.

> 🕶️ **Don Tip:** Si dividixes 9 monedes en 3 grups de 3, amb una sola pesada pots descartar 6 monedes.

## Resum de la Unitat

| Algorisme | Complexitat | Quan usar-lo? |
|-----------|------------|-----------------|
| Cerca lineal | O(n) | Arrays menuts o desordenats |
| Cerca binària | O(log n) | Arrays grans ORDENATS |
| Bombolla | O(n²) | Només per a aprendre o arrays molt menuts |
| Inserció | O(n²) / O(n) | Arrays menuts o quasi ordenats |

**Conceptes clau:**
- Un algorisme és una seqüència finita, precisa i no ambigua de passos.
- La notació Big O descriu la taxa de creixement del temps d'execució.
- O(1) < O(log n) < O(n) < O(n log n) < O(n²) < O(2ⁿ)
- Ordenar abans de cercar pot valdre la pena si fas moltes cerques.
- El millor algorisme depén del context: grandària, ordre inicial, requisits de memòria i estabilitat.

> **⚠️ Advertència:**
>
> Això és només el principi. La següent unitat puja el nivell: QuickSort, MergeSort, cerca amb hash, i complexitat en casos reals. Però si domines estos fonaments, lo demés és costa avall. Algorísmica és com anar en bici: al principi pareix impossible, després no se t'oblida mai.

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
