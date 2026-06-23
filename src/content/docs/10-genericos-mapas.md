---
title: "🗺️ Unidad 9: Genéricos y Mapas"
nav_order: 9
---
🎯 **Objetivos de aprendizaje**
- Comprender el concepto de genéricos y type erasure
- Crear clases y métodos genéricos propios
- Usar wildcards (? extends, ? super) para flexibilidad
- Manejar mapas (HashMap, TreeMap) y sus operaciones principales
- Elegir entre Map, List y Set según el problema

## Genéricos: El `<T>` Que Lo Cambió Todo

> Antes de los genéricos, programar Java era como hacer malabares con cuchillos... vendados. Con genéricos, el compilador es tu red de seguridad.

### ¡Menudo Lío Antes De Los Genéricos!

Imagina que tienes una `ArrayList` a la antigua usanza, sin genéricos. Es como una caja donde puedes meter cualquier cosa: un zapato, una manzana, un gato, un número de la suerte. El problema es que cuando _sacas_ las cosas, Java te devuelve un `Object` y tú tienes que recordar qué metiste. ¿Y si metiste un `Integer` pero lo tratas como `String`? **BOOM**. `ClassCastException` en toda la cara.

```java
import java.util.*;

public class InfiernoSinGenericos {
    public static void main(String[] args) {
        ArrayList cajaDeCaos = new ArrayList();
        cajaDeCaos.add(42);
        cajaDeCaos.add("Hola");
        cajaDeCaos.add(3.14);

        // Todo lo que sacas es Object... ¡tú adivina qué es!
        Object cosa = cajaDeCaos.get(0);
        String texto = (String) cosa;  // 💥 ClassCastException en tiempo de ejecución
    }
}
```

¿Ves? El compilador no te avisó de nada. Te enteras cuando el programa ya está corriendo y explota. Como una granada con el seguro quitado.

> **⚠️ Advertencia:** Sin genéricos, los errores de tipo saltan en tiempo de EJECUCIÓN (cuando el usuario está usando tu programa). Con genéricos, saltan en tiempo de COMPILACIÓN (cuando tú estás programando). ¿Cuándo prefieres que te enteres?

### Llegan Los Genéricos: El Compilador Se Vuelve Tu Amigo

A partir de Java 5, los genéricos cambiaron las reglas del juego. Una `ArrayList<String>` ya no es una caja de caos: es una máquina expendedora que SOLO da Coca-Colas. No puedes meter un zapato, y si lo intentas, el compilador te para el brazo.

```java
import java.util.*;

public class CieloConGenericos {
    public static void main(String[] args) {
        ArrayList<String> maquinaDeCocacolas = new ArrayList<>();
        maquinaDeCocacolas.add("Coca-Cola");
        maquinaDeCocacolas.add("Coca-Cola Light");
        // maquinaDeCocacolas.add(42);  // 🚫 Error de compilación

        // Al sacar, ya sabes que es String. Sin casting.
        String bebida = maquinaDeCocacolas.get(0);
        System.out.println(bebida.toUpperCase());  // "COCA-COLA" sin miedo
    }
}
```

> **💡 Consejo:** Los genéricos existen para una sola razón: **seguridad de tipos**. Comprueban en compilación que no estés metiendo la pata con los tipos, eliminando la necesidad de castings y los temidos `ClassCastException`.

### ⭐ BE THE CODE, MY FRIEND: Eres Una ArrayList<T>

> 🕶️ **Don Tip:** Los genéricos aseguran que solo metas el tipo correcto. Sin ellos, tendrías casting a punta pala.

> **⭐ BE THE CODE, MY FRIEND**
> 🕶️ **Don Tip:** `ArrayList<String>` solo acepta Strings. Si intentas meter un `int`, el compilador te para.
> Cierra los ojos. Respira hondo. Ahora ERES una `ArrayList<T>`.
>
> Dentro de ti hay una `Object[]` que almacena tus elementos. Cuando alguien hace `add("Hola")`, el compilador ya sabe que solo aceptas Strings. Cuando alguien hace `get(0)`, el compilador sabe que devuelves un String, no un Object.
>
> Eres como un portero de discoteca que solo deja pasar a gente con el tipo adecuado. Sin genéricos, dejabas pasar a cualquiera y luego liabas. Con genéricos, eres selectivo, y la fiesta es mucho mejor.

