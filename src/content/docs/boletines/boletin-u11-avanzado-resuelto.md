---
title: "Boletín U11 — Avanzado Resuelto"
description: "Los mismos ejercicios que el boletín avanzado, con soluciones"
---

# 📝 Boletín U11 — Avanzado (Resuelto)

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

## ⭐ Pila genérica `<T>`: Ejercicio 7

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

## ⭐⭐ Ejercicio 8: HashMap inverso

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

## ⭐⭐ Ejercicio 9: TreeMap — frecuencia de letras

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

## ⭐⭐⭐ Ejercicio 10: Wildcards — suma y mezcla de números

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

## ⭐⭐⭐ Ejercicio 11: Sistema de votaciones con método genérico

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

## ⭐⭐⭐ Ejercicio 12: el type erasure al descubierto

<details>
<summary>🔄 Solución</summary>

1. **No, es la misma clase.** `Caja<String>` y `Caja<Integer>` no generan dos clases en el bytecode: el compilador borra el parámetro de tipo y deja una única `Caja` con `Object`. Por eso no hay ninguna ganancia de rendimiento por «especializar»: erasure significa que no se duplica código.
2. **`Object`.** `getValor()` en el bytecode devuelve `Object`. El compilador inserta el cast a `String` en el punto de uso (cuando asignas a `String s = caja.getValor();`).
3. La comprobación con `getClass()`:

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

Ambas imprimen `class Caja` y la comparación con `==` da `true`: es la MISMA clase en runtime. El `<String>` y el `<Integer>` solo existen en tiempo de compilación. Ese es el type erasure: el mago que borra los tipos cuando compilas.

</details>
