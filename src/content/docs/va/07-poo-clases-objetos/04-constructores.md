---
title: "04 — Constructors"
description: "El mètode que prepara l'objecte en la seua festa de benvinguda: per defecte i amb paràmetres 🎉"
---

<p><small>El mètode que prepara l'objecte en la seua festa de benvinguda: per defecte i amb paràmetres 🎉</small></p>

> 🗺️ **Estàs en:** 🏗️ **U07 · POO: Classes i Objectes** → 04 · Constructors

---

## 📬 La idea en una frase

> **El constructor és la festa de benvinguda de l'objecte: un mètode especial que s'executa amb `new` perquè l'objecte nasquera ben preparat, amb els seus atributs inicialitzats.**

En el punt 3 veies que els atributs naixien amb valors per defecte (0, `false`, `null`). Molt avorrit. I si vols que el teu cotxe nasca amb marca "Seat" i el motor ja encés? Ací entren els **constructors**: la festa de benvinguda on li dius a l'objecte com ha de ser des del primer segon.

---

## 🎉 Què és un constructor?

Un constructor és un mètode especial amb tres regles d'or:

1. Es diu **igual que la classe**.
2. **No retorna res** (ni tan sols `void`).
3. S'executa automàticament amb cada **`new`**.

```java
public class Persona {
    String nombre;
    int edad;

    // Constructor sense paràmetres: "val, et pose valors per defecte"
    public Persona() {
        nombre = "Desconocido";
        edad = 0;
    }

    // Constructor amb paràmetres: "et passe les dades, tu inicialitza-les"
    public Persona(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    void presentarse() {
        System.out.println("Hola, soy " + nombre + " y tengo " + edad + " años.");
    }
}
```

> 💡 **Tip:** el `this` de `this.nombre = nombre` s'explica en el punt 5. Per ara només necessites saber que significa "l'atribut d'ESTE objecte". Si et pica la curiositat, sàpigues que ja ho resoldràs.

---

## 🆓 El constructor per defecte (el que regala Java)

Si **no escrius cap constructor**, Java et regala un de gratuït, sense paràmetres i buit. Només es dedica a deixar els atributs amb els seus valors per defecte (0, `false`, `null`). Com un forn fred esperant que hi poses alguna cosa.

```java
public class Galleta {
    String sabor;   // Java la crea amb sabor = null
    boolean tieneChocolate;  // false
}
```

`new Galleta()` funciona perquè Java va posar eixe constructor invisible. Però compte amb la trampa:

> ⚠️ **Advertència:** si escrius **qualsevol** constructor, el constructor buit **desapareix**. Si poses `public Galleta(String sabor)`, aleshores `new Galleta()` (sense arguments) deixa de compilar. Java no et regala res si ja has decidit muntar la teua pròpia festa.

---

## 🎛️ El constructor amb paràmetres (el forn amb programa)

Amb paràmetres, l'objecte naix a mida. Li passes les dades i el constructor les col·loca:

```java
public class Galleta {
    String forma;
    boolean tieneChocolate;
    int temperatura;

    public Galleta(String forma, boolean tieneChocolate, int temperatura) {
        this.forma = forma;
        this.tieneChocolate = tieneChocolate;
        this.temperatura = temperatura;
    }
}
```

```java
Galleta g = new Galleta("estrella", true, 180);
```

Una sola línia crea la galeta **ja amb** forma d'estrela, amb xocolate i a 180 graus. Res de deixar atributs ballant.

> 📝 **Nota:** no és obligatori inicialitzar tots els atributs en el constructor, però és la millor costum. Un atribut que es queda sense tocar viu en la incertesa (`null`, 0, `false`) i la incertesa en programació és on s'amaguen els bugs.

---

## 🏭 `new` i el constructor, un tàndem

La línia `new Persona("Ana", 25)` fa tres coses en ordre:

