---
title: "09 — Repàs interactiu: domina l'herència"
description: "El tancament pràctic de la unitat, amb polimorfisme, contractes i una herència que no va a funcionar 😈"
---

<p><small>El tancament pràctic de la unitat, amb polimorfisme, contractes i una herència que no va a funcionar 😈</small></p>

> 🗺️ **Estàs en:** 🧬 **U09 · Herència, Polimorfisme i Interfícies** → 09 · Repàs interactiu

---

## 📬 La idea en una frase

> **En este punt no aprenem res de nou: ho convertim tot en pràctica. I, com sempre, alguna cosa no va a funcionar.** 😈

---

## ⭐ Sé el Código, my friend...

> *Ets la JVM. Acaben de donar-te este programa per a executar:*

```java
public class Animal {
    public void hacerSonido() { System.out.println("..."); }
}

public class Perro extends Animal {
    public void hacerSonido() { System.out.println("¡Guau!"); }
    public void moverCola() { System.out.println("*mueve la cola*"); }
}

public class Gato extends Animal {
    public void hacerSonido() { System.out.println("¡Miau!"); }
}

public class Main {
    public static void main(String[] args) {
        Animal a1 = new Perro();
        Animal a2 = new Gato();
        a1.hacerSonido();
        a2.hacerSonido();
        // a1.moverCola();  <- ¿compila?
    }
}
```

**Què imprimixes per pantalla? Tria assenyadament:**

1. **`...` i `...`** → La variable és `Animal`, així que s'executa el mètode d'`Animal`. ❌
2. **`¡Guau!` i `¡Miau!`** → ✅ ¡Correcte! El polimorfisme executa el mètode de l'objecte real, no el de la referència.
3. **`¡Guau!` i un error** → `a2` no pot ser un `Gato`. ❌

> <details>
> <summary>🔄 Solució</summary>
>
> L'opció **2**. `a1.hacerSonido()` executa la versió de `Perro`; `a2.hacerSonido()`, la de `Gato`. La línia comentada `a1.moverCola()` **no compila**: la referència és `Animal` i `Animal` no té `moverCola()`. Compilador i JVM, cadascú al seu.
>
> </details>

---

## 🔥 Fireside Chat: Classe abstracta vs Interfície

> *Dos veterans de la POO discutixen al costat de la pissarra mentre una subclasse els mira.*

**Classe abstracta:** — Jo soc l'esbós. Definisc l'esquelet i compartisc codi: els meus fills s'estalvien escriure l'avorrit. `Figura` amb `calcularArea()` abstracte i `mostrarColor()` ja fet. Sóc la família que hereta.

**Interfície:** — La família hereta d'un de sol. Jo signe contractes a mansalva. Un `Pato` implementa `Volable` I `Nadador` alhora. Quants `extends` li deixes tu al pobre ànec?

**Classe abstracta:** — Però jo tinc estat. Atributs `protected`, constructors, mètodes concrets amb lògica de veritat. Tu només declares "això ha d'existir".

**Interfície:** — Des de Java 8 tinc mètodes `default` amb implementació. I soc la base del polimorfisme modern: `List<Reproducible>`, `Comparable`, `Runnable`... Tota l'API de Java està plena de mi.

**Classe abstracta:** — Sense mi, no tindries famílies amb codi compartit. El template method, qui el fa?

**Interfície:** — I sense mi tindries el problema del diamant. Ens complementem.

**Classe abstracta:** — Això és veritat. Jo per a les famílies.

**Interfície:** — Jo per a les capacitats. ¿Acord?

> La lliçó: usa **classe abstracta** quan hi haja una família amb codi compartit (és-un); usa **interfície** quan vullgues capacitats reutilitzables (pot-fer). I es poden combinar: `class Perro extends Animal implements Mascota, Jugable`.

---

## 🕵️ Qui sóc?

Endevina quin concepte de la unitat sóc:

