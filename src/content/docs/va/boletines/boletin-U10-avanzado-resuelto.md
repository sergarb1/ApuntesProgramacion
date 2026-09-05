---
title: "Butlletí U10 — Avançat Resolt"
description: "Els mateixos exercicis que el butlletí avançat, amb solucions"
---

# 📝 Butlletí U10 — Avançat (Resolt)

> Les solucions estan amagades en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## ⭐ Exercici 1: La cua del supermercat amb LinkedList

<details>
<summary>🔄 Solució</summary>

```java
import java.util.LinkedList;
import java.util.Scanner;

public class ColaSupermercado {
    public static void main(String[] args) {
        LinkedList<String> cola = new LinkedList<>();
        Scanner sc = new Scanner(System.in);
        int opcion;

        do {
            System.out.println("\n1. Arriba client  2. Atendre client  3. Qui seguix?  4. Estat  0. Eixir");
            opcion = sc.nextInt();
            sc.nextLine();

            switch (opcion) {
                case 1:
                    System.out.print("Nom del client: ");
                    cola.addLast(sc.nextLine());
                    break;
                case 2:
                    if (!cola.isEmpty()) {
                        System.out.println("Atent a: " + cola.removeFirst());
                    } else {
                        System.out.println("No hi ha ningú a la cua.");
                    }
                    break;
                case 3:
                    if (!cola.isEmpty()) {
                        System.out.println("El seguent és: " + cola.getFirst());
                    } else {
                        System.out.println("No hi ha ningú a la cua.");
                    }
                    break;
                case 4:
                    System.out.println("Cua: " + cola);
                    break;
            }
        } while (opcion != 0);

        sc.close();
    }
}
```

`addLast` fica al final (els clients es posen darrere), `removeFirst` atén el primer (FIFO) i `getFirst` el mira sense traure'l. L'`isEmpty()` evita l'error de demanar-li el primer a una cua buida.

</details>

---

## ⭐⭐ Exercici 2: Intersecció i unió de conjunts

<details>
<summary>🔄 Solució</summary>

```java
import java.util.HashSet;
import java.util.Set;

public class Conjuntos {
    public static void main(String[] args) {
        Set<Integer> a = new HashSet<>();
        Set<Integer> b = new HashSet<>();

        while (a.size() < 8) a.add((int) (Math.random() * 20) + 1);
        while (b.size() < 8) b.add((int) (Math.random() * 20) + 1);

        Set<Integer> interseccion = new HashSet<>(a);
        interseccion.retainAll(b);

        Set<Integer> union = new HashSet<>(a);
        union.addAll(b);

        Set<Integer> difSimetrica = new HashSet<>(union);
        difSimetrica.removeAll(interseccion);

        System.out.println("A: " + a);
        System.out.println("B: " + b);
        System.out.println("Intersecció: " + interseccion);
        System.out.println("Unió: " + union);
        System.out.println("Diferència simètrica: " + difSimetrica);
    }
}
```

La màgia són els tres mètodes de `Set`: `retainAll` deixa només el comú, `addAll` unix sense duplicats i `removeAll` lleva la intersecció de la unió per a deixar el que està només en un dels dos. Com que `HashSet` no admet duplicats, la unió eix neta sola. El `while` garantix 8 elements únics en cada conjunt.

</details>

---

## ⭐⭐ Exercici 3: Eliminar duplicats mantenint l'ordre

<details>
<summary>🔄 Solució</summary>

```java
import java.util.ArrayList;
import java.util.LinkedHashSet;

public class SinDuplicados {
    public static ArrayList<Integer> sinDuplicados(ArrayList<Integer> lista) {
        LinkedHashSet<Integer> set = new LinkedHashSet<>(lista);
        return new ArrayList<>(set);
    }

    public static void main(String[] args) {
        ArrayList<Integer> lista = new ArrayList<>(java.util.Arrays.asList(3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5));
        System.out.println(sinDuplicados(lista)); // [3, 1, 4, 5, 9, 2, 6]
    }
}
```

`LinkedHashSet` és la combinació perfecta: elimina duplicats (com `HashSet`) però conserva l'ordre d'inserció (com una llista). Es construïx passant-li la llista i es torna a convertir en `ArrayList`. Resultat: `[3, 1, 4, 5, 9, 2, 6]`, sense repetits i en ordre de primera aparició.

</details>

---

## ⭐⭐⭐ Exercici 4: Què imprimeix? — el remove que trenca el ball

<details>
<summary>🔄 Solució</summary>

Llança una **`ConcurrentModificationException`**.

El `for-each` usa un `Iterator` per darrere. Quan dins del bucle crides `palabras.remove(p)`, la llista canvia mentre l'iterador la recorre. L'iterador detecta la modificació externa i explota. La solució és recórrer amb un `Iterator` explícit i usar `it.remove()`. O construir una llista nova amb els elements que vols conservar.

