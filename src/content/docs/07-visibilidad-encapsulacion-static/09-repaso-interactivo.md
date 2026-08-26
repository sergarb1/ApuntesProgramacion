---
title: "09 — Repaso interactivo: blindalo todo"
description: "El cierre práctico de la unidad, con candados, estáticos y una clase que no va a querer compilar 😈"
---

<p><small>El cierre práctico de la unidad, con candados, estáticos y una clase que no va a querer compilar 😈</small></p>

> 🗺️ **Estás en:** 🔒 **U07 · Visibilidad, Encapsulación y Static** → 09 · Repaso interactivo

---

## 📬 La idea en una frase

> **En este punto no aprendemos nada nuevo: lo convertimos todo en práctica. Y, como siempre, algo no va a querer compilar.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaban de darte este programa para ejecutar:*

```java
public class Estudiante {
    public static int total = 0;
    private int id;

    public Estudiante() {
        id = ++total;
    }

    public int getId() {
        return id;
    }
}
```

```java
public class Misterio {
    public static void main(String[] args) {
        Estudiante a = new Estudiante();
        Estudiante b = new Estudiante();
        Estudiante c = new Estudiante();

        System.out.println(c.getId());
        System.out.println(Estudiante.total);
    }
}
```

**¿Qué imprime por pantalla? Elige sabiamente:**

1. **`3` y `3`** → ✅ ¡Correcto! Cada `new` incrementa el `static total`, y el tercer estudiante se lleva el `id = 3`. Además `total` (estático, de la clase) también vale 3: una sola copia para todos.
2. **`1` y `3`** → El `static` sería "de cada objeto", pero no: `total` es de la clase, una sola copia. ❌
3. **`3` y `0`** → El constructor sí incrementa `total`, no lo deja en 0. ❌

> <details>
> <summary>🔄 Solución</summary>
>
> La opción **1**. `total` es un contador `static` que sube con cada constructor; `id` es de instancia y se lleva el valor de `total` en el momento de nacer. Es el patrón "contador + id autoincremental" del punto 5.
>
> </details>

---

## 🔥 Fireside Chat: la clase y el objeto

> *Dos veteranos de la POO discuten junto a la máquina de café.*

**Clase:** — Yo soy el molde. Defino atributos, métodos, la estructura. Sin mí no hay nada que instanciar.

**Objeto:** — Y yo soy la galleta, el resultado real. Yo guardo los datos: mi `nombre`, mi `id`. Tú solo eres el plano.

**Clase:** — Planos, planos... ¿Y quién tiene el contador de cuántas galletas hay? ¡Yo! `static int total`. Eso es mío, y todos los objetos lo compartís.

**Objeto:** — Compartimos, sí, pero yo tengo mi `id` único. Mi `nombre`, mi saldo. No me toques mis atributos de instancia.

**Clase:** — Precisamente por eso los declaré `private`. Para que ni tú te los toques: solo a través de mis getters y setters. Yo soy el portero.

**Objeto:** — Vale, pero sin mí, tus setters no tienen a quién validar. Necesitas un objeto para que la fiesta exista.

**Clase:** — *suspira* Por eso el `main` es `static`: para que yo pueda arrancar la fiesta sin que llegue ningún objeto primero.

> La lección: la **clase** define la estructura y posee lo `static` (contadores, constantes); el **objeto** guarda la información de cada cosa (atributos de instancia). Se necesitan mutuamente, pero cada uno a su terreno.

---

## 🕵️ ¿Quién soy?

Adivina qué concepto de la unidad soy:

1. **Soy el nivel más restrictivo: ni mi madre, ni mi mejor amigo, ni el perro. Solo la clase me ve.**
2. **Soy el portero de la discoteca: dejo leer el atributo, pero con nombres estrictos.**
3. **Soy el número de atención al cliente: me llaman por la clase, sin crear ningún objeto.**
4. **Soy el grupo de WhatsApp de la clase: hay una sola copia y todos la compartimos.**
5. **Soy el valor que ni el tiempo se atreve a tocar: en MAYÚSCULAS y con `_`.**
6. **Soy la clase que nadie puede instanciar: solo estáticos y constructor privado.**

<details>
<summary>🔄 Respuestas</summary>

1. **`private`** — solo la propia clase.
2. **El getter/setter** — leen y modifican atributos privados con convención `getX()`/`setX()`.
3. **Un método estático** — `Clase.metodo()`, sin `new`.
4. **Un atributo `static`** — una copia compartida por todos los objetos.
5. **Una constante** — `static final`, escrita en MAYÚSCULAS con `_`.
6. **Una clase utilitaria** — como `Math` o `StringUtils`.

