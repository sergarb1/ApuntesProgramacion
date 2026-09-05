---
title: "🗺️ Unitat 11: Genèrics i Mapes"
nav_order: 11
---
> 🗺️ **El mapa del paquet:** 🚪 Benvinguda → ☕ U01 → 🔤 U02 → 🔀 U03 → 🅿️ U04 → 🧩 U05 → ⚡ U06 → 🏗️ U07 → 🔒 U08 → 🧬 U09 → 📚 U10 → **🗺️ ACÍ ETS (U11)** → 📁 U12 → 🗄️ U13 → 🌐 U14

🎯 **Objectius d'aprenentatge**
- Comprendre el concepte de genèrics i type erasure
- Crear classes i mètodes genèrics propis
- Usar wildcards (? extends, ? super) per a flexibilitat
- Gestionar mapes (HashMap, TreeMap) i les seues operacions principals
- Triar entre Map, List i Set segons el problema

## Genèrics: El `<T>` Que Ho Va Canviar Tot

> Abans dels genèrics, programar Java era com fer malabars amb ganivets... embenats. Amb genèrics, el compilador és la teua xarxa de seguretat.

### Quin Embolic Abans Dels Genèrics!

Imagina que tens una `ArrayList` a la manera antiga, sense genèrics. Es com una capsa on pots ficar qualsevol cosa: una sabata, una poma, un gat, un número de la sort. El problema és que quan _tires_ les coses, Java et torna un `Object` i tu has de recordar què vas ficar. I si vas ficar un `Integer` però el tractes com `String`? **BOOM**. `ClassCastException` a tota la cara.

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

Ho veus? El compilador no t'avisà de res. Te n'assabentes quan el programa ja està corrent i explota. Com una granada amb el segur llevat.

> **⚠️ Advertència:** Sense genèrics, els errors de tipus salten en temps d'EXECUCIÓ (quan l'usuari està usant el teu programa). Amb genèrics, salten en temps de COMPILACIÓ (quan tu estàs programant). Quan prefereixes assabentar-te'n?

### Arriben Els Genèrics: El Compilador Es Torna El Teu Amic

A partir de Java 5, els genèrics van canviar les regles del joc. Una `ArrayList<String>` ja no és una capsa de caos: és una màquina expenedora que SOLS dona Coca-Coles. No pots ficar una sabata, i si ho intentes, el compilador et para el braç.

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

> **💡 Consell:** Els genèrics existeixen per una sola raó: **seguretat de tipus**. Comproven en compilació que no estigues ficant la pota amb els tipus, eliminant la necessitat de castings i els temuts `ClassCastException`.

### ⭐ BE THE CODE, MY FRIEND: Ets Una ArrayList\<T\>

> 🕶️ **Don Tip:** Els genèrics asseguren que només fiques el tipus correcte. Sense ells, tindries càsting a punta pala.

> **⭐ BE THE CODE, MY FRIEND**
> 🕶️ **Don Tip:** `ArrayList<String>` sols accepta Strings. Si intentes ficar un `int`, el compilador et para.
> Tanca els ulls. Respira profund. Ara ERES una `ArrayList<T>`.
>
> Dins de tu hi ha una `Object[]` que emmagatzema els teus elements. Quan algú fa `add("Hola")`, el compilador ja sap que només acceptes Strings. Quan algú fa `get(0)`, el compilador sap que tornes un String, no un Object.
>
> Eres com un porter de discoteca que només deixa passar a gent amb el tipus adequat. Sense genèrics, deixaves passar a qualsevol i després la líes. Amb genèrics, eres selectiu, i la festa és molt millor.

### La Teua Pròpia Classe Genèrica: `Caja<T>`

No només les col·leccions poden ser genèriques. Tu també pots crear les teues pròpies classes genèriques! El truc està en el paràmetre de tipus `<T>` (de "Type"), encara que pots usar qualsevol lletra:

- `T` → Tipus (Type) — el comodí general
- `E` → Element (Element) — per a col·leccions
- `K` / `V` → Clau / Valor (Key / Value) — per a mapes
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

I així s'usa:

```java
Caja<String> cajaDeTexto = new Caja<>();
cajaDeTexto.guardar("Mensaje secreto");
String mensaje = cajaDeTexto.sacar();  // Sin casting, directo al pelo

Caja<Integer> cajaDeNumeros = new Caja<>();
cajaDeNumeros.guardar(42);
Integer numero = cajaDeNumeros.sacar();
```

