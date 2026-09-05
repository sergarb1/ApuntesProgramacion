---
title: "09 — Repaso interactivo: domina las clases"
description: "El cierre práctico de la unidad, con objetos, constructores y un `null` que no va a funcionar 😈"
---

<p><small>El cierre práctico de la unidad, con objetos, constructores y un `null` que no va a funcionar 😈</small></p>

> 🗺️ **Estás en:** 🏗️ **U07 · POO: Clases y Objetos** → 09 · Repaso interactivo

---

## 📬 La idea en una frase

> **En este punto no aprendemos nada nuevo: lo convertimos todo en práctica. Y, como siempre, algo no va a funcionar.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaban de darte este programa para ejecutar:*

```java
public class Galleta {
    String sabor;

    public Galleta(String sabor) {
        this.sabor = sabor;
    }

    void comer() {
        System.out.println("Ñam, galleta de " + sabor);
    }
}

public class Main {
    public static void main(String[] args) {
        Galleta g1 = new Galleta("chocolate");
        Galleta g2 = new Galleta("vainilla");
        Galleta g3 = g1;
        g3.sabor = "limón";
        g1.comer();
        g2.comer();
    }
}
```

**¿Qué imprimes por pantalla? Elige sabiamente:**

1. **`Ñam, galleta de chocolate` y `Ñam, galleta de vainilla`** → Cada galleta guarda su sabor original, siempre. ❌
2. **`Ñam, galleta de limón` y `Ñam, galleta de vainilla`** → ✅ ¡Correcto! `g3 = g1` copia la referencia, no la galleta: `g3` y `g1` son la misma galleta. Cambiar el sabor con `g3` lo cambia para `g1`. `g2` es otra galleta, independiente.
3. **`Ñam, galleta de limón` y `Ñam, galleta de limón`** → El cambio de `g3` contamina a todas las galletas. ❌

> <details>
> <summary>🔄 Solución</summary>
>
> La opción **2**. La asignación `g3 = g1` crea un **alias**: dos variables, un objeto. Este es el ejercicio que separa a los que han entendido las referencias de los que van a llorar en el examen.
>
> </details>

---

## 🔥 Fireside Chat: Clase vs objeto

> *Dos veteranos del molde y la galleta discuten junto a la bandeja del horno.*

**Clase:** — Mira, yo soy el molde. Sin mí, tus objetos serían amorfos. Yo defino qué atributos y métodos tienen todos mis objetos. Soy la constitución de mi pueblo.

**Objeto:** — La constitución... claro, y yo soy el ciudadano que paga impuestos. Tú eres un archivo `.java` en el disco. Yo ocupo memoria, tengo saldo, puedo acelerar. Cuando ejecutan el programa, el que trabaja soy yo.

**Clase:** — ¿Y cuántos ciudadanos como tú puedo producir? Miles. Yo soy único, tú eres reproducible. Eres una copia, un clon, un *vulgar* duplicado.

**Objeto:** — Un duplicado con vida propia, sí. Tú defines el plano, pero yo soy el edificio. Nadie vive en un plano. Y te recuerdo: sin `new`, tú no eres más que teoría de archivo.

**Clase:** — Sin mí, `new` no tendría nada que fabricar. Nos necesitamos. Como el cortapastas y la galleta.

**Objeto:** — Trato hecho. Tú el molde, yo la galleta. Y que nadie se olvide de cuál se come al final.

> La lección: la **clase** es el diseño (QUÉ y CÓMO), el **objeto** es la instancia concreta (QUIÉN). Sin clase no hay objeto; sin `new`, la clase no da de comer.

---

## 🕵️ ¿Quién soy?

Adivina qué concepto de la unidad soy:

1. **Soy el molde que define atributos y métodos, pero no soy ninguna cosa concreta.**
2. **Soy la galleta: una cosa concreta, con valores propios, viviendo en la memoria.**
3. **Soy el método especial que se ejecuta con cada `new` para que el objeto nazca bien preparado.**
4. **Soy la referencia que no apunta a ningún objeto; usarme provoca el error más famoso de Java.**
5. **Soy la palabra que usa el objeto para hablar de sí mismo y deshacer líos de nombres.**
6. **Soy la dirección donde vive el objeto, la zona de memoria donde Java coloca las galletas.**

