---
title: "📦 Unidad 8: Arrays y Colecciones"
nav_order: 8
---
🎯 **Objetivos de aprendizaje**
- Declarar y recorrer arrays unidimensionales y multidimensionales
- Usar el bucle for-each para leer colecciones
- Elegir la colección adecuada según el problema
- Utilizar iteradores para recorrer y modificar colecciones
- Conocer las diferencias entre ArrayList, LinkedList, HashSet y TreeSet

## Arrays: El Aparcamiento de Datos

### El Problema: Tienes 100 Gatos y un Solo Nombre

Imagina que tienes 100 gatos y necesitas guardar sus nombres. Podrías hacer esto:

```java
String gato1 = "Bigotes";
String gato2 = "Garfield";
String gato3 = "Misifú";
// ... 97 líneas después ...
String gato100 = "Calcetines";
```

Pero entonces llega el gato 101 y tu programa se cae. O peor: quieres saber cuántos gatos empiezan con "M" y tienes que escribir 100 `if`. Tu espalda ya duele solo de pensarlo.

> **⚠️ Advertencia:** Si alguna vez escribes `gato1`, `gato2`, `gato3`, ... `gatoN` en tu código, en algún lugar un programador senior llora. Los arrays existen exactamente para esto.

### El Array: Tu Primer Aparcamiento

Un array es como un parking de varias plantas. Cada plaza tiene un número (índice) y en cada plaza solo caben coches del mismo tipo (bueno, y sus subclases).

```java
String[] gatos = new String[100];
// Has creado un parking con 100 plazas para Strings
```

La primera plaza es la 0, no la 1. Esto confunde a todo el mundo al principio. Acéptalo.

> **💡 Consejo:** Piensa en los índices como distancias desde la primera posición. La primera casa está a 0 pasos de ti, no a 1.

### Cómo Meter Cosas en el Parking

```java
String[] gatos = new String[3];
gatos[0] = "Bigotes";
gatos[1] = "Garfield";
gatos[2] = "Misifú";
gatos[3] = "Calcetines"; // ¡BOOM!
```

¿Qué pasa en la última línea? Te vas a estrellar.

### ¡BOOM! La ArrayIndexOutOfBoundsException

```java
int[] numeros = new int[5];
numeros[0] = 10;
numeros[1] = 20;
numeros[2] = 30;
numeros[3] = 40;
numeros[4] = 50;
numeros[5] = 60; // Index 5 out of bounds for length 5
```

> **⚠️ Advertencia:** El array es un objeto (está en el heap), pero la referencia está en la pila (stack). Cuando pasas un array a un método, pasas la referencia, no los datos. ¡Ojo! Si modificas el array dentro del método, los cambios afectan al original.

### El Dúo Inseparable: for + Array

Los arrays y los bucles `for` son como el pan y la mantequilla. Nunca verás uno sin el otro.

```java
String[] gatos = {"Bigotes", "Garfield", "Misifú", "Calcetines"};

for (int i = 0; i < gatos.length; i++) {
    System.out.println("Gato " + i + ": " + gatos[i]);
}
```

Fíjate: `gatos.length` NO lleva paréntesis. No es un método, es un atributo. Los Strings usan `length()`. Los arrays usan `length`. Es una trampa mortal en los exámenes.

### ⭐ BE THE CODE, MY FRIEND:

> 🕶️ **Don Tip:** Los arrays tienen tamaño fijo. Una vez creados, no puedes añadir ni quitar elementos.

```java
public class BeTheArray {
    public static void main(String[] args) {
        int[] arr = new int[4];
        arr[0] = 2;
        arr[1] = 4;
        arr[2] = 6;
        arr[3] = 8;

        for (int i = 0; i < arr.length; i++) {
            arr[i] = arr[i] * 2;
        }

        System.out.println(arr[2]);
    }
}
```

