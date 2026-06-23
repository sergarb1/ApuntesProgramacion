---
title: "Unidad 3: Estructuras de Control y Excepciones"
nav_order: 3
---
🎯 **Objectius d'aprenentatge**
- Utilitzar estructures de selecció: if/else if/else i switch
- Emprar bucles while, do-while i for
- Comprendre el flux amb break i continue
- Gestionar excepcions amb try-catch-finally
- Llançar excepcions pròpies amb throw

## if, else i switch: L'Art de Decidir

El teu programa és com un robot maldestre però obedient. Sense estructures de selecció, faria TOT el que li dius, en ordre, sempre. Necessitem que PRENGA DECISIONS.

### if: El Porter de la Discoteca

Imagina que `if` és un porter de discoteca. Avalua la teua cara (la condició) i decidix si passes o no.

```java
if (tieneEdad >= 18) {
    System.out.println("Puedes pasar, disfruta de la música!");
}
```

Si la condició és `true`, entres. Si és `false`, et quedes al carrer.

### if-else: El Porter amb Pla B

A voltes el porter té una alternativa: "No passes, però ves al bar del costat".

```java
if (tieneEdad >= 18) {
    System.out.println("Adelante, el techno te espera");
} else {
    System.out.println("Lo siento, vuelve cuando crezcas");
}
```

### if-else if-else: El Bouncer amb Múltiples Llistes

```java
int nota = 85;

if (nota >= 90) {
    System.out.println("Sobresaliente — eres el orgullo de la familia");
} else if (nota >= 70) {
    System.out.println("Notable — no está mal");
} else if (nota >= 50) {
    System.out.println("Aprobado — por los pelos");
} else {
    System.out.println("Suspenso — tus padres quieren hablar contigo");
}
```

> **⚠️ Advertència:** **Error mortal**: posar `;` després de la condició. `if (edad >= 18);` ← el `;` buit fa que el bloc de després s'execute SEMPRE.

### ⭐ BE THE CODE, MY FRIEND: El Detectiu de l'Edat

> > 🕶️ **Don Tip:** Recorre les condicions de dalt a baix. La primera que siga `true` executa el seu bloc i es salta la resta.
>
> **El Detectiu de l'Edat**

Què imprimix açò?

```java
int edad = 17;
boolean conPadres = true;

if (edad >= 18) {
    System.out.println("Entrada libre");
} else if (conPadres) {
    System.out.println("Pasas con tus viejos");
} else {
    System.out.println("A casa, campeón");
}
```

> **Solució:** `edad >= 18` → false. `conPadres` → true. Imprimix "Pasas con tus viejos". Açò es diu "seguiment de codi" i és el teu superpoder.

### ❓ No Hi Ha Preguntes Tontes!

> **P:** Puc tindre un `if` sense claus?
>
> **R:** Tècnicament sí, però executarà NOMÉS la primera línia després del `if`. Sempre posa claus. Sempre.
>
> **P:** Què passa si pose `=` en lloc de `==`?
>
> **R:** En Java no compila perquè `if (edad = 18)` retorna un `int`, no un `boolean`. El compilador et salva!
>
> **P:** L'ordre dels `else if` importa?
>
> **R:** I tant! Java avalua de dalt a baix i es queda amb el PRIMER que complix. Avalua sempre de més específic a menys específic.
>
> **P:** Puc posar cent `else if` seguits?
>
> **R:** Pots, però si tens més de 3-4 condicions, planteja't usar `switch`.

### L'Operador Ternari: El Ninja d'una Sola Línia

```java
int edad = 20;
String mensaje = (edad >= 18) ? "Mayor de edad" : "Menor de edad";
```

> **💡 Consell:** El ternari niuat és com les nines russes: pareix xulo fins que has de depurar-lo a les 3 de la matinada.

### switch: La Màquina Expenedora de Codi

`if-else` és un porter. `switch` és una màquina expenedora: fiques un número, obtens el teu producte.

