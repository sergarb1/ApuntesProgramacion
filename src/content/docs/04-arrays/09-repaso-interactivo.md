---
title: "09 · Repaso interactivo: el parking a examen"
description: "El cierre práctico de la unidad, con recorridos, búsquedas y un array que no va a funcionar 😈"
---

<p><small>El cierre práctico de la unidad, con recorridos, búsquedas y un array que no va a funcionar 😈</small></p>

> 🗺️ **Estás en:** 🅿️ **U04 · Arrays** → 09 · Repaso interactivo

---

## 📬 La idea en una frase

> **En este punto no aprendemos nada nuevo: lo convertimos todo en práctica. Y, como siempre, algo no va a funcionar.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaban de darte este programa para ejecutar:*

```java
public class Misterio {
    public static void main(String[] args) {
        int[] datos = {3, 1, 4, 1, 5, 9};
        int total = 0;

        for (int i = 0; i < datos.length; i += 2) {
            total += datos[i];
        }

        System.out.println(total);
    }
}
```

**¿Qué imprime por pantalla? Elige sabiamente:**

1. **`23`** → Sumas todos los elementos, pero el bucle va de dos en dos. ❌
2. **`12`** → ✅ ¡Correcto! El bucle salta de 2 en 2: `i = 0, 2, 4`. Suma `datos[0] + datos[2] + datos[4]` = `3 + 4 + 5` = **12**. La plaza 1 (el 1) y la 3 (el 1) se quedan sin visitar.
3. **`13`** → Sumas los índices en vez de los valores. ❌
4. **`9`** → Solo te quedas con `datos[4]`, el último del salto. ❌

> <details>
> <summary>🔄 Solución</summary>
>
> La opción **2**. `i += 2` recorre las posiciones pares 0, 2 y 4. Sus valores son 3, 4 y 5. `3 + 4 + 5 = 12`. El `for` con índice te da el control del paso: algo que el `for-each` no puede hacer.
>
> </details>

---

## 🔥 Fireside Chat: for clásico vs for-each

> *Dos veteranos del recorrido discuten junto a la máquina de café.*

**For-each:** — Yo soy el moderno. "Para cada X en Y": corto, limpio, imposible equivocarse con el índice. ¿Quién quiere contar plazas a mano?

**For clásico:** — ¿Y cuándo me necesitas a mí? Cuando hay que **modificar**, cuando hay que **saber la posición**, cuando hay que ir **hacia atrás** o **de dos en dos**. Esas cuatro cosas son el 80% de los ejercicios del curso, y las hago todas. Tú, en cambio, lees y te callas.

**For-each:** — Leer es lo que se hace casi siempre: sumar, contar, imprimir. El 80% de las veces no te necesito, y si te uso sin necesitarte, llegan los errores: el `<=`, el empezar en 1, el olvidar el `++`...

**For clásico:** — Eso es porque no me usas bien. Conmigo tienes el control total. Tú eres... la variante perezosa.

**For-each:** — La variante **segura**. Y no me llamo perezosa: me llamo "sin índice, sin excusas".

**For clásico:** — Vale, tregua. Tú para leer sin posiciones; yo para todo lo demás. ¿Trato?

**For-each:** — Trato. Pero que sepas que en el bucle de la media te gano a ti hasta con los ojos cerrados.

> La lección: **for-each** si solo lees y no te importa la posición; **for con índice** si modificas, buscas posiciones o recorres de forma especial. El contexto decide, no la moda.

---

## 🕵️ ¿Quién soy?

Adivina qué concepto de la unidad soy:

1. **Soy un aparcamiento de tamaño fijo: guardo muchos datos del mismo tipo bajo un solo nombre.**
2. **Soy el número de cada plaza, y empiezo en 0, para confusión general.**
3. **Soy la excepción favorita del novato: me lanzan cuando piden la plaza que no existe.**
4. **Soy el bucle de solo lectura: "para cada X en Y", sin índice y sin prisas.**
5. **Soy la clase utilitaria con `toString`, `sort`, `binarySearch`, `copyOf` y `fill`.**
6. **Soy el atributo que dice cuántas plazas hay, sin paréntesis, para no confundirme con los `String`.**

<details>
<summary>🔄 Respuestas</summary>

1. **El array** — aparcamiento de datos del mismo tipo, tamaño fijo.
2. **El índice** — número de la plaza; las válidas van de 0 a `length - 1`.
3. **La `ArrayIndexOutOfBoundsException`** — al pedir la plaza `length` o más.
4. **El `for-each`** — solo lee, no modifica.
5. **La clase `Arrays`** — la navaja suiza de los arrays.
6. **`length`** — atributo del array, sin paréntesis (los `String` usan `length()`).