> **⭐ BE THE CODE, MY FRIEND**
>
> > 🕶️ **Don Tip:** Las variables de tipo array guardan una referencia, no los datos. Asignar un array a otro no copia los datos.
>
> **¿Qué imprime?**
> - (A) 6
> - (B) 8
> - (C) 12
> - (D) 16
>
> **Respuesta: (C) 12.** El array original es {2,4,6,8}. Después del bucle, cada elemento se multiplica por 2: {4,8,12,16}. arr[2] = 12.

### ⭐ BE THE CODE, MY FRIEND: El Array Revelde

> 🕶️ **Don Tip:** Cuando pasas un array a un método, pasas la referencia. Si lo modificas dentro, cambia fuera.

```java
public class BeTheArrayRevelde {
    public static void main(String[] args) {
        int[] nums = {1, 2, 3, 4, 5};
        for (int i = 0; i < nums.length; i++) {
            nums[i] = nums[i] * nums[i];
        }
        System.out.println(nums[2]);
    }
}
```

> **⭐ BE THE CODE, MY FRIEND**
>
> > 🕶️ **Don Tip:** Los arrays se pasan por referencia. Las variables primitivas se pasan por valor.
>
> **¿Qué imprime?**
> - (A) 3
> - (B) 6
> - (C) 9
> - (D) 25
>
> **Respuesta: (C) 9.** Se eleva cada número al cuadrado: {1,4,9,16,25}. nums[2] = 9.

### for-each: La Variante Perezosa

Si no necesitas el índice (solo quieres leer los valores), existe una sintaxis más corta:

```java
String[] gatos = {"Bigotes", "Garfield", "Misifú"};

for (String gato : gatos) {
    System.out.println("Miau: " + gato);
}
```

Se lee: "para cada String gato en gatos, haz esto".

> **📝 Nota:** El for-each es de solo lectura. No puedes modificar el array original dentro del bucle. Bueno, puedes intentarlo, pero el cambio se pierde en el éter.

### Arrays Multidimensionales: El Parking de Varias Plantas

¿Necesitas una tabla con filas y columnas? Usa un array bidimensional.

```java
int[][] tabla = new int[3][4]; // 3 filas, 4 columnas
tabla[0][0] = 1; // fila 0, columna 0
tabla[1][2] = 5; // fila 1, columna 2
// ...
```

Java también permite "arrays de arrays" irregulares (cada fila con distinto número de columnas):

```java
int[][] irregular = new int[3][];
irregular[0] = new int[2];
irregular[1] = new int[5];
irregular[2] = new int[3];
```

¿Para qué sirve? Triángulos, pirámides, o simplemente datos que no forman un rectángulo perfecto.

### Recorrer un Array 2D

```java
int[][] matriz = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};

for (int i = 0; i < matriz.length; i++) {
    for (int j = 0; j < matriz[i].length; j++) {
        System.out.print(matriz[i][j] + " ");
    }
    System.out.println();
}
```

> **💡 Consejo:** Nombra los índices de arrays multidimensionales como `fila` y `col` o `i` y `j`. NO uses `x` e `y` a menos que realmente trabajes con coordenadas. Tu yo del futuro te lo agradecerá.

### La Clase Arrays: Tu Navaja Suiza

Java proporciona la clase `java.util.Arrays` con métodos utilities:

```java
import java.util.Arrays;

int[] numeros = {5, 2, 8, 1, 9};

Arrays.sort(numeros);                // {1, 2, 5, 8, 9}
int pos = Arrays.binarySearch(numeros, 5); // 2
int[] copia = Arrays.copyOf(numeros, 3);   // {1, 2, 5}
String texto = Arrays.toString(numeros);   // "[1, 2, 5, 8, 9]"
boolean igual = Arrays.equals(a, b);       // compara dos arrays
Arrays.fill(numeros, 0);                   // todo a ceros
```

> **⚠️ Advertencia:** `array1.equals(array2)` NO compara los elementos. Compara si son el MISMO objeto en memoria. Usa SIEMPRE `Arrays.equals()` para comparar contenido. Tu jefe te lo agradecerá.

