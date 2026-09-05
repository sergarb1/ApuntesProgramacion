---
title: "Boletín 11 - Inicial Resuelto: Genéricos y Mapas"
nav_order: 11
---
*Con soluciones. A aprender.*

---

## Ejercicio 1: Completa el código — clase genérica

```java
public class Caja<T> {
    private T contenido;

    public void guardar(T contenido) {
        this.contenido = contenido;
    }

    public T sacar() {
        return contenido;
    }
}
```

La declaración correcta es `public class Caja<T>`.

> **💡 Explicación:** `<T>` declara un parámetro de tipo. `T` es una convención (de "Type"), pero podrías usar cualquier letra. A partir de ahí, puedes usar `T` como un tipo cualquiera dentro de la clase. Cuando alguien haga `Caja<String>`, todas las `T` se convierten en `String`. Es como una plantilla: dejas huecos (`T`) que se rellenan cuando alguien usa la clase.

---

## Ejercicio 2: ¿Qué imprime? — HashMap básico

```java
import java.util.HashMap;

public class Test {
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

**Solución:** Imprime `Barcelona`.

> **💡 Explicación:** En un `HashMap`, las claves son únicas. Cuando haces `put("España", "Madrid")` y luego `put("España", "Barcelona")`, la segunda llamada SOBRESCRIBE el valor anterior. "Madrid" se pierde para siempre. Es como apuntar un número en tu agenda y luego tacharlo para poner otro: solo queda el último. Si quisieras mantener ambos, tendrías que usar una estructura diferente (como `HashMap<String, List<String>>`).

---

## Ejercicio 3: Encuentra el error — tipo primitivo en genérico

```java
ArrayList<int> numeros = new ArrayList<>();  // ERROR
numeros.add(1);
numeros.add(2);
numeros.add(3);
```

**Solución:** No puedes usar tipos primitivos como parámetros de tipo en genéricos. `int` debe ser `Integer`.

```java
ArrayList<Integer> numeros = new ArrayList<>();
numeros.add(1);  // autoboxing: int → Integer
numeros.add(2);
numeros.add(3);
```

> **💡 Explicación:** Los genéricos solo funcionan con tipos referencia (objetos). `int`, `double`, `boolean` son tipos primitivos y no pueden ser parámetros de tipo. Por eso existen las clases wrapper: `Integer`, `Double`, `Boolean`. El autoboxing de Java convierte automáticamente `int` a `Integer` al añadir y `Integer` a `int` al obtener, por lo que apenas notas la diferencia en el código.

---

## Ejercicio 4: Escribe este programa — mini agenda HashMap

```java
import java.util.HashMap;
import java.util.Scanner;

public class MiniAgenda {
    public static void main(String[] args) {
        HashMap<String, String> agenda = new HashMap<>();
        agenda.put("Ana", "612345678");
        agenda.put("Bob", "698765432");
        agenda.put("Carlos", "655111222");

        Scanner sc = new Scanner(System.in);
        System.out.print("Buscar teléfono de: ");
        String nombre = sc.nextLine();

        String telefono = agenda.get(nombre);
        if (telefono != null) {
            System.out.println(nombre + " → " + telefono);
        } else {
            System.out.println(nombre + " no está en la agenda.");
        }
        sc.close();
    }
}
```

> **💡 Explicación:** `HashMap` es perfecto para asociar nombres con teléfonos. La clave es el nombre (único) y el valor es el teléfono. `get(nombre)` devuelve `null` si la clave no existe, así que comprobamos antes de usarlo. Es la estructura de datos perfecta para una agenda: búsqueda rápida por clave (O(1)).

---

## Ejercicio 5: Completa el código — getOrDefault

```java
HashMap<String, Integer> edades = new HashMap<>();
edades.put("Ana", 25);
edades.put("Bob", 30);

int edadAna = edades.get("Ana");             // 25
int edadCarlos = edades.get("Carlos");       // null → NullPointerException (en realidad: error de compilación si es int, NPE si Integer)
int edadCarlosSeguro = edades.getOrDefault("Carlos", 0);  // 0
```

**Solución:** `edadAna = 25`. `edad.get("Carlos")` devuelve `null` (la clave no existe). Si la variable es `int`, no compila o da error porque no puedes asignar `null` a un primitivo. `getOrDefault("Carlos", 0)` devuelve `0` (el valor por defecto).

> **💡 Explicación:** `getOrDefault()` es el salvavidas de los HashMap. En lugar de hacer `if (map.get(clave) != null)`, haces `map.getOrDefault(clave, valorDefecto)` y te ahorras líneas y posibles `NullPointerException`. Es como tener un plan B: "si no encuentras a Carlos, devuelve 0". Siempre que trabajes con mapas, úsalo.

---

## Ejercicio 6: ¿Qué imprime? — método genérico

```java
public class Util {
    public static <T> void imprimir(T elemento) {
        System.out.println("Valor: " + elemento);
    }

    public static void main(String[] args) {
        Util.imprimir(42);
        Util.imprimir("Hola");
        Util.imprimir(3.14);
    }
}
```

**Solución:**
```
Valor: 42
Valor: Hola
Valor: 3.14
```

> **💡 Explicación:** El método `imprimir` es genérico: ` <T>` antes del tipo de retorno. El compilador INFIERE el tipo `T` a partir del argumento. En la primera llamada, `T` es `Integer`. En la segunda, `T` es `String`. En la tercera, `T` es `Double`. No necesitas especificarlo: Java lo deduce solo. Es como un profesor que se adapta al alumno: da la misma clase pero adaptada a cada uno.

---

## Ejercicio 7: Encuentra el error — la clave mutable

```java
HashMap<ArrayList<Integer>, String> mapa = new HashMap<>();
ArrayList<Integer> lista = new ArrayList<>();
lista.add(1);
lista.add(2);
mapa.put(lista, "valor");
lista.add(3);  // modificamos la clave después de usarla
System.out.println(mapa.get(lista));  // posiblemente null
```

**Solución:** El problema es que las claves de un HashMap deben ser INMUTABLES. Al modificar `lista` después de usarla como clave, su `hashCode()` cambia. El HashMap busca en el bucket antiguo, pero la clave tiene un hash diferente ahora, así que `get()` puede devolver `null` aunque la clave esté en el mapa.

> **💡 Explicación:** Las claves de un HashMap deben ser inmutables (como `String` o `Integer`). Si usas un objeto mutable y lo modificas, el HashMap se vuelve impredecible. Es como cambiar la cerradura de tu casa y esperar que tu llave vieja siga funcionando. Por eso `String` es la clave perfecta: es inmutable. Nunca uses `ArrayList`, arrays, o tus propias clases mutables como claves de un HashMap a menos que sepas muy bien lo que haces (spoiler: no lo sabes).

---

## 🔗 Referencias para seguir practicando

- **CodeWars:** [Grasshopper - Grade book](https://www.codewars.com/kata/55cbd4ba903825f7970000f5) (7 kyu)
- **CodeWars:** [Word Count](https://www.codewars.com/kata/570cc83d616be859a5000c9b) (7 kyu)
- **AceptaElReto.com:** [416 - Casillas](https://www.aceptaelreto.com/problem/statement.php?id=416)
- **AceptaElReto.com:** [462 - Tres dedos](https://www.aceptaelreto.com/problem/statement.php?id=462)
