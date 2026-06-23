---
title: "🔢 Unidad 2: Variables, Tipos de Datos y Operadores"
nav_order: 2
---
🎯 **Objetivos de aprendizaje**
- Declarar y usar variables de tipos primitivos
- Comprender la diferencia entre tipos primitivos y String
- Utilizar operadores aritméticos, relacionales y lógicos
- Aplicar casting y conversiones entre tipos
- Generar números aleatorios con Math.random()

## Variables: Las Cajas Donde Viven Tus Datos

Imagina que la memoria de tu ordenador es un almacén gigante lleno de estanterías. Cada estantería tiene cajas. Las **variables** son esas cajas, y cada caja tiene una etiqueta para que sepas qué hay dentro.

### Las Cajas (Declaración de Variables)

Para crear una caja le dices a Java:

```java
tipo nombreDeLaCaja = valorQueMetoDentro;
```

Ejemplos reales:

```java
int edad = 25;              // Caja etiquetada "edad" con un 25 dentro
double precio = 19.99;      // Caja con decimales
String nombre = "María";    // Caja mágica que guarda texto
boolean hambre = true;      // Caja de verdadero/falso (ahora mismo: true)
```

> **💡 Consejo:**
>
> Las variables se llaman así porque... ¡varían! Puedes cambiar su contenido. `int edad = 25;` y luego `edad = 26;` al día de tu cumple. La etiqueta es la misma, el contenido cambia.

### Las Reglas de Nomenclatura (o cómo no meter la pata)

- Pueden tener letras, números, `_` y `$`. *No* espacios ni ñ'ş ni cosas raras.
- No pueden empezar con número. `1numero` es ilegal. `numero1` es legal. Así de tiquismiquis es Java.
- Mayúsculas importan: `edad`, `Edad` y `EDAD` son tres cajas distintas. Como si etiquetaras "Zapatos", "zapatos" y "ZAPATOS".
- No uses palabras reservadas: `int`, `class`, `if`, `while`... son de Java, no tuyas.
- Usa **camelCase**: `miVariableEjemplo`. Como un camello, con joroba en medio.

### Los 8 Primitivos: Cajas de Tamaños Distintos

Java tiene 8 tipos primitivos. Piensa en ellos como cajas de distintos tamaños en tu almacén:

| Tipo | Tamaño | Lo que cabe | Analogía |
|------|--------|-------------|----------|
| `byte` | 8 bits | -128 a 127 | Caja de cerillas |
| `short` | 16 bits | -32.768 a 32.767 | Caja de zapatos |
| `int` | 32 bits | -2.147M a 2.147M | Caja de mudanza (la que más usarás) |
| `long` | 64 bits | -9 cuatrillones a +9 cuatrillones | Contenedor de barco |
| `float` | 32 bits | Decimales de precisión simple | Vaso de agua |
| `double` | 64 bits | Decimales de precisión doble | Cubo de agua |
| `char` | 16 bits | Un solo carácter Unicode | Una letra en una caja de zapatos |
| `boolean` | 1 bit | `true` o `false` | Interruptor de luz |

```java
byte nivel = 100;
short poblacion = 30000;
int habitantes = 1500000;           // El más usado
long distancia = 384400000L;        // La L al final es obligatoria
float precio = 12.99f;              // La f al final es obligatoria
double pi = 3.14159265359;
char letra = 'A';                   // Comillas SIMPLES para char
boolean esJavaDivertido = true;     // Esto es opinable
```

> **📝 Nota:**
>
> Usa `int` para casi todo lo numérico entero. Solo usa `long` si vas a contar estrellas. Usa `double` para decimales a menos que ahorrar memoria sea tu fetiche.

### String: La Caja Mágica (No es primitivo, pero parece)

`String` no es primitivo, es una **clase**. Pero se comporta tan natural que parece primitivo. Es como un amigo que encaja tan bien en tu grupo que jurarías que es familia.

```java
String saludo = "Hola, DAM";
String nombre = new String("Ana");   // También se puede crear así
```

> **⚠️ Advertencia:**
>
> Los `String` son **inmutables**. Una vez creados, no se pueden cambiar. Cuando haces `texto = texto + " más"`, en realidad estás tirando el viejo y creando uno nuevo. Es como si cada vez que quisieras poner un cartel nuevo quemaras el anterior.