<details>
<summary>🔄 Respuestas</summary>

1. **La clase** — el cortapastas, el diseño.
2. **El objeto** — la instancia concreta creada con `new`.
3. **El constructor** — se llama igual que la clase y no devuelve nada.
4. **`null`** — usarla lanza `NullPointerException`.
5. **`this`** — la referencia al objeto actual.
6. **El heap** — la zona de memoria donde viven los objetos (la variable guarda la *referencia*).

</details>

---

## 🤬 CONRAD VS EL MUNDO: "Constructor, ¿dónde estás?"

> *CONRAD, nuestro compilador cascarrabias, opina sobre el clásico del novato.*

**CONRAD:** — ¡OTRA VEZ! Viene un alumno y me dice: *CONRAD, no compila*. Y yo: vale, ¿qué dice el error? *Pues no sé, no lo he leído.* ¡AY, MADRE MÍA! Pongo la línea exacta, el motivo y hasta la flechita `^`, ¿y no lo lees?

*Y luego está el clásico:* escriben un constructor con parámetros... y llaman a `new Clase()` sin argumentos. *¡Pero si tú mismo has borrado el constructor vacío!* Cuando escribes cualquier constructor, el vacío desaparece. Es como quitar la puerta de tu casa y luego intentar entrar por la puerta.

*Y el colmo de los colmos:* `Galleta g;` y luego `g.sabor = "chocolate"`. ¡Pero si `g` no apunta a NADA! No has hecho `new`. Eso es `NullPointerException` en el acto. Es como intentar ponerle un collar a un perro que no existe.

**La lección:** antes de acusar a Java de "odiarte", repasa el trío sagrado: **¿hice `new`? ¿el constructor existe con los argumentos que paso? ¿la referencia es `null`?** El 90% de los errores de esta unidad se arreglan con esas tres preguntas. El compilador no te odia: te está pasando las respuestas del examen.

---

## 🎮 El juego de las decisiones

Elige la respuesta correcta para cada decisión (respuestas al final):

1. ¿Cuántos objetos crea `Galleta a = new Galleta(); Galleta b = a;`?
   - a) 2   b) 1
2. ¿Qué imprime `System.out.println(new Galleta("chocolate").sabor);`?
   - a) `chocolate`   b) `null`
3. `Persona p;` sin `new`. ¿Cuánto vale `p`?
   - a) `0`   b) `null`
4. ¿Puedo escribir `int duplicar(int x)` y `double duplicar(int x)` en la misma clase?
   - a) Sí, cambia el retorno   b) No, misma firma

<details>
<summary>🔄 Soluciones</summary>

1. **b)** — `b = a` copia la referencia: un solo objeto, dos nombres.
2. **a)** — El objeto se crea, se inicializa su `sabor` con `"chocolate"` y se accede a él al instante.
3. **b)** — Las referencias sin inicializar valen `null`, no `0` (eso era para los primitivos).
4. **b)** — El tipo de retorno no forma parte de la firma: misma firma, error de compilación.

</details>

---

## ⚡ Laboratorio de tortura: la fábrica que llora

> **Duración estimada:** 30 minutos
> **Herramienta:** tu IDE y un archivo nuevo

**El escenario:** copia este programa y haz que funcione. Tiene **3 errores** que impiden que compile y 1 error de lógica que hace que el resultado sea incorrecto cuando lo arregles.

```java
public class Coche
    String marca;
    int velocidad;

    public Coche(String marca, int velocidad) {
        this.marca = marca;
        this.velocidad = velocidad;
    }

    void acelerar(int inc) {
        velocidad -= inc;
    }

    void mostrar() {
        System.out.println(marca + " va a " + velocidad);
    }

    public static void main(String[] args) {
        Coche c = new Coche();
        c.acelerar(50);
        c.mostrar()
    }
}
```

**Fallo intencionado:** uno de los errores parece correcto a simple vista porque "se ve bien", pero cambia por completo el comportamiento del programa.

**Tu tarea:** conseguir que compile, que ejecute y que **toda** la salida sea correcta. Si el resultado no cuadra, diagnostica.

**Pistas para cuando te frustres (no antes):**

