---
title: Butlletí U08 — Avançat
description: Exercicis de dificultat progressiva per a exprimir la unitat
---

# 📝 Butlletí U08 — Avançat

> Dificultat progressiva. ⭐ per a escalfar, ⭐⭐ per a pensar, ⭐⭐⭐ per a concursar. Cada exercici inclou una pista (resisteix a mirar-la).

---

## ⭐ Exercici 1: Empleat amb validació

Escriu una classe `Empleat` amb:

- Atributs `private String nom`, `private double salari`.
- Constructor que valide que el salari no siga negatiu (si ho és, el deixa en 0 i mostra un avís).
- Getters i setters. El setter del salari també ha de rebutjar negatius.

En un `main`, crea un empleat "Laura" amb salari 1500, intenta posar-li -300 i mostra el salari final.

**Pista:** reutilitza la validació del setter dins del constructor: `setSalari(salari)` en comptes d'assignar a seques.

---

## ⭐ Exercici 2: Cercle encapsulat

Escriu una classe `Cercle` amb:

- Atribut `private double radi`.
- Constructor que reba el radi.
- Getter `getRadi()`, setter `setRadi(double)` que rebutge radis negatius o zero.
- Mètodes `getArea()` i `getPerimetre()` que usen `Math.PI`.

En un `main`, crea un cercle de radi 5 i mostra la seua àrea i perímetre.

**Pista:** `area = Math.PI * radi * radi;` i `perimetre = 2 * Math.PI * radi;`. Recorda que `Math.PI` és una constant estàtica.

---

## ⭐⭐ Exercici 3: JavaBean Alumne

Escriu una classe `Alumne` seguint l'estil JavaBean (l'estàndard per a classes de dades):

- Atributs `private String nom`, `private int edat`, `private double notaMitjana`.
- Constructor sense paràmetres i constructor amb els tres valors.
- Getter i setter per a **cada** atribut.
- El setter de `edat` ha de rebutjar edats fora de 0 i 120; el de `notaMitjana`, fora de 0 i 10.

En un `main`, crea un alumne amb el constructor complet i després modifica la seua nota amb el setter.

**Pista:** un JavaBean és "atributs privats + getters/setters + constructors": el patró que veuràs en qualsevol framework. Els setters validen; els getters només lligixen.

---

## ⭐⭐ Exercici 4: Hora immutable

Escriu una classe `Hora` que represente una hora del dia i que siga **immutable**: els seus atributs només s'assignen en el constructor i no tenen setters.

- Atributs `private final int hora`, `private final int minut`.
- Constructor que valide `hora` entre 0 i 23 i `minut` entre 0 i 59.
- Getters `getHora()` i `getMinut()`.
- Mètode `mostrar()` que retorne `"HH:MM"` (amb zeros: `09:05`).

En un `main`, crea una hora 9:05 i mostra-la. Respon: per què no necessita setters?

**Pista:** usa `String.format("%02d:%02d", hora, minut)` o `"0" + ...` quan el valor siga menor que 10.

---

## ⭐⭐ Exercici 5: Què imprimeix? — el trencaclosques dels gats

Sense executar, escriu l'eixida exacta:

```java
public class Gat {
    public static int totalGats = 0;
    private String nom;
    private int vides;

    public Gat(String nom) {
        this.nom = nom;
        this.vides = 9;
        totalGats++;
    }

    public void perdreVida() {
        if (vides > 0) {
            vides--;
        }
    }

    public String toString() {
        return nom + " (" + vides + " vides)";
    }
}
```

```java
public class TrencaclosquesGats {
    public static void main(String[] args) {
        Gat g1 = new Gat("Bigotis");
        Gat g2 = new Gat("Garfield");
        g1.perdreVida();
        g1.perdreVida();
        g2.perdreVida();

        System.out.println(g1);
        System.out.println(g2);
        System.out.println("Total: " + Gat.totalGats);
    }
}
```