### Constantes: Cajas con Superglue

Las constantes se declaran con `final`. Una vez que metes algo ahí, no sales ni con palanca.

```java
final double IVA = 0.21;
final int MAXIMO_INTENTOS = 3;
final String NOMBRE_APP = "Gestión DAM";

IVA = 0.10;  // ERROR: ¡Has roto Java! (de compilación, no te preocupes)
```

Por convención, las constantes se escriben EN MAYÚSCULAS_CON_GUIONES_BAJOS. Como si estuvieran gritando "¡SOY INMUTABLE!".

### Casting: Aprieta que Cabe

Hay dos tipos de conversiones:

- **Implícita (Widening)**: De caja pequeña a grande. Java lo hace solo. `int → long → double`. Como cambiar de un piso a una mansión. No preguntas, simplemente te mudas.
- **Explícita (Narrowing)**: De grande a pequeña. Java te obliga a poner `(tipo)` delante. Como meter una maleta XXL en el maletero de un Smart: tienes que empujar `(tipo)` y rezar.

```java
// Implícita: ensanchando
int num = 100;
long numLong = num;           // Cabe, no problema
double numDouble = num;       // También

// Explícita: estrechando
double precio = 19.99;
int entero = (int) precio;    // Pierdes los .99 → sale 19
System.out.println(entero);   // 19 — los céntimos desaparecen en el olvido
```

### Math.random(): El Casino de Java

`Math.random()` devuelve un número aleatorio entre 0.0 y 1.0 (el 1.0 no está incluido, como cuando te toca la lotería pero no).

```java
double aleatorio = Math.random();                    // Entre 0.0 y 0.999999...
int dado = (int) (Math.random() * 10);              // Entre 0 y 9
int dadoReal = (int) (Math.random() * 6) + 1;       // Entre 1 y 6 (como un dado)
```

> **💡 Consejo:**
>
> Para un número entre `min` y `max`: `(int)(Math.random() * (max - min + 1)) + min`. Ejemplo del 5 al 10: `(int)(Math.random() * 6) + 5`.

> **⭐ BE THE CODE, MY FRIEND**
>
> > 🕶️ **Don Tip:** El casting explícito con `(tipo)` puede truncar valores. Siempre comprueba si el valor cabe antes de forzarlo.
>
> **Ejercicio 1: El Guardia de Almacén**
>
> Eres el guardia de un almacén de datos. Te dan estas instrucciones:
>
> ```java
> int a = 10;
> double b = a;
> int c = (int) b;
> byte d = (byte) c;
> System.out.println(d);
> ```
>
> **Sigue el proceso paso a paso:**
> 1. `int a = 10;` — Metes un 10 en una caja int.
> 2. `double b = a;` — Coges el 10 y lo metes en una caja double. Conversión implícita.
> 3. `int c = (int) b;` — Coges el 10.0 del double. Necesitas `(int)` porque pasar de double a int requiere apretar.
> 4. `byte d = (byte) c;` — Coges el 10 del int y lo metes en un byte. Cabe, pero fuerzas con `(byte)`.
> 5. Imprime: **10**.
>
> **Ahora prueba este:**
> ```java
> int grande = 300;
> byte pequeno = (byte) grande;
> System.out.println(pequeno);
> ```
>
> ¿Qué sale? (Pista: en un byte solo caben -128 a 127. Sobran 172. En binario, se truncan los bits sobrantes). Resultado: **44**. Es como intentar meter un elefante en un Mini Cooper y que salga un perro salchicha.

> **⭐ BE THE CODE, MY FRIEND**
>
> > 🕶️ **Don Tip:** `==` compara referencias (¿son el mismo objeto?), `.equals()` compara contenido (¿tienen el mismo texto?).
>
> **Ejercicio 2: ¿Qué Imprime Este Lío de Strings?**
>
> Sin ejecutar, di QUÉ imprime exactamente este código:
>
> ```java
> String a = "Hello";
> String b = "Hello";
> String c = new String("Hello");
> System.out.println(a == b);
> System.out.println(a == c);
> ```
>
> **Respuesta:** `true` y `false`. `a` y `b` apuntan al mismo objeto en el "pool de Strings" (Java reutiliza literales iguales). Pero `c` se creó con `new String(...)`, así que es un objeto nuevo. `==` compara referencias, no contenido. Para comparar contenido usa `.equals()`: `a.equals(c)` devolvería `true`. ¡Trampa típica de examen!

