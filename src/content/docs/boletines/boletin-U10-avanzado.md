---
title: "Boletín U10 — Avanzado"
description: "Ejercicios de dificultad progresiva para exprimir las colecciones"
---

# 📝 Boletín U10 — Avanzado

> Dificultad progresiva. ⭐ para calentar, ⭐⭐ para pensar, ⭐⭐⭐ para concursar. Cada ejercicio incluye una pista (resiste a mirarla).

---

## ⭐ Ejercicio 1: La cola del supermercado con LinkedList

Simula una cola de supermercado usando `LinkedList<String>`. El programa debe mostrar un menú:

1. **Llega cliente** → Añade un nombre al final de la cola.
2. **Atender cliente** → Elimina y muestra el primero de la cola.
3. **¿Quién sigue?** → Muestra el primero sin eliminarlo.
4. **Estado de la cola** → Muestra todos los clientes en orden.
0. **Salir**

Usa los métodos `addLast()`, `removeFirst()` y `getFirst()` de `LinkedList`, con un `switch` y un `Scanner`.

**Pista:** el menú se repite con un `while` hasta que el usuario elija `0`. Cuida los casos en los que la cola está vacía antes de llamar a `removeFirst()` o `getFirst()`.

---

## ⭐⭐ Ejercicio 2: Intersección y unión de conjuntos

Crea dos `HashSet<Integer>` con números aleatorios (entre 1 y 20, 8 elementos cada uno). Calcula y muestra:

- **Intersección:** elementos que están en ambos conjuntos.
- **Unión:** todos los elementos sin repetir.
- **Diferencia simétrica:** elementos que están en uno u otro, pero no en ambos.

**Pista:** usa `retainAll()`, `addAll()` y `removeAll()` de la interfaz `Set`. Para la diferencia simétrica: `union.removeAll(interseccion)`.

---

## ⭐⭐ Ejercicio 3: Eliminar duplicados manteniendo el orden

Crea un `ArrayList<Integer>` con elementos repetidos (`[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]`). Escribe un método que devuelva un nuevo `ArrayList<Integer>` **sin duplicados pero manteniendo el orden de primera aparición**.

**Pista:** un `HashSet` no vale directamente porque pierde el orden. Usa un `LinkedHashSet` (conserva el orden de inserción) o recorre manualmente comprobando con `contains` antes de añadir.

---

## ⭐⭐⭐ Ejercicio 4: ¿Qué imprime? — el remove que rompe el baile

Sin ejecutar, responde qué ocurre con este programa:

```java
import java.util.ArrayList;

public class Puzle {
    public static void main(String[] args) {
        ArrayList<String> palabras = new ArrayList<>();
        palabras.add("hola");
        palabras.add("mundo");
        palabras.add("adiós");

        for (String p : palabras) {
            if (p.equals("mundo")) {
                palabras.remove(p);
            }
        }
        System.out.println(palabras);
    }
}
```

¿Imprime algo? ¿O lanza una excepción? ¿Cuál y por qué?

**Pista:** piensa en lo que hace el `for-each` por debajo (usa un `Iterator`) y en lo que pasa si la colección cambia mientras se recorre.

---

## ⭐⭐ Ejercicio 5: Filtrar con Iterator

Crea un `ArrayList<Integer>` con los números del 1 al 10. Recórrelo con un `Iterator<Integer>` explícito y **borra todos los números pares** usando `it.remove()`. Al final, imprime la lista.

**Pista:** recorre con `while (it.hasNext())`, obtén cada número con `it.next()` y comprueba si es par con `% 2 == 0`. Nunca uses `lista.remove(...)` dentro del bucle.

---

## ⭐⭐ Ejercicio 6: El TreeSet ordenado

Crea un programa que pida al usuario palabras con `Scanner` hasta que escriba `"fin"`. Guárdalas en un `TreeSet<String>`. Al terminar, muestra:

1. Las palabras ordenadas (imprimir el TreeSet directamente).
2. La primera palabra (`first()`) y la última (`last()`).
3. Las palabras que van antes que `"m"` en orden alfabético (`headSet("m")`).

**Pista:** el TreeSet ordena y elimina duplicados automáticamente. Comprueba qué pasa si el usuario repite una palabra.

---

## ⭐⭐⭐ Ejercicio 7: Encuentra el error — el bucle que explota

```java
import java.util.ArrayList;

public class Error {
    public static void main(String[] args) {
        ArrayList<String> nombres = new ArrayList<>();
        nombres.add("Ana");
        nombres.add("Bob");
        nombres.add("Carla");

        for (String n : nombres) {
            if (n.equals("Bob")) {
                nombres.remove(n);
            }
        }
        System.out.println(nombres);
    }
}
```

Este programa compila pero **se cae en ejecución**. ¿Qué excepción lanza y por qué? Reescríbelo usando un `Iterator` explícito para que funcione.

**Pista:** el `for-each` esconde un `Iterator`. Borrar con el `remove()` de la lista mientras el iterador recorre es una declaración de guerra.

---

## ⭐⭐ Ejercicio 8: ¿Qué imprime? — Collections en acción

Sin ejecutar, responde qué imprime:

```java
import java.util.*;

public class Puzzle {
    public static void main(String[] args) {
        ArrayList<Integer> nums = new ArrayList<>();
        nums.add(5);
        nums.add(1);
        nums.add(8);
        nums.add(3);

        Collections.sort(nums);
        Collections.reverse(nums);

        System.out.println(nums.get(1));
    }
}
```

**Pista:** recuerda que `sort` y `reverse` **modifican la lista original**. Primero ordena, después da la vuelta, y mira qué queda en la posición 1.

---

## ⭐⭐⭐ Ejercicio 9: Estadísticas de clase con ArrayList

Pide al usuario las notas de 20 alumnos con `Scanner`, guárdalas en un `ArrayList<Double>` y calcula:

- La nota media.
- La nota más alta y la más baja (puedes usar `Collections.max()` y `Collections.min()`).
- Cuántos alumnos aprobaron (nota >= 5).

Usa un bucle para rellenar la lista y un for-each para sumar.

**Pista:** para la media acumula la suma con un for-each y divide entre `notas.size()`. Para aprobados, cuenta en el mismo bucle. `Collections.max` y `Collections.min` te ahorran los bucles del máximo/mínimo.