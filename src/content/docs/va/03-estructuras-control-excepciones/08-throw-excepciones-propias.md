---
title: 08 — throw i excepcions pròpies
description: Quan et toca a tu llançar la pedra i crear el teu propi defecte 🎳
---

<p><small>Quan et toca a tu llançar la pedra i crear el teu propi defecte 🎳</small></p>

> 🗺️ **Estàs en:** 🔀 **U03 · Estructures de Control i Excepcions** → 08 · throw i excepcions pròpies

---

## 📬 La idea en una frase

> **`throw` llança una excepció quan tu decidixes que alguna cosa no ha de continuar, i creant la teua pròpia excepció pots posar-li el nom que vulgues al problema.**

Fins ara Java llançava les excepcions per tu. Però hi ha un superpoder millor: **tu** decidixes quan llançar-les, i pots inventar-te tipus d'error a la teua mesura.

---

## 🎳 throw: llança la pedra

`throw` crea i llança una excepció on vulgues. És com dir "ací alguna cosa està mal, que ho sàpia tot el món":

```java
public class CompteBancari {
    public static void main(String[] args) {
        double saldo = 10.0;
        double retir = 500.0;

        if (retir > saldo) {
            throw new ArithmeticException("Saldo insuficient: " + saldo);
        }

        saldo -= retir;
        System.out.println("Nou saldo: " + saldo);
    }
}
```

Eixe `throw new ArithmeticException("...")` deté el programa amb eixa excepció. I el missatge que li passes al constructor és el que veuràs en `e.getMessage()`.

> 💡 **Detall pràctic:** `throw` i `throws` no són cosins: són bessons diferents. `throw` **llança** una excepció (ho veus ací). `throws` **anuncia** en la signatura del mètode que pot llançar excepcions controlades. `throw` va al cos; `throws`, a la capçalera.

---

## 🏗️ Excepcions pròpies: el teu defecte a mida

Per què conformar-te amb `ArithmeticException` quan pots tindre una `SaldoInsuficientException` amb nom de pel·lícula? Crear la teua pròpia excepció és **heretar d'`Exception`** (o de `RuntimeException`) i llest:

```java
public class SaldoInsuficientException extends RuntimeException {
    public SaldoInsuficientException(String missatge) {
        super(missatge);
    }
}
```

I ara la uses:

```java
public class Caixer {
    public static void main(String[] args) {
        double saldo = 10.0;
        double retir = 500.0;

        if (retir > saldo) {
            throw new SaldoInsuficientException("Només tens " + saldo + "€.");
        }

        System.out.println("Retirat: " + retir);
    }
}
```

Eixida (amb el programa tallant-se):

```
Exception in thread "main" SaldoInsuficientException: Només tens 10.0€.
	at Caixer.main(Caixer.java:9)
```

> 💡 **Detall pràctic:** hereta d'`Exception` si vols **obligar** els qui la usen a capturar-la (excepció controlada). Hereda de `RuntimeException` si prefereixes que no els obligue (com les que vas vore en el punt 6). Per a començar, `RuntimeException` és més còmoda.

---

## ⚖️ checked vs unchecked: la burocràcia de les excepcions

- **Checked (controlades)**: el compilador **t'obliga** a capturar-les o a declarar-les amb `throws`. Hereden d'`Exception` però no de `RuntimeException`. Exemple: `IOException`.
- **Unchecked (no controlades)**: no t'obliguen a res. Són `RuntimeException` i les seues filles.

```java
import java.io.IOException;

public class Mussol {
    public static void main(String[] args) throws IOException {
        // com que IOException és checked, HA d'anar en el throws
        // o estar dins d'un try/catch
    }
}
```

