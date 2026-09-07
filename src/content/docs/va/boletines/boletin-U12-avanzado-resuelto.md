---
title: "Butlletí U12 — Avançat Resolt"
description: "Els mateixos exercicis que el butlletí avançat, amb solucions"
---

# 📝 Butlletí U12 — Avançat (Resolt)

> Les solucions estan amagades en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## ⭐⭐ Exercici 1: Ordenar amb referències a mètode

<details>
<summary>🔄 Solució</summary>

```java
import java.util.*;
import java.util.stream.*;

public class Orden {
    public static void main(String[] args) {
        List<String> nombres = List.of("Carlos", "Ana", "David", "Bob");

        List<String> porLongitud = nombres.stream()
            .sorted(Comparator.comparing(String::length))
            .toList();

        System.out.println(porLongitud);   // [Ana, Bob, Carlos, David]

        List<String> inverso = nombres.stream()
            .sorted(Comparator.comparing(String::length).reversed())
            .toList();
        System.out.println(inverso);   // [Carlos, David, Ana, Bob]
    }
}
```

`Comparator.comparing(String::length)` construïx un comparador que usa la referència a mètode `String::length` com a "clau d'ordenació". `sorted` no modifica la llista original: torna un stream ordenat. Amb `.reversed()` inverteixes el criteri (els més llargs primer; els empats mantenen l'ordre d'arribada).

</details>

---

## ⭐⭐ Exercici 2: Agrupar paraules per la seua primera lletra

<details>
<summary>🔄 Solució</summary>

```java
import java.util.*;
import java.util.stream.*;

public class Grupos {
    public static void main(String[] args) {
        List<String> palabras = List.of("hola", "adios", "mar", "mundo", "luna");

        Map<Character, List<String>> porLetra = palabras.stream()
            .collect(Collectors.groupingBy(p -> p.charAt(0)));

        System.out.println(porLetra);
        // {a=[adios], h=[hola], l=[luna], m=[mar, mundo]}

        Map<Character, Long> conteo = palabras.stream()
            .collect(Collectors.groupingBy(p -> p.charAt(0), Collectors.counting()));

        System.out.println(conteo);
        // {a=1, h=1, l=1, m=2}
    }
}
```

`groupingBy(p -> p.charAt(0))` agrupa les paraules per la seua primera lletra: cada lletra és una clau i la seua llista de paraules el valor. Amb `Collectors.counting()` com a segon argument (el "collector aigües avall"), el valor passa de `List<String>` a `Long`: quantes paraules cauen en cada grup. És el comptador de freqüències per categoria en una línia.

</details>

---

## ⭐⭐ Exercici 3: Optional — el que no es deixa enganyar

<details>
<summary>🔄 Solució</summary>

```java
import java.util.*;
import java.util.stream.*;

public class Maximo {
    public static int maximoSeguro(List<Integer> numeros) {
        return numeros.stream()
            .max(Integer::compareTo)
            .orElse(-1);
    }

    public static void main(String[] args) {
        System.out.println(maximoSeguro(List.of(4, 9, 2, 7)));   // 9
        System.out.println(maximoSeguro(List.of()));             // -1
    }
}
```

`max(Integer::compareTo)` torna un `Optional<Integer>`: si la llista està buida, la capsa està buida. `orElse(-1)` aterra amb seguretat: torna el màxim si hi ha valor i `-1` si no. Usar `get()` ací hauria llançat `NoSuchElementException` amb la llista buida: l'`orElse` és la xarxa que convertix una excepció en una dada controlada.

</details>

---

## ⭐⭐⭐ Exercici 4: El pipeline complet

<details>
<summary>🔄 Solució</summary>

```java
import java.util.*;
import java.util.stream.*;

public class Pipeline {
    public static void main(String[] args) {
        List<Integer> numeros = List.of(12, 5, 8, 3, 9, 5, 12, 7);

        List<Integer> resultado = numeros.stream()
            .filter(n -> n >= 5)                     // 12, 5, 8, 9, 5, 12, 7
            .map(n -> n * n)                         // 144, 25, 64, 81, 25, 144, 49
            .distinct()                              // 144, 25, 64, 81, 49
            .sorted(Comparator.reverseOrder())       // 144, 81, 64, 49, 25
            .limit(3)                                // 144, 81, 64
            .toList();

        System.out.println(resultado);   // [144, 81, 64]
    }
}
```

El pipeline complet de la unitat: filtrar (el 3 es queda fora), transformar al quadrat, llevar duplicats (el 12 i el 5 repetits desapareixen), ordenar de major a menor amb `Comparator.reverseOrder()` i tallar en 3 amb `limit`. L'ordre importa: `distinct` abans de `sorted` significa que la llista a ordenar ja no té repetits.

</details>

---

## ⭐⭐ Exercici 5: De llista a mapa amb `toMap`

<details>
<summary>🔄 Solució</summary>

