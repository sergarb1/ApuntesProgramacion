---
title: "⚡ Unidad 3: Estructuras de Control y Excepciones"
nav_order: 3
---
🎯 **Objetivos de aprendizaje**
- Utilizar estructuras de selección: if/else if/else y switch
- Emplear bucles while, do-while y for
- Comprender el flujo con break y continue
- Manejar excepciones con try-catch-finally
- Lanzar excepciones propias con throw

## if, else y switch: El Arte de Decidir

Tu programa es como un robot torpe pero obediente. Sin estructuras de selección, haría TODO lo que le dices, en orden, siempre. Necesitamos que TOME DECISIONES.

### if: El Portero de la Discoteca

Imagina que `if` es un portero de discoteca. Evalúa tu cara (la condición) y decide si pasas o no.

```java
if (tieneEdad >= 18) {
    System.out.println("Puedes pasar, disfruta de la música!");
}
```

Si la condición es `true`, entras. Si es `false`, te quedas en la calle.

### if-else: El Portero con Plan B

A veces el portero tiene una alternativa: "No pasas, pero vete al bar de al lado".

```java
if (tieneEdad >= 18) {
    System.out.println("Adelante, el techno te espera");
} else {
    System.out.println("Lo siento, vuelve cuando crezcas");
}
```

### if-else if-else: El Bouncer con Múltiples Listas

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

> **⚠️ Advertencia:** **Error mortal**: poner `;` después de la condición. `if (edad >= 18);` ← el `;` vacío hace que el bloque de después se ejecute SIEMPRE.

### ⭐ BE THE CODE, MY FRIEND: El Detective de la Edad

> > 🕶️ **Don Tip:** Recorre las condiciones de arriba a abajo. La primera que sea `true` ejecuta su bloque y se salta el resto.
>
> **El Detective de la Edad**

¿Qué imprime esto?

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

> **Solución:** `edad >= 18` → false. `conPadres` → true. Imprime "Pasas con tus viejos". Esto se llama "seguimiento de código" y es tu superpoder.

### ❓ ¡No Hay Preguntas Tontas!

> **Q:** ¿Puedo tener un `if` sin llaves?
>
> **A:** Técnicamente sí, pero ejecutará SOLO la primera línea después del `if`. Siempre pon llaves. Siempre.
>
> **Q:** ¿Qué pasa si pongo `=` en lugar de `==`?
>
> **A:** En Java no compila porque `if (edad = 18)` devuelve un `int`, no un `boolean`. ¡El compilador te salva!
>
> **Q:** ¿El orden de los `else if` importa?
>
> **A:** ¡Y tanto! Java evalúa de arriba a abajo y se queda con el PRIMERO que cumple. Evalúa siempre de más específico a menos específico.
>
> **Q:** ¿Puedo poner cien `else if` seguidos?
>
> **A:** Puedes, pero si tienes más de 3-4 condiciones, plantéate usar `switch`.

### El Operador Ternario: El Ninja de una Sola Línea

```java
int edad = 20;
String mensaje = (edad >= 18) ? "Mayor de edad" : "Menor de edad";
```

> **💡 Consejo:** El ternario anidado es como las muñecas rusas: parece chulo hasta que tienes que depurarlo a las 3 de la mañana.

### switch: La Máquina Expendedora de Código

`if-else` es un portero. `switch` es una máquina expendedora: metes un número, obtienes tu producto.

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

> **⚠️ Advertencia:** Olvidar el `break` causa *fall-through*: el código "se cae" al siguiente `case`. El 99% de las veces es un error.

> **💡 Consejo:** Desde Java 14 puedes usar `switch` como expresión con flechitas `->`. No necesita `break`:
> ```java
> String tipo = switch (dia) {
>     case 1, 2, 3, 4, 5 -> "Laborable — a currar";
>     case 6, 7 -> "Festivo — a dormir";
>     default -> "No válido";
> };
> ```

### ⭐ BE THE CODE, MY FRIEND: Fall-Through

> > 🕶️ **Don Tip:** Sin `break`, el código 'se cae' al siguiente `case`. Síguelo sin saltar nada hasta que encuentres un `break`.
>
> **Fall-Through**

¿Qué imprime este código?

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

