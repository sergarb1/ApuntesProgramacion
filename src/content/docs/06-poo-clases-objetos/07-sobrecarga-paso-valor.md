---
title: "07 — Sobrecarga y paso por valor"
description: "Varios métodos con el mismo nombre y qué se copia de verdad cuando llamas (pista: las referencias te engañan) 🎭"
---

<p><small>Varios métodos con el mismo nombre y qué se copia de verdad cuando llamas (pista: las referencias te engañan) 🎭</small></p>

> 🗺️ **Estás en:** 🏗️ **U06 · POO: Clases y Objetos** → 07 · Sobrecarga y paso por valor

---

## 📬 La idea en una frase

> **La sobrecarga permite que varios métodos compartan nombre si sus parámetros difieren, y en Java todo se pasa por valor: los primitivos se copian, y de las referencias se copia la dirección (no el objeto).**

Dos conceptos que parecen de otro planeta y que son pan de cada día en el código real. El primero te da flexibilidad (un método `sumar` que funciona con `int`, con `double` y con tres números). El segundo te explica por qué tu método no consigue "cambiar" un `int` que le pasas... pero sí modifica un objeto. Vamos a por ellos.

---

## 🎭 Sobrecarga: el mismo nombre, otras manos

**Sobrecargar** un método es declarar varios métodos con el **mismo nombre** pero con **distinta lista de parámetros** (número, tipo u orden). Java decide cuál usar mirando los argumentos de la llamada:

```java
public class Calculadora {
    int sumar(int a, int b) {
        return a + b;
    }

    int sumar(int a, int b, int c) {
        return a + b + c;
    }

    double sumar(double a, double b) {
        return a + b;
    }
}
```

```java
Calculadora calc = new Calculadora();
calc.sumar(2, 3);          // usa el de (int, int) → 5
calc.sumar(2, 3, 4);       // usa el de (int, int, int) → 9
calc.sumar(2.5, 3.5);      // usa el de (double, double) → 6.0
```

> ⚠️ **Advertencia:** lo que **no** puede cambiar para distinguir métodos es solo el tipo de retorno. `int sumar(int, int)` y `double sumar(int, int)` no pueden coexistir: Java no sabe cuál quieres si solo miras `sumar(2, 3)`. El desempate se hace con la **firma** (nombre + parámetros), no con lo que devuelven.

Los **constructores** también se sobrecargan, y de hecho ya lo viste en el punto 4:

```java
public class Persona {
    String nombre;
    int edad;

    public Persona() {
        this("Desconocido", 0);
    }

    public Persona(String nombre) {
        this(nombre, 0);
    }

    public Persona(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }
}
```

Tres maneras de nacer: sin datos, solo con nombre, o con todo. El `this(...)` encadenado evita repetir la inicialización.

---

## 📦 Paso por valor: Java solo sabe copiar

Cuando llamas a un método, Java hace una copia de cada argumento y se la pasa. Eso se llama **paso por valor**: el método recibe **copias**, no los originales.

**Con primitivos** queda claro:

```java
void duplicar(int x) {
    x = x * 2;   // cambia la copia, no el original
}

int numero = 21;
duplicar(numero);
System.out.println(numero);   // 21. La copia se duplicó, el original ni se enteró
```

**Con referencias** la cosa se complica. La variable guarda una dirección; se copia **la dirección**, no el objeto:

```java
void subirSaldo(Cuenta c) {
    c.saldo += 100;   // el objeto al que apunta c SÍ cambia
}

Cuenta miCuenta = new Cuenta();
miCuenta.saldo = 50;
subirSaldo(miCuenta);
System.out.println(miCuenta.saldo);   // 150 ✅ (el objeto cambió)
```

La copia y el original guardan **la misma dirección**, así que ambos apuntan al mismo objeto: modificar el objeto se nota fuera.

> 📝 **Nota:** la trampa es esta: puedes cambiar *el contenido* del objeto, pero **no puedes** hacer que la variable original apunte a otro objeto. Si dentro del método haces `c = new Cuenta()`, solo la copia cambia de dirección; el original sigue apuntando a su cuenta. Es como darle a alguien las llaves de tu casa: puede redecorar la casa, pero no puede cambiar la dirección de tu casa.

---

## 📊 El resumen que te salva en el examen

| Qué le pasas | Qué recibe el método | ¿Se nota fuera? |
|---|---|---|
| Primitivo (`int`, `double`...) | Una **copia del valor** | ❌ No |
| Referencia | Una **copia de la dirección** | ✅ Sí (si modificas el objeto) / ❌ No (si reasignas la referencia) |