**Pista:** cada gat naix amb 9 vides i les perd una a una amb `perdreVida()`. Compta quantes vegades es diu sobre cada gat, i recorda que `totalGats` és `static`.

---

## ⭐⭐ Exercici 6: Comptador d'usuaris

Escriu una classe `Usuari` que assigne a cada objecte un `id` **únic i automàtic**:

- Atribut `private static int comptador = 0;` i `private int id;`.
- Constructor que incremente `comptador` i assigne `id = comptador`.
- Mètode `public static int getTotalUsuaris()`.
- Getter `getId()`.

En un `main`, crea 5 usuaris i mostra l'id de l'últim i el total d'usuaris.

**Pista:** el patró del punt 5: el `static` compta quants s'han creat, i cada objecte es "congela" el seu número en nàixer. `getTotalUsuaris` és estàtic perquè pregunta a la classe, no a un objecte.

---

## ⭐⭐⭐ Exercici 7: La classe utilitària OperacionsArray

Escriu una classe `OperacionsArray` **utilitària** (constructor privat) amb estos mètodes `static`:

- `suma(int[] numeros)` → suma tots els elements.
- `mitjana(double[] numeros)` → retorna el promig.
- `maxim(int[] numeros)` → retorna el més gran.
- `estaOrdenat(int[] numeros)` → `true` si cada element és major o igual que l'anterior.

En un `main`, usa la classe **sense crear cap objecte** sobre `{3, 1, 4, 1, 5}` i `{1, 2, 3}`.

**Pista:** el constructor `private OperacionsArray() {}` impedix instanciar-la, com `Math`. Per a `estaOrdenat`, recorre amb un `for` i compara cada element amb l'anterior (`numeros[i] < numeros[i - 1]` → no està ordenat).

---

## ⭐⭐⭐ Exercici 8: Validador de dades

Escriu una classe `Validador` **utilitària** (constructor privat) amb estos mètodes `static`:

- `esEmailValid(String email)` → `true` si conté exactament una `@` i almenys un `.` després de la `@`.
- `esEdatValida(int edat)` → `true` si està entre 0 i 120.
- `esTextNoBuit(String text)` → `true` si no és `null` i no està en blanc.

En un `main`, prova els tres mètodes amb casos vàlids i invàlids (per exemple `"ana@mail.com"`, `"ana@"`, `"hola"`, `-5`, `200`, `null`).

**Pista:** usa `String.indexOf("@")` per a localitzar la `@`, `indexOf("@", pos + 1)` per a comprovar que no n'hi ha una segona, i `indexOf(".", pos)` per al punt després de la `@`. Un `return` primerenc en cada condició fallida simplifica molt.

---

## ⭐⭐⭐ Exercici 9: El gran repte — refactoritza el banc

Este codi funciona... però és una porta oberta. Refactoritza'l seguint els passos del punt 8 (Be the Code):

```java
public class CompteBancari {
    public String titular;
    public double saldo;

    public CompteBancari(String titular, double saldo) {
        titular = titular;
        saldo = saldo;
    }

    public void retirar(double quantitat) {
        saldo = saldo - quantitat;
    }

    public void ingressar(double quantitat) {
        saldo = saldo + quantitat;
    }
}
```

Ha de quedar així:

1. Atributs `private`.
2. Constructor amb `this` i que valide que el saldo inicial no siga negatiu.
3. Getters per als dos; **sense setters** per al saldo.
4. `retirar(double)` que rebutge quantitats negatives i que **no permeta** deixar el saldo en negatiu (si `quantitat > saldo`, avisa i no retira).
5. `ingressar(double)` que rebutge quantitats negatives.
6. Una constant `public static final String NOM_BANC = "Banc DAM";`.

Escriu també un `main` de prova que cree un compte, ingresse, intente retirar més del que té i mostre el saldo.

**Pista:** sense setter per al saldo, només les operacions `retirar` i `ingressar` poden tocar-lo: és la frontera del negoci. Recorda el bug del constructor (`titular = titular` s'assigna a si mateix) i valida tot abans d'assignar.