> **Solución:** Como no hay `break` en `case 2`, se ejecuta "Dos" y se cae a "Tres" (ahí el `break` frena). Nunca llega a `default`. Si `x = 1`, imprime "Uno", "Dos" y "Tres".

### 🧩 EL LÍO

El asistente de programación ha mezclado las líneas de este programa. Ordena las líneas para que el programa funcione correctamente y muestre si un número es positivo, negativo o cero:

```
} else if (numero < 0) {
public class Clasificador {
System.out.println("El número es positivo");
System.out.println("El número es cero");
int numero = -7;
System.out.println("El número es negativo");
if (numero > 0) {
} else {
public static void main(String[] args) {
}
```

Pista: no olvides las llaves de apertura y cierre de la clase y el main.

> 🕶️ **Don Tip:** Primero estructura la clase y el main, luego coloca el if-else if-else dentro del main.

---

## Bucles: Cómo Hacer Que el Ordenador Se Repita

Los humanos nos cansamos de repetir cosas. Los ordenadores, no. Los bucles son la forma de decirle "haz esto 500 veces" sin escribirlo 500 veces.

### while: El Bucle "¿Ya Llegamos?"

Imagina a un niño en un viaje en coche que pregunta "¿ya llegamos?" una y otra vez mientras la condición no se cumpla.

```java
int kmRecorridos = 0;

while (kmRecorridos < 100) {
    System.out.println("¿Ya llegamos? Llevamos " + kmRecorridos + " km");
    kmRecorridos++;
}
System.out.println("¡Por fin hemos llegado!");
```

> **📝 Nota:** `while` primero comprueba la condición. Si es `false` desde el principio, NO ejecuta el bloque ni una vez.

> **⚠️ Advertencia:** **Bucle infinito**: olvidar actualizar la variable de control es como tener al niño en el coche para siempre.
> ```java
> int i = 1;
> while (i <= 5) {
>     System.out.println("¡Atrapado en el tiempo!");
>     // Falta i++ → ESTO NUNCA TERMINA
> }
> ```

### do-while: "Al Menos Inténtalo"

Primero hace, luego pregunta. Garantiza que el bloque se ejecute al menos una vez.

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

> **💡 Consejo:** Usa `do-while` cuando necesites que algo pase al menos una vez: menús, confirmaciones, preguntas existenciales.

### for: "Lo Haré Exactamente N Veces"

El bucle `for` es el alemán de los bucles: disciplinado, sabe exactamente cuántas veces va a repetir.

```java
for (int i = 1; i <= 5; i++) {
    System.out.println("Vuelta " + i + " de 5");
}
```

El `for` mete tres cosas separadas por `;`:
1. **Inicialización**: `int i = 1` — "empieza aquí"
2. **Condición**: `i <= 5` — "sigue mientras sea cierto"
3. **Actualización**: `i++` — "cómo avanzas"

```java
// Recorrer un array
int[] numeros = {10, 20, 30, 40, 50};

for (int i = 0; i < numeros.length; i++) {
    System.out.println("Elemento " + i + ": " + numeros[i]);
}
```

> **⚠️ Advertencia:** Los arrays empiezan en 0. Si pones `i <= numeros.length`, explota con `ArrayIndexOutOfBoundsException`. Es el clásico *off-by-one error*.

### for-each: "Quiero Ver Todos los Caramelos"

```java
String[] nombres = {"Ana", "Luis", "Eva"};

for (String nombre : nombres) {
    System.out.println("Hola " + nombre + ", te he puesto en la lista");
}
```

> **📝 Nota:** El `for-each` es de SOLO LECTURA. No puedes modificar el array mientras lo recorres.

### ⭐ BE THE CODE, MY FRIEND: El Puzzle de los Bucles Anidados

> > 🕶️ **Don Tip:** El bucle externo controla las filas, el interno las columnas. ¿Cuántas iteraciones hace cada uno?
>
> **El Puzzle de los Bucles Anidados**

¿Qué imprime esto?

```java
for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= i; j++) {
        System.out.print("* ");
    }
    System.out.println();
}
```

> **Solución:**
> ```
> *
> * *
> * * *
> ```
> ¡Has dibujado un triángulo con bucles! Eres básicamente un artista digital.

### break y continue: El Mando a Distancia de los Bucles

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

