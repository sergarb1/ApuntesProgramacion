---
title: "09 — Repàs"
description: "Sé el Codi, Fireside, Qui Soc, Laboratori, Crucigrama… 🧩"
---

<p><small>Sé el Codi, Fireside, Qui Soc, Laboratori, Crucigrama… 🧩</small></p>

> 🗺️ **Estàs en:** 🚀 **U01 · Introducció a Java** → 09 · Repàs

---

**En este punt no aprenem res de nou: ho convertim tot en pràctica. I, com sempre, alguna cosa no funcionarà.** 😈

---

## ⭐ Tracta de pensar com el codi, *my friend*...

Eres la JVM. Acaben de donar-te este programa per a executar:

```java
public class Misterio {
    public static void main(String[] args) {
        System.out.println("Café " + 1 + 2);
        System.out.println("Café " + (1 + 2));
    }
}
```

**Què imprimeixes per pantalla? Tria sàviament:**

1. **Café 3 i Café 3** → La JVM sempre suma els números, ocórrega el que ocórrega. ❌
2. **Café 12 i Café 3** → En la primera línia, en trobar text abans del `+`, Java concatena d'esquerra a dreta: "Café " + 1 és "Café 1", i després + 2 dona "Café 12". En la segona línia, els parèntesis forcen la suma aritmètica primer: (1 + 2) = 3, donant "Café 3".
3. **Café 1 2 i Café 12** → Els parèntesis no existeixen per a la JVM. ❌

### 🔄 Solució

L'opció 2. Quan un operador `+` mescla text i números, Java concatena (uneix cadenes). Tanmateix, els parèntesis `(1 + 2)` obliguen a realitzar primer la suma aritmètica. Este és el clàssic exercici que separa els qui han treballat la unitat dels qui han dormit.

---

## 🔥 Fireside Chat: JDK vs JRE

Dos veterans del café discuteixen al costat de la tassa fumejant.

- **JRE**: — Mira, jo soc l'entorn d'execució (Java Runtime Environment). Porte la JVM, les llibreries, tot el necessari per a executar Java. Sense mi, el teu `.class` corre ni de broma.
- **JDK**: — Executar, executar... I qui crea el `.class`? Jo. Porte el compilador `javac`, el generador de Javadoc, la ferramenta `jar`... Jo soc el kit complet de desenrotllament (Java Development Kit). Tu eres només la meitat servida.
- **JRE**: — Escolta, que sense mi tu eres un catàleg de ferramentes sense endollar. Compiles un programa i... on l'executes? A casa meua!
- **JDK**: (Sarcàstic) — Ah, clar! Com si jo no et portara dins. Quan m'instal·len a mi, tu vens inclòs. Eres com el regal que ve en el pack gran.
- **JRE**: — D'acord, però per a l'usuari final que només vol utilitzar aplicacions Java ja fetes, a qui criden? A mi! Soc més lleuger i ocupe menys espai.
- **JDK**: — I sense compilador. O siga, un cuiner sense ganivets. Parlarem quan vulgues crear alguna cosa.
- **JRE**: (Sospir) — Sempre el mateix argument...

💡 **La lliçó:** El JDK inclou el JRE. Per a programar i crear projectes necessites el JDK. Per a executar programes en la màquina de l'usuari final, en bastaria amb el JRE. Mai et penses que són opcions excloents en un examen.

---

## 🕵️ Qui soc?

Endevina quin concepte de la unitat soc:

1. Tradueix el teu codi `.java` a bytecode. Soc un professor de llengua molt puntillós: qualsevol coma o clau mal posada m'ofén.
2. Soc la màquina de café: execute el bytecode i funcione igual en qualsevol sistema operatiu.
3. Soc la porta d'entrada del teu programa. Si canvien el meu nom, Java no troba l'inici i tot es queda a les fosques.
4. Soc el detectiu de VS Code: et deixe parar el programa on vulgues (breakpoints) i espiar les variables pas a pas.

