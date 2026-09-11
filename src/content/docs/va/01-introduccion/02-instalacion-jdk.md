---
title: "02 — Instal·lació del JDK"
description: "OpenJDK, java -version, PATH, IDE ☕"
---

<p><small>OpenJDK, java -version, PATH, IDE ☕</small></p>

> 🗺️ **Estàs en:** 🚀 **U01 · Introducció a Java** → 02 · Instal·lació del JDK

---

**Per a crear programes Java necessites el JDK. Instal·lar-lo és més fàcil que muntar un moble d'Ikea, i no et sobraran caragols.**

En el punt anterior vas veure que el JDK és el kit complet per a *crear* programes. Ara toca posar-lo en la teua màquina i comprovar que tot funciona.

---

## 🛒 Quin JDK instal·le?

El Java original de Sun/Oracle ha tingut una vida moguda amb les llicències. Hui la millor opció i la més sensata per a estudiar és anar directament a la font oficial i lliure:

1. **OpenJDK**: És el projecte de referència, lliure i de codi obert, del qual ixen totes les altres distribucions. **És la nostra opció principal i la recomanada, més senzill d'instal·lar en Linux.**
   - [https://openjdk.org/index.html](https://openjdk.org/index.html)
2. **Eclipse Temurin** (abans AdoptOpenJDK): Una distribució excel·lent basada directament en OpenJDK, lliure, gratuïta i mantinguda per la fundació Eclipse.
   - [https://adoptium.net/es/temurin/releases](https://adoptium.net/es/temurin/releases)
3. **Oracle JDK**: La versió comercial d'Oracle. Vàlida per a entorns empresarials, però amb una llicència més restrictiva. **Més senzill d'instal·lar en Windows**
   - [https://www.oracle.com/java/technologies/downloads/](https://www.oracle.com/java/technologies/downloads/)

**La versió a triar:** Triaràs l'última versió **LTS** (*suport a llarg termini*). Hui dia, qualsevol versió 17, 26 o superior et serveix per a tot el curs. No t'obsessiones amb el número exacte: tot el que aprendrem funciona exactament igual en totes elles.

---

## 🚀 Els primers passos

### Pas 1: Instal·lar

Executa l'instal·lador d'OpenJDK i accepta els valors per defecte. En Windows, assegura't de marcar l'opció d'afegir el JDK al PATH si te l'ofereix l'instal·lador (així podràs usar `java` i `javac` des de qualsevol terminal sense haver de configurar res a mà).

### Pas 2: Verificar

Obre una terminal (PowerShell o CMD en Windows, o la terminal en Linux/macOS) i escriu:

```bash
> java -version
openjdk version "21.0.2" 2024-01-16
OpenJDK Runtime Environment (build 21.0.2+13-LTS)
OpenJDK 64-Bit Server VM (build 21.0.2+13-LTS, mixed mode)
```

I després comprova el compilador:

```bash
> javac -version
javac 21.0.2
```

Si veus una eixida pareguda, enhorabona! Tens poders de compilació actius.

Si, en canvi, el sistema et diu `'java' no es reconeix com un comandament intern o extern`, significa que el PATH no està ben configurat: busca en el menú de Windows "Editar les variables d'entorn del sistema" i afegeix la ruta de la carpeta `bin` de la teua instal·lació d'OpenJDK a la variable `Path`.

### 💡 Què és el PATH?

El "PATH" és la llista de carpetes on el teu sistema operatiu busca els programes i comandaments que escrius en la terminal. Si la carpeta `...\jdk-26\bin` (o similar) està en el PATH, en escriure `java` el sistema la troba a la primera. Sense eixa configuració, el sistema no sap on està instal·lat el teu JDK.

### Pas 3: Per què hi ha dos comandaments?

- **`javac`**: És el compilador. Converteix el teu codi font (`.java`) en bytecode (`.class`).
- **`java`**: És l'executor. Arranca la JVM per a executar el bytecode que has compilat prèviament.

**Es necessiten els dos**: primer **`javac`** tradueix el teu codi i després **`java`** el posa en marxa. Els veuràs treballar estretament durant tot el curs.

---

## 🛠️ L'IDE: la teua navalla suïssa

El JDK és el motor, però la major part del temps no escriuràs codi en un bloc de notes: usaràs un IDE (Entorn de Desenrotllament Integrat) o un editor avançat com VS Code. L'IDE reuneix en una sola aplicació:

- Editor de codi amb colors, autocompletat i ressaltat d'errors mentre escrius.
- Compilador i executor amb un botó: ja no necessites teclejar `javac` i `java` a mà (encara que és bo saber com funciona).
- Depurador integrat.
- Gestió de projectes: els teus programes no són només arxius solts, sinó projectes amb estructura.

| IDE / Editor | Punts forts |
| --- | --- |
| **VS Code** | L'opció recomanada. Molt lleuger, modern i altament personalitzable. Amb l'extensió Extension Pack for Java ofereix un entorn complet i excel·lent. |
| **IntelliJ IDEA (Community)** | El favorit del sector professional; autocompletat bestial. Una mica més pesat en arrancar. |
| **NetBeans** | Simple, oficial d'Oracle, perfecte per a començar. |
| **Eclipse** | Clàssic, molt usat en empreses, un pèl més dens. |

💡 **Recomanació per al curs:** VS Code amb el plugin de Java (Extension Pack for Java) és la millor opció per la seua lleugeresa i versatilitat. També pots usar IntelliJ IDEA Community Edition si el teu ordinador ho suporta, o NetBeans si vols alguna cosa més tradicional. Tots valen: l'IDE és una ferramenta, no l'objectiu.

---

## 🏫 Exemple guiat: el teu primer projecte en VS Code

Ho deixarem tot muntat abans d'escriure codi:

1. Obre VS Code i assegura't de tindre instal·lat el plugin Extension Pack for Java.
2. Polsa `Ctrl + Shift + P` (o `Cmd + Shift + P` en Mac) per a obrir la paleta d'ordres, escriu `Java: Create Java Project` i selecciona `No build tools`.
3. Tria la carpeta on vols guardar el projecte i dona-li un nom (per exemple, `MiPrimerCurso`).
4. VS Code et crearà l'estructura del projecte amb una carpeta `src`.
5. Dins de la carpeta `src`, crea un arxiu anomenat `HolaMundo.java` i escriu dins:

```java
public class HolaMundo {
    public static void main(String[] args) {
        System.out.println("¡Hola, Mundo! Porte anys esperant a que em creares.");
    }
}
```

6. Fes clic en el botó Run ▶ (que apareixerà just damunt del mètode main) o prem `F5` i mira la terminal/consola.

Si veus el missatge en la pantalla, la teua paradeta està muntada: JDK + VS Code + primer programa. Estàs oficialment dins.

⚠️ **Advertència:** no confongues la consola/terminal de l'IDE amb la terminal del sistema. La consola de VS Code és on s'imprimeixen els `System.out.println` en executar. Si no veus l'eixida, busca la pestanya Terminal o Output / Eixida.

---

## 🎯 Mini-comprovació

1. Quin comandament comprova que la teua instal·lació funciona?
2. Per a què serveix el PATH i què passa si el JDK no està en ell?
3. Quina és la diferència entre `java` i `javac`?

**🔄 Respostes**

1. `java -version` (i també `javac -version`).
2. El PATH és la llista de carpetes on el sistema busca els comandaments. Sense ell, en escriure `java` el sistema respon que no reconeix el comandament.
3. `javac` compila el codi font a bytecode; `java` executa el bytecode amb la JVM.

---

## ✅ Resum en 3 frases

1. Instal·la OpenJDK (un JDK lliure) i verifica amb `java -version` i `javac -version`.
2. `javac` compila, `java` executa, i el PATH és l'adreça postal que el sistema necessita per a trobar-los.
3. Un IDE o editor com VS Code (amb el plugin de Java) reuneix editor, compilador i depurador: és la teua navalla suïssa.

---

## 🐛 Vocabulari ràpid

| Terme | Idea general |
| --- | --- |
| **PATH** | Llista de carpetes on el sistema busca comandaments |
| **IDE / Editor** | Entorn integrat: editor + compilador + depurador |
| **LTS** | Versió amb suport a llarg termini (la recomanada) |
| **Terminal** | La finestra on escrius comandaments com `java` |
| **Projecte** | La carpeta on viuen les teues classes i configuracions |