> **⭐ BE THE CODE, MY FRIEND**
>
> > 🕶️ **Don Tip:** Los operadores `++` pre y post tienen prioridades distintas. Pre: primero cambia, luego usa. Post: primero usa, luego cambia.
>
> **Ejercicio 3: Incremento Misterioso**
>
> ¿Qué imprime este código?
>
> ```java
> int a = 5;
> int b = a * 2 + ++a;
> System.out.println("a = " + a);
> System.out.println("b = " + b);
> ```
>
> **Respuesta:** `a = 6`, `b = 16`. `++a` se evalúa primero (unario), `a` pasa a 6. Luego `a * 2 + 6` → `5 * 2 + 6` → `16`.
>
> Si hubiera sido `a * 2 + a++`, sería distinto: `5 * 2 + 5 = 15` (primero usa a=5, luego incrementa a 6).

### Métodos Útiles de String (porque los necesitarás)

```java
String texto = "  Programación DAM  ";
texto.length();              // 18
texto.trim();                // "Programación DAM" (sin espacios)
texto.toUpperCase();         // "  PROGRAMACIÓN DAM  "
texto.toLowerCase();         // "  programación dam  "
texto.contains("DAM");       // true
texto.startsWith("  ");      // true
texto.endsWith("AM  ");      // true
texto.indexOf("DAM");        // 14 ¿dónde empieza "DAM"?
texto.substring(2, 13);      // "Programación"
texto.replace("DAM", "DAW"); // "  Programación DAW  "
```

## Operadores: El Gimnasio de los Datos

Las variables están muy bien, pero no sirven de nada si no haces cosas con ellas. Los **operadores** son las máquinas de pesas de tu gimnasio de datos: suman, restan, comparan y transforman.

### Operadores Aritméticos: El Día en el Gym

| Operador | Ejercicio | Ejemplo |
|----------|-----------|---------|
| `+` | Press de banca | `5 + 3 = 8` |
| `-` | Curl de bíceps | `5 - 3 = 2` |
| `*` | Sentadilla | `5 * 3 = 15` |
| `/` | Peso muerto | `10 / 3 = 3` (enteros) o `10.0 / 3 = 3.333...` |
| `%` | El odiado abdominal | `10 % 3 = 1` (el resto de 10/3) |

```java
int a = 10;
int b = 3;
double c = 10.0;

System.out.println(a / b);            // 3 (división entera)
System.out.println(a % b);            // 1 (el resto)
System.out.println(c / b);            // 3.333... (división real)
System.out.println((double) a / b);   // 3.333... (obligas decimal)
```

**División entera mata.** Si tienes `int alumnos = 17; int grupos = 5;` y haces `alumnos / grupos`, Java dice que cada grupo tiene **3** alumnos. Para Java, 17 dividido entre 5 son 3. Punto.

### Precedencia: ¿Quién Va Primero?

```java
int resultado = 2 + 3 * 4;        // 14 — la multiplicación se cuela
int conParentesis = (2 + 3) * 4;  // 20 — los paréntesis tienen pase VIP
```

**La ley del comedor:**
1. **Paréntesis `()`** — Pase VIP, van los primeros.
2. **Multiplicación, división y módulo `* / %`** — Los populares.
3. **Suma y resta `+ -`** — Los normales, los últimos.

### Operadores de Asignación Compuesta: El Atajo Perezoso

```java
int x = 10;
x += 5;   // x = 15  (x = x + 5, pero más cool)
x -= 3;   // x = 12
x *= 2;   // x = 24
x /= 4;   // x = 6
x %= 3;   // x = 0
```

Es como si en lugar de ir a la cocina a por un vaso de agua, tuvieras un grifo en el sofá.

### `++` y `--`: Flexiones para Variables

```java
int a = 5;
int b = a++;  // b = 5, a = 6 (POST: "usa y luego sube")
int c = ++a;  // a = 7, c = 7 (PRE: "sube y luego usa")
```

> **💡 Consejo:**
>
> **Regla de oro:** Si usas `++` o `--` *dentro* de una expresión complicada, estarás escribiendo código que ni tú entenderás en una semana. Úsalos solos, en su propia línea.