1. **Sóc la paraula que fa que una classe filla obtinga tot el del seu pare.**
2. **Sóc l'anotació que li diu al compilador "verifica que estic sobreescrivint, no inventant".**
3. **Sóc la crida que configura la part del pare abans que el fill faça el seu.**
4. **Sóc el mecanisme pel qual `Animal a = new Perro()` executa el so del gos.**
5. **Sóc l'operador que pregunta "eres realment un Perro?" abans de convertir.**
6. **Sóc el contracte que una classe signa amb `implements` i que admet diversos alhora.**
7. **Sóc la classe abstracta que definix l'esquelet d'un algoritme i deixa que les filles ompliguen els detalls.**

<details>
<summary>🔄 Respostes</summary>

1. **`extends`** — establix l'herència.
2. **`@Override`** — verificació en compilació de la sobrescriptura.
3. **`super(...)`** — el constructor del pare s'executa primer, sempre.
4. **El polimorfisme (dynamic binding)** — la JVM decidix en runtime.
5. **`instanceof`** — i després el downcasting segur.
6. **La interfície** — diversos `implements`, un sol `extends`.
7. **El template method** — el patró de les classes abstractes en acció.

</details>

---

## ⚖️ Vertader o fals

1. **"Si `Animal` té un mètode `public`, una subclasse pot fer-lo `private`."**
2. **"`super.metodo()` es pot cridar des de qualsevol línia del mètode."**
3. **"Una classe pot implementar tres interfícies i estendre una classe."**
4. **"Els atributs també són polimòrfics: `ref.x` usa el de la classe real de l'objecte."**
5. **"Sobreescriure `equals()` sense `hashCode()` és un error de compilació."**

<details>
<summary>🔄 Solucions</summary>

1. **Fals.** No pots reduir la visibilitat en sobreescriure: `public` no pot tornar-se `protected` ni `private`.
2. **Fals.** `super(...)` (constructor) ha de ser la primera línia. `super.metodo()` pot anar on vulgues, però l'afirmació mescla tots dos.
3. **Vertader.** Un `extends` + diversos `implements`: `class Perro extends Animal implements Mascota, Jugable`.
4. **Fals.** Els mètodes són polimòrfics; els atributs es resolen pel tipus de la referència (shadowing).
5. **Fals.** Compila perfectament. El problema és que les col·leccions hash (`HashSet`, `HashMap`) es comporten mal en runtime.

</details>

---

## ⚡ Laboratori de tortura: l'herència que plora

> **Duració estimada:** 30 minuts
> **Ferramenta:** el teu IDE i un fitxer nou

**L'escenari:** copia este programa i fes que funcione. Té **3 errors** que impedixen que compile i 1 error de lògica que fa que el resultat siga incorrecte quan l'arregles.

```java
public class Vehiculo
    protected int velocidad;

    public Vehiculo(int velocidad) {
        this.velocidad = velocidad;
    }

    void mover() { System.out.println("Vehículo a " + velocidad + " km/h"); }
}

public class Coche extends Vehiculo {
    private int puertas;

    public Coche(int velocidad, int puertas) {
        this.velocidad = puertas;
        this.puertas = velocidad;
    }

    @Override
    void mover() {
        super.mover();
        System.out.println("Coche con " + puertas + " puertas");
    }

    public static void main(String[] args) {
        Vehiculo v = new Coche(120, 5);
        v.mover()
    }
}
```

**Fall intencionat:** un dels errors pareix correcte a simple vista perquè "es veu bé", però canvia per complet el comportament del programa.

**La teua tasca:** aconseguir que compile, que execute i que **tota** l'eixida siga correcta. Si el resultat no quadra, diagnostica.

**Pistes per quan et frustres (no abans):**

1. Hi ha algun `;` o `{` que falte? *no → seguix buscant.*
   <details><summary>I si continue atascat?</summary>La classe `Vehiculo` necessita la seua clau d'apertura `{` just després del nom.</details>