### ❓ ¡No Hay Preguntas Tontas!

> **Q:** ¿Y si me olvido de poner `i++` en un `for`?
>
> **A:** Bucle infinito. En `for` es más difícil olvidarlo porque está en la tercera casilla, pero si lo borras... enhorabuena, has creado el primer bucle sin fin.
>
> **Q:** ¿Cuándo uso `while` y cuándo `for`?
>
> **A:** Si sabes cuántas veces (contar, recorrer array), usa `for`. Si dependes de una condición (seguir pidiendo hasta que el usuario se canse), usa `while`.
>
> **Q:** ¿El `for-each` es más lento?
>
> **A:** En arrays y colecciones como `ArrayList`, no. Y siempre es más LEGIBLE.

### Tabla de Supervivencia: ¿Qué Bucle Usar?

| Bucle | Cuándo usarlo |
|---|---|
| `for` | Sabes el número exacto de vueltas |
| `while` | No sabes cuántas, solo cuándo parar |
| `do-while` | Necesitas que pase al menos una vez |
| `for-each` | Quieres ver todos los elementos sin índices |

### 🥊 EL RING: if/else vs switch

Dos estructuras de control se enfrentan en el ring. ¿Quién gana?

**if/else:** «Yo soy el todoterreno. Puedo evaluar cualquier condición: rangos, combinaciones lógicas, objetos... ¡No tengo límites!»

**switch:** «Sí, pero para comparar un mismo valor contra muchas opciones, soy más rápido y más legible. Mírame: un solo `switch (dia)` y 7 `case`. Con tus `if` encadenados pareces una escalera de caracol.»

**if/else:** «¿Rápido? En rendimiento moderno da igual. Y además, ¿qué pasa con los rangos? Intenta hacer `case > 18:` en switch. No puedes.»

**switch:** «Para eso están los `if`. Cada uno a lo suyo. Yo para menús, días de la semana, estados de una máquina. Tú para decisiones complejas. ¿Por qué peleamos?»

**if/else:** «Tienes razón. Al final, nos necesitamos mutuamente.»

> 🕶️ **Don Tip:** Usa `switch` cuando compares una variable contra valores fijos concretos. Usa `if` cuando tengas rangos, condiciones booleanas compuestas o lógica más compleja.

---

## Excepciones: Cuando Tu Programa Tropieza

Los programas fallan. Es un hecho de la vida como la muerte, los impuestos y que el café se enfríe. Las excepciones son la forma que tiene Java de manejar los fallos con dignidad.

### ¿Qué es una Excepción?

Una excepción es un evento anómalo. Algo que no debería pasar, pero pasa.

```java
int resultado = 10 / 0;    // ArithmeticException
int[] array = {1, 2, 3};
int valor = array[5];      // ArrayIndexOutOfBoundsException
int num = sc.nextInt();    // InputMismatchException si escribes "hola"
```

> **📝 Nota:** El mensaje rojo gigante que escupe Java se llama *stack trace* y es la caja negra de tu avión: dice exactamente dónde y cómo se estrelló todo.

### La Jerarquía del Caos

Las excepciones se dividen en **checked** (el compilador te obliga a capturarlas, como `IOException`) y **unchecked** (`RuntimeException`, como `NullPointerException`). Los **Error** son cosas graves (`OutOfMemoryError`) — no intentes capturarlos. Es como tapar una presa con un chicle.

### try-catch: Caer con Red

```java
try {
    System.out.print("Dime un número: ");
    int numero = sc.nextInt();
    System.out.println("Tu número: " + numero);
} catch (InputMismatchException e) {
    System.out.println("¡Te dije un NÚMERO!");
}
```

Puedes tener varios `catch` para diferentes desastres:

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

> **💡 Consejo:** Pon los `catch` más específicos PRIMERO. Si pones `catch (Exception e)` al principio, los demás nunca se ejecutan.

### finally: "No Importa Qué, Lávate los Dientes"

El bloque `finally` se ejecuta SIEMPRE, haya o no excepción.

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

> **📝 Nota:** `finally` se ejecuta incluso si hay un `return` dentro de `try`. Desde Java 7, `try-with-resources` cierra automáticamente.

### throw: Lanzar Excepciones a Propósito

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

### ⭐ BE THE CODE, MY FRIEND: El Detector de Problemas

