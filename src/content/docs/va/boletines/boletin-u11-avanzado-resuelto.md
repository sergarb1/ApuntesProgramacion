---
title: "Butlletí U11 — Avançat Resolt"
description: "Els mateixos exercicis que el butlletí avançat, amb solucions"
---

# 📝 Butlletí U11 — Avançat (Resolt)

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

`addLast` fica al final (els clients es posen darrere), `removeFirst` atén el primer (FIFO) i `getFirst` el mira sense traure-lo. El `isEmpty()` evita l'error de demanar-li el primer a una cua buida.

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
        System.out.println("Intersección: " + interseccion);
        System.out.println("Unión: " + union);
        System.out.println("Diferencia simétrica: " + difSimetrica);
    }
}
```

La màgia són els tres mètodes de `Set`: `retainAll` deixa només el comú, `addAll` uni sense duplicats i `removeAll` lleva la intersecció de la unió per a deixar el que està només en un dels dos. Com que `HashSet` no admet duplicats, la unió ix neta sola. El `while` garanteix 8 elements únics en cada conjunt.

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

El `for-each` usa un `Iterator` per davall. Quan dins del bucle crides a `palabras.remove(p)`, la llista canvia mentre l'iterador la està recorrent. L'iterador detecta la modificació externa i explota. La solució és recórrer amb un `Iterator` explícit i usar `it.remove()`. O construir una llista nova amb els elements que vols conservar.

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

`it.next()` torna el número i avança; si és parell, `it.remove()` el borra de la llista original sense llançar excepció. Recorda: només pots borra l'element que acaba de tornar `next()`, i l'ordre importa.

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

El `TreeSet` ordena automàticament (ordre alfabètic) i **elimina duplicats**: si l'usuari repetix una paraula, només es guarda una vegada. `first()` i `last()` donen els extrems; `headSet("m")` torna totes les paraules que van abans que "m" en l'ordre natural.

</details>

---

## ⭐ Pila genèrica `<T>`: Exercici 7

<details>
<summary>🔄 Solució</summary>

```java
import java.util.ArrayList;
import java.util.EmptyStackException;

public class Pila<T> {
    private ArrayList<T> elementos = new ArrayList<>();

    public void push(T elemento) {
        elementos.add(elemento);
    }

    public T pop() {
        if (isEmpty()) {
            throw new EmptyStackException();
        }
        return elementos.remove(elementos.size() - 1);
    }

    public T peek() {
        if (isEmpty()) {
            throw new EmptyStackException();
        }
        return elementos.get(elementos.size() - 1);
    }

    public boolean isEmpty() {
        return elementos.isEmpty();
    }

    public int size() {
        return elementos.size();
    }
}
```

La pila es construïx sobre un `ArrayList<T>`: el final de la llista és la cima. `push` afegix, `pop` llevo i torna l'últim, i `peek` el mira sense llevar-lo. En ser genèrica, funciona igual amb `Integer`, `String` o `Double`: `new Pila<String>()` i llisto.

</details>

---

## ⭐⭐ Exercici 8: HashMap invers

<details>
<summary>🔄 Solució</summary>

```java
import java.util.HashMap;

public class Utilidades {

    public static <K, V> HashMap<V, K> invertirMapa(HashMap<K, V> original) {
        HashMap<V, K> invertido = new HashMap<>();
        for (HashMap.Entry<K, V> e : original.entrySet()) {
            invertido.put(e.getValue(), e.getKey());
        }
        return invertido;
    }

    public static void main(String[] args) {
        HashMap<String, Integer> edades = new HashMap<>();
        edades.put("Ana", 25);
        edades.put("Bob", 30);

        HashMap<Integer, String> porEdad = invertirMapa(edades);
        System.out.println(porEdad.get(25)); // Ana
        System.out.println(porEdad.get(30)); // Bob
    }
}
```

Recórrer `entrySet()` et dona clau i valor junts, i el `put` invertit els canvia de lloc. Si dos claus comparteixen valor (dues persones de 25 anys), l'últim en el recorregut sobreescriu l'anterior: els valors del mapa original no són únics, així que l'invers pot perdre informació. Eixa és la limitació natural d'invertir un mapa.

</details>

---

## ⭐⭐ Exercici 9: TreeMap — freqüència de lletres

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Map;
import java.util.TreeMap;

public class FrecuenciaLetras {
    public static void main(String[] args) {
        String texto = "Hola mundo";

        TreeMap<Character, Integer> frec = new TreeMap<>();
        for (char c : texto.toLowerCase().toCharArray()) {
            if (Character.isLetter(c)) {
                frec.put(c, frec.getOrDefault(c, 0) + 1);
            }
        }

        for (Map.Entry<Character, Integer> e : frec.entrySet()) {
            System.out.print(e.getKey() + ": " + e.getValue() + ", ");
        }
        // a: 1, d: 1, h: 1, l: 1, m: 1, n: 1, o: 2, u: 1
    }
}
```

