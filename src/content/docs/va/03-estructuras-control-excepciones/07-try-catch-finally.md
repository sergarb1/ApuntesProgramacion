---
title: 07 — try, catch i finally
description: "L'airbag del codi: que un error no destrosse el teu programa 🛡️"
---

<p><small>L'airbag del codi: que un error no destrosse el teu programa 🛡️</small></p>

> 🗺️ **Estàs en:** 🔀 **U03 · Estructures de Control i Excepcions** → 07 · try, catch i finally

---

## 📬 La idea en una frase

> **`try` protegix el codi perillós, `catch` atrapar l'excepció si apareix i `finally` s'executa sempre, ocorrega el que ocorrega.**

En el punt 6 vas vore que una `InputMismatchException` mata el teu programa. Ara toca blindar-lo: el `try`/`catch`/`finally` és l'airbag del codi.

---

## 🛡️ L'estructura completa

```java
try {
    // codi perillós
} catch (TipusDExcepcio e) {
    // què fer si apareix eixa excepció
} finally {
    // s'executa SEMPRE, amb o sense excepció
}
```

```java
import java.util.InputMismatchException;
import java.util.Scanner;

public class LectorBlindat {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        try {
            System.out.print("Quants anys tens? ");
            int edat = sc.nextInt();
            System.out.println("Vas nàixer fa " + edat + " anys.");
        } catch (InputMismatchException e) {
            System.out.println("Això no és un nombre. No em faces això.");
        }

        System.out.println("El programa seguix viu. 🎉");
        sc.close();
    }
}
```

Si escrius `hola`, ja no explota: el `catch` atrapar l'error, imprimix un missatge simpàtic i **el programa continua**.

> 💡 **Detall pràctic:** el `finally` és opcional i sol usar-se per a netejar recursos (tancar `Scanner`, fitxers...). S'executa **sempre**: si hi hagué excepció, si no n'hi hagué, i fins i tot si el `try` tenia un `return`.

---

## 🎯 Captura múltiple: diversos catch en fila

Pots capturar diversos tipus d'excepció, cada un amb el seu tractament. **L'ordre importa: primer les més específiques, després les generals.**

```java
try {
    int[] numeros = {1, 2};
    int indice = 5;
    int divisor = 0;
    System.out.println(numeros[indice] / divisor);
} catch (ArithmeticException e) {
    System.out.println("Divisió entre zero.");
} catch (ArrayIndexOutOfBoundsException e) {
    System.out.println("Índex fora de l'array.");
} catch (RuntimeException e) {
    System.out.println("Alguna cosa estranya va passar en temps d'execució.");
}
```

En Java 7+ existix una forma compacta per a diversos tipus amb el mateix tractament, separats per `|`:

```java
} catch (ArithmeticException | ArrayIndexOutOfBoundsException e) {
    System.out.println("Matemàtica o índex: vas fallar per ací.");
}
```

> ⚠️ **Advertència:** un `catch (Exception e)` al principi es menjaria les excepcions més específiques. Regla: del més concret al més general, com en els `else if`.

---

## 🧽 La variable e: el botí de l'error

L'`e` del `catch` és l'objecte excepció atrapat. Pots preguntar-li coses:

```java
catch (Exception e) {
    System.out.println("Missatge: " + e.getMessage());
    e.printStackTrace();   // imprimix el stack trace complet (per a depurar)
}
```

> ⚠️ **Advertència:** un `catch` **buit** (sense res a dins) és un pecat mortal: te tragues l'error i ni tan sols te n'adones que ha passat. Com un testimoni que no parla en un judici. Com a mínim, imprimix un missatge.

---

## 🏫 Exemple guiat: el menú a prova de bombes

Reunim `do-while`, `try` i `catch`: un menú que repetix fins a triar bé i que no explota si escrius porqueria:

```java
import java.util.InputMismatchException;
import java.util.Scanner;

public class MenuBlindat {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int opcio = 0;
        boolean valida = false;

        do {
            System.out.println("1. Jugar  2. Eixir");
            System.out.print("Tria: ");

            try {
                opcio = sc.nextInt();
                valida = (opcio == 1 || opcio == 2);
                if (!valida) {
                    System.out.println("Opció no vàlida, torna-ho a intentar.");
                }
            } catch (InputMismatchException e) {
                System.out.println("Això no és un nombre.");
                sc.next();   // descarta el text brossa del buffer
            }
        } while (!valida);

        System.out.println("Has triat l'opció " + opcio);
        sc.close();
    }
}
```

> 💡 **Detall pràctic:** fixa't en `sc.next()` dins del `catch`: sense ell, el text brossa seguiria al buffer del `Scanner` i el següent `nextInt()` tornaria a fallar. Atrapar l'excepció i **netejar el buffer** són dos passos del mateix ball.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** la pregunta clau davant d'un `try` és: *què pot fallar ací i com ho manege?* Un `catch` que només existix "per si de cas" però no fa res és fum.

**Exercici: el detectiu de l'ordre**

Este codi té un problema d'ordre en els `catch`. Sense executar, explica què ocorre:

```java
try {
    int[] numeros = {10, 20};
    System.out.println(numeros[3]);
} catch (Exception e) {
    System.out.println("Atrapat per Exception.");
} catch (ArrayIndexOutOfBoundsException e) {
    System.out.println("Atrapat per ArrayIndexOutOfBoundsException.");
}
```

<details>
<summary>🔄 Solució</summary>

**No compila.** Java es queixa en el segon `catch`: com que `ArrayIndexOutOfBoundsException` és una subclasse d'`Exception`, el primer `catch` ja l'atraparia tot, i Java no permet un catch "inalcançable". Els `catch` han d'anar **del més específic al més general**: primer `ArrayIndexOutOfBoundsException`, després `Exception`.

</details>

---

## 🎯 Mini-chequeig

1. Què fa el bloc `finally` i quan s'executa?
2. En quin ordre han d'anar els `catch`?
3. Quin perill té un `catch` buit?
4. Per què convé cridar `sc.next()` després d'una `InputMismatchException`?

<details>
<summary>🔄 Respostes</summary>

1. S'executa **sempre**, hi haja o no excepció; servix per a netejar recursos.
2. **Del més específic al més general**; si no, el general "se menja" els altres i no compila.
3. Te tragues l'error sense assabentar-te'n: el programa continua, però amb una fallada oculta. Mínim: imprimix un missatge.
4. Perquè el text brossa es queda al buffer del `Scanner` i el següent `nextInt()` tornaria a fallar.

</details>

---

## ✅ Resum en 3 frases

1. `try` protegix el codi perillós i `catch` atrapar l'excepció perquè el programa **no muera**.
2. Els `catch` van **del més específic al més general**, i mai no deixes un `catch` buit.
3. `finally` s'executa sempre, ideal per a tancar `Scanner`, fitxers i altres recursos.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `try` | Bloc amb codi que pot llançar excepcions |
> | `catch` | Bloc que atrapar una excepció i la maneja |
> | `finally` | Bloc que s'executa sempre |
> | Captura múltiple | Diversos `catch` seguits, de l'específic al general |
> | `e.getMessage()` | Missatge de l'error atrapat |
> | Stack trace | Rastre de crides on va ocórrer el fallo |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/03-estructuras-control-excepciones) · **Anterior:** [06 · Excepcions bàsiques](/ApuntesProgramacion/va/03-estructuras-control-excepciones/06-excepciones-basicas) · **Següent:** [08 · throw i excepcions pròpies](/ApuntesProgramacion/va/03-estructuras-control-excepciones/08-throw-excepciones-propias)
