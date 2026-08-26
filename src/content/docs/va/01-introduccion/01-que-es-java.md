---
title: 01 — Què és Java?
description: La trilogia del cafè i el secret de la tassa humejant ☕
---

<p><small>La trilogia del cafè i el secret de la tassa humejant ☕</small></p>

> 🗺️ **Estàs en:** 🚀 **U01 · Introducció a Java** → 01 · Què és Java?

---

## 📬 La idea en una frase

> **Java és un llenguatge de programació que s'executa dins d'una màquina virtual (la JVM), la qual cosa li permet córrer igual en Windows, Linux o macOS: "escriu una vegada, corre en qualsevol lloc".**

Si el teu ordinador és un cadell molt llest però amb zero iniciativa, Java és un dels idiomes que pots usar per a donar-li ordres. I la JVM és l'intèrpret que traduïx les teues ordres a l'idioma concret de cada cadell.

---

## 🔍 D'on ix este llenguatge?

Java va nàixer el **1995** en **Sun Microsystems**, i la seua història té una de les curiositats més divertides del sector: es va inspirar en la **màquina de cafè** de l'oficina. Per això el logo és una tassa humejant. No m'ho invente.

La idea dels seus creadors era simple però ambiciosa: un llenguatge que funcionara en **qualsevol dispositiu**, sense importar el sistema operatiu ni el maquinari. Abans de Java, cada plataforma necessitava la seua pròpia versió del programa. Java va proposar la solució: no programar per a l'ordinador, sinó per a una **màquina virtual** que l'ordinador simula.

> 💡 **Dada freak:** el llenguatge es va dir primer *Oak* (roure), per un arbre que es veia des de l'oficina. Van haver de canviar-lo per motius de marca registrada i, segons la llegenda, el nom "Java" es va triar pel cafè que prenien durant les reunions.

---

## 📦 Què és això del bytecode?

Quan escrius Java no escrius instruccions de la CPU del teu ordinador: escrius instruccions per a la **JVM**. El procés és així:

1. Tu escrius codi font en un archiu `.java`.
2. El **compilador** (`javac`) ho traduïx a *bytecode*: un idioma intermedi que entén la JVM. El resultat és un archiu `.class`.
3. La **JVM** llig el bytecode i l'executa en la teua màquina concreta.

```
El teu codi (.java)  --javac-->  bytecode (.class)  --JVM-->  ¡s'executa!
```

La gràcia és que eixe `.class` és el mateix per a totes les plataformes: la JVM de Windows, la de Linux i la de macOS saben llegir-lo. Només canvia la JVM, no el teu programa.

---

## ☕ La Trilogia del Cafè: JVM, JRE i JDK

Ací està el moment estrella de la unitat. Java funciona com una **cafeteria d'especialitat**, i has de memoritzar qui és qui:

| Concepte | És... | Analogia |
|---|---|---|
| **JVM** | La màquina que executa el bytecode | La màquina de cafè: té la seua recepta i funciona igual en qualsevol lloc |
| **JRE** | Tot el necessari per a *executar* Java | La cafeteria sencera: màquina, gots, sucre... |
| **JDK** | Tot el necessari per a *crear* programes | El kit complet per a muntar la teua cafeteria: màquina, grans, molinet i manual de barista |

- **JVM (Java Virtual Machine)**: la màquina de cafè. Executa el bytecode i viatja amb el teu programa a totes parts.
- **JRE (Java Runtime Environment)**: la cafeteria sencera. Té la JVM i les llibreries necessàries per a *executar* cafè ja fet. Si només vols executar programes, et basta.
- **JDK (Java Development Kit)**: el kit per a muntar la teua pròpia cafeteria. Inclou el JRE més el compilador `javac`, el generador de documentació `javadoc` i altres ferramentes de desenrotllament. Si vols *crear* programes, el necessites.

```java
// Imagina que això és un gra de cafè verd:
public class Cafe {
    public static void main(String[] args) {
        System.out.println("☕ ¡Café listo!");
    }
}
```

