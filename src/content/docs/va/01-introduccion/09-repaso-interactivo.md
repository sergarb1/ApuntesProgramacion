---
title: "09 — Repàs interactiu: consolida el que has après"
description: El tancament pràctic de la unitat, amb cim i un bug que no funcionarà 😈
---

<p><small>El tancament pràctic de la unitat, amb cim i un bug que no funcionarà 😈</small></p>

> 🗺️ **Estàs en:** 🚀 **U01 · Introducció a Java** → 09 · Repàs interactiu

---

## 📬 La idea en una frase

> **En este punt no aprenem res de nou: ho convertim tot en pràctica. I, com sempre, alguna cosa no funcionarà.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaben de donar-te este programa per a executar:*

```java
public class Misterio {
    public static void main(String[] args) {
        System.out.println("Café " + 1 + 2);
        System.out.println("Café " + (1 + 2));
    }
}
```

**Què imprimixes per pantalla? Tria sàviament:**

1. **`Café 3` i `Café 3`** → La JVM sempre suma els números, ocórrega el que ocórrega. ❌
2. **`Café 12` i `Café 3`** → ✅ Correcte! En la primera línia, en vore text abans del `+`, Java concaten: `"Café " + 1` és `"Café 1"` i després `+ 2` dona `"Café 12"`. En la segona, els parèntesis forcen la suma primer: `Café 3`.
3. **`Café 1 2` i `Café 12`** → Els parèntesis no existixen per a la JVM. ❌

> <details>
> <summary>🔄 Solució</summary>
>
> L'opció **2**. Quan un `+` mescla text i números, Java concaten (unix cadenes). Els parèntesis `(1 + 2)` obliguen a sumar primer. Este és el clàssic que separa els que han fet la unitat dels que han dormit.
>
> </details>

---

## 🔥 Fireside Chat: JDK vs JRE

> *Dos veterans del cafè discutixen al costat de la tassa humejant.*

**JRE:** — Mira, jo sóc l'entorn d'execució. Porte la JVM, les llibreries, tot el necessari per a *executar* Java. Sense mi, el teu `.class` no corre ni de broma.

**JDK:** — Executar, executar... I qui crea el `.class`? Jo. Porte el compilador `javac`, el `javadoc`, el `jar`... Jo sóc el kit complet. Tu ets només la mitat servida.

**JRE:** — Escolta, que sense mi tu ets un catàleg de ferramentes sense endollar. Compiles un programa i... on l'executes? A casa meua.

**JDK:** — *sarcàstic* Ah, clar, com si jo no te portara dins. Quan instale jo, véns tu inclòs. Ets com el regal que s'inclou en el pack gran.

**JRE:** — Val, però per a l'usuari final que només vol *usar* programes Java, a qui criden? A mi! Sóc més lleuger, menys complex.

**JDK:** — I sense compilador. O siga, un cuiner sense recepta. Parlarem quan vulgues *crear* alguna cosa.

**JRE:** — *sospir* Sempre el mateix argument.

> La lliçó: el **JDK inclou el JRE**. Per a crear programes necessites el JDK. Per a executar-los ja instal·lats, et basta el JRE. Mai et poses del costat de només un en un examen.

---

## 🕵️ Qui Soc?

Endevina quin concepte de la unitat sóc:

1. **Traduïsc el teu codi `.java` a bytecode. Sóc un professor de llengua molt puntillós: qualsevol coma mal posada m'ofén.**
2. **Sóc la màquina de cafè: execute el bytecode i funcion igual en qualsevol sistema operatiu.**
3. **Sóc la porta d'entrada del teu programa. Si canvie el meu nom, Java no troba l'entrada i tot es queda a les fosques.**
4. **Sóc el detectiu de l'IDE: et deixe parar el programa on vulgues i espiar les variables.**

<details>
<summary>🔄 Respostes</summary>

1. **El compilador (`javac`)** — Traduïx `.java` a `.class` i odia els errors de sintaxi.
2. **La JVM** — La Java Virtual Machine, igual en qualsevol plataforma.
3. **El mètode `main`** — `public static void main(String[] args)` és el botó d'inici exacte que Java busca.
4. **El depurador** — Amb breakpoints, Step Over/Into i Watch.

</details>

---

## 🤬 CONRAD VS EL MÓN: "El compilador m'odia"

