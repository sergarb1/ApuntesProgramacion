---
title: "Butlletí U10 — Avançat"
description: "Exercicis de dificultat progressiva per a exprimir les col·leccions"
---

# 📝 Butlletí U10 — Avançat

> Dificultat progressiva. ⭐ per a escalfar, ⭐⭐ per a pensar, ⭐⭐⭐ per a concursar. Cada exercici inclou una pista (resistix a mirar-la).

---

## ⭐ Exercici 1: La cua del supermercat amb LinkedList

Simula una cua de supermercat usant `LinkedList<String>`. El programa ha de mostrar un menú:

1. **Arriba client** → Afig un nom al final de la cua.
2. **Atendre client** → Elimina i mostra el primer de la cua.
3. **Qui seguix?** → Mostra el primer sense eliminar-lo.
4. **Estat de la cua** → Mostra tots els clients en ordre.
0. **Eixir**

Usa els mètodes `addLast()`, `removeFirst()` i `getFirst()` de `LinkedList`, amb un `switch` i un `Scanner`.

**Pista:** el menú es repetix amb un `while` fins que l'usuari trie `0`. Cuida els casos en què la cua està buida abans de cridar `removeFirst()` o `getFirst()`.

---

## ⭐⭐ Exercici 2: Intersecció i unió de conjunts

Crea dos `HashSet<Integer>` amb números aleatoris (entre 1 i 20, 8 elements cada un). Calcula i mostra:

- **Intersecció:** elements que estan en tots dos conjunts.
- **Unió:** tots els elements sense repetir.
- **Diferència simètrica:** elements que estan en un o en l'altre, però no en tots dos.

**Pista:** usa `retainAll()`, `addAll()` i `removeAll()` de la interfície `Set`. Per a la diferència simètrica: `union.removeAll(interseccion)`.

---

## ⭐⭐ Exercici 3: Eliminar duplicats mantenint l'ordre

Crea un `ArrayList<Integer>` amb elements repetits (`[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]`). Escriu un mètode que torne un nou `ArrayList<Integer>` **sense duplicats però mantenint l'ordre de primera aparició**.

**Pista:** un `HashSet` no val directament perquè perd l'ordre. Usa un `LinkedHashSet` (conserva l'ordre d'inserció) o recorre manualment comprovant amb `contains` abans d'afegir.

---

## ⭐⭐⭐ Exercici 4: Què imprimeix? — el remove que trenca el ball

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

**Pista:** pensa en què fa el `for-each` per darrere (usa un `Iterator`) i en què passa si la col·lecció canvia mentre es recorre.

---

## ⭐⭐ Exercici 5: Filtrar amb Iterator

Crea un `ArrayList<Integer>` amb els números de l'1 al 10. Recórrel amb un `Iterator<Integer>` explícit i **esborra tots els números parells** usant `it.remove()`. Al final, imprimeix la llista.

**Pista:** recorre amb `while (it.hasNext())`, obtín cada número amb `it.next()` i comprova si és parell amb `% 2 == 0`. Mai no uses `lista.remove(...)` dins del bucle.

---

## ⭐⭐ Exercici 6: El TreeSet ordenat

Crea un programa que demane a l'usuari paraules amb `Scanner` fins que escriga `"fi"`. Guarda-les en un `TreeSet<String>`. En acabar, mostra:

1. Les paraules ordenades (imprimir el TreeSet directament).
2. La primera paraula (`first()`) i l'última (`last()`).
3. Les paraules que van abans que `"m"` en ordre alfabètic (`headSet("m")`).

**Pista:** el TreeSet ordena i elimina duplicats automàticament. Comprova què passa si l'usuari repetix una paraula.

---

## ⭐⭐⭐ Exercici 7: Troba l'error — el bucle que explota

```java
import java.util.ArrayList;

public class Error {
    public static void main(String[] args) {
        ArrayList<String> nombres = new ArrayList<>();
        nombres.add("Ana");
        nombres.add("Bob");
        nombres.add("Carla");

        for (String n : nombres) {
            if (n.equals("Bob")) {
                nombres.remove(n);
            }
        }
        System.out.println(nombres);
    }
}
```

Este programa compila però **es cau en executar-se**. Quina excepció llança i per què? Reescriu-lo usant un `Iterator` explícit perquè funcione.

**Pista:** el `for-each` amaga un `Iterator`. Esborrar amb el `remove()` de la llista mentre l'iterador recorre és una declaració de guerra.

---

## ⭐⭐ Exercici 8: Què imprimeix? — Collections en acció

Sense executar, respon què imprimeix:

```java
import java.util.*;

public class Puzzle {
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

**Pista:** recorda que `sort` i `reverse` **modifiquen la llista original**. Primer ordena, després dona la volta, i mira què queda a la posició 1.

---

## ⭐⭐⭐ Exercici 9: Estadístiques de classe amb ArrayList

Demana a l'usuari les notes de 20 alumnes amb `Scanner`, guarda-les en un `ArrayList<Double>` i calcula:

- La nota mitjana.
- La nota més alta i la més baixa (pots usar `Collections.max()` i `Collections.min()`).
- Quants alumnes van aprovar (nota >= 5).

Usa un bucle per a omplir la llista i un for-each per a sumar.

**Pista:** per a la mitjana acumula la suma amb un for-each i dividix entre `notas.size()`. Per a aprovats, compta al mateix bucle. `Collections.max` i `Collections.min` t'estalvien els bucles del màxim/mínim.