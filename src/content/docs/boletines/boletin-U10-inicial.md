---
title: "Boletín U10 — Inicial"
description: "Ejercicios básicos de Colecciones: ArrayList, remove por índice vs valor y for-each sobre listas"
---

# 📝 Boletín U10 — Inicial

> Sin soluciones. Sin prisas. Abre el IDE, crea tu primer `ArrayList` y haz que el `for-each` deje de parecer magia. El parking crece solo, pero el que aparca es otro... y tú. Empieza suave, que las colecciones muerden poco a poco.

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

## Ejercicio 5: ¿Qué imprime? — el ArrayList misterioso

```java
import java.util.ArrayList;

public class Misterio {
    public static void main(String[] args) {
        ArrayList<Integer> lista = new ArrayList<>();
        lista.add(10);
        lista.add(20);
        lista.add(30);
        lista.add(1, 15);
        lista.remove(Integer.valueOf(20));

        for (Integer n : lista) {
            System.out.print(n + " ");
        }
    }
}
```

¿Qué imprime? Explica qué hace `add(1, 15)` y por qué `remove(Integer.valueOf(20))` NO es lo mismo que `remove(2)`.

---

## Ejercicio 6: Escribe este programa — ¿está en la lista?

Crea un `ArrayList<String>` con al menos 5 nombres de compañeros de clase. Pide al usuario un nombre por teclado con `Scanner` y dime:

- Si el nombre está en la lista, imprime `"Sí, está en la posición X"` usando `indexOf`.
- Si no está, imprime `"No está"`.

Pista: `indexOf` devuelve `-1` cuando no encuentra el elemento.

---

## Ejercicio 7: Escribe este programa — el mayor de la lista

Escribe un método `public static int mayor(ArrayList<Integer> notas)` que recorra la lista con un for clásico (`get(i)`) y devuelva la nota más alta. En `main()`, crea una lista con notas, llama al método y muestra el resultado.

Pista: empieza con `max = notas.get(0)` y recorre desde el índice 1.

---

## Ejercicio 8: Encuentra el error — ArrayList<int> no compila

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

Este código **no compila**. ¿Por qué? ¿Cómo lo corriges para que sí compile? ¿Qué papel juega el autoboxing?

---

## Ejercicio 9: Escribe este programa — posición y valor

Crea un `ArrayList<Integer>` con los números del 1 al 5 (usa un bucle). Después recórrelo con un **for clásico** (con índice) e imprime en cada línea la posición y el valor, así:

```
Posición 0 → 1
Posición 1 → 2
...
```

Pista: usa `lista.add(i)` dentro de un bucle para rellenar y luego `lista.get(i)` para leer.