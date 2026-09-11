---
title: "08 — L'IDE i el teu flux de treball"
description: "Projectes, dreceres, crear/executar/depurar 🛠️"
---

<p><small>Projectes, dreceres, crear/executar/depurar 🛠️</small></p>

> 🗺️ **Estàs en:** 🚀 **U01 · Introducció a Java** → 08 · L'IDE i el teu flux de treball

---

**L'IDE (Entorn de Desenrotllament Integrat) és la teua navalla suïssa: editor, compilador, executor i depurador, tot en una sola finestra.**

En el punt 2 vas instal·lar el JDK i li vas fer una primera ullada a l'IDE/Editor. Ara vas a muntar el teu flux de treball diari: com s'organitza un projecte, com crear classes, executar-les, depurar-les i moure't amb dreceres en VS Code sense tocar el ratolí.

---

## 🗂️ Anatomia d'un projecte en VS Code

Quan crees un projecte Java en VS Code, l'extensió et genera una estructura de carpetes neta. Les importants són:

```
MiPrimerCurso/
├── src/          ← EL TEU codi (.java) viu ací
│   └── HolaMundo.java
└── bin/ (o target)  ← el bytecode (.class) compilat automàticament
    └── HolaMundo.class
```

- **src** (source): Els teus arxius `.java`. És el que tu escrius i el que es puja a Git.
- **bin / target**: El que genera el compilador en segon pla. No es toca a mà i normalment ni es puja a Git.

💡 **Detall pràctic:** No edites mai els `.class`. Si esborres la carpeta `bin`, VS Code la regenerarà en compilar en segon pla. El teu codi font en `src` és l'única font de veritat.

---

## 🔁 El cicle de treball (el teu nou bucle de vida)

Programar és un bucle de quatre passos que repetiràs milions de vegades:

1. **Editar**: Escrius o canvies codi en `src`.
2. **Compilar**: VS Code compila automàticament en guardar (`Ctrl + S`). Ací es marquen els errors de sintaxi en roig.
3. **Executar**: Polses `Ctrl + F5` (o el botó ▶ Run). Ací es detecten els errors de runtime.
4. **Depurar**: Si la lògica falla, polses `F5` (o Debug) i comença el detectiu del punt 4.

***Editar → Compilar (Auto) → Executar → Depurar → (Tornar a Editar)***

⚠️ **Advertència:** Executar sense depurar (`Ctrl + F5`) i en mode depuració (`F5`) NO són el mateix. Executar normal ignora els breakpoints; Debug els respecta. Si poses un punt roig i executes sense depurar, el programa no es detindrà.

---

## ⌨️ Les dreceres de VS Code que et faran paréixer un pro

Deixa el ratolí en pau. Estes són les dreceres essencials per a Java en VS Code:

| Drecera (Windows) | Acció |
| --- | --- |
| `main + Tab` (o `psvm`) | Escriu l'esquelet `public static void main(String[] args) {}` |
| `sysout + Tab` (o `sout`) | Escriu `System.out.println()` |
| `Ctrl + F5` | Executar (Run Without Debugging) |
| `F5` | Executar en mode depuració (Start Debugging) |
| `F10` / `F11` | Step Over / Step Into (depurador) |
| `Ctrl + /` | Comentar / descomentar la línia seleccionada |
| `Shift + Alt + ↓` | Duplicar la línia cap avall |
| `F12` | Anar a la definició (Go to Definition) |
| `F2` | Canviar el nom d'un símbol/variable en tot el projecte (Rename) |

🧠 **Truc de memòria**: `main` i `sysout` són els dos snippets que més escriuràs en el curs. Escrius eixes lletres, premis Tab i VS Code te les ompli de cop.

---

## 🧩 Autocompletat (IntelliSense): el teu company silenciós

L'extensió de Java mentre escrius et suggereix opcions, ressalta errors en roig abans d'executar i pot arreglar problemes amb un clic (la icona de la bombeta 💡 o `Ctrl + .`):

- Escrius `Syste` i VS Code t'ofereix `System` (amb la S majúscula que tant costa al principi).
- Et falta una variable o importació i la bombeta 💡 t'ofereix "Import 'java.util.Scanner'" o la correcció ràpida.
- Selecciones una variable, premis `F2` i li canvies el nom: VS Code actualitza totes les seues aparicions en el projecte (això és refactoritzar).

**L'autocompletat no és trampa**: és la raó per la qual la gent usa VS Code o un IDE en lloc d'un bloc de notes. El teu codi ix amb menys errors tontos perquè l'editor et corregeix mentre penses.

---

## 🏫 Exemple guiat: de zero a executar en 60 segons en VS Code

1. **Nou projecte:** Prem `Ctrl + Shift + P`, escriu `Java: Create Java Project`, tria `No build tools`, selecciona la carpeta de destinació i anomena el projecte `MiPrimerCurso`.

2. **Nova classe:** Dins de l'explorador esquerre, fes clic dret sobre la carpeta `src` → New File → anomena'l `HolaMundo.java`.

3. Escriu `main` i prem Tab (apareix el mètode main). Dins, escriu `sysout` i prem Tab:

```java
public class HolaMundo {
    public static void main(String[] args) {
        System.out.println("¡Hola des de VS Code!");
    }
}
```

4. Prem `Ctrl + F5` (Run). Mira la pestanya Terminal en la part inferior de VS Code.

5. Posa un breakpoint en el `println` (clic a l'esquerra del número de línia), prem `F5` (Debug) i observa el panell lateral esquerre de variables.

Si has arribat al pas 5 sense pànic, el teu flux de treball està muntat. A partir d'ací, el curs sencer és omplir este esquelet de contingut.

---

## 🎯 Mini-comprovació

1. On viuen els teus arxius `.java` i on els `.class`?
2. Quina diferència hi ha entre executar amb `Ctrl + F5` (Run) i amb `F5` (Debug)?
3. Què escriu `main + Tab`?

**🔄 Respostes**

1. Els teus `.java` viuen en `src`; els `.class` compilats en `bin` (o `target`). No edites els `.class`.
2. `Ctrl + F5` executa normal (ignora els breakpoints); `F5` executa en mode depuració (els respecta).
3. L'esquelet `public static void main(String[] args) {}` complet.

---

## ✅ Resum en 3 frases

1. Un projecte té `src` (el teu codi) i `bin` (bytecode): VS Code compila per tu en segon pla en guardar.
2. El teu bucle diari és editar → compilar → executar → depurar, i Run (`Ctrl + F5`) i Debug (`F5`) no són el mateix.
3. Les dreceres (`main`, `sysout`, `F10/F11`) i l'autocompletat (IntelliSense) et fan treballar més ràpid i amb menys errors.

---

## 🐛 Vocabulari ràpid

| Terme | Idea general |
| --- | --- |
| **VS Code / IDE** | Editor + eines de Java en una sola aplicació |
| **Projecte** | La carpeta arrel que agrupa el teu codi (`src`) i configuracions |
| **src** | Carpeta de codi font on escrius els teus arxius `.java` |
| **Refactoritzar** | Modificar o reestructurar el codi mantenint el seu comportament exactament igual |
| **Terminal / Consola** | La finestra inferior on s'imprimeix l'eixida dels teus programes |
