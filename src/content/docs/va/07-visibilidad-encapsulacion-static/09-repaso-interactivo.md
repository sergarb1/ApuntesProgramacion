---
title: "09 — Repàs interactiu: blinda-ho tot"
description: "El tancament pràctic de la unitat, amb cadenats, estàtics i una classe que no voldrà compilar 😈"
---

<p><small>El tancament pràctic de la unitat, amb cadenats, estàtics i una classe que no voldrà compilar 😈</small></p>

> 🗺️ **Estàs en:** 🔒 **U07 · Visibilitat, Encapsulació i Static** → 09 · Repàs interactiu

---

## 📬 La idea en una frase

> **En este punt no aprenem res de nou: ho convertim tot en pràctica. I, com sempre, alguna cosa no voldrà compilar.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaben de donar-te este programa per a executar:*

```java
public class Estudiante {
    public static int total = 0;
    private int id;

    public Estudiante() {
        id = ++total;
    }

    public int getId() {
        return id;
    }
}
```

```java
public class Misteri {
    public static void main(String[] args) {
        Estudiante a = new Estudiante();
        Estudiante b = new Estudiante();
        Estudiante c = new Estudiante();

        System.out.println(c.getId());
        System.out.println(Estudiante.total);
    }
}
```

**Què imprimixes per pantalla? Tria saviament:**

1. **`3` i `3`** → ✅ Correcte! Cada `new` incrementa el `static total`, i el tercer estudiant s'emporta l'`id = 3`. A més, `total` (estàtic, de la classe) també val 3: una sola còpia per a tots.
2. **`1` i `3`** → El `static` seria "de cada objecte", però no: `total` és de la classe, una sola còpia. ❌
3. **`3` i `0`** → El constructor sí que incrementa `total`, no el deixa en 0. ❌

> <details>
> <summary>🔄 Solució</summary>
>
> L'opció **1**. `total` és un comptador `static` que puja amb cada constructor; `id` és d'instància i s'emporta el valor de `total` en el moment de nàixer. És el patró "comptador + id autoincremental" del punt 5.
>
> </details>

---

## 🔥 Fireside Chat: la classe i l'objecte

> *Dos veterans de la POO discuteixen al costat de la màquina de cafè.*

**Classe:** — Jo soc el motle. Definisc atributs, mètodes, l'estructura. Sense mi no hi ha res que instanciar.

**Objecte:** — I jo soc la galeta, el resultat real. Jo guarde les dades: el meu `nombre`, el meu `id`. Tu només eres el plànol.

**Classe:** — Plànols, plànols... I qui té el comptador de quantes galetes hi ha? Jo! `static int total`. Això és meu, i tots els objectes ho compartiu.

**Objecte:** — Compartim, sí, però jo tinc el meu `id` únic. El meu `nombre`, el meu saldo. No em toques els meus atributs d'instància.

**Classe:** — Precisament per això els vaig declarar `private`. Perquè ni tu te'ls toques: només a través dels meus getters i setters. Jo soc el porter.

**Objecte:** — Val, però sense mi, els teus setters no tenen a qui validar. Necessites un objecte perquè la festa existisca.

**Classe:** — *suspira* Per això el `main` és `static`: perquè jo puga arrancar la festa sense que arribe cap objecte primer.

> La lliçó: la **classe** definix l'estructura i posseïx el que és `static` (comptadors, constants); l'**objecte** guarda la informació de cada cosa (atributs d'instància). Es necessiten mútuament, però cada un al seu terreny.

---

## 🕵️ Qui Soc?

Endevina quin concepte de la unitat soc:

1. **Soc el nivell més restrictiu: ni ma mare, ni el meu millor amic, ni el gos. Només la classe em veu.**
2. **Soc el porter de la discoteca: deixe llegir l'atribut, però amb noms estrictes.**
3. **Soc el número d'atenció al client: em diuen per la classe, sense crear cap objecte.**
4. **Soc el grup de WhatsApp de la classe: només hi ha una còpia i tots la compartim.**
5. **Soc el valor que ni el temps s'atrevix a tocar: en MAJÚSCULES i amb `_`.**
6. **Soc la classe que ningú no pot instanciar: només estàtics i constructor privat.**

<details>
<summary>🔄 Respostes</summary>

1. **`private`** — només la pròpia classe.
2. **El getter/setter** — llegixen i modifiquen atributs privats amb convenció `getX()`/`setX()`.
3. **Un mètode estàtic** — `Clase.metodo()`, sense `new`.
4. **Un atribut `static`** — una còpia compartida per tots els objectes.
5. **Una constant** — `static final`, escrita en MAJÚSCULES amb `_`.
6. **Una classe utilitària** — com `Math` o `StringUtils`.

</details>

---

## 🎮 El Joc de les Decisions

Tria la resposta correcta per a cada decisió (respostes al final):

1. Quina visibilitat té un atribut sense modificador?
   - a) `public`   b) package-private (només el paquet)
