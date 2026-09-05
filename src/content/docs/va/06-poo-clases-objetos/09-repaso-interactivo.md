---
title: "09 — Repàs interactiu: domina les classes"
description: "El tancament pràctic de la unitat, amb objectes, constructors i un `null` que no funcionarà 😈"
---

<p><small>El tancament pràctic de la unitat, amb objectes, constructors i un `null` que no funcionarà 😈</small></p>

> 🗺️ **Estàs en:** 🏗️ **U06 · POO: Classes i Objectes** → 09 · Repàs interactiu

---

## 📬 La idea en una frase

> **En este punt no aprenem res de nou: ho convertim tot en pràctica. I, com sempre, alguna cosa no funcionarà.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaben de donar-te este programa per a executar:*

```java
public class Galleta {
    String sabor;

    public Galleta(String sabor) {
        this.sabor = sabor;
    }

    void comer() {
        System.out.println("Ñam, galleta de " + sabor);
    }
}

public class Main {
    public static void main(String[] args) {
        Galleta g1 = new Galleta("chocolate");
        Galleta g2 = new Galleta("vainilla");
        Galleta g3 = g1;
        g3.sabor = "limón";
        g1.comer();
        g2.comer();
    }
}
```

**Què imprimixes per pantalla? Tria saviament:**

1. **`Ñam, galleta de chocolate` i `Ñam, galleta de vainilla`** → Cada galeta guarda el seu sabor original, sempre. ❌
2. **`Ñam, galleta de limón` i `Ñam, galleta de vainilla`** → ✅ Correcte! `g3 = g1` copia la referència, no la galeta: `g3` i `g1` són la mateixa galeta. Canviar el sabor amb `g3` ho canvia per a `g1`. `g2` és una altra galeta, independent.
3. **`Ñam, galleta de limón` i `Ñam, galleta de limón`** → El canvi de `g3` contamina totes les galetes. ❌

> <details>
> <summary>🔄 Solució</summary>
>
> L'opció **2**. L'assignació `g3 = g1` crea un **àlies**: dos variables, un objecte. Este és l'exercici que separa els qui han entès les referències dels qui aniran a plorar en l'examen.
>
> </details>

---

## 🔥 Fireside Chat: Classe vs Objecte

> *Dos veterans del motle i la galeta discutixen al costat de la safata del forn.*

**Classe:** — Mira, jo soc el motle. Sense mi, els teus objectes serien amorfs. Jo definisc quins atributs i mètodes tenen tots els meus objectes. Soc la constitució del meu poble.

**Objecte:** — La constitució... clar, i jo soc el ciutadà que paga impostos. Tu ets un fitxer `.java` al disc. Jo ocupe memòria, tinc saldo, puc accelerar. Quan executen el programa, el que treballa soc jo.

**Classe:** — I quants ciutadans com tu puc produir? Milers. Jo soc únic, tu eres reproduïble. Eres una còpia, un clon, un *vulgar* duplicat.

**Objecte:** — Un duplicat amb vida pròpia, sí. Tu definixes el plànol, però jo soc l'edifici. Ningú viu en un plànol. I et recorde: sense `new`, tu no ets més que teoria de fitxer.

**Classe:** — Sense mi, `new` no tindria res a fabricar. Ens necessitem. Com el tallagalletas i la galeta.

**Objecte:** — Tracte fet. Tu el motle, jo la galeta. I que ningú s'oblide de quina es menja al final.

> La lliçó: la **classe** és el disseny (QUÈ i CÓM), l'**objecte** és la instància concreta (QUI). Sense classe no hi ha objecte; sense `new`, la classe no dona de menjar.

---

## 🕵️ Qui Soc?

Endevina quin concepte de la unitat soc:

1. **Soc el motle que definix atributs i mètodes, però no soc cap cosa concreta.**
2. **Soc la galeta: una cosa concreta, amb valors propis, vivint en la memòria.**
3. **Soc el mètode especial que s'executa amb cada `new` perquè l'objecte nasca ben preparat.**
4. **Soc la referència que no apunta a cap objecte; usar-me provoca l'error més famós de Java.**
5. **Soc la paraula que usa l'objecte per a parlar de si mateix i desfer líos de noms.**
6. **Soc l'adreça on viu l'objecte, la zona de memòria on Java col·loca les galetes.**