1. Reserva memòria per a l'objecte.
2. Crida al constructor `Persona(String, int)`.
3. Retorna la referència (l'adreça) perquè la guardes en la teua variable.

Sense constructor a la vista, `new Persona("Ana", 25)` fallaria si només existira el buit (o el que regala Java). La JVM tria el constructor que encaixa amb els arguments que li passes. Què passa si n'hi ha diversos? Això és **sobrecàrrega**, i té el seu capítol en el punt 7.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** per a saber quin constructor es crida, mira els arguments de la crida: nombre i tipus. Després, rastreja què fa eixe constructor.

**Exercici: quin constructor es crida?**

Sense executar, què imprimix este codi?

```java
public class Pedido {
    String producto;
    int cantidad;

    public Pedido() {
        this("Sin producto", 0);
        System.out.println("Constructor vacío");
    }

    public Pedido(String producto, int cantidad) {
        this.producto = producto;
        this.cantidad = cantidad;
        System.out.println("Constructor con parámetros");
    }

    public static void main(String[] args) {
        Pedido p = new Pedido();
        System.out.println(p.producto + " x" + p.cantidad);
    }
}
```

<details>
<summary>🔄 Solució</summary>

Es crida a `Pedido()`, que fa `this("Sin producto", 0)`: això executa primer `Pedido(String, int)` (imprimix **"Constructor con parámetros"**), després torna i acaba `Pedido()` (imprimix **"Constructor vacío"**). Després el `main` imprimix **"Sin producto x0"**.

El `this(...)` d'un constructor a un altre **sempre va primer**, abans de qualsevol altra instrucció. És com la presentació abans de la festa: primer crides el teu col·lega constructor i després fas les teues coses.

</details>

---

## ❓ No Hi Ha Preguntes Tontes!

> **Q:** El constructor pot ser `private` o ha de ser `public`?
>
> **A:** Normalment és `public` perquè qualsevol puga crear objectes. Existixen constructors `private`, però tenen truc (s'usen en patrons com Singleton, que veuràs en altres mòduls). Per a esta unitat: `public` i a córrer.

> **Q:** Un constructor pot retornar alguna cosa? I si pose `return` dins?
>
> **A:** Un constructor **no retorna res**, ni tan sols l'objecte (això ho fa `new` per ell). Pots posar un `return;` solt per a eixir abans, però retornar un valor amb `return 5` és un error de compilació. El constructor no és un caixer automàtic.

> **Q:** I si no necessite inicialitzar res? He d'escriure constructor igualment?
>
> **A:** Si no necessites inicialitzar res i no escrius cap constructor, Java et regala el buit. Però el dia que afegesques un constructor amb paràmetres per a una coseta, el buit desapareix. Regla: **si escrius un, escriu també el buit** si el vas a usar.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quines tres regles d'or té un constructor?
2. Què fa Java si no escrius cap constructor?
3. Què passa si escrius un constructor amb paràmetres però després crides a `new Clase()` sense arguments?
4. Quan s'executa un constructor?

<details>
<summary>🔄 Respostes</summary>

1. Mateix **nom que la classe**, **no retorna res** (ni `void`), i s'executa amb cada **`new`**.
2. Regala un constructor **buit sense paràmetres**, que deixa els atributs amb els seus valors per defecte.
3. **Error de compilació**: en escriure qualsevol constructor, el buit desapareix, així que `new Clase()` no troba amb què cridar-se.
4. Automàticament, **en cada `new`**, just després de reservar la memòria.

</details>

---

## ✅ Resum en 3 frases

1. El **constructor** és un mètode especial amb el mateix nom que la classe, sense tipus de retorn, que s'executa amb cada `new` per a preparar l'objecte.
2. **Sense constructor escrit**, Java regala un de buit; **en escriure qualsevol constructor**, el buit desapareix.
3. Amb **paràmetres**, l'objecte naix a mida: els seus atributs queden inicialitzats des del primer segon.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Constructor | Mètode especial que prepara l'objecte en nàixer |
> | Constructor per defecte | El buit que regala Java si no escrius cap |
> | Constructor parametritzat | El que rep dades per a inicialitzar atributs |
> | Instanciar | Crear un objecte amb `new` (que crida el constructor) |
> | `new` | Operador que reserva memòria, crida el constructor i retorna la referència |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/07-poo-clases-objetos) · **Anterior:** [03 · Atributs i mètodes](/ApuntesProgramacion/va/07-poo-clases-objetos/03-atributos-metodos) · **Següent:** [05 · La paraula clau this](/ApuntesProgramacion/va/07-poo-clases-objetos/05-this)