### 🔄 Respostes

1. El compilador (`javac`): Tradueix `.java` a `.class` i detesta els errors de sintaxi.
2. La JVM (Java Virtual Machine): La màquina virtual que executa el bytecode igual en qualsevol plataforma.
3. El mètode `main`: `public static void main(String[] args)` és el punt d'inici exacte que busca Java.
4. El depurador (debugger): Amb breakpoints, Step Over (`F10`), Step Into (`F11`) i el panell de variables.

---

## 🤬 CONRAD VS EL MÓN: "El compilador m'odia"

**CONRAD**, el nostre compilador cascarràbies, opina sobre el clàssic dels principiants:

**CONRAD**: — ALTRA VEGADA! Ve un alumne i em diu: "CONRAD, no compila". I jo li pregunte: "Val, què diu el missatge d'error?". I em respon: "Ah, no ho sé, no me l'he llegit". Ai, mare meua! Et done la línia exacta, el motiu i fins i tot la fletxeta `^` assenyalant el lloc exacte, i no ho llegeixes? És com queixar-se que el menjar està calent sense mirar el plat!

I després està el clàssic: `Public` amb majúscula. PER QUÈ? La paraula clau és `public`. En minúscula. Fa dècades que compile i encara veig `Public`, `string` amb minúscula en lloc de `String`... I les classes que no coincideixen amb el nom de l'arxiu! Si ho posa clar en l'error!

💡 **La lliçó:** Abans de plorar sobre el teclat, llegeix el missatge d'error. Arxiu, línia i motiu. El 90% dels errors dels principiants s'arreglen sols consultant eixa informació. El compilador no t'odia: t'està passant les respostes de l'examen.

---

## ⚡ Laboratori de Tortura: el programa que no arranca

- Duració estimada: 20–30 minuts
- Ferramenta: VS Code i un arxiu `.java` nou
- L'escenari: Copia este programa en un arxiu anomenat `Tortura.java` i fes que funcione. Té 3 errors que impedeixen que compile i 1 error de lògica que fa que el resultat siga incorrecte quan l'arregles.

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

### 🛠️ La teua tasca

Aconseguir que compile, que s'execute i que tota l'eixida siga correcta.

### 💡 Pistes (només si et bloques)

1. Falta alguna clau `{` d'obertura en la classe?
2. `string` va en majúscula o minúscula?
3. Falta algun `;` al final de la línia de la suma?
4. Quan aconseguís executar-lo, per què la suma ix `34` en lloc de 7? Recorda com funciona l'operador `+` amb cadenes de text.

### 🔄 Solució del Laboratori

```java
public class Tortura {
    public static void main(String[] args) {
        int a = 3;
        int b = 4;
        System.out.println("La suma es: " + (a + b)); // Parèntesis per a forçar la suma
        System.out.println("El producto es: " + (a * b));
    }
}
```

Eixida correcta per pantalla:

```
La suma es: 7
El producto es: 12
```

---

## 🏆 Assoliments d'esta unitat

| Assoliment | Com aconseguir-lo |
| --- | --- |
| **🏅 El Café del Matí** | Cal explicar la diferència entre JVM, JRE i JDK amb l'analogia de la cafeteria sense mirar els apunts. |
| **🏅 Primer Crit** | Executar el teu primer `HolaMundo.java` des de VS Code sense ajuda. |
| **🏅 Detectiu de Bugs** | Trobar els 3+1 errors del Laboratori de Tortura sense mirar la solució. |
| **🏅 Drecera Pro** | Cal escriure un programa en VS Code usant només les dreceres `main + Tab` i `sysout + Tab`. |
| **🏅 Traductor** | Documentar una classe amb Javadoc (`/** ... */`) i entendre les etiquetes `@param` i `@return`. |

---

## 🧠 Atreveix-te a pensar

1. Sense executar, què imprimeix este programa?

