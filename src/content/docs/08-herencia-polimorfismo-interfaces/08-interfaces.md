---
title: "08 — Interfaces: el contrato que firmas"
description: "implements, polimorfismo con interfaces, métodos default y la gran decisión abstract vs interface 🧬"
---

<p><small>implements, polimorfismo con interfaces, métodos default y la gran decisión abstract vs interface 🧬</small></p>

> 🗺️ **Estás en:** 🧬 **U08 · Herencia, Polimorfismo e Interfaces** → 08 · Interfaces: el contrato que firmas

---

## 📬 La idea en una frase

> **Una interfaz es un contrato: declara qué métodos debe tener una clase (con `implements`), sin decir cómo implementarlos, y permite que una clase firme varios contratos a la vez.**

¿Has firmado un contrato? "El trabajador se compromete a: programar en Java, no dormirse en las reuniones..." pero no dice CÓMO. Una **interfaz** en Java es eso: un contrato.

---

## ✍️ Declarando e implementando

```java
public interface Reproducible {
    void reproducir();
    void pausar();
    void detener();
    int obtenerDuracion();
}

public class Cancion implements Reproducible {
    private String titulo;

    public Cancion(String titulo) {
        this.titulo = titulo;
    }

    @Override public void reproducir() { System.out.println("🎵 Reproduciendo: " + titulo); }
    @Override public void pausar() { System.out.println("⏸ Canción pausada"); }
    @Override public void detener() { System.out.println("⏹ Canción detenida"); }
    @Override public int obtenerDuracion() { return 240; }
}
```

Cualquier clase que firme el contrato (con `implements`) **TIENE** que implementar todos esos métodos. El cómo es cosa suya.

> 📝 **Nota:** los métodos de una interfaz son `public abstract` implícitamente (no hace falta escribirlo). Y sus atributos son `public static final`: constantes, no estado.

---

## 🎭 Polimorfismo con interfaces

Una interfaz también puede ser el tipo de una referencia polimórfica:

```java
import java.util.ArrayList;
import java.util.List;

public class Reproductor {
    public static void main(String[] args) {
        List<Reproducible> lista = new ArrayList<>();
        lista.add(new Cancion("Bohemian Rhapsody"));
        lista.add(new Pelicula("Inception"));

        for (Reproducible r : lista) {
            r.reproducir(); // no sabe si es canción o película
        }
    }
}
```

El `Reproductor` solo conoce el contrato `Reproducible`. Da igual si mañana llega un `Podcast` o un `Audiolibro`: mientras firmen el contrato, entran en la lista sin tocar una línea. Es el polimorfismo del punto 4, pero con contratos en vez de herencia.

---

## 🏊 Múltiples interfaces

Aquí está la gran ventaja sobre la herencia: una clase solo extiende **UNA** clase, pero puede implementar **VARIAS** interfaces:

```java
public interface Nadador { void nadar(); }
public interface Corredor { void correr(); }

public class Triatleta implements Nadador, Corredor {
    @Override public void nadar() { System.out.println("🏊 Nadando 1.5 km"); }
    @Override public void correr() { System.out.println("🏃 Corriendo 10 km"); }
}
```

Un `Triatleta` es nadador Y corredor. Con herencia múltiple esto sería el famoso *problema del diamante*; con interfaces, firmar dos contratos no rompe nada.

---

## 🩹 default Methods: parches sin romper nada

Antes de Java 8, añadir un método a una interfaz **rompía** todas las clases que la implementaban. Llegaron los métodos `default`:

```java
public interface Volable {
    void volar();

    default void despegar() {
        System.out.println("🛫 Despegando...");
    }
}

public class Avion implements Volable {
    @Override public void volar() { System.out.println("✈️ Volando a 900 km/h"); }
    // despegar() ya viene implementada: no estás obligado a tocarla
}
```

Un método `default` es una implementación "por defecto": la clase puede usarla tal cual o sobrescribirla. Es una evolución del contrato sin romper a los que ya firmaron.

### ¿Y si dos interfaces tienen el mismo `default`?

Conflicto. La clase está obligada a sobrescribir y decidir:

```java
interface Guerrero { default void atacar() { System.out.println("Ataca con espada"); } }
interface Mago { default void atacar() { System.out.println("Lanza hechizo"); } }

class Personaje implements Guerrero, Mago {
    @Override
    public void atacar() {
        Guerrero.super.atacar();
        Mago.super.atacar();
        System.out.println("¡Y usa ambas!");
    }
}
```

Imprime: `Ataca con espada`, `Lanza hechizo`, `¡Y usa ambas!`. La sintaxis `Interfaz.super.metodo()` llama a la implementación concreta de cada contrato.

---

## ⚖️ La gran decisión: abstract class vs interface

| Aspecto | Clase abstracta | Interfaz |
|---|---|---|
| Métodos con código | Sí | Sí (default) |
| Atributos | Cualquiera | `public static final` |
| Herencia múltiple | No (un `extends`) | Sí (varios `implements`) |
| Constructores | Sí | No |
| Estado (atributos de instancia) | Sí | No |
| Cuándo usarla | Compartir código + forzar métodos en una familia | Definir capacidades/contratos reutilizables |

> 💡 **Consejo:** usa **clase abstracta** para "es-un" con código compartido (una familia que comparte implementación). Usa **interfaz** para "puede-hacer" (capacidades que no dependen de la jerarquía: `Pato implements Volable, Cantable`). Si puedes, prefiere la interfaz: es más flexible.

