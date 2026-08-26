---
title: 03 — Operadores aritméticos
description: Las máquinas de pesas del gimnasio de datos ➕
---

<p><small>Las máquinas de pesas del gimnasio de datos ➕</small></p>

> 🗺️ **Estás en:** 🔤 **U02 · Variables, Tipos y Operadores** → 03 · Operadores aritméticos

---

## 📬 La idea en una frase

> **Los operadores aritméticos (`+`, `-`, `*`, `/`, `%`) son las máquinas de pesas del gimnasio de datos: transforman tus variables, y la división entera y la precedencia son las trampas que separan a los que saben de los que improvisan.**

Tener variables está muy bien, pero no sirven de nada si no haces cosas con ellas. Bienvenido al gimnasio: vas a sudar con los cinco ejercicios básicos y a descubrir por qué `10 / 3` no es lo que tú crees.

---

## 💪 El día en el gimnasio: los 5 ejercicios básicos

| Operador | Ejercicio | Ejemplo |
|---|---|---|
| `+` | Press de banca | `5 + 3 = 8` |
| `-` | Curl de bíceps | `5 - 3 = 2` |
| `*` | Sentadilla | `5 * 3 = 15` |
| `/` | Peso muerto | `10 / 3 = 3` (enteros) o `10.0 / 3 = 3.333...` |
| `%` | El odiado abdominal | `10 % 3 = 1` (el resto de 10/3) |

```java
int a = 10;
int b = 3;
double c = 10.0;

System.out.println(a / b);            // 3  (división entera)
System.out.println(a % b);            // 1  (el resto)
System.out.println(c / b);            // 3.333... (división real)
System.out.println((double) a / b);   // 3.333... (obligas decimal)
```

> 💡 **Detalle práctico:** el **módulo** (`%`) no es para aburridos: te dice si un número es par (`numero % 2 == 0`), reparte turnos, da vueltas a los relojes y alimenta montones de juegos. Sin `%` no existiría nada cíclico.

---

## ⚠️ La división entera mata

**Si divides dos enteros, Java te devuelve un entero.** Punto. Los decimales se truncan sin piedad:

```java
int alumnos = 17;
int grupos = 5;
System.out.println(alumnos / grupos);   // 3 — Java dice que cada grupo tiene 3 alumnos
```

Para Java, 17 dividido entre 5 son **3**. Ni 3.4 ni 3.5: 3. Si quieres decimales, al menos uno de los dos operandos debe ser `double` (o hacer un casting, que verás en el punto 5).

> ⚠️ **Advertencia:** este es uno de los errores más rentables para un examen. `5 / 2` es `2`. `5 / 2.0` es `2.5`. `(double) 5 / 2` es `2.5`. Memorízalo como un mantra.

---

## 🎭 Precedencia: la ley del comedor

¿Quién se sirve primero en el comedor de las expresiones? Hay un orden estricto:

```java
int resultado = 2 + 3 * 4;        // 14 — la multiplicación se cuela antes
int conParentesis = (2 + 3) * 4;  // 20 — los paréntesis tienen pase VIP
```

**La ley del comedor:**
1. **Paréntesis `()`** — pase VIP, van los primeros.
2. **Multiplicación, división y módulo `* / %`** — los populares.
3. **Suma y resta `+ -`** — los normales, los últimos.

> 📝 **Nota:** y cuando dudes, **pon paréntesis**. `(a + b) * (c - d)` es mucho más legible que confiar en tu memoria de la precedencia. Los paréntesis no duelen y el que lea tu código (tu yo del futuro) te lo agradecerá.

---

## 🌀 Asignación compuesta: el atajo perezoso

Escribir `x = x + 5` es tan verboso... Por suerte, Java tiene los **operadores de asignación compuesta**, un grifo de agua en el sofá para no ir a la cocina:

```java
int x = 10;
x += 5;   // x = 15  (x = x + 5, pero más cool)
x -= 3;   // x = 12
x *= 2;   // x = 24
x /= 4;   // x = 6
x %= 3;   // x = 0
```

---

