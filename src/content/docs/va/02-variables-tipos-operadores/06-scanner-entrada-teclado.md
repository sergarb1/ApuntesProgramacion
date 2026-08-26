---
title: "06 · Scanner: llegir pel teclat"
description: El moment en què el teu programa deixa de cridar i comença a escoltar ⌨️
---

<p><small>El moment en què el teu programa deixa de cridar i comença a escoltar ⌨️</small></p>

> 🗺️ **Estàs en:** 🔤 **U02 · Variables, Tipus i Operadors** → 06 · Scanner: llegir pel teclat

---

## 📬 La idea en una frase

> **`Scanner` és la classe de Java que llegix el que escrius pel teclat: instancies un objecte amb `new Scanner(System.in)` i li demanes dades amb `nextInt()`, `nextDouble()` o `nextLine()`.**

Fins ara, els teus programes eren uns cridaners: només escopien text a la consola. A partir d'este punt tindran oïdes. I amb oïdes arriben els programes de veritat: un conversor de temperatures que et pregunta els graus, una calculadora que rep números...

---

## 📖 El paquet: importar la llibreria

`Scanner` no viu al centre de Java: viu en una llibreria (`java.util`). Per a usar-lo, la primera línia del teu archiu ha de ser:

```java
import java.util.Scanner;
```

És com demanar en la biblioteca el llibre que vas a usar. Sense el `import`, Java et dirà que no coneix `Scanner`.

---

## 🏗️ Instanciar: el constructor

Per a tindre un lector de teclat necessites **crear un objecte** de la classe `Scanner`. Això es fa amb `new` i un **constructor** (recorda el `new String(...)` del punt 2):

```java
Scanner sc = new Scanner(System.in);
```

- `Scanner` és la classe (el motle).
- `new Scanner(...)` crea l'objecte (el constructor).
- `System.in` és l'argument que li passes: "llegix del teclat estàndard".

> 💡 **Detall pràctic:** el nom de la variable sol ser `sc` o `teclado`, per pura costum. Quan acabis d'usar el `Scanner`, és bona pràctica tancar-lo amb `sc.close()`, sobretot si el programa va a continuar fent coses rares.

---

## 🔢 Demanar dades: els mètodes next

Una volta tens l'objecte `sc`, li demanes dades amb els seus mètodes. Cada mètode espera que escrigues i pulses Enter:

```java
import java.util.Scanner;

public class PrimerEscucha {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("¿Cómo te llamas? ");
        String nombre = sc.nextLine();     // llig una línia de text completa

        System.out.print("¿Cuántos años tienes? ");
        int edad = sc.nextInt();           // llig un número enter

        System.out.print("¿Cuál es tu nota media? ");
        double nota = sc.nextDouble();     // llig un número amb decimals

        System.out.println("Hola, " + nombre + ". Con " + edad + " años y un " + nota + " de media, vas sobrado.");

        sc.close();
    }
}
```

Eixida d'exemple:

```
¿Cómo te llamas? Ana
¿Cuántos años tienes? 18
¿Cuál es tu nota media? 9.5
Hola, Ana. Con 18 años y un 9.5 de media, vas sobrado.
```

Els mètodes més usats:

| Mètode | Llig | Exemple |
|---|---|---|
| `nextLine()` | Una línia de text completa | `String nombre = sc.nextLine();` |
| `next()` | Només la següent paraula | `String palabra = sc.next();` |
| `nextInt()` | Un número enter | `int edad = sc.nextInt();` |
| `nextDouble()` | Un número amb decimals | `double nota = sc.nextDouble();` |
| `nextBoolean()` | `true` o `false` | `boolean ok = sc.nextBoolean();` |

---

## ⚠️ El embolic de `nextLine()` després de `nextInt()`

Este és l'error més odiat del `Scanner`, i apareix en tots els exàmens. Quan fas `nextInt()`, l'Enter que vas pulsar es queda *guardat* al buffer. Si després crides a `nextLine()`, eixa crida es menja l'Enter residual i et retorna una línia buida:

```java
Scanner sc = new Scanner(System.in);
System.out.print("Edad: ");
int edad = sc.nextInt();          // escrius 18 i pulses Enter
System.out.print("Nombre: ");
String nombre = sc.nextLine();    // ¡es salta la pregunta! retorna ""
```

**La solució:** afegix un `nextLine()` extra (o usa `next()` per al text) just després del número:

