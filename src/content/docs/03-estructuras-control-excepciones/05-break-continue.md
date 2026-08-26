---
title: 05 — break, continue y etiquetas
description: Los botones de emergencia y los saltos de línea del bucle 🚪
---

<p><small>Los botones de emergencia y los saltos de línea del bucle 🚪</small></p>

> 🗺️ **Estás en:** 🔀 **U03 · Estructuras de Control y Excepciones** → 05 · break, continue y etiquetas

---

## 📬 La idea en una frase

> **`break` apaga el bucle entero y `continue` se salta solo la vuelta actual; con etiquetas puedes decidir a qué bucle anidado afectan.**

Ya sabes repetir. Ahora toca aprender a **salir con estilo**: interrumpir, saltar y dirigirte a un bucle concreto cuando hay varios.

---

## 🚪 break: el botón de parada

`break` termina el bucle **inmediatamente**, sin comprobar la condición:

```java
for (int i = 1; i <= 10; i++) {
    if (i == 5) {
        break;
    }
    System.out.println(i);
}
```

Salida:

```
1
2
3
4
```

En cuanto `i` vale 5, `break` corta el bucle: las vueltas 6 a 10 nunca ocurren. Es perfecto para "encuentra algo y para de buscar".

> 💡 **Detalle práctico:** el `break` dentro de un `switch` (punto 2) cortaba el switch. El `break` dentro de un bucle corta el bucle. Mismo botón, diferente aparato.

---

## ⏭️ continue: el botón de saltar

`continue` no termina el bucle: **salta a la siguiente vuelta** directamente, ignorando el resto del bloque:

```java
for (int i = 1; i <= 5; i++) {
    if (i == 3) {
        continue;
    }
    System.out.println(i);
}
```

Salida:

```
1
2
4
5
```

El 3 se salta, pero el bucle sigue. Útil para "no proceses estos valores, pero sigue con los demás":

```java
// Suma solo los números pares del 1 al 10
int suma = 0;
for (int i = 1; i <= 10; i++) {
    if (i % 2 != 0) {
        continue;      // impares: no cuentan
    }
    suma += i;
}
System.out.println("Suma de pares: " + suma);   // 2+4+6+8+10 = 30
```

> ⚠️ **Advertencia:** en un `while`, si pones el `continue` **antes** de actualizar la variable del bucle, la actualización se salta... y el bucle no avanza. Bug infinito asegurado. En un `for` la actualización está en la cabecera y no pasa nada.

---

## 🏷️ Etiquetas: el GPS de los bucles anidados

Un `break` o `continue` sueltos afectan **solo al bucle más interno**. ¿Y si quieres salir de dos bucles a la vez? Ahí nacen las **etiquetas**:

```java
exterior:
for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
        if (i * j >= 6) {
            break exterior;    // sale de AMBOS bucles
        }
        System.out.println(i + " x " + j);
    }
}
```

Salida:

```
1 x 1
1 x 2
1 x 3
2 x 1
2 x 2
```

Cuando `i * j >= 6`, el `break exterior` salta fuera de la etiqueta, terminando los dos bucles a la vez. Sin etiqueta, el `break` solo habría salido del bucle de `j`.

```java
exterior:
for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
        if (j == 2) {
            continue exterior;   // salta a la siguiente i
        }
        System.out.println(i + "-" + j);
    }
}
```

Salida:

```
1-1
2-1
3-1
```

> ⚠️ **Advertencia:** las etiquetas son legales pero poco usadas. Ante la duda, casi siempre se puede rediseñar con una variable booleana. Usa etiquetas con moderación: tu compañero de proyecto te lo agradecerá.

---

## 🏫 Ejemplo guiado: el detector de primer número

Usemos `break` para comprobar si un número es primo de forma eficiente:

```java
public class EsPrimo {
    public static void main(String[] args) {
        int numero = 29;
        boolean esPrimo = true;

        for (int divisor = 2; divisor < numero; divisor++) {
            if (numero % divisor == 0) {
                esPrimo = false;
                break;   // encontrado divisor: para de buscar
            }
        }

        System.out.println(numero + " ¿es primo? " + esPrimo);
    }
}
```

Salida:

```
29 ¿es primo? true
```

Con `break`, en cuanto aparece un divisor dejamos de comprobar. Para el 29 no hay divisores, así que el bucle se recorre entero y `esPrimo` sigue siendo `true`.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** para distinguirlos de un vistazo: `break` = **apaga** el bucle; `continue` = **salta** esta vuelta. Uno termina la fiesta, el otro solo se pierde una canción.

**Ejercicio: el bucle esquizofrénico**

Sin ejecutar, escribe la salida exacta:

```java
public class Esquizofrenia {
    public static void main(String[] args) {
        for (int i = 1; i <= 8; i++) {
            if (i % 3 == 0) {
                continue;
            }
            if (i == 7) {
                break;
            }
            System.out.println(i);
        }
    }
}
```

<details>
<summary>🔄 Solución</summary>

```
1
2
4
5
```

Paso a paso: del 1 al 8, `continue` se salta los múltiplos de 3 (3 y 6), y `break` corta en el 7 (que tampoco llegaría a imprimirse). Quedan el 1, 2, 4 y 5. El 8 nunca se evalúa porque el `break` de `i == 7` apagó el bucle antes.

</details>

---

## 🎯 Mini-chequeo

1. ¿Cuál es la diferencia entre `break` y `continue` en una frase?
2. ¿A qué afectan por defecto en bucles anidados?
3. ¿Para qué sirve una etiqueta?
4. ¿Por qué es peligroso el `continue` en un `while` si va antes de la actualización?

<details>
<summary>🔄 Respuestas</summary>

1. `break` **termina** el bucle; `continue` **salta solo la vuelta actual**.
2. Al bucle **más interno**.
3. Para que un `break` o `continue` afecte a un bucle exterior concreto (`break etiqueta;`).
4. Porque la actualización se salta y el bucle **no avanza**: condición `true` para siempre.

</details>

---

## ✅ Resumen en 3 frases

1. `break` apaga el bucle entero y `continue` se salta solo la vuelta actual.
2. En bucles anidados afectan al más interno; las **etiquetas** te dejan apuntar a un bucle exterior.
3. Cuidado con `continue` antes de la actualización en `while`: es un bucle infinito en ciernes.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `break` | Termina el bucle (o el switch) inmediatamente |
> | `continue` | Salta a la siguiente vuelta del bucle |
> | Etiqueta | Nombre que pones a un bucle para saltar a él |
> | `break etiqueta` | Sale del bucle etiquetado, no del más interno |
> | Bucle infinito | Riesgo si `continue` se salta la actualización de un `while` |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/03-estructuras-control-excepciones) · **Anterior:** [04 · Bucle for](/ApuntesProgramacion/03-estructuras-control-excepciones/04-bucle-for) · **Siguiente:** [06 · Excepciones básicas](/ApuntesProgramacion/03-estructuras-control-excepciones/06-excepciones-basicas)