2. Com es diu el getter de `boolean activo`?
   - a) `getActivo()`   b) `isActivo()`
3. Pot un mètode estàtic usar `this`?
   - a) Sí, sempre   b) No: no hi ha objecte del qual parlar
4. Què fa `Config.IVA = 0.5` si `IVA` és `static final`?
   - a) Canvia el valor   b) Error de compilació
5. Si dos objectes compartixen un atribut `static int x`, i un l'incrementa...
   - a) Només l'objecte que l'incrementa ho veu   b) Els dos ho veuen canviat

<details>
<summary>🔄 Solucions</summary>

1. **b)** — sense modificador és package-private: ho veu el mateix paquet.
2. **b)** — amb `boolean` la convenció usa `is` en comptes de `get`.
3. **b)** — els estàtics no tenen `this`.
4. **b)** — `final` prohibix modificar la constant: error de compilació.
5. **b)** — l'atribut `static` és compartit: només hi ha una còpia per a tots.

</details>

---

## 🤬 CONRAD VS EL MÓN: "Per què tot públic?"

> *CONRAD, el nostre compilador cascarrabutxes, opina sobre el clàssic del novell.*

**CONRAD:** — UNA ALTRA VEGADA! Ve un alumne i em diu: *CONRAD, el meu programa funciona però després es trenca en el mòdul de facturació*. I jo: val, com estan els teus atributs? *Pues públics, per a anar més ràpid.* AI, MARE MEUA! Un `public` en un atribut és una invitació a què qualsevol classe li fique un valor impossible. És clar que funciona... fins que deixa de funcionar a les 3 de la matinada.

*I després està el que escriu* `setEdad(int edad) { this.edad = edad; }` *sense validar res. Un setter sense validar és un porter adormit: deixa passar a qualsevol, fins i tot amb edats negatives.*

*I el colmo:* un mètode `static` intentant llegir `nombre` d'instància. No saps ni de quin objecte parles! T'ho dic des del punt 6: el `static` no té `this`.

**La lliçó:** abans de queixar-te de bugs rars, revisa la frontera: els atributs són `private`? Els setters validen? Allò estàtic està on toca? El 90% dels estats impossibles s'eviten amb un bon cadenat a la classe.

---

## ⚡ Laboratori de Tortura: la caixa forta sense cadenat

> **Duració estimada:** 30 minuts
> **Ferramenta:** el teu IDE i un fitxer nou

**El escenari:** copia esta classe i fes que siga una classe "professional". Té **4 problemes** de visibilitat i disseny que la deixen com una porta oberta.

```java
public class Mascota {
    public String nombre;
    public int edad;
    public static int totalMascotas = 0;

    public Mascota(String nombre, int edad) {
        nombre = nombre;
        edad = edad;
        totalMascotas++;
    }

    public void cumplirAnos() {
        edad = edad + 1;
    }
}
```

**Fallada intencionada:** un dels problemes sembla correcte a simple vista, però fa que el `nombre` i l'`edad` de la mascota es queden "en blanc" en nàixer.

