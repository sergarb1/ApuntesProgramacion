---
title: "07 — El compilador i els seus errors"
description: "Compilar vs executar, errors típics del principiant ⚠️"
---

<p><small>Compilar vs executar, errors típics del principiant ⚠️</small></p>

> 🗺️ **Estàs en:** 🚀 **U01 · Introducció a Java** → 07 · El compilador i els seus errors

---

**El compilador no t'odia: és un professor de llengua puntillós que marca cada coma mal posada. Aprendre a llegir els seus missatges és aprendre a programar.**

Tota la teua carrera estarà plena de missatges d'error. Els aprenents els temen; els professionals els llig com qui llig una carta. En este punt aprendràs a entendre què et diu `javac` (i per què Java és tan puntillós).

---

## 🔍 Compilar ≠ executar

Dos moments distints, dues famílies d'errors:

| Moment | Comandament | Què ocorre |
| --- | --- | --- |
| **Compilar** | `javac MiPrograma.java` | El compilador tradueix el teu codi a bytecode. Si hi ha errors de sintaxi, es queixa ací. |
| **Executar** | `java MiPrograma` | La JVM executa el bytecode. Ací poden aparéixer errors de runtime (en temps d'execució). |

```
El teu codi (.java)  --javac-->  bytecode (.class)  --java-->  eixida
       (errors de compilació ací)                (errors d'execució ací)
```

- **Errors de compilació**: el compilador detecta que has escrit malament alguna cosa. Et diu la **línia exacta** i el motiu. No es genera el `.class`.
- **Errors d'execució (runtime)**: el programa compila, però rebenta en córrer (per exemple, `ArrayIndexOutOfBoundsException` del punt 6).
- **Errors de lògica**: tot "funciona", però el resultat és incorrecte. El més perillós: ni el compilador ni el runtime t'avisen. Ací entra el depurador del punt 4.

---

## 😤 L'error de l'aprenent: 4 errors en un programa

Este codi està fatal. Troba els 4 errors abans de mirar la solució:

```java
Public class Calculadora
public static void main(string[] args) {
    System.out.println("Suma: " + 5 + 3)
    System.out.println("Resta: " + (5 - 3));
} }
```

### 🔄 Els 4 errors

1. `Public` hauria de ser **`public`** (minúscula). Java és sensible a les majúscules.
2. Falta **`{`** després de `Calculadora`. La classe necessita la seua clau d'obertura.
3. `string[] args` hauria de ser **`String[] args`** (la S majúscula importa: `String` és una classe, no existix `string`).
4. Falta el **`;`** al final de la primera línia del `println`.

Java és molt puntillós, com un professor de llengua amb les comes: `public`, `String` i `System` comencen en majúscula o majúscules concretes, i cada frase acaba en `;`.

---

## 🔎 Com llegir un missatge d'error de javac

Quan alguna cosa no compila, `javac` et mostra alguna cosa com:

```
Calculadora.java:3: error: ';' expected
System.out.println("Suma: " + 5 + 3)
                                  ^
1 error
```

Tres dades clau:

1. **"Calculadora.java:3"** → l'arxiu i la **línia** on està el problema (mira la `^`).
2. **"error: ';' expected"** → el *què*: esperava un punt i coma.
3. **El "^"** → el punt exacte on s'ha atascat.

💡 **Consell:** l'error sol trobar-se en la línia marcada, però de vegades és l'**anterior**: si falta un `{` o un `;`, javac de vegades se n'adona una línia més tard. Comença mirant la línia del `^` i, si no, puja una.

---

## 🚨 Errors típics de l'aprenent (i el seu remei)

| Error | Missatge típic | Remei |
| --- | --- | --- |
| **Public en lloc de public** | `class, interface, or enum expected` | Els noms i paraules clau en Java són exactes: `public`, `class`, `String`, `System`. |
| **Falta ;** | `';' expected` | Tota instrucció o orde en Java ha d'acabar obligatòriament en `;`. |
| **Falta { o }** | `reached end of file while parsing` o `class, interface...` | Comprova que cada clau d'obertura `{` tinga la seua corresponent clau de tancament `}`. |
| **string en lloc de String** | `cannot find symbol` | `String` és una classe i sempre s'escriu amb la S inicial majúscula. |
| **Nom de classe diferent de l'arxiu** | `class X is public, should be declared in a file named X.java` | La classe public ha de tindre exactament el mateix nom que l'arxiu `.java` (respectant majúscules i minúscules). |
| **system en lloc de System** | `cannot find symbol: variable system` | `System` va amb S majúscula, mentre que `out` i `println` van en minúscules. |

🧠 **Truc de memòria:** els noms de les *classes* (`String`, `System`, `Scanner`...) comencen en majúscula; els noms de *variables i mètodes* (`out`, `println`, `main`) en minúscula. Quan dubtes, mira com ho va escriure Java.

---

## 🧩 EL LÍO: el codi remenat

El teu cap ha deixat este codi fet un desastre. Les línies estan barrejades. Eres capaç d'ordenar-les perquè siga un programa Java vàlid que imprimisca "La suma es: 8"?

```
System.out.println("La suma es: " + (a + b));

int a = 5;

public class CalculoLioso {

System.out.println("Calculando...");

public static void main(String[] args) {

int b = 3;
```

**Pista**: busca primer on comença la classe i el mètode `main`.

### 🔄 Solució

```java
public class CalculoLioso {
    public static void main(String[] args) {
        int a = 5;
        int b = 3;
        System.out.println("Calculando...");
        System.out.println("La suma es: " + (a + b));
    }
}
```

La classe és el contenidor, el main és la porta d'entrada, les instruccions van dins del main, en orde. Com una recepta: els ingredients es declaren abans d'usar-se.

---

## 🎯 Mini-comprovació

1. Què significa `Calculadora.java:3: error: ';' expected`?
2. Per què `Public` (amb P majúscula) dona error?
3. Quina diferència hi ha entre un error de compilació i un de lògica?

**🔄 Respostes**

1. Que en l'arxiu `Calculadora.java`, en la línia 3, `javac` esperava un `;` i no el va trobar (mira la `^`).
2. Perquè Java és sensible a les majúscules: la paraula reservada és `public`, en minúscula exacta.
3. El de compilació impedeix generar el `.class` (ho detecta `javac`). El de lògica compila i executa, però el resultat és incorrecte: ningú t'avisa, només el depurador (o el sentit comú).

---

## ✅ Resum en 3 frases

1. Compilar (`javac`) i executar (`java`) són moments distints amb errors distints.
2. El missatge d'error et diu **arxiu, línia i motiu**: aprén a llegir-lo en lloc de témer-lo.
3. Les fallades clàssiques (majúscules, `;`, `{}`, nom de la classe) es corregeixen amb un cop d'ull... una vegada saps què mirar.

---

## 🐛 Vocabulari ràpid

| Terme | Idea general |
| --- | --- |
| **Compilar** | Traduir el codi font (`.java`) a bytecode (`.class`) que entén la JVM. |
| **Error de compilació** | El compilador detecta una fallada de sintaxi i es nega a generar el bytecode. |
| **Error de runtime** | El programa compila bé, però falla o es bloqueja durant l'execució. |
| **Error de lògica** | El programa s'executa sense errors, però el resultat no és el que s'esperava. |
| **Sensible a majúscules** | Java distingeix majúscules de minúscules (Case-sensitive): "Public" no és el mateix que "public". |
