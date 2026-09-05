---
title: Butlletí U01 — Inicial Resolt
description: Els mateixos exercicis que el butlletí inicial, amb solucions
---

# 📝 Butlletí U01 — Inicial (Resolt)

> Les solucions estan ocultes en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## Exercici 1: Desordena això

<details>
<summary>🔄 Solució</summary>

```java
public class Ordenado {
    public static void main(String[] args) {
        System.out.println("Mi primer programa ordenado");
    }
}
```

La classe obri i tanca amb `{}`, i dins viu el `main`. El `}` final tanca la classe.

</details>

---

## Exercici 2: Què imprimix?

<details>
<summary>🔄 Solució</summary>

```
Dijo: "Java mola" y siguió: 	programando.
```

`\"` imprimix la cometa literal, i `\t` deixa un tabulador abans de "programando". Com el primer `print` no salta de línia, l'eixida va tota seguida.

</details>

---

## Exercici 3: Caçador d'errors

<details>
<summary>🔄 Solució</summary>

Els 4 errors:

1. `Public` → **`public`** (minúscula).
2. `string[] args` → **`String[] args`** (la classe `String` amb majúscula).
3. `"Hola, "Mundo""` → les cometes niuades trenquen el text. Ha de ser `"Hola, \"Mundo\""` o `"Hola, Mundo"`.
4. `?` al final del segon `println` → falta tancar el text amb `"` i afegir `;`. A més, falta el `;` al final de la primera línia del `println`.

Versió corregida:

```java
public class ErrorFinder {
    public static void main(String[] args) {
        System.out.println("Hola, \"Mundo\"");
        System.out.println("Esto funciona?");
    }
}
```

</details>

---

## Exercici 4: La teua fitxa personal

<details>
<summary>🔄 Solució</summary>

```java
public class FichaPersonal {
    public static void main(String[] args) {
        System.out.println("Nom: Sergi");
        System.out.println("Edat: 30");
        System.out.println("Llenguatge favorit: Java");
        System.out.println("¿Emocionat?: true");
    }
}
```

El `true` va entre cometes perquè és part del text. Si l'hagueres escrit sense cometes, hauria sigut un booleà literal de veritat, però dins d'un `println` amb cometes és només text.

</details>

---

## Exercici 5: Completa el programa

<details>
<summary>🔄 Solució</summary>

Falta el `;` al final del `println` i la clau de tancament `}` de la classe:

```java
public class Completame {
    public static void main(String[] args) {
        System.out.println("Aprobado, esto funciona");
    }
}
```

</details>

---

## Exercici 6: Emparella conceptes

<details>
<summary>🔄 Solució</summary>

1→C, 2→A, 3→B, 4→D, 5→E

- `class` definix un nou tipus de dades (C).
- `main` és el punt d'entrada del programa (A).
- `System.out.println` imprimix text i salta de línia (B).
- `//` és el comentari d'una línia (D).
- `args` conté els arguments de línia de comandes (E).

</details>

---

## Exercici 7: CodeWars — Square(n) Sum

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static int squareSum(int[] n) {
        int total = 0;
        for (int i = 0; i < n.length; i++) {
            total += n[i] * n[i];
        }
        return total;
    }
}
```

Per a `[1, 2, 2]`: 1² + 2² + 2² = 1 + 4 + 4 = 9. Fixa't que usem un `for` i un array `n[]`, conceptes que veuràs amb profunditat en la U09.

</details>

---

## Exercici 8: El detectiu d'errors

<details>
<summary>🔄 Solució</summary>

Els 2 errors:

1. Falta el `;` al final de `System.out.println("Soy un detective")`.
2. Falta la clau de tancament `}` de la classe.

Versió corregida:

```java
public class Detective {
    public static void main(String[] args) {
        System.out.println("Soy un detective");
        System.out.println("y resuelvo errores");
    }
}
```

</details>

---

## Exercici 9: La teua biografia

<details>
<summary>🔄 Solució</summary>

```java
public class Biografia {
    public static void main(String[] args) {
        System.out.println("Nom: Sergi\nEdat: 30\nLlenguatge favorit: Java\nFrase: El codi ben escrit es comenta sol");
    }
}
```

El `\n` inserix un salt de línia dins del mateix text, així que una sola instrucció `println` mostra les quatre línies.

</details>