<details>
<summary>🔄 Respostes</summary>

1. **La classe** — el tallagalletas, el disseny.
2. **L'objecte** — la instància concreta creada amb `new`.
3. **El constructor** — es diu igual que la classe i no retorna res.
4. **`null`** — usar-la llança `NullPointerException`.
5. **`this`** — la referència a l'objecte actual.
6. **El heap** — la zona de memòria on viuen els objectes (la variable guarda la *referència*).

</details>

---

## 🤬 CONRAD VS EL MÓN: "Constructor, on eres?"

> *CONRAD, el nostre compilador cascarrabutxes, opina sobre el clàssic del novell.*

**CONRAD:** — UNA ALTRA VEGADA! Ve un alumne i em diu: *CONRAD, no compila*. I jo: val, què diu l'error? *Pues no ho sé, no l'he llegit.* AI, MARE MEUA! Pose la línia exacta, el motiu i fins a la fletxeta `^`, i no ho lliges?

*I després està el clàssic:* escriuen un constructor amb paràmetres... i criden a `new Clase()` sense arguments. *Però si tu mateix has borrat el constructor buit!* Quan escrius qualsevol constructor, el buit desapareix. És com llevar la porta de ta casa i després intentar entrar per la porta.

*I el colmo dels colmos:* `Galleta g;` i després `g.sabor = "chocolate"`. Però si `g` no apunta a RES! No has fet `new`. Això és `NullPointerException` en l'acte. És com intentar posar-li un collaret a un gos que no existix.

**La lliçó:** abans d'acusar Java de "odiar-te", repassa el trio sagrat: **vaig fer `new`? el constructor existix amb els arguments que passe? la referència és `null`?** El 90% dels errors d'esta unitat s'arreglen amb estes tres preguntes. El compilador no t'odia: t'està passant les respostes de l'examen.

---

## 🎮 El Joc de les Decisions

Tria la resposta correcta per a cada decisió (respostes al final):

1. Quants objectes crea `Galleta a = new Galleta(); Galleta b = a;`?
   - a) 2   b) 1
2. Què imprimix `System.out.println(new Galleta("chocolate").sabor);`?
   - a) `chocolate`   b) `null`
3. `Persona p;` sense `new`. Quant val `p`?
   - a) `0`   b) `null`
4. Puc escriure `int duplicar(int x)` i `double duplicar(int x)` en la mateixa classe?
   - a) Sí, canvia el retorn   b) No, mateixa firma

<details>
<summary>🔄 Solucions</summary>

1. **b)** — `b = a` copia la referència: un sol objecte, dos noms.
2. **a)** — L'objecte es crea, s'inicialitza el seu `sabor` amb `"chocolate"` i s'hi accedeix a l'instant.
3. **b)** — Les referències sense inicialitzar valen `null`, no `0` (això era per als primitius).
4. **b)** — El tipus de retorn no forma part de la firma: mateixa firma, error de compilació.

</details>

---

## ⚡ Laboratori de Tortura: la fàbrica que plora

> **Durada estimada:** 30 minuts
> **Eina:** el teu IDE i un fitxer nou

**L'escenari:** copia este programa i fes que funcione. Té **3 errors** que impedixen que compile i 1 error de lògica que fa que el resultat siga incorrecte quan el arregles.

```java
public class Coche
    String marca;
    int velocidad;

    public Coche(String marca, int velocidad) {
        this.marca = marca;
        this.velocidad = velocidad;
    }

    void acelerar(int inc) {
        velocidad -= inc;
    }

    void mostrar() {
        System.out.println(marca + " va a " + velocidad);
    }

    public static void main(String[] args) {
        Coche c = new Coche();
        c.acelerar(50);
        c.mostrar()
    }
}
```

**Fallada intencionada:** un dels errors sembla correcte a simple vista perquè "es veu bé", però canvia per complet el comportament del programa.

**La teua tasca:** aconseguir que compile, que execute i que **tota** l'eixida siga correcta. Si el resultat no quadra, diagnostica.

**Pistes per quan et frustres (no abans):**

