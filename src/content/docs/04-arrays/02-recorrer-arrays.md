---
title: "02 · Recorrer arrays: for y for-each"
description: "El dúo inseparable (for + array) y la variante perezosa que solo lee: el for-each 🌀"
---

<p><small>El dúo inseparable (for + array) y la variante perezosa que solo lee: el for-each 🌀</small></p>

> 🗺️ **Estás en:** 🅿️ **U04 · Arrays** → 02 · Recorrer arrays: for y for-each

---

## 📬 La idea en una frase

> **Un array sin un bucle es un parking que nadie visita: el `for` recorre plaza a plaza por índice, y el `for-each` hace lo mismo pero sin índice y solo para leer.**

En el punto 1 aprendiste a crear el parking. Ahora toca lo divertido: pasear por todas las plazas y hacer algo con cada coche. Y aquí manda un dúo tan inseparable como el pan y la mantequilla.

---

## 🔗 El dúo inseparable: for + array

Los arrays y los bucles `for` se ven siempre juntos. No es casualidad: el `for` tiene un contador natural (`i`) que encaja perfecto con los índices del array.

```java
String[] gatos = {"Bigotes", "Garfield", "Misifú", "Calcetines"};

for (int i = 0; i < gatos.length; i++) {
    System.out.println("Gato " + i + ": " + gatos[i]);
}
```

Salida:

```
Gato 0: Bigotes
Gato 1: Garfield
Gato 2: Misifú
Gato 3: Calcetines
```

Fíjate en la condición: `i < gatos.length`. Si escribieras `i <= gatos.length`, en la última vuelta pedirías la plaza `length` y... ¡BOOM! `ArrayIndexOutOfBoundsException`. Es el error de bucle más cometido del universo.

### Patrones clásicos con for

El `for` con índice no solo sirve para imprimir. Estos tres patrones se repiten en cada ejercicio del curso:

**Sumar todos los elementos:**

```java
int[] notas = {7, 8, 5, 9, 6};
int suma = 0;
for (int i = 0; i < notas.length; i++) {
    suma += notas[i];
}
System.out.println("Media: " + (double) suma / notas.length);
```

**Buscar un valor (búsqueda lineal):**

```java
int[] edades = {12, 45, 7, 34, 89};
int buscado = 34;
int posicion = -1;
for (int i = 0; i < edades.length; i++) {
    if (edades[i] == buscado) {
        posicion = i;
        break;
    }
}
System.out.println(posicion >= 0 ? "Encontrado en " + posicion : "No encontrado");
```

**Modificar el array en el sitio** (esto solo se puede con índice):

```java
int[] numeros = {1, 2, 3, 4, 5};
for (int i = 0; i < numeros.length; i++) {
    numeros[i] = numeros[i] * 10;
}
// {10, 20, 30, 40, 50}
```

---

## 🛋️ for-each: la variante perezosa

Si no necesitas el índice (solo quieres leer los valores), existe una sintaxis más corta:

```java
String[] gatos = {"Bigotes", "Garfield", "Misifú"};

for (String gato : gatos) {
    System.out.println("Miau: " + gato);
}
```

Se lee: "para cada String gato en gatos, haz esto". La variable `gato` va tomando el valor de cada plaza una a una, sin que tú gestiones contadores ni corchetes.

> 📝 **Nota:** el for-each es **de solo lectura**. No puedes modificar el array original dentro del bucle. Bueno, puedes intentarlo, pero el cambio se pierde en el éter: `gato = "Nuevo"` solo cambia la variable local, no la plaza del array. Para modificar, usa el `for` con índice.

### ¿Cuándo uso cada uno?

| Situación | Bucle recomendado |
|---|---|
| Solo leer y no me importa la posición | `for-each` |
| Necesito el índice (posiciones, comparar vecinos) | `for` clásico |
| Quiero modificar los elementos del array | `for` clásico |
| Recorrer hacia atrás o de dos en dos | `for` clásico |
| Recorrer una colección (`ArrayList`, `HashSet`...) | `for-each` (U10 Colecciones) |

> 💡 **Consejo:** si no necesitas el índice, usa `for-each`. Es más corto, más legible y te ahorra una clase entera de errores (olvidar el `++`, empezar en 1, escribir `<=`...).

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** el for-each es como un robot que va por el parking leyendo las matrículas. Solo lee: no puede repintar los coches.

**Ejercicio: la suma de los pacientes**

```java
public class BeTheForEach {
    public static void main(String[] args) {
        int[] numeros = {10, 20, 30, 40, 50};
        int total = 0;

        for (int n : numeros) {
            if (n % 20 == 0) {
                total += n;
            }
        }

        System.out.println(total);
    }
}
```

**¿Qué imprime?**

- (A) 60
- (B) 90
- (C) 120
- (D) 150

<details>
<summary>🔄 Solución</summary>

La **A**. El for-each recorre cada elemento: 10, 20, 30, 40, 50. El `if` solo suma los múltiplos de 20, que son 20 y 40. `20 + 40 = 60`. Los demás se ignoran.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué imprime `for (int i = 0; i < a.length; i++)` sobre `{1,2,3}` si imprimes `a[i]`?
2. ¿Por qué `for (int i = 0; i <= a.length; i++)` lanza excepción?
3. ¿Se puede modificar un array con `for-each`?
4. ¿Qué bucle usarías para imprimir el array al revés?

<details>
<summary>🔄 Respuestas</summary>

1. `1 2 3`. El bucle recorre las plazas 0, 1 y 2.
2. Porque en la última vuelta (`i == a.length`) pide una plaza que no existe: los índices válidos terminan en `length - 1`.
3. No. El for-each es de solo lectura: la variable del bucle es una copia del valor, no la plaza.
4. Un `for` clásico hacia atrás: `for (int i = a.length - 1; i >= 0; i--)`.

</details>

---

## ✅ Resumen en 3 frases

1. El **`for` clásico** recorre el array con un índice (`i`) desde `0` hasta `length - 1`, y es el único que permite **modificar** elementos.
2. El **`for-each`** lee todos los valores sin índice: perfecto para sumar, contar o imprimir, pero es **de solo lectura**.
3. La condición del bucle es `i < length`; si escribes `<=`, te estrellas contra `ArrayIndexOutOfBoundsException`.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Recorrer | Visitar cada elemento del array, uno a uno |
> | `for` clásico | Bucle con índice para leer, modificar o buscar |
> | `for-each` | Bucle de solo lectura: "para cada X en Y" |
> | Búsqueda lineal | Recorrer de principio a fin buscando un valor |
> | `break` | Cortar el bucle en el momento en que encuentras lo buscado |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/04-arrays) · **Anterior:** [01 · Arrays: el aparcamiento de datos](/ApuntesProgramacion/04-arrays/01-arrays-basicos) · **Siguiente:** [03 · Arrays multidimensionales](/ApuntesProgramacion/04-arrays/03-arrays-multidimensionales)