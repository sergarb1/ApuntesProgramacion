---
title: "04 — El depurador: detectiu de codi"
description: Visió de raigs X per al teu codi 🕵️
---

<p><small>Visió de raigs X per al teu codi 🕵️</small></p>

> 🗺️ **Estàs en:** 🚀 **U01 · Introducció a Java** → 04 · El depurador

---

## 📬 La idea en una frase

> **El depurador (debugger) és com tindre visió de raigs X per al teu codi: para el programa on tu vols i t'ensenya el valor de cada variable en cada instant.**

El teu primer programa funciona. Però prompte tindràs un programa rar: una variable `edad` que ix 25 quan hauria d'eixir 18. Què fas? Li pegues a l'ordinador? No. Uses el **depurador**.

---

## 🔍 Què és depurar?

Depurar (debug) és **traure-li els bitxos** (bugs) al programa. I el secret dels programadors experimentats no és endevinar: és **vore**. El depurador et permet:

- **Parar** el programa en una línia concreta.
- **Avançar** instrucció a instrucció.
- **Inspeccionar** el valor de les variables en cada moment.
- **Modificar** valors sobre la marxa en alguns entorns.

És com vore una sèrie de crims en càmera lenta: pots pausar, rebobinar (no del tot), i observar qui fa què.

> 💡 **Detall pràctic:** els errors es dividixen en dos famílies. Els de *compilació* els atrapa `javac` i et diu la línia (punt 7). Els de *lògica* compilen perfecte però fan el que no han de fer: per a eixos no hi ha millor arma que el depurador.

---

## 🛠️ Les quatre ferramentes del detectiu

| Ferramenta | Drecera (IntelliJ/VS Code) | Què fa |
|---|---|---|
| **Breakpoint** (punt de ruptura) | clic en el marge | Li dius a Java "para ACÍ, vull vore què passa" |
| **Step Over** | F8 | "Executa esta línia però no em conten els detalls interns" |
| **Step Into** | F7 | "Executa esta línia I porta'm dins d'eixa crida, vull espiar" |
| **Watch / Variables** | panell lateral | "Ensenya'm el valor de la variable ARA MATEIX" |

- **Breakpoint**: marca una línia. El programa es deté just abans d'executar-la i espera les teues ordres.
- **Step Over (F8)**: executa la línia completa de colp, sense entrar en els mètodes que crida.
- **Step Into (F7)**: entra *dins* del mètode cridat per a vore les seues línies una a una.
- **Watch**: el panell que mostra les variables vives i els seus valors actuals. També pots escriure una expressió i vore què torna.

> ⚠️ **Advertència:** si et perds dins d'un mètode alié amb Step Into, usa **Step Out** (Shift+F8 en IntelliJ): ix del mètode i torna al punt on el vas cridar. És el botó "he entrat sense voler, traieu-me d'ací".

---

## 🏫 Exemple guiat: el cas del sospitós

Ací tens un programa perfecte per a estrenar el depurador:

```java
public class DetectivesDeCodigo {
    public static void main(String[] args) {
        int sospechoso = 0;
        for (int i = 0; i < 10; i++) {
            sospechoso += i;  // Posa un breakpoint ací
        }
        System.out.println("El culpable es: " + sospechoso);
    }
}
```

El bucle `for` el veuràs a fons en la U03, però ho pots intuir: repetix la línia de dins mentre `i` siga menor que 10, amb `i` valent 0, 1, 2... La línia clau és `sospechoso += i` (que és el mateix que `sospechoso = sospechoso + i`).

**L'exercici de detectiu:**

1. Posa un **breakpoint** en la línia de `sospechoso += i` (clic en el marge, apareix un punt roig).
2. Executa en **mode depuració** (el botó del bitxo 🐞, no el de ▶).
3. El programa es deté. Mira el panell **Variables**: `sospechoso` val 0 i `i` val 0.
4. Polsa **Step Over (F8)** diverses vegades i observa com canvien `sospechoso` i `i` en cada volta.

<details>
<summary>🔄 Què hauries de vore</summary>

Valors de `sospechoso` en cada parada: 0, 1, 3, 6, 10, 15, 21, 28, 36, 45 i, en acabar el bucle, **55**. El valor final imprés és "El culpable es: 55". Si en el teu depurador el valor no coincidix, tens al davant un bug real per a diagnosticar. Això és depurar.

</details>

---

## 🧠 La regla d'or del depurador

Quan alguna cosa falla, **no endevines: observa**. El procés és sempre el mateix:

1. **Reproduïx** la fallada (que ocórrega sempre que pugues).
2. Posa un breakpoint **abans** de la zona sospitosa.
3. **Avança** amb F8 i **observa** variables fins a localitzar la línia on el valor es torç.
4. En vore on es desvia el valor, hauràs trobat el bug.

> 💡 **Consell:** si el programa s'executa fins al final sense detindre's, és que el breakpoint està en una línia que **mai s'aconseguix** (per exemple, dins d'un mètode que ningú crida, com el `saludo()` del punt 3). El breakpoint no es dispara: una altra pista de detectiu.

---

## 🎯 Mini-chequeig

1. Quina diferència hi ha entre **Step Over** i **Step Into**?
2. Si poses un breakpoint i el programa no es deté, què sospites?
3. En quin mode cal executar el programa perquè els breakpoints funcionen?

<details>
<summary>🔄 Respostes</summary>

1. **Step Over** executa la línia sencera sense entrar en els mètodes que crida; **Step Into** entra dins del mètode per a vore les seues línies una a una.
2. Que el breakpoint està en una línia que **mai s'executa** (codi mort, mètode no cridat, condició que no es complix).
3. En **mode depuració** (el botó del bitxo 🐞), no en el mode execució normal (▶).

</details>

---

## ✅ Resum en 3 frases

1. El depurador para el programa on tu marques (**breakpoint**) i et mostra les variables en viu.
2. **Step Over** no entra en els mètodes; **Step Into** sí; **Watch** et mostra els valors.
3. Davant un bug, no endevines: **reproduïx, para, avança i observa** fins a trobar on es torç el valor.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Bug | Un error en el programa |
> | Debug | Procés de trobar i arreglar bugs |
> | Breakpoint | Marca on el programa es deté |
> | Step Over / Into | Avançar sense entrar / entrant en mètodes |
> | Watch | Panell que mostra variables i expressions |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/01-introduccion) · **Anterior:** [03 · El teu primer programa](/ApuntesProgramacion/va/01-introduccion/03-hola-mundo) · **Següent:** [05 · Comentaris i documentació](/ApuntesProgramacion/va/01-introduccion/05-comentarios)