> **⚠️ Advertència:** No pots usar tipus primitius com a paràmetre de tipus. `Caja<int>` no compila. Usa `Caja<Integer>`, amb la seua classe envolvent (wrapper). L'autoboxing de Java s'encarrega de la resta.

### ⭐ BE THE CODE, MY FRIEND: La Capsa Genèrica

> 🕶️ **Don Tip:** El tipus `T` és un comodí. Quan instanciïs, es reemplaça pel tipus real.

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
> 🕶️ **Don Tip:** `T` pot ser qualsevol tipus. Però no un primitiu: usa `Integer` en lloc de `int`.
> **Què imprimeix?**
> - (A) 5
> - (B) 10
> - (C) null
> - (D) Error de compilació
>
> **Resposta: (B) 10.** La capsa només guarda un element, el segon `guardar(10)` sobreescriu el 5.

### L'Operador Diamant `<>`: El Peresós Oficial

Des de Java 7, no cal repetir el tipus dos vegades. El compilador l'inferix per tu:

```java
// Antes de Java 7 (repetitivo):
Caja<String> caja1 = new Caja<String>();

// Desde Java 7 (el diamante <> al rescate):
Caja<String> caja2 = new Caja<>();
```

El `<>` és com l'"etcètera" dels genèrics: "ja saps de quin tipus estic parlant, no? Doncs això".

> **💡 Consell:** Usa sempre l'operador diamant `<>`. El teu codi queda més net, més llegible i els teus companys d'equip t'ho agrairan.

### Type Erasure: El Mag Es Porta Els Genèrics

Ací va el truc: els genèrics SOLS existeixen en temps de compilació. Quan el teu codi es converteix en bytecode, el compilador borra tota la informació de tipus genèrics. És com si un mag fera desaparéixer els `<String>` i `<Integer>`.

```java
// En tu código fuente:
ArrayList<String> nombres = new ArrayList<>();
ArrayList<Integer> numeros = new ArrayList<>();

// Después de compilar (en bytecode):
ArrayList nombres = new ArrayList();  // ambos son ArrayList simples
ArrayList numeros = new ArrayList();
```

A açò se li diu **type erasure**. El compilador:
1. **Verifica** que els tipus siguen correctes (ací no cola un Integer en una llista de Strings)
2. **Borra** la informació genèrica
3. **Afegeix** els castings necessaris on calga

És com un porter que revisa el teu DNI a la porta, però una vegada dins, tu no portes cap identificació.

### Mètodes Genèrics: Funcions Per a Tot Tipus

No només les classes poden ser genèriques. Els mètodes també poden declarar els seus propis paràmetres de tipus, independentment de la classe on estiguen.

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

### ⭐ BE THE CODE, MY FRIEND: Mètode Genèric

> 🕶️ **Don Tip:** El `<T>` abans del `void` declara el tipus del mètode. Sense això, el compilador no sap què és `T`.

```java
public class BeTheGenericMethod {
    public static void main(String[] args) {
        String resultado = Utilidades.<String>obtenerValor("Hola");
        // ¿Qué hace este código? ¿Compila?
    }
}
```

> **⭐ BE THE CODE, MY FRIEND**
> 🕶️ **Don Tip:** Els mètodes genèrics dedueixen el tipus automàticament dels arguments.
> **Compila i què imprimeix?**
> - (A) Sí, imprimeix "Hola"
> - (B) No compila, el mètode no existix
> - (C) Sí, però imprimeix null
> - (D) No compila, la sintaxi és incorrecta
>
> **Resposta: (A) Sí, imprimeix "Hola".** La sintaxi `Clase.<Tipo>metodo()` és vàlida per a invocar mètodes genèrics especificant el tipus explícitament, encara que normalment el compilador l'inferix sol.

### ❓ No Hi Ha Preguntes Tontes! (Genèrics)

> **❓ No Hi Ha Preguntes Tontes!**
> **Q:** Per què no puc fer `new T()` dins d'un mètode genèric?
> **A:** Perquè en temps de compilació, Java no sap què és `T`. No pot crear una instància d'alguna cosa que no coneix. És com demanar-li a un pastisser que faça "un pastís" però sense dir-li de què.
>
> **Q:** I `new T[]`?
> **A:** Tampoc. Els arrays coneixen el seu tipus en temps d'execució, però els genèrics es borren (type erasure). Per això internament s'usa `Object[]` i es casteja.
>
> **Q:** Els genèrics ralentitzen el meu programa?
> **A:** No. Java aplica **type erasure**: el compilador borra tota la informació genèrica i la convertix en castings normals. És només sucre sintàctic en compilació. En runtime, no hi ha genèrics.

