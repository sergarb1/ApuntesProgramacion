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
| **Visual Studio Code** + Extension Pack for Java | Lleuger, multiplataforma, gratuït. L'extensió de Java et dona autocompletat, depurador i gestió de projectes. És el que farem servir en el curs |
| **IntelliJ IDEA** (Community) | El favorit del sector; autocompletat bestial. Una mica més pesat en arrancar |
| **NetBeans** | Simple, oficial d'Oracle, perfecte per a començar |
| **Eclipse** | Clàssic, molt usat en empreses, un pèl més dens |

> 💡 **Recomanació per al curs:** Visual Studio Code amb l'extensió [Extension Pack for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack). És gratuït, lleuger i multiplataforma. Si ja fas servir un altre IDE (IntelliJ, NetBeans), perfecte: l'IDE és una ferramenta, no l'objectiu.

---

## 🏫 Exemple guiat: el teu primer projecte

Anem a deixar-ho tot muntat abans d'escriure codi:

1. Obre **Visual Studio Code** i ves a **Arxiu → Obrir carpeta...**. Crea una carpeta nova (per exemple, `MiPrimerCurso`) i obri-la.
2. Si no tens l'extensió de Java, instal·la-la: ves a la pestanya **Extensions** (icona de quadrats a la barra lateral), busca **Extension Pack for Java** i polsa **Install**.
3. Crea un arxiu nou: clic dret en la carpeta del projecte → **New File...** → noménalo `HolaMundo.java`.
4. Escriu dins:

```java
public class HolaMundo {
    public static void main(String[] args) {
        System.out.println("¡Hola, Mundo! Llevo años esperando a que me crearas.");
    }
}
```

5. Polsa **F5** (o el botó ▶ verd dalt a la dreta) i selecciona **Run Java**. Mirada a la consola.

Si veus el missatge en la consola, el teu xiringuito està muntat: JDK + VS Code + primer programa. Estàs oficialment dins.

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
3. **Visual Studio Code** amb Extension Pack for Java reunix editor, compilador i depurador: és la teua navalla suïssa.

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