1. ¿Hay algún `;` que falte? *no → sigue buscando.*
   <details><summary>¿Y si sigo atascado?</summary>Comprueba también las llaves `{}`: la clase necesita su apertura.</details>
2. ¿Compila ya? *no → mira el mensaje de error y los argumentos del constructor.*
   <details><summary>¿Y si sigo atascado?</summary>`new Coche()` no existe: el único constructor pide `(String, int)`. Es el error "el vacío desapareció".</details>
3. ¿Ejecuta pero la velocidad sale rara? *Es el error de lógica: el signo del método.*
   <details><summary>Solución final</summary>

Los **3 errores de compilación**:

1. Falta la `{` de apertura de la clase después de `Coche`.
2. `new Coche()` no coincide con el constructor: el único es `Coche(String, int)`. Al escribir un constructor con parámetros, el vacío desaparece.
3. Falta el `;` al final de `c.mostrar()`.

El **error de lógica**: `velocidad -= inc` **resta** en vez de sumar. Compila y ejecuta perfectamente, pero el coche acelera "hacia atrás": con la velocidad inicial a 0 y acelerar 50, imprime `Seat va a -50` en vez de `Seat va a 50`. Un signo separaba tu coche de la verdad.

```java
public class Coche {
    String marca;
    int velocidad;

    public Coche(String marca, int velocidad) {
        this.marca = marca;
        this.velocidad = velocidad;
    }

    void acelerar(int inc) {
        velocidad += inc;
    }

    void mostrar() {
        System.out.println(marca + " va a " + velocidad);
    }

    public static void main(String[] args) {
        Coche c = new Coche("Seat", 0);
        c.acelerar(50);
        c.mostrar();
    }
}
```

Salida correcta: `Seat va a 50`. Con la versión rota, una vez arreglados los otros errores, la velocidad salía `-50`: el signo era la pista del error de lógica.

</details>

---

## 🏆 Logros de esta unidad

| Logro | Cómo conseguirlo |
|---|---|
| 🏅 **El Cortapastas** | Explicar la diferencia entre clase y objeto con la analogía de las galletas sin mirar |
| 🏅 **Primera Clase** | Escribir una clase con atributos, constructor y métodos que funcione a la primera |
| 🏅 **Cazador de NPE** | Encontrar el `null` culpable de un `NullPointerException` sin pistas |
| 🏅 **El Desambiguador** | Explicar por qué hace falta `this` cuando hay choque de nombres |
| 🏅 **El Constructor Rudo** | Diseñar una clase con sobrecarga de constructores encadenados con `this(...)` |

---

## 🧠 Atrévete a pensar

1. **Sin ejecutar:** ¿qué imprime este programa?

```java
public class Cuenta {
    int saldo;

    void sumar(int x) {
        saldo += x;
    }
}

public class Main {
    public static void main(String[] args) {
        Cuenta a = new Cuenta();
        a.saldo = 100;
        Cuenta b = a;
        b.sumar(50);
        System.out.println(a.saldo);
    }
}
```

2. **El constructor perdido:** en el ejemplo `Galleta` del punto 2 (sin constructor), ¿qué le pasa al código si añades `public Galleta(String sabor)` y dejas `new Galleta()` en otro sitio?
3. **El detective del heap:** tu programa imprime `null` cuando esperabas un nombre. ¿Qué herramienta usas y qué miras primero?
4. **Verdadero o falso:** "si un método recibe un objeto y dentro del método hago `parametro = null`, el objeto original desaparece".

<details>
<summary>💡 Soluciones</summary>

1. **`150`**. `b = a` crea un alias: `b.sumar(50)` modifica la cuenta que también ve `a`.
2. **Error de compilación** en `new Galleta()`: al escribir un constructor con parámetros, el constructor vacío desaparece.
3. El **depurador**: pon un breakpoint donde se asigna el nombre y observa si el objeto llegó a crearse con `new` o si el atributo quedó en `null`. (O lee el stack trace si hay un NPE.)
4. **Falso.** `parametro = null` solo cambia la *copia* de la referencia: el objeto original sigue vivo mientras otra variable lo apunte. Para que desaparezca, ninguna referencia debe apuntarle.

</details>

---

## 🧩 Crucigrama de bits