### ❓ No Hi Ha Preguntes Tontes! (Més Genèrics)

> **❓ No Hi Ha Preguntes Tontes!**
> **Q:** Què significa `<?>` en els genèrics?
> **A:** És un wildcard sense restriccions. Significa "qualsevol tipus". És com dir "m'és igual el tipus, només vull treballar amb la col·lecció". Però ull: no pots afegir elements (excepte null) perquè el compilador no sap de quin tipus és.
>
> **Q:** Puc tindre un mètode genèric estàtic en una classe no genèrica?
> **A:** Sí, totalment. De fet, és molt comú. La classe `Collections` està plena de mètodes estàtics genèrics com `sort()`, `reverse()`, etc.
>
> **Q:** Què és el "type erasure"?
> **A:** És el procés pel qual el compilador borra tota la informació de tipus genèrics després de comprovar que tot és correcte. En el bytecode, `ArrayList<String>` i `ArrayList<Integer>` són tots dos `ArrayList`. És com si el compilador fóra un advocat que revisa el contracte, i després un mag que fa desaparéixer les proves.

### Wildcards: `? extends T` vs `? super T`

Els comodins (wildcards) són per a quan vols escriure mètodes que funcionen amb **qualsevol tipus** dins d'una jerarquia.

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

> **⚠️ Advertència:** Mnemotècnia infalible:
> - `? extends T` → **P**roducer **E**xtends (només produïxes/lleges dades)
> - `? super T` → **C**onsumer **S**uper (només consumes/escrius dades)
>
> El principi PECS de Joshua Bloch: "Producer Extends, Consumer Super".

### ⭐ BE THE CODE, MY FRIEND: Wildcards

> 🕶️ **Don Tip:** `?` significa 'qualsevol tipus'. `? extends Number` limita a Number i les seues subclasses.

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
> 🕶️ **Don Tip:** Els wildcards són de només lectura. No pots afegir elements a una `List<?>` perquè no saps de quin tipus és.
> **Quantes crides compilen?**
> - (A) 0
> - (B) 1
> - (C) 2
> - (D) Error en ambdues
>
> **Resposta: (C) 2.** `List<? extends Number>` accepta qualsevol llista el tipus de la qual hereta de Number, tant `List<Integer>` com `List<Double>`.

### Resum Ràpid: Genèrics

```java
ArrayList<Tipo>     ← Solo acepta ese Tipo y subclases
Caja<T>             ← Tu propia clase genérica
new Caja<>()        ← El diamante: infiere el tipo
<T> void metodo(T)  ← Método genérico
? extends T         ← Wildcard de lectura (producer)
? super T           ← Wildcard de escritura (consumer)
```

---

## Mapes: La Guia Telefònica

### HashMap: La Guia Telefònica

HashMap associa claus amb valors. Com una agenda: busques per nom (clau) i obtens el telèfon (valor).

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

> **📝 Nota:** Les claus d'un HashMap han de ser immutables. Per això String i Integer són perfectes. Si uses un objecte mutable com a clau i després el modifiques, el HashMap no el trobarà mai. És com canviar el pany i esperar que la clau vella continue funcionant.

### Recórrer un HashMap

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

### ⭐ BE THE CODE, MY FRIEND: El HashMap Traïdor

> 🕶️ **Don Tip:** HashMap no garanteix ordre. Si necessites ordre, usa TreeMap o LinkedHashMap.

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
> 🕶️ **Don Tip:** Les claus d'un HashMap han de tindre `hashCode()` i `equals()` ben implementats.
> **Què imprimeix?**
> - (A) Madrid
> - (B) Barcelona
> - (C) null
> - (D) Error
>
> **Resposta: (B) Barcelona.** La clau "España" se sobreescriu amb el nou valor. Madrid ha sigut reemplaçat.

### ⭐ BE THE CODE, MY FRIEND: Freqüència de Lletres

> 🕶️ **Don Tip:** `getOrDefault()` evita el null check. Usa'l sempre que pugues.

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
> 🕶️ **Don Tip:** `merge()` és el teu amic per a freqüències. Combina valor existent amb nou.
> **Què imprimeix?**
> - (A) 1 1
> - (B) 3 1
> - (C) 3 2
> - (D) 2 2
>
> **Resposta: (B) 3 1.** En "banana": la 'a' apareix 3 vegades, la 'n' apareix 1 volta. getOrDefault és l'heroi que evita els NullPointerException.

