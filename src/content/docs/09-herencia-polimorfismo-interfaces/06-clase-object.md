---
title: "06 — La clase Object: el tatarabuelo"
description: "toString, equals y hashCode: los tres métodos que toda clase hereda y casi nadie sobrescribe bien 🧬"
---

<p><small>toString, equals y hashCode: los tres métodos que toda clase hereda y casi nadie sobrescribe bien 🧬</small></p>

> 🗺️ **Estás en:** 🧬 **U09 · Herencia, Polimorfismo e Interfaces** → 06 · La clase Object: el tatarabuelo

---

## 📬 La idea en una frase

> **Toda clase hereda de `Object`, y sus tres métodos estrella (`toString()`, `equals()` y `hashCode()`) hay que sobrescribirlos para que tu clase se comporte con sentido común.**

¿Sabías que tu clase `Perro` tiene un bisabuelo? Todas las clases heredan de `Object`, aunque no escribas `extends Object`. Es la raíz de todo el árbol.

---

## 👴 Object: la raíz de todo

```java
public class MiClase { } // = public class MiClase extends Object { }
```

Métodos que toda clase hereda:

| Método | ¿Qué hace? | ¿Sobrescribirlo? |
|---|---|---|
| `toString()` | Representación textual del objeto | Casi siempre |
| `equals(Object)` | Compara por valor | Cuando tenga sentido |
| `hashCode()` | Código hash para colecciones | Con `equals` |
| `getClass()` | Clase real del objeto | No |
| `clone()` | Copia (superficial) | Raramente |

> 💡 **Consejo:** los cuatro primeros los usas a diario. `clone()` mejor olvídalo: usa un constructor de copia (lo viste en la U07).

---

## 📇 toString(): la tarjeta de presentación

Por defecto, `Object.toString()` devuelve algo como `Perro@1a2b3c` (la clase y una dirección de memoria). Inútil para el ser humano medio. Sobrescríbelo:

```java
public class Perro {
    private String nombre;
    private int edad;

    public Perro(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    @Override
    public String toString() {
        return "Perro{nombre='" + nombre + "', edad=" + edad + "}";
    }
}

System.out.println(new Perro("Firulais", 3));
// Perro{nombre='Firulais', edad=3}
```

Fíjate: `System.out.println(objeto)` llama a `toString()` automáticamente. Y también la concatenación `"Perro: " + perro`. Es el método que Java llama en mil sitios sin que lo pidas.

---

## ⚖️ equals(): ¿mismo objeto o iguales?

Por defecto, `equals()` compara **referencias** (es decir, hace `==`). Dos objetos distintos con los mismos datos NO son iguales. Para comparar por **valor**, sobrescríbelo:

```java
import java.util.Objects;

public class Perro {
    private String nombre;
    private int edad;

    // constructor...

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;                    // 1. mismo objeto
        if (o == null || getClass() != o.getClass())   // 2. null o clase distinta
            return false;
        Perro perro = (Perro) o;                        // 3. downcasting seguro
        return edad == perro.edad                       // 4. comparar campos
                && Objects.equals(nombre, perro.nombre);
    }
}
```

El patrón tiene 4 pasos que son el examen casi literal de cualquier entrevista:

1. **Reflexividad rápida:** si es el mismo objeto (`this == o`), son iguales.
2. **Filtro:** `null` o clase distinta → `false`. (`getClass()` evita comparar un `Perro` con un `Gato`.)
3. **Downcasting** (seguro, gracias al paso 2).
4. **Comparar campo a campo**, usando `Objects.equals` para los `String` (que maneja bien el `null`).

---

## 🏷️ hashCode(): el código de barras

El `hashCode()` es un número que Java usa para guardar objetos en colecciones como `HashSet` o `HashMap`. La regla sagrada:

> ⚠️ **Advertencia:** si dos objetos son iguales según `equals()`, **DEBEN** tener el mismo `hashCode()`. Si sobrescribes `equals()` sin `hashCode()`, las colecciones hash se comportan de forma impredecible (objetos "iguales" que aparecen dos veces).

La forma moderna y sin dolor:

```java
@Override
public int hashCode() {
    return Objects.hash(nombre, edad);
}
```

`Objects.hash` usa los mismos campos que `equals()`. Regla práctica: **mismos campos en `equals` y en `hashCode`**, y vives en paz.

