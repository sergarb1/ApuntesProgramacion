---
title: "06 — Métodos static y el main"
description: "Llamar a métodos sin crear objetos, la clase Math, y por qué main es el primero en llegar a la fiesta 🎉"
---

<p><small>Llamar a métodos sin crear objetos, la clase Math, y por qué main es el primero en llegar a la fiesta 🎉</small></p>

> 🗺️ **Estás en:** 🔒 **U08 · Visibilidad, Encapsulación y Static** → 06 · Métodos static y el main

---

## 📬 La idea en una frase

> **Un método `static` se llama usando la clase, sin crear objetos; no tiene `this` y no puede tocar atributos de instancia. Y `main` es estático porque es el primero en llegar a una fiesta donde todavía no existe ningún objeto.**

Si los atributos `static` son el grupo de WhatsApp, los métodos `static` son el número de atención al cliente: no necesitas hablar con un empleado concreto, llamas al número general y listo.

---

## 📞 El teléfono de la clase

Un método estático se declara con `static` y se invoca usando el **nombre de la clase**:

```java
public class UtilidadesMatematicas {
    public static int sumar(int a, int b) {
        return a + b;
    }

    public static double media(double a, double b) {
        return (a + b) / 2;
    }
}
```

```java
int resultado = UtilidadesMatematicas.sumar(5, 3);  // Sin new, sin objeto.
double med = UtilidadesMatematicas.media(10, 20);
```

Compáralo con un método de instancia, que exige un objeto:

```java
String texto = "Hola";
int longitud = texto.length();   // length() NO es static: necesito el objeto texto.
```

Esa es la gran diferencia práctica: **static → clase; sin static → objeto**.

---

## 🚫 Lo que un método estático NO puede hacer

Reglas de oro que salvan exámenes:

1. **No puede acceder a atributos de instancia** (no sabe de qué objeto habla).
2. **No tiene `this`** (no hay "yo" porque no hay objeto).
3. Solo puede llamar **directamente** a otros métodos estáticos.

```java
public class Prueba {
    int x = 1;
    static int y = 1;

    public void incrementarX() { x++; }          // Método de instancia
    public static void incrementarY() { y++; }   // Método estático
}
```

`incrementarY()` puede tocar `y` (estático) pero no `x`: no sabe qué `x` coger. `incrementarX()` puede tocar `x` porque se llama sobre un objeto concreto.

> ⚠️ **Advertencia:** el clásico del novato es meter `System.out.println(nombreDeInstancia)` dentro de un método `static` y esperar que funcione. El compilador te dirá *"non-static variable cannot be referenced from a static context"*. Ahora ya sabes por qué.

---

## 🧮 La clase Math: la fábrica de métodos estáticos

`java.lang.Math` es la clase utilitaria por excelencia. TODOS sus métodos son estáticos. No puedes (ni quieres) hacer `new Math()`:

```java
double max = Math.max(10, 20);       // 20.0
double raiz = Math.sqrt(25);         // 5.0
double potencia = Math.pow(2, 10);   // 1024.0
double absoluto = Math.abs(-7);      // 7.0
double random = Math.random();       // Aleatorio en [0.0, 1.0)
```

Lo usas desde el primer día del curso, y ahora entiendes **por qué** funciona sin `new`: son métodos estáticos. Y ya de paso, `Integer.parseInt("42")` también lo es.

> 📝 **Nota:** `Math` tiene el constructor **privado**. Nadie puede instanciarla. Es como una estatua: para admirarla, no para hacerle clones. Las clases así se llaman *utilitarias* y las montas tú en el punto 7.

---

## 🎉 Por qué `main` es static

`main` es el método que arranca todo:

```java
public static void main(String[] args)
```

¿Por qué es estático? Porque cuando empieza el programa **todavía no existe ningún objeto**. Alguien tiene que arrancar la fiesta antes de que llegue nadie. Si `main` fuera de instancia, la JVM necesitaría un objeto para llamarlo... y para crear ese objeto necesitaría un programa en marcha. Pez que se muerde la cola. Por eso `main` es el primero en llegar y abre la puerta él mismo.

---

## 🤷 No hay preguntas tontas

> ❓ **¿Puedo llamar a un método estático desde un objeto? ¿Como `miObjeto.metodoEstatico()`?**

Técnicamente sí: Java te lo deja. Pero es como llamar a tu madre por el apellido: funciona, pero queda raro. La convención es usar la clase: `Clase.metodoEstatico()`. De hecho, algunos IDEs te muestran una warning por hacerlo.

> ❓ **¿Los métodos estáticos son más rápidos?**

Un pelín: no necesitan la referencia al objeto. Pero la diferencia es tan pequeña que en el 99,9% de los casos no la notarás. No te obsesiones con la velocidad: preocúpate de que tu código tenga sentido.

> ❓ **¿Puedo ponerle `static` a todo y ahorrarme crear objetos?**

Puedes, pero entonces no estás haciendo POO: estás haciendo "programación estática a lo bruto". Es como usar un destornillador para clavar un clavo: puedes, pero para eso existe el martillo. Usa `static` para lo que es de la clase, no para todo.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** el truco para no liarte es preguntar siempre: *¿este método necesita saber de qué objeto habla?* Si la respuesta es no, puede ser `static`.

**Ejercicio: la calculadora de la clase**

¿Funciona este código? Si no, ¿por qué?

```java
public class Calculadora {
    private String marca;

    public static int sumar(int a, int b) {
        System.out.println(marca);  // ¿Qué pasa aquí?
        return a + b;
    }
}
```

<details>
<summary>🔄 Solución</summary>

**No compila.** El método `sumar()` es estático e intenta leer `marca`, que es un atributo de instancia. Un método estático no tiene objeto, así que no sabe qué `marca` imprimir. El compilador lo prohíbe con: *"non-static variable marca cannot be referenced from a static context"*. Si `marca` fuera `static` (compartida por la clase), sí funcionaría.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Cómo se llama a un método estático?
2. ¿Puede un método estático acceder a atributos de instancia?
3. ¿Por qué `main` es estático?
4. ¿Qué diferencia a `Math.sqrt(9)` de `texto.length()`?

<details>
<summary>🔄 Respuestas</summary>

1. Con el nombre de la clase: `UtilidadesMatematicas.sumar(5, 3)`. Sin crear objetos.
2. No: no tiene `this` y no sabe de qué objeto habla.
3. Porque cuando arranca el programa no existe ningún objeto todavía: alguien tiene que abrir la puerta.
4. `Math.sqrt` es estático (se llama sobre la clase) y `length()` es de instancia (se llama sobre el objeto `texto`).

</details>

---

## ✅ Resumen en 3 frases

1. Los métodos `static` se llaman con la **clase**, sin `new`, y no pueden tocar atributos de instancia ni usar `this`.
2. `Math` es la clase utilitaria por excelencia: todo estático, constructor privado.
3. `main` es estático porque **es el primero en llegar**: cuando arranca, no hay objetos todavía.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Método estático | Método de la clase: `Clase.metodo()` |
> | Método de instancia | Método del objeto: `objeto.metodo()` |
> | `this` | Referencia al objeto actual (no existe en estáticos) |
> | Clase utilitaria | Solo métodos estáticos, sin objetos |
> | Contexto estático | "El mundo de la clase": sin objetos a la vista |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/08-visibilidad-encapsulacion-static) · **Anterior:** [05 · Atributos static](/ApuntesProgramacion/08-visibilidad-encapsulacion-static/05-atributos-static) · **Siguiente:** [07 · Constantes de clase: static final](/ApuntesProgramacion/08-visibilidad-encapsulacion-static/07-constantes-static-final)