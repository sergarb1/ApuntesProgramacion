---
title: "05 — Atributos static"
description: "Lo que pertenece a la clase y no al objeto: el grupo de WhatsApp en vez de los mensajes privados 📢"
---

<p><small>Lo que pertenece a la clase y no al objeto: el grupo de WhatsApp en vez de los mensajes privados 📢</small></p>

> 🗺️ **Estás en:** 🔒 **U07 · Visibilidad, Encapsulación y Static** → 05 · Atributos static

---

## 📬 La idea en una frase

> **Un atributo `static` es de la clase, no del objeto: solo hay una copia para todos, como el grupo de WhatsApp de la clase, mientras que los atributos normales son los mensajes privados de cada uno.**

Hasta ahora, cada objeto que creabas con `new` tenía sus propios atributos. Si creabas dos `Estudiante`, cada uno tenía su `nombre`. Pero hay datos que no tienen sentido "por objeto": el número total de estudiantes creados, por ejemplo. Eso no es de un estudiante concreto: es de **la clase**. Y para eso existe `static`.

---

## 📱 El grupo de WhatsApp vs los mensajes privados

Imagina que eres parte de una clase de 30 alumnos:

- **El grupo de WhatsApp de la clase** (`static`): todos ven el mismo mensaje. Si alguien escribe "mañana hay examen", los 30 lo leen. Es compartido.
- **Tus mensajes privados** (instancia): solo tú los ves. Cada alumno tiene los suyos y no se mezclan.

En Java es igual:

- **Variable de clase** (`static`): una sola copia compartida por todos los objetos.
- **Variable de instancia** (sin `static`): cada objeto tiene la suya, independiente.

```java
public class Estudiante {
    private static int totalEstudiantes = 0;
    private String nombre;
    private int id;

    public Estudiante(String nombre) {
        this.nombre = nombre;
        this.id = ++totalEstudiantes;
    }

    public static int getTotalEstudiantes() {
        return totalEstudiantes;
    }

    public int getId() {
        return id;
    }
}
```

Cada `Estudiante` tiene su propio `nombre` e `id`, pero todos comparten `totalEstudiantes`. Cuando creas el tercer estudiante, el contador pasa a 3 **para toda la clase**.

---

## 🧠 Cómo se ve en memoria

```
  CLASE: Estudiante
  ┌──────────────────────┐
  │ totalEstudiantes = 3 │  ← static: UNO para toda la clase
  └──────────────────────┘

  OBJETO e1        OBJETO e2        OBJETO e3
  ┌─────────┐      ┌─────────┐      ┌─────────┐
  │ nombre  │      │ nombre  │      │ nombre  │
  │ id = 1  │      │ id = 2  │      │ id = 3  │
  └─────────┘      └─────────┘      └─────────┘
```

El contador vive en "la clase" (un espacio que existe una sola vez), mientras que cada objeto tiene su nombre y su id en su propio cajón.

---

## 📞 El uso clásico: contadores e ids

El ejemplo anterior es el patrón estrella de los atributos `static`: **contar objetos creados** y generar **ids autoincrementales**. Cada vez que el constructor se ejecuta, `totalEstudiantes` sube y ese valor se usa como id. Es como el mostrador de la panadería: hay un único número en la pared que va subiendo para todos los clientes.

```java
Estudiante a = new Estudiante("Ana");
Estudiante b = new Estudiante("Luis");
Estudiante c = new Estudiante("Marta");

System.out.println(Estudiante.getTotalEstudiantes()); // 3
System.out.println(c.getId());                        // 3
```

> 💡 **Detalle práctico:** para acceder a un miembro `static`, usa el nombre de la **clase**: `Estudiante.getTotalEstudiantes()`. Funcionaría con un objeto (`c.getTotalEstudiantes()`), pero es confuso: da a entender que el valor es "de c", cuando es de todos.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuando veas un `static`, pregúntate: *¿tiene sentido que esto sea diferente para cada objeto?* Si la respuesta es "no", entonces pertenece a la clase.

**Ejercicio: los gatos estáticos**

Mira este código y responde SIN EJECUTAR:

```java
public class Gato {
    public static int totalGatos = 0;
    public String nombre;

    public Gato(String nombre) {
        this.nombre = nombre;
        totalGatos++;
    }

    public static void decirTotal() {
        System.out.println("Hay " + totalGatos + " gatos");
        // System.out.println(nombre); // ¿Esto funciona?
    }
}
```

1. ¿Funciona `System.out.println(nombre);` dentro de `decirTotal()`?
2. Si creas 3 gatos y luego haces `Gato.decirTotal()`, ¿qué imprime?
3. ¿Y si creas 5 gatos más? ¿Qué imprime ahora?

<details>
<summary>🔄 Solución</summary>

1. **NO funciona.** `nombre` es una variable de instancia y `decirTotal()` es estático: no sabe de qué gato hablamos. No hay "un gato" concreto al que preguntarle.
2. **`Hay 3 gatos`**: el contador estático ha subido con cada constructor.
3. **`Hay 8 gatos`**: el contador sigue donde estaba y sigue subiendo. Es compartido, no se resetea por objeto.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Cuántas copias existe de un atributo `static`?
2. ¿Cómo se accede a un atributo estático desde fuera?
3. ¿Para qué sirve un contador `static` con un `id` autoincremental?
4. ¿Puede un método estático leer un atributo de instancia directamente?

<details>
<summary>🔄 Respuestas</summary>

1. **Una sola**, compartida por todos los objetos de la clase.
2. Con el nombre de la clase: `Estudiante.getTotalEstudiantes()` (o `Clase.atributo` si fuera público).
3. Para contar objetos creados y asignar un número único a cada uno, como el mostrador de la panadería.
4. No: no sabe de qué objeto se habla. (Eso se ve con detalle en el punto 6.)

</details>

---

## ✅ Resumen en 3 frases

1. Un atributo `static` pertenece a la **clase**: hay una sola copia para todos los objetos.
2. Se usa para datos compartidos: **contadores**, ids autoincrementales, configuraciones globales.
3. Accede siempre por el **nombre de la clase**, no por un objeto, para que el código quede claro.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `static` | Pertenece a la clase, no al objeto |
> | Variable de clase | Atributo `static`, una copia compartida |
> | Variable de instancia | Atributo normal, una copia por objeto |
> | Contador | Atributo `static` que se incrementa en cada `new` |
> | Id autoincremental | Número único asignado con el contador |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/07-visibilidad-encapsulacion-static) · **Anterior:** [04 · Getters y setters](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/04-getters-setters) · **Siguiente:** [06 · Métodos static y el main](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/06-metodos-static)