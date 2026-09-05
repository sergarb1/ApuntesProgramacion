---
title: "06 · Serialització: guardar objectes amb ObjectOutputStream"
description: "El teu objecte sencer en una maleta: implementa Serializable i guarda i recupera objectes complets amb ObjectOutputStream i ObjectInputStream 🧳📦"
---

<p><small>El teu objecte sencer en una maleta: implementa Serializable i guarda i recupera objectes complets amb ObjectOutputStream i ObjectInputStream 🧳📦</small></p>

> 🗺️ **Estàs en:** 📁 **U12 · Fitxers i Expressions Regulars** → 06 · Serialització: guardar objectes amb ObjectOutputStream

---

## 📬 La idea en una frase

> **La serialització convertix un objecte sencer en una seqüència de bytes que pots guardar en un fitxer, i la deserialització el reconstruïx tal qual. La teua `Persona`, el teu `Estudiant`, el teu `ArrayList` sencer, en una maleta.**

Fins ara guardaves text. Però i si vols guardar un **objecte complet** amb tots els seus atributs? ¿O un `ArrayList` sencer? Fer-ho camp a camp en un `FileWriter` és un horror. La serialització et deixa "congelar" l'objecte, guardar-lo en un fitxer i "descongelar-lo" després amb totes les dades intactes.

---

## 🧳 El tracte: implementar Serializable

Perquè un objecte es puga serialitzar, la seua classe ha d'implementar la interfície **`Serializable`**. No té mètodes: és una *marca* que li diu a Java "este objecte pot congelar-se".

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

> ⚠️ **Advertència:** si un atribut de la classe no és serialitzable (per exemple, un `Thread` o un `Socket`), llançaràs una `NotSerializableException`. Solucions: marca l'atribut com a `transient` (no es guarda) o fes que la seua classe també siga `Serializable`.

---

## 📦 Guardar: ObjectOutputStream

Per a escriure objectes uses `ObjectOutputStream` embolicat sobre un `FileOutputStream`:

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

> 💡 **Consell:** l'extensió `.obj` (o `.ser`/`.dat`) és purament convencional: el fitxer és binari, no l'obris amb el bloc de notes. Si l'obris, veuràs brossa i algun nom de classe llegible: és la firma que Java usa per a saber què deserialitzar.

---

## 🧊 Recuperar: ObjectInputStream

Per a llegir-lo de tornada, `ObjectInputStream` sobre `FileInputStream`. El resultat és un `Object`, així que necessites un **casting** (ja saps: el repartiment de l'`instanceof` de la U09):

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

> ⚠️ **Advertència:** `readObject()` pot llançar `ClassNotFoundException` si la classe no existix en deserialitzar (per exemple, si canvies de projecte o reanomenes la classe). Per això el mètode declara `throws Exception` o captura les tres: `IOException`, `ClassNotFoundException`.

---

## 🧨 I si la classe canvia entre guardar i llegir?

Ací ve la trampa clàssica: guardes l'objecte, modifiques la classe (afegixes un camp), i en llegir... `InvalidClassException`. Java guarda un identificador de versió de la classe i, si canvia, es queixa. La solució: declara tu l'identificador:

```java
class Persona implements Serializable {
    private static final long serialVersionUID = 1L;  // jo controle la versió
    String nombre;
    int edad;
}
```

Amb `serialVersionUID` fix, Java no recalcula la versió i tolera xicotets canvis. Sense ell, qualsevol retoc en la classe romp els fitxers guardats abans. És d'eixes coses que dolen una vegada i després no s'obliden.

---

## 📚 Guardar col·leccions senceres

¿Una llista d'objectes? També es serialitza d'una vegada. És la forma més còmoda de "persistir" les teues dades de la U10/U11:

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

> 📝 **Nota:** `ArrayList` i les seues classes ja són `Serializable`, i una llista és serialitzable si els seus elements ho són. Per això funciona sense tocar res. Persistir col·leccions amb serialització és el "guardar partida" dels teus programes.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** la serialització no guarda el codi, guarda l'**estat**: els valors dels atributs. Per a reconstruir l'objecte, la classe ha d'existir i ser compatible. Si necessites que les dades les lliges un altre programa (no Java), la serialització no val: hauràs d'usar text, JSON o XML.

**Exercici: l'objecte que viatja en el temps**

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

**Què imprimeix? ¿Canvia el fitxer perquè vas modificar l'objecte en memòria abans de llegir-lo?**

<details>
<summary>🔄 Solució</summary>

Imprimeix **`Texto: Comprar leche (prioridad 5)`**.

L'`ObjectOutputStream` va guardar l'objecte **tal com estava** en el moment del `writeObject`: `"Comprar leche"` amb prioritat `5`. Quan després canvies `original.texto` a `"Comprar café"`, només canvia l'objecte en memòria, no el fitxer. En llegir, el fitxer reconstruïx la versió guardada: `"Comprar leche"`.

La lliçó: la serialització és una **foto** de l'objecte en un instant. Modificar l'objecte després de guardar-lo no afecta el fitxer. Perquè el canvi es reflectisca, hauríes de tornar a serialitzar.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quina interfície ha d'implementar una classe per a poder serialitzar-se?
2. Quina excepció llança si un atribut no és serialitzable?
3. Què fa `transient` en un atribut?
4. Per a què servix `serialVersionUID`?

<details>
<summary>🔄 Respostes</summary>

1. `Serializable` (és una interfície *marca*, sense mètodes).
2. `NotSerializableException`.
3. Evita que eixe atribut es guarde: no es serialitza. Útil per a camps que no es poden (o no s'han de) guardar.
4. Per a fixar la versió de la classe. Amb ell, xicotets canvis en la classe no rompen els fitxers ja guardats.

</details>

---

## ✅ Resum en 3 frases

1. Una classe **`Serializable`** (sense mètodes) pot congelar-se: `ObjectOutputStream.writeObject` la guarda en un fitxer binari i `ObjectInputStream.readObject` la reconstruïx amb un casting.
2. Si un atribut no és serialitzable, `NotSerializableException`; marca'l **`transient`** per a excloure'l.
3. Fixa un **`serialVersionUID`** perquè els teus fitxers sobrevisquen a xicotets canvis en la classe, i recorda que la serialització guarda una **foto** de l'estat, no el codi.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Serialitzar | Convertir un objecte en bytes per a guardar-lo o enviar-lo |
> | Deserialitzar | Reconstruir l'objecte a partir dels bytes |
> | `Serializable` | Interfície-marca que permet serialitzar una classe |
> | `transient` | Atribut que no es guarda en serialitzar |
> | `serialVersionUID` | Versió de la classe per a compatibilitat |
> | Binari | Fitxer que no és text llegible (`.obj`, `.dat`, `.ser`) |

📁 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/12-ficheros-regex) · **Anterior:** [05 · NIO: Files i Paths (la forma moderna)](/ApuntesProgramacion/va/12-ficheros-regex/05-nio-files-paths) · **Següent:** [07 · Expressions regulars: Pattern i Matcher](/ApuntesProgramacion/va/12-ficheros-regex/07-regex-basica)