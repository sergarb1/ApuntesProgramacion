---
title: "04 — Constructores"
description: "El método que prepara al objeto en su fiesta de bienvenida: por defecto y con parámetros 🎉"
---

<p><small>El método que prepara al objeto en su fiesta de bienvenida: por defecto y con parámetros 🎉</small></p>

> 🗺️ **Estás en:** 🏗️ **U06 · POO: Clases y Objetos** → 04 · Constructores

---

## 📬 La idea en una frase

> **El constructor es la fiesta de bienvenida del objeto: un método especial que se ejecuta con `new` para que el objeto nazca bien preparado, con sus atributos inicializados.**

En el punto 3 veías que los atributos nacían con valores por defecto (0, `false`, `null`). Muy aburrido. ¿Y si quieres que tu coche nazca con marca "Seat" y el motor ya encendido? Ahí entran los **constructores**: la fiesta de bienvenida donde le dices al objeto cómo debe ser desde el primer segundo.

---

## 🎉 ¿Qué es un constructor?

Un constructor es un método especial con tres reglas de oro:

1. Se llama **igual que la clase**.
2. **No devuelve nada** (ni siquiera `void`).
3. Se ejecuta automáticamente con cada **`new`**.

```java
public class Persona {
    String nombre;
    int edad;

    // Constructor sin parámetros: "vale, te pongo valores por defecto"
    public Persona() {
        nombre = "Desconocido";
        edad = 0;
    }

    // Constructor con parámetros: "te paso los datos, tú inicialízalos"
    public Persona(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    void presentarse() {
        System.out.println("Hola, soy " + nombre + " y tengo " + edad + " años.");
    }
}
```

> 💡 **Tip:** el `this` de `this.nombre = nombre` se explica en el punto 5. Por ahora solo necesitas saber que significa "el atributo de ESTE objeto". Si te pica la curiosidad, que sepas que ya vas a resolverlo.

---

## 🆓 El constructor por defecto (el que regala Java)

Si **no escribes ningún constructor**, Java te regala uno gratis, sin parámetros y vacío. Solo se dedica a dejar los atributos con sus valores por defecto (0, `false`, `null`). Como un horno frío esperando a que metas algo.

```java
public class Galleta {
    String sabor;   // Java la crea con sabor = null
    boolean tieneChocolate;  // false
}
```

`new Galleta()` funciona porque Java puso ese constructor invisible. Pero ojo con la trampa:

> ⚠️ **Advertencia:** si escribes **cualquier** constructor, el constructor vacío **desaparece**. Si pones `public Galleta(String sabor)`, entonces `new Galleta()` (sin argumentos) deja de compilar. Java no te regala nada si ya has decidido montar tu propia fiesta.

---

## 🎛️ El constructor con parámetros (el horno con programa)

Con parámetros, el objeto nace a medida. Le pasas los datos y el constructor los coloca:

```java
public class Galleta {
    String forma;
    boolean tieneChocolate;
    int temperatura;

    public Galleta(String forma, boolean tieneChocolate, int temperatura) {
        this.forma = forma;
        this.tieneChocolate = tieneChocolate;
        this.temperatura = temperatura;
    }
}
```

```java
Galleta g = new Galleta("estrella", true, 180);
```

Una sola línea crea la galleta **ya con** forma de estrella, con chocolate y a 180 grados. Nada de dejar atributos bailando.

> 📝 **Nota:** no es obligatorio inicializar todos los atributos en el constructor, pero es la mejor costumbre. Un atributo que se queda sin tocar vive en la incertidumbre (`null`, 0, `false`) y la incertidumbre en programación es donde se esconden los bugs.

---

## 🏭 `new` y el constructor, un tándem

La línea `new Persona("Ana", 25)` hace tres cosas en orden:

1. Reserva memoria para el objeto.
2. Llama al constructor `Persona(String, int)`.
3. Devuelve la referencia (la dirección) para que la guardes en tu variable.

Sin constructor a la vista, `new Persona("Ana", 25)` fallaría si solo existiera el vacío (o el que regala Java). La JVM elige el constructor que encaja con los argumentos que le pasas. ¿Qué pasa si hay varios? Eso es **sobrecarga**, y tiene su capítulo en el punto 7.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** para saber qué constructor se llama, mira los argumentos de la llamada: número y tipo. Después, rastrea qué hace ese constructor.