### ⭐ BE THE CODE, MY FRIEND: La Búsqueda Binaria

> 🕶️ **Don Tip:** Arrays.binarySearch() requiere el array ORDENADO. Si no, el resultado es impredecible.

```java
import java.util.Arrays;

public class BeTheSort {
    public static void main(String[] args) {
        int[] datos = {42, 17, 8, 99, 3};
        Arrays.sort(datos);

        int indice = Arrays.binarySearch(datos, 42);
        System.out.println(indice);
    }
}
```

> **⭐ BE THE CODE, MY FRIEND**
>
> > 🕶️ **Don Tip:** La búsqueda binaria solo funciona en arrays ordenados. No lo olvides.
>
> **¿Qué imprime?**
> - (A) 0
> - (B) 3
> - (C) 4
> - (D) 99
>
> **Respuesta: (B) 3.** Después de ordenar: {3, 8, 17, 42, 99}. 42 está en el índice 3.

### Arrays y Métodos: Pasando el Testigo

```java
public static void main(String[] args) {
    int[] edades = {10, 20, 30};
    modificar(edades);
    System.out.println(edades[0]); // 99
}

public static void modificar(int[] arr) {
    arr[0] = 99; // Modifica el original porque es la misma referencia
}
```

Esto funciona porque Java pasa la referencia del objeto array por valor. El array no se copia, solo se copia la dirección de memoria donde está.

### ❓ ¡No Hay Preguntas Tontas!

> **❓ ¡No Hay Preguntas Tontas!**
> **Q:** ¿Por qué el primer índice es 0 y no 1? ¡Eso no es natural!
> **A:** Porque en la memoria, el índice es el desplazamiento desde la dirección base del array. El primer elemento está en la dirección base + 0. Java no inventó esto para fastidiarte; viene de las cavernas del lenguaje C.
>
> **Q:** ¿Puedo tener un array de tamaño 0?
> **A:** Sí. `int[] vacio = new int[0];`. No puedes meter nada, pero no da error. Útil cuando no sabes si tendrás datos.
>
> **Q:** ¿Pasa algo si creo un array de objetos pero no los inicializo?
> **A:** Los arrays de objetos se inicializan con `null`. Si intentas llamar a un método en un elemento null, obtienes `NullPointerException`. No es divertido.
>
> **Q:** ¿Cuál es la diferencia entre `null` y "vacío"?
> **A:** Un array vacío (`new int[0]`) existe pero no tiene elementos. Una referencia null significa que no hay ningún array. Es como la diferencia entre un parking vacío y un parking que no se ha construido.
>
> **Q:** ¿Los arrays pueden cambiar de tamaño?
> **A:** No. Son inmutables en tamaño. Si necesitas que crezca, crea uno nuevo y copia los datos con `System.arraycopy()` o `Arrays.copyOf()`.

### ❓ ¡No Hay Preguntas Tontas! (Arrays y Memoria)

> **❓ ¡No Hay Preguntas Tontas!**
> **Q:** ¿Los arrays de primitivos guardan los valores en el heap o en el stack?
> **A:** El objeto array (con todos sus elementos) está en el heap. La variable que lo referencia está en el stack. El array es un objeto, aunque sea de `int`.
>
> **Q:** ¿Se puede cambiar el tamaño de un array después de crearlo?
> **A:** No, los arrays tienen tamaño fijo. Piensa en ellos como plazas de parking ya construidas. Si necesitas más, toca construir (crear) un nuevo parking.
>
> **Q:** ¿Qué pasa si uso `Arrays.sort()` en un array de Strings?
> **A:** Los ordena alfabéticamente (según el orden natural de String, que es lexicográfico). Ojo con mayúsculas: "Zebra" va antes que "abc" porque las mayúsculas tienen menor valor Unicode.

### 🥊 EL RING: Array vs ArrayList

Dos formas de almacenar datos se enfrentan.