```java
import java.util.ArrayList;
import java.util.Iterator;

public class Puzle {
    public static void main(String[] args) {
        ArrayList<String> palabras = new ArrayList<>();
        palabras.add("hola");
        palabras.add("mundo");
        palabras.add("adiós");

        Iterator<String> it = palabras.iterator();
        while (it.hasNext()) {
            if (it.next().equals("mundo")) {
                it.remove();
            }
        }
        System.out.println(palabras); // [hola, adiós]
    }
}
```

</details>

---

## ⭐⭐ Exercici 5: Filtrar amb Iterator

<details>
<summary>🔄 Solució</summary>

```java
import java.util.ArrayList;
import java.util.Iterator;

public class FiltrarPares {
    public static void main(String[] args) {
        ArrayList<Integer> numeros = new ArrayList<>();
        for (int i = 1; i <= 10; i++) {
            numeros.add(i);
        }

        Iterator<Integer> it = numeros.iterator();
        while (it.hasNext()) {
            if (it.next() % 2 == 0) {
                it.remove();
            }
        }

        System.out.println(numeros); // [1, 3, 5, 7, 9]
    }
}
```

`it.next()` torna el número i avança; si és parell, `it.remove()` l'esborra de la llista original sense llançar excepció. Recorda: només pots esborrar l'element que acaba de tornar `next()`, i l'ordre importa.

</details>

---

## ⭐⭐ Exercici 6: El TreeSet ordenat

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;
import java.util.TreeSet;

public class PalabrasOrdenadas {
    public static void main(String[] args) {
        TreeSet<String> palabras = new TreeSet<>();
        Scanner sc = new Scanner(System.in);

        System.out.println("Escriu paraules (fi per a acabar):");
        String palabra = sc.nextLine();
        while (!palabra.equals("fi")) {
            palabras.add(palabra);
            palabra = sc.nextLine();
        }

        System.out.println("Ordenades: " + palabras);
        System.out.println("Primera: " + palabras.first());
        System.out.println("Última: " + palabras.last());
        System.out.println("Abans de 'm': " + palabras.headSet("m"));
        sc.close();
    }
}
```

El `TreeSet` ordena automàticament (ordre alfabètic) i **elimina duplicats**: si l'usuari repetix una paraula, només es guarda una volta. `first()` i `last()` donen els extrems; `headSet("m")` torna totes les paraules que van abans que "m" en l'ordre natural.

</details>

---

## ⭐⭐⭐ Exercici 7: Troba l'error — el bucle que explota

<details>
<summary>🔄 Solució</summary>

Llança una **`ConcurrentModificationException`**: el `for-each` recorre amb un `Iterator` intern, i en esborrar amb `nombres.remove(n)` mentre l'iterador avança, la col·lecció canvia per l'esquena i l'iterador explota.

Versió corregida amb `Iterator` explícit:

```java
import java.util.ArrayList;
import java.util.Iterator;

public class Error {
    public static void main(String[] args) {
        ArrayList<String> nombres = new ArrayList<>();
        nombres.add("Ana");
        nombres.add("Bob");
        nombres.add("Carla");

        Iterator<String> it = nombres.iterator();
        while (it.hasNext()) {
            if (it.next().equals("Bob")) {
                it.remove();
            }
        }
        System.out.println(nombres); // [Ana, Carla]
    }
}
```

`it.remove()` esborra l'últim element tornat per `next()` de la col·lecció original, sense que l'iterador es faça estranyes coses. És l'única forma segura d'"esborrar mentre recorres".

</details>

---

## ⭐⭐ Exercici 8: Què imprimeix? — Collections en acció

<details>
<summary>🔄 Solució</summary>

Imprimeix **`5`**.

- `Collections.sort(nums)` ordena la llista original → `[1, 3, 5, 8]`.
- `Collections.reverse(nums)` li dona la volta → `[8, 5, 3, 1]`.
- `nums.get(1)` torna la posició 1 → `5`.

Tots dos mètodes **modifiquen la llista al lloc**: no tornen una de nova. Per això, després de `sort` + `reverse`, la llista original ja està invertida.

</details>

---

## ⭐⭐⭐ Exercici 9: Estadístiques de classe amb ArrayList

<details>
<summary>🔄 Solució</summary>

```java
import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

public class Estadisticas {
    public static void main(String[] args) {
        ArrayList<Double> notas = new ArrayList<>();
        Scanner sc = new Scanner(System.in);

        for (int i = 0; i < 20; i++) {
            System.out.print("Nota de l'alumne " + (i + 1) + ": ");
            notas.add(sc.nextDouble());
        }

        double suma = 0;
        int aprovats = 0;
        for (double n : notas) {
            suma += n;
            if (n >= 5) aprovats++;
        }

        System.out.println("Mitjana: " + (suma / notas.size()));
        System.out.println("Màxima: " + Collections.max(notas));
        System.out.println("Mínima: " + Collections.min(notas));
        System.out.println("Aprovats: " + aprovats);
        sc.close();
    }
}
```

Un bucle ompli la llista, i el for-each fa la resta en una sola passada: acumula la suma i compta aprovats. `Collections.max` i `Collections.min` tornen el major i el menor segons l'ordre natural, sense escriure cap bucle a mà.

</details>