1. Hi ha algun `;` que falte? *no → seguix buscant.*
   <details><summary>I si encara estic atascat?</summary>Comprova també les claus `{}`: la classe necessita la seua obertura.</details>
2. Compila ja? *no → mira el missatge d'error i els arguments del constructor.*
   <details><summary>I si encara estic atascat?</summary>`new Coche()` no existix: l'únic constructor demana `(String, int)`. És l'error "el buit va desaparéixer".</details>
3. Executa però la velocitat ix rara? *És l'error de lògica: el signe del mètode.*
   <details><summary>Solució final</summary>

Els **3 errors de compilació**:

1. Falta la `{` d'obertura de la classe després de `Coche`.
2. `new Coche()` no coincidix amb el constructor: l'únic és `Coche(String, int)`. En escriure un constructor amb paràmetres, el buit desapareix.
3. Falta el `;` al final de `c.mostrar()`.

L'**error de lògica**: `velocidad -= inc` **resta** en lloc de sumar. Compila i executa perfectament, però el cotxe accelera "cap arrere": amb la velocitat inicial a 0 i accelerar 50, imprimix `Seat va a -50` en lloc de `Seat va a 50`. Un signe separava el teu cotxe de la veritat.

```java
public class Coche {
    String marca;
    int velocidad;

    public Coche(String marca, int velocidad) {
        this.marca = marca;
        this.velocidad = velocidad;
    }

    void acelerar(int inc) {
        velocidad += inc;
    }

    void mostrar() {
        System.out.println(marca + " va a " + velocidad);
    }

    public static void main(String[] args) {
        Coche c = new Coche("Seat", 0);
        c.acelerar(50);
        c.mostrar();
    }
}
```

Eixida correcta: `Seat va a 50`. Amb la versió trencada, una vegada arreglats els altres errors, la velocitat eixia `-50`: el signe era la pista de l'error de lògica.

</details>

---

## 🏆 Assoliments d'esta unitat

| Assoliment | Com aconseguir-lo |
|---|---|
| 🏅 **El Tallagalletas** | Explicar la diferència entre classe i objecte amb l'analogia de les galetes sense mirar |
| 🏅 **Primera Classe** | Escriure una classe amb atributs, constructor i mètodes que funcione a la primera |
| 🏅 **Caçador de NPE** | Trobar el `null` culpable d'un `NullPointerException` sense pistes |
| 🏅 **El Desambiguador** | Explicar per què cal `this` quan hi ha xoc de noms |
| 🏅 **El Constructor Rudo** | Dissenyar una classe amb sobrecàrrega de constructors encadenats amb `this(...)` |

---

## 🧠 Atreveix-te a Pensar

1. **Sense executar:** què imprimix este programa?

```java
public class Cuenta {
    int saldo;

    void sumar(int x) {
        saldo += x;
    }
}

public class Main {
    public static void main(String[] args) {
        Cuenta a = new Cuenta();
        a.saldo = 100;
        Cuenta b = a;
        b.sumar(50);
        System.out.println(a.saldo);
    }
}
```

2. **El constructor perdut:** en l'exemple `Galleta` del punt 2 (sense constructor), què li passa al codi si afegixes `public Galleta(String sabor)` i deixes `new Galleta()` en un altre lloc?
3. **El detectiu del heap:** el teu programa imprimix `null` quan esperaves un nom. Quina eina uses i què mires primer?
4. **Vertader o fals:** "si un mètode rep un objecte i dins del mètode faig `parametro = null`, l'objecte original desapareix".

<details>
<summary>💡 Solucions</summary>

1. **`150`**. `b = a` crea un àlies: `b.sumar(50)` modifica el compte que també veu `a`.
2. **Error de compilació** en `new Galleta()`: en escriure un constructor amb paràmetres, el constructor buit desapareix.
3. El **depurador**: posa un breakpoint on s'assigna el nom i observa si l'objecte va arribar a crear-se amb `new` o si l'atribut va quedar en `null`. (O llig el stack trace si hi ha un NPE.)
4. **Fals.** `parametro = null` només canvia la *còpia* de la referència: l'objecte original continua viu mentre una altra variable l'apunte. Perquè desaparega, cap referència no li ha d'apuntar.