> *CONRAD, el nostre compilador cascarrabias, opina sobre el clàssic del novat.*

**CONRAD:** — ALTRA VEGADA! Ve un alumne i em diu: *CONRAD, no compila*. I jo: val, què diu l'error? *Pues no ho sé, no l'he llegit.* Ai, mare meua! Et done la línia exacta, el motiu i fins i tot la fletxeta `^` assenyalant el lloc, i no el lligues? És com queixar-se que la sopa està freda sense mirar-la.

*I després està el clàssic:* `Public` amb majúscula. PER QUÈ? La paraula és `public`. En minúscula. Així, xicoteta. Porte 25 anys compilant i encara veig `Public`, `String` sense la S... I les classes que no coincidixen amb el nom de l'archiu! Si ho demana el propi archiu!

**La lliçó:** abans de plorar sobre el teclat, **llegix el missatge d'error**. Archiu, línia, motiu. El 90% dels errors del novat s'arreglen sols amb eixa informació. El compilador no t'odia: t'està passant les respostes de l'examen.

---

## ⚡ Laboratori de Tortura: el programa que no arranca

> **Duració estimada:** 30 minuts
> **Ferramenta:** el teu IDE i un archiu nou

**L'escenari:** copia este programa en el teu IDE i fes que funcione. Té **3 errors** que impedixen que compile i 1 error de lògica que fa que el resultat siga incorrecte quan l'arregles.

```java
public class Tortura
    public static void main(string[] args) {
        int a = 3;
        int b = 4;
        System.out.println("La suma es: " + a + b)
        System.out.println("El producto es: " + (a * b));
    }
}
```

**Fallada intencionada:** un dels errors pareix correcte a simple vista perquè "es veu bé", però canvia per complet l'eixida del programa.

**La teua tasca:** aconseguir que compile, que execute i que **tota** l'eixida siga correcta. Si el resultat no quadra, diagnostica.

**Pistes per quan et frustres (no abans):**

1. Hi ha algun `;` que falte? *no → seguix buscant.*
   <details><summary>I si encara estic atascat?</summary>Comprova també les claus `{}`: la classe necessita la seua obertura.</details>
2. Ja compila? *no → mira el missatge d'error i les majúscules.*
   <details><summary>I si encara estic atascat?</summary>`string` ha de ser `String`, i `public` va en minúscula.</details>
3. Executa però la suma ix rara? *És l'error de lògica: el `+` sense parèntesis concaten en lloc de sumar.*
   <details><summary>Solució final</summary>

```java
public class Tortura {
    public static void main(String[] args) {
        int a = 3;
        int b = 4;
        System.out.println("La suma es: " + (a + b));
        System.out.println("El producto es: " + (a * b));
    }
}
```

Eixida correcta: `La suma es: 7` i `El producto es: 12`.

</details>

---

## 🏆 Assoliments d'esta unitat

| Assoliment | Com aconseguir-lo |
|---|---|
| 🏅 **El Cafè del Matí** | Explicar JVM, JRE i JDK amb l'analogia de la cafeteria sense mirar |
| 🏅 **Primer Crit** | Executar el teu Hola Món sense ajuda en l'IDE |
| 🏅 **Detectiu de Bugs** | Trobar els 3+1 errors del Laboratori sense usar les pistes |
| 🏅 **Drecera Pro** | Escriure un programa usant només `psvm` + `sout` i dreceres |
| 🏅 **Traductor** | Generar la documentació Javadoc d'una classe teua i obrir els HTML |

---

## 🧠 Atreveix-te a pensar

1. **Sense executar:** què imprimix este programa?

```java
public class Misterio2 {
    public static void main(String[] args) {
        System.out.print("Uno ");
        System.out.println("Dos");
        System.out.print("Tres");
    }
}
```

2. **El saludo que no saluda:** en l'exemple `Saludos` del punt 3, com faries perquè `saludo()` també s'executara, sense canviar el mètode en si?
3. **El detectiu de l'IDE:** el teu programa "funciona" però imprimix `La suma es: 34` en lloc de `7`. Quina ferramenta uses i quines línies examines primer?
4. **Vertader o fals:** "`javac` i `java` fan el mateix: el primer és per a Windows i el segon per a Linux."

