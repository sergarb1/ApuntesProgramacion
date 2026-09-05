---
title: "Boletín U10 — Avanzado Resuelto"
description: "Los mismos ejercicios que el boletín avanzado, con soluciones"
---

# 📝 Boletín U10 — Avanzado (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## ⭐ Ejercicio 1: La cola del supermercado con LinkedList

<details>
<summary>🔄 Solución</summary>

```java
import java.util.LinkedList;
import java.util.Scanner;

public class ColaSupermercado {
    public static void main(String[] args) {
        LinkedList<String> cola = new LinkedList<>();
        Scanner sc = new Scanner(System.in);
        int opcion;

        do {
            System.out.println("\n1. Llega cliente  2. Atender cliente  3. ¿Quién sigue?  4. Estado  0. Salir");
            opcion = sc.nextInt();
            sc.nextLine();

            switch (opcion) {
                case 1:
                    System.out.print("Nombre del cliente: ");
                    cola.addLast(sc.nextLine());
                    break;
                case 2:
                    if (!cola.isEmpty()) {
                        System.out.println("Atendiendo a: " + cola.removeFirst());
                    } else {
                        System.out.println("No hay nadie en la cola.");
                    }
                    break;
                case 3:
                    if (!cola.isEmpty()) {
                        System.out.println("El siguiente es: " + cola.getFirst());
                    } else {
                        System.out.println("No hay nadie en la cola.");
                    }
                    break;
                case 4:
                    System.out.println("Cola: " + cola);
                    break;
            }
        } while (opcion != 0);

        sc.close();
    }
}
```

`addLast` mete al final (los clientes se ponen detrás), `removeFirst` atiende al primero (FIFO) y `getFirst` lo mira sin sacarlo. El `isEmpty()` evita el error de pedirle el primero a una cola vacía.

</details>

---

## ⭐⭐ Ejercicio 2: Intersección y unión de conjuntos

<details>
<summary>🔄 Solución</summary>

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
        System.out.println("Intersección: " + interseccion);
        System.out.println("Unión: " + union);
        System.out.println("Diferencia simétrica: " + difSimetrica);
    }
}
```

La magia son los tres métodos de `Set`: `retainAll` deja solo lo común, `addAll` une sin duplicados y `removeAll` quita la intersección de la unión para dejar lo que está solo en uno de los dos. Como `HashSet` no admite duplicados, la unión sale limpia sola. El `while` garantiza 8 elementos únicos en cada conjunto.

</details>

---

## ⭐⭐ Ejercicio 3: Eliminar duplicados manteniendo el orden

<details>
<summary>🔄 Solución</summary>

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

`LinkedHashSet` es la combinación perfecta: elimina duplicados (como `HashSet`) pero conserva el orden de inserción (como una lista). Se construye pasándole la lista y se vuelve a convertir en `ArrayList`. Resultado: `[3, 1, 4, 5, 9, 2, 6]`, sin repetidos y en orden de primera aparición.

</details>

---

## ⭐⭐⭐ Ejercicio 4: ¿Qué imprime? — el remove que rompe el baile

<details>
<summary>🔄 Solución</summary>

Lanza una **`ConcurrentModificationException`**.

El `for-each` usa un `Iterator` por debajo. Cuando dentro del bucle llamas a `palabras.remove(p)`, la lista cambia mientras el iterador la está recorriendo. El iterador detecta la modificación externa y explota. La solución es recorrer con un `Iterator` explícito y usar `it.remove()`. O construir una nueva lista con los elementos que quieres conservar.

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

## ⭐⭐ Ejercicio 5: Filtrar con Iterator

<details>
<summary>🔄 Solución</summary>

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

`it.next()` devuelve el número y avanza; si es par, `it.remove()` lo borra de la lista original sin lanzar excepción. Recuerda: solo puedes borrar el elemento que acaba de devolver `next()`, y el orden importa.

</details>

---

## ⭐⭐ Ejercicio 6: El TreeSet ordenado

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;
import java.util.TreeSet;

public class PalabrasOrdenadas {
    public static void main(String[] args) {
        TreeSet<String> palabras = new TreeSet<>();
        Scanner sc = new Scanner(System.in);

        System.out.println("Escribe palabras (fin para terminar):");
        String palabra = sc.nextLine();
        while (!palabra.equals("fin")) {
            palabras.add(palabra);
            palabra = sc.nextLine();
        }

        System.out.println("Ordenadas: " + palabras);
        System.out.println("Primera: " + palabras.first());
        System.out.println("Última: " + palabras.last());
        System.out.println("Antes de 'm': " + palabras.headSet("m"));
        sc.close();
    }
}
```

El `TreeSet` ordena automáticamente (orden alfabético) y **elimina duplicados**: si el usuario repite una palabra, solo se guarda una vez. `first()` y `last()` dan los extremos; `headSet("m")` devuelve todas las palabras que van antes que "m" en el orden natural.

</details>

---

## ⭐⭐⭐ Ejercicio 7: Encuentra el error — el bucle que explota

<details>
<summary>🔄 Solución</summary>

Lanza una **`ConcurrentModificationException`**: el `for-each` recorre con un `Iterator` interno, y al borrar con `nombres.remove(n)` mientras el iterador avanza, la colección cambia por la espalda y el iterador explota.

Versión corregida con `Iterator` explícito:

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

`it.remove()` borra el último elemento devuelto por `next()` de la colección original, sin que el iterador se entere de nada raro. Es la única forma segura de "borrar mientras recorres".

</details>

---

## ⭐⭐ Ejercicio 8: ¿Qué imprime? — Collections en acción

<details>
<summary>🔄 Solución</summary>

Imprime **`5`**.

- `Collections.sort(nums)` ordena la lista original → `[1, 3, 5, 8]`.
- `Collections.reverse(nums)` le da la vuelta → `[8, 5, 3, 1]`.
- `nums.get(1)` devuelve la posición 1 → `5`.

Ambos métodos **modifican la lista en el sitio**: no devuelven una nueva. Por eso, tras `sort` + `reverse`, la lista original ya está invertida.

</details>

---

## ⭐⭐⭐ Ejercicio 9: Estadísticas de clase con ArrayList

<details>
<summary>🔄 Solución</summary>

```java
import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

public class Estadisticas {
    public static void main(String[] args) {
        ArrayList<Double> notas = new ArrayList<>();
        Scanner sc = new Scanner(System.in);

        for (int i = 0; i < 20; i++) {
            System.out.print("Nota del alumno " + (i + 1) + ": ");
            notas.add(sc.nextDouble());
        }

        double suma = 0;
        int aprobados = 0;
        for (double n : notas) {
            suma += n;
            if (n >= 5) aprobados++;
        }

        System.out.println("Media: " + (suma / notas.size()));
        System.out.println("Máxima: " + Collections.max(notas));
        System.out.println("Mínima: " + Collections.min(notas));
        System.out.println("Aprobados: " + aprobados);
        sc.close();
    }
}
```

Un bucle rellena la lista, y el for-each hace el resto en una sola pasada: acumula la suma y cuenta aprobados. `Collections.max` y `Collections.min` devuelven el mayor y el menor según el orden natural, sin escribir ningún bucle a mano.

</details>