</details>

---

## 🎮 El juego de las decisiones

Elige la respuesta correcta para cada decisión (respuestas al final):

1. ¿Qué visibilidad tiene un atributo sin modificador?
   - a) `public`   b) package-private (solo el paquete)
2. ¿Cómo se llama el getter de `boolean activo`?
   - a) `getActivo()`   b) `isActivo()`
3. ¿Puede un método estático usar `this`?
   - a) Sí, siempre   b) No: no hay objeto del que hablar
4. ¿Qué hace `Config.IVA = 0.5` si `IVA` es `static final`?
   - a) Cambia el valor   b) Error de compilación
5. Si dos objetos comparten un atributo `static int x`, y uno lo incrementa...
   - a) Solo el objeto que lo incrementa lo ve   b) Los dos lo ven cambiado

<details>
<summary>🔄 Soluciones</summary>

1. **b)** — sin modificador es package-private: lo ve el mismo paquete.
2. **b)** — con `boolean` la convención usa `is` en vez de `get`.
3. **b)** — los estáticos no tienen `this`.
4. **b)** — `final` prohíbe modificar la constante: error de compilación.
5. **b)** — el atributo `static` es compartido: hay una sola copia para todos.

</details>

---

## 🤬 CONRAD VS EL MUNDO: "¿Por qué todo público?"

> *CONRAD, nuestro compilador cascarrabias, opina sobre el clásico del novato.*

**CONRAD:** — ¡OTRA VEZ! Viene un alumno y me dice: *CONRAD, mi programa funciona pero luego se rompe en el módulo de facturación*. Y yo: vale, ¿cómo están tus atributos? *Pues públicos, para ir más rápido.* ¡AY, MADRE MÍA! Un `public` en un atributo es una invitación a que cualquier clase le meta un valor imposible. Claro que funciona... hasta que deja de funcionar a las 3 de la madrugada.

*Y luego está el que escribe* `setEdad(int edad) { this.edad = edad; }` *sin validar nada. Un setter sin validar es un portero dormido: deja pasar a cualquiera, incluso con edades negativas.*

*Y el colmo:* un método `static` intentando leer `nombre` de instancia. ¡No sabes ni de qué objeto hablas! Te lo digo desde el punto 6: el `static` no tiene `this`.

**La lección:** antes de quejarte de bugs raros, revisa la frontera: ¿los atributos son `private`? ¿Los setters validan? ¿Lo estático está donde debe? El 90% de los estados imposibles se evitan con un buen candado en la clase.

---

## ⚡ Laboratorio de tortura: la caja fuerte sin candado

> **Duración estimada:** 30 minutos
> **Herramienta:** tu IDE y un archivo nuevo

**El escenario:** copia esta clase y haz que sea una clase "profesional". Tiene **4 problemas** de visibilidad y diseño que la dejan como una puerta abierta.

```java
public class Mascota {
    public String nombre;
    public int edad;
    public static int totalMascotas = 0;

    public Mascota(String nombre, int edad) {
        nombre = nombre;
        edad = edad;
        totalMascotas++;
    }

    public void cumplirAnos() {
        edad = edad + 1;
    }
}
```

**Fallo intencionado:** uno de los problemas parece correcto a simple vista, pero hace que el `nombre` y la `edad` de la mascota se queden "en blanco" al nacer.

**Tu tarea:** convertirla en una clase encapsulada: atributos `private`, getters, setters con validación (la edad no puede ser negativa), y corrige el constructor. Además, prueba que `totalMascotas` sube con cada `new`.

**Pistas para cuando te frustres (no antes):**

1. ¿Los atributos deberían ser `public`? *no → es el primer problema.*
   <details><summary>¿Y si sigo atascado?</summary>Ponlos `private` y crea getters y setters con la convención `getX()`/`setX()`.</details>
2. ¿Qué pasa con `nombre = nombre;` y `edad = edad;`? *Suena a que se asignan a sí mismos.*
   <details><summary>¿Y si sigo atascado?</summary>Sin `this`, el parámetro se asigna a sí mismo y el atributo queda con su valor por defecto. Usa `this.nombre = nombre`.</details>
3. ¿Qué debería validar el setter de la edad?
   <details><summary>¿Y si sigo atascado?</summary>Que la edad no sea negativa. Si es inválida, no la apliques y avisa.</details>
