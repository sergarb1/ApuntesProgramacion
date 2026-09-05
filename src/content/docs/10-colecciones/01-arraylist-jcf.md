---
title: "01 · ArrayList y el Java Collections Framework"
description: "El parking que crece solo: ArrayList, la familia java.util y por qué no puede guardar int a pelo 🅿️📈"
---

<p><small>El parking que crece solo: ArrayList, la familia java.util y por qué no puede guardar int a pelo 🅿️📈</small></p>

> 🗺️ **Estás en:** 📚 **U10 · Colecciones** → 01 · ArrayList y el Java Collections Framework

---

## 📬 La idea en una frase

> **ArrayList es un array con superpoderes: crece solo, se encoge solo y trae métodos listos (`add`, `get`, `remove`, `contains`...) en lugar de obligarte a escribir cada bucle a mano.**

En la U04 viste los arrays: tamaño fijo, acceso por índice y mucho trabajo manual. Llegó el momento que estaban esperando: el parking se ha quedado pequeño y necesitas algo que crezca. Aquí empieza la unidad de las colecciones y, probablemente, la herramienta que más usarás en tu vida como programadora o programador.

---

## 🅿️ El problema: tu array se ha quedado sin plazas

Has creado un array de 10 plazas. Han llegado 11 gatos. ¿Qué haces?

```java
String[] gatos = new String[10]; // 10 plazas, 11 gatos... mal asunto
```

Con un array clásico tendrías que crear uno nuevo, copiar todo y añadir el que falta. Es como aparcar en la calle porque el parking está lleno:

```java
String[] gatosMasGrande = new String[gatos.length + 1];
System.arraycopy(gatos, 0, gatosMasGrande, 0, gatos.length);
gatosMasGrande[gatosMasGrande.length - 1] = "Bigotes Jr.";
gatos = gatosMasGrande; // Ahora apunta al nuevo array
```

Funciona, pero es tedioso. Y si además tienes que borrar un elemento del medio, es peor. Necesitas algo que crezca y se encoja solo.

---

## 🎓 El Java Collections Framework (JCF)

Para eso existe el **JCF**: una familia de clases e interfaces en `java.util` que gestionan grupos de objetos como si fueran de goma. El árbol de la familia empieza así:

```
Collection (interfaz)
├── List        → ArrayList, LinkedList (ordenados, permiten duplicados)
├── Set         → HashSet, TreeSet (sin duplicados)
└── Queue       → colas (FIFO)
```

Todas comparten métodos básicos: `add`, `remove`, `contains`, `size`, `isEmpty`, `clear`. Aprender uno es aprender el esqueleto de todos. La interfaz `List` es la que más usarás.

> 💡 **Consejo:** declara tus variables con la interfaz, no con la clase: `List<String> gatos = new ArrayList<>();`. Así, si mañana necesitas una `LinkedList`, cambias una línea. Lo verás en el punto 7.

---

## 🅿️📈 ArrayList: el parking que crece solito

ArrayList es un array "de goma": cuando se llena, crea uno más grande por dentro y copia los datos. Tú no te enteras de nada.

```java
import java.util.ArrayList;

public class EjemploArrayList {
    public static void main(String[] args) {
        ArrayList<String> gatos = new ArrayList<>();
        gatos.add("Bigotes");                    // [Bigotes]
        gatos.add("Garfield");                   // [Bigotes, Garfield]
        gatos.add("Misifú");                     // [Bigotes, Garfield, Misifú]
        gatos.remove(1);                         // [Bigotes, Misifú] - adiós, Garfield
        String primero = gatos.get(0);           // "Bigotes"
        int cuantos = gatos.size();              // 2
        boolean hay = gatos.contains("Misifú");  // true
        int pos = gatos.indexOf("Bigotes");      // 0
        System.out.println(gatos);
    }
}
```

El repertorio de métodos imprescindibles:

| Método | Qué hace |
|---|---|
| `add(e)` | Añade al final |
| `add(i, e)` | Inserta en la posición `i` (desplaza el resto) |
| `get(i)` | Devuelve el elemento de la posición `i` |
| `set(i, e)` | Sustituye el elemento de la posición `i` |
| `remove(i)` | Borra por índice |
| `remove(objeto)` | Borra la primera aparición de ese objeto |
| `size()` | Número de elementos (NO `length`) |
| `contains(e)` | ¿Está? |
| `indexOf(e)` | Posición de la primera aparición |
| `isEmpty()` | ¿Está vacía? |
| `clear()` | Lo borra todo |

> ⚠️ **Advertencia:** ArrayList usa `size()`, no `length`. Array usa `length`, no `size()`. String usa `length()`, no `length` ni `size()`. Cada uno tiene su propia forma de preguntar cuánto mide. Es una trampa en el 90% de los exámenes.

