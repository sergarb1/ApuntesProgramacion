---
title: "03 · HashSet: el portero sin duplicados"
description: "La discoteca de Java: no deja entrar a nadie que ya esté dentro, y es O(1) para preguntar ¿ya lo tengo? 🚫"
---

<p><small>La discoteca de Java: no deja entrar a nadie que ya esté dentro, y es O(1) para preguntar ¿ya lo tengo? 🚫</small></p>

> 🗺️ **Estás en:** 📚 **U10 · Colecciones** → 03 · HashSet: el portero sin duplicados

---

## 📬 La idea en una frase

> **HashSet es una discoteca: no deja entrar a nadie que ya esté dentro. Sin duplicados, sin orden y O(1) para la pregunta del millón: ¿ya tengo esto?**

En el punto 2 conociste las listas: orden y duplicados bienvenidos. Ahora cambia el baile: hay problemas donde repetidos sobran y el orden no importa. Ahí aparece el portero más eficiente de Java.

---

## 🚫 HashSet: el portero que no deja duplicados

HashSet es como una discoteca: **no deja entrar a nadie que ya esté dentro**. No importa el orden, solo la exclusividad.

```java
import java.util.HashSet;

public class EjemploHashSet {
    public static void main(String[] args) {
        HashSet<String> invitados = new HashSet<>();
        invitados.add("Ana");
        invitados.add("Bob");
        invitados.add("Ana"); // No pasa nada, Ana ya está
        System.out.println(invitados.size()); // 2, no 3
        System.out.println(invitados.contains("Bob")); // true
    }
}
```

¿Cómo sabe si un elemento ya está? Usa `hashCode()` y `equals()`. Primero calcula el `hashCode()` del elemento para encontrar el "cajón" y luego comprueba con `equals()` si ya hay uno igual dentro.

> ⚠️ **Advertencia:** si sobreescribes `equals()` en una clase, SOBREESCRIBE `hashCode()`. Siempre. Si dos objetos son iguales según `equals()`, deben tener el mismo `hashCode()`. Si no, HashSet se volverá loco. Repito: **siempre**.

### Operaciones típicas con HashSet

```java
HashSet<String> set = new HashSet<>();
set.add("rojo");
set.add("verde");
set.add("azul");
set.remove("rojo");
set.contains("verde");   // true
set.isEmpty();           // false
set.size();              // 2
set.clear();             // lo vacía todo
```

Sus ventajas: **O(1)** para añadir, borrar y comprobar pertenencia, y elimina duplicados sin que tengas que pensarlo. Es la colección más rápida para "¿ya tengo esto?".

---

## 🎲 Un HashSet no tiene orden

Esto es importante: **HashSet no garantiza ningún orden**. Si metes `{"rojo", "verde", "azul"}`, al imprimir puede salir `[azul, rojo, verde]`, `[verde, rojo, azul]` o cualquier otra combinación. No te fíes del orden, fíate de `size()` y `contains()`.

```java
HashSet<String> colores = new HashSet<>();
colores.add("rojo");
colores.add("verde");
colores.add("azul");
System.out.println(colores); // ¿[rojo, verde, azul]? Quizá, quizá no...
```

> 💡 **Consejo:** si te da igual el orden y solo quieres saber qué elementos hay sin repetir, HashSet es tu colección. Si además los quieres ordenados, mira el punto 4 (TreeSet).

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cada colección resuelve un problema distinto. Antes de escribir código, pregúntate: ¿me importa el orden? ¿puede haber duplicados? ¿necesito velocidad?

**Ejercicio: el portero de la fiesta**

```java
import java.util.HashSet;

public class BeTheSet {
    public static void main(String[] args) {
        HashSet<Integer> numeros = new HashSet<>();
        numeros.add(3);
        numeros.add(1);
        numeros.add(4);
        numeros.add(1);   // duplicado: no entra
        numeros.add(5);
        numeros.add(3);   // duplicado: no entra

        System.out.println(numeros.size());
        System.out.println(numeros.contains(4));
    }
}
```

**¿Qué imprime?**

- (A) 6 y true
- (B) 4 y true
- (C) 4 y false
- (D) 5 y true

<details>
<summary>🔄 Solución</summary>

La **B**. Los valores únicos son `{1, 3, 4, 5}`: 4 elementos. El `4` sí está (`contains` → true). Los `add(1)` y `add(3)` repetidos se ignoran silenciosamente. Ojo: HashSet no garantiza un orden concreto al imprimir, por eso el `size()` es lo fiable.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Cuántos elementos hay en un `HashSet` tras añadir `a, b, a, c, b`?
2. ¿HashSet garantiza algún orden al imprimir?
3. ¿Qué métodos usa HashSet por dentro para saber si un elemento ya está?
4. ¿Cuál es la complejidad de `contains()` en un `HashSet`?

<details>
<summary>🔄 Respuestas</summary>

1. 3 (`a`, `b`, `c`). Los duplicados no entran.
2. No. Ninguno. Si necesitas orden, mira TreeSet (punto 4) o LinkedHashSet (también en el punto 4).
3. `hashCode()` para encontrar el "cajón" y `equals()` para confirmar si hay un elemento igual dentro.
4. O(1) en el caso normal. Esa es su gran ventaja frente a recorrer una lista.

</details>

---

## ✅ Resumen en 3 frases

1. **HashSet** es el portero sin duplicados: no admite repetidos y no ordena nada.
2. Es **O(1)** para añadir, borrar y comprobar pertenencia: la respuesta rápida a "¿ya tengo esto?".
3. Se apoya en **`hashCode()` y `equals()`**: si sobreescribes `equals()` en una clase, sobreescribe también `hashCode()`, o HashSet se vuelve loco.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `Set` | Colección sin duplicados |
> | `hashCode()` | "Número de cajón" que usa HashSet para encontrar elementos |
> | `equals()` | Comparación de igualdad entre objetos |
> | O(1) | Coste constante: instantáneo aunque haya un millón de elementos |
> | Duplicado | Elemento igual a otro según `equals()` |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/10-colecciones) · **Anterior:** [02 · LinkedList: la conga line](/ApuntesProgramacion/10-colecciones/02-linkedlist) · **Siguiente:** [04 · TreeSet y LinkedHashSet: el ordenado y el que recuerda](/ApuntesProgramacion/10-colecciones/04-treeset-linkedhashset)