> 💡 **Tip:** memorízalo así: *Java copia siempre, pero copiar una dirección te permite llegar al mismo sitio.* Los primitivos nunca cambian fuera; los objetos cambian si los tocas, pero no puedes cambiarles el "punto de mira" desde dentro.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** para trazar una llamada, dibuja las cajas de los argumentos originales y las cajas de las copias del método. Después sigue quién apunta a quién.

**Ejercicio: la gran confusión**

Sin ejecutar, ¿qué imprime este programa?

```java
public class Caja {
    int valor;
}

public class Main {
    static void cambiar(Caja c, int n) {
        c.valor = 99;
        n = 7;
        c = new Caja();
        c.valor = 1;
    }

    public static void main(String[] args) {
        Caja miCaja = new Caja();
        miCaja.valor = 5;
        int numero = 5;

        cambiar(miCaja, numero);

        System.out.println(miCaja.valor);
        System.out.println(numero);
    }
}
```

<details>
<summary>🔄 Solución</summary>

Imprime **`99`** y **`5`**.

- `c.valor = 99` modifica el objeto compartido → el original se entera → **99**.
- `n = 7` cambia la copia del primitivo → el original sigue en **5**.
- `c = new Caja(); c.valor = 1;` cambia a qué apunta *la copia* `c`, pero `miCaja` sigue apuntando a la caja de 99. La reasignación no sale del método.

Tres instrucciones, tres comportamientos distintos. Este ejercicio tiene el examen escrito en la frente.

</details>

---

## ❓ ¡No hay preguntas tontas!

> **Q:** ¿Por qué no puedo sobrecargar cambiando solo el tipo de retorno? Parecería lógico.
>
> **A:** Porque Java elige el método mirando los **argumentos** de la llamada. Si dos métodos tienen los mismos parámetros pero distinto retorno, `calc.sumar(2, 3)` sería ambiguo: ¿cuál quiere el que llama? Java odia la ambigüedad más que a los lunes.

> **Q:** ¿Los constructores sobrecargados "heredan" algo entre sí?
>
> **A:** No heredan, pero se **encadenan** con `this(...)`. El constructor corto llama al largo, que hace el trabajo pesado. Así el código de inicialización se escribe una sola vez. Cuando veas un constructor de tres líneas que solo hace `this(...)`, es esa técnica en acción.

> **Q:** ¿Existe el "paso por referencia" en Java?
>
> **A:** No. Java **solo** tiene paso por valor. Lo que pasa es que con referencias se copia la dirección, y eso *parece* paso por referencia. Los puristas lo llaman "paso por valor de la referencia". En el examen, di que Java es siempre paso por valor.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué es sobrecargar un método?
2. ¿Qué NO puede cambiar para distinguir dos métodos con el mismo nombre?
3. ¿En Java el paso es por valor o por referencia?
4. Si un método recibe un objeto y lo modifica, ¿se nota fuera?

<details>
<summary>🔄 Respuestas</summary>

1. Declarar varios métodos con el **mismo nombre** pero distinta **lista de parámetros**.
2. El **tipo de retorno**: solo la firma (nombre + parámetros) desempata.
3. **Paso por valor** siempre: se copian los valores; con objetos se copia la dirección.
4. **Sí**, porque la copia de la referencia apunta al mismo objeto.

</details>

---

## ✅ Resumen en 3 frases

1. La **sobrecarga** permite varios métodos con el mismo nombre y distintos parámetros; el tipo de retorno no sirve para distinguirlos.
2. Java es **paso por valor**: los primitivos se copian y nunca cambian fuera; las referencias copian la dirección, así que puedes modificar el objeto pero no reasignarlo desde dentro.
3. Los **constructores** también se sobrecargan y se encadenan con `this(...)` para no repetir código.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Sobrecarga | Varios métodos con el mismo nombre y distinta firma |
> | Firma | Nombre + lista de parámetros |
> | Paso por valor | Se pasan copias, nunca los originales |
> | Copia de referencia | Se copia la dirección, no el objeto |
> | Encadenar constructores | Un constructor llama a otro con `this(...)` |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/06-poo-clases-objetos) · **Anterior:** [06 · Referencias, null y memoria](/ApuntesProgramacion/06-poo-clases-objetos/06-referencias-memoria) · **Siguiente:** [08 · Be the Code: diseña tu clase](/ApuntesProgramacion/06-poo-clases-objetos/08-be-the-code)