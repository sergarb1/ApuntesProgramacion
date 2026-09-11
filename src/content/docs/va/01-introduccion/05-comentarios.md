---
title: "05 — Comentaris i documentació"
description: "//, /* */, /** */ i Javadoc 📝"
---

<p><small>//, /* */, /** */ i Javadoc 📝</small></p>

> 🗺️ **Estàs en:** 🚀 **U01 · Introducció a Java** → 05 · Comentaris i documentació

---

**Un comentari és un missatge que et deixes a tu mateix (o a uns altres). L'ordinador l'ignora completament: és per als humans, no per a les màquines.**

El codi explica *què* fa la màquina; els comentaris expliquen *per què* ho fa. I el *per què* és or pur: sis mesos després, eixe comentari t'estalviarà hores de "*què* estava pensant quan vaig escriure això?".

---

## 📝 Els tres tipus de comentaris

Java té tres formes d'escriure comentaris, cada una amb el seu ús:

| Tipus | Sintaxi | Ús |
| --- | --- | --- |
| **D'una línia** | `// text` | Notes ràpides al costat del codi per a aclarir una línia o llista de tasques. |
| **De bloc** | `/* text */` | Explicacions llargues, algorismes complexos o desactivar temporals de codi. |
| **Javadoc** | `/** text */` | Documentació formal i estructurada de classes, mètodes i atributs. |

```java
// Comentari d'una línia: "Ací va la màgia"

/*
Comentari de diverses línies:
"Si això funciona, no ho toques.
Si no funciona, no ho toques tampoc.
Ja cridarem algú."
*/

/**
 * Comentari Javadoc (l'elegant):
 * Serveix per a generar documentació automàtica.
 * @param args arguments de la línia de comandes
 * @return res, açò és void, no te n'adones?
 */
```

💡 **Detall pràctic:** els comentaris poden anar enmig d'una línia sense problema. `System.out.println(/* "Cuatro" */ "Cinco")` imprimix `Cinco`: el comentari s'ignora i la resta de la línia seguix viva.

---

## 🗝️ El consell que t'estalviarà hores: comenta el "per què", no el "què"

Este és el consell més rendible de tota la unitat:

```java
int i = 0; // Declare i amb valor 0 ← MAL: el codi ja ho diu
int i = 0; // Comencem des de 0 perquè l'usuari no ha polsat res ← BÉ
```

Escriure `// Declare i amb valor 0` és com posar "Obro la porta" en una porta. El codi ja diu això. El comentari útil afegeix informació que **el codi no pot expressar**: el context, la intenció, la decisió de disseny.

- ❌ `int temperatura = 30; // temperatura val 30`
- ✅ `int temperatura = 30; // Refresca per davall de 25 segons el cap`

🧠 **Truc de memòria:** si el comentari descriu la mateixa acció que veus en el codi, esborra'l. El bon comentari respon a *per què?*, mai a *què?*.

---

## 📖 Javadoc: documentació que es genera sola

**Javadoc** és un comentari especial (`/** ... */`) que col·loques **just abans** d'una classe o d'un mètode. La ferramenta `javadoc` (inclosa en el JDK) ho converteix en pàgines de documentació automàtiques, iguals a les oficials de Java.

```java
/**
 * Classe que representa un alumne del curs de programació.
 *
 * @author Sergi Garcia
 * @version 1.0
 */
public class SobreMi {

    /**
     * Punt d'entrada del programa.
     *
     * @param args arguments rebuts des de la línia d'ordres
     */
    public static void main(String[] args) {
        System.out.println("Em dic Sergi i m'agrada la programació");
    }
}
```

### 💡 Aprofundint en Javadoc: la documentació professional

Javadoc no és un simple comentari per a tu o els teus companys de classe; és la ferramenta oficial del JDK que llegeix el teu codi i genera automàticament una pàgina web (HTML) amb la documentació tècnica del teu projecte, exactament igual que la documentació oficial de la llibreria de Java.

Quan escrius un bloc Javadoc (comença per `/**` i acaba amb `*/`), pots utilitzar etiquetes especials (tags) que comencen per `@` per a estructurar la informació:

- **`@param nomParametre`**: Explica per a què serveix un paràmetre d'entrada que rep el mètode.
- **`@return`**: Descriu què torna o calcula el mètode (si no és void).
- **`@author`**: Indica l'autor de la classe o del codi.
- **`@version`**: Especifica la versió del mòdul o classe.
- **`@see`**: Afegeix una referència o enllaç a una altra classe o mètode relacionat.
- **`@throws Exception`**: Documenta quin tipus d'excepció o error pot llançar el mètode.

**Per què és tan útil en el teu dia a dia?**

A més de generar la web, els IDEs moderns com VS Code o IntelliJ IDEA llegeixen estos comentaris Javadoc i, en passar el cursor sobre qualsevol mètode o utilitzar l'autocompletat, et mostren una finestra emergent amb tota la documentació, paràmetres i explicacions en temps real sense necessitat d'obrir l'arxiu original.

Per a generar-la: `javadoc SobreMi.java` en la terminal i es crearan els `.html` amb la documentació. Prova-ho: és com tindre un manual d'instruccions fet per tu mateix.

💡 **Consell:** en la vida real, els comentaris Javadoc en els mètodes solen "caure" en les rúbriques. A més, en el treball, els que documenten dormen millor... i els que no, tornen al codi a les 3 de la matinada amb cara de pànic.

---

## 🏫 Exemple guiat: documentar un programa complet

Ho aplicarem tot a un programa real:

```java
/**
 * Classe que saluda de distintes formes.
 *
 * @author Alumne DAW
 * @version 1.0
 */
public class Saludo {

    /**
     * Mètode principal: imprimeix els dos missatges de la classe.
     *
     * @param args arguments de línia d'ordres (no usats ací)
     */
    public static void main(String[] args) {
        // Primer missatge: benvinguda al curs
        System.out.println("Bienvenidos al curso de Programación");
        /*
         * Segon missatge:
         * usem println per a saltar de línia i deixar la consola neta
         */
        System.out.println("Este curso va a molar");
    }
}
```

Fixa't que cada comentari aporta alguna cosa: el Javadoc documenta l'API, el `//` explica la intenció i el `/* */` justifica una decisió de format. Cap no repeteix el que el codi ja diu.

---

## 🎯 Mini-comprovació

1. Quina diferència hi ha entre `//`, `/* */` i `/** */`?
2. Què imprimeix este programa?

```java
public class Comentarios {
    public static void main(String[] args) {
        // System.out.println("Uno");
        System.out.println("Dos");
        /* System.out.println("Tres"); */
        System.out.println(/* "Cuatro" */ "Cinco");
    }
}
```

3. És bon comentari `// x = 10`?

**🔄 Respostes**

1. `//` és d'una línia; `/* */` és de bloc (diverses línies); `/** */` és Javadoc, que la ferramenta `javadoc` converteix en documentació automàtica.
2. Imprimeix `Dos` i `Cinco`. La línia amb `//` i la del bloc `/* */` s'ignoren, i en l'última el comentari intern s'elimina, però "Cinco" segueix sent l'argument del `println`.
3. No: el codi ja mostra que `x` val 10. Comenta el **per què**, no el què.

---

## ✅ Resum en 3 frases

1. Els comentaris són per a humans: `//`, `/* */` i `/** */`, segons el que necessites.
2. Comenta el **per què**, no el què: el codi ja diu què fa.
3. **Javadoc** genera documentació automàtica amb `@author`, `@version`, `@param` i `@return`.

---

## 🐛 Vocabulari ràpid

| Terme | Idea general |
| --- | --- |
| **Comentari** | Text que el compilador ignora completament en generar el bytecode. |
| **Javadoc** | Comentari estructurat que genera documentació HTML automàtica. |
| **Etiqueta** | `@param`, `@return`... metadades per a descriure peces del codi. |
| **Documentació** | Explicació escrita sobre el funcionament del codi per a altres desenvolupadors. |
| **Compilador** | Traductor (`javac`) que ignora els comentaris i crea l'arxiu `.class`. |