```java
int dia = 3;
String nombreDia;

switch (dia) {
    case 1:
        nombreDia = "Lunes — la resaca del finde";
        break;
    case 2:
        nombreDia = "Martes — todavía duele";
        break;
    case 3:
        nombreDia = "Miércoles — mitad de semana!";
        break;
    case 4:
        nombreDia = "Jueves — ya casi";
        break;
    case 5:
        nombreDia = "Viernes — se acerca la gloria";
        break;
    case 6:
        nombreDia = "Sábado — libertad!";
        break;
    case 7:
        nombreDia = "Domingo — la depresión pre-lunes";
        break;
    default:
        nombreDia = "Eso no es un día, inventado";
}
```

> **⚠️ Advertència:** Oblidar el `break` causa *fall-through*: el codi "es cau" al següent `case`. El 99% de les voltes és un error.

> **💡 Consell:** Des de Java 14 pots usar `switch` com a expressió amb fletxetes `->`. No necessita `break`:
> ```java
> String tipo = switch (dia) {
>     case 1, 2, 3, 4, 5 -> "Laborable — a currar";
>     case 6, 7 -> "Festivo — a dormir";
>     default -> "No válido";
> };
> ```

### ⭐ BE THE CODE, MY FRIEND: Fall-Through

> > 🕶️ **Don Tip:** Sense `break`, el codi 'es cau' al següent `case`. Segueix-lo sense saltar res fins que trobes un `break`.
>
> **Fall-Through**

Què imprimix este codi?

```java
int x = 2;
switch (x) {
    case 1:
        System.out.println("Uno");
    case 2:
        System.out.println("Dos");
    case 3:
        System.out.println("Tres");
        break;
    default:
        System.out.println("Otro");
}
```

> **Solució:** Com no hi ha `break` en `case 2`, s'executa "Dos" i es cau a "Tres" (ahí el `break` frena). Mai arriba a `default`. Si `x = 1`, imprimix "Uno", "Dos" i "Tres".

### 🧩 EL LÍO

L'assistent de programació ha mesclat les línies d'este programa. Ordena les línies perquè el programa funcione correctament i mostre si un número és positiu, negatiu o zero:

```
} else if (numero < 0) {
public class Clasificador {
System.out.println("El número és positiu");
System.out.println("El número és zero");
int numero = -7;
System.out.println("El número és negatiu");
if (numero > 0) {
} else {
public static void main(String[] args) {
}
```

Pista: no oblides les claus d'obertura i tancament de la classe i el main.

> 🕶️ **Don Tip:** Primer estructura la classe i el main, després col·loca el if-else if-else dins del main.

---

## Bucles: Com Fer Que l'Ordinador Es Repetisca

Els humans ens cansem de repetir coses. Els ordinadors, no. Els bucles són la forma de dir-li "fes açò 500 voltes" sense escriure-ho 500 voltes.

### while: El Bucle "Ja Hem Arribat?"

Imagina un xiquet en un viatge en cotxe que pregunta "ja hem arribat?" una i altra volta mentre la condició no es complisca.

```java
int kmRecorridos = 0;

while (kmRecorridos < 100) {
    System.out.println("¿Ya llegamos? Llevamos " + kmRecorridos + " km");
    kmRecorridos++;
}
System.out.println("¡Por fin hemos llegado!");
```

> **📝 Nota:** `while` primer comprova la condició. Si és `false` des del principi, NO executa el bloc ni una volta.

> **⚠️ Advertència:** **Bucle infinit**: oblidar actualitzar la variable de control és com tindre el xiquet al cotxe per a sempre.
> ```java
> int i = 1;
> while (i <= 5) {
>     System.out.println("¡Atrapado en el tiempo!");
>     // Falta i++ → ESTO NUNCA TERMINA
> }
> ```

### do-while: "Almenys Intentat-ho"

Primer fa, després pregunta. Garantix que el bloc s'execute almenys una volta.

```java
int opcion;
do {
    System.out.println("=== MENÚ ===");
    System.out.println("1. Comer");
    System.out.println("2. Dormir");
    System.out.println("3. Programar");
    System.out.println("0. Salir");
    opcion = sc.nextInt();
} while (opcion != 0);
```

> **💡 Consell:** Usa `do-while` quan necessites que alguna cosa passe almenys una volta: menús, confirmacions, preguntes existencials.

### for: "Ho Faré Exactament N Voltes"