</details>

---

## 🤬 CONRAD VS EL MUNDO: "El array que no para"

> *CONRAD, nuestro compilador cascarrabias, ha encontrado una nota en la bandeja de errores.*

**CONRAD:** — ¡OTRA VEZ! Un alumno me dice: *CONRAD, mi bucle se sale del array*. Y yo: ¿con qué condición lo has escrito? *Pues... `i <= notas.length`.* ¡¡PERO SI ESO ES LO PRIMERO QUE SE APRENDE EN ESTA UNIDAD!! El último índice es `length - 1`. `<=` significa que vas a pedir la plaza `length`, que no existe. Es como llamar a la planta 5 de un parking de 5 plantas (que van de la 0 a la 4): no está, y el portero te lanza la `ArrayIndexOutOfBoundsException`.

*Y luego el clásico del for-each:* *mi array no se modifica*. ¿Y cómo lo recorres? *Con for-each.* ¡CLARO! El for-each es un robot que LEE las matrículas. No repinta coches. Si quieres cambiar valores, índice y corchetes: `notas[i] = notas[i] + 1;`. ¿Cuántas veces lo tengo que decir?

*Y el de los String:* *comparo dos nombres y no me da igual*. ¿Con qué? *Con `==`.* ¿CUÁNTAS VECES? Con `String` se usa `.equals()`. `==` compara referencias: ¿son el MISMO objeto? Aunque tengan el mismo texto, si son dos objetos distintos, `==` dice false. ¡LÉELO EN EL PUNTO 6, POR FAVOR!

**La lección:** los tres males del novato con arrays tienen nombre: **`<=` fuera de rango**, **for-each que no modifica** y **`==` que no compara texto**. Antes de llorar sobre el teclado, comprueba esas tres cosas. El 90% de los "arrays rebeldes" se arreglan con un vistazo.

---

## 🎮 El juego de las decisiones

Elige la respuesta correcta para cada decisión (respuestas al final):

1. ¿Cuál es el último índice válido de `int[] a = new int[8]`?
   - a) 7   b) 8   c) 9
2. ¿Qué valor tiene cada plaza de `boolean[] b = new boolean[4]`?
   - a) `true`   b) `false`   c) `null`
3. ¿Qué hace `Arrays.binarySearch` sobre un array **desordenado**?
   - a) Lanza excepción   b) Devuelve un resultado impredecible   c) Ordena primero
4. ¿Qué imprime `System.out.println(a.length);` para `int[] a = new int[10]`?
   - a) `9`   b) `10`   c) `[10]`
5. ¿Qué bucle usas para recorrer un array **hacia atrás**?
   - a) `for-each`   b) `for` con índice   c) cualquiera

<details>
<summary>🔄 Soluciones</summary>

1. **a)** — 7. Las plazas van de 0 a `length - 1`, o sea de 0 a 7.
2. **b)** — `false`. Es el valor por defecto de `boolean`.
3. **b)** — Un resultado impredecible, sin avisar. Exige array ordenado, siempre.
4. **b)** — `10`. `length` es el número de plazas, sin paréntesis.
5. **b)** — `for (int i = a.length - 1; i >= 0; i--)`. El `for-each` solo avanza de principio a fin.

</details>

---

## ⚡ Laboratorio de tortura: la media que se resiste

> **Duración estimada:** 30 minutos
> **Herramienta:** tu IDE y un archivo nuevo

**El escenario:** copia este programa y haz que funcione. Tiene **3 errores** que impiden que compile o que falle en ejecución, y 1 error de lógica que hace que el resultado sea incorrecto cuando lo arregles.

```java
public class Tortura
    public static void main(String[] args) {
        int[] notas = {8, 7, 9, 6};
        int suma = 0;

        for (int i = 0; i <= notas.length; i++) {
            suma += notas[i];
        }

        double media = suma / notas.length;
        System.out.println("Media: " + media)
    }
}
```

**Fallo intencionado:** uno de los errores parece correcto a simple vista porque "se ve bien", pero hace que el programa falle en ejecución en cuanto arranca.

**Tu tarea:** conseguir que compile, que ejecute y que imprima `Media: 7.5`. Si el resultado no cuadra, diagnostica.

**Pistas para cuando te frustres (no antes):**