4. ¿`totalMascotas` está bien como está? *Recuerda la convención de acceso.*
   <details><summary>Solución final</summary>

```java
public class Mascota {
    public static int totalMascotas = 0;

    private String nombre;
    private int edad;

    public Mascota(String nombre, int edad) {
        this.nombre = nombre;
        setEdad(edad);
        totalMascotas++;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        if (nombre != null && !nombre.trim().isEmpty()) {
            this.nombre = nombre;
        }
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        if (edad >= 0) {
            this.edad = edad;
        } else {
            System.out.println("Edad inválida: " + edad);
        }
    }

    public void cumplirAnos() {
        this.edad++;
    }
}
```

Los 4 problemas: atributos públicos, constructor sin `this` (los parámetros se asignaban a sí mismos), setter de edad sin validar y `cumplirAnos()` que podía acabar en edades imposibles. Con `private` + validación, la mascota ya no puede "nacer en blanco" ni tener edad negativa.

</details>

---

## 🧩 EL LÍO: el setter que no validaba

El siguiente código pretende encapsular una clase `CuentaBancaria`, pero tiene varios errores. Encuéntralos:

```java
public class CuentaBancaria {
    public double saldo;
    private String titular;

    public CuentaBancaria(String titular, double saldoInicial) {
        titular = titular;
        saldo = saldoInicial;
    }

    public double getSaldo() {
        return saldo;
    }

    private void setSaldo(double saldo) {
        if (saldo >= 0) {
            this.saldo = saldo;
        }
    }
}
```

1. ¿El atributo `saldo` está bien encapsulado?
2. ¿Qué error hay en el constructor con `titular = titular`?
3. ¿Por qué `setSaldo` es `private`? ¿Cómo se modifica el saldo entonces?

> 🕶️ **Don Tip:** `this` resuelve ambigüedades. Si parámetro y atributo se llaman igual, sin `this` te asignas el parámetro a sí mismo y el atributo se queda "en blanco".

<details>
<summary>🔄 Soluciones</summary>

1. **No.** `saldo` es `public`: cualquiera puede hacer `cuenta.saldo = -500` desde fuera, saltándose toda validación. Debería ser `private` y modificarse solo a través de métodos como `ingresar()` y `retirar()`.
2. `titular = titular` asigna el parámetro a sí mismo. El atributo `titular` de la clase se queda con su valor por defecto (`null`). Debe ser `this.titular = titular`.
3. Si `setSaldo` es `private`, nadie de fuera puede modificar el saldo, ni siquiera con validación. La clase debería exponer operaciones de negocio (`ingresar(double)`, `retirar(double)`) que llamen internamente a la lógica de cambio, como hicimos en el punto 8.

</details>

---

## 🏆 Logros de esta unidad

| Logro | Cómo conseguirlo |
|---|---|
| 🏅 **El Candidato al Candado** | Explicar los 4 niveles de visibilidad y quién ve cada cosa, sin mirar |
| 🏅 **Portero Estricto** | Escribir una clase con atributos `private`, getters y setters con validación |
| 🏅 **El Contador de la Clase** | Crear una clase con contador `static` e ids autoincrementales que funcione |
| 🏅 **El Adivino Estático** | Predecir "¿Qué imprime?" en un puzle de `static` vs instancia sin ejecutar |
| 🏅 **El Refactorizador** | Convertir la clase del Laboratorio en una clase bien encapsulada sin mirar la solución |

---

## 🧠 Atrévete a pensar

1. **Sin ejecutar:** ¿qué imprime este programa?

```java
public class Contador {
    static int n = 0;
    int m = 0;

    public static void subirN() { n++; }
    public void subirM() { m++; }

    public static void main(String[] args) {
        Contador a = new Contador();
        Contador b = new Contador();

        a.subirM();
        b.subirM();
        a.subirM();
        Contador.subirN();
        Contador.subirN();

        System.out.println(a.m + " " + b.m + " " + Contador.n);
    }
}
```

2. **El atributo fantasma:** en `CuentaBancaria`, ¿cómo harías para que el saldo solo pudiera subir con ingresos y bajar con retiradas, sin que nadie pudiera ponerlo a un valor arbitrario?
3. **El detective:** tu programa acepta edades negativas porque "nadie sabe quién las introduce". ¿Qué herramienta de esta unidad usas para pararlo?
4. **Verdadero o falso:** "un atributo `static` tiene una copia por cada objeto creado".

