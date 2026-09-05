---
title: "Butlletí U04 — Avançat"
description: "Exercicis de dificultat progressiva per a exprimir els arrays"
---

# 📝 Butlletí U04 — Avançat

> Dificultat progressiva. ⭐ per a escalfar, ⭐⭐ per a pensar, ⭐⭐⭐ per a concursar. Cada exercici inclou una pista (resisteix a mirar-la).

---

## ⭐ Exercici 1: La fusió d'arrays ordenats

Escriu un mètode `fusionarArrays(int[] a, int[] b)` que reba dos arrays ordenats de menor a major i torne un **nou array** també ordenat amb tots els elements d'ambdós. No uses `Arrays.sort()`. Fes-ho amb l'algoritme de fusió (merge) tipus «dos punters».

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

## ⭐⭐ Exercici 4: Està ordenat?

Escriu un mètode `public static boolean estaOrdenado(int[] arr)` que torne `true` si l'array està ordenat **de menor a major** (cada element és menor o igual que el següent), i `false` en cas contrari.

Proves:

- `estaOrdenado({1, 2, 3, 4})` → `true`
- `estaOrdenado({1, 3, 2, 4})` → `false`
- `estaOrdenado({})` → `true`
- `estaOrdenado({7})` → `true`

**Pista:** recorre amb un `for` de `i = 1` fins al final i pregunta si `arr[i] < arr[i - 1]`. En el moment que un veí trenque l'ordre, torna `false`.

---

## ⭐⭐ Exercici 5: L'invers al lloc

Escriu un mètode `public static void invertir(int[] arr)` que done la volta a l'array **sense crear un altre array** (usa dos punters i una variable temporal).

Prova amb `{1, 2, 3, 4, 5}` i mostra el resultat amb `Arrays.toString` → ha d'eixir `[5, 4, 3, 2, 1]`.

**Pista:** `izquierda = 0` i `derecha = arr.length - 1`; mentre `izquierda < derecha`, intercanvia i mou tots dos cap al centre.

---

## ⭐⭐ Exercici 6: Què imprimeix? — el doble bucle que compta parelles

Sense executar, escriu l'eixida exacta d'este programa:

```java
public class CuentaParejas {
    public static void main(String[] args) {
        int[] datos = {2, 4, 6};
        int contador = 0;

        for (int i = 0; i < datos.length; i++) {
            for (int j = i + 1; j < datos.length; j++) {
                if (datos[i] < datos[j]) {
                    contador++;
                }
            }
        }

        System.out.println(contador);
    }
}
```

**Pista:** compta les parelles `(i, j)` amb `i < j` on el primer és menor que el segon. Amb `{2, 4, 6}` totes les parelles ho complixen. Quantes n'hi ha?

---

## ⭐⭐⭐ Exercici 7: Estadístiques de classe

Demana a l'usuari les notes de 20 alumnes amb `Scanner`, guarda-les en un `double[]` i calcula:

- La nota mitjana.
- La nota més alta i la més baixa.
- Quants alumnes van aprovar (nota >= 5).

Usa un bucle per a omplir, un altre per a sumar i el patró del màxim/mínim acumulat.

**Pista:** per al mínim comença amb la primera nota; per al màxim, també. Guarda les notes en un array i recórre'l diverses voltes: cada càlcul és un bucle.

---

## ⭐⭐⭐ Exercici 8: El gran repte — busca-mines simplificat

Crea un array bidimensional `boolean[5][5]` que represente un camp de mines. Col·loca 5 mines en posicions **aleatòries** (amb `Math.random()`). L'usuari introduïx coordenades `(fila, columna)` i el programa diu si hi ha mina o no. Si encerta una mina, el joc acaba mostrant «¡BOOM!».

Extres opcionals: digues quantes mines hi ha al voltant de la casella (mira les 8 veïnes) i acaba quan hagis comprovat totes les caselles sense mines.

**Pista:** comprova abans de mirar una veïna que la seua fila i la seua columna estiguen entre 0 i 4, o eixiràs de l'array amb `ArrayIndexOutOfBoundsException`. El joc usa un `while` que acaba en trepitjar una mina o en esgotar les caselles.

---

## ⭐⭐⭐ Exercici 9: Compactar — els zeros al final

Escriu un mètode `public static void compactar(int[] arr)` que moga tots els zeros al final de l'array, **mantenint l'ordre** dels elements que no són zero.

Exemples:

- `{0, 3, 0, 1, 0, 2}` → `{3, 1, 2, 0, 0, 0}`
- `{1, 2, 3}` → `{1, 2, 3}`
- `{0, 0, 0}` → `{0, 0, 0}`

**Pista:** usa un segon índex `pos` que marque on va el següent valor no zero. Recorre amb `i`, i quan `arr[i]` no siga 0, copia'l a `arr[pos]` i puja `pos`. Al final, ompli de zeros des de `pos` fins al final.