---
title: "Boletín U11 — Avanzado"
description: "Ejercicios de dificultad progresiva para exprimir las colecciones, los genéricos y los mapas"
---

# 📝 Boletín U11 — Avanzado

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

## ⭐ Pila genérica `<T>`: Ejercicio 7

Implementa una clase genérica `Pila<T>` que funcione como una pila (LIFO). Debe tener los métodos:

- `void push(T elemento)` — apila un elemento.
- `T pop()` — desapila y devuelve el elemento superior (lanza `EmptyStackException` si está vacía).
- `T peek()` — devuelve el elemento superior sin desapilarlo.
- `boolean isEmpty()` — indica si está vacía.
- `int size()` — número de elementos.

Internamente, usa un `ArrayList<T>` como almacenamiento. Pruébala con `Pila<Integer>`, `Pila<String>` y `Pila<Double>`.

**Pista:** `EmptyStackException` está en `java.util.EmptyStackException`. Recuerda comprobar `isEmpty()` antes de `pop()`/`peek()`.

---

## ⭐⭐ Ejercicio 8: HashMap inverso

Escribe un método genérico estático:

```java
public static <K, V> HashMap<V, K> invertirMapa(HashMap<K, V> original)
```

Que devuelva un nuevo `HashMap` intercambiando claves y valores. Si hay valores duplicados en el mapa original, el último encontrado sobrescribe al anterior.

Prueba con un mapa de `String → Integer` y otro de `String → String`.

**Pista:** recorre `original.entrySet()` y haz `invertido.put(e.getValue(), e.getKey())`.

---

## ⭐⭐ Ejercicio 9: TreeMap — frecuencia de letras

Escribe un programa que lea un texto por teclado (o use uno hardcodeado) y cuente cuántas veces aparece cada **letra** (ignorando espacios, números y signos). Usa un `TreeMap<Character, Integer>` para que las letras se muestren automáticamente ordenadas alfabéticamente.

Ejemplo de salida para «Hola mundo»:

```
a: 1, d: 1, h: 1, l: 1, m: 1, n: 1, o: 2, u: 1
```

**Pista:** recorre el `String` con `toCharArray()` y usa `Character.isLetter(c)` para filtrar. El `getOrDefault` suma el contador; el TreeMap ordena solo.

---

## ⭐⭐⭐ Ejercicio 10: Wildcards — suma y mezcla de números

Implementa un método que sume todos los números de una lista, aceptando cualquier subtipo de `Number`:

```java
public static double sumar(List<? extends Number> lista)
```

Pruébalo con `List<Integer>`, `List<Double>` y `List<Float>`. ¿Qué ocurre si intentas pasar una `List<String>`?

Crea también un segundo método que **mezcle** dos listas de números de tipos distintos en una sola `List<Double>`:

```java
public static List<Double> mezclar(List<? extends Number> a, List<? extends Number> b)
```

**Pista:** para `sumar`, recorre con `for (Number n : lista)` y usa `n.doubleValue()`. Para `mezclar`, usa `addAll()` y convierte cada elemento con `doubleValue()`. Y no intentes `add` en `sumar`: `? extends` es de solo lectura (PECS).

---

## ⭐⭐⭐ Ejercicio 11: Sistema de votaciones con método genérico

Crea un sistema de votaciones donde:

- Cada votante puede votar por un candidato (String).
- Usa un `HashMap<String, Integer>` para los votos.
- Usa un `TreeMap<String, Integer>` para mostrar el ranking ordenado.

Crea un método genérico:

```java
public static <T> T obtenerGanador(Map<T, Integer> votos)
```

Que devuelva la clave con más votos. Pruébalo con un `HashMap<String, Integer>` y otro `HashMap<Integer, Integer>`.

**Pista:** recorre `votos.entrySet()` y guarda el ganador provisional comparando `getValue()` con un máximo acumulado. El método es genérico porque el tipo de la clave (`String`, `Integer`...) no importa.

---

## ⭐⭐⭐ Ejercicio 12: el type erasure al descubierto

La clase `Caja<T>` guarda un valor y lo devuelve con `getValor()`:

```java
public class Caja<T> {
    private T valor;

    public Caja(T valor) {
        this.valor = valor;
    }

    public T getValor() {
        return valor;
    }
}
```

Sin ejecutar, responde:

1. ¿Son `Caja<String>` y `Caja<Integer>` clases distintas en tiempo de ejecución?
2. ¿Qué tipo tiene realmente `caja.getValor()` dentro del bytecode si lo compilas como `Caja<String>`?
3. Escribe un `main` que cree `Caja<String>` y `Caja<Integer>` y compruebe con `getClass()` que ambas son instancias de la misma clase `Caja`.

**Pista:** el type erasure convierte `Caja<T>` en `Caja` a pelo (con `Object` donde estaba `T`). Por eso `caja.getClass()` devuelve lo mismo para `Caja<String>` y `Caja<Integer>`: en runtime no hay dos clases, solo una `Caja`. El cast de `getValor()` lo añade el compilador, no tu código.
