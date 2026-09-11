---
title: "04 — El depurador"
description: "Breakpoints, step over/into, watch 🐛"
---

<p><small>Breakpoints, step over/into, watch 🐛</small></p>

> 🗺️ **Estàs en:** 🚀 **U01 · Introducció a Java** → 04 · El depurador

---

El depurador (debugger) és com tindre visió de raigs X per al teu codi: para el programa on tu vols i t'ensenya el valor de cada variable en cada instant.

El teu primer programa funciona. Però prompte tindràs un programa rar: una variable `edat` que ix 25 quan n'hauria d'eixir 18. Què fas? Li pegues a l'ordinador? No. Uses el depurador.

---

## 🔍 Què és depurar?

Depurar (debug) és traure-li els bitxos (bugs) al programa. I el secret dels programadors experimentats no és endevinar: és veure. El depurador et permet:

- Parar el programa en una línia concreta.
- Avançar instrucció a instrucció.
- Inspeccionar el valor de les variables en cada moment.
- Modificar valors sobre la marxa.

És com vore una sèrie de crims en càmera lenta: pots pausar, observar qui fa què, i analitzar cada detall.

💡 **Detall pràctic:** Els errors es dividixen en dues famílies. Els de compilació els atrapa `javac` (o el mateix VS Code remarcant-ho en roig) i et diu la línia. Els de lògica compilen perfecte però fan el que no han de fer: per a eixos no hi ha millor arma que el depurador.

---

## 🛠️ Les quatre ferramentes del detectiu en VS Code

| Ferramenta | Drecera (VS Code) | Què fa |
| --- | --- | --- |
| **Breakpoint (punt de ruptura)** | Clic a l'esquerra del número de línia | Li dius a Java "para ACÍ, vull vore què passa". |
| **Step Over** | F10 | "Executa esta línia però no em contes els detalls interns". |
| **Step Into** | F11 | "Executa esta línia I porta'm dins d'eixa crida, vull espiar". |
| **Variables / Watch** | Panell lateral de depuració | "Ensenya'm el valor de la variable ARA MATEIX". |

- **Breakpoint**: Marca una línia amb un punt roig. El programa es deté just abans d'executar-la i espera les teues ordres.
- **Step Over (F10):** Executa la línia completa de colp, sense entrar en els mètodes que crida.
- **Step Into (F11):** Entra dins del mètode cridat per a vore les seues línies una a una.
- **Variables / Watch:** El panell esquerre en la vista de depuració de VS Code (Run and Debug) que mostra les variables vives i els seus valors actuals. En Watch pots afegir expressions concretes per a avaluar-les en temps real.

⚠️ **Advertència:** Si et perds dins d'un mètode alié amb Step Into, prem Step Out (`Shift + F11`): ix del mètode i torna al punt on el vas cridar. És el botó "he entrat sense voler, traieu-me d'ací".

---

## 🏫 Exemple guiat: el cas del sospitós en VS Code

Ací tens un programa perfecte per a estrenar el depurador:

```java
public class DetectivesDeCodigo {
    public static void main(String[] args) {
        int sospechoso = 0;
        for (int i = 0; i < 10; i++) {
            sospechoso += i; // Posa un breakpoint ací
        }
        System.out.println("El culpable es: " + sospechoso);
    }
}
```

El bucle `for` el veuràs a fons en la U03, però ho pots intuir: repeteix la línia de dins mentre `i` siga menor que 10, amb `i` valent 0, 1, 2... La línia clau és `sospechoso += i` (que és el mateix que `sospechoso = sospechoso + i`).

**L'exercici de detectiu:**

1. Posa un breakpoint en la línia de `sospechoso += i` (fes clic a l'esquerra del número de línia; apareixerà un punt roig fix).
2. Executa en mode depuració: prem `F5` o fes clic a la icona del bitxo amb el triangle ▶ (Run and Debug / Start Debugging) en la barra flotant superior o en la pestanya esquerra.
3. El programa es deté i eixa línia s'il·lumina en groc. Mira el panell Variables a l'esquerra: veuràs que `sospechoso` val 0 i `i` val 0.
4. Prem Step Over (`F10`) diverses vegades i observa com canvien `sospechoso` i `i` en el panell lateral en cada volta.

### 🔄 Què hauries de vore

Valors de `sospechoso` en cada parada: 0, 1, 3, 6, 10, 15, 21, 28, 36, 45 i, en acabar el bucle, 55. El valor final imprés en la terminal de VS Code és "El culpable es: 55". Si en el teu depurador el valor no coincideix, tens al davant un bug real per a diagnosticar. Això és depurar.

---

## 🧠 La regla d'or del depurador

Quan alguna cosa falla, no endevines: observa. El procés és sempre el mateix:

1. Reprodueix la fallada (que ocórrega sempre que pugues).
2. Posa un breakpoint abans de la zona sospitosa.
3. Avança amb `F10` i observa les variables en el panell lateral fins a localitzar la línia on el valor es torç.
4. En veure on es desvia el valor, hauràs trobat el bug.

💡 **Consell:** Si el programa s'executa fins al final sense detindre's, és que el breakpoint està en una línia que mai s'aconsegueix (per exemple, dins d'un mètode que ningú crida o en una condició `if` que no es compleix). El breakpoint no es dispara: una altra pista de detectiu.

---

## 🎯 Mini-comprovació

1. Quina diferència hi ha entre Step Over (F10) i Step Into (F11)?
2. Si poses un breakpoint i el programa no es deté, què sospites?
3. En quin mode cal executar el programa perquè els breakpoints funcionen?

**🔄 Respostes**

1. Step Over (F10) executa la línia sencera sense entrar en els mètodes que crida; Step Into (F11) entra dins del mètode per a vore les seues línies una a una.
2. Que el breakpoint està en una línia que mai s'executa (codi mort, mètode no cridat, condició que no es compleix).
3. En mode depuració (prement `F5` / icona del bitxo 🐞 Start Debugging), no en mode execució normal (Run Without Debugging).

---

## ✅ Resum en 3 frases

1. El depurador para el programa on tu marques (breakpoint) i et mostra les variables en viu en el panell lateral de VS Code.
2. Step Over (F10) no entra en els mètodes; Step Into (F11) sí; el panell Variables / Watch et mostra els valors en temps real.
3. Davant un bug, no endevines: reprodueix, para, avança i observa fins a trobar on es torç el valor.

---

## 🐛 Vocabulari ràpid

| Terme | Idea general |
| --- | --- |
| **Bug** | Un error en el programa |
| **Debug** | Procés de trobar i arreglar bugs |
| **Breakpoint** | Marca (punt roig) on el programa es deté |
| **Step Over / Into** | Avançar sense entrar (F10) / entrant (F11) en mètodes |
| **Watch / Variables** | Panell lateral de VS Code que mostra variables i expressions |
