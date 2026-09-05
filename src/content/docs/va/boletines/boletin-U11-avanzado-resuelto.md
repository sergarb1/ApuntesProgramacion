---
title: "Butlletí U11 — Avançat Resolt"
description: "Els mateixos exercicis que el butlletí avançat, amb solucions"
---

# 📝 Butlletí U11 — Avançat (Resolt)

> Les solucions estan amagades en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## ⭐ Exercici 1: Pila genèrica `<T>`

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

La pila es construïx sobre un `ArrayList<T>`: el final de la llista és la cim. `push` afig, `pop` lleva i torna l'últim, i `peek` el mira sense llevar-lo. En ser genèrica, funciona igual amb `Integer`, `String` o `Double`: `new Pila<String>()` i llest.

</details>

---

## ⭐⭐ Exercici 2: Mètode genèric `maximo` sobre un array

<details>
<summary>🔄 Solució</summary>

```java
public class Utilidades {

    public static <T extends Comparable<T>> T maximo(T[] array) {
        T max = array[0];
        for (int i = 1; i < array.length; i++) {
            if (array[i].compareTo(max) > 0) {
                max = array[i];
            }
        }
        return max;
    }

    public static void main(String[] args) {
        Integer[] numeros = {3, 8, 2, 10, 5};
        String[] palabras = {"manzana", "pera", "melón"};

        System.out.println(maximo(numeros));  // 10
        System.out.println(maximo(palabras)); // pera
    }
}
```

El límit `T extends Comparable<T>` garantix que `T` sap comparar-se. S'usa `Integer[]`, no `int[]`, perquè els arrays de genèrics no accepten primitius. El patró del màxim acumulat: candidat inicial en l'índex 0 i recorregut des de l'1.

</details>

---

## ⭐⭐ Exercici 3: HashMap invers

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

Recórrer `entrySet()` et dona clau i valor junts, i el `put` invertit els canvia de lloc. Si dos claus compartixen valor (dos persones de 25 anys), l'últim en el recorregut sobreescriu l'anterior: els valors del mapa original no són únics, així que l'invers pot perdre informació. Eixa és la limitació natural d'invertir un mapa.

</details>

---

## ⭐⭐ Exercici 4: TreeMap — freqüència de lletres

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

`toLowerCase()` unifica majúscules i minúscules, `Character.isLetter(c)` descarta espais i signes, i `getOrDefault` suma el comptador. La màgia del `TreeMap` és que, en recórrer-lo, les claus eixen ordenades alfabèticament sense que faces res.

</details>

---

## ⭐⭐⭐ Exercici 5: Wildcards — suma i mescla de números

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

`List<? extends Number>` accepta qualsevol llista de Number o d'una subclasse. En llegir, cada element és un `Number` i `doubleValue()` el convertix. Passar una `List<String>` seria un error de compilació: `String` no és un `Number`. I ull: `? extends` és de només lectura, així que en `sumar` no pots fer `add` (PECS: Producer Extends).

</details>

---

## ⭐⭐ Exercici 6: Caché LRU amb LinkedHashMap

<details>
<summary>🔄 Solució</summary>

```java
import java.util.LinkedHashMap;
import java.util.Map;

public class CacheLRU<K, V> extends LinkedHashMap<K, V> {
    private static final int MAX = 5;

    public CacheLRU() {
        super(MAX, 0.75f, true);  // accessOrder = true: por acceso, no inserción
    }

    @Override
    protected boolean removeEldestEntry(Map.Entry<K, V> eldest) {
        return size() > MAX;
    }

    public static void main(String[] args) {
        CacheLRU<String, Integer> cache = new CacheLRU<>();
        for (int i = 1; i <= 6; i++) {
            cache.put("clave" + i, i);
        }
        System.out.println(cache);  // las 5 más recientes; "clave1" fue expulsada
    }
}
```

El constructor `super(MAX, 0.75f, true)` activa el mode `accessOrder`: cada `get` o `put` mou l'entrada al final. `removeEldestEntry()` es crida després de cada inserció i, en tornar `size() > MAX`, expulsa l'element menys recentment usat. És la caché LRU clàssica en poques línies.

</details>

---

## ⭐⭐ Exercici 7: Agenda completa amb menú

<details>
<summary>🔄 Solució</summary>

```java
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Agenda {
    public static void main(String[] args) {
        HashMap<String, String> agenda = new HashMap<>();
        Scanner sc = new Scanner(System.in);
        int opcion;

        do {
            System.out.println("\n1. Añadir contacto");
            System.out.println("2. Buscar por nombre");
            System.out.println("3. Listar todos");
            System.out.println("4. Borrar contacto");
            System.out.println("0. Salir");
            System.out.print("Opción: ");
            opcion = sc.nextInt();
            sc.nextLine();

            switch (opcion) {
                case 1:
                    System.out.print("Nombre: ");
                    String nombre = sc.nextLine();
                    System.out.print("Teléfono: ");
                    String telefono = sc.nextLine();
                    agenda.put(nombre, telefono);
                    System.out.println("Contacto añadido.");
                    break;

                case 2:
                    System.out.print("Nombre: ");
                    String buscado = sc.nextLine();
                    if (agenda.containsKey(buscado)) {
                        System.out.println(buscado + " → " + agenda.get(buscado));
                    } else {
                        System.out.println(buscado + " no está en la agenda.");
                    }
                    break;

                case 3:
                    for (Map.Entry<String, String> e : agenda.entrySet()) {
                        System.out.println(e.getKey() + " → " + e.getValue());
                    }
                    break;

                case 4:
                    System.out.print("Nombre a borrar: ");
                    String aBorrar = sc.nextLine();
                    if (agenda.remove(aBorrar) != null) {
                        System.out.println("Contacto borrado.");
                    } else {
                        System.out.println("No existe ese contacto.");
                    }
                    break;
            }
        } while (opcion != 0);

        sc.close();
    }
}
```

`containsKey` evita mostrar un `null` en buscar, `entrySet` llista tot sense un `get` extra i `remove` torna el valor esborrat (o `null` si no existia), servint de comprovació. L'agenda completa amb `HashMap`: buscar per clau és O(1).

</details>

---

## ⭐⭐⭐ Exercici 8: Sistema de votacions amb mètode genèric

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

## ⭐⭐ Exercici 9: Parella genèrica amb intercanvi

<details>
<summary>🔄 Solució</summary>

```java
public class Pareja<T, U> {
    private T primero;
    private U segundo;

    public Pareja(T primero, U segundo) {
        this.primero = primero;
        this.segundo = segundo;
    }

    public T getPrimero() { return primero; }
    public U getSegundo() { return segundo; }

    public void setPrimero(T primero) { this.primero = primero; }
    public void setSegundo(U segundo) { this.segundo = segundo; }

    public Pareja<U, T> intercambiar() {
        return new Pareja<>(this.segundo, this.primero);
    }

    public static void main(String[] args) {
        Pareja<String, Integer> original = new Pareja<>("Ana", 25);
        Pareja<Integer, String> intercambiada = original.intercambiar();

        System.out.println(original.getPrimero());       // Ana
        System.out.println(intercambiada.getPrimero());  // 25
    }
}
```

La classe té dos paràmetres de tipus `<T, U>`. `intercambiar()` crea una `Pareja<U, T>` (fixa't en l'ordre invertit dels paràmetres) passant el segon com a primer i el primer com a segon. El compilador comprova que `original.intercambiar()` torne exactament `Pareja<Integer, String>`: no hi ha manera d'equivocar-se de tipus sense que et pille.

</details>