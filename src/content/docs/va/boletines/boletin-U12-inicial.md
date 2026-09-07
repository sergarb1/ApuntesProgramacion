---
title: "Butlletí U12 — Inicial"
description: "Exercicis bàsics de Programació Funcional: lambdes, Predicate, map i filter sobre streams"
---

# 📝 Butlletí U12 — Inicial

> Sense solucions. Sense presses. Obri l'IDE, escriu la teua primera `->` i fes que la cinta transportadora del stream deixe de semblar màgia. Les funcions viatgen soles, però el que programa ets tu. Comença suaument, que la fletxa no mossega.

---

## Exercici 1: Completa el codi — la teua primera lambda

Completa les lambdes perquè facen el que diu el comentari:

```java
Predicate<Integer> esMayorDeEdad = ______;      // edad >= 18
Function<Integer, Integer> doble = ______;      // x * 2
Consumer<String> imprimir = ______;             // System.out.println(s)
Supplier<String> saludar = ______;              // "¡Hola!"
```

Quin tipus necessita la variable perquè la lambda compile en cada cas?

---

## Exercici 2: Què imprimeix? — l'ordre de la fletxa

```java
import java.util.function.Function;

public class Test {
    public static void main(String[] args) {
        Function<Integer, Integer> operacion = x -> x * x + 1;
        System.out.println(operacion.apply(5));
        System.out.println(operacion.apply(0));
    }
}
```

Què imprimeix? Per què el cos `x * x + 1` no necessita `return` ni claus?

---

## Exercici 3: Troba l'error — la lambda mal vestida

```java
import java.util.function.Predicate;

public class Error {
    public static void main(String[] args) {
        Predicate<Integer> esPositivo = x -> x > 0;
        System.out.println(esPositivo.test(-3));
        System.out.println(esPositivo.accept(5));   // ¿Qué ocurre aquí?
    }
}
```

Este codi **no compila**. Per què? Quin mètode hauries de cridar en comptes d'`accept`?

---

## Exercici 4: Escriu este programa — filtrar parells amb streams

Crea un programa que tinga esta llista:

```java
List<Integer> numeros = List.of(10, 15, 22, 33, 40, 55);
```

Usa un stream per a **filtrar els parells**, arreplegar-los en una llista amb `toList()` i mostrar-la. Quants parells hi ha?

---

## Exercici 5: Què imprimeix? — el pipeline bàsic

```java
import java.util.*;
import java.util.stream.*;

public class Test {
    public static void main(String[] args) {
        List<String> palabras = List.of("sol", "luna", "mar", "cielo", "sol");
        long largas = palabras.stream()
            .filter(p -> p.length() >= 4)
            .distinct()
            .count();
        System.out.println(largas);
    }
}
```

Què imprimeix? Per què `distinct()` canvia el resultat davant de no usar-lo?

---

## Exercici 6: Completa el codi — majúscules amb map

Completa el pipeline perquè transforme cada paraula a majúscules i les arreplegue en una llista:

```java
List<String> palabras = List.of("hola", "java", "mundo");

List<String> mayusculas = palabras.stream()
    .______(String::toUpperCase)
    .______();
```

Quina operació intermèdia i quina terminal necessites? I si usares `Collectors.toList()` en comptes de `toList()`?

---

## Exercici 7: Escriu este programa — longitud de cada paraula

Crea un programa que tinga un array de noms i use un stream amb `map` per a calcular la **longitud de cada nom**, arreplegant-lo en una `List<Integer>`. Després mostra el resultat amb `forEach(System.out::println)`.

---

## Exercici 8: Troba l'error — la cinta que mai no arranca

```java
import java.util.*;
import java.util.stream.*;

public class Error {
    public static void main(String[] args) {
        List<Integer> numeros = List.of(1, 2, 3, 4, 5);
        Stream<Integer> flujo = numeros.stream()
            .filter(n -> n % 2 == 1)
            .map(n -> n * 10);
        System.out.println("Preparado");
    }
}
```

Este programa **compila i executa**, però no imprimeix cap número transformat. Per què? Què li falta al pipeline?

---

## Exercici 9: Completa el codi — un Consumer per a imprimir

Tens una llista de Strings i vols imprimir cada un entre parèntesis, per exemple `(hola)`. Completa el `forEach`:

```java
List<String> palabras = List.of("hola", "java");

palabras.stream()
    .forEach(p -> System.out.______("(" + p + ")"));
```

Quin mètode de `System.out` imprimeix sense salt de línia? I quin afig el salt?