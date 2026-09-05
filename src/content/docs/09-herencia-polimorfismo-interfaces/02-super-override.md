---
title: "02 — super y @Override"
description: "Llamar a la superclase, sobrescribir métodos y encadenar constructores sin llorar 🧬"
---

<p><small>Llamar a la superclase, sobrescribir métodos y encadenar constructores sin llorar 🧬</small></p>

> 🗺️ **Estás en:** 🧬 **U09 · Herencia, Polimorfismo e Interfaces** → 02 · super y @Override

---

## 📬 La idea en una frase

> **`super` llama a la superclase (constructores y métodos) y `@Override` le dice al compilador que estás sobrescribiendo, no inventando.**

En el punto 1 viste que la hija "hereda". Pero heredar no es suficiente: a veces quieres que tu padre haga primero su parte y luego tú la tuya. Para eso existen `super` y `@Override`.

---

## 📞 super: llamando a mamá/papá para que te ayuden

`super` tiene dos usos, y conviene tenerlos claros:

### 1. `super(...)` para invocar el constructor del padre

```java
public class Vehiculo {
    private String marca;

    public Vehiculo(String marca) {
        this.marca = marca;
    }
}

public class Coche extends Vehiculo {
    private int puertas;

    public Coche(String marca, int puertas) {
        super(marca);          // ← configura la parte de Vehiculo
        this.puertas = puertas; // ← y luego lo tuyo
    }
}
```

Si el padre tiene un constructor con parámetros, **debes** llamarlo con `super(...)` y debe ser **la primera línea** del constructor hijo. Si no lo haces, el compilador intenta llamar a `super()` (sin argumentos)... que no existe. Error de compilación en el acto.

> ⚠️ **Advertencia:** `super(...)` solo sirve para invocar constructores y métodos de la superclase. No puedes pasarlo como parámetro ni asignarlo a una variable. Es un puntero "solo lectura" hacia arriba.

### 2. `super.metodo()` para llamar al método del padre

A veces queremos **extender** el método del padre, no reemplazarlo:

```java
public class Gato extends Animal {
    @Override
    public void hacerSonido() {
        super.hacerSonido();   // primero lo que hace Animal
        System.out.println("¡MIAU!");  // y luego lo mío
    }
}
```

`super` es como gritar "¡MAAAAMÁ!" en el supermercado: "ejecuta la versión de mi padre, y después yo hago lo mío".

---

## ✍️ @Override: "Papá, yo lo hago mejor"

`@Override` es una anotación que le dice al compilador: "asegúrate de que realmente estoy sobrescribiendo un método del padre":

```java
public class Pez extends Animal {
    @Override
    public void hacerSonido() { }  // ✓ existe en Animal

    @Override
    public void nadar() { }        // ✗ ERROR: no existe en Animal
}
```

La segunda línea no compila: el compilador verifica que `nadar()` exista en `Animal` y, como no existe, te avisa. Ese aviso a tiempo vale oro: si escribes mal el nombre o la firma de un método, `@Override` te lo descubre sin tener que esperar a un bug raro en runtime.

> 📝 **Nota:** `@Override` no es obligatorio, pero ponlo siempre. Es como el cinturón de seguridad: no pasa nada si no lo pones... hasta que pasa. Además, es la forma de decirle a quien lea tu código "esto es un override, no un método nuevo".

### Reglas de oro del override

1. La firma debe ser **idéntica** (nombre y parámetros).
2. El tipo de retorno debe ser el mismo o un subtipo (covariante).
3. No puedes reducir la visibilidad: `public` en el padre no puede volverse `protected` en la hija.
4. Los métodos `final` no se pueden sobrescribir; las clases `final` no pueden tener hijas.

---

## 🔒 final: cuando quieres bloquear la herencia

`final` es el freno de mano:

```java
public final class String { }        // no puede tener hijas

public class Vehiculo {
    public final void frenar() { }   // las hijas NO pueden sobrescribirlo
}
```

Úsalo cuando una clase o un método no debe modificarse. Por ejemplo, un método que forma parte del esqueleto de un algoritmo (lo verás en el template method del punto 7).

---

## 🏗️ Constructores en la herencia: la cadena de montaje

Cuando creas un objeto de la clase más profunda, se ejecutan **todos** los constructores de la cadena, del más general al más específico:

