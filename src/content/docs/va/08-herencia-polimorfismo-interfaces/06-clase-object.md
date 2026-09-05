---
title: "06 — La classe Object: el besavi de tot"
description: "toString, equals i hashCode: els tres mètodes que tota classe hereta i quasi ningú sobreescriu bé 🧬"
---

<p><small>toString, equals i hashCode: els tres mètodes que tota classe hereta i quasi ningú sobreescriu bé 🧬</small></p>

> 🗺️ **Estàs en:** 🧬 **U08 · Herència, Polimorfisme i Interfícies** → 06 · La classe Object: el besavi de tot

---

## 📬 La idea en una frase

> **Tota classe hereta d'`Object`, i els seus tres mètodes estrella (`toString()`, `equals()` i `hashCode()`) cal sobreescriure'ls perquè la teua classe es comporte amb sentit comú.**

Sabies que la teua classe `Perro` té un besavi? Totes les classes hereden d'`Object`, encara que no escrigues `extends Object`. És l'arrel de tot l'arbre.

---

## 👴 Object: l'arrel de tot

```java
public class MiClase { } // = public class MiClase extends Object { }
```

Mètodes que tota classe hereta:

| Mètode | Què fa? | Sobreescriure'l? |
|---|---|---|
| `toString()` | Representació textual de l'objecte | Quasi sempre |
| `equals(Object)` | Compara per valor | Quan tinga sentit |
| `hashCode()` | Codi hash per a col·leccions | Amb `equals` |
| `getClass()` | Classe real de l'objecte | No |
| `clone()` | Còpia (superficial) | Rarament |

> 💡 **Consell:** els quatre primers els uses cada dia. `clone()` millor oblida'l: usa un constructor de còpia (el vas vore en la U06).

---

## 📇 toString(): la targeta de presentació

Per defecte, `Object.toString()` torna alguna cosa com `Perro@1a2b3c` (la classe i una adreça de memòria). Inútil per al ser humà mitjà. Sobreescriu-lo:

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

Fixa't: `System.out.println(objeto)` crida a `toString()` automàticament. I també la concatenació `"Perro: " + perro`. És el mètode que Java crida en mil llocs sense que el demanes.

---

## ⚖️ equals(): mateix objecte o iguals?

Per defecte, `equals()` compara **referències** (és a dir, fa `==`). Dos objectes diferents amb les mateixes dades NO són iguals. Per a comparar per **valor**, sobreescriu-lo:

```java
import java.util.Objects;

public class Perro {
    private String nombre;
    private int edad;

    // constructor...

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;                    // 1. mateix objecte
        if (o == null || getClass() != o.getClass())   // 2. null o classe distinta
            return false;
        Perro perro = (Perro) o;                        // 3. downcasting segur
        return edad == perro.edad                       // 4. comparar camps
                && Objects.equals(nombre, perro.nombre);
    }
}
```

El patró té 4 passos que són l'examen quasi literal de qualsevol entrevista:

1. **Reflexivitat ràpida:** si és el mateix objecte (`this == o`), són iguals.
2. **Filtre:** `null` o classe distinta → `false`. (`getClass()` evita comparar un `Perro` amb un `Gato`.)
3. **Downcasting** (segur, gràcies al pas 2).
4. **Comparar camp a camp**, usant `Objects.equals` per als `String` (que gestiona bé el `null`).

---

## 🏷️ hashCode(): el codi de barres

El `hashCode()` és un número que Java usa per a guardar objectes en col·leccions com `HashSet` o `HashMap`. La regla sagrada:

> ⚠️ **Advertència:** si dos objectes són iguals segons `equals()`, **HAN** de tindre el mateix `hashCode()`. Si sobreescrius `equals()` sense `hashCode()`, les col·leccions hash es comporten de forma imprevisible (objectes "iguals" que apareixen dos vegades).

La forma moderna i sense dolor:

```java
@Override
public int hashCode() {
    return Objects.hash(nombre, edad);
}
```

`Objects.hash` usa els mateixos camps que `equals()`. Regla pràctica: **mateixos camps en `equals` i en `hashCode`**, i vius en pau.

