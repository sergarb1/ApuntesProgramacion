---
title: "Butlletí U12 — Inicial Resolt"
description: "Els mateixos exercicis que el butlletí inicial, amb solucions"
---

# 📝 Butlletí U12 — Inicial (Resolt)

> Les solucions estan amagades en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## Exercici 1: Completa el codi — la teua primera lambda

<details>
<summary>🔄 Solució</summary>

```java
Predicate<Integer> esMayorDeEdad = edad -> edad >= 18;
Function<Integer, Integer> doble = x -> x * 2;
Consumer<String> imprimir = s -> System.out.println(s);
Supplier<String> saludar = () -> "¡Hola!";
```

La variable ha de ser de tipus **interfície funcional**: la lambda només compila si la seua firma encaixa amb el mètode abstracte de la interfície. `Predicate` espera `boolean test(Integer)`, `Function` espera `R apply(T)`, `Consumer` espera `void accept(T)` i `Supplier` espera `T get()`. Fixa't en el `Supplier`: sense paràmetres, els parèntesis buits `()` són obligatoris.

</details>

---

## Exercici 2: Què imprimeix? — l'ordre de la fletxa

<details>
<summary>🔄 Solució</summary>

Imprimeix:

```
26
1
```

- `operacion.apply(5)` → `5 * 5 + 1` = 26.
- `operacion.apply(0)` → `0 * 0 + 1` = 1.

El cos `x * x + 1` és una **sola expressió**: en les lambdes, un cos d'una expressió torna el seu resultat sense necessitat de `return` ni claus. Les claus i el `return` només calen quan el cos té diverses sentències.

</details>

---

## Exercici 3: Troba l'error — la lambda mal vestida

<details>
<summary>🔄 Solució</summary>

L'error està en la línia `esPositivo.accept(5)`: `Predicate` no té un mètode `accept`. El seu mètode abstracte és `test(T)`. `accept` pertany a `Consumer`. La línia correcta és:

```java
System.out.println(esPositivo.test(5));   // true
```

Cada interfície funcional té EL SEU mètode: `Predicate` usa `test`, `Function` usa `apply`, `Consumer` usa `accept` i `Supplier` usa `get`. Confondre'ls és com demanar una pizza a la peixateria: no és que la pizza no existisca, és que no està allà.

</details>

---

## Exercici 4: Escriu este programa — filtrar parells amb streams

<details>
<summary>🔄 Solució</summary>

```java
import java.util.*;
import java.util.stream.*;

public class Pares {
    public static void main(String[] args) {
        List<Integer> numeros = List.of(10, 15, 22, 33, 40, 55);

        List<Integer> pares = numeros.stream()
            .filter(n -> n % 2 == 0)
            .toList();

        System.out.println(pares);   // [10, 22, 40]
    }
}
```

El `filter` amb `n -> n % 2 == 0` (un `Predicate<Integer>`) deixa passar només els parells: 10, 22 i 40. `toList()` arreplega el resultat. Hi ha 3 parells. Fixa't que la llista original no es toca: el stream crea una llista nova.

</details>

---

## Exercici 5: Què imprimeix? — el pipeline bàsic

<details>
<summary>🔄 Solució</summary>

Imprimeix **`2`**.

- `filter(p -> p.length() >= 4)` deixa passar: `luna` (4) i `cielo` (5). Les dos `sol` tenen 3 lletres i `mar` també (3): es queden fora.
- `distinct()` no canvia res ací (ja no hi ha repetits entre els que passen).
- `count()` → 2.

Sense `distinct()`, el resultat seria el mateix en este cas (2), perquè `sol` ja va ser eliminada pel `filter`. `distinct()` hauria importat si el `filter` deixara passar dos iguals.

</details>

---

## Exercici 6: Completa el codi — majúscules amb map

<details>
<summary>🔄 Solució</summary>

```java
List<String> mayusculas = palabras.stream()
    .map(String::toUpperCase)
    .toList();
```

- La intermèdia és **`map`** amb la referència a mètode `String::toUpperCase` (equival a `p -> p.toUpperCase()`).
- La terminal és **`toList()`** (Java 16+).

Amb `Collectors.toList()` seria exactament igual però tornant un `ArrayList` modificable: `palabras.stream().map(String::toUpperCase).collect(Collectors.toList())`. `toList()` torna una llista immutable; per al resultat seria `["HOLA", "JAVA", "MUNDO"]`.

</details>

---

## Exercici 7: Escriu este programa — longitud de cada paraula

<details>
<summary>🔄 Solució</summary>

```java
import java.util.*;
import java.util.stream.*;

public class Longitudes {
    public static void main(String[] args) {
        String[] nombres = {"Ana", "Bob", "Carla", "David"};

        List<Integer> longitudes = Arrays.stream(nombres)
            .map(String::length)
            .collect(Collectors.toList());

        longitudes.forEach(System.out::println);   // 3, 3, 5, 5
    }
}
```

Dos trucs nous: `Arrays.stream(nombres)` convertix l'array (de la U04) en stream, i `map(String::length)` transforma cada `String` en la seua longitud, canviant el tipus del flux a `Stream<Integer>`. El `forEach` amb `System.out::println` és la terminal que imprimeix cada element.

</details>

---

## Exercici 8: Troba l'error — la cinta que mai no arranca

<details>
<summary>🔄 Solució</summary>

El pipeline no té **operació terminal**: `filter` i `map` són intermèdies (peresoses) i no executen res fins que arriba un `collect`, `count`, `forEach` o similar. El stream es prepara, però la cinta mai no arranca.

Per a veure els números transformats cal tancar l'aixeta. Per exemple:

```java
List<Integer> imparesDoblados = numeros.stream()
    .filter(n -> n % 2 == 1)
    .map(n -> n * 10)
    .toList();
System.out.println(imparesDoblados);   // [10, 30, 50]
```

És l'error més típic de la unitat: muntar la ruta i oblidar que l'autobús necessita arrancar.

</details>

---

## Exercici 9: Completa el codi — un Consumer per a imprimir

<details>
<summary>🔄 Solució</summary>

```java
palabras.stream()
    .forEach(p -> System.out.print("(" + p + ")"));
```

- `System.out.print(...)` imprimeix **sense salt de línia**: l'eixida seria `(hola)(java)`.
- `System.out.println(...)` afig el salt de línia al final: `(hola)` i `(java)` en línies separades.

El `forEach` rep un `Consumer<String>`; la lambda `p -> System.out.print("(" + p + ")")` es pot reescriure amb una referència a mètode, encara que ací el cos ja no és una única crida, així que la lambda és l'opció natural.

</details>