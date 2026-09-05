---
title: "05 — Atributs static"
description: "El que pertany a la classe i no a l'objecte: el grup de WhatsApp en comptes dels missatges privats 📢"
---

<p><small>El que pertany a la classe i no a l'objecte: el grup de WhatsApp en comptes dels missatges privats 📢</small></p>

> 🗺️ **Estàs en:** 🔒 **U08 · Visibilitat, Encapsulació i Static** → 05 · Atributs static

---

## 📬 La idea en una frase

> **Un atribut `static` és de la classe, no de l'objecte: només hi ha una còpia per a tots, com el grup de WhatsApp de la classe, mentres que els atributs normals són els missatges privats de cada un.**

Fins ara, cada objecte que creaves amb `new` tenia els seus propis atributs. Si creaves dos `Estudiante`, cada un tenia el seu `nombre`. Però hi ha dades que no tenen sentit "per objecte": el nombre total d'estudiants creats, per exemple. Això no és d'un estudiant concret: és de **la classe**. I per a això existix `static`.

---

## 📱 El grup de WhatsApp vs els missatges privats

Imagina que eres part d'una classe de 30 alumnes:

- **El grup de WhatsApp de la classe** (`static`): tots veuen el mateix missatge. Si algú escriu "demà hi ha examen", els 30 ho lliguen. És compartit.
- **Els teus missatges privats** (instància): només tu els veus. Cada alumne té els seus i no es barregen.

En Java és igual:

- **Variable de classe** (`static`): una sola còpia compartida per tots els objectes.
- **Variable d'instància** (sense `static`): cada objecte té la seua, independent.

```java
public class Estudiante {
    private static int totalEstudiantes = 0;
    private String nombre;
    private int id;

    public Estudiante(String nombre) {
        this.nombre = nombre;
        this.id = ++totalEstudiantes;
    }

    public static int getTotalEstudiantes() {
        return totalEstudiantes;
    }

    public int getId() {
        return id;
    }
}
```

Cada `Estudiante` té el seu propi `nombre` i `id`, però tots compartixen `totalEstudiantes`. Quan crees el tercer estudiant, el comptador passa a 3 **per a tota la classe**.

---

## 🧠 Com es veu en memòria

```
  CLASSE: Estudiante
  ┌──────────────────────┐
  │ totalEstudiantes = 3 │  ← static: UN per a tota la classe
  └──────────────────────┘

  OBJECTE e1       OBJECTE e2       OBJECTE e3
  ┌─────────┐      ┌─────────┐      ┌─────────┐
  │ nombre  │      │ nombre  │      │ nombre  │
  │ id = 1  │      │ id = 2  │      │ id = 3  │
  └─────────┘      └─────────┘      └─────────┘
```

El comptador viu en "la classe" (un espai que existix una sola vegada), mentres que cada objecte té el seu nom i el seu id en el seu propi calaix.

---

## 📞 L'ús clàssic: comptadors i ids

L'exemple anterior és el patró estrella dels atributs `static`: **comptar objectes creats** i generar **ids autoincrementals**. Cada vegada que el constructor s'executa, `totalEstudiantes` puja i eixe valor s'usa com a id. És com el mostrador de la fleca: hi ha un únic número a la paret que va pujant per a tots els clients.

```java
Estudiante a = new Estudiante("Ana");
Estudiante b = new Estudiante("Luis");
Estudiante c = new Estudiante("Marta");

System.out.println(Estudiante.getTotalEstudiantes()); // 3
System.out.println(c.getId());                        // 3
```

> 💡 **Detall pràctic:** per a accedir a un membre `static`, usa el nom de la **classe**: `Estudiante.getTotalEstudiantes()`. Funcionaria amb un objecte (`c.getTotalEstudiantes()`), però és confús: dona a entendre que el valor és "de c", quan és de tots.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** quan veges un `static`, pregunta't: *té sentit que això siga diferent per a cada objecte?* Si la resposta és "no", llavors pertany a la classe.

**Exercici: els gats estàtics**

Mira este codi i respon SENSE EXECUTAR:

```java
public class Gato {
    public static int totalGatos = 0;
    public String nombre;

    public Gato(String nombre) {
        this.nombre = nombre;
        totalGatos++;
    }

    public static void decirTotal() {
        System.out.println("Hay " + totalGatos + " gatos");
        // System.out.println(nombre); // ¿Açò funciona?
    }
}
```

1. Funciona `System.out.println(nombre);` dins de `decirTotal()`?
2. Si crees 3 gats i després fas `Gato.decirTotal()`, què imprimeix?
3. I si crees 5 gats més? Què imprimeix ara?

<details>
<summary>🔄 Solució</summary>

1. **NO funciona.** `nombre` és una variable d'instància i `decirTotal()` és estàtic: no sap de quin gat parlem. No hi ha "un gat" concret al qual preguntar-li.
2. **`Hay 3 gatos`**: el comptador estàtic ha pujat amb cada constructor.
3. **`Hay 8 gatos`**: el comptador seguix on estava i seguix pujant. És compartit, no es reinicia per objecte.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quantes còpies existix d'un atribut `static`?
2. Com s'accedeix a un atribut estàtic des de fora?
3. Per a què servix un comptador `static` amb un `id` autoincremental?
4. Pot un mètode estàtic llegir un atribut d'instància directament?

<details>
<summary>🔄 Respostes</summary>

1. **Una sola**, compartida per tots els objectes de la classe.
2. Amb el nom de la classe: `Estudiante.getTotalEstudiantes()` (o `Clase.atributo` si fóra públic).
3. Per a comptar objectes creats i assignar un número únic a cada un, com el mostrador de la fleca.
4. No: no sap de quin objecte es parla. (Això es veu amb detall en el punt 6.)

</details>

---

## ✅ Resum en 3 frases

1. Un atribut `static` pertany a la **classe**: hi ha una sola còpia per a tots els objectes.
2. S'usa per a dades compartides: **comptadors**, ids autoincrementals, configuracions globals.
3. Accedix sempre pel **nom de la classe**, no per un objecte, perquè el codi quede clar.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `static` | Pertany a la classe, no a l'objecte |
> | Variable de classe | Atribut `static`, una còpia compartida |
> | Variable d'instància | Atribut normal, una còpia per objecte |
> | Comptador | Atribut `static` que s'incrementa en cada `new` |
> | Id autoincremental | Número únic assignat amb el comptador |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/08-visibilidad-encapsulacion-static) · **Anterior:** [04 · Getters i setters](/ApuntesProgramacion/va/08-visibilidad-encapsulacion-static/04-getters-setters) · **Següent:** [06 · Mètodes static i el main](/ApuntesProgramacion/va/08-visibilidad-encapsulacion-static/06-metodos-static)