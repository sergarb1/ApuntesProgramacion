---
title: "05 · Wildcards: `? extends T` y `? super T`"
description: "Covarianza y contravarianza: el comodín ? y el principio PECS de Joshua Bloch 🃏"
---

<p><small>Covarianza y contravarianza: el comodín ? y el principio PECS de Joshua Bloch 🃏</small></p>

> 🗺️ **Estás en:** 🗺️ **U11 · Genéricos y Mapas** → 05 · Wildcards: `? extends T` y `? super T`

---

## 📬 La idea en una frase

> **Un wildcard (`?`) significa "cualquier tipo". `? extends T` sirve para LEER de una jerarquía (producer) y `? super T` para ESCRIBIR en ella (consumer). Regla PECS: Producer Extends, Consumer Super.**

Hasta aquí todo perfecto: `Caja<String>`, `ArrayList<Integer>`... Pero llega el momento incómodo: `List<Number>` NO acepta una `List<Integer>`. Y tú jurarías que un Integer es un Number. Pues no: los genéricos son invariantes. Para escribir métodos que acepten jerarquías enteras, necesitas los wildcards.

---

## 😱 El problema: `List<Number>` no acepta `List<Integer>`

```java
import java.util.*;

public class Invariante {
    public static double sumar(List<Number> numeros) {
        double total = 0.0;
        for (Number n : numeros) {
            total += n.doubleValue();
        }
        return total;
    }

    public static void main(String[] args) {
        List<Integer> enteros = Arrays.asList(1, 2, 3);
        // System.out.println(sumar(enteros));  // 🚫 Error de compilación
    }
}
```

¿Por qué falla? Porque si `sumar` aceptara `List<Integer>`, nada impediría que añadieras un `Double` a esa lista dentro del método, y entonces `enteros` ya no sería solo de Integers. Para protegerte de ese caos, los genéricos son **invariantes**: `List<Integer>` NO es una `List<Number>`, punto. La solución es el comodín `?`.

---

## 🃏 `? extends T`: el comodín de lectura (covarianza)

`List<? extends Number>` significa "una lista de Number o de cualquier subclase suya". Sirve para **leer**: sabes que dentro hay Numbers (o algo más específico), pero no puedes añadir nada porque no sabes el tipo exacto.

```java
import java.util.*;

public class Wildcards {

    // ? extends T → solo LEER: acepta Integer, Double, Number...
    public static double sumar(List<? extends Number> numeros) {
        double total = 0.0;
        for (Number n : numeros) {
            total += n.doubleValue();
        }
        // numeros.add(42);  // 🚫 Error: no puedes añadir nada (excepto null)
        return total;
    }
}

// Uso: ahora sí compila
List<Integer> enteros = Arrays.asList(1, 2, 3);
List<Double> dobles = Arrays.asList(1.5, 2.5, 3.5);
sumar(enteros);  // ✅
sumar(dobles);   // ✅
```

Fíjate en la asimetría: puedes **leer** todos los elementos como `Number` (porque cualquier subtipo es un Number), pero **no puedes escribir** porque no sabes si la lista es de Integers o de Doubles.

---

## 🃏 `? super T`: el comodín de escritura (contravarianza)

`List<? super Integer>` significa "una lista de Integer o de cualquier supertipo suyo (Number, Object)". Sirve para **escribir**: como cualquier cosa que metas será un Integer, y una lista de Integer/Number/Object acepta Integers, puedes añadir sin miedo. Pero al leer, solo sabes que es `Object`.

```java
import java.util.*;

public class Wildcards {

    // ? super T → solo ESCRIBIR: acepta lista de Integer, Number, Object...
    public static void rellenar(List<? super Integer> lista) {
        lista.add(1);
        lista.add(2);
        lista.add(3);
        // Integer n = lista.get(0);  // 🚫 Error: solo sabes que es Object
        Object obj = lista.get(0);    // ✅ Ok
    }
}

// Uso:
List<Number> numeros = new ArrayList<>();
List<Object> objetos = new ArrayList<>();
rellenar(numeros);   // ✅ ? super Integer funciona con Number
rellenar(objetos);   // ✅ ? super Integer funciona con Object
```