<details>
<summary>💡 Solucions</summary>

1. `Uno Dos` en una línia i `Tres` en la següent (sense salt després de "Tres"). `print` no salta de línia, `println` sí.
2. Afegint la crida dins del `main`: `saludo();` després del primer `println`. Només s'executa el que es crida des de `main`.
3. El **depurador**: posa un breakpoint en la línia de la suma i observa amb Step Over com es concaten `"La suma es: " + 3` → `"La suma es: 3"` i després `+ 4` → `"La suma es: 34"`. La solució és `(a + b)`.
4. **Fals.** `javac` compila (`.java` → `.class`) i `java` executa (la JVM corre el `.class`). Tots dos servixen en qualsevol sistema.

</details>

---

## 🧩 Crucigrama de bits

```
Horitzontal:
1. Entorn de Desenrotllament Integrat (3 lletres)
3. El mètode que Java busca en arrancar (4 lletres)
5. Kit complet per a crear programes (3 lletres)
6. Codi intermedi que entén la JVM (8 lletres)

Vertical:
2. Màquina virtual que executa el bytecode (3 lletres)
4. Imprimix text sense saltar de línia (5 lletres)
```

<details>
<summary>📝 Solucions</summary>

**Horitzontal:** 1. IDE · 3. MAIN · 5. JDK · 6. BYTECODE
**Vertical:** 2. JVM · 4. PRINT

</details>

---

## 💬 Preguntes d'entrevista de treball

> Preguntes reals que et farien per a programador Java júnior.

1. **"Explica'm, com si jo fora la teua iaia, la diferència entre JDK, JRE i JVM."**
2. **"Què és el mètode `main` i per què té eixa firma exacta?"**
3. **"Un programa compila però fa el que no ha de fer. Quin és el teu procés per a arreglar-lo?"**
4. **"Què és un array i què passa si accedeixes a un índex que no existix?"**
5. **"Com li passes dades a un programa Java sense que et les demane per teclat?"**

---

## 🤷 No hi ha preguntes tontes

> ❓ **Puc escriure Java en un bloc de notes o necessite sí o sí un IDE?**

Pots, i de fet és un bon exercici: `notepad MiPrograma.java`, `javac MiPrograma.java`, `java MiPrograma`. Però l'IDE t'estalvia errors tontos amb l'autocompletat i et dona el depurador. Els pros usen IDE; els masoquistes, bloc de notes.

---

> ❓ **Per què el primer `println` d'Hola Món tenia "args" si no l'use?**

`String[] args` és obligatori en la firma del `main` encara que no l'uses. Java l'espera sí o sí. És com la firma en un contracte: està encara que no s'execute eixa clàusula. En el punt 6 vas vore com usar-lo.

---

> ❓ **Java i JavaScript són cosins?**

No, ni tan sols són del mateix planeta. Java és a JavaScript com un gos és a un gosset calent. El nom va ser una estratègia de màrqueting de Netscape per a muntar-se en el boom de Java.

---

## 🎬 Poscrèdits

El programador novat acaba el seu primer programa, el compila i l'executa. Tot perfecte. Llavors s'acosta CONRAD, el compilador cascarrabias, amb cara de pocs amics i una tassa humejant a la mà.

**CONRAD:** — Molt bonic l'Hola Món. I ara què? Vas a imprimir text tota la vida? Els programes de veritat *guarden* dades, *calculem* i *decidixen*. Sense variables, sense tipus, sense operadors... això és un triler de cartes.

**Novat:** — I això quan s'aprén?

**CONRAD:** — *fa un glop* La pròxima parada. Ja et veig declarant el teu primer `int`... i cometent el teu primer error de tipus. Espera'm, que jo estaré ahí per a riure'm.

El novat guarda el seu projecte, tanca l'IDE i sent que això només acaba de començar.

**PRÒXIMAMENT EN U02:** Variables, tipus de dades i operadors. El moment en què els teus programes deixen de dir "Hola" i comencen a *calcular*. 🔤

---

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/01-introduccion) · **Anterior:** [08 · L'IDE i el teu flux de treball](/ApuntesProgramacion/va/01-introduccion/08-ide-flujo-trabajo) · **Següent:** **[U02 · Variables, Tipus i Operadors](/ApuntesProgramacion/va/02-variables-tipos-operadores)**