**Ejercicio: ¿qué constructor se llama?**

Sin ejecutar, ¿qué imprime este código?

```java
public class Pedido {
    String producto;
    int cantidad;

    public Pedido() {
        this("Sin producto", 0);
        System.out.println("Constructor vacío");
    }

    public Pedido(String producto, int cantidad) {
        this.producto = producto;
        this.cantidad = cantidad;
        System.out.println("Constructor con parámetros");
    }

    public static void main(String[] args) {
        Pedido p = new Pedido();
        System.out.println(p.producto + " x" + p.cantidad);
    }
}
```

<details>
<summary>🔄 Solución</summary>

Se llama a `Pedido()`, que hace `this("Sin producto", 0)`: eso ejecuta primero `Pedido(String, int)` (imprime **"Constructor con parámetros"**), luego vuelve y termina `Pedido()` (imprime **"Constructor vacío"**). Después el `main` imprime **"Sin producto x0"**.

El `this(...)` de un constructor a otro **siempre va primero**, antes de cualquier otra instrucción. Es como la presentación antes de la fiesta: primero llamas a tu colega constructor y luego haces tus cosas.

</details>

---

## ❓ ¡No hay preguntas tontas!

> **Q:** ¿El constructor puede ser `private` o tiene que ser `public`?
>
> **A:** Normalmente es `public` para que cualquiera pueda crear objetos. Existen constructores `private`, pero tienen truco (se usan en patrones como Singleton, que verás en otros módulos). Para esta unidad: `public` y a correr.

> **Q:** ¿Un constructor puede devolver algo? ¿Y si pongo `return` dentro?
>
> **A:** Un constructor **no devuelve nada**, ni siquiera el objeto (eso lo hace `new` por él). Puedes poner un `return;` suelto para salir antes, pero devolver un valor con `return 5` es un error de compilación. El constructor no es un cajero automático.

> **Q:** ¿Y si no necesito inicializar nada? ¿Tengo que escribir constructor igualmente?
>
> **A:** Si no necesitas inicializar nada y no escribes ningún constructor, Java te regala el vacío. Pero el día que añadas un constructor con parámetros para una cosita, el vacío desaparece. Regla: **si escribes uno, escribe también el vacío** si lo vas a usar.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué tres reglas de oro tiene un constructor?
2. ¿Qué hace Java si no escribes ningún constructor?
3. ¿Qué pasa si escribes un constructor con parámetros pero luego llamas a `new Clase()` sin argumentos?
4. ¿Cuándo se ejecuta un constructor?

<details>
<summary>🔄 Respuestas</summary>

1. Mismo **nombre que la clase**, **no devuelve nada** (ni `void`), y se ejecuta con cada **`new`**.
2. Regala un constructor **vacío sin parámetros**, que deja los atributos con sus valores por defecto.
3. **Error de compilación**: al escribir cualquier constructor, el vacío desaparece, así que `new Clase()` no encuentra con qué llamarse.
4. Automáticamente, **en cada `new`**, justo después de reservar la memoria.

</details>

---

## ✅ Resumen en 3 frases

1. El **constructor** es un método especial con el mismo nombre que la clase, sin tipo de retorno, que se ejecuta con cada `new` para preparar al objeto.
2. **Sin constructor escrito**, Java regala uno vacío; **al escribir cualquier constructor**, el vacío desaparece.
3. Con **parámetros**, el objeto nace a medida: sus atributos quedan inicializados desde el primer segundo.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Constructor | Método especial que prepara al objeto al nacer |
> | Constructor por defecto | El vacío que regala Java si no escribes ninguno |
> | Constructor parametrizado | El que recibe datos para inicializar atributos |
> | Instanciar | Crear un objeto con `new` (que llama al constructor) |
> | `new` | Operador que reserva memoria, llama al constructor y devuelve la referencia |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/06-poo-clases-objetos) · **Anterior:** [03 · Atributos y métodos](/ApuntesProgramacion/06-poo-clases-objetos/03-atributos-metodos) · **Siguiente:** [05 · La palabra clave this](/ApuntesProgramacion/06-poo-clases-objetos/05-this)