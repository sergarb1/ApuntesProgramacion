---
title: "06 · Serialización: guardar objetos con ObjectOutputStream"
description: "Tu objeto entero en una maleta: implementa Serializable y guarda y recupera objetos completos con ObjectOutputStream y ObjectInputStream 🧳📦"
---

<p><small>Tu objeto entero en una maleta: implementa Serializable y guarda y recupera objetos completos con ObjectOutputStream y ObjectInputStream 🧳📦</small></p>

> 🗺️ **Estás en:** 📁 **U12 · Ficheros y Expresiones Regulares** → 06 · Serialización: guardar objetos con ObjectOutputStream

---

## 📬 La idea en una frase

> **La serialización convierte un objeto entero en una secuencia de bytes que puedes guardar en un archivo, y la deserialización lo reconstruye tal cual. Tu `Persona`, tu `Estudiante`, tu `ArrayList` entero, en una maleta.**

Hasta ahora guardabas texto. Pero ¿y si quieres guardar un **objeto completo** con todos sus atributos? ¿O una `ArrayList` entera? Hacerlo campo a campo en un `FileWriter` es un horror. La serialización te deja "congelar" el objeto, guardarlo en un archivo y "descongelarlo" después con todos sus datos intactos.

---

## 🧳 El trato: implementar Serializable

Para que un objeto se pueda serializar, su clase debe implementar la interfaz **`Serializable`**. No tiene métodos: es una *marca* que le dice a Java "este objeto puede congelarse".

```java
import java.io.Serializable;

class Persona implements Serializable {
    String nombre;
    int edad;

    Persona(String n, int e) {
        this.nombre = n;
        this.edad = e;
    }
}
```

> ⚠️ **Advertencia:** si un atributo de la clase no es serializable (por ejemplo, un `Thread` o un `Socket`), lanzarás una `NotSerializableException`. Soluciones: marca el atributo como `transient` (no se guarda) o haz que su clase también sea `Serializable`.

---

## 📦 Guardar: ObjectOutputStream

Para escribir objetos usas `ObjectOutputStream` envuelto sobre un `FileOutputStream`:

```java
import java.io.*;

public class GuardandoObjetos {
    public static void main(String[] args) throws Exception {
        Persona p = new Persona("Luis", 25);

        try (ObjectOutputStream oos = new ObjectOutputStream(
                new FileOutputStream("persona.obj"))) {
            oos.writeObject(p);
        }
        System.out.println("Objeto guardado.");
    }
}
```

> 💡 **Consejo:** la extensión `.obj` (o `.ser`/`.dat`) es puramente convencional: el archivo es binario, no lo abras con el bloc de notas. Si lo abres, verás basura y algún nombre de clase legible: es la firma que Java usa para saber qué deserializar.

---

## 🧊 Recuperar: ObjectInputStream

Para leerlo de vuelta, `ObjectInputStream` sobre `FileInputStream`. El resultado es un `Object`, así que necesitas un **casting** (ya sabes: el reparto del `instanceof` de la U09):

```java
import java.io.*;

public class RecuperandoObjetos {
    public static void main(String[] args) throws Exception {
        try (ObjectInputStream ois = new ObjectInputStream(
                new FileInputStream("persona.obj"))) {
            Persona recuperada = (Persona) ois.readObject();
            System.out.println(recuperada.nombre + " tiene " + recuperada.edad);
        }
    }
}
```

> ⚠️ **Advertencia:** `readObject()` puede lanzar `ClassNotFoundException` si la clase no existe al deserializar (por ejemplo, si cambiaste de proyecto o renombraste la clase). Por eso el método declara `throws Exception` o captura las tres: `IOException`, `ClassNotFoundException`.

---

## 🧨 ¿Y si la clase cambia entre guardar y leer?

Aquí viene la trampa clásica: guardas el objeto, modificas la clase (añades un campo), y al leer... `InvalidClassException`. Java guarda un identificador de versión de la clase y, si cambia, se queja. La solución: declara tú el identificador:

```java
class Persona implements Serializable {
    private static final long serialVersionUID = 1L;  // yo controlo la versión
    String nombre;
    int edad;
}
```

Con `serialVersionUID` fijo, Java no recalcula la versión y tolera pequeños cambios. Sin él, cualquier retoque en la clase rompe los archivos guardados antes. Es de esas cosas que duelen una vez y luego no se olvidan.

---

## 📚 Guardar colecciones enteras

¿Una lista de objetos? También se serializa de una vez. Es la forma más cómoda de "persistir" tus datos de la U10/U11:

