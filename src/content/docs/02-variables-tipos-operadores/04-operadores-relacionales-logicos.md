---
title: 04 — Relacionales, lógicos y ternario
description: El juez, el portero y el bouncer del club de las decisiones ⚖️
---

<p><small>El juez, el portero y el bouncer del club de las decisiones ⚖️</small></p>

> 🗺️ **Estás en:** 🔤 **U02 · Variables, Tipos y Operadores** → 04 · Relacionales, lógicos y ternario

---

## 📬 La idea en una frase

> **Los operadores relacionales (`==`, `!=`, `<`, `>`, `<=`, `>=`) comparan valores y devuelven un `boolean`; los lógicos (`&&`, `||`, `!`) combinan booleanos; y el ternario (`? :`) resume una decisión en una sola línea.**

Tus variables ya saben sumar y restar. Ahora van a aprender a **juzgar**: "¿eres mayor de edad?", "¿tienes entrada Y dinero?", "¿eres el dueño O un invitado?". Bienvenido al club de las decisiones.

---

## ⚖️ Relacionales: el juez de la discusión

Los operadores relacionales siempre devuelven un `boolean`: `true` o `false`. Son el juez que dicta sentencia sobre la relación entre dos valores:

```java
int edad = 18;
boolean puedeVotar = edad >= 18;                  // true
boolean tieneDescuento = edad < 12 || edad > 65;  // false
boolean noEsEl = edad != 18;                      // false
```

| Operador | Significado | Ejemplo (`edad = 18`) |
|---|---|---|
| `==` | Igual que | `edad == 18` → `true` |
| `!=` | Distinto de | `edad != 18` → `false` |
| `>` | Mayor que | `edad > 21` → `false` |
| `<` | Menor que | `edad < 21` → `true` |
| `>=` | Mayor o igual | `edad >= 18` → `true` |
| `<=` | Menor o igual | `edad <= 18` → `true` |

> ⚠️ **Advertencia:** **`=` no es `==`.** `=` asigna ("guarda este valor en esta caja"), `==` compara ("¿son iguales?"). Confundirlos es el error más clásico de la historia de la programación. Es como confundir "pon la mesa" con "¿está puesta la mesa?".

---

## 🚪 Lógicos: el portero del club

Los operadores lógicos combinan booleanos para tomar decisiones compuestas. Son el portero del club nocturno:

- **`&&` (AND)**: ¿Tienes más de 18 **Y** tienes entrada? Las dos condiciones deben cumplirse.
- **`||` (OR)**: ¿Tienes más de 18 **O** eres el dueño? Basta con que se cumpla una.
- **`!` (NOT)**: ¿**NO** tienes menos de 18? Niega la condición.

```java
boolean mayorEdad = true;
boolean tieneEntrada = false;

boolean entra = mayorEdad && tieneEntrada;    // false (falta la entrada)
boolean entraVip = mayorEdad || tieneEntrada; // true (basta ser mayor de edad)
boolean noEsMenor = !(edad < 18);             // true (niega que sea menor)
```

---

## ⚡ Cortocircuito: el portero que no mira

Aquí viene el truco del club más rentable de Java: el **cortocircuito**.

- Con `&&`, si lo primero es `false`, la expresión ya es `false` y **Java ni se molesta en evaluar lo segundo**.
- Con `||`, si lo primero es `true`, la expresión ya es `true` y tampoco mira lo segundo.

```java
int x = 5;
boolean resultado = (x > 10) && (++x > 0);   // false, y x sigue siendo 5
System.out.println(x);                       // 5 — el ++x nunca se ejecutó
```

> 💡 **Detalle práctico:** el cortocircuito también te protege. Si escribes `(algo != null) && algo.metodo()`, Java no llamará al método si `algo` es `null`, evitando un crash en tu programa.

---

## 🎚️ El ternario: el bouncer del club

Cuando la decisión es "si pasa esto, mensaje A; si no, mensaje B", el **operador ternario** lo resume en una línea. Es un `if-else` de bolsillo (los `if` de verdad llegan en la U03):

```java
int edad = 17;
String mensaje = (edad >= 18) ? "Pasa, joven" : "Vuelve cuando crezcas";
```

La estructura es: `condición ? valorSiTrue : valorSiFalse`.

