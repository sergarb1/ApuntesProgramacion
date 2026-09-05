---
title: "Butlletí U09 — Avançat"
description: "Exercicis de dificultat progressiva per a exprimir la unitat"
---

# 📝 Butlletí U09 — Avançat

> Dificultat progressiva. ⭐ per a escalfar, ⭐⭐ per a pensar, ⭐⭐⭐ per a concursar. Cada exercici inclou una pista (resisteix a mirar-la).

---

## ⭐ Exercici 1: La fusió d'arrays ordenats

Escriu un mètode `fusionarArrays(int[] a, int[] b)` que reba dos arrays ordenats de menor a major i torne un **nou array** també ordenat amb tots els elements d'ambdós. No uses `Arrays.sort()` ni col·leccions. Fes-ho amb l'algoritme de fusió (merge) tipus «dos punters».

**Pista:** avança amb dos índexs, un per array, comparant en cada pas quin element és menor. Quan un array s'acabe, copia la resta de l'altre.

---

## ⭐ Exercici 2: Rotació circular a la dreta

Implementa un mètode `rotarDerecha(int[] arr, int k)` que desplace cada element de l'array `k` posicions cap a la dreta. Els elements que «ixen» pel final tornen a entrar pel principi.

Exemple: `{1, 2, 3, 4, 5}` amb `k = 2` → `{4, 5, 1, 2, 3}`.

**Pista:** usa un array temporal de la grandària de `k` amb els últims `k` elements, desplaça la resta cap a la dreta i després col·loca els guardats al principi. (O dividix els índexs amb `(i + k) % arr.length`.)

---

## ⭐ Exercici 3: Suma de diagonals (matriu quadrada)

Crea un programa que genere una matriu quadrada `int[N][N]` amb valors aleatoris entre 1 i 100, i calcule:

1. Suma de la **diagonal principal** (de dalt-esquerra a baix-dreta).
2. Suma de la **diagonal secundària** (de dalt-dreta a baix-esquerra).
3. Diferència absoluta entre totes dues sumes.

Usa `N = 5` per a les proves i `Math.random()` per a omplir-la.

**Pista:** a la diagonal principal, `fila == columna`, així que un sol bucle amb `matriz[i][i]` basta. A la secundària, `columna = N - 1 - i`.

---

## ⭐⭐ Exercici 4: La cua del supermercat amb LinkedList

Simula una cua de supermercat usant `LinkedList<String>`. El programa ha de mostrar un menú:

1. **Arriba client** → Afig un nom al final de la cua.
2. **Atendre client** → Elimina i mostra el primer de la cua.
3. **Qui seguix?** → Mostra el primer sense eliminar-lo.
4. **Estat de la cua** → Mostra tots els clients en ordre.
0. **Eixir**

Usa els mètodes `addLast()`, `removeFirst()` i `getFirst()` de `LinkedList`, amb un `switch` i un `Scanner`.

**Pista:** el menú es repetix amb un `while` fins que l'usuari trie `0`. Cuida els casos en què la cua està buida abans de cridar `removeFirst()` o `getFirst()`.

---

## ⭐⭐ Exercici 5: Intersecció i unió de conjunts

Crea dos `HashSet<Integer>` amb números aleatoris (entre 1 i 20, 8 elements cada un). Calcula i mostra:

- **Intersecció:** elements que estan a tots dos conjunts.
- **Unió:** tots els elements sense repetir.
- **Diferència simètrica:** elements que estan en un o l'altre, però no en tots dos.

**Pista:** usa `retainAll()`, `addAll()` i `removeAll()` de la interfície `Set`. Per a la diferència simètrica: `union.removeAll(interseccion)`.

---

## ⭐⭐ Exercici 6: Eliminar duplicats mantenint l'ordre

Crea un `ArrayList<Integer>` amb elements repetits (`[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]`). Escriu un mètode que torne un nou `ArrayList<Integer>` **sense duplicats però mantenint l'ordre de primera aparició**.

**Pista:** un `HashSet` no val directament perquè perd l'ordre. Usa un `LinkedHashSet` (conserva l'ordre d'inserció) o recorre manualment comprovant amb `contains` abans d'afegir.

---

## ⭐⭐⭐ Exercici 7: Què imprimeix? — el remove que trenca el ball

Sense executar, respon què ocorre amb este programa:

```java
import java.util.ArrayList;

public class Puzle {
    public static void main(String[] args) {
        ArrayList<String> palabras = new ArrayList<>();
        palabras.add("hola");
        palabras.add("mundo");
        palabras.add("adiós");

        for (String p : palabras) {
            if (p.equals("mundo")) {
                palabras.remove(p);
            }
        }
        System.out.println(palabras);
    }
}
```

Imprimeix alguna cosa? O llança una excepció? Quina i per què?

**Pista:** pensa en el que fa el `for-each` per darrere (usa un `Iterator`) i en el que passa si la col·lecció canvia mentre es recorre.

---

## ⭐⭐⭐ Exercici 8: Estadístiques de classe

Demana a l'usuari les notes de 20 alumnes amb `Scanner`, guarda-les en un `double[]` i calcula:

- La nota mitjana.
- La nota més alta i la més baixa.
- Quants alumnes van aprovar (nota >= 5).

Usa un bucle per a omplir, un altre per a sumar i el patró del màxim/mínim acumulat.

**Pista:** per al mínim comença amb `Double.MAX_VALUE` (o amb la primera nota); per al màxim, amb `Double.MIN_VALUE` (o la primera nota). Guarda les notes en un array i recórre'l diverses voltes: cada càlcul és un bucle.

---

## ⭐⭐⭐ Exercici 9: El gran repte — busca-mines simplificat

Crea un array bidimensional `boolean[5][5]` que represente un camp de mines. Col·loca 5 mines en posicions **aleatòries** (amb `Math.random()`). L'usuari introduïx coordenades `(fila, columna)` i el programa diu si hi ha mina o no. Si encerta una mina, el joc acaba mostrant «¡BOOM!».

Extres opcionals: digues quantes mines hi ha al voltant de la casella (mira les 8 veïnes) i acaba quan hagis comprovat totes les caselles sense mines.

**Pista:** comprova abans de mirar una veïna que la seua fila i la seua columna estiguen entre 0 i 4, o eixiràs de l'array amb `ArrayIndexOutOfBoundsException`. El joc usa un `while` que acaba en trepitjar una mina o en esgotar les caselles.