`toLowerCase()` unifica majúscules i minúscules, `Character.isLetter(c)` descarta espais i signes, i `getOrDefault` suma el comptador. La màgia del `TreeMap` és que, en recórrer-lo, les claus ixen ordenades alfabèticament sense que faces res.

</details>

---

## ⭐⭐⭐ Exercici 10: Wildcards — suma i barreja de números

<details>
<summary>🔄 Solució</summary>

```java
import java.util.ArrayList;
import java.util.List;

public class Numeros {

    public static double sumar(List<? extends Number> lista) {
        double total = 0.0;
        for (Number n : lista) {
            total += n.doubleValue();
        }
        return total;
    }

    public static List<Double> mezclar(List<? extends Number> a, List<? extends Number> b) {
        List<Double> resultado = new ArrayList<>();
        for (Number n : a) {
            resultado.add(n.doubleValue());
        }
        for (Number n : b) {
            resultado.add(n.doubleValue());
        }
        return resultado;
    }

    public static void main(String[] args) {
        List<Integer> enteros = List.of(1, 2, 3);
        List<Double> dobles = List.of(1.5, 2.5);

        System.out.println(sumar(enteros)); // 6.0
        System.out.println(sumar(dobles));  // 4.0
        System.out.println(mezclar(enteros, dobles)); // [1.0, 2.0, 3.0, 1.5, 2.5]
    }
}
```

`List<? extends Number>` accepta qualsevol llista de Number o d'una subclasse. En llegir, cada element és un `Number` i `doubleValue()` el converteix. Passar una `List<String>` seria un error de compilació: `String` no és un `Number`. I ull: `? extends` és de només lectura, així que en `sumar` no pots fer `add` (PECS: Producer Extends).

</details>

---

## ⭐⭐⭐ Exercici 11: Sistema de votacions amb mètode genèric

<details>
<summary>🔄 Solució</summary>

```java
import java.util.HashMap;
import java.util.Map;

public class Votaciones {

    public static <T> T obtenerGanador(Map<T, Integer> votos) {
        T ganador = null;
        int maxVotos = -1;
        for (Map.Entry<T, Integer> e : votos.entrySet()) {
            if (e.getValue() > maxVotos) {
                maxVotos = e.getValue();
                ganador = e.getKey();
            }
        }
        return ganador;
    }

    public static void main(String[] args) {
        HashMap<String, Integer> votos = new HashMap<>();
        votos.put("Ana", 3);
        votos.put("Bob", 5);
        votos.put("Carla", 2);

        System.out.println(obtenerGanador(votos)); // Bob

        HashMap<Integer, Integer> porCategoria = new HashMap<>();
        porCategoria.put(1, 10);
        porCategoria.put(2, 7);
        System.out.println(obtenerGanador(porCategoria)); // 1
    }
}
```

El mètode és genèric (`<T>`) perquè el tipus de la clau no importa: només necessita recórrer i comparar valors. El patró del màxim acumulat sobre `entrySet()` torna la clau amb més vots. Funciona igual amb claus `String`, `Integer` o qualsevol altre tipus.

</details>

---

## ⭐⭐⭐ Exercici 12: el type erasure al descobert

<details>
<summary>🔄 Solució</summary>

1. **No, és la mateixa classe.** `Caja<String>` i `Caja<Integer>` no generen dos classes en el bytecode: el compilador borra el paràmetre de tipus i deixa una única `Caja` amb `Object`. Per això no hi ha cap guany de rendiment per «especialitzar»: erasure significa que no es duplica codi.
2. **`Object`.** `getValor()` en el bytecode torna `Object`. El compilador inserix el cast a `String` en el punt d'ús (quan assignes a `String s = caja.getValor();`).
3. La comprovació amb `getClass()`:

```java
public class Demo {
    public static void main(String[] args) {
        Caja<String> cajaTexto = new Caja<>("hola");
        Caja<Integer> cajaNumero = new Caja<>(42);

        System.out.println(cajaTexto.getClass());
        System.out.println(cajaNumero.getClass());
        System.out.println(cajaTexto.getClass() == cajaNumero.getClass());  // true
    }
}
```

Totes dos imprimeixen `class Caja` i la comparació amb `==` dóna `true`: és la MATEIXA classe en runtime. El `<String>` i el `<Integer>` només existeixen en temps de compilació. Este és el type erasure: el mag que borra els tipus quan compiles.

</details>
