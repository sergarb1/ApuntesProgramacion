---
title: "Butlletí 3 - Inicial: Estructures de Control"
nav_order: 7
---
Sense solucions. Respira. Els bucles no mosseguen. Les excepcions tampoc. L'únic perill eres tu sense dormir.

---

## Exercici 1: Què imprimeix este if?

Sense executar, escriu l'eixida exacta:

```java
public class Clasificador {
    public static void main(String[] args) {
        int nota = 65;

        if (nota >= 90) {
            System.out.println("Sobresaliente");
        } else if (nota >= 70) {
            System.out.println("Notable");
        } else if (nota >= 50) {
            System.out.println("Aprobado");
        } else {
            System.out.println("Suspenso");
        }
    }
}
```

---

## Exercici 2: Troba l'error en el for

El següent bucle hauria de comptar de l'1 al 5, però no funciona. Per què? Corregeix-lo.

```java
public class ForError {
    public static void main(String[] args) {
        for (int i = 1; i <= 10; i--) {
            System.out.println("Cuenta: " + i);
        }
    }
}
```

Pista: mira la condició i l'actualització. Una de les dos no quadra.

---

## Exercici 3: Completa el programa (do-while)

Falta la condició del `do-while`. Completa-la perquè el programa demane nombres fins que l'usuari introduïsca un nombre negatiu.

```java
import java.util.Scanner;

public class DoWhile {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int numero;

        do {
            System.out.print("Introduce un número (negativo para salir): ");
            numero = sc.nextInt();
            System.out.println("Has escrito: " + numero);
        } while (/* tu condición aquí */);

        System.out.println("¡Hasta luego!");
        sc.close();
    }
}
```

---

## Exercici 4: Compte arrere

Escriu un programa que mostre un compte arrere des de 10 fins a 0 usant un `for`. Després del 0, ha d'imprimir "¡Enlairament!".

Eixida esperada:
```
10
9
8
...
1
0
¡Despegue!
```

---

## Exercici 5: Menú amb switch

Escriu un programa que mostre un menú de begudes i demane a l'usuari que trie una opció (1-4). Usa `switch` per a mostrar el nom de la beguda seleccionada.

```
=== BAR JAVA ===
1. Café solo
2. Café con leche
3. Té
4. Refresco
Elige una opción:
```

Si l'usuari tria 2, ha de mostrar "Has elegido Café con leche". Si tria un nombre invàlid, mostra "Opción no válida".

---

## Exercici 6: Taula de multiplicar del 7

Escriu un programa que mostre la taula de multiplicar del 7 usant un `for`. Ha d'imprimir:

```
7 x 1 = 7
7 x 2 = 14
...
7 x 10 = 70
```

---

## Exercici 7: CodeWars — Grasshopper - Grade book

Resol la kata **"Grasshopper - Grade book"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/55cbd4ba903825f7970000f5).

Reps tres notes (0-100). Torna la lletra corresponent segons la mitjana:

| Mitjana | Nota |
|---|---|
| >= 90 | 'A' |
| >= 80 | 'B' |
| >= 70 | 'C' |
| >= 60 | 'D' |
| < 60 | 'F' |
