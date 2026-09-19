---
title: "Boletín U11 — Inicial"
description: "Ejercicios básicos de Colecciones, genéricos y mapas: ArrayList, HashSet, HashMap, Caja<T> y getOrDefault"
---

# 📝 Boletín U11 — Inicial

> Sin soluciones. Sin prisas. Abre el IDE, crea tu primer `ArrayList`, tu primera `Caja<T>` y haz que el `HashMap` deje de parecer magia. Empieza suave, que las colecciones muerden poco a poco.

---

## Ejercicio 1: ¿Qué imprime? — ArrayList remove por índice vs valor

```java
import java.util.ArrayList;

public class Test {
    public static void main(String[] args) {
        ArrayList<String> lista = new ArrayList<>();
        lista.add("A");
        lista.add("B");
        lista.add("C");
        lista.add("B");
        lista.add("D");

        lista.remove(1);          // remove por índice
        lista.remove("B");        // remove por objeto

        System.out.println(lista);
    }
}
```

¿Qué imprime? ¿Por qué el segundo `remove("B")` no borra el mismo elemento que el primero?

---

## Ejercicio 2: Encuentra el error — size() vs length vs length()

```java
ArrayList<String> nombres = new ArrayList<>();
nombres.add("Ana");

int[] edades = {20, 30};
String saludo = "Hola";

System.out.println(nombres.length);   // línea 1
System.out.println(edades.size());    // línea 2
System.out.println(saludo.length);    // línea 3
```

¿Qué líneas tienen error? Explica qué usa cada tipo para preguntar cuánto mide: `size()`, `length` o `length()`.

---

## Ejercicio 3: Completa el código — for-each que suma una lista

Completa el siguiente programa para que sume todos los números de una `ArrayList<Integer>`:

```java
import java.util.ArrayList;

public class SumaLista {
    public static void main(String[] args) {
        ArrayList<Integer> numeros = new ArrayList<>();
        numeros.add(4);
        numeros.add(9);
        numeros.add(2);
        numeros.add(7);

        int suma = ______;
        for (______ n : numeros) {      // ¿qué tipo y qué variable?
            suma ______ n;              // ¿qué operador?
        }

        System.out.println("Suma: " + suma);
    }
}
```

¿Qué falta en cada hueco? ¿Cuánto vale la suma al final?

---

## Ejercicio 4: Escribe este programa — la lista de la compra

Crea un programa con un `ArrayList<String>` llamado `compra` y haz lo siguiente:

1. Añade `"Leche"`, `"Pan"` y `"Huevos"`.
2. Añade `"Café"` en la posición 1 (entre Leche y Pan).
3. Muestra el tamaño de la lista.
4. Borra el elemento de la posición 2.
5. Recorre la lista con un for-each e imprime cada elemento.

Pista: usa `add(e)`, `add(i, e)`, `remove(i)`, `size()` y un for-each.

---

## Ejercicio 5: ¿Qué imprime? — el HashSet que no deja repetir

```java
import java.util.HashSet;

public class Test {
    public static void main(String[] args) {
        HashSet<String> invitados = new HashSet<>();
        invitados.add("Ana");
        invitados.add("Bob");
        invitados.add("Ana");

        System.out.println(invitados.size());
        System.out.println(invitados.contains("Bob"));
    }
}
```

¿Qué imprime? ¿Por qué el segundo `add("Ana")` no provoca ningún error ni aviso?

---

## Ejercicio 6: Escribe este programa — sin duplicados

Crea un `ArrayList<String>` con nombres de compañeros, **con repetidos a propósito** (mínimo 8 elementos, 3 de ellos repetidos). Después:

1. Construye un `LinkedHashSet<String>` a partir de la lista.
2. Imprime la lista original y el conjunto.
3. Explica en un comentario qué diferencia ves y por qué.

Pista: el constructor de `LinkedHashSet` acepta cualquier colección: `new LinkedHashSet<>(lista)`.

---

## Ejercicio 7: Completa el código — tu primera clase genérica

```java
public class Caja<______> {        // ¿qué parámetro de tipo falta?
    private ______ contenido;

    public void guardar(______ contenido) {
        this.contenido = contenido;
    }

    public ______ sacar() {
        return contenido;
    }
}
```

Completa los huecos para que `Caja<String>` guarde Strings y `Caja<Integer>` guarde Integers. ¿Por qué `Caja<int>` no compila?

---

## Ejercicio 8: ¿Qué imprime? — HashMap con put repetido

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

## Ejercicio 9: Escribe este programa — contador de palabras con HashMap

Crea un programa que tenga un array de palabras (hardcodeado) como este:

```java
String[] palabras = {"hola", "mundo", "hola", "java", "mundo", "hola", "adios"};
```

Usa un `HashMap<String, Integer>` para contar cuántas veces aparece cada palabra. Al final, recorre el mapa con un bucle for-each sobre `entrySet()` y muestra cada palabra con su cuenta.

Pista: el patrón estrella es `mapa.put(p, mapa.getOrDefault(p, 0) + 1)`.