```java
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class GuardandoLista {
    public static void main(String[] args) throws Exception {
        List<Persona> equipo = new ArrayList<>();
        equipo.add(new Persona("Ana", 20));
        equipo.add(new Persona("Bob", 22));
        equipo.add(new Persona("Carla", 19));

        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("equipo.obj"))) {
            oos.writeObject(equipo);
        }

        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream("equipo.obj"))) {
            List<Persona> recuperado = (List<Persona>) ois.readObject();
            for (Persona p : recuperado) {
                System.out.println(p.nombre + " - " + p.edad);
            }
        }
    }
}
```

> 📝 **Nota:** `ArrayList` y sus clases ya son `Serializable`, y una lista es serializable si sus elementos lo son. Por eso funciona sin tocar nada. Persistir colecciones con serialización es el "guardar partida" de tus programas.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** la serialización no guarda el código, guarda el **estado**: los valores de los atributos. Para reconstruir el objeto, la clase debe existir y ser compatible. Si necesitas que los datos los lea otro programa (no Java), la serialización no vale: tendrás que usar texto, JSON o XML.

**Ejercicio: el objeto que viaja en el tiempo**

```java
import java.io.*;

class Nota implements Serializable {
    private static final long serialVersionUID = 1L;
    String texto;
    int prioridad;

    Nota(String t, int p) {
        this.texto = t;
        this.prioridad = p;
    }
}

public class ViajeTemporal {
    public static void main(String[] args) throws Exception {
        Nota original = new Nota("Comprar leche", 5);

        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("nota.obj"))) {
            oos.writeObject(original);
        }

        original.texto = "Comprar café";

        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream("nota.obj"))) {
            Nota copia = (Nota) ois.readObject();
            System.out.println("Texto: " + copia.texto + " (prioridad " + copia.prioridad + ")");
        }
    }
}
```

**¿Qué imprime? ¿Cambia el archivo porque modificaste el objeto en memoria antes de leerlo?**

<details>
<summary>🔄 Solución</summary>

Imprime **`Texto: Comprar leche (prioridad 5)`**.

El `ObjectOutputStream` guardó el objeto **tal cual estaba** en el momento del `writeObject`: `"Comprar leche"` con prioridad `5`. Cuando después cambias `original.texto` a `"Comprar café"`, solo cambia el objeto en memoria, no el archivo. Al leer, el archivo reconstruye la versión guardada: `"Comprar leche"`.

La lección: la serialización es una **foto** del objeto en un instante. Modificar el objeto después de guardarlo no afecta al archivo. Para que el cambio se refleje, tendrías que volver a serializar.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué interfaz debe implementar una clase para poder serializarse?
2. ¿Qué excepción lanzas si un atributo no es serializable?
3. ¿Qué hace `transient` en un atributo?
4. ¿Para qué sirve `serialVersionUID`?

<details>
<summary>🔄 Respuestas</summary>

1. `Serializable` (es una interfaz *marca*, sin métodos).
2. `NotSerializableException`.
3. Evita que ese atributo se guarde: no se serializa. Útil para campos que no se pueden (o no se deben) guardar.
4. Para fijar la versión de la clase. Con él, pequeños cambios en la clase no rompen los archivos ya guardados.

</details>

---

## ✅ Resumen en 3 frases

1. Una clase **`Serializable`** (sin métodos) puede congelarse: `ObjectOutputStream.writeObject` la guarda en un archivo binario y `ObjectInputStream.readObject` la reconstruye con un casting.
2. Si un atributo no es serializable, `NotSerializableException`; márcalo **`transient`** para excluirlo.
3. Fija un **`serialVersionUID`** para que tus archivos sobrevivan a pequeños cambios en la clase, y recuerda que la serialización guarda una **foto** del estado, no el código.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Serializar | Convertir un objeto en bytes para guardarlo o enviarlo |
> | Deserializar | Reconstruir el objeto a partir de los bytes |
> | `Serializable` | Interfaz-marca que permite serializar una clase |
> | `transient` | Atributo que no se guarda al serializar |
> | `serialVersionUID` | Versión de la clase para compatibilidad |
> | Binario | Archivo que no es texto legible (`.obj`, `.dat`, `.ser`) |

📁 [Volver al índice de la unidad](/ApuntesProgramacion/12-ficheros-regex) · **Anterior:** [05 · NIO: Files y Paths (la forma moderna)](/ApuntesProgramacion/12-ficheros-regex/05-nio-files-paths) · **Siguiente:** [07 · Expresiones regulares: Pattern y Matcher](/ApuntesProgramacion/12-ficheros-regex/07-regex-basica)