2. Compila ja? *no → mira el missatge d'error i els constructors.*
   <details><summary>I si continue atascat?</summary>`Vehiculo` només té constructor amb paràmetres: `Coche` ha de cridar-lo amb `super(velocidad)` com a primera línia. Sense això, el compilador busca un `super()` buit que no existix.</details>
3. Executa però els números ixen canviats? *És l'error de lògica: el constructor intercanvia els valors.*
   <details><summary>Solució final</summary>

Els **3 errors de compilació**:

1. Falta la `{` d'apertura de la classe `Vehiculo`.
2. El constructor de `Coche` no crida a `super(velocidad)`. En escriure qualsevol constructor en el pare, el buit desapareix.
3. Falta el `;` al final de `v.mover()`.

L'**error de lògica**: en el constructor, les assignacions estan creuades:

```java
this.velocidad = puertas;   // ¡mal! velocidad hauria de ser 120
this.puertas = velocidad;   // ¡mal! puertas hauria de ser 5
```

Compila i executa perfectament, però intercanvia els valors. Codi corregit:

```java
public class Vehiculo {
    protected int velocidad;

    public Vehiculo(int velocidad) {
        this.velocidad = velocidad;
    }

    void mover() { System.out.println("Vehículo a " + velocidad + " km/h"); }
}

public class Coche extends Vehiculo {
    private int puertas;

    public Coche(int velocidad, int puertas) {
        super(velocidad);
        this.puertas = puertas;
    }

    @Override
    void mover() {
        super.mover();
        System.out.println("Coche con " + puertas + " puertas");
    }

    public static void main(String[] args) {
        Vehiculo v = new Coche(120, 5);
        v.mover();
    }
}
```

Eixida correcta:

```
Vehículo a 120 km/h
Coche con 5 puertas
```

Amb la versió trencada, una volta arreglats els altres errors, l'eixida era `Vehículo a 5 km/h` i `Coche con 120 puertas`: dos línies canviades per un constructor creuat.

</details>

---

## 🏆 Assoliments d'esta unitat

| Assoliment | Com aconseguir-lo |
|---|---|
| 🏅 **L'Hereu** | Explicar què s'hereda i què no (private, constructors) sense mirar la taula |
| 🏅 **El Sobreescriptor** | Usar `@Override` + `super` per a estendre un mètode del pare amb sentit |
| 🏅 **El Camaleó** | Resoldre un problema de col·leccions amb polimorfisme sense usar `instanceof` |
| 🏅 **El Notari** | Decidir quan usar classe abstracta i interfície i justificar-ho |
| 🏅 **El Genealogista** | Dissenyar una jerarquia de 3 nivells amb `toString()`, `equals()` i `hashCode()` |

---

## 🧠 Atreveix-te a pensar

1. **Sense executar:** què imprimeix este programa?

```java
class A { void mensaje() { System.out.println("A"); } }
class B extends A { void mensaje() { System.out.println("B"); } }
class C extends B { }

public class Test {
    public static void main(String[] args) {
        A r1 = new B();
        A r2 = new C();
        B r3 = new C();
        r1.mensaje();
        r2.mensaje();
        r3.mensaje();
    }
}
```

2. **El constructor perdut:** `Animal` només té `Animal(String nombre)`. Què li passa a `Perro extends Animal` si el seu constructor no crida a `super`?
3. **El detectiu de l'equals:** el teu `HashSet` conté dos objectes que són `equals()` entre si... què has oblidat sobreescriure?
4. **Vertader o fals:** "`a instanceof Perro` és `true` si `a` és de tipus `Animal` i l'objecte real és un `Perro`."

<details>
<summary>💡 Solucions</summary>

1. **`B`, `C`, `C`**. Només importa el tipus real de l'objecte (`B`, `C`, `C`); la referència (`A`, `A`, `B`) no decidix res.
2. **Error de compilació**: Java intenta `super()` sense arguments i no existix. Cal cridar a `super(nombre)` com a primera línia.
3. **`hashCode()`**. Si `equals()` diu que són iguals però `hashCode()` diferix, el `HashSet` els fica en calaixos diferents.
4. **Vertader.** `instanceof` mira el tipus real de l'objecte: `Perro` és un `Animal`, i l'objecte real és un `Perro`, així que és `true`.

