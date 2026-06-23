---
title: "Butlletí 1 - Inicial Resolt: Introducció"
nav_order: 2
---
Ací tens les solucions del butlletí inicial. No les mires fins que ho hagues intentat pel teu compte. Vinga, dona't una oportunitat.

---

## Exercici 1: Què imprimeix este programa?

```java
public class MensajeSecreto {
    public static void main(String[] args) {
        System.out.println("Java mola");
        System.out.println("mucho");
        System.out.print("¿O no?");
    }
}
```

**Eixida:**
```
Java mola
mucho
¿O no?
```

> **💡 Explicació:** `println` imprimeix i salta a la línia següent. `print` imprimeix i es queda en la mateixa línia. Fixa't que "¿O no?" apareix just després de "mucho", sense espai ni salt. Els `println` anteriors sí que van afegir salts de línia després de cada text. La diferència entre `print` i `println` és com parlar amb algú: `println` solta la frase i espera resposta; `print` solta la frase i es queda mirant-te esperant que continues.

---

## Exercici 2: Troba els 3 errors

```java
Public class MiPrograma
    public static void main(String[] args) {
        System.out.println("Hola, mundo")
        System.out.prinltn("Esto es DAM")
    }
}
```

**Versió corregida:**

```java
public class MiPrograma {
    public static void main(String[] args) {
        System.out.println("Hola, mundo");
        System.out.println("Esto es DAM");
    }
}
```

**Errors:**
1. `Public` ha de ser `public` (minúscula). Java és sensible a majúscules, com el teu ex.
2. Falta `{` després de `MiPrograma`. La classe necessita les claus d'obertura.
3. Falten els `;` al final de cada `println`. En Java, el punt i coma és el punt final de cada frase. Sense ell, el compilador es queda esperant més.

A més, `prinltn` en lloc de `println` en la segona línia (error 4 si volem ser generosos). Ho vas veure? Ets un bon detectiu.

> **💡 Explicació:** Cada instrucció en Java acaba amb `;`. Sense ell, el compilador es confon i pensa que la línia continua. És com si parlares sense respirar. La classe necessita claus `{}` per a delimitar el seu cos. I els noms de les coses (com `public` o `println`) s'han d'escriure exactament igual que els va definir Java, amb les seues majúscules i minúscules exactes.

---

## Exercici 3: Completa el mètode

```java
public class Saludo {
    public static void main(String[] args) {
        System.out.println("Bienvenidos al curso DAM");
    }
}
```

> **💡 Explicació:** El mètode `main` és la porta d'entrada de qualsevol programa Java. Sense la línia `System.out.println(...)`, el programa s'executa però no diu res. És com un presentador que ix a l'escenari i es queda callat. Incòmode. `System.out.println()` és la veu del teu programa: tot allò que poses entre parèntesis (entre cometes dobles si és text) s'imprimirà per consola.

---

## Exercici 4: Escriu el teu primer programa

```java
public class Presentacion {
    public static void main(String[] args) {
        System.out.println("Me llamo Sergi");
        System.out.println("Tengo 30 años");
        System.out.println("Me gusta la programación");
    }
}
```

**Eixida:**
```
Me llamo Sergi
Tengo 30 años
Me gusta la programación
```

> **💡 Explicació:** Cada `println` imprimeix una línia. És com escriure en un quadern: un rengló per cada `println`. Pots posar qualsevol text entre les cometes dobles. El programa executa les línies en ordre, de dalt a baix, com quan lliges una recepta de cuina. No se salta cap, no inventa res. És un robot obedient i avorrit.

---

## Exercici 5: Què fa este programa?

```java
public class SumaRara {
    public static void main(String[] args) {
        System.out.println("Resultado: " + (3 + 4));
        System.out.println("Resultado: " + 3 + 4);
    }
}
```

**Eixida:**
```
Resultado: 7
Resultado: 34
```

> **💡 Explicació:** Has vist quina cosa més rara? El primer `println` suma `3 + 4` dins del parèntesi i dona `7`. El segon, al no tindre parèntesis, el `+` es converteix en concatenació de text. És a dir, `"Resultado: " + 3` dona `"Resultado: 3"`, i després `+ 4` dona `"Resultado: 34"`. Java, quan veu un `String` amb un `+`, diu "ah, estem ajuntant text" i converteix tot la resta a text també. Els parèntesis trenquen eixa lògica i forcen la suma matemàtica primer. És com si en una conversació digueren "tinc 3" i després "4" i algú entendra "tinc 34". Els parèntesis aclarixen: "¡NO, és una suma, 3+4=7!"

---

## Exercici 6: AceptaElReto.com — 116 ¡Hola mundo!

```java
public class Problema116 {
    public static void main(String[] args) {
        System.out.println("Hola mundo.");
    }
}
```

> **💡 Explicació:** El problema més fàcil d'AceptaElReto. Imprimeix exactament "Hola mundo." amb la H majúscula, tot junt, i amb el punt al final. No és "Hola Mundo", no és "hola mundo", no és "Hola mundo". És "Hola mundo.". Este problema existix perquè aprengues a usar la web: pujar codi, vore el veredicte, i sentir eixa primera vegada que veus "AC" (Accepted). Gaudix-la.

---

## Exercici 7: CodeWars — Multiply

```java
public class Multiply {
    public static double multiply(double a, double b) {
        return a * b;
    }
}
```

> **💡 Explicació:** CodeWars et dona l'estructura de la classe i el mètode; tu només has d'escriure `return a * b;`. És la primera kata per alguna cosa: és tan simple que fins la teua àvia podria fer-la (si la teua àvia sabera Java). Però té la seua gràcia: t'ensenya que en CodeWars els mètodes tenen una signatura exacta que has de respectar, i que `return` torna un valor. Si no poses `return`, el mètode torna `void` i fallen els tests. És com si et demanaren un café i els donares un got buit.
