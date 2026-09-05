---
title: "Boletín U11 — Inicial Resuelto"
description: "Los mismos ejercicios que el boletín inicial, con soluciones"
---

# 📝 Boletín U11 — Inicial (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## Ejercicio 1: Completa el código — clase con dos tipos genéricos

<details>
<summary>🔄 Solución</summary>

```java
public class Par<T, U> {
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

La declaración correcta es `public class Par<T, U>`. Si creas `Par<String, Integer> par = new Par<>("Ana", 25);`, entonces `par.getPrimero()` devuelve un `String` (sin casting) y `par.getSegundo()` un `Integer`. Los dos parámetros de tipo van separados por comas y se rellenan al instanciar.

</details>

---

## Ejercicio 2: ¿Qué imprime? — HashMap con put repetido

<details>
<summary>🔄 Solución</summary>

Imprime **`30`** y **`2`**.

- `put("Ana", 10)` y luego `put("Ana", 30)`: la clave "Ana" se sobrescribe con el último valor.
- Por eso `size()` es 2, no 3: las claves son únicas y "Ana" solo cuenta una vez.

</details>

---

## Ejercicio 3: Encuentra el error — ArrayList\<int\> no compila

<details>
<summary>🔄 Solución</summary>

No compila porque **los genéricos solo aceptan objetos, y `int` es un primitivo**. `ArrayList<int>` no existe. La solución es usar la clase wrapper `Integer`:

```java
import java.util.ArrayList;

public class Error {
    public static void main(String[] args) {
        ArrayList<Integer> numeros = new ArrayList<>();
        numeros.add(5);
        numeros.add(10);
        System.out.println(numeros.get(0) + numeros.get(1)); // 15
    }
}
```

El **autoboxing** convierte automáticamente el `int` 5 en un `Integer` al añadirlo, y el **unboxing** lo convierte de vuelta a `int` al sumar. Tú no escribes nada de eso: Java lo hace solo.

</details>

---

## Ejercicio 4: Escribe este programa — contador de palabras con HashMap

<details>
<summary>🔄 Solución</summary>

```java
import java.util.HashMap;
import java.util.Map;

public class ContadorPalabras {
    public static void main(String[] args) {
        String[] palabras = {"hola", "mundo", "hola", "java", "mundo", "hola", "adios"};

        HashMap<String, Integer> contador = new HashMap<>();
        for (String p : palabras) {
            contador.put(p, contador.getOrDefault(p, 0) + 1);
        }

        for (Map.Entry<String, Integer> entrada : contador.entrySet()) {
            System.out.println(entrada.getKey() + " → " + entrada.getValue());
        }
    }
}
```

El patrón de las frecuencias: `getOrDefault(p, 0) + 1` devuelve la cuenta actual (o 0 la primera vez) y suma 1. `entrySet()` te da cada palabra con su contador en un solo bucle, sin un `get` extra.

</details>

---

## Ejercicio 5: ¿Qué imprime? — método genérico con límite

<details>
<summary>🔄 Solución</summary>

Imprime:

```
8
perro
```

- `maximo(5, 8)`: `T` es `Integer` y `8.compareTo(5) > 0`, así que devuelve 8.
- `maximo("gato", "perro")`: `T` es `String` y `"perro".compareTo("gato") > 0` (p > g), así que devuelve "perro".

Si `T` no tuviera el límite `Comparable<T>`, el código no compilaría: el método no podría llamar a `compareTo()` porque no sabría que `T` sabe compararse.

</details>

---

## Ejercicio 6: Encuentra el error — la clave duplicada y el primer valor perdido

<details>
<summary>🔄 Solución</summary>

Imprime **`Uno otra vez`**.

Sí, el primer valor ("uno") se pierde: al hacer `put(1, "Uno otra vez")` con una clave que ya existía, el HashMap sobrescribe el valor anterior. Las claves son únicas y solo pueden tener UN valor, el último que se ponga.

</details>

---

## Ejercicio 7: Escribe este programa — mini agenda con getOrDefault

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;
import java.util.TreeMap;

public class Edades {
    public static void main(String[] args) {
        TreeMap<String, Integer> edades = new TreeMap<>();
        edades.put("Ana", 25);
        edades.put("Bob", 30);
        edades.put("Carla", 22);
        edades.put("David", 28);
        edades.put("Eva", 35);

        Scanner sc = new Scanner(System.in);
        System.out.print("¿De quién quieres saber la edad? ");
        String nombre = sc.nextLine();

        int edad = edades.getOrDefault(nombre, -1);
        if (edad == -1) {
            System.out.println(nombre + " no está en el mapa.");
        } else {
            System.out.println(nombre + " tiene " + edad + " años.");
        }
        sc.close();
    }
}
```

`getOrDefault(nombre, -1)` devuelve `-1` (un centinela) si el nombre no existe, así no tocas un `null`. Con un `TreeMap`, además, las claves quedan ordenadas alfabéticamente si algún día decides listarlas.

</details>

---

## Ejercicio 8: Completa el código — getOrDefault

<details>
<summary>🔄 Solución</summary>

```java
int edadAna = edades.get("Ana");                  // 25
int edadCarlos = edades.getOrDefault("Carlos", 0); // 0
```

`edades.get("Carlos")` devuelve `null`, y asignar `null` a un primitivo `int` provoca un error (o un `NullPointerException` si la variable fuera `Integer`). `getOrDefault("Carlos", 0)` devuelve el valor por defecto 0 y evita el susto. Es el salvavidas de los mapas.

</details>

---

## Ejercicio 9: Encuentra el error — la clave mutable

<details>
<summary>🔄 Solución</summary>

Imprime **`null`** (o un valor impredecible, según el `hashCode` interno).

El problema: las claves de un HashMap deben ser **inmutables**. Al modificar `lista` con `add(3)` después de usarla como clave, su `hashCode()` cambia. El HashMap busca en el bucket antiguo, pero la clave ahora tiene otro hash, así que `get()` no la encuentra aunque esté dentro del mapa.

Es como cambiar la cerradura de tu casa y esperar que tu llave vieja siga funcionando. Por eso `String` e `Integer` son claves perfectas: nunca cambian. Nunca uses una `ArrayList`, un array o tus propias clases mutables como clave de un HashMap.

</details>