<details>
<summary>💡 Soluciones</summary>

1. Imprime **`2 1 2`**: `a.m` sube dos veces (2), `b.m` una (1), y `n` (estático) sube dos veces (2). El `m` es de cada objeto; el `n` es compartido.
2. Declarando `saldo` como `private` y creando solo métodos `ingresar(double)` y `retirar(double)` que validen. Sin setter público para el saldo: solo operaciones de negocio.
3. La **encapsulación**: `private int edad` + `setEdad(int)` que valide `edad >= 0`. El error se detecta en la frontera, no a kilómetros.
4. **Falso.** Un atributo `static` tiene **una sola copia** compartida por todos los objetos.

</details>

---

## 🧩 Crucigrama de bits

```
Horizontal:
1. Modificador de acceso más restrictivo (7 letras)
4. La clase no lo tiene, el objeto sí, cuando hablamos de "yo" (4 letras)
6. Método que lee un atributo privado (6 letras)

Vertical:
2. Valor fijo de la clase, en MAYÚSCULAS (9 letras)
3. Lo que pertenece a la clase, no al objeto (6 letras)
5. Prefijo del getter cuando el atributo es booleano (2 letras)
```

<details>
<summary>📝 Soluciones</summary>

**Horizontal:** 1. PRIVATE · 4. THIS · 6. GETTER
**Vertical:** 2. CONSTANTE · 3. STATIC · 5. IS

</details>

---

## 💬 Preguntas de entrevista de trabajo

> Preguntas reales que te harían para programador Java junior.

1. **"Explícame, como si yo fuera tu abuela, por qué los atributos no deberían ser públicos."**
2. **"¿Cuál es la diferencia entre un método estático y un método de instancia?"**
3. **"¿Qué es la encapsulación y qué ventajas aporta?"**
4. **"¿Por qué `main` es `static`?"**
5. **"¿Cuándo usarías `static final`?"**
6. **"Un compañero ha dejado `public` un atributo que guarda el estado de un juego y aparecen bugs imposibles. ¿Qué haces?"**

---

## 🤷 No hay preguntas tontas

> ❓ **¿Package-private y `default` son lo mismo?**

Sí: se llaman igual. Es el nivel que Java asume cuando no escribes `public`, `private` ni `protected`. No confundas con la palabra `default`, que es para otra cosa.

---

> ❓ **¿Un setter siempre tiene que imprimir un mensaje cuando el valor es inválido?**

No. Otra opción muy profesional es **lanzar una excepción** (`IllegalArgumentException`), para que el código que llama se entere y decida. Imprimir es cómodo para practicar; lanzar excepciones es lo que verás en código de producción.

---

> ❓ **¿Puedo tener un atributo estático que sea un objeto de su propia clase?**

¡Sí! Es el patrón **Singleton**: un `private static MiClase instancia` y un método `getInstance()`. Es como tener una única piedra filosofal. Pero eso es otro tema... que algún día merecerá su propia unidad.

---

## 🎬 Poscréditos

El programador termina su clase `CuentaBancaria` blindada: atributos `private`, getters, setters con validación y un contador estático que cuenta las cuentas creadas. Se siente un fortín andante.

Se acerca CONRAD, el compilador cascarrabias, con su taza humeante.

**CONRAD:** — ¿Eso era una clase o una caja fuerte del Banco de España? `private`, validación, constantes... Hasta constructor privado en una clase utilitaria que te has inventado. No está mal para un aprendiz de candados.

**Novato:** — ¿Y ahora qué? Mis clases ya no se rompen aunque alguien intente romperlas.

**CONRAD:** — *toma un sorbo* Blindar está bien, pero un banco con una sola cuenta es un banco triste. Los objetos se relacionan entre sí: heredan, comparten, se especializan. Eso es otra historia. La próxima parada te la cuenta.

El novato guarda su proyecto, cierra el IDE y siente que sus objetos ya no son casas de cristal.

**PRÓXIMAMENTE EN U08:** Herencia, Polimorfismo e Interfaces. El momento en el que tus clases **se miran a los ojos y se dicen "mira, esto lo compartimos"**. 🧬

---

📚 [Volver al índice de la unidad](/ApuntesProgramacion/07-visibilidad-encapsulacion-static) · **Anterior:** [08 · Be the Code: encapsula tu clase](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/08-be-the-code) · **Siguiente:** **[U08 · Herencia, Polimorfismo e Interfaces](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces)**