## 💪 `++` y `--`: flexiones para variables

Sumar o restar 1 es tan común que Java tiene su propio operador: `++` (incremento) y `--` (decremento). Pero ojo, que tienen dos caras:

```java
int a = 5;
int b = a++;  // POST: primero usa a (5), luego incrementa → b = 5, a = 6
int c = ++a;  // PRE: primero incrementa, luego usa → a = 7, c = 7
```

- **Post-incremento (`a++`)**: "usa y luego sube".
- **Pre-incremento (`++a`)**: "sube y luego usa".

> ⚠️ **Advertencia:** regla de oro: si usas `++` o `--` *dentro* de una expresión complicada, estarás escribiendo código que ni tú entenderás en una semana. Úsalos solos, en su propia línea. En los exámenes aparecen las trampas, y aquí está la prueba.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** desglosa la expresión paso a paso. ¿Qué valor tiene cada variable en cada momento? Anótalo, no lo hagas de memoria.

**Ejercicio: el acróbata de las variables**

Sin ejecutar, calcula qué vale todo aquí:

```java
int x = 3;
int y = x++ + ++x;
System.out.println("x = " + x + ", y = " + y);
```

<details>
<summary>🔄 Solución</summary>

Imprime `x = 5, y = 8`. Paso a paso:

1. `x = 3`.
2. `x++` — POST: usa `x` (3), luego incrementa `x` a 4. El valor de `x++` es **3**.
3. `++x` — PRE: `x` vale 4 ahora; lo incrementa a **5** y ese es su valor.
4. `y = 3 + 5 = 8`.
5. Resultado: `x = 5, y = 8`.

A los programadores profesionales también les cuesta. Por eso casi nadie escribe esto en producción... pero en los exámenes, ¡ay, aparece!

</details>

---

## 🎯 Mini-chequeo

1. ¿Cuánto vale `int r = 10 / 3`? ¿Y `double r = 10 / 3`?
2. ¿Qué hace el operador `%` y para qué sirve saber si `n % 2 == 0`?
3. ¿Cuál es el resultado de `2 + 3 * 4 - 1`?
4. Diferencia entre `a++` y `++a` en una frase.

<details>
<summary>🔄 Respuestas</summary>

1. `int r = 10 / 3` vale **3** (división entera trunca). `double r = 10 / 3` también vale **3.0**: la división se hace primero con enteros y después se guarda. Para decimales necesitas `10 / 3.0` o `(double) 10 / 3`.
2. El `%` da el **resto** de la división. `n % 2 == 0` es la prueba universal de paridad: si el resto es 0, `n` es par.
3. **13**: primero `3 * 4 = 12`, luego `2 + 12 - 1 = 13`. La multiplicación manda.
4. `a++` **usa** el valor actual y luego incrementa; `++a` **incrementa** primero y luego usa el nuevo.

</details>

---

## ✅ Resumen en 3 frases

1. Los operadores `+ - * / %` transforman tus datos, y la **división entera** trunca los decimales si ambos operandos son enteros.
2. La **precedencia** sigue la ley del comedor (paréntesis → `* / %` → `+ -`), y los paréntesis siempre son el plan B seguro.
3. `+=`, `-=`, `++` y `--` son atajos peligrosamente cómodos: úsalos solos y no dentro de expresiones enrevesadas.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Operador aritmético | `+ - * / %`: las operaciones matemáticas de Java |
> | División entera | División de dos enteros que trunca los decimales |
> | Módulo | `%`, el resto de una división |
> | Precedencia | El orden en que Java evalúa los operadores |
> | Asignación compuesta | Atajo como `x += 5` (= `x = x + 5`) |
> | Incremento | `++`/`--`: sumar o restar 1, con cara pre y post |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/02-variables-tipos-operadores) · **Anterior:** [02 · String, constantes y final](/ApuntesProgramacion/02-variables-tipos-operadores/02-string-constantes-final) · **Siguiente:** [04 · Relacionales, lógicos y ternario](/ApuntesProgramacion/02-variables-tipos-operadores/04-operadores-relacionales-logicos)