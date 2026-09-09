---
title: 08 — VS Code i el teu flux de treball
description: La teua navalla suïssa per a no viure en la terminal 🗡️
---

<p><small>La teua navalla suïssa per a no viure en la terminal 🗡️</small></p>

> 🗺️ **Estàs en:** 🚀 **U01 · Introducció a Java** → 08 · VS Code i el teu flux de treball

---

## 📬 La idea en una frase

> **L'IDE (Entorn de Desenrotllament Integrat) és la teua navalla suïssa: editor, compilador, executor i depurador, tot en una sola finestra.**

En el punt 2 vas instal·lar el JDK i li vas fer una primera ullada a l'IDE. Ara vas a muntar el flux de treball diari: com s'organitza un projecte, com crear classes, executar-les, depurar-les i moure't amb dreceres sense tocar el ratolí.

---

## 🗂️ Anatomia d'un projecte

Quan crees un projecte Java, l'IDE et genera una estructura de carpetes. Les importants són:

```
MiPrimerCurso/
├── src/               ← EL TEU codi (.java) viu ací
│   └── HolaMundo.java
└── out/  (o target)   ← el bytecode (.class) compilat
    └── HolaMundo.class
```

- **`src`** (source): els teus archius `.java`. És el que tu escrius i el que es puja a Git.
- **`out` / `target`**: el que genera el compilador. No es toca a mà i normalment ni es puja a Git.

> 💡 **Detall pràctic:** no edites mai els `.class`. Si borres `src` i edites `out`, l'IDE el regenerarà en compilar. El teu codi font és l'única font de veritat.

---

## 🔁 El cicle de treball (el teu nou bucle de vida)

Programar és un bucle de quatre passos que repetiràs milions de vegades:

1. **Editar**: escrius o canvies codi en `src`.
2. **Compilar**: l'IDE compila en guardar (o en polsar Build). Ací moren els errors de sintaxi.
3. **Executar**: polses ▶ (Run). Ací moren els errors de runtime.
4. **Depurar**: si la lògica falla, polses 🐞 (Debug) i comença el detectiu del punt 4.

```
Editar → Compilar → Executar → Depurar → (tornar a Editar)
```

> ⚠️ **Advertència:** el botó ▶ (Run) i el 🐞 (Debug) NO són el mateix. En VS Code, tots dos usen F5 però amb configuracions distintes: Run executa sense breakpoints; Debug els respecta. Si poses un breakpoint i executes sense mode depuració, el programa no es detindrà i pensaràs que el depurador està roí.

---

## ⌨️ Les dreceres que et faran pareixer un pro

Deixa el ratolí en pau. Estes són les dreceres essencials en VS Code:

| Drecera (Windows/Linux) | Drecera (macOS) | Acció |
|---|---|---|
| `main` + Tab | `main` + Tab | Escriu l'esquelet `public static void main(String[] args) {}` (amb l'extensió de Java) |
| `sout` + Tab | `sout` + Tab | Escriu `System.out.println()` (amb l'extensió de Java) |
| `F5` | `⌘F5` | Executar (Run) |
| `F5` amb launch.json o `Ctrl+F5` | `⌘F5` amb launch.json | Executar en mode depuració (Debug) |
| `F10` / `F11` | `F10` / `F11` | Step Over / Step Into (depurador) |
| `Ctrl + /` | `⌘ + /` | Comentar / descomentar la línia |
| `Shift + Alt + ↓` | `Shift + ⌘ + ↓` | Duplicar la línia |
| `F12` | `F12` | Anar a la definició (navegar) |

> 🧠 **Truc de memòria:** `main` + Tab i `sout` + Tab són els dos fragments que més escriuràs en el curs (funcionen amb l'Extension Pack for Java instal·lada). Aprèn les dreceres i VS Code les ompli sol.

---

## 🧩 Autocompletat: el teu company silenciós

L'IDE mentre escrius et suggerix, ressalta errors en roig abans de compilar i pot **arreglar** problemes amb un clic (la bombeta 💡):

- Escrius `Syste` i l'IDE t'ofereix `System` (amb la S majúscula que tant costa).
- Escrius una línia sense `;` i la bombeta t'ofereix "Insert semicolon".
- Reanomenes una variable i l'IDE actualitza totes les seues aparicions: és *refactoritzar*.

L'autocompletat no és trampa: és la raó per la qual la gent usa VS Code en lloc d'un bloc de notes. El teu codi ix amb menys errors tontos perquè l'editor et corregeix mentre penses.

---

## 🏫 Exemple guiat: de zero a executar en 60 segons

1. **Obrir carpeta**: File → Open Folder → selecciona (o crea) la carpeta del teu projecte.
2. **Nova classe**: clic dret en la carpeta → New File → noménala `HolaMundo.java`. Escriu `main` + Tab i dins `sout` + Tab per al missatge:

```java
public class HolaMundo {
    public static void main(String[] args) {
        System.out.println("¡Hola desde mi IDE!");
    }
}
```

3. Polsa **F5** (Run) i selecciona **Run Java**. Mira la consola.
4. Posa un breakpoint en el `println` (clic en el marge esquerre), polsa **F5** de nou i selecciona **Debug Java**. Observa el panell de variables.

Si has arribat al pas 4 sense pànic, el teu flux de treball està muntat. A partir d'ací, el curs sencer és omplir este esquelet de contingut.

---

## 🎯 Mini-chequeig

1. On viuen els teus archius `.java` i on els `.class`?
2. Quina diferència hi ha entre els botons ▶ (Run) i 🐞 (Debug)?
3. Què escriu `main` + Tab amb l'extensió de Java?

<details>
<summary>🔄 Respostes</summary>

1. Els teus `.java` viuen en `src`; els `.class` compilats en `out`/`target`. No edites els `.class`.
2. ▶ executa normal (ignora els breakpoints); 🐞 executa en mode depuració (els respecta).
3. L'esquelet `public static void main(String[] args) {}` complet.

</details>

---

## ✅ Resum en 3 frases

1. Un projecte té `src` (el teu codi) i `out` (bytecode): VS Code compila per tu.
2. El teu bucle diari és **editar → compilar → executar → depurar**, i Run (F5) i Debug (F5 amb launch.json) no són el mateix.
3. Les dreceres (`main`+Tab, `sout`+Tab, F10/F11) i l'autocompletat et fan més ràpid i amb menys errors tontos.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | IDE | Editor + compilador + executor + depurador en una app |
> | Projecte | La carpeta que agrupa el teu codi i configuracions |
> | src | Carpeta de codi font |
> | Refactoritzar | Canviar codi mantenint el seu comportament |
> | Consola de l'IDE | On s'imprimeix l'eixida dels teus programes |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/01-introduccion) · **Anterior:** [07 · El compilador i els seus errors](/ApuntesProgramacion/va/01-introduccion/07-errores-compilador) · **Següent:** [09 · Repàs interactiu](/ApuntesProgramacion/va/01-introduccion/09-repaso-interactivo)