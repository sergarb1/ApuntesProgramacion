---
title: "09 — Repaso interactivo: domina la herencia"
description: "El cierre práctico de la unidad, con polimorfismo, contratos y una herencia que no va a funcionar 😈"
---

<p><small>El cierre práctico de la unidad, con polimorfismo, contratos y una herencia que no va a funcionar 😈</small></p>

> 🗺️ **Estás en:** 🧬 **U09 · Herencia, Polimorfismo e Interfaces** → 09 · Repaso interactivo

---

## 📬 La idea en una frase

> **En este punto no aprendemos nada nuevo: lo convertimos todo en práctica. Y, como siempre, algo no va a funcionar.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaban de darte este programa para ejecutar:*

```java
public class Animal {
    public void hacerSonido() { System.out.println("..."); }
}

public class Perro extends Animal {
    public void hacerSonido() { System.out.println("¡Guau!"); }
    public void moverCola() { System.out.println("*mueve la cola*"); }
}

public class Gato extends Animal {
    public void hacerSonido() { System.out.println("¡Miau!"); }
}

public class Main {
    public static void main(String[] args) {
        Animal a1 = new Perro();
        Animal a2 = new Gato();
        a1.hacerSonido();
        a2.hacerSonido();
        // a1.moverCola();  <- ¿compila?
    }
}
```

**¿Qué imprimes por pantalla? Elige sabiamente:**

1. **`...` y `...`** → La variable es `Animal`, así que se ejecuta el método de `Animal`. ❌
2. **`¡Guau!` y `¡Miau!`** → ✅ ¡Correcto! El polimorfismo ejecuta el método del objeto real, no el de la referencia.
3. **`¡Guau!` y un error** → `a2` no puede ser un `Gato`. ❌

> <details>
> <summary>🔄 Solución</summary>
>
> La opción **2**. `a1.hacerSonido()` ejecuta la versión de `Perro`; `a2.hacerSonido()`, la de `Gato`. La línea comentada `a1.moverCola()` **no compila**: la referencia es `Animal` y `Animal` no tiene `moverCola()`. Compilador y JVM, cada uno a lo suyo.
>
> </details>

---

## 🔥 Fireside Chat: Clase abstracta vs Interfaz

> *Dos veteranos de la POO discuten junto a la pizarra mientras una subclase los mira.* 

**Clase abstracta:** — Yo soy el boceto. Defino el esqueleto y comparto código: mis hijos se ahorran escribir lo aburrido. `Figura` con `calcularArea()` abstracto y `mostrarColor()` ya hecho. Soy la familia que hereda.

**Interfaz:** — La familia hereda de uno solo. Yo firmo contratos a mansalva. Un `Pato` implementa `Volable` Y `Nadador` al mismo tiempo. ¿Cuántos `extends` le dejas tú al pobre pato?

**Clase abstracta:** — Pero yo tengo estado. Atributos `protected`, constructores, métodos concretos con lógica de verdad. Tú solo declaras "esto tiene que existir".

**Interfaz:** — Desde Java 8 tengo métodos `default` con implementación. Y soy la base del polimorfismo moderno: `List<Reproducible>`, `Comparable`, `Runnable`... Toda la API de Java está llena de mí.

**Clase abstracta:** — Sin mí, no tendrías familias con código compartido. El template method, ¿quién lo hace?

**Interfaz:** — Y sin mí tendrías el problema del diamante. Nos complementamos.

**Clase abstracta:** — Eso es verdad. Yo para las familias.

**Interfaz:** — Yo para las capacidades. ¿Trato?

> La lección: usa **clase abstracta** cuando haya una familia con código compartido (es-un); usa **interfaz** cuando quieras capacidades reutilizables (puede-hacer). Y se pueden combinar: `class Perro extends Animal implements Mascota, Jugable`.

---

## 🕵️ ¿Quién soy?

Adivina qué concepto de la unidad soy:

1. **Soy la palabra que hace que una clase hija obtenga todo lo de su padre.**
2. **Soy la anotación que le dice al compilador "verifica que estoy sobrescribiendo, no inventando".**
3. **Soy la llamada que configura la parte del padre antes de que el hijo haga lo suyo.**
4. **Soy el mecanismo por el que `Animal a = new Perro()` ejecuta el sonido del perro.**
5. **Soy el operador que pregunta "¿eres realmente un Perro?" antes de convertir.**
6. **Soy el contrato que una clase firma con `implements` y que admite varios a la vez.**
7. **Soy la clase abstracta que define el esqueleto de un algoritmo y deja que las hijas rellenen los detalles.**

<details>
<summary>🔄 Respuestas</summary>

1. **`extends`** — establece la herencia.
2. **`@Override`** — verificación en compilación de la sobrescritura.
3. **`super(...)`** — el constructor del padre se ejecuta primero, siempre.
4. **El polimorfismo (dynamic binding)** — la JVM decide en runtime.
5. **`instanceof`** — y después el downcasting seguro.
6. **La interfaz** — varios `implements`, un solo `extends`.
7. **El template method** — el patrón de las clases abstractas en acción.

</details>

---

## ⚖️ Verdadero o falso

1. **"Si `Animal` tiene un método `public`, una subclase puede hacerlo `private`."**
2. **"`super.metodo()` se puede llamar desde cualquier línea del método."**
3. **"Una clase puede implementar tres interfaces y extender una clase."**
4. **"Los atributos también son polimórficos: `ref.x` usa el de la clase real del objeto."**
5. **"Sobrescribir `equals()` sin `hashCode()` es un error de compilación."**

<details>
<summary>🔄 Soluciones</summary>

1. **Falso.** No puedes reducir la visibilidad al sobrescribir: `public` no puede volverse `protected` ni `private`.
2. **Falso.** `super(...)` (constructor) debe ser la primera línea. `super.metodo()` puede ir donde quieras, pero la afirmación mezcla ambos.
3. **Verdadero.** Un `extends` + varios `implements`: `class Perro extends Animal implements Mascota, Jugable`.
4. **Falso.** Los métodos son polimórficos; los atributos se resuelven por el tipo de la referencia (shadowing).
5. **Falso.** Compila perfectamente. El problema es que las colecciones hash (`HashSet`, `HashMap`) se comportan mal en runtime.

</details>

---

## ⚡ Laboratorio de tortura: la herencia que llora

> **Duración estimada:** 30 minutos
> **Herramienta:** tu IDE y un archivo nuevo

**El escenario:** copia este programa y haz que funcione. Tiene **3 errores** que impiden que compile y 1 error de lógica que hace que el resultado sea incorrecto cuando lo arregles.

```java
public class Vehiculo
    protected int velocidad;

    public Vehiculo(int velocidad) {
        this.velocidad = velocidad;
    }

    void mover() { System.out.println("Vehículo a " + velocidad + " km/h"); }
}

public class Coche extends Vehiculo {
    private int puertas;

    public Coche(int velocidad, int puertas) {
        this.velocidad = puertas;
        this.puertas = velocidad;
    }

    @Override
    void mover() {
        super.mover();
        System.out.println("Coche con " + puertas + " puertas");
    }

    public static void main(String[] args) {
        Vehiculo v = new Coche(120, 5);
        v.mover()
    }
}
```

**Fallo intencionado:** uno de los errores parece correcto a simple vista porque "se ve bien", pero cambia por completo el comportamiento del programa.

**Tu tarea:** conseguir que compile, que ejecute y que **toda** la salida sea correcta. Si el resultado no cuadra, diagnostica.

**Pistas para cuando te frustres (no antes):**

1. ¿Hay algún `;` o `{` que falte? *no → sigue buscando.*
   <details><summary>¿Y si sigo atascado?</summary>La clase `Vehiculo` necesita su llave de apertura `{` justo después del nombre.</details>
2. ¿Compila ya? *no → mira el mensaje de error y los constructores.*
   <details><summary>¿Y si sigo atascado?</summary>`Vehiculo` solo tiene constructor con parámetros: `Coche` debe llamarlo con `super(velocidad)` como primera línea. Sin eso, el compilador busca un `super()` vacío que no existe.</details>
