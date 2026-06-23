---
title: "Boletín 2 - Resuelto: Variables y Operadores"
nav_order: 6
---
De menos a más. De ⭐ a ⭐⭐⭐. De "esto es pan comido" a "esto ya no es un bocadillo".

---

## ⭐ Ejercicio 1: ¿Par o impar?

Pide un número al usuario y determina si es par o impar usando el operador `%`.

> **💡 Explicación:** `num % 2` te da el resto de dividir el número entre 2. Si es 0, es par. Si es 1, es impar. No hay misterio. Es la operación más usada en programación después de sumar. El `%` sale en todas partes: para saber si algo es par, para ciclos, para juegos, para relojes. Sin él, no habría videojuegos (bueno, sí, pero serían más difíciles de programar).

---

## ⭐ Ejercicio 2: Constante del mal

Declara `final double PRECIO_BASE = 100;` e `final double IVA = 0.21`. Calcula el precio final. Luego intenta modificar `IVA` después. ¿Qué error da?

> **💡 Explicación:** Al descomentar `IVA = 0.10`, el compilador dice: "No puedo asignar un valor a una variable final". `final` es como un contrato firmado: no puedes cambiar de opinión. Es útil para valores que no deben cambiar nunca: el IVA, el nombre de tu app, el número de intentos máximos. Si alguien intenta cambiarlos, el compilador se planta. Mejor que discutir con un programador que cambia el IVA a mitad de facturación.

---

## ⭐⭐ Ejercicio 3: Dado trucado

Genera 10 números aleatorios entre 1 y 6. Cuenta cuántos 6 han salido y muestra el resultado.

> **💡 Explicación:** `Math.random()` devuelve un número entre 0.0 y 0.999999... Multiplicas por 6, obtienes entre 0.0 y 5.999999. El `(int)` trunca los decimales y te da 0-5. Sumas 1 y obtienes 1-6. El bucle se repite 10 veces. Cada vez que sale un 6, incrementas el contador. Es como si lanzaras un dado físico 10 veces y anotaras cuántos 6 sacas. La probabilidad es baja (1/6 por tirada), así que lo normal es que salgan entre 1 y 2 seises. Si te salen 7, el dado está trucado (o tienes una suerte increíble).

---

## ⭐⭐ Ejercicio 4: Año bisiesto

Pide un año al usuario. Determina si es bisiesto: divisible entre 4 Y (no entre 100 O sí entre 400).

> **💡 Explicación:** La regla del año bisiesto es: divisible entre 4, pero si es divisible entre 100 NO es bisiesto, a menos que también sea divisible entre 400. 1900 no fue bisiesto (divisible entre 100 pero no entre 400). 2000 sí (divisible entre 400). 2024 sí (divisible entre 4 pero no entre 100). Los operadores lógicos `&&` (AND) y `||` (OR) combinados con `%` permiten expresar esta regla en una sola línea. Es como la lija fina de la programación: condiciones precisas para resultados exactos. Los paréntesis son importantes: sin ellos, la precedencia podría dar un resultado incorrecto.

---

## ⭐⭐ Ejercicio 5: Nombre al revés

Pide al usuario su nombre. Muestra: longitud, versión en mayúsculas, primera letra y última letra.

> **💡 Explicación:** `length()` devuelve cuántos caracteres tiene el String. `toUpperCase()` lo convierte a mayúsculas. `charAt(0)` devuelve el primer carácter (los Strings empiezan en 0, como los arrays). `charAt(nombre.length() - 1)` devuelve el último. Fíjate en que los métodos de String se llaman SOBRE el objeto, no son estáticos. El objeto es `nombre`, y le preguntas: "oye, tú, ¿cuánto mides?". `String` es una clase con muchos métodos útiles. Aprende a usarlos y te ahorrarás reinventar la rueda cada dos por tres.

---

## ⭐⭐⭐ Ejercicio 6: AceptaElReto 152 — Números de pares

Resuelve el problema **152 — Números de pares** (también conocido como "Va de modas...") en AceptaElReto.

Dada una lista de números, determina si la cantidad de pares es mayor que la de impares.

> **💡 Explicación:** El problema va leyendo casos hasta encontrar un 0 (que marca el final). Cada caso empieza con N (cuántos números vienen). Luego leemos N números. Por cada uno, miramos si es par o impar con `% 2` y contamos. Al final comparamos los contadores. Es una versión ampliada del ejercicio 1, pero con lectura de datos y múltiples casos. La gracia está en manejar correctamente la lectura cuando no sabes cuántos casos hay. `while (sc.hasNextInt())` y `break` cuando ves un 0.

---

## ⭐⭐⭐ Ejercicio 7: El acertijo del ++

Sin ejecutar, determina el resultado de:

```java
int a = 2;
int b = a++ * 3 + --a;
System.out.println("a = " + a + ", b = " + b);
```

**Solución:**
```
a = 2, b = 7
```

**Paso a paso:**
1. `a = 2`
2. `a++` → POST: usa a (2), luego a = 3. La expresión `a++` vale **2**.
3. `--a` → PRE: a vale 3, decrementa a **2**, luego usa a (2). Vale **2**.
4. `b = 2 * 3 + 2` = 6 + 2 = 7
5. `a` quedó en 2 (subió a 3 con `a++`, bajó a 2 con `--a`)

> **💡 Explicación:** `a++` (post-incremento) primero USA el valor y luego incrementa. `--a` (pre-decremento) primero decrementa y luego USA. Por eso el valor final de `a` es 2 (subió y bajó como un yoyó). Y `b` es 7. Estos acertijos son el terror de los exámenes y la alegría de los profesores malvados. Mi consejo: en la vida real, no mezcles `++` y `--` en expresiones complicadas. Úsalos en líneas separadas. Tu yo del futuro te lo agradecerá.

---

## ⭐⭐⭐ Ejercicio 8: AceptaElReto 140 — Suma de dígitos

Resuelve el problema **140 — Suma de dígitos** en AceptaElReto.

Dado un número, suma sus dígitos. Luego suma los dígitos del resultado, y así hasta que quede un solo dígito. Muestra el proceso.

> **💡 Explicación:** Para extraer los dígitos de un número, usamos `n % 10` (obtenemos el último dígito) y `n / 10` (quitamos el último dígito). Repetimos hasta que n sea 0. Sumamos todos los dígitos. Si la suma tiene más de un dígito (>= 10), repetimos el proceso. Es como cuando doblas un papel una y otra vez hasta que no puedes más: el número se va reduciendo hasta un solo dígito. Ejemplo: 123 → 1+2+3 = 6. 987 → 9+8+7 = 24 → 2+4 = 6. Es la "raíz digital" de un número. Muy usado en numerología y en exámenes de programación.

---

## 📚 Referencias

| Plataforma | Problema | Dificultad |
|---|---|---|
| AceptaElReto | 149 — San Fermines | Fácil |
| AceptaElReto | 152 — Números de pares | Fácil |
| AceptaElReto | 140 — Suma de dígitos | Medio |
| CodeWars | Even or Odd (8 kyu) | Principiante |
| CodeWars | Opposite number (8 kyu) | Principiante |