### Tu Propia Clase Genérica: `Caja<T>`

No solo las colecciones pueden ser genéricas. ¡Tú también puedes crear tus propias clases genéricas! El truco está en el parámetro de tipo `<T>` (de "Type"), aunque puedes usar cualquier letra:

- `T` → Tipo (Type) — el comodín general
- `E` → Elemento (Element) — para colecciones
- `K` / `V` → Clave / Valor (Key / Value) — para mapas
- `N` → Número (Number)

```java
// Una caja que guarda UN objeto de cualquier tipo
public class Caja<T> {
    private T contenido;

    public void guardar(T contenido) {
        this.contenido = contenido;
    }

    public T sacar() {
        return contenido;
    }

    public boolean estaVacia() {
        return contenido == null;
    }
}
```

Y así se usa:

```java
Caja<String> cajaDeTexto = new Caja<>();
cajaDeTexto.guardar("Mensaje secreto");
String mensaje = cajaDeTexto.sacar();  // Sin casting, directo al pelo

Caja<Integer> cajaDeNumeros = new Caja<>();
cajaDeNumeros.guardar(42);
Integer numero = cajaDeNumeros.sacar();
```

> **⚠️ Advertencia:** No puedes usar tipos primitivos como parámetro de tipo. `Caja<int>` no compila. Usa `Caja<Integer>`, con su clase envolvente (wrapper). El autoboxing de Java se encarga del resto.

### ⭐ BE THE CODE, MY FRIEND: La Caja Genérica

> 🕶️ **Don Tip:** El tipo `T` es un comodín. Cuando instancies, se reemplaza por el tipo real.

```java
public class BeTheCaja {
    public static void main(String[] args) {
        Caja<Integer> caja = new Caja<>();
        caja.guardar(5);
        caja.guardar(10);
        System.out.println(caja.sacar());
    }
}
```

> **⭐ BE THE CODE, MY FRIEND**
> 🕶️ **Don Tip:** `T` puede ser cualquier tipo. Pero no un primitivo: usa `Integer` en vez de `int`.
> **¿Qué imprime?**
> - (A) 5
> - (B) 10
> - (C) null
> - (D) Error de compilación
>
> **Respuesta: (B) 10.** La caja solo guarda un elemento, el segundo `guardar(10)` sobrescribe el 5.

### El Operador Diamante `<>`: El Perezoso Oficial

Desde Java 7, no hace falta repetir el tipo dos veces. El compilador lo infiere por ti:

```java
// Antes de Java 7 (repetitivo):
Caja<String> caja1 = new Caja<String>();

// Desde Java 7 (el diamante <> al rescate):
Caja<String> caja2 = new Caja<>();
```

El `<>` es como el "etcétera" de los genéricos: "ya sabes de qué tipo estoy hablando, ¿no? Pues eso".

> **💡 Consejo:** Usa siempre el operador diamante `<>`. Tu código queda más limpio, más legible y tus compañeros de equipo te lo agradecerán.

### Type Erasure: El Mago Se Lleva los Genéricos

Aquí va el truco: los genéricos SOLO existen en tiempo de compilación. Cuando tu código se convierte en bytecode, el compilador borra toda la información de tipos genéricos. Es como si un mago hiciera desaparecer los `<String>` y `<Integer>`.

```java
// En tu código fuente:
ArrayList<String> nombres = new ArrayList<>();
ArrayList<Integer> numeros = new ArrayList<>();

// Después de compilar (en bytecode):
ArrayList nombres = new ArrayList();  // ambos son ArrayList simples
ArrayList numeros = new ArrayList();
```

A esto se le llama **type erasure**. El compilador:
1. **Verifica** que los tipos sean correctos (aquí no cuela un Integer en una lista de Strings)
2. **Borra** la información genérica
3. **Añade** los castings necesarios donde haga falta

Es como un portero que revisa tu DNI en la puerta, pero una vez dentro, tú no llevas ninguna identificación.

### Métodos Genéricos: Funciones Para Todo Tipo

No solo las clases pueden ser genéricas. Los métodos también pueden declarar sus propios parámetros de tipo, independientemente de la clase donde estén.

