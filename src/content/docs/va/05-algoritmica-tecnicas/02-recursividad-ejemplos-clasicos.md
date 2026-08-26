---
title: "02 — Recursivitat: exemples clàssics"
description: "Factorial, Fibonacci, palíndroms i torres de Hanoi: els quatre genets de l'apocalipsi recursiu 🧮"
---

<p><small>Factorial, Fibonacci, palíndroms i torres de Hanoi: els quatre genets de l'apocalipsi recursiu 🧮</small></p>

> 🗺️ **Estàs en:** ⚡ **U05 · Algorítmica II: Tècniques** → 02 · Recursivitat: exemples clàssics

---

## 📬 La idea en una frase

> **Estos quatre exemples et perseguiran la resta de la teua carrera: apareixen en exàmens, entrevistes tècniques i converses d'ascensor amb altres programadors, així que més val dominar-los.**

En el punt 1 vas vore la teoria: cas base, cas recursiu i la pila. Ara toca el museu dels clàssics. Cada un t'ensenya una lliçó diferent, des de l'elegància lineal del factorial fins a l'horror exponencial del Fibonacci ingenu.

---

## 🧮 Factorial: el "Hola Món" de la recursivitat

```java
public class Factorial {

    static long fact(int n) {
        if (n <= 1) return 1;          // cas base: 0! i 1! valen 1
        return n * fact(n - 1);        // cas recursiu
    }

    public static void main(String[] args) {
        System.out.println("fact(5) = " + fact(5));   // 120
        System.out.println("fact(0) = " + fact(0));   // 1
        System.out.println("fact(7) = " + fact(7));   // 5040
    }
}
```

Què passa quan cridem `fact(4)`? Anem pas a pas:

```
fact(4) → 4 * fact(3)
       → 4 * (3 * fact(2))
       → 4 * (3 * (2 * fact(1)))
       → 4 * (3 * (2 * 1))
       → 4 * (3 * 2)
       → 4 * 6
       → 24
```

Primer "baixa" fins al cas base, després "puja" fent les multiplicacions. Com un ascensor que baixa al soterrani i torna a pujar parant a cada porta. La complexitat és **O(n)**: una crida per cada nombre.

> [!NOTE]
> Ull amb `long`: `fact(20)` ja és 2.432.902.008.176.640.000, quasi al límit de `long`. A partir del 21, desbordes. El factorial creix **molt** de pressa.

---

## 🐰 Fibonacci ingenu: no ho faces a casa

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

Executa això. Seran uns segons d'infern. El problema? `fibo(40)` genera un **arbre de crides monstruós**. Cada crida es bifurca en dos, que es bifurquen en dos, etc. El nombre total de crides és aproximadament **O(2ⁿ)**.

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

Compta les vegades que es crida `fibo(1)`. Exacte, massa. És com preguntar al teu company una vegada i una altra la mateixa pregunta esperant una resposta diferent. Això, senyor meu, és bogeria.

> [!TIP]
> Este és l'exemple perfecte per a entendre per què **l'eficiència importa**. Un algorisme que es veu bonic en codi pot ser un desastre en temps d'execució. El Fibonacci ingenu és el rei dels algorismes bonics però inútils per a nombres grans.

---

## ⚡ Fibonacci optimitzat: amb memoització, ara sí

```java
public class FiboOptimizado {

    static long[] memo;

    static long fibo(int n) {
        if (n <= 1) return n;
        if (memo[n] != 0) return memo[n];      // ja el calculàrem abans
        memo[n] = fibo(n - 1) + fibo(n - 2);
        return memo[n];
    }

    public static void main(String[] args) {
        int n = 92;
        memo = new long[n + 1];
        long inicio = System.currentTimeMillis();
        System.out.println("fibo(" + n + ") = " + fibo(n)); // instantani
        long fin = System.currentTimeMillis();
        System.out.println("Tiempo: " + (fin - inicio) + " ms");
    }
}
```

Què canvia? Guardem els resultats en un array (`memo[]`) per a no recalcular. Si ja hem calculat `fibo(10)`, el retornem directament. Cada Fibonacci es calcula **una sola vegada**.

La millora és brutal: de **O(2ⁿ) a O(n)**. Eixa és la pujada de nivell més gran des que vas passar de pedra a pokéball.

> [!NOTE]
> Això es diu **memoització** (sí, sense la "r"). Consistix en: "si ja ho vaig calcular, no ho torne a calcular; ho guarde en un array o mapa i ho reutilitze". És la base de la **programació dinàmica**, que veuràs en unitats més avançades.

---

## 🔍 Palíndroms: la paraula mirall

Un palíndrom és una paraula que es llig igual d'avant cap arrere: *reconèixer*, *salas*, *ana*. Com es comprova amb recursió?

