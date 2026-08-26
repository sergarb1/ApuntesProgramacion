---
title: Boletín U01 — Avanzado
description: Ejercicios de dificultad progresiva para exprimir la unidad
---

# 📝 Boletín U01 — Avanzado

> Dificultad progresiva. ⭐ para calentar, ⭐⭐ para pensar, ⭐⭐⭐ para concursar. Cada ejercicio incluye una pista (resiste a mirarla).

---

## ⭐ Ejercicio 1: ASCII art con prints

Escribe un programa que dibuje esta figura usando combinaciones de `System.out.print` y `System.out.println`:

```
  *
 ***
*****
 ***
  *
```

Debes usar exactamente **5 líneas de código** (una por cada fila), combinando `print` y `println` sin usar bucles.

**Pista:** el `print` no salta de línea y el `println` sí. Piensa qué fila debe empezar nueva línea y cuál no.

---

## ⭐ Ejercicio 2: Sin ejecutar — secuencias de escape

¿Qué imprime exactamente este programa? Escribe la salida carácter por carácter.

```java
public class EscapeRoom {
    public static void main(String[] args) {
        System.out.println("Java\n\tmola\n\"mucho\"");
        System.out.println("C:\\carpeta\\archivo.java");
    }
}
```

**Pista:** `\n` salta de línea, `\t` tabula, `\"` imprime una comilla y `\\` imprime una barra invertida. Cuenta cada carácter del texto entre comillas como lo leería la máquina, no como lo escribes.

---

## ⭐⭐ Ejercicio 3: El reloj de milisegundos

`System.currentTimeMillis()` devuelve el número de milisegundos desde el 1 de enero de 1970 (la "epoch" de Unix). Escribe un programa que:

1. Capture el momento actual con `long inicio = System.currentTimeMillis();`
2. Haga una pausa artificial (un bucle que cuente hasta 100.000.000 para perder tiempo)
3. Capture el momento después con `long fin = System.currentTimeMillis();`
4. Muestre cuántos milisegundos han pasado

**Pista:** la resta `fin - inicio` te da los milisegundos transcurridos. No te preocupes si el tiempo varía cada vez: depende de la velocidad de tu ordenador.

---

## ⭐⭐ Ejercicio 4: Contador de argumentos

Escribe un programa llamado `ContadorArgs` que reciba argumentos desde la línea de comandos y muestre:

- Cuántos argumentos se recibieron
- El primer argumento (si existe)
- El último argumento (si existe)

Si no se reciben argumentos, debe mostrar: "No se recibieron argumentos. Programa cancelado por falta de datos."

Ejemplo de ejecución:

```
> java ContadorArgs hola mundo cruel
Argumentos recibidos: 3
Primer argumento: hola
Último argumento: cruel
```

**Pista:** el último argumento es `args[args.length - 1]` (porque el primer elemento es el índice 0). Comprueba antes que `args.length > 0`.

---

## ⭐⭐⭐ Ejercicio 5: La edad cósmica

La Tierra tarda 365.25 días en orbitar el Sol. Mercurio tarda 87.97 días. Escribe un programa que, usando constantes `final`:

1. Declare `final double DIAS_TIERRA = 365.25;`
2. Declare `final double DIAS_MERCURIO = 87.97;`
3. Almacene en una variable `int edadTerrestre = 20` (tu edad en años terrestres)
4. Calcule los años que tendrías en Mercurio (divide los días terrestres vividos entre los días de Mercurio)
5. Muestre: "En la Tierra tengo X años. En Mercurio tendría Y años."

Para calcular los días vividos en la Tierra: `diasVividos = edadTerrestre * DIAS_TIERRA`.

**Pista:** los años en Mercurio serán un `double` (el resultado de dividir dos `double`). La división `diasVividos / DIAS_MERCURIO` te lo da.

---

## ⭐⭐⭐ Ejercicio 6: CodeWars — Grasshopper - Summation

Resuelve la kata **"Grasshopper - Summation"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/55d24f55d7dd296eb9000030).

Suma todos los números del 1 hasta n. Si n = 4, devuelve 1+2+3+4 = 10.

**Pista:** hay una fórmula matemática (n * (n + 1) / 2), pero también puedes hacerlo con un bucle aunque no lo hayamos visto oficialmente. El método recibirá un `int n` y deberá devolver un `int`.

---

## ⭐⭐⭐ Ejercicio 7: AceptaElReto — 119 Futbolistas

Resuelve el problema **119 — Futbolistas** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=119).

Lee los minutos que juega cada futbolista y determina cuántos partidos completos (90 minutos) ha jugado cada uno.

**Pista:** cada caso de prueba termina cuando aparece un -1. Necesitarás leer números hasta encontrar el marcador de fin y sumar los minutos de cada futbolista.

---

## ⭐⭐⭐ Ejercicio 8: Javadoc de campeonato

Escribe una clase `SobreMi` totalmente documentada:

1. Clase con Javadoc (`@author`, `@version`).
2. Método `main` con Javadoc (`@param args`).
3. Dentro del `main`, un comentario de una línea que explique *por qué* (no *qué*) imprimes tu motivación.
4. Un comentario de bloque que explique qué hace tu programa a grandes rasgos.
5. Imprime tu nombre, tu motivación y cuántos argumentos recibiste.

**Pista:** recuerda que los comentarios Javadoc van justo **antes** de la clase y del método. Genera la documentación con `javadoc SobreMi.java` y abre los `.html` que se generen.

---

## 📚 Referencias

| Plataforma | Problema | Dificultad |
|---|---|---|
| AceptaElReto | 116 — ¡Hola mundo! | Principiante |
| AceptaElReto | 119 — Futbolistas | Fácil |
| AceptaElReto | 114 — Último dígito del factorial | Medio |
| CodeWars | Square(n) Sum (8 kyu) | Principiante |
| CodeWars | Grasshopper - Summation (8 kyu) | Principiante |