```java
int edad = sc.nextInt();
sc.nextLine();                    // es menja l'Enter sobrant
String nombre = sc.nextLine();    // ara sí, llig el nom
```

> ⚠️ **Advertència:** memoritza el truc: *després d'un `nextInt()` / `nextDouble()`, inserta un `nextLine()` buit abans del següent `nextLine()`.* És el guardià del buffer.

---

## 🏫 Exemple guiat: la calculadora de la propina

Anem a usar el teclat per a una cosa útil: calcular quant deixar de propina.

```java
import java.util.Scanner;

public class Propina {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("¿Cuánto vale la cuenta? ");
        double cuenta = sc.nextDouble();

        System.out.print("¿Qué porcentaje de propina? ");
        int porcentaje = sc.nextInt();

        double propina = cuenta * porcentaje / 100;
        double total = cuenta + propina;

        System.out.println("Propina: " + propina + "€");
        System.out.println("Total a pagar: " + total + "€");

        sc.close();
    }
}
```

Eixida d'exemple:

```
¿Cuánto vale la cuenta? 45.5
¿Qué porcentaje de propina? 15
Propina: 6.825€
Total a pagar: 52.325€
```

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** quan combines `nextInt()` i `nextLine()`, recorda sempre l'Enter residual. Escriu-ho com un reflex: número → `nextLine()` buit → text.

**Exercici: el presentador amb trampa**

Este programa intenta saludar l'usuari... però alguna cosa falla. Sense executar, digues què ocorre i com ho arreglaries:

```java
Scanner sc = new Scanner(System.in);
System.out.print("Edad: ");
int edad = sc.nextInt();
System.out.print("Nombre: ");
String nombre = sc.nextLine();
System.out.println(nombre + " tiene " + edad + " años.");
```

<details>
<summary>🔄 Solució</summary>

El problema és l'**Enter residual**: després de `nextInt()`, el `nextLine()` es menja l'Enter i `nombre` queda com text buit. El programa imprimiria una cosa com ` tiene 18 años.`

La solució és afegir un `nextLine()` buit entre el número i el text:

```java
int edad = sc.nextInt();
sc.nextLine();                    // es menja l'Enter sobrant
String nombre = sc.nextLine();    // ara sí que llig el nom
```

</details>

---

## 🎯 Mini-chequeig

1. Què fa la línia `import java.util.Scanner;`?
2. Què fa `new Scanner(System.in)`?
3. Quina és la diferència entre `next()` i `nextLine()`?
4. Per què després d'un `nextInt()` cal posar un `nextLine()` buit?

<details>
<summary>🔄 Respostes</summary>

1. Importa la classe `Scanner` des de la llibreria `java.util`, per a poder usar-la.
2. **Crea un objecte** de tipus `Scanner` que llegix del teclat (`System.in`). És el constructor de la classe.
3. `next()` llegix **una sola paraula** (fins a un espai); `nextLine()` llegix **tota la línia** fins a l'Enter.
4. Perquè l'Enter que vas pulsar en `nextInt()` queda al buffer i el següent `nextLine()` se'l menja, retornant text buit.

</details>

---

## ✅ Resum en 3 frases

1. `Scanner` és la classe per a llegir del teclat: la importes amb `import`, la instancies amb `new Scanner(System.in)` i demanes dades amb mètodes `next...`.
2. Cada tipus de dada té el seu mètode: `nextInt()`, `nextDouble()`, `nextLine()` per a text.
3. Després d'un `nextInt()` o `nextDouble()`, un `nextLine()` buit es menja l'Enter residual: sense ell, la teua següent pregunta es saltarà.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `Scanner` | Classe de `java.util` per a llegir dades de teclat |
> | `import` | Línia que porta una classe des de la seua llibreria |
> | Constructor | Mecanisme que crea l'objecte (`new Scanner(...)`) |
> | `System.in` | El teclat estàndard, la font d'entrada |
> | Buffer | Zona de memòria on queda l'Enter residual |
> | Instanciar | Crear un objecte a partir d'una classe |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/02-variables-tipos-operadores) · **Anterior:** [05 · Casting i conversions](/ApuntesProgramacion/va/02-variables-tipos-operadores/05-casting-conversiones) · **Següent:** [07 · Math.random() i nombres aleatoris](/ApuntesProgramacion/va/02-variables-tipos-operadores/07-math-random-aleatorios)