3. ¿Ejecuta pero los números salen cambiados? *Es el error de lógica: el constructor intercambia los valores.*
   <details><summary>Solución final</summary>

Los **3 errores de compilación**:

1. Falta la `{` de apertura de la clase `Vehiculo`.
2. El constructor de `Coche` no llama a `super(velocidad)`. Al escribir cualquier constructor en el padre, el vacío desaparece.
3. Falta el `;` al final de `v.mover()`.

El **error de lógica**: en el constructor, las asignaciones están cruzadas:

```java
this.velocidad = puertas;   // ¡mal! velocidad debería ser 120
this.puertas = velocidad;   // ¡mal! puertas debería ser 5
```

Compila y ejecuta perfectamente, pero intercambia los valores. Código corregido:

```java
public class Vehiculo {
    protected int velocidad;

    public Vehiculo(int velocidad) {
        this.velocidad = velocidad;
    }

    void mover() { System.out.println("Vehículo a " + velocidad + " km/h"); }
}

public class Coche extends Vehiculo {
    private int puertas;

    public Coche(int velocidad, int puertas) {
        super(velocidad);
        this.puertas = puertas;
    }

    @Override
    void mover() {
        super.mover();
        System.out.println("Coche con " + puertas + " puertas");
    }

    public static void main(String[] args) {
        Vehiculo v = new Coche(120, 5);
        v.mover();
    }
}
```

Salida correcta:

```
Vehículo a 120 km/h
Coche con 5 puertas
```

Con la versión rota, una vez arreglados los otros errores, la salida era `Vehículo a 5 km/h` y `Coche con 120 puertas`: dos líneas cambiadas por un constructor cruzado.

</details>

---

## 🏆 Logros de esta unidad

| Logro | Cómo conseguirlo |
|---|---|
| 🏅 **El Heredero** | Explicar qué se hereda y qué no (private, constructores) sin mirar la tabla |
| 🏅 **El Sobrescribiente** | Usar `@Override` + `super` para extender un método del padre con sentido |
| 🏅 **El Camaleón** | Resolver un problema de colecciones con polimorfismo sin usar `instanceof` |
| 🏅 **El Notario** | Decidir cuándo usar clase abstracta e interfaz y justificarlo |
| 🏅 **El Genealogista** | Diseñar una jerarquía de 3 niveles con `toString()`, `equals()` y `hashCode()` |

---

## 🧠 Atrévete a pensar

1. **Sin ejecutar:** ¿qué imprime este programa?

```java
class A { void mensaje() { System.out.println("A"); } }
class B extends A { void mensaje() { System.out.println("B"); } }
class C extends B { }

public class Test {
    public static void main(String[] args) {
        A r1 = new B();
        A r2 = new C();
        B r3 = new C();
        r1.mensaje();
        r2.mensaje();
        r3.mensaje();
    }
}
```

2. **El constructor perdido:** `Animal` tiene solo `Animal(String nombre)`. ¿Qué le pasa a `Perro extends Animal` si su constructor no llama a `super`?
3. **El detective del equals:** tu `HashSet` contiene dos objetos que son `equals()` entre sí... ¿qué has olvidado sobrescribir?
4. **Verdadero o falso:** "`a instanceof Perro` es `true` si `a` es de tipo `Animal` y el objeto real es un `Perro`."

<details>
<summary>💡 Soluciones</summary>

1. **`B`, `C`, `C`**. Solo importa el tipo real del objeto (`B`, `C`, `C`); la referencia (`A`, `A`, `B`) no decide nada.
2. **Error de compilación**: Java intenta `super()` sin argumentos y no existe. Hay que llamar a `super(nombre)` como primera línea.
3. **`hashCode()`**. Si `equals()` dice que son iguales pero `hashCode()` difiere, el `HashSet` los mete en cajones distintos.
4. **Verdadero.** `instanceof` mira el tipo real del objeto: `Perro` es un `Animal`, y el objeto real es un `Perro`, así que es `true`.