</details>

---

## 🧩 Crucigrama de bits

```
Horitzontal:
1. La paraula que establix l'herència (7 lletres)
3. L'anotació que verifica que sobreescrius (8 lletres)
5. El contracte que signes amb implements (10 lletres)
6. Excepció en convertir un Gat en Gos (18 lletres)

Vertical:
2. La classe de la qual tots hereden (6 lletres)
4. La paraula que crida el mètode del pare (5 lletres)
```

<details>
<summary>📝 Solucions</summary>

**Horitzontal:** 1. EXTENDS · 3. OVERRIDE · 5. INTERFACE · 6. CLASSCASTEXCEPTION
**Vertical:** 2. OBJECT · 4. SUPER

</details>

---

## 💬 Preguntes d'entrevista de treball

> Preguntes reals que et faríen per a programador Java junior.

1. **"Explícam'ho, com si jo fóra la teua àvia, la diferència entre herència i composició."**
2. **"Què fa `super()` en un constructor i per què ha de ser la primera línia?"**
3. **"Quan usaríes una classe abstracta i quan una interfície?"**
4. **"Per què `ArrayList<Animal>` pot guardar `Perro` i `Gato` però no al revés?"**
5. **"Quina excepció llançes en fer `(Perro) gato` i com l'evites?"**
6. **"Per què `equals()` i `hashCode()` van sempre junts?"**

---

## 🤷 No hi ha preguntes tontes

> ❓ **Puc heredar de diverses classes alhora?**

No. Java no permet herència múltiple (el *problema del diamant*). Però per això existixen les interfícies: pots implementar tantes com vullgues.

---

> ❓ **Què passa si una classe filla té un atribut amb el mateix nom que el pare?**

Es diu que el **oculta** (shadowing). Però compte: els atributs no són polimòrfics. Si uses una referència de la superclasse, veus el de la superclasse; si uses una de la subclasse, veus el de la subclasse. Millor no jugar a això: posa noms diferents.

---

> ❓ **I els mètodes `final`? No es poden sobreescriure?**

Exacte. Un mètode `final` queda congelat: les filles l'hereden però no poden canviar-lo. I una classe `final` (com `String`) no pot tindre filles. És la decisió de disseny "això no es toca".

---

## 🎬 Poscrèdits

La programadora acaba el seu simulador de zoo virtual: una classe abstracta `Animal`, un `Perro` i un `Gato` que l'implementen, i un `ArrayList<Animal>` que els fica tots en la mateixa gàbia. Fins que, en l'última línia, intenta convertir un gat en gos i tot explota amb una `ClassCastException`.

S'acosta CONRAD, el compilador cascarràbies, amb la seua tassa fumant.

**CONRAD:** — Una altra volta. Un gat disfressat de gos. Saps què t'ha faltat?

**Programadora:** — ¿L'`instanceof`?

**CONRAD:** — *assentix* Veus. Quan entens qui és realment cada objecte, els errors deixen de ser màgia. Herència, `super`, polimorfisme, contractes... Ja no escrius classes, dissenyes famílies i signes acords.

**Programadora:** — ¿I ara què toca?

**CONRAD:** — *fa un glop* Ara que tens jerarquies senceres, necessites guardar-les en munts. I no, no val una caixa per a cada cosa. Et presentaré unes estructures que guarden animals, figures i fins i tot contractes amb elegància.

**PRÒXIMAMENT EN U10:** Col·leccions. El moment en què les teues jerarquies aprenen a guardar-se en llistes, conjunts i mapes. 📚

---

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces) · **Anterior:** [08 · Interfícies: el contracte que signes](/ApuntesProgramacion/va/09-herencia-polimorfismo-interfaces/08-interfaces) · **Següent:** **[U10 · Col·leccions](/ApuntesProgramacion/va/10-colecciones)**