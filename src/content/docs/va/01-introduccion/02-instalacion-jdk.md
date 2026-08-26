---
title: 02 — Instal·lació del JDK
description: Muntant el xiringuito sense que sobren caragols 🔧
---

<p><small>Muntant el xiringuito sense que sobren caragols 🔧</small></p>

> 🗺️ **Estàs en:** 🚀 **U01 · Introducció a Java** → 02 · Instal·lació del JDK

---

## 📬 La idea en una frase

> **Per a crear programes Java necessites el JDK. Instal·lar-lo és més fàcil que muntar un moble d'Ikea, i no et sobraran caragols.**

En el punt anterior vas vore que el JDK és el kit complet per a *crear* programes. Ara toca posar-lo en la teua màquina i comprovar que tot funciona.

---

## 🛒 Quin JDK instale?

El Java original de Sun/Oracle ha tingut una vida moguda amb les llicències. Hui la opció més sensata per a estudiar és:

- **Eclipse Temurin** (abans AdoptOpenJDK): un JDK **lliure, gratuït i mantingut per la comunitat**. És l'hereu de confiança de l'OpenJDK.
- **Oracle JDK**: la versió oficial d'Oracle. Perfecta per a empreses, però amb llicència més restrictiva.
- **OpenJDK**: el projecte de referència, del qual ixen els altres.

> 💡 **Consell:** si uses [Eclipse Temurin](https://adoptium.net/) t'estalviaràs maldecaps. És com el JDK oficial però sense fums rars. Descarrega l'instal·lador segons el teu sistema (Windows x64, macOS, Linux) i deixa-ho amb els valors per defecte.

La versió a triar: l'última **LTS** (suport a llarg termini). Hui dia, qualsevol 17, 21 o superior et serveix per a tot el curs. No t'obsessiones amb les versions: els apunts funcionen amb totes.

---

## 🚀 Els primers passos

### Pas 1: instal·lar

Executa l'instal·lador de Temurin i accepta els valors per defecte. En Windows, marca l'opció d'afegir el JDK al `PATH` si te l'ofereix (així podràs usar `java` des de qualsevol terminal).

### Pas 2: verificar

Obre una terminal (PowerShell en Windows, la terminal que preferixes en Linux/macOS) i escriu:

```
> java -version
openjdk version "21" 2026-01-01
OpenJDK Runtime Environment (build 21+35)
OpenJDK 64-Bit Server VM (build 21+35, mixed mode)

> javac -version
javac 21
```

Si veus alguna cosa pareguda, enhorabona! Tens poders de compilació. Si en canvi et diu `'java' no es reconeix com un comandament intern o extern`, significa que el `PATH` no està ben configurat: busca en el menú de Windows "Editar les variables d'entorn del sistema" i afegix la carpeta `bin` del JDK a la variable `Path`.

> 💡 **Què és el PATH?** És la llista de carpetes on Windows busca els comandaments que escrius. Si la carpeta `...\jdk-21\bin` està en el `PATH`, en escriure `java` Windows la troba. Sense ella, Windows s'encongix d'espatles.

### Pas 3: per què hi ha dos comandaments?

- `java`: **executa** programes (arranca la JVM amb el teu bytecode).
- `javac`: **compila** codi font `.java` a bytecode `.class`.

Es necessiten els dos: `javac` convertix el teu codi i `java` el posa en marxa. Els veuràs junts tot el curs.

---

## 🛠️ L'IDE: la teua navalla suïssa

El JDK és el motor, però la major part del temps no escriuràs codi en un bloc de notes: usaràs un **IDE** (Entorn de Desenrotllament Integrat). L'IDE reunix en una sola aplicació:

- **Editor de codi** amb colors, autocompletat i ressaltat d'errors mentre escrius.
- **Compilador i executor** amb un botó: ja no necessites teclejar `javac` i `java` a mà (encara que és bo saber-ho).
- **Depurador** integrat, l'arma secreta que usaràs en el punt 4.
- **Gestió de projectes**: els teus programes no són només archius solts, sinó *projectes* amb estructura.

| IDE | Punts forts |
|---|---|
| **IntelliJ IDEA** (Community) | El favorit del sector; autocompletat bestial. Una mica més pesat en arrancar |
| **NetBeans** | Simple, oficial d'Oracle, perfecte per a començar |
| **Eclipse** | Clàssic, molt usat en empreses, un pèl més dens |

> 💡 **Recomanació per al curs:** IntelliJ IDEA Community Edition si el teu ordinador ho suporta; NetBeans si vols alguna cosa més lleugera. Els tres valen: l'IDE és una ferramenta, no l'objectiu.

---

## 🏫 Exemple guiat: el teu primer projecte

Anem a deixar-ho tot muntat abans d'escriure codi:

1. Obre el teu IDE i tria **New Project**.
2. Selecciona **Java** i assegura't que apunta al JDK que vas instal·lar (l'IDE el detecta sol).
3. Dona un nom al projecte (per exemple, `MiPrimerCurso`).
4. L'IDE et crea una estructura de carpetes (la veuràs en el punt 8).
5. Crea una classe nova anomenada `HolaMundo` i escriu dins:

```java
public class HolaMundo {
    public static void main(String[] args) {
        System.out.println("¡Hola, Mundo! Llevo años esperando a que me crearas.");
    }
}
```

6. Polsa el botó **Run** (el triangle verd ▶) i mira la consola.

Si veus el missatge en la consola, el teu xiringuito està muntat: JDK + IDE + primer programa. Estàs oficialment dins.

> ⚠️ **Advertència:** no confongues la consola de l'IDE amb la terminal del sistema. La consola de l'IDE és on s'imprimixen els `System.out.println` en executar. Si no veus eixida, busca la pestanya "Console" / "Eixida".

---

## 🎯 Mini-chequeig

1. Quin comandament comprova que la teua instal·lació funciona?
2. Per a què serveix el `PATH` i què passa si el JDK no està en ell?
3. Quina és la diferència entre `java` i `javac`?

<details>
<summary>🔄 Respostes</summary>

1. `java -version` (i també `javac -version`).
2. El `PATH` és la llista de carpetes on el sistema busca els comandaments. Sense ell, en escriure `java` el sistema respon que no reconeix el comandament.
3. `javac` **compila** el codi font a bytecode; `java` **executa** el bytecode amb la JVM.

</details>

---

## ✅ Resum en 3 frases

1. Instal·la **Eclipse Temurin** (un JDK lliure) i verifica amb `java -version` i `javac -version`.
2. `javac` compila, `java` executa, i el `PATH` és l'adreça postal que el sistema necessita per a trobar-los.
3. Un **IDE** (IntelliJ, NetBeans o Eclipse) reunix editor, compilador i depurador: és la teua navalla suïssa.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | PATH | Llista de carpetes on el sistema busca comandaments |
> | IDE | Entorn integrat: editor + compilador + depurador |
> | LTS | Versió amb suport a llarg termini (la recomanada) |
> | Terminal | La finestra on escrius comandaments com `java` |
> | Projecte | La carpeta on viuen les teues classes i configuracions |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/01-introduccion) · **Anterior:** [01 · Què és Java?](/ApuntesProgramacion/va/01-introduccion/01-que-es-java) · **Següent:** [03 · El teu primer programa](/ApuntesProgramacion/va/01-introduccion/03-hola-mundo)