**Array:** «Yo soy el original. Rápido, eficiente, directo. Acceso O(1) a cualquier posición. ¡Soy la base de todo!»

**ArrayList:** «Sí, pero tienes tamaño fijo. Una vez que te creas con 10 posiciones, no puedes tener 11. Yo crezco y encogro bajo demanda. Soy flexible.»

**Array:** «Pero yo soy más rápido en acceso y más ligero en memoria. ArrayList usa un array por dentro y añade overhead.»

**ArrayList:** «Cierto, pero mis métodos `add()`, `remove()`, `contains()` me hacen mucho más cómodo. ¿Cuántas líneas de código necesitas para añadir un elemento a un array? Yo una: `lista.add(42)`.»

**Array:** «Para datos primitivos soy más eficiente. `int[]` ocupa menos que `ArrayList<Integer>` por el autoboxing.»

**ArrayList:** «Vale, para tipos primitivos y rendimiento extremo, usa arrays. Para todo lo demás, úsame a mí. ¿Tregua?»

**Array:** «Tregua.»

> 🕶️ **Don Tip:** Regla práctica: ¿sabes cuántos elementos necesitas y no va a cambiar? Usa array. ¿No lo sabes o va a cambiar? Usa ArrayList.

### Resumen Rápido

```java
int[] arr = new int[10];        // Parking para 10 enteros
int[] arr2 = {1, 2, 3};         // Inicialización directa
arr.length;                     // Tamaño (sin paréntesis)
arr[0];                         // Primer elemento
arr[arr.length - 1];            // Último elemento
int[][] mat = new int[3][4];    // Parking de 3 plantas, 4 plazas
Arrays.sort(arr);               // Ordenar
Arrays.toString(arr);           // Imprimir bonito
Arrays.equals(a, b);            // Comparar contenido
Arrays.copyOf(arr, n);          // Copiar los primeros n
Arrays.binarySearch(arr, val);  // Buscar (requiere ordenación)
```

---

## Colecciones: Cuando un Array Se Queda Pequeño

### El Problema: Tu Array se Ha Quedado Sin Plazas

Has creado un array de 10 plazas. Han llegado 11 gatos. ¿Qué haces?

```java
String[] gatos = new String[10]; // 10 plazas, 11 gatos... mal asunto
```

Con un array clásico tendrías que crear uno nuevo, copiar todo, y luego añadir el que falta. Es como aparcar en la calle porque el parking está lleno.

```java
String[] gatosMasGrande = new String[gatos.length + 1];
System.arraycopy(gatos, 0, gatosMasGrande, 0, gatos.length);
gatosMasGrande[gatosMasGrande.length - 1] = "Bigotes Jr.";
gatos = gatosMasGrande; // Ahora apunta al nuevo array
```

Funciona, pero es tedioso. Y si tienes que borrar un elemento en medio, es peor. Necesitas algo que crezca y se encoja solo.

### El Java Collections Framework (JCF)

Para eso está el JCF: una familia de clases e interfaces en `java.util` que manejan grupos de objetos como si fueran de goma.

### ❓ ¡No Hay Preguntas Tontas!

> **❓ ¡No Hay Preguntas Tontas!**
> **Q:** ¿Por qué no usar siempre ArrayList y olvidarme de los arrays?
> **A:** Los arrays son más rápidos y consumen menos memoria. Para un millón de elementos, la diferencia se nota. Úsalos cuando sepas el tamaño de antemano.
>
> **Q:** ¿Qué significa `<String>`?
> **A:** Es un *generic*. Le dice a la colección: "Solo acepto Strings". Si intentas meter un `int`, te casca en compilación, no en ejecución. Es tu red de seguridad.

### ArrayList: El Parking que Crece Solito

ArrayList es como un array, pero con superpoderes: se redimensiona automáticamente cuando te pasas de capacidad.