### TreeMap: L'Ordenat

TreeMap és un HashMap ordenat per clau. Internament usa un arbre roig-negre.

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

> **💡 Consell:** HashMap per a velocitat (O(1)). TreeMap per a ordre (O(log n)). Si pregunten en una entrevista "quin és millor?", la resposta correcta és "depén".

### ❓ No Hi Ha Preguntes Tontes! (Mapes)

> **❓ No Hi Ha Preguntes Tontes!**
> **Q:** Puc tindre un HashMap amb clau null?
> **A:** HashMap admet una clau null. TreeMap no. HashMap guarda la clau null en una posició especial.
>
> **Q:** Què passa si la clau no existix en el mapa?
> **A:** `get()` torna `null`. Usa'l amb cura o millor usa `getOrDefault(clau, valorPerDefecte)`.
>
> **Q:** HashMap o TreeMap?
> **A:** HashMap per a velocitat. TreeMap per a ordre.
>
> **Q:** Quin avantatge té un `LinkedHashMap`?
> **A:** Manté l'ordre d'inserció. És com un HashMap que recorda en quin ordre vas ficar les coses.

### Comparació: Map vs List vs Set

| Característica | List | Set | Map |
|---|---|---|---|
| Què guarda? | Elements ordenats | Elements únics | Parells clau→valor |
| Duplicats? | Sí | No | Claus no, valors sí |
| Ordre? | D'inserció | Depén (Hash/Tree) | Depén (Hash/Tree) |
| Accés | Per índex | Per element | Per clau |
| Nulls? | Sí | HashSet: 1, TreeSet: 0 | HashMap: 1 clau, TreeMap: 0 |
| Principal impl. | ArrayList | HashSet | HashMap |

**Regla pràctica:**
- Necessites una llista de coses? → `ArrayList`
- Coses sense repetir? → `HashSet`
- Coses ordenades sense repetir? → `TreeSet`
- Associar una cosa amb una altra? → `HashMap`

### 🥊 EL RING: HashMap vs TreeMap

Dues implementacions de Map s'enfronten.

**HashMap:** «Jo soc el rei de la velocitat. O(1) en get i put. No m'importa l'ordre, m'importa la rapidesa.»

**TreeMap:** «Sí, però jo mantinc les claus ordenades automàticament. Si necessites recórrer-les en ordre alfabètic, soc el teu únic amic.»

**HashMap:** «¿Ordenat? Això costa. Soc O(log n) en les teues operacions. Jo soc O(1). ¡Soc imbatible en rendiment!»

**TreeMap:** «Cert, però puc navegar: `firstKey()`, `lastKey()`, `subMap()`, `headMap()`. Tu per a tot això has de copiar i ordenar.»

**HashMap:** «Si no necessites ordre, per què pagar el cost? La majoria dels casos usen HashMap.»

**TreeMap:** «I quan necessiten ordre, ahí estic jo. I no soc tan lent: O(log n) continua sent molt ràpid per a la majoria de casos.»

**HashMap:** «Tregua. Cadascú al seu lloc.»

**TreeMap:** «Fet.»

> 🕶️ **Don Tip:** ¿Velocitat? HashMap. ¿Ordre? TreeMap. ¿Ordre d'inserció? LinkedHashMap. Cadascú té el seu superpoder.

### Resum Ràpid: Mapes

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

## Exercicis Proposats

### Exercici 1: Contactes de Tota la Vida
Implementa una mini agenda usant `HashMap<String, String>` que associe nom amb telèfon. El programa ha de permetre afegir contactes, buscar per nom, llistar tots i esborrar. Usa un menú.

### Exercici 2: Crea una classe `Pareja<T, U>`
Emmagatzema dos objectes de tipus possiblement distints. Inclou mètodes `getPrimero()`, `getSegundo()`, `setPrimero(T)`, `setSegundo(U)` i un mètode `intercambiar()` que torne una nova `Pareja<U, T>` amb els valors intercanviats.

### Exercici 3: Comptador de Paraules
Escriu un programa que lligga un text i compte quantes vegades apareix cada paraula usant un `HashMap<String, Integer>`.

### Exercici 4: Mètode Genèric `maximo`
Implementa un mètode genèric `public static <T extends Comparable<T>> T maximo(T[] array)` que torne l'element més gran d'un array.

---

**RAs treballats en esta unitat:**
- **RA6** - Tipus avançats: Genèrics i mapes

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