---

## 🧠 PECS: la mnemotecnia infalible

Joshua Bloch (el autor de *Effective Java*) resumió todo esto en cuatro letras que deberías tatuarte:

> - `? extends T` → **P**roducer **E**xtends: si el método SOLO produce (lee/da) datos, usa `extends`.
> - `? super T` → **C**onsumer **S**uper: si el método SOLO consume (recibe/escribe) datos, usa `super`.

¿Tu método lee de la colección? → `? extends`. ¿Tu método escribe en ella? → `? super`. ¿Hace las dos cosas? → no uses wildcard: usa `T` directamente.

> ⚠️ **Advertencia:** en los exámenes, la pregunta clásica es "¿puedo añadir un elemento a una `List<? extends Number>`?" La respuesta es NO (salvo `null`). Y "¿puedo leer con tipo un elemento de una `List<? super Integer>`?" Tampoco: solo como `Object`. PECS te salva de ambas.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `?` significa "cualquier tipo". `? extends Number` limita a Number y sus subclases, y es de solo lectura.

**Ejercicio: el comodín que lo acepta todo**

```java
import java.util.*;

public class BeTheWildcard {
    public static void main(String[] args) {
        List<Integer> enteros = Arrays.asList(1, 2, 3);
        List<Double> dobles = Arrays.asList(1.5, 2.5, 3.5);
        printNumbers(enteros);  // ¿compila?
        printNumbers(dobles);   // ¿compila?
    }

    public static void printNumbers(List<? extends Number> lista) {
        for (Number n : lista) {
            System.out.print(n + " ");
        }
    }
}
```

**¿Cuántas llamadas compilan?**

- (A) 0
- (B) 1
- (C) 2
- (D) Error en ambas

<details>
<summary>🔄 Solución</summary>

La **C**. `List<? extends Number>` acepta cualquier lista cuyo tipo herede de Number: tanto `List<Integer>` como `List<Double>`. El método solo lee (`for-each`), así que cumple el lado "producer" de PECS sin problema. Imprime `1 2 3 1.5 2.5 3.5`.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué significa `? extends Number`?
2. ¿Puedes añadir un elemento a una `List<? extends Number>`?
3. ¿Qué tipo puedes leer de una `List<? super Integer>`?
4. ¿Qué dice la P de PECS?

<details>
<summary>🔄 Respuestas</summary>

1. "Una lista de Number o de cualquier subclase suya" (solo lectura).
2. No, salvo `null`: no sabes el tipo exacto de la lista.
3. Solo `Object`, porque la lista podría ser de cualquier supertipo de Integer.
4. Producer Extends: si el método produce (lee) datos, usa `? extends`.

</details>

---

## ✅ Resumen en 3 frases

1. Los genéricos son **invariantes**: `List<Number>` no acepta `List<Integer>`. Los **wildcards** (`?`) resuelven ese problema.
2. `? extends T` es de **lectura** (covarianza) y `? super T` de **escritura** (contravarianza): nunca ambas.
3. El principio **PECS** de Joshua Bloch resume la regla: *Producer Extends, Consumer Super*.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Wildcard | El `?` de los genéricos: "cualquier tipo" |
> | Covarianza | `? extends T`: leer de una jerarquía |
> | Contravarianza | `? super T`: escribir en una jerarquía |
> | Invariante | Que `List<Integer>` no es `List<Number>` |
> | PECS | Producer Extends, Consumer Super |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/11-genericos-mapas) · **Anterior:** [04 · Métodos genéricos: funciones para todo tipo](/ApuntesProgramacion/11-genericos-mapas/04-metodos-genericos) · **Siguiente:** [06 · HashMap: la guía telefónica](/ApuntesProgramacion/11-genericos-mapas/06-hashmap)