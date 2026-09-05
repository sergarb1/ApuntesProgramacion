---
title: "08 — Altres tècniques algorísmiques"
description: "Dos fitxes més per al teu cinturó: els algorismes voracos (greedy) i el backtracking 🧠"
---

<p><small>Dos fitxes més per al teu cinturó: els algorismes voracos (greedy) i el backtracking 🧠</small></p>

> 🗺️ **Estàs en:** ⚡ **U05 · Algorítmica II: Tècniques** → 08 · Altres tècniques algorísmiques

---

## 📬 La idea en una frase

> **Recursivitat i divide i venceràs no són les úniques tècniques: els algorismes voracos prenen la decisió que millor pinta en cada pas, i el backtracking prova camins i retrocedix quan arriba a un cul-de-sac.**

Esta unitat ja t'ha donat les ferramentes estrella. Estos dos punts extra són "per a saber que existixen" i reconéixer-los quan els veges, perquè apareixen en munts de problemes reals (i en entrevistes). T'avise: ací no implementaràs res gegant, entendràs *la idea* amb exemples senzills.

---

## 🍬 Algorismes voracos (greedy)

**La idea:** en cada pas, pren la decisió que pareix millor *en eixe moment*, sense mirar arrere ni avant. Com qui compra caramels i sempre agafa el més gran dels que queden.

**La regla d'or:** un greedy només funciona si la decisió local òptima conduïx a la solució global òptima. Això no sempre passa. Quan funciona, és dels algorismes més ràpids i simples que existixen.

### Exemple clàssic: el canvi de monedes

Donat un preu i els diners entregats, tornar el canvi amb el **menor nombre de monedes**:

```java
public class CambioMonedas {

    public static void main(String[] args) {
        int[] monedas = {200, 100, 50, 20, 10, 5, 2, 1};
        int cambio = 173;   // 1,73 €

        for (int moneda : monedas) {
            int cuantas = cambio / moneda;
            cambio %= moneda;
            if (cuantas > 0) {
                System.out.println(cuantas + " moneda(s) de " + moneda + " céntimos");
            }
        }
    }
}
```

Eixida:

```
1 moneda(s) de 100 céntimos
1 moneda(s) de 50 céntimos
1 moneda(s) de 20 céntimos
1 moneda(s) de 2 céntimos
1 moneda(s) de 1 céntimos
```

> [!NOTE]
> L'algorisme vorac de la moneda funciona amb el sistema de monedes europeu (on cada moneda és múltiple de l'anterior). Amb sistemes estranys (p. ex. monedes d'1, 3 i 4), el vorac **falla**: amb canvi 6, el vorac donaria 4+1+1 (3 monedes) quan la solució òptima és 3+3 (2 monedes). La lliçó: *vorac = ràpid i simple, però no sempre òptim*.

### Altres exemples famosos de greedy

- **El problema de la motxilla (versió fraccionària)**: caben només objectes "a trossos", i omplis la motxilla començant pel de millor relació valor/pes.
- **L'arbre d'expansió mínim (Prim, Kruskal)**: connectes tots els nodes gastant el mínim cable.
- **El problema del canvi**, com acabes de vore.
- **Planificació de tasques**: atendre primer la tasca que acaba abans.

---

## 🔁 Backtracking (volta arrere)

**La idea:** proves una opció; si arribes a un cul-de-sac, **desfàs l'últim pas** (d'ací el nom) i proves la següent opció. És una cerca exhaustiva i intel·ligent alhora, perquè *no insistix* en camins que ja saps que no porten enlloc.

El patró clàssic és recursiu:

```java
public static void resolver(opciones, pasosDados) {
    if (solucionCompleta) { ... }        // cas base: ho has aconseguit
    if (culDeSac) { return; }            // poda: no insistir

    for (opcion : opcionesPosibles) {
        tomar(opcion);
        resolver(opciones, pasosDados + 1);   // provar el següent pas
        deshacer(opcion);                     // ¡la volta arrere!
    }
}
```

Eixe `deshacer(opcion)` és el cor del backtracking: si el camí no funciona, reculls el que vas posar i proves un altre.

### Exemple senzill: el laberint

En un laberint representat com una matriu de caràcters (`'.'` = passadís, `'#'` = paret), intenta avançar cap a l'eixida. Quan una casella no porta enlloc, desfàs el moviment:

```java
public class Laberinto {

    static char[][] lab = {
        {'S', '.', '#', '#'},
        {'#', '.', '.', '#'},
        {'#', '#', '.', 'E'}
    };

    static boolean salir(int fila, int col) {
        if (fila < 0 || col < 0 || fila >= lab.length || col >= lab[0].length) return false;
        if (lab[fila][col] == '#') return false;                 // paret: cul-de-sac
        if (lab[fila][col] == 'E') return true;                  // cas base: ¡eixida!

        lab[fila][col] = '*';                                    // marque la casella com a visitada

        boolean encontrado = salir(fila + 1, col)
                          || salir(fila - 1, col)
                          || salir(fila, col + 1)
                          || salir(fila, col - 1);

        lab[fila][col] = '.';                                    // la volta arrere: la deixe lliure

        return encontrado;
    }

    public static void main(String[] args) {
        System.out.println(salir(0, 0) ? "¡Eixida trobada!" : "No hi ha eixida.");
    }
}
```

Fixa't en les dues jugades: marcar la casella com a visitada **evita donar voltes en cercle** i desmarcar-la en fallar **permet provar altres camins**. Eixe és el ball del backtracking.

### Altres exemples famosos

- **Les 8 reines**: col·locar 8 reines en un tauler sense que s'ataquen.
- **El Sudoku**: provar nombres i retrocedir quan la casella es queda sense candidats.
- **La suma de subconjunts**: trobar quins nombres d'una llista sumen un valor exacte.
- **Generar totes les permutacions**: totes les ordenacions possibles d'un conjunt.

> [!TIP]
> Si alguna vegada sentes "exhaustiva però amb poda", això és backtracking: no et rendixes fins a provar-ho tot, però **tires a la brossa de seguida** els camins que ja saps que són cul-de-sac. És la diferència entre buscar una agulla en un paller i buscar una agulla sabent en quina meitat del paller no està.

---

## 🧠 I amb això, el panorama

Ja tens el mapa de les tècniques més importants:

| Tècnica | Idea | Típica per a |
|---|---|---|
| Recursivitat | Resoldre una versió més xicoteta de si mateix | Estructures jeràrquiques |
| Divide i venceràs | Dividir, conquistar, combinar | Ordenació, cerca |
| Vorac (greedy) | Decisió òptima local en cada pas | Canvi de monedes, planificació |
| Backtracking | Provar, retrocedir, provar de nou | Jocs, Sudoku, laberints |
| Programació dinàmica | Memoització + subproblemes superposats | Fibonacci optimitzat (¡ja ho vas vore!) |

La programació dinàmica és l'"evolució" de la memoització del punt 2: la veuràs amb més profunditat en unitats avançades, però ja portes el germen.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què significa que un algorisme siga "vorac"?
2. El greedy del canvi de monedes és sempre òptim?
3. Quin és el pas més característic del backtracking?
4. Per què es marca una casella com a visitada en el laberint?

<details>
<summary>🔄 Respostes</summary>

1. Que en **cada pas pren la decisió localment òptima**, sense mirar el futur.
2. **No sempre**: amb certs conjunts de monedes (1, 3, 4) falla. El vorac és òptim només quan la decisió local garantix la global.
3. **`deshacer(opcion)`**: si un camí no funciona, es recull l'últim pas i es prova una altra opció.
4. Per a **no entrar en bucles infinits**: sense marcar, l'algorisme aniria d'una casella a una altra sense fi.

</details>

---

## ✅ Resum en 3 frases

1. Els algorismes **voracos** trien en cada pas la millor opció local; són rapidíssims però només òptims en certs problemes.
2. El **backtracking** prova camins i, en arribar a un cul-de-sac, **retrocedix** desfent l'últim pas.
3. Juntament amb la recursivitat i divide i venceràs, estes tècniques completen el teu cinturó algorísmic bàsic de DAM.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Greedy | Prendre la decisió òptima local en cada pas |
> | Òptim local vs global | El millor ara vs el millor en conjunt |
> | Backtracking | Provar, i en fallar, desfer i provar una altra opció |
> | Poda | Descartar de seguida els camins sense eixida |
> | Programació dinàmica | Memoització + subproblemes que es repetixen |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/05-algoritmica-tecnicas) · **Anterior:** [07 · Be the Code: quicksort des de zero](/ApuntesProgramacion/va/05-algoritmica-tecnicas/07-be-the-code-quicksort) · **Següent:** [09 · Repàs interactiu](/ApuntesProgramacion/va/05-algoritmica-tecnicas/09-repaso-interactivo)