```java
import java.util.ArrayList;

ArrayList<String> gatos = new ArrayList<>();
gatos.add("Bigotes");      // [Bigotes]
gatos.add("Garfield");     // [Bigotes, Garfield]
gatos.add("Misifú");      // [Bigotes, Garfield, Misifú]
gatos.remove(1);           // [Bigotes, Misifú]  - adiós, Garfield
gatos.get(0);              // "Bigotes"
gatos.size();              // 2 (NO length, es size())
gatos.contains("Misifú");  // true
gatos.indexOf("Bigotes");  // 0
```

> **⚠️ Advertencia:** ArrayList usa `size()`, no `length`. Array usa `length`, no `size()`. String usa `length()`, no `length` ni `size()`. Cada uno tiene su propia forma de preguntar cuánto mide. Es una trampa en el 90% de los exámenes.

### ArrayList NO guarda primitivos

No puedes hacer `ArrayList<int>`. Los genéricos solo funcionan con objetos. Usa las clases wrapper:

```java
ArrayList<Integer> numeros = new ArrayList<>();
numeros.add(42);               // autoboxing: int → Integer
int n = numeros.get(0);        // unboxing: Integer → int
```

Desde Java 5, el autoboxing/unboxing es automático, pero por dentro sigue habiendo objetos Integer.

### ⭐ BE THE CODE, MY FRIEND: El ArrayList Misterioso

> 🕶️ **Don Tip:** ArrayList crece solo. No necesitas definir tamaño, pero cada operación tiene su coste.

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

> **⭐ BE THE CODE, MY FRIEND**
>
> > 🕶️ **Don Tip:** ArrayList usa arrays por dentro. Cuando se llena, crea uno nuevo y copia.
>
> **¿Qué imprime?**
> - (A) 10 20 30
> - (B) 10 15 30
> - (C) 10 15 20 30
> - (D) 10 15
>
> **Respuesta: (B) 10 15 30.** Se añade 15 en índice 1 → {10,15,20,30}. Luego se borra el objeto Integer(20) → {10,15,30}.

### ⭐ BE THE CODE, MY FRIEND: Suma de ArrayList

> 🕶️ **Don Tip:** Recorrer un ArrayList con for-each es más legible que con índices.

```java
import java.util.ArrayList;

public class BeTheSum {
    public static void main(String[] args) {
        ArrayList<Integer> nums = new ArrayList<>();
        for (int i = 1; i <= 5; i++) {
            nums.add(i * 10);
        }
        int total = 0;
        for (int n : nums) {
            if (n % 20 == 0) {
                total += n;
            }
        }
        System.out.println(total);
    }
}
```

> **⭐ BE THE CODE, MY FRIEND**
>
> > 🕶️ **Don Tip:** El for-each es de solo lectura. No puedes modificar la colección mientras la recorres.
>
> **¿Qué imprime?**
> - (A) 30
> - (B) 60
> - (C) 90
> - (D) 150
>
> **Respuesta: (B) 60.** La lista es {10, 20, 30, 40, 50}. Los múltiplos de 20 son 20 y 40. 20 + 40 = 60.

### LinkedList: La Conga Line

LinkedList es una lista enlazada. Cada elemento sabe quién está delante y detrás, como en una conga. Es lenta si buscas por índice, pero rapidísima para añadir/borrar al principio o al final.

```java
import java.util.LinkedList;

LinkedList<String> cola = new LinkedList<>();
cola.addLast("Persona 1");   // al final
cola.addLast("Persona 2");
cola.addFirst("Colado");     // se cuela al principio
String primero = cola.removeFirst(); // "Colado" - se va
```

> **💡 Consejo:** Usa `LinkedList` cuando necesites una cola (FIFO) o una pila (LIFO). Para acceso aleatorio frecuente, usa `ArrayList`. LinkedList busca elemento por elemento. ArrayList va directo al índice.

### HashSet: El Portero que No Deja Duplicados

HashSet es como una discoteca: no deja entrar a nadie que ya esté dentro. No importa el orden, solo la exclusividad.