1. ¿Hay algún `;` que falte? *no → sigue buscando.*
   <details><summary>¿Y si sigo atascado?</summary>Comprueba también las llaves `{}`: la clase necesita su apertura, y el último `System.out.println` necesita su `;`.</details>
2. ¿Compila ya? *no → mira el mensaje de error.*
   <details><summary>¿Y si sigo atascado?</summary>La clase `Tortura` necesita `{` de apertura.</details>
3. ¿Compila pero explota al ejecutar? *Es el error de índices: el bucle llega demasiado lejos.*
   <details><summary>¿Y si sigo atascado?</summary>`i <= notas.length` accede a `notas[4]`, que no existe (las válidas son 0-3). Debe ser `i < notas.length`.</details>
4. ¿Ejecuta e imprime `Media: 7.0`? *Es el error de lógica: la división entera.*
   <details><summary>Solución final</summary>

Los **3 errores** que impiden compilar o ejecutar:

1. Falta la `{` de apertura de la clase después de `Tortura`.
2. Falta el `;` al final de `System.out.println("Media: " + media)`.
3. `i <= notas.length` accede a `notas[4]` fuera del array: `ArrayIndexOutOfBoundsException`. Debe ser `i < notas.length`.

El **error de lógica**: `suma / notas.length` divide enteros. `30 / 4 = 7` (se trunca), no `7.5`. Para que la media salga con decimales hay que convertir antes: `(double) suma / notas.length`.

```java
public class Tortura {
    public static void main(String[] args) {
        int[] notas = {8, 7, 9, 6};
        int suma = 0;

        for (int i = 0; i < notas.length; i++) {
            suma += notas[i];
        }

        double media = (double) suma / notas.length;
        System.out.println("Media: " + media);
    }
}
```

Salida correcta: `Media: 7.5`. Con la versión rota, una vez arreglados los otros errores, la división entera daba `7.0`: la pista del error de lógica.

</details>

---

## 🏆 Logros de esta unidad

| Logro | Cómo conseguirlo |
|---|---|
| 🏅 **El Aparcador Jefe** | Crear un array, rellenarlo y recorrerlo sin mirar apuntes |
| 🏅 **El Contador de Plazas** | Explicar la diferencia entre `length`, `length()` y `size()` |
| 🏅 **El Cazador de Monstruos** | Encontrar los 3+1 errores del Laboratorio sin usar las pistas |
| 🏅 **El Inversor** | Invertir un array en el sitio con dos punteros, a la primera |
| 🏅 **El Navajero** | Usar `toString`, `sort`, `binarySearch`, `copyOf` y `fill` en un programa |
| 🏅 **El Profe de la Clase** | Aprobar con un array de objetos: rellenar, recorrer y calcular la media |

---

## 🧠 Atrévete a pensar

1. **Sin ejecutar:** ¿qué imprime este programa?

```java
public class Misterio2 {
    public static void main(String[] args) {
        int[] datos = {4, 2, 8, 1, 6};
        int mayor = datos[0];

        for (int i = 1; i < datos.length; i++) {
            if (datos[i] > mayor) {
                mayor = datos[i];
            }
        }
        System.out.println(mayor);
    }
}
```

2. **El truco del índice:** ¿qué pasa si en el bucle de la media de `{8, 7, 9, 6}` usas `i <= notas.length - 1` en lugar de `i < notas.length`? ¿Funciona? ¿Por qué?
3. **El doble:** `int[] a = {1, 2, 3}; int[] b = a; b[0] = 99;` ¿qué vale `a[0]` después? (Pista: es el punto 5.)
4. **Verdadero o falso:** "`Arrays.sort` modifica el array original, así que conviene copiarlo antes si no quieres perder el orden inicial".

<details>
<summary>💡 Soluciones</summary>

1. Imprime **`8`**. El patrón del máximo: empieza con `datos[0]` (4) y va comparando; cuando llega al 8, lo guarda; el 1 y el 6 no le ganan.
2. **Funciona.** `i <= notas.length - 1` es exactamente lo mismo que `i < notas.length`: en ambos casos el último valor de `i` es `length - 1`. Son dos formas de escribir lo mismo, pero `i < notas.length` es la que no invita al error.
3. **`99`.** `b = a` no copia el array: copia la referencia. `a` y `b` apuntan al mismo parking, así que tocar por `b` se ve por `a`. Para copiar de verdad, `Arrays.copyOf`.
4. **Verdadero.** `Arrays.sort` ordena "en el sitio" (modifica el original). Si necesitas conservar el orden inicial, copia antes con `Arrays.copyOf`.