Si una excepció és checked i no la gestiones, **no compila**. Si és unchecked, el compilador et deixa tranquil (i l'error explota en execució).

---

## 🏫 Exemple guiat: la màquina expenedora

Anem a crear una excepció pròpia i un programa que la llance i l'atrabe:

```java
public class ProducteEsgotatException extends RuntimeException {
    public ProducteEsgotatException(String producte) {
        super("El producte " + producte + " està esgotat.");
    }
}
```

```java
public class MaquinaExpenedora {
    public static void main(String[] args) {
        int stock = 0;
        String producte = "Refresc";

        try {
            if (stock == 0) {
                throw new ProducteEsgotatException(producte);
            }
            System.out.println("Ací tens el teu " + producte);
        } catch (ProducteEsgotatException e) {
            System.out.println("Ho sentim: " + e.getMessage());
        }

        System.out.println("La màquina seguix funcionant. 🤖");
    }
}
```

Eixida:

```
Ho sentim: El producte Refresc està esgotat.
La màquina seguix funcionant. 🤖
```

Veus la màgia? El `throw` llança la teua excepció, el `catch` l'atrapar pel seu **nom propi** i el programa sobreviu. Eixe nom convertix un error genèric en un missatge que fins i tot la teua cap entén.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** si una condició "impossible" ocorre al teu codi, és millor `throw` que deixar que el programa continue amb dades trencades. Una excepció primerenca val més que un bug que apareix dues setmanes després.

**Exercici: el controlador de notes**

Crea (en paper o a l'IDE) una excepció pròpia `NotaInvalidaException` que herete de `RuntimeException`, i un mètode que la llance si una nota no està entre 0 i 10. Què hereta la teua excepció del seu pare?

<details>
<summary>🔄 Solució</summary>

```java
public class NotaInvalidaException extends RuntimeException {
    public NotaInvalidaException(double nota) {
        super("La nota " + nota + " no està entre 0 i 10.");
    }
}
```

Ús:

```java
public class Notes {
    public static void main(String[] args) {
        double nota = 15;
        if (nota < 0 || nota > 10) {
            throw new NotaInvalidaException(nota);
        }
        System.out.println("Nota vàlida: " + nota);
    }
}
```

La teua excepció hereta de `RuntimeException` (que al seu torn hereta d'`Exception` i de `Throwable`) tot el comportament de llançar-se i capturar-se, el constructor que rep un missatge (amb `super(missatge)`) i el mètode `getMessage()`. Tu només poses el nom i el missatge.

</details>

---

## 🎯 Mini-chequeig

1. Què fa la paraula clau `throw`?
2. Com es crea una excepció pròpia?
3. Quina és la diferència entre `throw` i `throws`?
4. Quina diferència hi ha entre checked i unchecked?

<details>
<summary>🔄 Respostes</summary>

1. **Llança** una excepció en el punt del codi on la col·loques: `throw new MiExcepcion("...");`.
2. Heredant d'`Exception` o de `RuntimeException` i afegint (opcionalment) un constructor que cride a `super(missatge)`.
3. `throw` llança una excepció (al cos del mètode); `throws` declara en la signatura que el mètode pot llançar excepcions checked.
4. Les **checked** t'obliguen a capturar-les o declarar-les (`throws`); les **unchecked** (`RuntimeException` i filles) no t'obliguen.

</details>

---

## ✅ Resum en 3 frases

1. `throw` llança una excepció on tu decidixes, amb el missatge que vulgues.
2. Crear la teua pròpia excepció és **heretar d'`Exception` o `RuntimeException`** i posar-li un constructor amb missatge.
3. `throw` (llançar) ≠ `throws` (declarar), i les excepcions **checked** obliguen a gestionar-les mentre les **unchecked** no.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `throw` | Llança una excepció: `throw new MiExcepcion()` |
> | `throws` | Declara en la signatura que el mètode pot llançar alguna cosa |
> | Excepció pròpia | Classe que hereta d'`Exception` o `RuntimeException` |
> | Checked | Excepció que el compilador t'obliga a gestionar |
> | Unchecked | Excepció sense obligació de captura (`RuntimeException`) |
> | `super(missatge)` | Passa el missatge a la classe pare |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/03-estructuras-control-excepciones) · **Anterior:** [07 · try, catch i finally](/ApuntesProgramacion/va/03-estructuras-control-excepciones/07-try-catch-finally) · **Següent:** [09 · Repàs interactiu](/ApuntesProgramacion/va/03-estructuras-control-excepciones/09-repaso-interactivo)