```java
public class Palindromo {

    static boolean esPalindromo(String s, int inicio, int fin) {
        if (inicio >= fin) return true;                    // cas base: queden 0 o 1 lletres
        if (s.charAt(inicio) != s.charAt(fin)) return false; // cas base: les puntes no coincideixen
        return esPalindromo(s, inicio + 1, fin - 1);       // cas recursiu: "pelem" les puntes
    }

    public static void main(String[] args) {
        String[] pruebas = {"reconocer", "salas", "hola", "anana", "a"};
        for (String s : pruebas) {
            System.out.println(s + " -> " + esPalindromo(s, 0, s.length() - 1));
        }
    }
}
```

Eixida:

```
reconocer -> true
salas -> true
hola -> false
anana -> true
a -> true
```

La idea és elegant: compares la primera i l'última lletra; si no coincideixen, no és palíndrom; si coincideixen, repetixes amb les lletres de dins. Com a pelar una ceba, però de lletres.

---

## 🗼 Torres de Hanoi: el rei dels clàssics

El mite: tres varetes i una pila de discos de mida creixent. Cal moure tots els discos de la vareta A a la C, amb dues regles: només es mou un disc alhora i mai no pot quedar un disc gran sobre un de xicotet. La llegenda diu que quan els monjos acaben, el món s'acabarà (amb 64 discos, no ens preocupem).

```java
public class Hanoi {

    static void mover(int n, char origen, char destino, char auxiliar) {
        if (n == 1) {
            System.out.println("Mueve disco 1 de " + origen + " a " + destino);
            return;                                    // cas base
        }
        mover(n - 1, origen, auxiliar, destino);       // els n-1 discos de dalt, a la vareta auxiliar
        System.out.println("Mueve disco " + n + " de " + origen + " a " + destino);
        mover(n - 1, auxiliar, destino, origen);       // i ara els n-1 discos, al damunt
    }

    public static void main(String[] args) {
        mover(3, 'A', 'C', 'B');
    }
}
```

Amb 3 discos, l'eixida és:

```
Mueve disco 1 de A a C
Mueve disco 2 de A a B
Mueve disco 1 de C a B
Mueve disco 3 de A a C
Mueve disco 1 de B a A
Mueve disco 2 de B a C
Mueve disco 1 de A a C
```

Són **2ⁿ − 1** moviments. Amb 3 discos: 7. Amb 64 discos: 18.446.744.073.709.551.615. Al ritme d'un moviment per segon, l'univers es mor abans. Hanoi és l'exemple que la recursió pot resoldre en 6 línies el que iterativament et faria patir de veritat.

> [!WARNING]
> Hanoi és **exponencial** (O(2ⁿ)) per naturalesa: no és que ho hagueres implementat malament, és que el problema *és* exponencial. La moralina és una altra: una solució recursiva curta i clara val més que un bucle il·legible que intenta emular-la amb piles manuals.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quina és la complexitat del factorial recursiu?
2. Quantes vegades es crida `fibo(1)` en calcular `fibo(5)` amb el mètode ingenu? (pista: mira-ho en l'arbre)
3. Què fa la memoització per a millorar Fibonacci?
4. Quants moviments necessita Hanoi amb 4 discos?

<details>
<summary>🔄 Respostes</summary>

1. **O(n)**: una crida per cada nombre, i cada crida fa treball constant.
2. **5 vegades** (a l'arbre de la unitat es veu clar: `fibo(1)` apareix en 5 fulles).
3. Guarda cada resultat ja calculat en un array per a **no repetir càlculs**: de O(2ⁿ) a O(n).
4. **15** moviments (`2⁴ − 1`).

</details>

---

## ✅ Resum en 3 frases

1. El **factorial** (O(n)) i els **palíndroms** són els exemples "lineals": recorren el problema cap al cas base sense sorpreses.
2. El **Fibonacci ingenu** és O(2ⁿ): els números exploten perquè repetix càlculs; la **memoització** el deixa en O(n).
3. Les **torres de Hanoi** demostren que la recursió expressa en poques línies problemes que iterativament són un infern.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Memoització | Guardar resultats ja calculats per a reutilitzar-los |
> | Palíndrom | Paraula que es llig igual d'avant cap arrere: *salas* |
> | Recursió lineal | La que fa una sola crida recursiva per invocació (factorial) |
> | Recursió exponencial | La que es bifurca en diverses crides (Fibonacci, Hanoi) |
> | `long` | Tipus per a números grans... fins que el factorial el desborda |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/05-algoritmica-tecnicas) · **Anterior:** [01 · Recursivitat](/ApuntesProgramacion/va/05-algoritmica-tecnicas/01-recursividad) · **Següent:** [03 · Divide i venceràs](/ApuntesProgramacion/va/05-algoritmica-tecnicas/03-divide-y-venceras)
