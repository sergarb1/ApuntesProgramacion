---
title: "05 · Clases genéricas: tu propia `Caja<T>`"
description: "De dónde sale el `<String>` de ArrayList, las convenciones T/E/K/V y tu primera clase con huecos rellenables 📦"
---

<p><small>De dónde sale el `<String>` de ArrayList, las convenciones T/E/K/V y tu primera clase con huecos rellenables 📦</small></p>

> 🗺️ **Estás en:** 📚 **U11 · Colecciones, genéricos y mapas** → 05 · Clases genéricas: tu propia `Caja<T>`

---

## 📬 La idea en una frase

> **Los genéricos existen por una sola razón: seguridad de tipos. Y una clase genérica es una plantilla con huecos: declaras `<T>` y quien la use decide qué tipo rellena cada hueco.**

En los puntos 1 y 2 llevas todo el día usando `ArrayList<String>` y `HashSet<Integer>`... pero nadie te ha explicado de dónde sale ese `<String>`. Hoy es el día.

---

## 😱 El infierno antes de los genéricos

Una `ArrayList` a la antigua usanza (sin genéricos) es una caja de caos donde puedes meter cualquier cosa. Al sacar, Java te devuelve un `Object` y tú tienes que recordar qué metiste:

```java
import java.util.*;

ArrayList cajaDeCaos = new ArrayList();   // sin <String>, sin <Integer>...
cajaDeCaos.add(42);
cajaDeCaos.add("Hola");

Object cosa = cajaDeCaos.get(0);
String texto = (String) cosa;  // 💥 ClassCastException en tiempo de ejecución
```

> ⚠️ **Advertencia:** sin genéricos, los errores de tipo saltan en tiempo de EJECUCIÓN (cuando el usuario usa tu programa). Con genéricos, saltan en tiempo de COMPILACIÓN (mientras programas). ¿Cuándo prefieres enterarte?

## 🤝 Llegan los genéricos

Una `ArrayList<String>` ya no es una caja de caos: es una máquina expendedora que SOLO da Coca-Colas. Si intentas meter un `int`, el compilador te para el brazo. Y al sacar, `get(0)` devuelve un `String` directamente: sin casting y sin cruzar los dedos.

El `<String>` es un **parámetro de tipo**: una promesa que le haces al compilador y que él se encarga de cumplir.

---

## 🔤 Las convenciones: T, E, K, V, N

El parámetro de tipo se escribe entre `< >` y, por convención, se usan mayúsculas con significado implícito:

- `T` → Tipo (Type), el comodín general.
- `E` → Elemento (Element), para colecciones.
- `K` / `V` → Clave / Valor (Key / Value), para mapas.
- `N` → Número (Number).

---

## 📦 La clase `Caja<T>`

Una caja que guarda UN objeto de cualquier tipo:

```java
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

Fíjate en el patrón: `T` aparece como tipo del atributo, del parámetro de `guardar` y del retorno de `sacar`. Cuando alguien escribe `Caja<String>`, todas las `T` se convierten en `String` para esa instancia:

```java
Caja<String> cajaDeTexto = new Caja<>();
cajaDeTexto.guardar("Mensaje secreto");
String mensaje = cajaDeTexto.sacar();  // Sin casting, directo al pelo

Caja<Integer> cajaDeNumeros = new Caja<>();
cajaDeNumeros.guardar(42);
Integer numero = cajaDeNumeros.sacar();
```

`cajaDeTexto` y `cajaDeNumeros` salen del mismo molde, pero para el compilador son tipos distintos: no puedes mezclarlas sin que te pille.

> ⚠️ **Advertencia:** no puedes usar primitivos como parámetro de tipo. `Caja<int>` no compila: usa `Caja<Integer>` con su clase envolvente y deja que el autoboxing haga la conversión automática (lo viste en el punto 1).

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** el tipo `T` es un comodín que se reemplaza al instanciar. Pero ojo: la caja solo guarda UN elemento; el segundo `guardar` pisa al primero.

**Ejercicio: la caja que solo recuerda lo último**

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

**¿Qué imprime?**

- (A) 5
- (B) 10
- (C) null
- (D) Error de compilación

<details>
<summary>🔄 Solución</summary>

La **B**. `Caja<T>` guarda un único atributo `contenido`. El segundo `guardar(10)` sobrescribe el 5, así que `sacar()` devuelve 10. Moraleja: si necesitas guardar varios elementos, para eso están las colecciones de los puntos anteriores.

</details>

---

## 🤷 No hay preguntas tontas

> ❓ **¿Puedo tener una clase con dos tipos genéricos?**

Sí, y es muy común. `Pareja<T, U>` con `private T primero; private U segundo;` es el ejemplo clásico (lo machacarás en los boletines). Los parámetros de tipo van separados por comas entre los `< >`.

---

> ❓ **¿`Caja` y `Caja<T>` son la misma clase?**

Casi, pero no. `Caja` a secas (sin `< >`) es un **tipo crudo (raw type)**: funciona como el infierno del principio, sin seguridad de tipos. Nunca lo uses salvo que te obliguen los restos de código antiguo.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué excepción evitamos gracias a los genéricos al sacar elementos de una colección?
2. ¿Qué letra se usa por convención para el parámetro de tipo de una colección? ¿Y para clave y valor de un mapa?
3. ¿Por qué no existe `Caja<int>`?
4. ¿Qué le pasa al 5 después de llamar a `guardar(10)` en una `Caja<Integer>`?

<details>
<summary>🔄 Respuestas</summary>

1. `ClassCastException`, el clásico de usar un elemento como si fuera de otro tipo.
2. `E` (Elemento); `K` (Key) y `V` (Value).
3. Porque `int` es un primitivo y los genéricos solo aceptan objetos: se usa `Integer` con autoboxing.
4. Que se pierde: la caja guarda un único elemento y el segundo `guardar` sobrescribe al primero.

</details>

---

## ✅ Resumen en 3 frases

1. Los genéricos traen **seguridad de tipos**: comprueban en compilación que no metas la pata y eliminan los castings a ciegas.
2. Una **clase genérica** se declara con `<T>` y usa `T` como un hueco rellenable en atributos, parámetros y retornos; las convenciones (`T`, `E`, `K`/`V`, `N`) hacen que el código se lea solo.
3. **Los primitivos no valen**: usa las clases wrapper (`Integer` en vez de `int`) y deja que el autoboxing convierta solo.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Genérico | Código que trabaja con un tipo que se decide al usarlo (`<T>`) |
> | Parámetro de tipo | El `<String>` de `ArrayList<String>`: el tipo que se pasa |
> | Clase genérica | Clase que declara `<T>` y usa el tipo como hueco rellenable |
> | Wrapper | Clase que envuelve un primitivo (`Integer` envuelve `int`) |
> | Tipo crudo (raw type) | `Caja` sin `< >`: sin seguridad de tipos, evítalo |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/11-colecciones) · **Anterior:** [04 · Iterator y Collections](/ApuntesProgramacion/11-colecciones/04-iterator-collections) · **Siguiente:** [06 · El diamante, métodos genéricos y wildcards](/ApuntesProgramacion/11-colecciones/06-genericos-avanzado)