> 💡 **Detall pràctic:** la regla inversa NO és obligatòria: objectes amb el mateix `hashCode()` poden no ser iguals (col·lisions permeses). Només importa una direcció: `equals` == `true` → mateix hash.

---

## 🕵️ getClass(): el nom de l'objecte real

`getClass()` torna un objecte `Class` amb informació de la classe real de l'objecte (el que veus en `a.getClass().getSimpleName()` del punt 4). No es sobreescriu: ve de fàbrica i és perfecte tal qual.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `toString()`, `equals()` i `hashCode()` són el trio que el teu IDE pot generar amb un clic (Generate → equals() and hashCode()). Però entén què generes abans de polsar.

**Exercici: què imprimeix?**

```java
Empleado e1 = new Programador("Ana", "001", 2500, "Java");
Empleado e2 = new Programador("Ana", "001", 2500, "Java");
Empleado e3 = new Gerente("Ana", "002", 3000, 500);

System.out.println(e1);
System.out.println(e1.equals(e2));
System.out.println(e1.equals(e3));
System.out.println(e1.hashCode() == e2.hashCode());
```

Sabent que `Programador` sobreescriu `toString()`, `equals()` (per id) i `hashCode()` correctament, i `Gerente` és una altra classe:

<details>
<summary>🔄 Solució</summary>

- `e1` imprimeix `Programador: Ana (ID: 001)` (gràcies a `toString()`).
- `e1.equals(e2)` → `true` (mateix id, encara que siguen objectes diferents).
- `e1.equals(e3)` → `false` (classes diferents: `getClass()` els separa).
- `e1.hashCode() == e2.hashCode()` → `true` (mateixos camps → mateix hash).

</details>

**Exercici: el gat impostor**

```java
class Perro extends Animal { Perro(String n) { super(n); } }
class Gato extends Animal { Gato(String n) { super(n); } }

System.out.println(new Perro("Firulais").equals(new Gato("Firulais")));
```

<details>
<summary>🔄 Solució</summary>

`false`. Encara que tots dos es diguen "Firulais", `getClass()` torna classes diferents (`Perro` vs `Gato`), així que `equals()` falla en el pas 2. Un gat no és un gos, per molt que compartisca nom.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. De quina classe hereta tot en Java?
2. Què imprimeix `System.out.println(objeto)` si sobreescrius `toString()`?
3. Què passa si sobreescrius `equals()` però no `hashCode()`?
4. Quants passos té el patró estàndard d'`equals()`?

<details>
<summary>🔄 Respostes</summary>

1. D'`Object`, encara que no escrigues `extends`.
2. El teu `toString()`: `println`, la concatenació amb `+` i molts altres llocs el criden sols.
3. Les col·leccions hash (`HashSet`, `HashMap`) es comporten mal: dos objectes "iguals" poden tractar-se com a diferents.
4. Quatre: `this == o`, filtre de `null`/classe, downcasting i comparar camps amb `Objects.equals`.

</details>

---

## ✅ Resum en 3 frases

1. **`Object`** és el besavi de totes les classes i aporta `toString()`, `equals()`, `hashCode()` i `getClass()`.
2. **`toString()`** et dona representacions llegibles; **`equals()`** compara per valor seguint el patró de 4 passos.
3. **`equals()` i `hashCode()`** van sempre junts, usant els mateixos camps, o les col·leccions es venjaran de tu.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `Object` | La classe arrel de tota la jerarquia Java |
> | `toString()` | Representació textual de l'objecte |
> | `equals(Object)` | Comparació per valor (no per referència) |
> | `hashCode()` | Codi hash usat per les col·leccions |
> | `getClass()` | Informació de la classe real de l'objecte |
> | Contracte equals/hashCode | Iguals segons `equals` ⇒ mateix `hashCode` |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/08-herencia-polimorfismo-interfaces) · **Anterior:** [05 · instanceof i downcasting](/ApuntesProgramacion/va/08-herencia-polimorfismo-interfaces/05-instanceof-downcasting) · **Següent:** [07 · Classes abstractes](/ApuntesProgramacion/va/08-herencia-polimorfismo-interfaces/07-clases-abstractas)