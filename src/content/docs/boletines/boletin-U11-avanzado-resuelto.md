---
title: "Boletín U11 — Avanzado Resuelto"
description: "Los mismos ejercicios que el boletín avanzado, con soluciones"
---

# 📝 Boletín U11 — Avanzado (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## ⭐ Ejercicio 1: Pila genérica `<T>`

<details>
<summary>🔄 Solución</summary>

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

La pila se construye sobre un `ArrayList<T>`: el final de la lista es la cima. `push` añade, `pop` quita y devuelve el último, y `peek` lo mira sin quitarlo. Al ser genérica, funciona igual con `Integer`, `String` o `Double`: `new Pila<String>()` y listo.

</details>

---

## ⭐⭐ Ejercicio 2: Método genérico `maximo` sobre un array

<details>
<summary>🔄 Solución</summary>

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

El límite `T extends Comparable<T>` garantiza que `T` sabe compararse. Se usa `Integer[]`, no `int[]`, porque los arrays de genéricos no aceptan primitivos. El patrón del máximo acumulado: candidato inicial en el índice 0 y recorrido desde el 1.

</details>

---

## ⭐⭐ Ejercicio 3: HashMap inverso

<details>
<summary>🔄 Solución</summary>

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

Recorrer `entrySet()` te da clave y valor juntos, y el `put` invertido los cambia de sitio. Si dos claves comparten valor (dos personas de 25 años), el último en el recorrido sobrescribe al anterior: los valores del mapa original no son únicos, así que el inverso puede perder información. Esa es la limitación natural de invertir un mapa.

</details>

---

## ⭐⭐ Ejercicio 4: TreeMap — frecuencia de letras

<details>
<summary>🔄 Solución</summary>

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

`toLowerCase()` unifica mayúsculas y minúsculas, `Character.isLetter(c)` descarta espacios y signos, y `getOrDefault` suma el contador. La magia del `TreeMap` es que, al recorrerlo, las claves salen ordenadas alfabéticamente sin que hagas nada.

</details>

---

## ⭐⭐⭐ Ejercicio 5: Wildcards — suma y mezcla de números

<details>
<summary>🔄 Solución</summary>

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

`List<? extends Number>` acepta cualquier lista de Number o de una subclase. Al leer, cada elemento es un `Number` y `doubleValue()` lo convierte. Pasar una `List<String>` sería un error de compilación: `String` no es un `Number`. Y ojo: `? extends` es de solo lectura, así que en `sumar` no puedes hacer `add` (PECS: Producer Extends).

</details>

---

## ⭐⭐ Ejercicio 6: Caché LRU con LinkedHashMap

<details>
<summary>🔄 Solución</summary>

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

El constructor `super(MAX, 0.75f, true)` activa el modo `accessOrder`: cada `get` o `put` mueve la entrada al final. `removeEldestEntry()` se llama tras cada inserción y, al devolver `size() > MAX`, expulsa al elemento menos recientemente usado. Es la caché LRU clásica en unas pocas líneas.

</details>

---

## ⭐⭐ Ejercicio 7: Agenda completa con menú

<details>
<summary>🔄 Solución</summary>

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

`containsKey` evita mostrar un `null` al buscar, `entrySet` lista todo sin un `get` extra y `remove` devuelve el valor borrado (o `null` si no existía), sirviendo de comprobación. La agenda completa con `HashMap`: buscar por clave es O(1).

</details>

---

## ⭐⭐⭐ Ejercicio 8: Sistema de votaciones con método genérico

<details>
<summary>🔄 Solución</summary>

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

El método es genérico (`<T>`) porque el tipo de la clave no importa: solo necesita recorrer y comparar valores. El patrón del máximo acumulado sobre `entrySet()` devuelve la clave con más votos. Funciona igual con claves `String`, `Integer` o cualquier otro tipo.

</details>

---

## ⭐⭐ Ejercicio 9: Pareja genérica con intercambio

<details>
<summary>🔄 Solución</summary>

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

La clase tiene dos parámetros de tipo `<T, U>`. `intercambiar()` crea una `Pareja<U, T>` (fíjate en el orden invertido de los parámetros) pasando el segundo como primero y el primero como segundo. El compilador comprueba que `original.intercambiar()` devuelva exactamente `Pareja<Integer, String>`: no hay forma de equivocarse de tipo sin que te pille.