> 💡 **Detalle práctico:** la regla inversa NO es obligatoria: objetos con el mismo `hashCode()` pueden no ser iguales (colisiones permitidas). Solo importa una dirección: `equals` == `true` → mismo hash.

---

## 🕵️ getClass(): el nombre del objeto real

`getClass()` devuelve un objeto `Class` con información de la clase real del objeto (el que ves en `a.getClass().getSimpleName()` del punto 4). No se sobrescribe: viene de fábrica y es perfecto tal cual.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `toString()`, `equals()` y `hashCode()` son el trío que tu IDE puede generar con un clic (Generate → equals() and hashCode()). Pero entiende qué generas antes de pulsar.

**Ejercicio: ¿qué imprime?**

```java
Empleado e1 = new Programador("Ana", "001", 2500, "Java");
Empleado e2 = new Programador("Ana", "001", 2500, "Java");
Empleado e3 = new Gerente("Ana", "002", 3000, 500);

System.out.println(e1);
System.out.println(e1.equals(e2));
System.out.println(e1.equals(e3));
System.out.println(e1.hashCode() == e2.hashCode());
```

Sabiendo que `Programador` sobrescribe `toString()`, `equals()` (por id) y `hashCode()` correctamente, y `Gerente` es otra clase:

<details>
<summary>🔄 Solución</summary>

- `e1` imprime `Programador: Ana (ID: 001)` (gracias a `toString()`).
- `e1.equals(e2)` → `true` (mismo id, aunque sean objetos distintos).
- `e1.equals(e3)` → `false` (clases distintas: `getClass()` los separa).
- `e1.hashCode() == e2.hashCode()` → `true` (mismos campos → mismo hash).

</details>

**Ejercicio: el gato impostor**

```java
class Perro extends Animal { Perro(String n) { super(n); } }
class Gato extends Animal { Gato(String n) { super(n); } }

System.out.println(new Perro("Firulais").equals(new Gato("Firulais")));
```

<details>
<summary>🔄 Solución</summary>

`false`. Aunque ambos se llamen "Firulais", `getClass()` devuelve clases diferentes (`Perro` vs `Gato`), así que `equals()` falla en el paso 2. Un gato no es un perro, por mucho que comparta nombre.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿De qué clase hereda todo en Java?
2. ¿Qué imprime `System.out.println(objeto)` si sobrescribes `toString()`?
3. ¿Qué pasa si sobrescribes `equals()` pero no `hashCode()`?
4. ¿Cuántos pasos tiene el patrón estándar de `equals()`?

<details>
<summary>🔄 Respuestas</summary>

1. De `Object`, aunque no escribas `extends`.
2. Tu `toString()`: `println`, la concatenación con `+` y otros muchos sitios lo llaman solos.
3. Las colecciones hash (`HashSet`, `HashMap`) se comportan mal: dos objetos "iguales" pueden tratarse como distintos.
4. Cuatro: `this == o`, filtro de `null`/clase, downcasting y comparar campos con `Objects.equals`.

</details>

---

## ✅ Resumen en 3 frases

1. **`Object`** es el tatarabuelo de todas las clases y aporta `toString()`, `equals()`, `hashCode()` y `getClass()`.
2. **`toString()`** te da representaciones legibles; **`equals()`** compara por valor siguiendo el patrón de 4 pasos.
3. **`equals()` y `hashCode()`** van siempre juntos, usando los mismos campos, o las colecciones se vengan de ti.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `Object` | La clase raíz de toda la jerarquía Java |
> | `toString()` | Representación textual del objeto |
> | `equals(Object)` | Comparación por valor (no por referencia) |
> | `hashCode()` | Código hash usado por las colecciones |
> | `getClass()` | Información de la clase real del objeto |
> | Contrato equals/hashCode | Iguales según `equals` ⇒ mismo `hashCode` |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/09-herencia-polimorfismo-interfaces) · **Anterior:** [05 · instanceof y downcasting](/ApuntesProgramacion/09-herencia-polimorfismo-interfaces/05-instanceof-downcasting) · **Siguiente:** [07 · Clases abstractas](/ApuntesProgramacion/09-herencia-polimorfismo-interfaces/07-clases-abstractas)