```java
public class Utilidades {

    // Método genérico: declara <T> antes del tipo de retorno
    public static <T> void imprimir(T elemento) {
        System.out.println("Elemento: " + elemento.toString());
    }

    // Método genérico con dos parámetros de tipo
    public static <T, U> boolean sonIguales(T a, U b) {
        return a.equals(b);
    }

    // Invertir un array genérico
    public static <T> T[] invertir(T[] array) {
        for (int i = 0; i < array.length / 2; i++) {
            T temp = array[i];
            array[i] = array[array.length - 1 - i];
            array[array.length - 1 - i] = temp;
        }
        return array;
    }
}

// Uso:
Utilidades.imprimir(42);           // El compilador infiere que T es Integer
Utilidades.imprimir("Hola");       // El compilador infiere que T es String
String[] invertido = Utilidades.invertir(new String[]{"A", "B", "C"});
```

### ⭐ BE THE CODE, MY FRIEND: Método Genérico

> 🕶️ **Don Tip:** El `<T>` antes del `void` declara el tipo del método. Sin eso, el compilador no sabe qué es `T`.

```java
public class BeTheGenericMethod {
    public static void main(String[] args) {
        String resultado = Utilidades.<String>obtenerValor("Hola");
        // ¿Qué hace este código? ¿Compila?
    }
}
```

> **⭐ BE THE CODE, MY FRIEND**
> 🕶️ **Don Tip:** Los métodos genéricos deducen el tipo automáticamente de los argumentos.
> **¿Compila y qué imprime?**
> - (A) Sí, imprime "Hola"
> - (B) No compila, el método no existe
> - (C) Sí, pero imprime null
> - (D) No compila, la sintaxis es incorrecta
>
> **Respuesta: (A) Sí, imprime "Hola".** La sintaxis `Clase.<Tipo>metodo()` es válida para invocar métodos genéricos especificando el tipo explícitamente, aunque normalmente el compilador lo infiere solo.

### ❓ ¡No Hay Preguntas Tontas! (Genéricos)

> **❓ ¡No Hay Preguntas Tontas!**
> **Q:** ¿Por qué no puedo hacer `new T()` dentro de un método genérico?
> **A:** Porque en tiempo de compilación, Java no sabe qué es `T`. No puede crear una instancia de algo que no conoce. Es como pedirle a un pastelero que haga "un pastel" pero sin decirle de qué.
>
> **Q:** ¿Y `new T[]`?
> **A:** Tampoco. Los arrays conocen su tipo en tiempo de ejecución, pero los genéricos se borran (type erasure). Por eso internamente se usa `Object[]` y se castea.
>
> **Q:** ¿Los genéricos ralentizan mi programa?
> **A:** No. Java aplica **type erasure**: el compilador borra toda la información genérica y la convierte a castings normales. Es solo azúcar sintáctico en compilación. En runtime, no hay genéricos.

### ❓ ¡No Hay Preguntas Tontas! (Más Genéricos)

> **❓ ¡No Hay Preguntas Tontas!**
> **Q:** ¿Qué significa `<?>` en los genéricos?
> **A:** Es un wildcard sin restricciones. Significa "cualquier tipo". Es como decir "me da igual el tipo, solo quiero trabajar con la colección". Pero ojo: no puedes añadir elementos (excepto null) porque el compilador no sabe de qué tipo es.
>
> **Q:** ¿Puedo tener un método genérico estático en una clase no genérica?
> **A:** Sí, totalmente. De hecho, es muy común. La clase `Collections` está llena de métodos estáticos genéricos como `sort()`, `reverse()`, etc.
>
> **Q:** ¿Qué es el "type erasure"?
> **A:** Es el proceso por el cual el compilador borra toda la información de tipos genéricos después de comprobar que todo es correcto. En el bytecode, `ArrayList<String>` y `ArrayList<Integer>` son ambos `ArrayList`. Es como si el compilador fuera un abogado que revisa el contrato, y luego un mago que hace desaparecer las pruebas.

### Wildcards: `? extends T` vs `? super T`

Los comodines (wildcards) son para cuando quieres escribir métodos que funcionen con **cualquier tipo** dentro de una jerarquía.