```java
import java.util.HashSet;

HashSet<String> invitados = new HashSet<>();
invitados.add("Ana");
invitados.add("Bob");
invitados.add("Ana"); // No pasa nada, Ana ya está
System.out.println(invitados.size()); // 2, no 3
```

¿Cómo sabe si un elemento ya está? Usa `hashCode()` y `equals()`. Si tu objeto no los sobreescribe bien, HashSet hará cosas raras.

> **⚠️ Advertencia:** Si sobreescribes `equals()` en una clase, SOBREESCRIBE `hashCode()`. Siempre. Si dos objetos son iguales según `equals()`, deben tener el mismo `hashCode()`. Si no, HashSet se volverá loco. Repito: **siempre**.

### Operaciones Típicas con HashSet

```java
HashSet<String> set = new HashSet<>();
set.add("rojo");
set.add("verde");
set.add("azul");
set.remove("rojo");
set.contains("verde");   // true
set.isEmpty();          // false
set.clear();            // lo vacía todo
```

### TreeSet: El Organizado

TreeSet es como un HashSet que se ordena solo. Internamente usa un árbol rojo-negro. Todo lo que metas se ordena automáticamente.

```java
import java.util.TreeSet;

TreeSet<String> ordenado = new TreeSet<>();
ordenado.add("Zara");
ordenado.add("Ana");
ordenado.add("Bob");
System.out.println(ordenado); // [Ana, Bob, Zara] - orden alfabético

// Métodos extra útiles
ordenado.first();  // "Ana"
ordenado.last();   // "Zara"
ordenado.headSet("Bob"); // [Ana] - elementos antes de Bob
```

> **💡 Consejo:** Necesitas elementos ordenados automáticamente? Usa TreeSet. Solo necesitas eliminar duplicados? Usa HashSet (es más rápido: O(1) vs O(log n)).

### Iterator: El Camarero que Toma Nota Uno a Uno

Iterator recorre una colección sin que te importe cómo está implementada por dentro. Es como un camarero: "¿Qué quiere? ¿Y usted? ¿Y usted?"

```java
import java.util.Iterator;

ArrayList<String> platos = new ArrayList<>();
platos.add("Tortilla");
platos.add("Paella");
platos.add("Croquetas");

Iterator<String> it = platos.iterator();
while (it.hasNext()) {
    String plato = it.next();
    if (plato.equals("Paella")) {
        it.remove(); // BORRA de la lista ORIGINAL
    }
}
// Ahora platos = [Tortilla, Croquetas]
```

> **⚠️ Advertencia:** Nunca hagas `lista.remove(elemento)` mientras usas un for-each. Lanzarás `ConcurrentModificationException`. Usa SIEMPRE `iterator.remove()` si necesitas borrar durante el recorrido.

### Collections: El Amigo Utilitario

Igual que `Arrays` para arrays, `Collections` es el amigo de las colecciones:

```java
import java.util.Collections;

ArrayList<String> lista = new ArrayList<>();
lista.add("Zara");
lista.add("Ana");
lista.add("Bob");

Collections.sort(lista);        // [Ana, Bob, Zara]
Collections.reverse(lista);     // [Zara, Bob, Ana]
Collections.shuffle(lista);     // orden aleatorio
Collections.max(lista);         // "Zara" (orden alfabético)
Collections.min(lista);         // "Ana"
Collections.frequency(lista, "Ana"); // 1
Collections.replaceAll(lista, "Ana", "Ana María");
Collections.rotate(lista, 2);   // rota 2 posiciones
```

### ⭐ BE THE CODE, MY FRIEND: Collections en Acción

> 🕶️ **Don Tip:** Collections.sort() ordena la lista original. Si no quieres modificarla, cópiala antes.

