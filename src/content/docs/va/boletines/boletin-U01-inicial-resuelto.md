---
title: "Butlletí U01 — Inicial Resolt"
description: "Els mateixos exercicis que el butlletí inicial, amb solucions"
---

# 📝 Butlletí U01 — Inicial (Resolt)

> Les solucions estan ocultes. Intenta-ho de veritat abans de destapar-les. Compara el teu codi amb estes propostes de resolució i comparteix els teus dubtes o alternatives en el fòrum.

---

## Exercici 1: Desordena això (Solució)

<details>
<summary>🔄 Solució</summary>

**Codi ordenat i corregit:**

```java
public class Ordenado {
    public static void main(String[] args) {
        System.out.println("Mi primer programa ordenado");
    }
}
```

</details>

---

## Exercici 2: Què imprimeix? (Solució)

<details>
<summary>🔄 Solució</summary>

**Eixida exacta per pantalla:**

```
Dijo: "Java mola" y siguió: 	programando.
```

**Explicació**: `System.out.print` no afegeix salt de línia al final, per la qual cosa la segona instrucció s'imprimeix immediatament a continuació. La seqüència `\"` permet escriure la cometa doble sense tancar la cadena, i `\t` afegeix l'espaiat del tabulador.

</details>

---

## Exercici 3: Caçador d'errors (Solució)

<details>
<summary>🔄 Solució</summary>

**Errors trobats:**

1. `Public` va en minúscula (`public`).
2. `string` va amb la primera lletra en majúscula (`String`).
3. En `"Hola, "Mundo""` cal escapar les cometes internes (`"Hola, \"Mundo\""`)
4. En `"Esto funciona?)` falta la cometa doble de tancament (`"Esto funciona?"`).

**Codi corregit:**

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

## Exercici 4: La teua fitxa personal (Solució)

<details>
<summary>🔄 Solució</summary>

**Codi de resolució:**

```java
public class FichaPersonal {
    public static void main(String[] args) {
        System.out.println("Nombre: Sergi");
        System.out.println("Edad: 25");
        System.out.println("Lenguaje favorito: Java");
        System.out.println("¿Emocionado?: " + true);
    }
}
```

</details>

---

## Exercici 5: Completa el programa (Solució)

<details>
<summary>🔄 Solució</summary>

**Elements afegits:**

- El punt i coma `;` al final de la instrucció `System.out.println`.
- La clau de tancament `}` de la classe `Completame`.

**Codi corregit:**

```java
public class Completame {
    public static void main(String[] args) {
        System.out.println("Aprobado, esto funciona");
    }
}
```

</details>

---

## Exercici 6: Emparella conceptes (Solució)

<details>
<summary>🔄 Solució</summary>

**Resolució:** 1→C, 2→A, 3→B, 4→D, 5→E

</details>

---

## Exercici 7: El detectiu d'errors (Solució)

<details>
<summary>🔄 Solució</summary>

**Error trobat:** Falta el punt i coma `;` al final de la primera instrucció `System.out.println("Soy un detective")`.

**Codi corregit:**

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

## Exercici 8: La teua biografia (Solució)

<details>
<summary>🔄 Solució</summary>

**Codi de resolució (amb una sola instrucció i `\n`):**

```java
public class Biografia {
    public static void main(String[] args) {
        System.out.println("Nombre: Sergi\nEdad: 25\nLenguaje favorito: Java\nFrase: El código limpio habla por sí solo.");
    }
}
```

</details>