```java
import java.util.*;

public class Wildcards {

    // ? extends T → Covarianza (solo LEER, no escribir)
    // Puedes pasar List<Integer>, List<Double>, List<Number>...
    public static double sumar(ArrayList<? extends Number> numeros) {
        double total = 0.0;
        for (Number n : numeros) {
            total += n.doubleValue();
        }
        // numeros.add(42);  // 🚫 Error: no puedes añadir nada (excepto null)
        return total;
    }

    // ? super T → Contravarianza (solo ESCRIBIR, leer como Object)
    // Puedes añadir Integers a una lista de Integer, Number, Object...
    public static void rellenar(ArrayList<? super Integer> lista) {
        lista.add(1);
        lista.add(2);
        lista.add(3);
        // Integer n = lista.get(0);  // 🚫 Error: solo sabes que es Object
        Object obj = lista.get(0);    // ✅ Ok
    }
}

// Uso:
ArrayList<Integer> enteros = new ArrayList<>(Arrays.asList(1, 2, 3));
ArrayList<Number> numeros = new ArrayList<>();
ArrayList<Object> objetos = new ArrayList<>();

sumar(enteros);    // ✅ ? extends Number funciona con Integer
rellenar(numeros);  // ✅ ? super Integer funciona con Number
rellenar(objetos);  // ✅ ? super Integer funciona con Object
```

> **⚠️ Advertencia:** Mnemotecnia infalible:
> - `? extends T` → **P**roducer **E**xtends (solo produces/lees datos)
> - `? super T` → **C**onsumer **S**uper (solo consumes/escribes datos)
>
> El principio PECS de Joshua Bloch: "Producer Extends, Consumer Super".

### ⭐ BE THE CODE, MY FRIEND: Wildcards

> 🕶️ **Don Tip:** `?` significa 'cualquier tipo'. `? extends Number` limita a Number y sus subclases.

```java
import java.util.*;

public class BeTheWildcard {
    public static void main(String[] args) {
        List<Integer> enteros = Arrays.asList(1, 2, 3);
        List<Double> dobles = Arrays.asList(1.5, 2.5, 3.5);
        // printNumbers(enteros);  // ¿compila?
        // printNumbers(dobles);   // ¿compila?
    }

    public static void printNumbers(List<? extends Number> lista) {
        for (Number n : lista) {
            System.out.print(n + " ");
        }
    }
}
```

> **⭐ BE THE CODE, MY FRIEND**
> 🕶️ **Don Tip:** Los wildcards son de solo lectura. No puedes añadir elementos a una `List<?>` porque no sabes de qué tipo es.
> **¿Cuántas llamadas compilan?**
> - (A) 0
> - (B) 1
> - (C) 2
> - (D) Error en ambos
>
> **Respuesta: (C) 2.** `List<? extends Number>` acepta cualquier lista cuyo tipo herede de Number, tanto `List<Integer>` como `List<Double>`.

### Resumen Rápido: Genéricos

```java
ArrayList<Tipo>     ← Solo acepta ese Tipo y subclases
Caja<T>             ← Tu propia clase genérica
new Caja<>()        ← El diamante: infiere el tipo
<T> void metodo(T)  ← Método genérico
? extends T         ← Wildcard de lectura (producer)
? super T           ← Wildcard de escritura (consumer)
```

---

## Mapas: La Guía Telefónica

### HashMap: La Guía Telefónica

HashMap asocia claves con valores. Como una agenda: buscas por nombre (clave) y obtienes el teléfono (valor).

```java
import java.util.HashMap;

HashMap<String, Integer> agenda = new HashMap<>();
agenda.put("Ana", 612345678);
agenda.put("Bob", 698765432);
agenda.put("Ana", 600000000); // Sobrescribe el anterior

int telefono = agenda.get("Ana");       // 600000000
int inexistente = agenda.get("NoExisto"); // null
agenda.containsKey("Bob");   // true
agenda.containsValue(600000000); // true
```

> **📝 Nota:** Las claves de un HashMap deben ser inmutables. Por eso String e Integer son perfectos. Si usas un objeto mutable como clave y luego lo modificas, el HashMap no lo encontrará más. Es como cambiar la cerradura y esperar que la llave vieja siga funcionando.