```java
public class Abuelo {
    public Abuelo() { System.out.println("Abuelo"); }
}
public class Padre extends Abuelo {
    public Padre() { super(); System.out.println("Padre"); }
}
public class Hijo extends Padre {
    public Hijo() { super(); System.out.println("Hijo"); }
}
// new Hijo() imprime: Abuelo / Padre / Hijo
```

Si no escribes `super()`, Java lo añade automáticamente al principio del constructor. Por eso la regla es: **el padre se construye primero, siempre**. Es como montar una casa: primero los cimientos, luego las paredes, luego el tejado.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** si el padre tiene constructor con parámetros, el hijo está obligado a llamarlo con `super(...)`. Si no, el compilador intenta el vacío... que no existe.

**El ejercicio clásico: ¿qué impide compilar esto?**

```java
public class Vehiculo {
    private String marca;

    public Vehiculo(String marca) {
        this.marca = marca;
    }

    public void arrancar() {
        System.out.println("Vehículo arrancado");
    }
}

public class Coche extends Vehiculo {
    private int puertas;

    public Coche(String marca, int puertas) {
        this.puertas = puertas;
    }

    @Override
    public void arrancar() {
        System.out.println("Coche arrancado con " + puertas + " puertas");
    }
}
```

**Pregunta:** ¿qué error impide que `Coche` compile?

<details>
<summary>🔄 Solución</summary>

El constructor de `Coche` no llama a `super(...)`. Como `Vehiculo` solo tiene `Vehiculo(String)`, el compilador no encuentra un `super()` sin argumentos y falla. La solución:

```java
public Coche(String marca, int puertas) {
    super(marca);
    this.puertas = puertas;
}
```

</details>

**Ejercicio: ¿qué imprime con herencia encadenada y super?**

```java
class Vehiculo {
    void describir() { System.out.println("Soy un vehículo"); }
}
class Coche extends Vehiculo {
    void describir() { System.out.println("Soy un coche"); }
    void describirCompleto() { super.describir(); this.describir(); }
}
class Deportivo extends Coche {
    void describir() { System.out.println("Soy un coche deportivo"); }
}

public class Test {
    public static void main(String[] args) {
        Deportivo d = new Deportivo();
        d.describirCompleto();
        d.describir();
    }
}
```

<details>
<summary>🔄 Solución</summary>

Imprime:

```
Soy un vehículo
Soy un coche deportivo
Soy un coche deportivo
```

`super.describir()` dentro de `Coche` va directo a `Vehiculo`. En cambio, `this.describir()` se resuelve en runtime con el objeto real, que es un `Deportivo`. Ese detalle es el polimorfismo, y le dedicarás el punto 4.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Cuáles son los dos usos de `super`?
2. ¿Qué le pides a `@Override`?
3. ¿Qué ocurre si el hijo no llama a `super(...)` y el padre no tiene constructor vacío?
4. ¿Puede una hija sobrescribir un método `final` del padre?

<details>
<summary>🔄 Respuestas</summary>

1. `super(...)` para llamar al constructor del padre y `super.metodo()` para llamar a un método del padre.
2. Que verifique en el compilador que realmente está sobrescribiendo un método existente.
3. Error de compilación: Java intenta `super()` sin argumentos y no existe.
4. No: `final` prohíbe la sobrescritura. Y una clase `final` ni siquiera puede tener hijas.

</details>

---

## ✅ Resumen en 3 frases

1. **`super`** encadena con la superclase: constructores y métodos, siempre como primera jugada.
2. **`@Override`** es tu red de seguridad: el compilador comprueba que el método sobrescrito existe.
3. Los **constructores** se ejecutan de arriba a abajo (padre primero) y los métodos `final` son intocables.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `super(...)` | Llamada al constructor de la superclase |
> | `super.metodo()` | Llamada a un método de la superclase |
> | `@Override` | Anotación que verifica la sobrescritura |
> | Sobrescribir | Redefinir un método heredado con otra implementación |
> | `final` | Bloquea la herencia de una clase o la sobrescritura de un método |
> | Cadena de constructores | El padre se construye siempre antes que el hijo |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/09-herencia-polimorfismo-interfaces) · **Anterior:** [01 · Herencia: cuando tus hijos siguen tus pasos](/ApuntesProgramacion/09-herencia-polimorfismo-interfaces/01-herencia) · **Siguiente:** [03 · protected y jerarquías de clases](/ApuntesProgramacion/09-herencia-polimorfismo-interfaces/03-protected-jerarquias)