```java
import java.util.*;

public class BeTheCollections {
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

> **⭐ BE THE CODE, MY FRIEND**
>
> > 🕶️ **Don Tip:** Los métodos estáticos de Collections son muy potentes. sort, shuffle, reverse, binarySearch...
>
> **¿Qué imprime?**
> - (A) 1
> - (B) 3
> - (C) 5
> - (D) 8
>
> **Respuesta: (C) 5.** Sort → {1,3,5,8}. Reverse → {8,5,3,1}. get(1) = 5.

### ❓ ¡No Hay Preguntas Tontas! (Colecciones)

> **❓ ¡No Hay Preguntas Tontas!**
> **Q:** ¿Cuándo uso ArrayList y cuándo LinkedList?
> **A:** Usa ArrayList para el 95% de los casos. LinkedList solo cuando necesites añadir/borrar mucho al principio o estés implementando una cola/pila. ArrayList es más simple y más rápido en acceso aleatorio.
>
> **Q:** HashSet vs TreeSet?
> **A:** HashSet es más rápido (O(1) vs O(log n)), pero no ordena. TreeSet ordena automáticamente pero es más lento. Si no necesitas orden, usa HashSet. Punto.
>
> **Q:** ¿Se pueden mezclar tipos en una colección sin genéricos?
> **A:** Sí, pero es como lanzar un dado. Si pones `ArrayList lista = new ArrayList();` (sin <>) puedes meter cualquier cosa, pero al sacarlo tienes que hacer casting y cruzar los dedos. Con genéricos, el compilador te protege.
>
> **Q:** ¿Qué pasa si añado un null a un HashSet?
> **A:** HashSet admite un único null. TreeSet no admite null porque necesita comparar elementos para ordenar y... ¿cómo comparas null con algo?
>
> **Q:** ¿Qué es más rápido, for-each o iterator?
> **A:** Internamente son casi lo mismo. El for-each usa iterator por debajo. Usa el que te resulte más legible.

### Resumen Rápido: Colecciones

```java
ArrayList<String> a = new ArrayList<>();       // Lista dinámica
LinkedList<String> l = new LinkedList<>();     // Lista doblemente enlazada
HashSet<String> s = new HashSet<>();           // Sin duplicados, sin orden
TreeSet<String> t = new TreeSet<>();           // Sin duplicados, ordenado

a.add(e);         // añadir
a.get(i);         // obtener por índice
a.remove(i);      // borrar por índice
a.remove(e);      // borrar objeto
a.size();         // tamaño
a.contains(e);    // contiene?
a.isEmpty();      // está vacío?

Collections.sort(lista);
Collections.reverse(lista);
Collections.shuffle(lista);
Collections.min(lista);
Collections.max(lista);
```

---

## Ejercicios Propuestos

### Ejercicio 1: El Inverso
Escribe un programa que cree un array de 10 enteros, los rellene con números del 1 al 10, y luego los imprima en orden inverso.

### Ejercicio 2: Buscaminas Simplificado
Crea un array bidimensional de 5x5 que represente un campo de minas. Rellénalo con 5 minas (representadas como `true`) en posiciones aleatorias. El usuario introduce coordenadas (fila, columna) y el programa dice si hay mina o no. Si acierta una mina, el juego termina.

### Ejercicio 3: Estadísticas de Clase
Pide al usuario las notas de 20 alumnos, guárdalas en un array, y calcula:
- La nota media
- La nota más alta
- La nota más baja
- Cuántos alumnos aprobaron (nota >= 5)

### Ejercicio 4: Eliminar Duplicados
Escribe un programa que lea una lista de palabras desde teclado (termina con "FIN") y las muestre sin duplicados, en el mismo orden en que aparecieron la primera vez. Pista: usa un `LinkedHashSet` para mantener el orden de inserción.

### Ejercicio 5: Lista de la Compra
Crea un programa que gestione una lista de la compra usando `ArrayList<String>`. Debe permitir: añadir, eliminar, marcar como comprado y mostrar la lista.

---

**RAs trabajados en esta unidad:**
- **RA6** - Tipos avanzados: Arrays y colecciones

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