### Recorrer un HashMap

```java
HashMap<String, Integer> agenda = new HashMap<>();
agenda.put("Ana", 612345678);
agenda.put("Bob", 698765432);

for (String nombre : agenda.keySet()) {
    System.out.println(nombre + " → " + agenda.get(nombre));
}

for (Integer telefono : agenda.values()) {
    System.out.println("Tel: " + telefono);
}

for (HashMap.Entry<String, Integer> entrada : agenda.entrySet()) {
    System.out.println(entrada.getKey() + " → " + entrada.getValue());
}
```

### ⭐ BE THE CODE, MY FRIEND: El HashMap Traicionero

> 🕶️ **Don Tip:** HashMap no garantiza orden. Si necesitas orden, usa TreeMap o LinkedHashMap.

```java
import java.util.HashMap;

public class BeTheMap {
    public static void main(String[] args) {
        HashMap<String, String> capitales = new HashMap<>();
        capitales.put("España", "Madrid");
        capitales.put("Francia", "París");
        capitales.put("Italia", "Roma");
        capitales.put("España", "Barcelona");

        System.out.println(capitales.get("España"));
    }
}
```

> **⭐ BE THE CODE, MY FRIEND**
> 🕶️ **Don Tip:** Las claves de un HashMap deben tener `hashCode()` y `equals()` bien implementados.
> **¿Qué imprime?**
> - (A) Madrid
> - (B) Barcelona
> - (C) null
> - (D) Error
>
> **Respuesta: (B) Barcelona.** La clave "España" se sobrescribe con el nuevo valor. Madrid ha sido reemplazado.

### ⭐ BE THE CODE, MY FRIEND: Frecuencia de Letras

> 🕶️ **Don Tip:** `getOrDefault()` evita el null check. Úsalo siempre que puedas.

```java
import java.util.HashMap;

public class BeTheFrequency {
    public static void main(String[] args) {
        String texto = "banana";
        HashMap<Character, Integer> frec = new HashMap<>();
        for (char c : texto.toCharArray()) {
            frec.put(c, frec.getOrDefault(c, 0) + 1);
        }
        System.out.println(frec.get('a') + " " + frec.get('n'));
    }
}
```

> **⭐ BE THE CODE, MY FRIEND**
> 🕶️ **Don Tip:** `merge()` es tu amigo para frecuencias. Combina valor existente con nuevo.
> **¿Qué imprime?**
> - (A) 1 1
> - (B) 3 1
> - (C) 3 2
> - (D) 2 2
>
> **Respuesta: (B) 3 1.** En "banana": la 'a' aparece 3 veces, la 'n' aparece 1 vez. getOrDefault es el héroe que evita los NullPointerException.

### TreeMap: El Ordenado

TreeMap es un HashMap ordenado por clave. Internamente usa un árbol rojo-negro.

```java
import java.util.TreeMap;

TreeMap<String, Integer> ordenado = new TreeMap<>();
ordenado.put("Zara", 30);
ordenado.put("Ana", 25);
ordenado.put("Bob", 35);
System.out.println(ordenado); // {Ana=25, Bob=35, Zara=30} - orden alfabético

// Métodos extra útiles
ordenado.firstKey();   // "Ana"
ordenado.lastKey();    // "Zara"
ordenado.headMap("Bob"); // {Ana=25} - entradas antes de Bob
```

> **💡 Consejo:** HashMap para velocidad (O(1)). TreeMap para orden (O(log n)). Si preguntas en una entrevista "¿cuál es mejor?", la respuesta correcta es "depende".

### ❓ ¡No Hay Preguntas Tontas! (Mapas)

> **❓ ¡No Hay Preguntas Tontas!**
> **Q:** ¿Puedo tener un HashMap con clave null?
> **A:** HashMap admite una clave null. TreeMap no. HashMap guarda la clave null en una posición especial.
>
> **Q:** ¿Qué pasa si la clave no existe en el mapa?
> **A:** `get()` devuelve `null`. Úsalo con cuidado o mejor usa `getOrDefault(clave, valorPorDefecto)`.
>
> **Q:** ¿HashMap o TreeMap?
> **A:** HashMap para velocidad. TreeMap para orden.
>
> **Q:** ¿Qué ventaja tiene un `LinkedHashMap`?
> **A:** Mantiene el orden de inserción. Es como un HashMap que recuerda en qué orden metiste las cosas.