```
Horizontal:
1. Operador que fabrica objetos en memoria (3 letras)
3. El método que prepara al objeto al nacer (11 letras)
5. Referencia que no apunta a nada (4 letras)
6. Zona de memoria donde viven los objetos (4 letras)

Vertical:
2. Palabra que usa el objeto para hablar de sí mismo (4 letras)
4. El molde que define atributos y métodos (5 letras)
```

<details>
<summary>📝 Soluciones</summary>

**Horizontal:** 1. NEW · 3. CONSTRUCTOR · 5. NULL · 6. HEAP
**Vertical:** 2. THIS · 4. CLASE

</details>

---

## 💬 Preguntas de entrevista de trabajo

> Preguntas reales que te harían para programador Java junior.

1. **"Explícame, como si yo fuera tu abuela, la diferencia entre una clase y un objeto."**
2. **"¿Qué hace `new` por dentro cuando creas un objeto?"**
3. **"¿Por qué `String` se compara con `equals` y no con `==`?"**
4. **"¿Java pasa los argumentos por valor o por referencia? Justifica con un ejemplo de objeto."**
5. **"Si dos variables apuntan al mismo objeto y una le cambia un atributo, ¿qué ve la otra?"**
6. **"¿Para qué sirve sobrecargar un constructor y cómo lo encadenas con `this`?"**

---

## 🤷 No hay preguntas tontas

> ❓ **¿Puedo escribir varias clases en un mismo archivo `.java`?**

Sí, pero solo una puede ser `public` (la que da nombre al archivo). Las demás van sin `public`. Para los proyectos de clase, un archivo = una clase pública, y cada clase en su archivo. Tus profesores lo agradecerán.

---

> ❓ **¿Por qué a veces veo `get` y `set` antes de los nombres de métodos, como `getSaldo()`?**

Esa es la convención de los **getters y setters**: métodos para leer (`getSaldo`) y modificar (`setSaldo`) atributos de forma controlada. Suena a burocracia, pero es la base de la **encapsulación**, y tiene su unidad entera: la U08. Aquí los verás de refilón; allí los dominarás.

---

> ❓ **¿Puedo tener un método llamado igual que el constructor?**

No. El constructor siempre se llama igual que la clase y no devuelve nada. Un método normal no puede tener el nombre de la clase (a menos que sea... un constructor, que se detecta por la falta de tipo de retorno). Si intentas añadirle un `void` delante al constructor, Java te mirará raro.

---

## 🎬 Poscréditos

La programadora termina su fábrica de galletas virtual: una clase `Galleta` con constructor, una clase `Horno` que la instancia, y un `main` que hornea cinco galletas distintas. Cada una con su sabor. Hasta que, en la última línea, se le escapa un `null` y todo se apaga con un `NullPointerException`.

Se acerca CONRAD, el compilador cascarrabias, con su taza humeante.

**CONRAD:** — Cinco galletas, cinco objetos, y solo un `null` para estropearlo todo. Típico. ¿Sabes qué ha pasado?

**Programadora:** — No hice `new`. La referencia apuntaba al vacío.

**CONRAD:** — *asiente* Ves. Cuando entiendes qué guarda una variable, los errores dejan de ser magia. Clase, objeto, constructor, `this`, referencias... Ya no escribes recetas, creas mundos. Pero esto no ha hecho más que empezar.

**Programadora:** — ¿Qué más hay?

**CONRAD:** — *toma un sorbo* Ahora tus atributos están al aire. Cualquiera los toca. La próxima parada es saber quién tiene permiso para entrar y quién no. Espérame, que voy a disfrutar viéndote proteger tus datos.

**PRÓXIMAMENTE EN U08:** Visibilidad, encapsulación y `static`. El momento en el que tus objetos aprenden a decir "eso no se toca". 🔒

---

📚 [Volver al índice de la unidad](/ApuntesProgramacion/07-poo-clases-objetos) · **Anterior:** [08 · Be the Code: diseña tu clase](/ApuntesProgramacion/07-poo-clases-objetos/08-be-the-code) · **Siguiente:** **[U08 · Visibilidad, Encapsulación y Static](/ApuntesProgramacion/08-visibilidad-encapsulacion-static)**