El bucle `for` és l'alemany dels bucles: disciplinat, sap exactament quantes voltes repetirà.

```java
for (int i = 1; i <= 5; i++) {
    System.out.println("Vuelta " + i + " de 5");
}
```

El `for` posa tres coses separades per `;`:
1. **Inicialització**: `int i = 1` — "comença ací"
2. **Condició**: `i <= 5` — "seguix mentre siga cert"
3. **Actualització**: `i++` — "com avances"

```java
// Recorrer un array
int[] numeros = {10, 20, 30, 40, 50};

for (int i = 0; i < numeros.length; i++) {
    System.out.println("Elemento " + i + ": " + numeros[i]);
}
```

> **⚠️ Advertència:** Els arrays comencen en 0. Si poses `i <= numeros.length`, explota amb `ArrayIndexOutOfBoundsException`. És el clàssic *off-by-one error*.

### for-each: "Vull Vore Tots els Caramels"

```java
String[] nombres = {"Ana", "Luis", "Eva"};

for (String nombre : nombres) {
    System.out.println("Hola " + nombre + ", te he puesto en la lista");
}
```

> **📝 Nota:** El `for-each` és de NOMÉS LECTURA. No pots modificar l'array mentre el recorres.

### ⭐ BE THE CODE, MY FRIEND: El Puzzle dels Bucles Niuats

> > 🕶️ **Don Tip:** El bucle extern controla les files, l'intern les columnes. Quantes iteracions fa cada u?
>
> **El Puzzle dels Bucles Niuats**

Què imprimix açò?

```java
for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= i; j++) {
        System.out.print("* ");
    }
    System.out.println();
}
```

> **Solució:**
> ```
> *
> * *
> * * *
> ```
> Has dibuixat un triangle amb bucles! Eres bàsicament un artista digital.

### break i continue: El Comandament a Distància dels Bucles

```java
// break: "En cuanto vea un 5, me piro"
for (int i = 1; i <= 10; i++) {
    if (i == 5) {
        break;  // ¡ZAS, fuera!
    }
    System.out.println(i);
}
// Salida: 1, 2, 3, 4

// continue: "Los pares no me molan, siguiente"
for (int i = 1; i <= 10; i++) {
    if (i % 2 == 0) {
        continue;  // "paso de este"
    }
    System.out.println(i);
}
// Salida: 1, 3, 5, 7, 9 (solo impares)
```

### ❓ No Hi Ha Preguntes Tontes!

> **P:** I si m'oblide de posar `i++` en un `for`?
>
> **R:** Bucle infinit. En `for` és més difícil oblidar-ho perquè està en la tercera casella, però si ho borres... enhorabona, has creat el primer bucle sense fi.
>
> **P:** Quan use `while` i quan `for`?
>
> **R:** Si saps quantes voltes (contar, recórrer array), usa `for`. Si depens d'una condició (seguir demanant fins que l'usuari es canse), usa `while`.
>
> **P:** El `for-each` és més lent?
>
> **R:** En arrays i col·leccions com `ArrayList`, no. I sempre és més LLEGIBLE.

### Taula de Supervivència: Quin Bucle Usar?

| Bucle | Quan usar-lo |
|---|---|
| `for` | Saps el nombre exacte de voltes |
| `while` | No saps quantes, només quan parar |
| `do-while` | Necessites que passe almenys una volta |
| `for-each` | Vols vore tots els elements sense índexs |

### 🥊 EL RING: if/else vs switch

Dos estructures de control s'enfronten al ring. Qui guanya?

**if/else:** «Jo soc el tot-terreny. Puc avaluar qualsevol condició: rangs, combinacions lògiques, objectes... No tinc límits!»

**switch:** «Sí, però per a comparar un mateix valor contra moltes opcions, soc més ràpid i més llegible. Mira'm: un sol `switch (dia)` i 7 `case`. Amb els teus `if` encadenats sembles una escala de caragol.»

**if/else:** «¿Ràpid? En rendiment modern és igual. I a més, què passa amb els rangs? Intenta fer `case > 18:` en switch. No pots.»

