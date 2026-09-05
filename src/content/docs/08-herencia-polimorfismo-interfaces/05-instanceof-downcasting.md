---
title: "05 — instanceof y downcasting"
description: "Preguntar quién eres realmente y bajar la referencia con cuidado para no estrellarte 🧬"
---

<p><small>Preguntar quién eres realmente y bajar la referencia con cuidado para no estrellarte 🧬</small></p>

> 🗺️ **Estás en:** 🧬 **U08 · Herencia, Polimorfismo e Interfaces** → 05 · instanceof y downcasting

---

## 📬 La idea en una frase

> **`instanceof` pregunta "¿eres realmente esto?" y el downcasting `(Tipo)` baja la referencia; juntos son seguros, por separado... peligrosos.**

En el punto 4 viste que una referencia `Animal` no puede llamar a `moverCola()` de un `Perro`. Para llegar a esos métodos específicos necesitas bajar la referencia. Y para bajar sin estrellarte, necesitas preguntar antes.

---

## 🕵️ instanceof: "¿Quién eres realmente?"

`instanceof` devuelve `true` si el objeto es de ese tipo (o de una subclase):

```java
Animal a = new Perro();
if (a instanceof Perro) {
    System.out.println("¡Es un perro!");
}
```

> 💡 **Consejo:** úsalo con moderación. Si llenas tu código de `instanceof`, algo estás haciendo mal: el polimorfismo (punto 4) debería resolver la mayoría de los casos sin preguntar. `instanceof` es para cuando un objeto concreto necesita un trato que el polimorfismo no cubre.

---

## 📉 Downcasting: bajar la referencia

Subir (upcasting) es gratis e implícito: `Animal a = new Perro();`. Bajar (downcasting) es explícito y arriesgado:

```java
Animal a = new Perro();
Perro p = (Perro) a;   // downcasting
p.moverCola();         // ✓ funciona
```

Pero si te equivocas de tipo:

```java
Animal a2 = new Gato();
Perro p2 = (Perro) a2;  // 💥 ClassCastException en runtime
```

Java no se deja engañar: el objeto real es un `Gato`, y convertirlo a `Perro` explota en tiempo de ejecución. Es como intentar hacer hablar a un gato en un concurso de perros: el público (la JVM) lo ve y monta un escándalo.

> ⚠️ **Advertencia:** el downcasting **compila siempre** (el compilador no sabe qué hay dentro de la variable), pero puede fallar en runtime. La única red de seguridad es preguntar antes.

---

## 🛡️ El combo seguro: instanceof + downcasting

La receta que nunca falla:

```java
if (a instanceof Perro) {
    Perro p = (Perro) a;
    p.moverCola();
} else {
    System.out.println("No es un perro, no puedo hacerlo mover la cola.");
}
```

`instanceof` es tu mirilla: si es un repartidor de pizzas, abre; si es un león, mejor no.

### Ejemplo real: downcasting en una lista polimórfica

```java
import java.util.ArrayList;

ArrayList<Empleado> plantilla = new ArrayList<>();
plantilla.add(new Programador("Ana"));
plantilla.add(new Disenador("Luis"));
plantilla.add(new Programador("Eva"));

for (Empleado e : plantilla) {
    if (e instanceof Programador) {
        ((Programador) e).escribirCodigo();
    } else if (e instanceof Disenador) {
        ((Disenador) e).disenar();
    }
}
```

Cada empleado recibe su trato especial solo si realmente es de ese tipo. Sin `instanceof`, no podrías llamar a `escribirCodigo()` ni a `disenar()`.

---

## ✨ Bonus: pattern matching (Java 16+)

Desde Java 16 hay una versión más limpia de `instanceof` + casting en una sola línea:

```java
if (a instanceof Perro p) {
    p.moverCola();   // ya no hace falta el (Perro)
}
```

El compilador crea la variable `p` automáticamente dentro del bloque. Menos código, mismo resultado, cero `ClassCastException` posible.

> 📝 **Nota:** en tu IDE de clase, si usas una versión de Java anterior a la 16, quédate con la forma clásica. El patrón no cambia el concepto: preguntar antes de bajar.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** el downcasting sin `instanceof` es jugar a la ruleta rusa con tu programa. Siempre pregunta antes de bajar.

**Ejercicio: ¿qué ocurre aquí?**

```java
Animal a = new Perro();
if (a instanceof Gato) {
    System.out.println("Es un gato");
} else {
    System.out.println("No es un gato");
}
```

<details>
<summary>🔄 Solución</summary>

Imprime **"No es un gato"**. El objeto real es un `Perro`, así que `a instanceof Gato` es `false`. El programa ni siquiera intenta el downcasting: `instanceof` te ha salvado del `ClassCastException`.

</details>

**Ejercicio: el juez de la granja**

```java
ArrayList<Animal> granja = new ArrayList<>();
granja.add(new Perro());
granja.add(new Gato());
granja.add(new Vaca());

for (Animal a : granja) {
    if (a instanceof Perro) {
        System.out.println("El perro mueve la cola");
    } else if (a instanceof Gato) {
        System.out.println("El gato ronronea");
    } else {
        System.out.println("Alguien da leche");
    }
}
```

¿Cuántos `instanceof` son necesarios? ¿Podrías haberlo hecho sin ninguno?

<details>
<summary>🔄 Solución</summary>

Dos `instanceof` bastan (el `else` final captura a `Vaca`). Y sí, se podría haber resuelto con polimorfismo puro: un método `comportamientoEspecial()` en cada animal y un solo `for`. `instanceof` brilla cuando el comportamiento es imposible de meter en la superclase (métodos que solo existen en una subclase, como `moverCola()`).

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué devuelve `instanceof` si el objeto no es de ese tipo?
2. ¿Qué excepción lanza un downcasting mal hecho?
3. ¿Por qué el combo `instanceof` + casting es seguro?
4. ¿Cuándo NO deberías usar `instanceof`?

<details>
<summary>🔄 Respuestas</summary>

1. `false`.
2. `ClassCastException`, en tiempo de ejecución.
3. Porque `instanceof` garantiza que el objeto es de ese tipo (o subclase) antes de convertir, así que el cast no puede fallar.
4. Cuando el polimorfismo puede resolverlo con un método sobrescrito: no preguntes lo que la JVM ya sabe.

</details>

---

## ✅ Resumen en 3 frases

1. **`instanceof`** comprueba el tipo real del objeto antes de actuar.
2. El **downcasting** `(Tipo) ref` baja la referencia y solo es seguro tras un `instanceof`.
3. Usa este combo **con moderación**: el polimorfismo suele ser la solución más limpia.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `instanceof` | Operador que comprueba el tipo real de un objeto |
> | Downcasting | Convertir una referencia a un tipo más específico |
> | Upcasting | Convertir (implícito) a un tipo más general |
> | `ClassCastException` | Explosión en runtime por un cast imposible |
> | Pattern matching | `instanceof Perro p` (Java 16+): preguntar y bajar en un paso |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces) · **Anterior:** [04 · Polimorfismo: el camaleón de la POO](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/04-polimorfismo) · **Siguiente:** [06 · La clase Object: el tatarabuelo](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/06-clase-object)