</details>

---

## 🧩 Crucigrama de bits

```
Horizontal:
1. Tamaño de un array, sin paréntesis (6 letras)
4. Método de la clase Arrays para comparar contenido (5 letras)

Vertical:
2. Valor por defecto de un boolean en un array (5 letras)
3. Bucle de solo lectura (3 letras + 4 letras)
5. La excepción que lanzas al salirte del array (una sola palabra muy larga)
```

<details>
<summary>📝 Soluciones</summary>

**Horizontal:** 1. LENGTH · 4. EQUALS
**Vertical:** 2. FALSE · 3. FOR EACH · 5. ARRAYINDEXOUTOFBOUNDSEXCEPTION

</details>

---

## 💬 Preguntas de entrevista de trabajo

> Preguntas reales que te harían para programador Java junior.

1. **"Explícame, como si yo fuera tu abuela, qué es un array."**
2. **"Invierte este array sin crear otro. Ahora dime cuánta memoria extra necesitas."**
3. **"¿Cuál es la diferencia entre `length`, `length()` y `size()`?"**
4. **"¿Cuándo usarías `for-each` y cuándo un `for` con índice?"**
5. **"¿Cómo comparas dos arrays para saber si tienen el mismo contenido?"**
6. **"Escribe el código que devuelve la nota más alta de un array."**

---

## 🤷 No hay preguntas tontas

> ❓ **¿Por qué el primer índice es 0 y no 1?**

Porque el índice es una **distancia** desde el principio, no un número de plaza. La primera casa está a 0 pasos de ti, no a 1. En programación, contar desde 0 evita el off-by-one en miles de cálculos (y es una convención heredada de los lenguajes más antiguos). Te parecerá raro hasta que deje de parecértelo, y entonces lo defenderás con uñas y dientes.

---

> ❓ **¿Puedo usar `Arrays.sort` y `Arrays.binarySearch` en vez de escribir los algoritmos a mano?**

En tus programas reales, sí: son rápidos y probados, y los verás por todos lados. Pero en la U05 vas a aprender **cómo funcionan por dentro** (burbuja, búsqueda binaria...) porque entender la idea es lo que te diferencia de alguien que solo importa librerías. Y en una entrevista, te pedirán el algoritmo a mano. Primero se aprende a sumar sin calculadora, ¿no?

---

> ❓ **¿Un array puede cambiar de tamaño?**

No. Es **tamaño fijo** para siempre. Cuando necesitas "más plazas", se crea un array nuevo y se copia (`Arrays.copyOf`). Si esto te parece un incordio, tienes razón: por eso existen las colecciones (`ArrayList` y compañía), que crecen solas. Las verás en la U10, y vas a abrazarlas.

---

## 🎬 Poscréditos

El programador cierra su lista de la compra: un array de 12 `String`, recorrido con un for-each, ordenado con `Arrays.sort` e impreso con `Arrays.toString`. Todo funciona a la primera. Se acerca CONRAD, el compilador cascarrabias, con su taza humeante.

**CONRAD:** — Oye, no está mal. Creas, recorres, ordenas, buscas... y encima no has salido del array ni una sola vez. ¿Seguro que eres el mismo que empezó la unidad con `gato1`, `gato2`, `gato3`?

**Novato:** — *sonríe* Empecé con 100 gatos y he terminado gestionando el parking entero con 20 líneas. ¿Y ahora qué?

**CONRAD:** — *toma un sorbo* Ahora lo interesante. Todos estos datos que guardas en arrays piden a gritos que los **busques** y los **ordenes** bien. Burbuja, búsqueda binaria, Big O... Otro tipo de bestias, y van justo después.

El novato guarda su proyecto, cierra el IDE y siente que ya no guarda datos sueltos: **piensa en aparcamientos**.

**PRÓXIMAMENTE EN U05:** Algorítmica I: Fundamentos. Los algoritmos que buscan y ordenan tus arrays, y la notación para saber cuál es rápido de solemnidad. 🧩

---

📚 [Volver al índice de la unidad](/ApuntesProgramacion/04-arrays) · **Anterior:** [08 · Array-revelde: errores comunes y depuración](/ApuntesProgramacion/04-arrays/08-array-revelde) · **Siguiente:** **[U05 · Algorítmica I: Fundamentos](/ApuntesProgramacion/05-algoritmica-fundamentos)**