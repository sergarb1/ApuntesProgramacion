---
title: "07 · Divideix el problema"
description: "Main com a director d'orquestra: una responsabilitat per mètode, el programa que es llig com un resum i com trossejar sense por 🧱"
---

<p><small>Main com a director d'orquestra: una responsabilitat per mètode, el programa que es llig com un resum i com trossejar sense por 🧱</small></p>

> 🗺️ **Estàs en:** 🔧 **U05 · Funcions i mètodes** → 07 · Divideix el problema

---

## 📬 La idea en una frase

> **Dividir és escriure un `main` que es llija com un resum en anglés clar ("llegir dades, calcular mitjana, mostrar informe") i amagar cada frase en un mètode amb el seu nom.**

---

## 🎼 El director no toca els instruments

Un bon `main` pareix això:

```java
public static void main(String[] args) {
    double[] notas = leerNotas();
    double media = calcularMedia(notas);
    String informe = formatearInforme(media);
    System.out.println(informe);
}
```

Quatre línies, quatre verbs, zero aritmètica. Vols saber com es llegeixen les notes? Obres `leerNotas()`. Com es calcula la mitjana? `calcularMedia()`. Cada detall viu al seu lloc i `main` continua sent un **índex del programa**, no un full de receptes.

Si eixe mateix programa vivira tot en `main`, tindries 40 línies barrejant lectura, càlcul i format on cap comentari et salva. El director d'orquestra no toca els instruments: **coordina**.

---

## 🔪 Com trossegar: el mètode dels verbs

Mira un `main` de taller i encén els verbs:

```java
public static void main(String[] args) {
    // 1. llegir les notes del teclat           → leerNotas()
    // 2. comprovar si hi ha alguna suspesa     → tieneSuspensa(notas)
    // 3. calcular la mitjana                   → calcularMedia(notas)
    // 4. imprimir el resultat bonic            → mostrarResultado(media, notas)
}
```

Cada verb amb parèntesis en el comentari és **un candidat a mètode**. El patró es repeteix:

1. **Escriu el comentari-objectiu** (o llig-lo si ja està).
2. **Crea el mètode** amb eixe nom, `public static`, paràmetres si necessita dades, retorn si torna alguna cosa.
3. **Mou el codi** d'eixe pas al cos.
4. **Deixa una crida** en `main` i **executa**: si feia el mateix que abans, has trossejat bé.
5. Repeteix amb el següent verb. **Un mètode cada volta.**

> 💡 **Consell:** si necessites un comentari per a explicar un bloc de 5 línies, eixe bloc ja té nom: fes-lo mètode i que el nom parle per ell.

### On està el límit?

| Es queda en `main` | Va al seu mètode |
|---|---|
| La seqüència de passos | Un pas amb nom propi |
| Un `if` de dues línies que decideix flux | Un bloc que repeteixes o que "fa una cosa" |
| La crida final d'impressió | El compte, la lectura, la cerca, el format |

No hi ha llei universal de "més de N línies", sí una brúixola: **una responsabilitat per mètode**. `calcularMediaYMostrarYGuardar` són tres mètodes disfressats d'un.

---

## 🧪 Abans i després: l'informe de notes

**Abans** (tot en `main`):

```java
public static void main(String[] args) {
    Scanner teclado = new Scanner(System.in);
    double suma = 0;
    for (int i = 0; i < 5; i++) {
        System.out.print("Nota " + (i + 1) + ": ");
        suma += teclado.nextDouble();
    }
    double media = suma / 5;
    System.out.println("Mitjana: " + media);
    if (media >= 5) {
        System.out.println("¡APROVAT!");
    } else {
        System.out.println("Suspès. A per ell.");
    }
}
```

**Després** (un resum i dos receptes):

```java
public static void main(String[] args) {
    double[] notas = leerNotas(5);
    double media = calcularMedia(notas);
    mostrarVeredicto(media);
}

static double[] leerNotas(int cantidad) { ... }      // llegir
static double calcularMedia(double[] notas) { ... }  // calcular
static void mostrarVeredicto(double media) { ... }   // contar
```

Mateix programa, dos vides distintes: en la segona, demà afegixes el màxim sense tocar res més (bé, gairebé: `leerNotas` ja torna un array... que veus de veritat en la U06).

> 📝 **Nota:** l'ordre de declaració no importa (ho vas vore en el punt 2), així que `main` pot llegir-se amunt com un resum encara que els seus ajudants estiguen davall.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** si dubtes entre trossejar o no, escriu la crida que **volgueres** tindre (`int max = encontrarMaximo(notas);`) i després fes que existisca. El codi es dissenya cap avant, com es demana en un restaurant.

**Exercici: el verb amagat**

Quin mètode (nom i firma) treguries d'este `main`? Torna `true` si tots els nombres són positius:

```java
public static void main(String[] args) {
    int[] datos = {3, 7, 2};
    boolean todoPositivo = true;
    for (int i = 0; i < datos.length; i++) {
        if (datos[i] <= 0) {
            todoPositivo = false;
        }
    }
    System.out.println("¿Tot positiu? " + todoPositivo);
}
```

<details>
<summary>🔄 Solució</summary>

```java
public static boolean todosPositivos(int[] datos) {
    for (int i = 0; i < datos.length; i++) {
        if (datos[i] <= 0) {
            return false;
        }
    }
    return true;
}
```

Verb: "tots positius" → nom `todosPositivos`. Necessita dades? Sí → `int[] datos`. Torna alguna cosa? Sí, un judici → `boolean`. `main` queda en: `boolean ok = todosPositivos(datos);`. (Que el bucle use arrays no et distraga: la idea del trosseig és la mateixa en qualsevol terreny.)

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quines tres preguntes et fas en dissenyar un mètode? (pista: nom, entrades, eixides)
2. Quin és l'ofici de `main` en un programa ben trossejat?
3. Quina senyal diu "este bloc demana mètode"?
4. Quants blocs trosseges d'una volta quan refactoritzes?

<details>
<summary>🔄 Respostes</summary>

1. Com es diu (quin verb fa)? Quines dades necessita (paràmetres)? Què torna (retorn o `void`)?
2. Coordinar: llegir → calcular → mostrar, en crides llegibles.
3. Necessitar un comentari per a explicar-lo, repetir-se en un altre lloc o contenir "una cosa amb nom".
4. Un sol, executant després de cada extracció: si algo es trenca, saps què va ser.

</details>

---

## ✅ Resum en 3 frases

1. Un `main` ben trossejat es llig com un **resum** de verbs; cada verb viu en un mètode amb una responsabilitat.
2. El mètode dels verbs: **comentari → nom → firma → moure codi → cridar i provar**, un mètode cada volta.
3. La brúixola no és la longitud, és la **responsabilitat**: si el nom del mètode necessita "i", són dos mètodes.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Orquestració | `main` coordina; els mètodes treballen |
> | Responsabilitat única | Un mètode, una cosa ben feta |
> | Extraure mètode | Moure un bloc a un mètode nou |
> | Refactoritzar | Reorganitzar sense canviar el que fa |
> | Mètode helper | Ajudant menut al servei d'un altre pas |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/05-funciones) · **Anterior:** [06 · Errors freqüents](/ApuntesProgramacion/va/05-funciones/06-errores-frecuentes) · **Següent:** [08 · Be the Code](/ApuntesProgramacion/va/05-funciones/08-be-the-code)