> > 🕶️ **Don Tip:** Cuando salta una excepción, el flujo salta directamente al `catch`. Lo que va después en el `try` no se ejecuta.
>
> **El Detector de Problemas**

¿Qué imprime este programa?

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

> **Solución:** 1 → 2 → `datos[2]` (índice 2 no existe en array de 2) → 5 → 6 → 7. La línea 4 nunca se imprime. Es como el primo que promete venir a la cena de Navidad.

### ❓ ¡No Hay Preguntas Tontas!

> **Q:** ¿Y si no pongo `try-catch`? ¿El programa explota?
>
> **A:** Sí. Java escupe un *stack trace* rojo. En aplicaciones de verdad es inaceptable. En tus ejercicios, pasa más de lo que crees.
>
> **Q:** ¿Cuándo creo mi propia excepción?
>
> **A:** Cuando la que necesitas no existe. Por ejemplo, `SaldoInsuficienteException`. Crea una clase que herede de `Exception` o `RuntimeException`.
>
> **Q:** ¿`finally` se ejecuta incluso si hay `System.exit()`?
>
> **A:** ¡No! Es el botón nuclear. Ni `finally` puede evitarlo.

### Excepciones Propias

```java
class SaldoInsuficienteException extends Exception {
    public SaldoInsuficienteException(String mensaje) { super(mensaje); }
}
```

Úsala con `throw` y `throws` como cualquier excepción checked.

---

## Ejercicios Propuestos

### Selección

1. **¿Eres mayor?** — Pide la edad al usuario y dile si puede votar, conducir o debería estar durmiendo la siesta.
2. **La calculadora de insultos** — Pide dos números y un operador con `switch`. Captura división por cero.
3. **El clasificador de notas sarcástico** — Pide una nota (0-100) y clasifícala con `if`.
4. **Días del mes** — Pide un mes (1-12) y muestra los días con `switch`.
5. **Par o impar con ternario** — Pide un número y usa el ternario en una línea.
6. **El validador ruinas** — Pide tres números y determina el mayor con `if` anidados.

### Bucles

1. **El contador vengativo** — `while` del 1 al 100. Que se queje cada 10 números.
2. **Sumatorio con trauma** — Pide números hasta 0. Suma y dile algo a los negativos.
3. **Factorial** — Calcula el factorial con `for`.
4. **Adivina el número** — El programa elige uno del 1 al 100. Usa `do-while`.
5. **El triángulo constructor** — Dibuja un triángulo de asteriscos con bucles anidados.
6. **Fibonacci** — Muestra los primeros N números de Fibonacci.

### Excepciones

1. **División segura** — Divide dos números. Captura `ArithmeticException` e `InputMismatchException`.
2. **El indexador imprudente** — Array de 5 enteros. Pide índice. Captura `ArrayIndexOutOfBoundsException`.
3. **Conversión kamikaze** — Convierte cadena a entero. Captura `NumberFormatException`.
4. **try-with-resources** — Lee un archivo que no existe. Captura `FileNotFoundException`.
5. **Excepción personalizada** — Crea `EdadInvalidaException`. Lánzala si edad < 0 o > 150.
6. **finally: la prueba definitiva** — Con `return` dentro de `try`, demuestra que `finally` se ejecuta antes.

## Resumen

| Concepto | Cuándo usarlo |
|----------|---------------|
| `if`/`else` | Decisiones con 2-3 caminos posibles |
| `switch` | Muchos caminos basados en un mismo valor |
| `while` | Repetir mientras se cumpla una condición (0+ veces) |
| `do-while` | Repetir al menos una vez, luego comprobar |
| `for` | Repetir un número conocido de veces |
| `try`/`catch` | Capturar y manejar errores sin romper el programa |
| `finally` | Código que se ejecuta siempre, haya o no error |

**Buenas prácticas:**
- Prefiere `switch` sobre múltiples `if`-`else` encadenados
- Los bucles `for` son más legibles que `while` cuando sabes el número de iteraciones
- Captura excepciones específicas, no `Exception` genérica
- Usa `try-with-resources` para recursos que hay que cerrar
- No uses excepciones para control de flujo normal

---

**RAs trabajados en esta unidad:**
- **RA3** - Estructuras de control

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