</details>

---

## 🧩 Crucigrama de Bits

```
Horitzontal:
1. Operador que fabrica objectes en memòria (3 lletres)
3. El mètode que prepara l'objecte en nàixer (11 lletres)
5. Referència que no apunta a res (4 lletres)
6. Zona de memòria on viuen els objectes (4 lletres)

Vertical:
2. Paraula que usa l'objecte per a parlar de si mateix (4 lletres)
4. El motle que definix atributs i mètodes (5 lletres)
```

<details>
<summary>📝 Solucions</summary>

**Horitzontal:** 1. NEW · 3. CONSTRUCTOR · 5. NULL · 6. HEAP
**Vertical:** 2. THIS · 4. CLASE

</details>

---

## 💬 Preguntes d'Entrevista de Treball

> Preguntes reals que et farien per a programador Java júnior.

1. **"Explica'm, com si jo fóra la teua àvia, la diferència entre una classe i un objecte."**
2. **"Què fa `new` per dins quan crees un objecte?"**
3. **"Per què `String` es compara amb `equals` i no amb `==`?"**
4. **"Java passa els arguments per valor o per referència? Justifica amb un exemple d'objecte."**
5. **"Si dos variables apunten al mateix objecte i una li canvia un atribut, què veu l'altra?"**
6. **"Per a què servix sobrecarregar un constructor i com l'encadenes amb `this`?"**

---

## 🤷 No hi ha preguntes tontes

> ❓ **Puc escriure diverses classes en un mateix fitxer `.java`?**

Sí, però només una pot ser `public` (la que dona nom al fitxer). Les altres van sense `public`. Per als projectes de classe, un fitxer = una classe pública, i cada classe en el seu fitxer. Els teus professors ho agrairan.

---

> ❓ **Per què a vegades veig `get` i `set` abans dels noms de mètodes, com `getSaldo()`?**

Eixa és la convenció dels **getters i setters**: mètodes per a llegir (`getSaldo`) i modificar (`setSaldo`) atributs de forma controlada. Sona a burocràcia, però és la base de l'**encapsulació**, i té la seua unitat sencera: la U07. Ací els veuràs de passada; allí els dominaràs.

---

> ❓ **Puc tindre un mètode anomenat igual que el constructor?**

No. El constructor sempre es diu igual que la classe i no retorna res. Un mètode normal no pot tindre el nom de la classe (a menys que siga... un constructor, que es detecta per la falta de tipus de retorn). Si intentes afegir-li un `void` davant al constructor, Java et mirarà rar.

---

## 🎬 Post-Crèdits

La programadora acaba la seua fàbrica de galetes virtual: una classe `Galleta` amb constructor, una classe `Horno` que la instancia, i un `main` que fornaja cinc galetes distintes. Cada una amb el seu sabor. Fins que, en l'última línia, se li escapa un `null` i tot s'apaga amb un `NullPointerException`.

S'acosta CONRAD, el compilador cascarrabutxes, amb la seua tassa humejant.

**CONRAD:** — Cinc galetes, cinc objectes, i només un `null` per a espatlar-ho tot. Típic. Saps què ha passat?

**Programadora:** — No vaig fer `new`. La referència apuntava al buit.

**CONRAD:** — *assenteix* Veus. Quan entens què guarda una variable, els errors deixen de ser màgia. Classe, objecte, constructor, `this`, referències... Ja no escrius receptes, crees mons. Però això no ha fet més que començar.

**Programadora:** — Què més hi ha?

**CONRAD:** — *fa un glop* Ara els teus atributs estan a l'aire. Qualsevol els toca. La pròxima parada és saber qui té permís per a entrar i qui no. Espera'm, que vaig a gaudir veient-te protegir les teues dades.

**PRÒXIMAMENT EN U07:** Visibilitat, encapsulació i `static`. El moment en què els teus objectes aprenen a dir "això no es toca". 🔒

---

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/06-poo-clases-objetos) · **Anterior:** [08 · Be the Code: dissenya la teua classe](/ApuntesProgramacion/va/06-poo-clases-objetos/08-be-the-code) · **Següent:** **[U07 · Visibilitat, Encapsulació i Static](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static)**