**La teua tasca:** convertir-la en una classe encapsulada: atributs `private`, getters, setters amb validació (l'edat no pot ser negativa), i corregeix el constructor. A més, prova que `totalMascotas` puja amb cada `new`.

**Pistes per quan et frustres (no abans):**

1. Els atributs haurien de ser `public`? *no → és el primer problema.*
   <details><summary>I si continuec atascat?</summary>Posa'ls `private` i crea getters i setters amb la convenció `getX()`/`setX()`.</details>
2. Què passa amb `nombre = nombre;` i `edad = edad;`? *Sonen a assignar-se a si mateixos.*
   <details><summary>I si continuec atascat?</summary>Sense `this`, el paràmetre s'assigna a si mateix i l'atribut es queda amb el seu valor per defecte. Usa `this.nombre = nombre`.</details>
3. Què hauria de validar el setter de l'edat?
   <details><summary>I si continuec atascat?</summary>Que l'edat no siga negativa. Si és invàlida, no l'apliques i avisa.</details>
4. `totalMascotas` està bé com està? *Recorda la convenció d'accés.*
   <details><summary>Solució final</summary>

```java
public class Mascota {
    public static int totalMascotas = 0;

    private String nombre;
    private int edad;

    public Mascota(String nombre, int edad) {
        this.nombre = nombre;
        setEdad(edad);
        totalMascotas++;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        if (nombre != null && !nombre.trim().isEmpty()) {
            this.nombre = nombre;
        }
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        if (edad >= 0) {
            this.edad = edad;
        } else {
            System.out.println("Edat invàlida: " + edad);
        }
    }

    public void cumplirAnos() {
        this.edad++;
    }
}
```

Els 4 problemes: atributs públics, constructor sense `this` (els paràmetres s'assignaven a si mateixos), setter d'edat sense validar i `cumplirAnos()` que podia acabar en edats impossibles. Amb `private` + validació, la mascota ja no pot "nàixer en blanc" ni tindre edat negativa.

</details>

---

## 🧩 L'EMBOLIC: el setter que no validava

El següent codi pretén encapsular una classe `CuentaBancaria`, però té diversos errors. Troba'ls:

```java
public class CuentaBancaria {
    public double saldo;
    private String titular;

    public CuentaBancaria(String titular, double saldoInicial) {
        titular = titular;
        saldo = saldoInicial;
    }

    public double getSaldo() {
        return saldo;
    }

    private void setSaldo(double saldo) {
        if (saldo >= 0) {
            this.saldo = saldo;
        }
    }
}
```

1. L'atribut `saldo` està ben encapsulat?
2. Quin error hi ha al constructor amb `titular = titular`?
3. Per què `setSaldo` és `private`? Com es modifica el saldo llavors?

> 🕶️ **Don Tip:** `this` resol ambigüitats. Si paràmetre i atribut es diuen igual, sense `this` t'assignes el paràmetre a si mateix i l'atribut es queda "en blanc".

<details>
<summary>🔄 Solucions</summary>

1. **No.** `saldo` és `public`: qualsevol pot fer `cuenta.saldo = -500` des de fora, saltant-se tota validació. Hauria de ser `private` i modificar-se només a través de mètodes com `ingresar()` i `retirar()`.
2. `titular = titular` assigna el paràmetre a si mateix. L'atribut `titular` de la classe es queda amb el seu valor per defecte (`null`). Ha de ser `this.titular = titular`.
3. Si `setSaldo` és `private`, ningú de fora pot modificar el saldo, ni tan sols amb validació. La classe hauria d'exposar operacions de negoci (`ingresar(double)`, `retirar(double)`) que criden internament a la lògica de canvi, com vam fer en el punt 8.

</details>

---

## 🏆 Assoliments d'esta unitat

| Assoliment | Com aconseguir-ho |
|---|---|
| 🏅 **El Candidat al Cadenat** | Explicar els 4 nivells de visibilitat i qui veu cada cosa, sense mirar |
| 🏅 **Porter Estricte** | Escriure una classe amb atributs `private`, getters i setters amb validació |
| 🏅 **El Comptador de la Classe** | Crear una classe amb comptador `static` i ids autoincrementals que funcione |
| 🏅 **L'Endevinador Estàtic** | Predir "Què imprimeix?" en un trencaclosques de `static` vs instància sense executar |
| 🏅 **El Refactoritzador** | Convertir la classe del Laboratori en una classe ben encapsulada sense mirar la solució |

---

## 🧠 Atreveix-te a Pensar

1. **Sense executar:** què imprimeix este programa?

```java
public class Contador {
    static int n = 0;
    int m = 0;

    public static void subirN() { n++; }
    public void subirM() { m++; }

    public static void main(String[] args) {
        Contador a = new Contador();
        Contador b = new Contador();

        a.subirM();
        b.subirM();
        a.subirM();
        Contador.subirN();
        Contador.subirN();

        System.out.println(a.m + " " + b.m + " " + Contador.n);
    }
}
```

2. **L'atribut fantasma:** en `CuentaBancaria`, com faries que el saldo només poguera pujar amb ingressos i baixar amb retirades, sense que ningú poguera posar-lo a un valor arbitrari?
3. **El detectiu:** el teu programa accepta edats negatives perquè "ningú no sap qui les introduïx". Quina ferramenta d'esta unitat uses per a parar-ho?
4. **Vertader o fals:** "un atribut `static` té una còpia per cada objecte creat".

<details>
<summary>💡 Solucions</summary>

1. Imprimix **`2 1 2`**: `a.m` puja dos voltes (2), `b.m` una (1), i `n` (estàtic) puja dos voltes (2). El `m` és de cada objecte; el `n` és compartit.
2. Declarant `saldo` com a `private` i creant només mètodes `ingresar(double)` i `retirar(double)` que validen. Sense setter públic per al saldo: només operacions de negoci.
3. La **encapsulació**: `private int edad` + `setEdad(int)` que valide `edad >= 0`. L'error es detecta a la frontera, no a quilòmetres.
4. **Fals.** Un atribut `static` té **una sola còpia** compartida per tots els objectes.

</details>

---

## 🧩 Crucigrama de Bits

```
Horizontal:
1. Modificador d'accés més restrictiu (7 lletres)
4. La classe no el té, l'objecte sí, quan parlem de "jo" (4 lletres)
6. Mètode que llig un atribut privat (6 lletres)

Vertical:
2. Valor fix de la classe, en MAJÚSCULES (9 lletres)
3. El que pertany a la classe, no a l'objecte (6 lletres)
5. Prefix del getter quan l'atribut és booleà (2 lletres)
```

<details>
<summary>📝 Solucions</summary>

**Horizontal:** 1. PRIVATE · 4. THIS · 6. GETTER
**Vertical:** 2. CONSTANTE · 3. STATIC · 5. IS

</details>

---

## 💬 Preguntes d'Entrevista de Treball

> Preguntes reals que et farien per a programador Java junior.

1. **"Explícam'ho, com si jo fóra la teua àvia, per què els atributs no haurien de ser públics."**
2. **"Quina és la diferència entre un mètode estàtic i un mètode d'instància?"**
3. **"Què és l'encapsulació i quins avantatges aporta?"**
4. **"Per què `main` és `static`?"**
5. **"Quan usaríes `static final`?"**
6. **"Un company ha deixat `public` un atribut que guarda l'estat d'un joc i apareixen bugs impossibles. Què fas?"**

---

## 🤷 No hi ha preguntes tontes

> ❓ **Package-private i `default` són el mateix?**

Sí: es diuen igual. És el nivell que Java assumix quan no escrius `public`, `private` ni `protected`. No confongues amb la paraula `default`, que és per a una altra cosa.

---

> ❓ **Un setter sempre ha d'imprimir un missatge quan el valor és invàlid?**

No. Una altra opció molt professional és **llançar una excepció** (`IllegalArgumentException`), perquè el codi que crida s'assabente i decidisca. Imprimir és còmode per a practicar; llançar excepcions és el que veuràs en codi de producció.

---

> ❓ **Puc tindre un atribut estàtic que siga un objecte de la seua pròpia classe?**

Sí! És el patró **Singleton**: un `private static MiClase instancia` i un mètode `getInstance()`. És com tindre una única pedra filosofal. Però això és un altre tema... que algun dia mereixerà la seua pròpia unitat.

---

## 🎬 Post-Crèdits

El programador acaba la seua classe `CuentaBancaria` blindada: atributs `private`, getters, setters amb validació i un comptador estàtic que compta els comptes creats. Se sent un fortí ambulant.

S'acosta CONRAD, el compilador cascarrabutxes, amb la seua tassa fumant.

**CONRAD:** — Eixò era una classe o una caixa forta del Banc d'Espanya? `private`, validació, constants... Fins a constructor privat en una classe utilitària que t'has inventat. No està malament per a un aprenent de cadenats.

**Novell:** — I ara què? Les meues classes ja no es trenquen encara que algú intente trencar-les.

**CONRAD:** — *fes un glop* Blindar està bé, però un banc amb un sol compte és un banc trist. Els objectes es relacionen entre si: hereten, compartixen, s'especialitzen. Això és una altra història. La pròxima parada t'ho conta.

El novell guarda el seu projecte, tanca l'IDE i sent que els seus objectes ja no són cases de vidre.

**PROXIMAMENT EN U08:** Herència, Polimorfisme i Interfícies. El moment en què les teues classes **es miren als ulls i es diuen "mira, això ho compartim"**. 🧬

---

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static) · **Anterior:** [08 · Be the Code: encapsula la teua classe](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static/08-be-the-code) · **Següent:** **[U08 · Herència, Polimorfisme i Interfícies](/ApuntesProgramacion/va/08-herencia-polimorfismo-interfaces)**