---

## 🥊 EL RING: extends vs implements

Dos palabras clave discuten sobre quién es más importante.

**extends:** «Yo soy la herencia pura. Código reutilizado, una jerarquía clara. `Perro extends Animal`, `Coche extends Vehiculo`. ¡Soy la base de la POO!»

**implements:** «Sí, pero conmigo no hay límites. Una clase implementa varias interfaces. Con `extends` solo tienes un padre. Yo te permito ser varias cosas a la vez: `Serializable`, `Comparable`, `Cloneable`...»

**extends:** «Mis clases pueden tener código ya hecho. Tú solo declaras métodos vacíos. ¡Yo aporto implementación!»

**implements:** «Desde Java 8 tengo métodos `default` y `static`. Mira: `default void log()` ya funciona. Además, soy más flexible: no impongo una jerarquía rígida.»

**extends:** «Vale, pero sin mí las interfaces no tendrían sentido. Una interfaz no puede instanciarse sola.»

**implements:** «Y sin mí tendrías herencia múltiple, que es un caos. Mira el problema del diamante en C++.»

**extends:** «Nos necesitamos.»

**implements:** «Sí. `extends` para la jerarquía, `implements` para los contratos.»

> 🕶️ **Don Tip:** se pueden combinar: `class Perro extends Animal implements Mascota, Jugable`. Primero el `extends` (un padre), después los `implements` (varios contratos).

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `implements` es un contrato: la clase se compromete a tener TODOS los métodos de la interfaz. Nada de "casi todos".

**Ejercicio: ¿compila?**

```java
public interface Cantante { void cantar(); }
public interface Bailarin { void bailar(); }

public class Artista implements Cantante, Bailarin {
    @Override public void cantar() { System.out.println("canta"); }
    // ¡FALTA bailar()!
}
```

<details>
<summary>🔄 Solución</summary>

**NO compila.** Al implementar `Cantante` y `Bailarin`, `Artista` debe implementar `cantar()` Y `bailar()`. Firmar un contrato no admite cláusulas "a medias".

</details>

**Ejercicio: ¿qué imprime?**

```java
interface Guerrero { default void atacar() { System.out.println("Ataca con espada"); } }
interface Mago { default void atacar() { System.out.println("Lanza hechizo"); } }

class Personaje implements Guerrero, Mago {
    @Override
    public void atacar() {
        Guerrero.super.atacar();
        Mago.super.atacar();
        System.out.println("¡Y usa ambas!");
    }
}

public class Test {
    public static void main(String[] args) {
        new Personaje().atacar();
    }
}
```

<details>
<summary>🔄 Solución</summary>

```
Ataca con espada
Lanza hechizo
¡Y usa ambas!
```

El conflicto de `default` se resuelve sobrescribiendo y llamando a cada `Interfaz.super.metodo()`. Sin ese override, `Personaje` no compilaría.

</details>

**Ejercicio: la clase que implementa dos contratos**

```java
public interface Nadador { void nadar(); }
public interface Corredor { void correr(); }

public class Triatleta implements Nadador, Corredor {
    @Override public void nadar() { System.out.println("🏊 Nadando"); }
    @Override public void correr() { System.out.println("🏃 Corriendo"); }
}
```

¿Puedes usar un `Triatleta` donde se espera un `Nadador`? ¿Y donde se espera un `Object`?

<details>
<summary>🔄 Solución</summary>

Sí a ambas. `Triatleta` IS-A `Nadador`, IS-A `Corredor` e IS-A `Object`. Las referencias `Nadador n = new Triatleta()`, `Corredor c = new Triatleta()` y `Object o = new Triatleta()` son todas válidas. Cada referencia solo expone su propio contrato.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué palabra usa una clase para firmar un contrato?
2. ¿Cuántas clases puede extender y cuántas interfaces puede implementar una clase?
3. ¿Qué son los métodos `default` y para qué sirven?
4. ¿Cuándo eliges una interfaz en vez de una clase abstracta?

<details>
<summary>🔄 Respuestas</summary>

1. `implements`: `class Cancion implements Reproducible`.
2. Una sola clase (extends), pero varias interfaces (implements).
3. Métodos con implementación por defecto en una interfaz: permiten evolucionar el contrato sin romper a las implementaciones existentes.
4. Cuando defines una capacidad ("puede-hacer") reutilizable, no una jerarquía con código compartido. Y si necesitas herencia múltiple de contratos, la interfaz es la única vía.

</details>

---

## ✅ Resumen en 3 frases

1. Una **interfaz** es un contrato: la clase que la implementa debe aportar todos sus métodos.
2. Las interfaces permiten **polimorfismo** y **múltiples contratos**, con métodos `default` para evolucionar sin romper nada.
3. Regla práctica: **clase abstracta** para familias con código compartido, **interfaz** para capacidades flexibles.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Interfaz | Contrato de métodos que la clase debe implementar |
> | `implements` | La palabra que firma el contrato |
> | Método `default` | Implementación por defecto que la clase puede heredar |
> | Contrato múltiple | Una clase puede implementar varias interfaces |
> | `Interfaz.super.metodo()` | Cómo resolver conflictos entre `default` |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces) · **Anterior:** [07 · Clases abstractas](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/07-clases-abstractas) · **Siguiente:** [09 · Repaso interactivo](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/09-repaso-interactivo)