```java
int nota = 7;
String resultado = nota >= 5 ? "Aprobado" : "Suspenso";
```

---

## 🏫 Ejemplo guiado: el portero del club

Vamos a montar el control de acceso de un club con todo lo aprendido:

```java
public class ClubNoche {
    public static void main(String[] args) {
        int edad = 19;
        boolean tieneEntrada = true;
        boolean esVip = false;

        boolean puedeEntrar = (edad >= 18) && (tieneEntrada || esVip);
        String mensaje = puedeEntrar ? "¡Pasa, disfruta!" : "Fuera de aquí, pequeñín";

        System.out.println(mensaje);

        int golesLocal = 2;
        int golesVisitante = 2;
        String resultado = golesLocal > golesVisitante ? "Gana el local" :
                           golesLocal < golesVisitante ? "Gana el visitante" : "Empate";
        System.out.println("Resultado: " + resultado);
    }
}
```

Salida:

```
¡Pasa, disfruta!
Resultado: Empate
```

Fíjate en la segunda decisión: los ternarios se pueden **encadenar** (un ternario dentro de otro) para cubrir tres casos. Legible y compacto.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** en una expresión con `&&` y `||`, pregunta siempre: *¿y si lo primero ya decide?* Ese es el cortocircuito.

**Ejercicio: el detective de booleanos**

Sin ejecutar, calcula el valor de cada variable:

```java
int n = 10;
boolean a = (n > 5) && (n < 20);              // ¿?
boolean b = (n > 15) || (++n == 11);          // ¿?
boolean c = !(n == 10) && (n % 2 == 0);       // ¿?
System.out.println(a);
System.out.println(b);
System.out.println(c);
System.out.println(n);
```

<details>
<summary>🔄 Solución</summary>

Imprime `true`, `true`, `false` y `11`.

1. `a`: 10 es mayor que 5 **y** menor que 20 → **true**.
2. `b`: 10 no es mayor que 15, así que Java evalúa el `||` con la segunda parte: `++n == 11` → incrementa `n` a 11 y compara: `11 == 11` → **true**. (El `||` solo cortocircuita cuando la primera es `true`; aquí era `false`.)
3. `c`: `!(n == 10)` con `n = 11` → `!false` → `true`; `&&` con `11 % 2 == 0` → `false`. Resultado: **false**.
4. `n` acabó en **11** por el `++n` de la línea 2.

</details>

---

## 🎯 Mini-chequeo

1. ¿Qué devuelve siempre un operador relacional?
2. ¿Cuál es la diferencia entre `&&` y `||` en una frase?
3. ¿Qué es el cortocircuito y cuándo se activa?
4. Escribe el ternario que asigne `"mayor"` o `"menor"` a una variable según una edad.

<details>
<summary>🔄 Respuestas</summary>

1. Un **`boolean`**: `true` o `false`.
2. `&&` exige que **todas** las condiciones se cumplan; `||` se conforma con **una sola**.
3. Cuando la primera condición ya decide el resultado, Java **no evalúa las demás**: con `&&` si la primera es `false`, con `||` si la primera es `true`.
4. `String resultado = edad >= 18 ? "mayor" : "menor";`

</details>

---

## ✅ Resumen en 3 frases

1. Los **relacionales** (`==`, `!=`, `<`, `>`, `<=`, `>=`) comparan y devuelven un `boolean`, y `=` nunca se usa para comparar.
2. Los **lógicos** (`&&`, `||`, `!`) combinan condiciones y sufren **cortocircuito**: si la primera ya decide, no miran las demás.
3. El **ternario** (`condición ? A : B`) resume una decisión de dos caminos en una línea.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Operador relacional | Compara dos valores y da `true`/`false` |
> | Operador lógico | Combina booleanos: `&&`, `\|\|`, `!` |
> | Cortocircuito | Dejar de evaluar cuando la primera condición ya decide |
> | Ternario | `condición ? valor1 : valor2`, un if-else en una línea |
> | Booleano | Tipo con solo dos valores: `true` o `false` |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/02-variables-tipos-operadores) · **Anterior:** [03 · Operadores aritméticos](/ApuntesProgramacion/02-variables-tipos-operadores/03-operadores-aritmeticos) · **Siguiente:** [05 · Casting y conversiones](/ApuntesProgramacion/02-variables-tipos-operadores/05-casting-conversiones)