---
title: "Boletín U11 — Inicial"
description: "Ejercicios básicos de Genéricos y Mapas: clases genéricas, HashMap, getOrDefault y métodos genéricos"
---

# 📝 Boletín U11 — Inicial

> Sin soluciones. Sin prisas. Abre el IDE, crea tu primera `Caja<T>` y haz que el `HashMap` deje de parecer magia. El `<T>` lo cambió todo, pero el que programa eres tú. Empieza suave, que los genéricos muerden poco a poco.

---

## Ejercicio 1: Completa el código — clase con dos tipos genéricos

```java
public class Par<______, ______> {   // ¿qué dos tipos faltan?
    private T primero;
    private U segundo;

    public Par(T primero, U segundo) {
        this.primero = primero;
        this.segundo = segundo;
    }

    public T getPrimero() { return primero; }
    public U getSegundo() { return segundo; }
}
```

Completa la declaración para que `Par` acepte dos tipos genéricos distintos. ¿Qué pasa si creas `Par<String, Integer>` y luego intentas `par.getPrimero()`?

---

## Ejercicio 2: ¿Qué imprime? — HashMap con put repetido

```java
import java.util.HashMap;

public class Test {
    public static void main(String[] args) {
        HashMap<String, Integer> mapa = new HashMap<>();
        mapa.put("Ana", 10);
        mapa.put("Bob", 20);
        mapa.put("Ana", 30);

        System.out.println(mapa.get("Ana"));
        System.out.println(mapa.size());
    }
}
```

¿Qué imprime? ¿Por qué `size()` no es 3?

---

## Ejercicio 3: Encuentra el error — ArrayList\<int\> no compila

```java
import java.util.ArrayList;

public class Error {
    public static void main(String[] args) {
        ArrayList<int> numeros = new ArrayList<>();
        numeros.add(5);
        numeros.add(10);
        System.out.println(numeros.get(0) + numeros.get(1));
    }
}
```

Este código **no compila**. ¿Por qué? ¿Cómo lo corriges? ¿Qué papel juega el autoboxing?

---

## Ejercicio 4: Escribe este programa — contador de palabras con HashMap

Crea un programa que tenga un array de palabras (hardcodeado) como este:

```java
String[] palabras = {"hola", "mundo", "hola", "java", "mundo", "hola", "adios"};
```

Usa un `HashMap<String, Integer>` para contar cuántas veces aparece cada palabra. Al final, recorre el mapa con un bucle for-each sobre `entrySet()` y muestra cada palabra con su cuenta.

---

## Ejercicio 5: ¿Qué imprime? — método genérico con límite

```java
public class Util {
    public static <T extends Comparable<T>> T maximo(T a, T b) {
        return a.compareTo(b) > 0 ? a : b;
    }

    public static void main(String[] args) {
        System.out.println(maximo(5, 8));
        System.out.println(maximo("gato", "perro"));
    }
}
```

¿Qué imprime? ¿Qué pasaría si `T` no tuviera el límite `Comparable<T>`?

---

## Ejercicio 6: Encuentra el error — la clave duplicada y el primer valor perdido

```java
HashMap<Integer, String> mapa = new HashMap<>();
mapa.put(1, "uno");
mapa.put(2, "dos");
mapa.put(1, "Uno otra vez");

System.out.println(mapa.get(1));
```

¿Qué imprime? ¿Se pierde el primer valor asociado a la clave 1?

---

## Ejercicio 7: Escribe este programa — mini agenda con getOrDefault

Crea un `TreeMap<String, Integer>` para almacenar las edades de 5 personas. Rellénalo con nombres y edades. Luego, pide al usuario un nombre por teclado y muestra su edad. Si el nombre no existe, muestra un mensaje de error usando `getOrDefault()` para evitar el `null`.

---

## Ejercicio 8: Completa el código — getOrDefault

```java
HashMap<String, Integer> edades = new HashMap<>();
edades.put("Ana", 25);
edades.put("Bob", 30);

int edadAna = ______;                 // 25
int edadCarlos = ______;              // 0 si no existe (usa getOrDefault)
```

Completa las dos líneas. ¿Qué devolvería `edades.get("Carlos")` y por qué es peligroso asignarlo a un `int`?

---

## Ejercicio 9: Encuentra el error — la clave mutable

```java
HashMap<ArrayList<Integer>, String> mapa = new HashMap<>();
ArrayList<Integer> lista = new ArrayList<>();
lista.add(1);
lista.add(2);
mapa.put(lista, "valor");
lista.add(3);  // modificamos la clave después de usarla
System.out.println(mapa.get(lista));  // ¿qué imprime?
```

¿Qué imprime? ¿Cuál es el problema de usar una `ArrayList` como clave de un `HashMap`?