</details>

---

## 🧩 Crucigrama de bits

```
Horizontal:
1. La palabra que establece la herencia (7 letras)
3. La anotación que verifica que sobrescribes (8 letras)
5. El contrato que firmas con implements (10 letras)
6. Excepción al convertir un Gato en Perro (18 letras)

Vertical:
2. La clase de la que todos heredan (6 letras)
4. La palabra que llama al método del padre (5 letras)
```

<details>
<summary>📝 Soluciones</summary>

**Horizontal:** 1. EXTENDS · 3. OVERRIDE · 5. INTERFACE · 6. CLASSCASTEXCEPTION
**Vertical:** 2. OBJECT · 4. SUPER

</details>

---

## 💬 Preguntas de entrevista de trabajo

> Preguntas reales que te harían para programador Java junior.

1. **"Explícame, como si yo fuera tu abuela, la diferencia entre herencia y composición."**
2. **"¿Qué hace `super()` en un constructor y por qué debe ser la primera línea?"**
3. **"¿Cuándo usarías una clase abstracta y cuándo una interfaz?"**
4. **"¿Por qué `ArrayList<Animal>` puede guardar `Perro` y `Gato` pero no al revés?"**
5. **"¿Qué excepción lanzas al hacer `(Perro) gato` y cómo la evitas?"**
6. **"¿Por qué `equals()` y `hashCode()` van siempre juntos?"**

---

## 🤷 No hay preguntas tontas

> ❓ **¿Puedo heredar de varias clases a la vez?**

No. Java no permite herencia múltiple (el *problema del diamante*). Pero por eso existen las interfaces: puedes implementar tantas como quieras.

---

> ❓ **¿Qué pasa si una clase hija tiene un atributo con el mismo nombre que el padre?**

Se dice que lo **oculta** (shadowing). Pero ojo: los atributos no son polimórficos. Si usas una referencia de la superclase, ves el de la superclase; si usas una de la subclase, ves el de la subclase. Mejor no jugar a eso: nombra las cosas distinto.

---

> ❓ **¿Y los métodos `final`? ¿No se pueden sobrescribir?**

Exacto. Un método `final` queda congelado: las hijas lo heredan pero no pueden cambiarlo. Y una clase `final` (como `String`) no puede tener hijas. Es la decisión de diseño "esto no se toca".

---

## 🎬 Poscréditos

La programadora termina su simulador de zoológico virtual: una clase abstracta `Animal`, un `Perro` y un `Gato` que la implementan, y un `ArrayList<Animal>` que los mete a todos en la misma jaula. Hasta que, en la última línea, intenta convertir un gato en perro y todo explota con una `ClassCastException`.

Se acerca CONRAD, el compilador cascarrabias, con su taza humeante.

**CONRAD:** — Otra vez. Un gato disfrazado de perro. ¿Sabes lo que te ha faltado?

**Programadora:** — ¿El `instanceof`?

**CONRAD:** — *asiente* Ves. Cuando entiendes quién es realmente cada objeto, los errores dejan de ser magia. Herencia, `super`, polimorfismo, contratos... Ya no escribes clases, diseñas familias y firmas acuerdos.

**Programadora:** — ¿Y ahora qué toca?

**CONRAD:** — *toma un sorbo* Ahora que tienes jerarquías enteras, necesitas guardarlas en montones. Y no, no vale una caja para cada cosa. Te presentaré unas estructuras que guardan animales, figuras y hasta contratos con elegancia.

**PRÓXIMAMENTE EN U10:** Colecciones. El momento en el que tus jerarquías aprenden a guardarse en listas, conjuntos y mapas. 📚

---

📚 [Volver al índice de la unidad](/ApuntesProgramacion/09-herencia-polimorfismo-interfaces) · **Anterior:** [08 · Interfaces: el contrato que firmas](/ApuntesProgramacion/09-herencia-polimorfismo-interfaces/08-interfaces) · **Siguiente:** **[U10 · Colecciones](/ApuntesProgramacion/10-colecciones)**