> **⭐ BE THE CODE, MY FRIEND**
>
> > 🕶️ **Don Tip:** Desglosa la expresión paso a paso. ¿Qué valor tiene `x` en cada momento?
>
> **Ejercicio 4: El Acróbata de las Variables**
>
> Sin ejecutar, calcula qué vale todo aquí:
>
> ```java
> int x = 3;
> int y = x++ + ++x;
> System.out.println("x = " + x + ", y = " + y);
> ```
>
> **Paso a paso:**
> 1. `x = 3`
> 2. `x++` — POST: usa x (3), luego incrementa x a 4. El valor de `x++` es **3**.
> 3. `++x` — PRE: x vale 4 ahora. Incrementa x a **5**, luego vale **5**.
> 4. `y = 3 + 5 = 8`
> 5. Resultado: `x = 5, y = 8`.
>
> A los programadores profesionales también les cuesta. Por eso casi nadie escribe código así en producción. Pero en los exámenes... ¡ay, aparece!

### Operadores Relacionales: El Juez de la Discusión

```java
int edad = 18;
boolean puedeVotar = edad >= 18;                    // true
boolean tieneDescuento = edad < 12 || edad > 65;    // false
boolean noEsEl = edad != 18;                        // false
```

### Operadores Lógicos: El Club Nocturno

- **`&&` (AND)**: ¿Tienes más de 18 Y tienes entrada? Las dos deben cumplirse.
- **`||` (OR)**: ¿Tienes más de 18 O eres el dueño? Basta una.
- **`!` (NOT)**: ¿NO tienes menos de 18?

```java
boolean mayorEdad = true;
boolean tieneEntrada = false;

boolean entra = mayorEdad && tieneEntrada;   // false
boolean entraVip = mayorEdad || tieneEntrada; // true

int x = 5;
boolean resultado = (x > 10) && (++x > 0);  // false, y x sigue siendo 5
```

**¡Cortocircuito!** Con `&&`, si lo primero es `false`, Java ni se molesta en mirar lo segundo. Con `||`, si lo primero es `true`, igual.

### El Operador Ternario: El Bouncer del Club

```java
String mensaje = (edad >= 18) ? "Pasa, joven" : "Vuelve cuando crezcas";

int nota = 7;
String resultado = nota >= 5 ? "Aprobado" : "Suspenso";
```

La estructura es: `condición ? valorSiTrue : valorSiFalse`.

### 🧩 EL LÍO

El corrector automático del instituto ha escupido este código lleno de errores. Identifica y corrige los 5 errores que tiene:

```java
public class LioVariables {
    public static void main(String[] args) {
        int a = 10.5;
        double b = "Hola";
        String c = true;
        int d = a + c;
        System.out.println("Resultado: " + d)
    }
}
```

Pista: cada variable debe tener el tipo correcto para su valor.

> 🕶️ **Don Tip:** Repasa los tipos primitivos: `int` solo admite enteros, `double` admite decimales, `String` va con comillas dobles.

## ¡No Hay Preguntas Tontas!

> **❓ ¡No Hay Preguntas Tontas!**
>
> **Q:** ¿Por qué `long` lleva L y `float` lleva f al final?
>
> **A:** Porque si pones `long x = 3000000000;` sin la L, Java piensa que es un `int` y se queja. El float necesita f porque por defecto los decimales son double.
>
> **Q:** ¿Qué pasa si divido un `int` entre otro `int` y espero decimales?
>
> **A:** Java te dará un entero. `5 / 2 = 2`, no 2.5. Para decimales, al menos uno debe ser double: `5 / 2.0 = 2.5` o `(double)5 / 2 = 2.5`.
>
> **Q:** ¿Cuál es la diferencia entre `=` y `==`? Siempre me lío.
>
> **A:** `=` es *asignar*: "coge este valor y mételo en esta caja". `==` es *comparar*: "¿son iguales?". Confundirlos es el error más clásico. Es como confundir "pon la mesa" con "¿está puesta la mesa?".
>
> **Q:** ¿Y el `%` para qué sirve en la vida real?
>
> **A:** Para saber si un número es par (`numero % 2 == 0`), para ciclos, para juegos. Sin él no tendrías horas en un reloj ni nada cíclico.
>
> **Q:** Precedencia, asociatividad... ¿tengo que memorizarlo todo?
>
> **A:** No. La regla de oro: *cuando tengas dudas, pon paréntesis*. `resultado = (a + b) * (c - d)` es mucho más legible. Los paréntesis no duelen.