### Comparación: Map vs List vs Set

| Característica | List | Set | Map |
|---|---|---|---|
| ¿Qué guarda? | Elementos ordenados | Elementos únicos | Pares clave→valor |
| ¿Duplicados? | Sí | No | Claves no, valores sí |
| ¿Orden? | De inserción | Depende (Hash/Tree) | Depende (Hash/Tree) |
| Acceso | Por índice | Por elemento | Por clave |
| ¿Nulls? | Sí | HashSet: 1, TreeSet: 0 | HashMap: 1 clave, TreeMap: 0 |
| Principal impl. | ArrayList | HashSet | HashMap |

**Regla práctica:**
- Necesitas una lista de cosas? → `ArrayList`
- Cosas sin repetir? → `HashSet`
- Cosas ordenadas sin repetir? → `TreeSet`
- Asociar una cosa con otra? → `HashMap`

### 🥊 EL RING: HashMap vs TreeMap

Dos implementaciones de Map se enfrentan.

**HashMap:** «Yo soy el rey de la velocidad. O(1) en get y put. No me importa el orden, me importa la rapidez.»

**TreeMap:** «Sí, pero yo mantengo las claves ordenadas automáticamente. Si necesitas recorrerlas en orden alfabético, soy tu único amigo.»

**HashMap:** «¿Ordenado? Eso cuesta. Soy O(log n) en tus operaciones. Yo soy O(1). ¡Soy imbatible en rendimiento!»

**TreeMap:** «Cierto, pero puedo navegar: `firstKey()`, `lastKey()`, `subMap()`, `headMap()`. Tú para todo eso tienes que copiar y ordenar.»

**HashMap:** «Si no necesitas orden, ¿para qué pagar el coste? La mayoría de los casos usan HashMap.»

**TreeMap:** «Y cuando necesitan orden, ahí estoy yo. Y no soy tan lento: O(log n) sigue siendo muy rápido para la mayoría de casos.»

**HashMap:** «Tregua. Cada uno en su sitio.»

**TreeMap:** «Hecho.»

> 🕶️ **Don Tip:** ¿Velocidad? HashMap. ¿Orden? TreeMap. ¿Orden de inserción? LinkedHashMap. Cada uno tiene su superpoder.

### Resumen Rápido: Mapas

```java
HashMap<K, V> m = new HashMap<>();             // Clave → Valor, rápido
TreeMap<K, V> tm = new TreeMap<>();            // Clave → Valor, ordenado

m.put(clave, valor);  // añadir o sobrescribir
m.get(clave);         // obtener (null si no existe)
m.getOrDefault(c, d); // obtener o valor por defecto
m.containsKey(c);     // existe la clave?
m.containsValue(v);   // existe el valor?
m.remove(clave);      // borrar entrada
m.size();             // número de entradas
m.keySet();           // conjunto de claves
m.values();           // colección de valores
m.entrySet();         // conjunto de entradas
```

---

## Ejercicios Propuestos

### Ejercicio 1: Contactos de Toda la Vida
Implementa una mini agenda usando `HashMap<String, String>` que asocie nombre con teléfono. El programa debe permitir añadir contactos, buscar por nombre, listar todos y borrar. Usa un menú.

### Ejercicio 2: Crea una clase `Pareja<T, U>`
Almacena dos objetos de tipos posiblemente distintos. Incluye métodos `getPrimero()`, `getSegundo()`, `setPrimero(T)`, `setSegundo(U)` y un método `intercambiar()` que devuelva una nueva `Pareja<U, T>` con los valores intercambiados.

### Ejercicio 3: Contador de Palabras
Escribe un programa que lea un texto y cuente cuántas veces aparece cada palabra usando un `HashMap<String, Integer>`.

### Ejercicio 4: Método Genérico `maximo`
Implementa un método genérico `public static <T extends Comparable<T>> T maximo(T[] array)` que devuelva el elemento más grande de un array.

---

**RAs trabajados en esta unidad:**
- **RA6** - Tipos avanzados: Genéricos y mapas

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
