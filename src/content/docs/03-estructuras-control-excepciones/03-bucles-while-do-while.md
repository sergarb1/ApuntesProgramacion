---
title: "03 — Bucles: while y do-while"
description: Repetir sin copiar y pegar, hasta que una condición diga basta 🏃
---

<p><small>Repetir sin copiar y pegar, hasta que una condición diga basta 🏃</small></p>

> 🗺️ **Estás en:** 🔀 **U03 · Estructuras de Control y Excepciones** → 03 · Bucles: while y do-while

---

## 📬 La idea en una frase

> **Un bucle es una cinta de correr: ejecuta el mismo bloque una y otra vez mientras la condición sea `true`.**

¿Te imaginas escribir "imprime del 1 al 100" con cien `println`? Copiar y pegar es pecado. Los bucles hacen el trabajo sucio por ti: repiten un bloque hasta que les dices basta.

---

## 🏃 while: comprueba y luego corre

```java
while (condicion) {
    // bloque que se repite
}
```

El `while` primero **mira la condición** y, si es `true`, ejecuta el bloque. Al terminar, vuelve a mirar. Si es `false` desde el principio... **no ejecuta nada**.

```java
int intentos = 3;

while (intentos > 0) {
    System.out.println("Reintentando... quedan " + intentos);
    intentos = intentos - 1;
}
```

Salida:

```
Reintentando... quedan 3
Reintentando... quedan 2
Reintentando... quedan 1
```

> ⚠️ **Advertencia:** si olvidas la línea que modifica la condición (`intentos = intentos - 1;`), la condición es `true` para siempre y tu programa **nunca termina**. Bienvenido al bucle infinito, el coche sin frenos de la programación.

---

## ♾️ El bucle infinito (y cómo salir)

```java
while (true) {
    System.out.println("Socorro");
}
```

Este programa imprimiría "Socorro" hasta que el universo se congele. En el IDE, el botón de parar (🟥) es tu mejor amigo. ¿Por qué existe `while (true)`? Porque a veces quieres un bucle "para siempre" que se rompa en el interior con `break` (ya lo verás en el punto 5).

> 💡 **Detalle práctico:** la sentencia centinela. Un clásico es leer datos hasta que el usuario escriba "salir":

```java
String respuesta = "";
Scanner sc = new Scanner(System.in);

while (!respuesta.equals("salir")) {
    System.out.print("Dime algo (o 'salir'): ");
    respuesta = sc.nextLine();
}
System.out.println("Adiós.");
```

---

## 🏃‍♂️ do-while: corre y luego comprueba

```java
do {
    // bloque
} while (condicion);
```

La diferencia con `while` es el **orden**: el `do-while` ejecuta el bloque **al menos una vez** y comprueba la condición al final. Útil cuando necesitas preguntar sí o sí antes de decidir:

```java
int opcion;
Scanner sc = new Scanner(System.in);

do {
    System.out.println("1. Jugar  2. Salir");
    System.out.print("Elige: ");
    opcion = sc.nextInt();
} while (opcion != 1 && opcion != 2);

System.out.println("Has elegido la opción " + opcion);
```

Aquí el menú se muestra **siempre al menos una vez**, y se repite mientras el usuario no elija 1 o 2. Perfecto para menús.

> ⚠️ **Advertencia:** no confundas los dos. Con `while`, si la condición es `false` de entrada, **cero ejecuciones**. Con `do-while`, **al menos una**. Es como la diferencia entre "mira antes de cruzar" y "cruza y luego mira".

---

## 🆚 while vs do-while: el duelo rápido

| Situación | Bucle ideal |
|---|---|
| No sabes si tocará ejecutar el bloque | `while` |
| El bloque debe ejecutarse sí o sí una vez | `do-while` |
| Leer datos hasta que el usuario dé el centinela | `while` |
| Mostrar un menú hasta que elija una opción válida | `do-while` |

---

## 🏫 Ejemplo guiado: la cuenta atrás

Vamos a lanzar un cohete con una cuenta atrás. Como debe imprimirse el "¡Despegue!" aunque el contador empiece en 0... usamos `do-while`:

```java
public class CuentaAtras {
    public static void main(String[] args) {
        int contador = 5;

        do {
            System.out.println(contador);
            contador--;
        } while (contador >= 0);

        System.out.println("¡Despegue! 🚀");
    }
}
```

Salida:

```
5
4
3
2
1
0
¡Despegue! 🚀
```

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuando veas un bucle, pregúntate: *¿la condición avanza hacia `false` en algún momento?* Si la respuesta es "no", tienes un bucle infinito.

**Ejercicio: el contador parado**

Sin ejecutar, calcula cuántas veces imprime "Hola" este programa... o si se cuelga:

```java
public class Contador {
    public static void main(String[] args) {
        int x = 10;

        while (x > 0) {
            System.out.println("Hola");
            x = x + 1;
        }
    }
}
```

<details>
<summary>🔄 Solución</summary>

**Bucle infinito.** `x` empieza en 10 y en vez de decrementar, se incrementa (`x = x + 1`): la condición `x > 0` es `true` para siempre y el programa imprime "Hola" eternamente. La corrección sería `x = x - 1;`. Pista visual: un contador que sube en un `while` que pide que baje es humo en el ordenador.

</details>

---

## 🎯 Mini-chequeo

1. ¿Cuántas veces se ejecuta el bloque de un `while` si la condición es `false` desde el principio?
2. ¿Y en un `do-while`?
3. ¿Qué es un bucle infinito y cómo se sale de él en el IDE?
4. ¿Cuándo usarías un `do-while` para un menú?

<details>
<summary>🔄 Respuestas</summary>

1. **Cero veces**: el `while` comprueba antes de ejecutar.
2. **Al menos una vez**: el `do-while` ejecuta y comprueba después.
3. Un bucle cuya condición nunca pasa a `false`. Se corta con el botón de **parar (🟥)** del IDE, y se evita asegurando que algo modifique la condición dentro.
4. Cuando quieras mostrar el menú **siempre al menos una vez** y repetirlo hasta que el usuario elija una opción válida.

</details>

---

## ✅ Resumen en 3 frases

1. `while` comprueba la condición **antes** de ejecutar y `do-while` **después**: el segundo garantiza al menos una ejecución.
2. Un bucle necesita que la condición **avance hacia `false`**; si no, tienes un bucle infinito.
3. Usa `while` para leer hasta un centinela y `do-while` para menús que deben mostrarse sí o sí.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Bucle | Bloque que se repite mientras una condición sea `true` |
> | Iteración | Una vuelta completa del bucle |
> | Condición | La expresión booleana que decide si se sigue |
> | Centinela | Valor especial que termina la lectura ("salir") |
> | Bucle infinito | Bucle que nunca acaba por descuido |
> | do-while | Bucle que ejecuta al menos una vez y comprueba al final |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/03-estructuras-control-excepciones) · **Anterior:** [02 · switch](/ApuntesProgramacion/03-estructuras-control-excepciones/02-switch) · **Siguiente:** [04 · Bucle for](/ApuntesProgramacion/03-estructuras-control-excepciones/04-bucle-for)
