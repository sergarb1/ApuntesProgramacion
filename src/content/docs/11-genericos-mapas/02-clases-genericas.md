---
title: "02 · Tu propia clase genérica: `Caja<T>`"
description: "Los parámetros de tipo, las convenciones T/E/K/V/N y tu primera clase con huecos rellenables 📦"
---

<p><small>Los parámetros de tipo, las convenciones T/E/K/V/N y tu primera clase con huecos rellenables 📦</small></p>

> 🗺️ **Estás en:** 🗺️ **U11 · Genéricos y Mapas** → 02 · Tu propia clase genérica: `Caja<T>`

---

## 📬 La idea en una frase

> **Una clase genérica es una plantilla con huecos: declaras `<T>` en la clase y quien la use decide qué tipo rellena cada hueco. `Caja<String>` y `Caja<Integer>` son dos clases distintas generadas a partir del mismo molde.**

En el punto 1 usaste `ArrayList<String>` como consumidora. Hoy toca el otro lado del mostrador: **crear tu propia clase genérica**. No es tan difícil como parece: solo tienes que añadir `<T>` al nombre de la clase y, a partir de ahí, `T` se comporta como un tipo cualquiera dentro de ella.

---

## 🔤 Las convenciones: T, E, K, V, N

El parámetro de tipo se escribe entre `< >` y, por convención, se usan letras mayúsculas con un significado implícito:

- `T` → Tipo (Type), el comodín general.
- `E` → Elemento (Element), para colecciones.
- `K` / `V` → Clave / Valor (Key / Value), para mapas.
- `N` → Número (Number).

Puedes usar cualquier letra, pero las convenciones hacen que tu código se lea solo. Cuando veas `Map<K, V>` en un código ajeno, ya sabrás que la primera letra es la clave y la segunda, el valor. Sin leer una línea.

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

Fíjate en el patrón: `T` aparece como tipo del atributo, como tipo del parámetro de `guardar` y como tipo de retorno de `sacar`. Es una plantilla: cuando alguien escribe `Caja<String>`, todas las `T` se convierten en `String` para esa instancia.

Y así se usa:

```java
Caja<String> cajaDeTexto = new Caja<>();
cajaDeTexto.guardar("Mensaje secreto");
String mensaje = cajaDeTexto.sacar();  // Sin casting, directo al pelo

Caja<Integer> cajaDeNumeros = new Caja<>();
cajaDeNumeros.guardar(42);
Integer numero = cajaDeNumeros.sacar();
```

`cajaDeTexto` y `cajaDeNumeros` son del mismo molde `Caja`, pero para el compilador son tipos distintos: no puedes mezclarlas sin que te pille.

> ⚠️ **Advertencia:** no puedes usar tipos primitivos como parámetro de tipo. `Caja<int>` no compila. Usa `Caja<Integer>`, con su clase envolvente (wrapper). El autoboxing de Java se encarga de la conversión automática, como viste en la U10.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** el tipo `T` es un comodín. Cuando instancies, se reemplaza por el tipo real. Pero ojo: la caja solo guarda UN elemento; el segundo `guardar` pisa al primero.

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

La **B**. `Caja<T>` guarda un único atributo `contenido`. El segundo `guardar(10)` sobrescribe el 5, así que `sacar()` devuelve 10. Moraleja: si necesitas guardar varios elementos, esta caja no te sirve... para eso están las colecciones de la U10.

</details>

---

## 🤷 No hay preguntas tontas

> ❓ **¿Puedo tener una clase con dos tipos genéricos?**

Sí, y es muy común. `Pareja<T, U>` con `private T primero; private U segundo;` es el ejemplo clásico (lo machacarás en los boletines). La sintaxis es la misma: los parámetros de tipo van separados por comas entre los `< >`.

---

> ❓ **¿Por qué `Caja<int>` no compila?**

Porque los genéricos solo funcionan con tipos referencia (objetos), y `int` es un primitivo. Por eso existen las clases wrapper (`Integer`, `Double`, `Boolean`...). El autoboxing convierte automáticamente `int` → `Integer` al pasar un `5`, y el unboxing hace el camino inverso al leer.

---

> ❓ **¿`Caja` y `Caja<T>` son la misma clase?**

Casi, pero no. `Caja<T>` es la versión genérica. `Caja` a secas (sin `< >`) es lo que se llama un **tipo crudo (raw type)**: funciona como el infierno del punto 1, sin seguridad de tipos. Nunca lo uses salvo que te obliguen los restos de código antiguo.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué letra se usa por convención para el parámetro de tipo de una colección?
2. ¿Qué letras para la clave y el valor de un mapa?
3. ¿Por qué no existe `Caja<int>`?
4. ¿Qué le pasa a `guardar(5)` cuando después llamas a `guardar(10)` en una `Caja<Integer>`?

<details>
<summary>🔄 Respuestas</summary>

1. `E`, de Elemento.
2. `K` (Key) y `V` (Value).
3. Porque `int` es un primitivo y los genéricos solo aceptan objetos. Se usa `Integer` con autoboxing.
4. Que se pierde: `Caja<T>` guarda un único elemento y el segundo `guardar` sobrescribe al primero.

</details>

---

## ✅ Resumen en 3 frases

1. **Una clase genérica** se declara con `<T>` en el nombre y usa `T` como un tipo más dentro: atributos, parámetros y retornos.
2. Las **convenciones** (`T`, `E`, `K`/`V`, `N`) hacen que el código se entienda solo, y los parámetros de tipo van separados por comas cuando hay varios.
3. **Los primitivos no valen**: usa las clases wrapper (`Integer` en vez de `int`) y deja que el autoboxing haga la conversión automática.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Clase genérica | Clase que declara `<T>` y usa el tipo como un hueco rellenable |
> | Parámetro de tipo | El `T` de `Caja<T>`; se decide al instanciar |
> | Wrapper | Clase que envuelve un primitivo (`Integer` envuelve `int`) |
> | Autoboxing | Pasar de primitivo a wrapper automáticamente |
> | Tipo crudo (raw type) | `Caja` sin `< >`: sin seguridad de tipos, evítalo |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/11-genericos-mapas) · **Anterior:** [01 · Genéricos: el `<T>` que lo cambió todo](/ApuntesProgramacion/11-genericos-mapas/01-que-son-genericos) · **Siguiente:** [03 · El diamante `<>` y type erasure](/ApuntesProgramacion/11-genericos-mapas/03-diamante-type-erasure)