### Recorrer un ArrayList

Con for-each (el preferido para leer):

```java
for (String gato : gatos) {
    System.out.println("Miau: " + gato);
}
```

O con for clásico, que también funciona porque `List` tiene índices:

```java
for (int i = 0; i < gatos.size(); i++) {
    System.out.println(i + ": " + gatos.get(i));
}
```

Fíjate: `gatos.size()` dentro de la condición se evalúa en cada vuelta. Funciona, aunque para rendimiento se suele guardar en una variable si no cambia.

---

## 🚫 ArrayList NO guarda primitivos

No puedes hacer `ArrayList<int>`. Los genéricos (`<...>`) solo funcionan con objetos. Para números usas las clases **wrapper**:

```java
ArrayList<Integer> numeros = new ArrayList<>();
numeros.add(42);               // autoboxing: int → Integer
int n = numeros.get(0);        // unboxing: Integer → int
```

Desde Java 5, el **autoboxing/unboxing** es automático: metes un `int` y Java lo envuelve en un `Integer` sin que tú lo notes. Pero por dentro sigue habiendo objetos.

> 📝 **Nota:** lo mismo con el resto de primitivos: `boolean` → `Boolean`, `double` → `Double`, `char` → `Character`... Si necesitas saber más sobre genéricos y wrappers, la U11 los estira a fondo.

### El truco de remove con números

`remove(1)` y `remove(Integer.valueOf(1))` NO hacen lo mismo:

```java
ArrayList<Integer> nums = new ArrayList<>();
nums.add(10);
nums.add(20);
nums.add(30);
nums.remove(1);                // borra por ÍNDICE: se va el 20
// nums.remove(Integer.valueOf(20)); // esto borra el OBJETO 20
```

Si quieres borrar el número 20, debes pasarle el wrapper. Si le pasas un `int`, lo interpreta como índice. Es el clásico error de los novatos con `ArrayList<Integer>`.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** ArrayList usa arrays por dentro. Cuando se llena, crea uno nuevo y copia. Cada operación tiene su coste, pero tú no tienes que pensar en ello.

**Ejercicio: el ArrayList misterioso**

```java
import java.util.ArrayList;

public class BeTheList {
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

**¿Qué imprime?**

- (A) 10 20 30
- (B) 10 15 30
- (C) 10 15 20 30
- (D) 10 15

<details>
<summary>🔄 Solución</summary>

La **B**. Se añade 15 en el índice 1 → `{10, 15, 20, 30}`. Luego se borra el **objeto** `Integer(20)` (no el índice) → `{10, 15, 30}`. El for-each imprime `10 15 30`. Si hubiera sido `lista.remove(2)`, el resultado habría sido el mismo por casualidad, pero por un motivo distinto.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué método usa ArrayList para saber su tamaño: `length`, `length()` o `size()`?
2. ¿Por qué no se puede hacer `ArrayList<int>`?
3. ¿Qué borra `lista.remove(2)` en un `ArrayList<Integer>`: el índice 2 o el número 2?
4. ¿Para qué sirve declarar `List<String> x = new ArrayList<>()` en vez de `ArrayList<String> x`?

<details>
<summary>🔄 Respuestas</summary>

1. `size()`. Es un método, con paréntesis. El `length` sin paréntesis es de los arrays.
2. Porque los genéricos solo aceptan objetos, y `int` es un primitivo. Usa `Integer` y deja que el autoboxing haga su magia.
3. El índice 2 (borra el tercer elemento). Para borrar el número 2, usa `remove(Integer.valueOf(2))`.
4. Para poder cambiar la implementación (a `LinkedList`, por ejemplo) sin tocar el resto del código. Se programa contra la interfaz.

</details>

---

## ✅ Resumen en 3 frases

1. **ArrayList** es una lista dinámica: crece solo, se encoge solo y trae métodos (`add`, `get`, `remove`, `contains`, `size`) para no reinventar la rueda.
2. Pertenece al **Java Collections Framework** (`java.util`), una familia de listas, conjuntos y colas con métodos comunes.
3. No guarda **primitivos**: usa las clases wrapper (`Integer`, `Double`...) con autoboxing automático, y cuidado con la diferencia entre `remove(índice)` y `remove(objeto)`.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | JCF | La familia de colecciones de `java.util` |
> | `List` | Colección ordenada con índices y duplicados permitidos |
> | Wrapper | Clase que envuelve un primitivo (`Integer` envuelve `int`) |
> | Autoboxing | Pasar de primitivo a wrapper automáticamente |
> | Unboxing | Pasar de wrapper a primitivo automáticamente |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/10-colecciones) · **Anterior:** — · **Siguiente:** [02 · LinkedList: la conga line](/ApuntesProgramacion/10-colecciones/02-linkedlist)