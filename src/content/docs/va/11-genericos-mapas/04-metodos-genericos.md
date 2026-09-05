---
title: "04 · Mètodes genèrics: funcions per a tot tipus"
description: "El <T> abans del tipus de retorn, la inferència automàtica i els límits amb Comparable 🧰"
---

<p><small>El <T> abans del tipus de retorn, la inferència automàtica i els límits amb Comparable 🧰</small></p>

> 🗺️ **Estàs en:** 🗺️ **U11 · Genèrics i Mapes** → 04 · Mètodes genèrics: funcions per a tot tipus

---

## 📬 La idea en una frase

> **Un mètode genèric declara el seu propi `<T>` abans del tipus de retorn i funciona per a qualsevol tipus, deduint-lo dels arguments. Amb un límit (`T extends Comparable<T>`) li exigixes a `T` que sàpia comparar-se.**

En el punt 2 la classe era genèrica. Però hi ha un cas encara més flexible: un mètode genèric **dins d'una classe que no és genèrica**. El `<T>` del mètode viu sol en ell, com un paràmetre més, i el compilador el deduïx de la crida. És la ferramenta perfecta per a les classes d'utilitats.

---

## 🧰 El `<T>` abans del tipus de retorn

La sintaxi té un truc visual: el `<T>` va **abans** del tipus de retorn. Eixe és el cartell que li diu al compilador "escolta, en este mètode `T` és un tipus".

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
```

I l'ús, amb la màgia de la inferència:

```java
Utilidades.imprimir(42);         // El compilador infiere que T es Integer
Utilidades.imprimir("Hola");     // El compilador infiere que T es String

boolean igual = Utilidades.sonIguales("Ana", "Ana");  // T=String, U=String

String[] invertido = Utilidades.invertir(new String[]{"A", "B", "C"});
// invertido = {"C", "B", "A"}
```

No especifiques el tipus en cap crida: el compilador mira els arguments i deduïx què és `T`. És com un professor que s'adapta a cada alumne: mateixa classe, contingut adaptat.

---

## 🚧 Els límits: `T extends Comparable<T>`

I si el mètode necessita que `T` tinga un superpoder? Per exemple, comparar elements per a trobar el màxim. Ací entra el **límit (bound)**: li exigixes a `T` que implemente `Comparable`:

```java
public class Utilidades {

    // T debe saber compararse consigo mismo
    public static <T extends Comparable<T>> T maximo(T a, T b) {
        return a.compareTo(b) > 0 ? a : b;
    }
}

// Uso:
System.out.println(Utilidades.maximo(5, 8));            // 8
System.out.println(Utilidades.maximo("gato", "perro")); // "perro"
```

`String` i `Integer` implementen `Comparable`, així que funcionen. Si intentares passar una classe teua sense `Comparable`, el compilador t'ho diria: no pot garantir que el teu tipus sàpia comparar-se. El límit convertix la promesa genèrica en un contracte.

> 💡 **Consell:** `extends` en genèrics no significa herència de classe: significa "és o hereta de / implementa". `T extends Comparable<T>` es llig com "T implementa Comparable<T>". Ho veuràs a fons en el punt 5 amb els wildcards.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** pots invocar un mètode genèric especificant el tipus explícitament: `Classe.<Tipus>metode(...)`. És rar, però existix, i sol eixir en exàmens.

**Exercici: el mètode que es crida amb ulleres**

```java
public class BeTheGenericMethod {
    public static void main(String[] args) {
        String resultado = Utilidades.<String>maximo("manzana", "plátano");
        System.out.println(resultado);
    }
}
```

**Què imprimeix?**

- (A) "manzana"
- (B) "plátano"
- (C) null
- (D) No compila, la sintaxi és incorrecta

<details>
<summary>🔄 Solució</summary>

La **B**. La sintaxi `Classe.<Tipus>metode(...)` és vàlida per a especificar el tipus explícitament, encara que normalment el compilador l'inferix sol. Ací li dius a la cara que `T` és `String`, així que el mètode usa el `compareTo` dels Strings i torna "plátano" (p > m). Sense ulleres: `maximo("manzana", "plátano")` faria exactament el mateix.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. On es declara el `<T>` d'un mètode genèric?
2. Què significa `T extends Comparable<T>`?
3. Què deduïx el compilador en la crida `imprimir(42)`?
4. Pot un mètode genèric viure en una classe no genèrica?

<details>
<summary>🔄 Respostes</summary>

1. Abans del tipus de retorn: `public static <T> void imprimir(T x)`.
2. Que `T` implementa `Comparable<T>`: sap comparar-se amb si mateix.
3. Que `T` és `Integer` (el tipus de l'argument).
4. Sí, i és el més comú: les classes d'utilitats estan plenes de mètodes estàtics genèrics.

</details>

---

## ✅ Resum en 3 frases

1. Un **mètode genèric** declara `<T>` abans del tipus de retorn i el compilador deduïx `T` dels arguments.
2. Amb un **límit** (`T extends Comparable<T>`) exigixes que `T` sàpia comparar-se, i el compilador ho verifica.
3. La sintaxi `Classe.<Tipus>metode(...)` permet especificar el tipus a mà, encara que quasi mai la necessites.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Mètode genèric | Mètode amb `<T>` propi, independent de la classe |
> | Inferència | El compilador deduïx `T` dels arguments |
> | Límit (bound) | Restricció: `T extends Comparable<T>` |
> | `Comparable` | Interfície que dona el superpoder `compareTo()` |
> | `<T>` explícit | `Classe.<String>metode(...)`: declarar el tipus a mà |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/11-genericos-mapas) · **Anterior:** [03 · El diamant `<>` i type erasure](/ApuntesProgramacion/va/11-genericos-mapas/03-diamante-type-erasure) · **Següent:** [05 · Wildcards: `? extends T` i `? super T`](/ApuntesProgramacion/va/11-genericos-mapas/05-wildcards)