El JDK compila això a bytecode (cafè molt), el JRE ho passa per la JVM i... tachán! cafè en la teua pantalla.

> ⚠️ **Advertència:** no confongues JDK amb JRE. El JDK és el *ganivet del chef*; el JRE és el *plat servit*. El JDK inclou el JRE, així que instal·lant el JDK tens les dos coses. Instal·lar només el JRE et permet executar programes, però no crear-los.

---

## 🌍 Per què seguix viu Java tants anys després?

No és nostàlgia. Java seguix sent un dels llenguatges més demandats del món perquè:

- **És multiplataforma**: el mateix programa corre en mòbils, servidors, caixers i fins i tot en la rentadora intel·ligent.
- **Domina el món empresarial**: les grans empreses (banca, assegurances, logística) porten dècades construint els seus sistemes en Java.
- **És el llenguatge oficial d'Android** (en la seua variant Kotlin conviu, però Java seguix omnipresent).
- **Té una comunitat enorme**: qualsevol error que tingues, probablement algú ja el va resoldre fa deu anys en un fòrum.
- **És exigent, i això et fa millor**: Java t'obliga a ser ordenat. Els programadors que aprenen amb Java solen escriure codi més net.

---

## 🏫 Exemple guiat: recórrer el teu primer programa

Ja has vist `Cafe`. Anem a fixar les peces de qualsevol programa Java abans que el dissenyes tu en el punt 3:

```java
public class MiPrimerPrograma {
    public static void main(String[] args) {
        System.out.println("¡Holaaaa, mundo!");
        System.out.println("Estoy aprendiendo Java");
        System.out.println("Y me está gustando (de momento)");
    }
}
```

- `public class MiPrimerPrograma`: declares una classe anomenada `MiPrimerPrograma`. La classe és el contenidor del teu programa.
- `public static void main(String[] args)`: el "botó d'inici". Java busca esta línia en arrancar.
- `System.out.println(...)`: la veu del programa; crida text per la consola.

> 💡 **Detall pràctic:** la classe pública ha de dir-se **exactament igual que l'archiu**. Si l'archiu es diu `MiPrimerPrograma.java`, la classe ha de ser `MiPrimerPrograma`. Això és una regla de Java, no un capritx.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quina és la diferència entre JDK i JRE en una frase?
2. Què fa el compilador `javac` amb el teu codi `.java`?
3. Per què el logo de Java és una tassa humejant?

<details>
<summary>🔄 Respostes</summary>

1. El **JDK serveix per a crear** programes (inclou el compilador); el **JRE serveix per a executar-los**. El JDK conté el JRE.
2. Ho traduïx a **bytecode** (un archiu `.class`) que la JVM pot executar.
3. Perquè el llenguatge s'inspira en la màquina de cafè de l'oficina de Sun Microsystems: "escriu una vegada, corre en qualsevol lloc" (com el cafè, que es prepara igual en qualsevol cafeteria).

</details>

---

## ✅ Resum en 3 frases

1. Java executa el seu codi dins d'una **màquina virtual (JVM)**, la qual cosa li dona portabilitat total.
2. **JDK** crea (compila a bytecode), **JRE** executa, **JVM** transporta: com Amazon però amb cafè.
3. Java seguix sent rei en el món empresarial i aprendre'l et forma com a programador ordenat.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | JVM | La màquina virtual que executa el bytecode |
> | JRE | Entorn d'execució (JVM + llibreries) |
> | JDK | Kit de desenrotllament (compilador + JRE + ferramentes) |
> | Bytecode | Codi intermedi que entén la JVM |
> | Compilador | Traductor de codi font a bytecode |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/01-introduccion) · **Anterior:** [Índex de la unitat](/ApuntesProgramacion/va/01-introduccion) · **Següent:** [02 · Instal·lació del JDK](/ApuntesProgramacion/va/01-introduccion/02-instalacion-jdk)