**switch:** «Per a això estan els `if`. Cada u a la seua. Jo per a menús, dies de la setmana, estats d'una màquina. Tu per a decisions complexes. Per què barallem?»

**if/else:** «Tens raó. Al final, ens necessitem mútuament.»

> 🕶️ **Don Tip:** Usa `switch` quan compares una variable contra valors fixos concrets. Usa `if` quan tingueres rangs, condicions booleanes compostes o lògica més complexa.

---

## Excepcions: Quan el Teu Programa Ensopega

Els programes fallen. És un fet de la vida com la mort, els impostos i que el café es refrede. Les excepcions són la forma que té Java de gestionar les fallades amb dignitat.

### Què és una Excepció?

Una excepció és un esdeveniment anòmal. Una cosa que no hauria de passar, però passa.

```java
int resultado = 10 / 0;    // ArithmeticException
int[] array = {1, 2, 3};
int valor = array[5];      // ArrayIndexOutOfBoundsException
int num = sc.nextInt();    // InputMismatchException si escribes "hola"
```

> **📝 Nota:** El missatge roig gegant que escup Java es diu *stack trace* i és la caixa negra del teu avió: diu exactament on i com es va estavellar tot.

### La Jerarquia del Caos

Les excepcions es dividixen en **checked** (el compilador t'obliga a capturar-les, com `IOException`) i **unchecked** (`RuntimeException`, com `NullPointerException`). Els **Error** són coses greus (`OutOfMemoryError`) — no intentes capturar-los. És com tapar una presa amb un xiclet.

### try-catch: Caure amb Xarxa

```java
try {
    System.out.print("Dime un número: ");
    int numero = sc.nextInt();
    System.out.println("Tu número: " + numero);
} catch (InputMismatchException e) {
    System.out.println("¡Te dije un NÚMERO!");
}
```

Pots tindre diversos `catch` per a diferents desastres:

```java
try {
    int[] numeros = new int[3];
    numeros[0] = 10;
    numeros[1] = 0;
    int division = numeros[0] / numeros[2];
    int valor = numeros[5];
} catch (ArithmeticException e) {
    System.out.println("Error matemático: " + e.getMessage());
} catch (ArrayIndexOutOfBoundsException e) {
    System.out.println("Te pasaste de índice: " + e.getMessage());
} catch (Exception e) {
    System.out.println("Algo raro pasó: " + e.getMessage());
}
```

> **💡 Consell:** Posat els `catch` més específics PRIMER. Si poses `catch (Exception e)` al principi, els altres mai s'executen.

### finally: "No Importa Què, Renta't les Dents"

El bloc `finally` s'executa SEMPRE, hi haja o no excepció.

```java
Scanner sc = null;
try {
    sc = new Scanner(System.in);
    int num = sc.nextInt();
} catch (InputMismatchException e) {
    System.out.println("Error de entrada");
} finally {
    System.out.println("Cerrando recursos... (como un adulto responsable)");
    if (sc != null) sc.close();
}
```

> **📝 Nota:** `finally` s'executa fins i tot si hi ha un `return` dins de `try`. Des de Java 7, `try-with-resources` tanca automàticament.

### throw: Llançar Excepcions a Propòsit

```java
public static void validarEdad(int edad) {
    if (edad < 0) {
        throw new IllegalArgumentException(
            "Edad negativa? Te has colado");
    }
    if (edad > 150) {
        throw new IllegalArgumentException(
            edad + " años? O eres inmortal o me tomas el pelo");
    }
    System.out.println("Edad válida: " + edad);
}
```

### ⭐ BE THE CODE, MY FRIEND: El Detector de Problemes

> > 🕶️ **Don Tip:** Quan salta una excepció, el flux salta directament al `catch`. El que va després en el `try` no s'executa.
>
> **El Detector de Problemes**

Què imprimix este programa?

```java
public class PruebaExcepciones {
    public static void main(String[] args) {
        try {
            System.out.println("1. Entrando en peligro");
            int[] datos = {10, 20};
            System.out.println("2. Array creado");
            System.out.println("3. " + datos[2]);
            System.out.println("4. Esto no se imprime");
        } catch (ArrayIndexOutOfBoundsException e) {
            System.out.println("5. ¡Capturado! Índice fuera de rango");
        } finally {
            System.out.println("6. FINALLY: Siempre");
        }
        System.out.println("7. El programa sigue como si nada");
    }
}
```

> **Solució:** 1 → 2 → `datos[2]` (índex 2 no existix en array de 2) → 5 → 6 → 7. La línia 4 mai s'imprimix. És com el cosí que promet vindre al sopar de Nadal.

### ❓ No Hi Ha Preguntes Tontes!

> **P:** I si no pose `try-catch`? El programa explota?
>
> **R:** Sí. Java escup un *stack trace* roig. En aplicacions de veritat és inacceptable. En els teus exercicis, passa més del que creus.
>
> **P:** Quan cree la meua pròpia excepció?
>
> **R:** Quan la que necessites no existix. Per exemple, `SaldoInsuficienteException`. Crea una classe que hereta de `Exception` o `RuntimeException`.
>
> **P:** `finally` s'executa fins i tot si hi ha `System.exit()`?
>
> **R:** No! És el botó nuclear. Ni `finally` pot evitar-ho.

### Excepcions Pròpies

```java
class SaldoInsuficienteException extends Exception {
    public SaldoInsuficienteException(String mensaje) { super(mensaje); }
}
```

Usa-la amb `throw` i `throws` com qualsevol excepció checked.

---

## Exercicis Proposats

### Selecció

1. **Eres major?** — Demana l'edat a l'usuari i digues-li si pot votar, conduir o hauria d'estar dormint la migdiada.
2. **La calculadora d'insults** — Demana dos números i un operador amb `switch`. Captura divisió per zero.
3. **El classificador de notes sarcàstic** — Demana una nota (0-100) i classifícala amb `if`.
4. **Dies del mes** — Demana un mes (1-12) i mostra els dies amb `switch`.
5. **Parell o impar amb ternari** — Demana un número i usa el ternari en una línia.
6. **El validador ruïnes** — Demana tres números i determina el major amb `if` niuats.

### Bucles

1. **El comptador venjatiu** — `while` de l'1 al 100. Que es queixe cada 10 números.
2. **Sumatori amb trauma** — Demana números fins a 0. Suma i digues alguna cosa als negatius.
3. **Factorial** — Calcula el factorial amb `for`.
4. **Endevina el número** — El programa tria un de l'1 al 100. Usa `do-while`.
5. **El triangle constructor** — Dibuixa un triangle d'asteriscos amb bucles niuats.
6. **Fibonacci** — Mostra els primers N números de Fibonacci.

### Excepcions

1. **Divisió segura** — Dividix dos números. Captura `ArithmeticException` i `InputMismatchException`.
2. **L'indexador imprudent** — Array de 5 enters. Demana índex. Captura `ArrayIndexOutOfBoundsException`.
3. **Conversió kamikaze** — Convertix cadena a enter. Captura `NumberFormatException`.
4. **try-with-resources** — Llig un fitxer que no existix. Captura `FileNotFoundException`.
5. **Excepció personalitzada** — Crea `EdatInvalidaException`. Llança-la si edat < 0 o > 150.
6. **finally: la prova definitiva** — Amb `return` dins de `try`, demostra que `finally` s'executa abans.

## Resum

| Concepte | Quan usar-lo |
|----------|---------------|
| `if`/`else` | Decisions amb 2-3 camins possibles |
| `switch` | Molts camins basats en un mateix valor |
| `while` | Repetir mentre es complisca una condició (0+ voltes) |
| `do-while` | Repetir almenys una volta, després comprovar |
| `for` | Repetir un nombre conegut de voltes |
| `try`/`catch` | Capturar i gestionar errors sense trencar el programa |
| `finally` | Codi que s'executa sempre, hi haja o no error |

**Bones pràctiques:**
- Preferix `switch` sobre múltiples `if`-`else` encadenats
- Els bucles `for` són més llegibles que `while` quan saps el nombre d'iteracions
- Captura excepcions específiques, no `Exception` genèrica
- Usa `try-with-resources` per a recursos que cal tancar
- No uses excepcions per a control de flux normal

---

**RAs treballats en esta unitat:**
- **RA3** - Estructures de control

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
