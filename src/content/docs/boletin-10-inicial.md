---
title: "Boletín 9 - Inicial: Genéricos y Mapas"
nav_order: 9
---
*Sin soluciones. A darle.*

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

Completa la declaración para que `Par` acepte dos tipos genéricos distintos.

---

## Ejercicio 2: ¿Qué imprime? — HashMap con merge

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

## Ejercicio 3: Encuentra el error — TreeSet sin Comparable

```java
import java.util.TreeSet;

public class Test {
    public static void main(String[] args) {
        TreeSet<Persona> conjunto = new TreeSet<>();
        conjunto.add(new Persona("Ana"));
        conjunto.add(new Persona("Bob"));
        System.out.println(conjunto);
    }
}

class Persona {
    String nombre;
    Persona(String nombre) { this.nombre = nombre; }
}
```

¿Qué ocurre al ejecutar? ¿Por qué `TreeSet` necesita que `Persona` implemente una interfaz concreta?

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

## Ejercicio 6: Encuentra el error — clave duplicada el primero se pierde

```java
HashMap<Integer, String> mapa = new HashMap<>();
mapa.put(1, "uno");
mapa.put(2, "dos");
mapa.put(1, "Uno otra vez");

System.out.println(mapa.get(1));
```

¿Qué imprime? ¿Se pierde el primer valor asociado a la clave 1?

---

## Ejercicio 7: Escribe este programa — TreeMap con valores por defecto

Crea un `TreeMap<String, Integer>` para almacenar las edades de 5 personas. Rellénalo con nombres y edades. Luego, pide al usuario un nombre por teclado y muestra su edad. Si el nombre no existe, muestra un mensaje de error.

Usa `getOrDefault()` para evitar el `null`.

---

## 🔗 Referencias para seguir practicando

- **CodeWars:** [Grasshopper - Grade book](https://www.codewars.com/kata/55cbd4ba903825f7970000f5) (7 kyu)
- **CodeWars:** [Word Count](https://www.codewars.com/kata/570cc83d616be859a5000c9b) (7 kyu)
- **AceptaElReto.com:** [416 - Casillas](https://www.aceptaelreto.com/problem/statement.php?id=416)
- **AceptaElReto.com:** [462 - Tres dedos](https://www.aceptaelreto.com/problem/statement.php?id=462)