```java
public class Misterio2 {
    public static void main(String[] args) {
        System.out.print("Uno ");
        System.out.println("Dos");
        System.out.print("Tres");
    }
}
```

2. El salut que no saluda: En un programa on tens un mètode `public static void saludo()`, com fas perquè s'execute si només està definit fora de `main`?

3. El detectiu de VS Code: El teu programa s'executa, però imprimeix "La suma es: 34" en lloc de 7. Quina ferramenta penses utilitzar i com ho investigues?

4. Verdader o fals: "javac i java fan el mateix: el primer és per a Windows i el segon per a Linux."

### 💡 Solucions a les preguntes

1. Imprimeix:

```
Uno Dos
Tres
```

(`print` no afegeix salt de línia al final, però `println` sí. Després de "Tres" no hi ha salt).

2. Cal afegir la crida `saludo();` dins del mètode `main`. En Java, només s'executa automàticament allò que es crida directament o indirecta des del mètode `main`.

3. Utilitzes el depurador (`F5`): Poses un breakpoint en la línia del `println`, avances amb `F10` (Step Over) i inspectes el panell lateral de variables. Veuràs com `"La suma es: " + 3` es converteix en `"La suma es: 3"` i després `+ 4` dona `"La suma es: 34"`. La solució és afegir parèntesis `(a + b)`.

4. Fals. `javac` és el compilador (`.java` → `.class`) i `java` és l'executor de la JVM. Tots dos s'utilitzen en qualsevol sistema operatiu (Windows, Linux, macOS).

---

## 💬 Preguntes d'entrevista de treball

Preguntes reals que et farien per a programador Java júnior.

1. **"Explica'm, com si jo fora la teua iaia, la diferència entre JDK, JRE i JVM."**
2. **"Què és el mètode `main` i per què té eixa firma exacta?"**
3. **"Un programa compila però fa el que no ha de fer. Quin és el teu procés per a arreglar-lo?"**
4. **"Què és un array i què passa si accedeixes a un índex que no existix?"**
5. **"Com li passes dades a un programa Java sense que et les demane per teclat?"**

---

## 🤷 No hi ha preguntes tontes

❓ **Puc escriure Java en un bloc de notes o necessite sí o sí un IDE?**

Pots, i de fet és un bon exercici: `notepad MiPrograma.java`, `javac MiPrograma.java`, `java MiPrograma`. Però l'IDE t'estalvia errors tontos amb l'autocompletat i et dona el depurador. Els pros usen IDE; els masoquistes, bloc de notes.

❓ **Per què el primer `println` d'Hola Món tenia "args" si no l'use?**

`String[] args` és obligatori en la firma del `main` encara que no l'uses. Java l'espera sí o sí. És com la firma en un contracte: està encara que no s'execute eixa clàusula. En el punt 6 vas vore com usar-lo.

❓ **Java i JavaScript són cosins?**

No, ni tan sols són del mateix planeta. Java és a JavaScript com un gos és a un gosset calent. El nom va ser una estratègia de màrqueting de Netscape per a muntar-se en el boom de Java.

---

## 🎬 Poscrèdits

El programador aprenent acaba el seu primer programa, el compila i l'executa. Tot perfecte. Llavors s'acosta CONRAD, el compilador cascarrabies, amb cara de pocs amics i una tassa humejant a la mà.

**CONRAD:** — Molt bonic l'Hola Món. I ara què? Vas a imprimir text tota la vida? Els programes de veritat *guarden* dades, *calculem* i *decidixen*. Sense variables, sense tipus, sense operadors... això és un triler de cartes.

**Aprenent:** — I això quan s'aprén?

**CONRAD:** — *fa un glop* La pròxima parada. Ja et veig declarant el teu primer `int`... i cometent el teu primer error de tipus. Espera'm, que jo estaré allí per a riure.

L'aprenent guarda el seu projecte, tanca l'IDE i sent que això només acaba de començar.
