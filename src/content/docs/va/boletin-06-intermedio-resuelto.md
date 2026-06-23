---
title: "Boletín 4 - Resuelto: POO - Clases y Objetos"
nav_order: 12
---
Ejercicios progresivos. De crear tu primera clase a competir en AceptaElReto con objetos. Ponte el cinturón que la POO acelera.

---

## ⭐ Ejercicio 1: Clase Rectángulo

Crea una clase `Rectangulo` con `ancho` y `alto` (double). Constructor parametrizado, `calcularArea()`, `calcularPerimetro()`. Sobrescribe `toString()`.

> **💡 Explicación:** El constructor asigna ancho y alto. Los métodos calculan área y perímetro con fórmulas básicas. `toString()` devuelve una representación legible del objeto. Sin `toString()`, Java imprimiría algo como `Rectangulo@2f92e0f4` (la clase y una dirección de memoria). Con `toString()`, imprime `Rectángulo [5 x 3]`. Sobrescribir `toString()` es una de las mejores prácticas de Java: tu yo del futuro (y tu profesor) te lo agradecerán cuando depures.

---

## ⭐ Ejercicio 2: Clase CuentaBancaria

`CuentaBancaria` con `titular`, `saldo`, `numeroCuenta`. Dos constructores: solo titular (saldo 0) o titular + saldo. Métodos `ingresar(double)` y `retirar(double)` (valida saldo suficiente). `toString()`.

> **💡 Explicación:** Usamos sobrecarga de constructores: uno llama al otro con `this(titular, 0)`. El número de cuenta se genera automáticamente con un contador estático (cada cuenta nueva tiene un número distinto). `ingresar` solo acepta cantidades positivas. `retirar` valida que haya saldo suficiente. Es como un cajero automático de verdad, pero sin colas ni comisiones. La validación evita que te quedes en números rojos. Bueno, o al menos te avisa.

---

## ⭐⭐ Ejercicio 3: Clase Hora con validación

`Hora` con `hora` (0-23), `minuto` (0-59), `segundo` (0-59). Constructor con validación (lanza `IllegalArgumentException`). `incrementarSegundo()` que maneje desbordamientos.

> **💡 Explicación:** El constructor valida que hora, minuto y segundo estén en rangos válidos. Si no, lanza una `IllegalArgumentException` (una excepción unchecked que no necesita try-catch, pero mata el programa si no la capturas). `incrementarSegundo()` suma 1 segundo y maneja los desbordamientos: si segundo llega a 60, pasa a 0 y aumenta minuto; igual con minuto→hora→día. Ejemplo: 23:59:59 + 1 segundo → 00:00:00. Es como un reloj digital, pero sin pilas.

---

## ⭐⭐ Ejercicio 4: equals() en Persona

Sobrescribe `equals()` en la clase `Persona` para que dos personas sean iguales si tienen el mismo nombre y edad.

> **💡 Explicación:** Sin `equals()`, comparar objetos con `equals` es lo mismo que con `==` (comparan referencias, no contenido). Aquí sobrescribimos `equals` para que compare nombre y edad. `Objects.equals(nombre, persona.nombre)` es seguro porque maneja nulls. `hashCode()` debe sobrescribirse siempre que sobrescribas `equals` (contrato de Java). Si no, las colecciones como `HashSet` o `HashMap` se comportarán de forma extraña. Es como el jamón y el queso: `equals` y `hashCode` van juntos.

---

## ⭐⭐ Ejercicio 5: Clase Punto y distancia euclídea

`Punto` con `x` e `y` (int). Constructor, getters, `distancia(Punto otro)` (distancia euclídea), `toString()`. Calcula el perímetro de un triángulo dados 3 puntos.

> **💡 Explicación:** La distancia euclídea entre dos puntos es la raíz cuadrada de (dx² + dy²). Con `Math.sqrt()` lo calculamos. El perímetro del triángulo es la suma de las distancias entre cada par de puntos. El triángulo (0,0)-(3,0)-(0,4) es un triángulo rectángulo clásico de lados 3, 4 y 5 (hipotenusa). Perímetro = 3 + 4 + 5 = 12. La POO permite tratar los puntos como objetos con comportamientos. En lugar de tener funciones sueltas `distancia(x1,y1,x2,y2)`, tenemos `a.distancia(b)`. Mucho más limpio.

---

## ⭐⭐⭐ Ejercicio 6: AceptaElReto 417 — Números binomiales

Resuelve el problema **417 — Números binomiales** en AceptaElReto.

Dados dos números n y k, calcula el coeficiente binomial "n sobre k". Usa una función recursiva o iterativa.

> **💡 Explicación:** El coeficiente binomial "n sobre k" cuenta cuántas formas hay de elegir k elementos de un conjunto de n. La fórmula iterativa es más eficiente que la recursiva (evita calcular factoriales enormes). Usamos la propiedad de simetría: si k > n-k, usamos n-k (reduce iteraciones). El bucle va acumulando el resultado multiplicando y dividiendo para evitar números muy grandes. El problema lee pares (n,k) hasta encontrar (0,0). Es un problema clásico de combinatoria, muy común en olimpiadas de programación.

---

## ⭐⭐⭐ Ejercicio 7: AceptaElReto 458 — El espejo

Resuelve el problema **458 — El espejo** en AceptaElReto.

Dada una hora en formato "HH:MM", calcula cuántos minutos faltan para la siguiente hora que sea un "espejo" (palíndromo). Ejemplo: 10:01 es espejo, 23:32 también.

> **💡 Explicación:** Un "espejo" significa que la hora y los minutos se reflejan: las decenas de la hora son las unidades de los minutos, y viceversa. 10:01 → 1=1 y 0=0 → es espejo. 12:21 → 1=1 y 2=2 → es espejo. El bucle incrementa minutos de 1 en 1 hasta encontrar una hora espejo, manejando el desbordamiento de minutos y horas. Es una búsqueda exhaustiva pero con máximo 60*24=1440 iteraciones, que es trivial. El espejo más cercano a 23:32 (que ya es espejo) es 0 minutos. Para 23:33, el siguiente espejo es 0:00 (27 minutos después). Mírate al espejo y verás la solución.

---

## ⭐⭐⭐ Ejercicio 8: Simulación de batalla Pokémon (lite)

Crea una clase `Pokemon` con `nombre`, `vida`, `ataque`. Método `atacar(Pokemon otro)` que resta `this.ataque` a la vida del otro. Crea dos pokémon y simula una batalla por turnos hasta que uno se quede sin vida.

> **💡 Explicación:** Cada Pokémon tiene nombre, vida y ataque. El método `atacar` resta el ataque del atacante a la vida del defensor. La batalla alterna turnos. El bucle continúa mientras ambos estén vivos. Cuando uno llega a 0 de vida, `estaVivo()` devuelve false y el bucle termina. Es una versión muy simplificada de un juego de lucha. Podrías añadir defensa, tipos, habilidades especiales... pero eso ya es cosa tuya. Este ejercicio demuestra cómo la POO permite modelar entidades del mundo real (o de mundos ficticios) de forma natural. Cada Pokémon es un objeto independiente con sus propios datos y comportamientos.

---

## 📚 Referencias

| Plataforma | Problema | Dificultad |
|---|---|---|
| AceptaElReto | 291 — Números afortunados | Fácil |
| AceptaElReto | 417 — Números binomiales | Medio |
| AceptaElReto | 458 — El espejo | Medio |
| CodeWars | Grasshopper - Summation (8 kyu) | Principiante |
| CodeWars | Basic variable assignment (8 kyu) | Principiante |
