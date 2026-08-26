---
title: 05 — Comentaris i documentació
description: Notes apegaloses digitals per al teu codi 📝
---

<p><small>Notes apegaloses digitals per al teu codi 📝</small></p>

> 🗺️ **Estàs en:** 🚀 **U01 · Introducció a Java** → 05 · Comentaris i documentació

---

## 📬 La idea en una frase

> **Un comentari és un missatge que et deixes a tu mateix (o a uns altres). L'ordinador l'ignora completament: és per als humans, no per a les màquines.**

El codi explica *què* fa la màquina; els comentaris expliquen *per què* ho fa. I el *per què* és or pur: sis mesos després, eixe comentari t'estalviarà hores de "què estava pensant quan vaig escriure això?".

---

## 📝 Els tres tipus de comentaris

Java té tres formes d'escriure comentaris, cada una amb el seu ús:

| Tipus | Sintaxi | Ús |
|---|---|---|
| D'una línia | `// text` | Notes ràpides al costat del codi |
| De bloc | `/* text */` | Explicacions llargues, diverses línies |
| Javadoc | `/** text */` | Documentació automàtica de classes i mètodes |

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
 * @param argumentos la llista d'arguments de la línia de comandes
 * @return res, açò és void, no te n'adones?
 */
```

> 💡 **Detall pràctic:** els comentaris poden anar enmig d'una línia sense problema. `System.out.println(/* "Cuatro" */ "Cinco")` imprimix `Cinco`: el comentari s'ignora i la resta de la línia seguix viva.

---

## 🗝️ El consell que t'estalviarà hores: comenta el *per què*, no el *què*

Este és el consell més rendible de tota la unitat:

```
int i = 0; // Declare i amb valor 0   ← MAL: el codi ja ho diu
int i = 0; // Comencem des de 0 perquè l'usuari no ha polsat res   ← BÉ
```

Escriure `// Declare i amb valor 0` és com posar "Obro la porta" en una porta. El codi ja diu això. El comentari útil afegix informació que **el codi no pot expressar**: el context, la intenció, la decisió de disseny.

- ❌ `int temperatura = 30; // temperatura val 30`
- ✅ `int temperatura = 30; // Refresca per davall de 25 segons el cap`

> 🧠 **Truc de memòria:** si el comentari descriu la mateixa acció que veus en el codi, esborra'l. El bon comentari respon a *per què?*, mai a *què?*.

---

## 📖 Javadoc: documentació que es genera sola

**Javadoc** és un comentari especial (`/** ... */`) que col·loques **just abans** d'una classe o d'un mètode. La ferramenta `javadoc` (inclosa en el JDK) ho convertix en pàgines de documentació automàtiques, iguals a les oficials de Java.

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
     * @param args arguments rebuts des de la línia de comandes
     */
    public static void main(String[] args) {
        System.out.println("Em dic Sergi i m'agrada la programació");
    }
}
```

Etiquetes que has de conéixer:

| Etiqueta | On | Què documenta |
|---|---|---|
| `@author` | Classe | Qui va escriure el codi |
| `@version` | Classe | Versió del codi |
| `@param` | Mètode | Què significa cada paràmetre |
| `@return` | Mètode | Què torna el mètode (si no és `void`) |

Per a generar-la: `javadoc SobreMi.java` en la terminal i es crearan els `.html` amb la documentació. Prova-ho: és com tindre un manual d'instruccions fet per tu mateix.

> 💡 **Consell:** en els exàmens i en la vida real, els comentaris Javadoc en els mètodes solen "caure" en les rúbriques. A més, en el treball, els que documenten dormen millor... i els que no, tornen al codi a les 3 de la matinada amb cara de pànic.

---

## 🏫 Exemple guiat: documentar un programa complet

Anem a aplicar-ho tot a un programa real:

```java
/**
 * Classe que saluda de distintes formes.
 *
 * @author Alumne DAM
 * @version 1.0
 */
public class Saludo {

    /**
     * Mètode principal: imprimix els dos missatges de la classe.
     *
     * @param args arguments de línia de comandes (no usats ací)
     */
    public static void main(String[] args) {
        // Primer missatge: benvinguda al curs
        System.out.println("Bienvenidos al curso de Programación");

        /* Segon missatge:
           usem println per a saltar de línia i deixar la consola neta */
        System.out.println("Este curso va a molar");
    }
}
```

Fixa't que cada comentari aporta alguna cosa: el Javadoc documenta l'API, el `//` explica la intenció i el `/* */` justifica una decisió de format. Cap no repetix el que el codi ja diu.

---

## 🎯 Mini-chequeig

1. Quina diferència hi ha entre `//`, `/* */` i `/** */`?
2. Què imprimix este programa?

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

<details>
<summary>🔄 Respostes</summary>

1. `//` és d'una línia; `/* */` és de bloc (diverses línies); `/** */` és Javadoc, que la ferramenta `javadoc` convertix en documentació automàtica.
2. Imprimix `Dos` i `Cinco`. La línia amb `//` i la del bloc `/* */` s'ignoren, i en l'última el comentari intern s'elimina però `"Cinco"` seguix sent l'argument del `println`.
3. No: el codi ja mostra que `x` val 10. Comenta el **per què**, no el què.

</details>

---

## ✅ Resum en 3 frases

1. Els comentaris són per a humans: `//`, `/* */` i `/** */`, segons el que necessites.
2. Comenta el **per què**, no el què: el codi ja diu què fa.
3. **Javadoc** genera documentació automàtica amb `@author`, `@version`, `@param` i `@return`.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Comentari | Text que el compilador ignora |
> | Javadoc | Comentari que genera documentació automàtica |
> | Etiqueta | `@param`, `@return`... metadades del Javadoc |
> | Documentació | Explicació escrita del codi |
> | Compilador | Traductor que ignora els comentaris |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/01-introduccion) · **Anterior:** [04 · El depurador](/ApuntesProgramacion/va/01-introduccion/04-depurador) · **Següent:** [06 · Arguments de línia de comandes](/ApuntesProgramacion/va/01-introduccion/06-argumentos)