```java
import java.util.*;
import java.util.stream.*;

class Alumno {
    private String nombre;
    private int nota;

    public Alumno(String nombre, int nota) {
        this.nombre = nombre;
        this.nota = nota;
    }

    public String getNombre() { return nombre; }
    public int getNota() { return nota; }
}

public class Mapa {
    public static void main(String[] args) {
        List<Alumno> alumnos = List.of(
            new Alumno("Ana", 8),
            new Alumno("Bob", 6),
            new Alumno("Carla", 9),
            new Alumno("David", 7),
            new Alumno("Eva", 5)
        );

        Map<String, Integer> porNombre = alumnos.stream()
            .collect(Collectors.toMap(Alumno::getNombre, Alumno::getNota, (a, b) -> a));

        System.out.println(porNombre);   // {Eva=5, Ana=8, Bob=6, Carla=9, David=7}
    }
}
```

`Collectors.toMap(Alumno::getNombre, Alumno::getNota, (a, b) -> a)` usa referències a mètode per a traure clau (nom) i valor (nota). La funció de fusió `(a, b) -> a` és l'assegurança: si un nom es repetira, dos elements voldrien la mateixa clau i sense fusió Java llançaria `IllegalStateException`. Amb `(a, b) -> a` es queda amb el primer.

</details>

---

## ⭐⭐⭐ Exercici 6: El màxim amb `reduce` i comparador

<details>
<summary>🔄 Solució</summary>

```java
import java.util.*;
import java.util.stream.*;

public class Maximo {
    public static void main(String[] args) {
        List<Integer> numeros = List.of(4, 9, 2, 9, 7);

        int conReduce = numeros.stream()
            .reduce(Integer.MIN_VALUE, (a, b) -> a > b ? a : b);
        System.out.println(conReduce);   // 9

        Optional<Integer> conMax = numeros.stream().max(Integer::compareTo);
        System.out.println(conMax.orElse(-1));   // 9
    }
}
```

- Amb `reduce`, la identitat `Integer.MIN_VALUE` garantix que el primer element sempre guanye la comparació (qualsevol `int` és major que el mínim possible). L'acumulador va guardant el major vist.
- Amb `max(Integer::compareTo)` no hi ha identitat: torna un `Optional<Integer>` perquè una llista buida no té màxim. S'aterra amb `orElse(-1)`.

La diferència clau: `reduce` amb identitat torna el valor directe; `max` torna `Optional` i t'obliga a gestionar l'absència.

</details>

---

## ⭐⭐ Exercici 7: Freqüències amb `groupingBy`

<details>
<summary>🔄 Solució</summary>

```java
import java.util.*;
import java.util.stream.*;

public class Frecuencias {
    public static void main(String[] args) {
        String[] palabras = {"hola", "adios", "hola", "java", "hola", "adios"};

        Map<String, Long> frec = Arrays.stream(palabras)
            .collect(Collectors.groupingBy(p -> p, Collectors.counting()));

        System.out.println(frec);   // {adios=2, hola=3, java=1}

        Map.Entry<String, Long> campeona = frec.entrySet().stream()
            .max(Map.Entry.comparingByValue())
            .orElse(null);

        System.out.println("Más repetida: " + campeona.getKey() + " (" + campeona.getValue() + ")");
    }
}
```

Dos nivells de streams: el primer convertix l'array en flux i agrupa per la paraula mateixa (`p -> p`), comptant amb `counting()`: `hola`=3, `adios`=2, `java`=1. El segon recorre les entrades del mapa (`entrySet()`) i busca el màxim valor amb `max(Map.Entry.comparingByValue())`, que torna `Optional<Map.Entry>` (aterrat amb `orElse(null)`). És l'`entrySet` de la U11 + el `max` dels streams.

</details>

---

## ⭐⭐⭐ Exercici 8: Optional i streams, la parella

<details>
<summary>🔄 Solució</summary>

```java
import java.util.*;
import java.util.stream.*;

public class Busqueda {
    public static void buscarJ(List<String> nombres) {
        nombres.stream()
            .filter(n -> n.startsWith("J"))
            .findFirst()
            .ifPresentOrElse(
                System.out::println,
                () -> System.out.println("no hay nadie")
            );
    }

    public static void main(String[] args) {
        buscarJ(List.of("Ana", "Juan", "Carla"));    // Juan
        buscarJ(List.of("Ana", "Carla"));            // no hay nadie
    }
}
```

`filter(n -> n.startsWith("J")).findFirst()` torna `Optional<String>`: la capsa està plena si algú complix i buida si no. `ifPresentOrElse` és el mètode que junta els dos camins: el primer argument és el `Consumer` per a quan hi ha valor (`System.out::println`), el segon un `Runnable` per a quan no n'hi ha. També ho podries fer amb `ifPresent` + `orElse`, però `ifPresentOrElse` fa la parella en una sola crida.

</details>

---

## ⭐⭐⭐ Exercici 9: el stream que es nega a morir

<details>
<summary>🔄 Solució</summary>

1. **Sí, compila** (l'error és d'execució, no de sintaxi).
2. En executar, la segona crida `flujo.count()` llança **`IllegalStateException: stream has already been operated upon or closed`**. El primer `count()` ja va consumir el stream: no es pot reutilitzar.
3. Creant un stream nou per a cada comptada:

```java
long a = List.of(1, 2, 3).stream().count();
long b = List.of(1, 2, 3).stream().count();
System.out.println(a + " " + b);   // 3 3
```

La regla d'or: un stream és com un bitllet d'autobús d'un sol viatge. Després de baixar-te, el bitllet no servix.

</details>