## Más Ejemplos de Código

```java
public class CalculadoraBasica {
    public static void main(String[] args) {
        int a = 15;
        int b = 4;

        System.out.println("a + b = " + (a + b));
        System.out.println("a - b = " + (a - b));
        System.out.println("a * b = " + (a * b));
        System.out.println("a / b = " + (a / b) + " (división entera)");
        System.out.println("a / b real = " + ((double) a / b));
        System.out.println("a % b = " + (a % b) + " (resto)");
    }
}
```

```java
public class JuegoDeDados {
    public static void main(String[] args) {
        int dado1 = (int) (Math.random() * 6) + 1;
        int dado2 = (int) (Math.random() * 6) + 1;
        int suma = dado1 + dado2;

        System.out.println("Dado 1: " + dado1);
        System.out.println("Dado 2: " + dado2);
        System.out.println("Suma: " + suma);

        boolean esPar = suma % 2 == 0;
        String mensaje = esPar ? "Suma par — ganas" : "Suma impar — pierdes";
        System.out.println(mensaje);
    }
}
```

## Resumen (lo que importa de verdad)

- Las variables son cajas etiquetadas en la memoria.
- 8 tipos primitivos: byte < short < int < long < float < double < char < boolean.
- `final` es superglue: constante que no cambia.
- Casting implícito = meter caja pequeña en grande. Explícito = a la inversa con pérdidas.
- `String` no es primitivo, es una clase. Pero se comporta.
- `Math.random()` para jugar a la lotería.
- `+ - * / %` son los básicos. El % te da el resto.
- `++` y `--` son flexiones. Pre (primero sube) vs Post (primero usa).
- `&&` y `||` tienen cortocircuito: si la primera ya decide, no miran la segunda.
- El ternario `? :` es un if-else en una línea.
- La precedencia se soluciona con paréntesis. Siempre.

## Ejercicios Propuestos

1. **Cajas variadas** Declara una variable de cada tipo primitivo, asígnale un valor coherente e imprime el resultado.
2. **El casting asesino** Declara un `double` con valor 9.99. Conviértelo a `int` explícitamente. ¿Qué valor se pierde?
3. **Nombre al revés** Pide al usuario su nombre y muestra: longitud, mayúsculas, primera y última letra.
4. **Dado trucado** Genera 10 números aleatorios entre 1 y 6. Cuenta cuántos 6 han salido.
5. **Constante del mal** Declara `final double PRECIO_BASE = 100;` e `final double IVA = 0.21`. Calcula el precio final e intenta modificar IVA después.
6. **¿Cuánto mide?** Calcula el área de un círculo con `Math.PI`. Radio = 7.5.
7. **Adivina el número** La máquina elige un número al azar del 1 al 100. El usuario introduce un número y el programa dice si es mayor, menor o igual.
8. **El intercambio** Declara `int a = 5; int b = 10;`. Intercambia sus valores usando una tercera variable temporal.
9. **Área y perímetro** Calcula el área y el perímetro de un rectángulo con base 7.5 y altura 3.2.
10. **¿Par o impar?** Pide un número y determina si es par o impar usando `%`.
11. **Año bisiesto** Pide un año. Determina si es bisiesto: divisible entre 4 Y (no entre 100 O sí entre 400).
12. **Ternario en acción** Pregunta la edad al usuario. Usa el ternario para mostrar "Mayor de edad" o "Menor de edad".
13. **El acertijo del ++** Sin ejecutar, determina el resultado de: `int a = 2; int b = a++ * 3 + --a;`
14. **Cortocircuito** Declara `int x = 0;`. Haz `boolean test = (5 < 3) && (++x == 1);`. Imprime x. ¿Se incrementó?
15. **Conversión Celsius ↔ Fahrenheit** Pide grados Celsius. Convierte a Fahrenheit (`°F = °C × 9/5 + 32`).
16. **Los desbordados** Declara `int max = Integer.MAX_VALUE;` y súmale 1. ¿Qué pasa?

---

**RAs trabajados en esta unidad:**
- **RA2** - Escribe y prueba programas sencillos

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
