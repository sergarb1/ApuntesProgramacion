---
title: "Boletín U12 — Avanzado"
description: "Ejercicios de dificultad progresiva para exprimir ficheros y expresiones regulares"
---

# 📝 Boletín U12 — Avanzado

> Dificultad progresiva. ⭐ para calentar, ⭐⭐ para pensar, ⭐⭐⭐ para concursar. Cada ejercicio incluye una pista (resiste a mirarla).

---

## ⭐ Ejercicio 1: Buscador de archivos por extensión

Crea un programa que pida una ruta de directorio y una extensión (ej: `.txt`, `.java`) y liste **recursivamente** todos los archivos con esa extensión. Usa la clase `File` y su método `listFiles()`.

**Pista:** si el archivo es un directorio, llama al método de nuevo (recursión). Recuerda comprobar `isDirectory()` antes de `listFiles()`.

---

## ⭐ Ejercicio 2: Lector de CSV con Scanner

Dado un archivo `datos.csv` con el siguiente formato (sin cabecera):

```
Ana;25;DAM
Bob;22;DAW
Carlos;30;DAM
```

Usa `Scanner` con `useDelimiter()` para leer el archivo y mostrar los datos en formato de tabla alineada con `printf()`.

**Pista:** `useDelimiter(";|\\R")` corta por `;` o por salto de línea. Repasa los formatos de `printf` en la U02, punto 7.

---

## ⭐⭐ Ejercicio 3: Filtro de líneas por palabra clave

Crea un programa que lea un archivo de texto (`origen.txt`) y escriba en `destino.txt` solo las líneas que contienen una palabra clave (pedida al usuario). Usa `BufferedReader` y `PrintWriter`. Muestra al final cuántas líneas coincidieron y cuántas se descartaron.

**Pista:** la comprobación es `linea.contains(palabraClave)`. Lleva dos contadores.

---

## ⭐⭐ Ejercicio 4: Separador de líneas pares e impares

Crea un programa que lea un archivo `entrada.txt` y genere dos archivos:

- `pares.txt` → contiene las líneas en posición par (0, 2, 4...).
- `impares.txt` → contiene las líneas en posición impar (1, 3, 5...).

Usa `try-with-resources` con **tres** recursos (un `BufferedReader` y dos `PrintWriter`).

**Pista:** los tres recursos van entre los paréntesis del `try`, separados por `;`. Usa `% 2` sobre el número de línea.

---

## ⭐⭐ Ejercicio 5: Split con regex — analizador de frases

Escribe un programa que lea una frase del usuario y use `split()` con una expresión regular para:

1. Separar las palabras (ignorando espacios, comas, puntos y signos).
2. Mostrar cuántas palabras hay.
3. Mostrar la palabra más larga.
4. Mostrar las palabras que empiezan por vocal.

Ejemplo: `"Hola, mundo. Esto es Java: ¿mola?"` →

```
Palabras: 6
Más larga: "mundo"
Empiezan por vocal: ["Esto"]
```

**Pista:** el separador que ignora todo lo que no sea letra es `"[^a-zA-ZáéíóúüñÑ]+"`. Para las vocales, comprueba la primera letra con `matches("[aeiouAEIOUáéíóú]")` o con un `indexOf` sobre una cadena de vocales.

---

## ⭐⭐⭐ Ejercicio 6 (ProgramaMe): Validador de datos con regex

Crea un programa que lea un archivo `datos.txt` donde cada línea contiene un dato y su tipo (separados por `;`):

```
ana@email.com;email
12345678Z;dni
+34 612345678;telefono
91 123 45 67;telefono
esto-no-es-email;email
```

Valida cada línea según el tipo usando expresiones regulares:

- **Correo:** formato básico `xxx@xxx.xxx`.
- **DNI:** 8 dígitos + letra mayúscula (la letra debe ser válida según el algoritmo módulo 23).
- **Teléfono:** opcional `+34` seguido de 9 dígitos, con o sin espacios.

Muestra un resumen: cuántos válidos, cuántos inválidos, y lista los inválidos.

**Pista:** para cada línea, haz `linea.split(";")`, mira el tipo con `equals` y aplica el patrón correspondiente con `matches()`.

---

## ⭐⭐⭐ Ejercicio 7: Cifrado César con archivos

Crea un programa que lea un archivo `mensaje.txt`, desplace cada carácter **3 posiciones** en el alfabeto (cifrado César) y escriba el resultado en `mensaje_cifrado.txt`. Luego, otro programa (o el mismo con una opción) que lo descifre. Usa `try-with-resources` y `BufferedReader`/`PrintWriter`.

**Pista:** por cada `char`, si es letra haz `(char) (c + 3)` y cuidado con los extremos (la `z` debe volver a la `a`: usa `% 26` sobre la posición en el alfabeto).

---

## ⭐⭐⭐ Ejercicio 8: Serialización de estudiantes

Crea una clase `Estudiante` que implemente `Serializable` con `String nombre`, `int edad` y `double notaMedia`. Crea un programa que guarde un `ArrayList<Estudiante>` en un archivo `estudiantes.dat` usando `ObjectOutputStream`. Luego, otro programa (o el mismo con una opción) que lo lea con `ObjectInputStream` y muestre los datos formateados.

**Pista:** acuérdate del `serialVersionUID`. El `readObject()` devuelve `Object`: haz el casting a `List<Estudiante>` con calma y comprueba que no sea `null`.

---

## ⭐⭐ Ejercicio 9: El contador de líneas, palabras y caracteres

Crea un programa que lea un archivo de texto y muestre cuántas líneas, palabras y caracteres tiene. Usa `BufferedReader` para leer.

**Pista:** cada línea suma 1 al contador de líneas y `linea.length()` al de caracteres; para las palabras, `linea.split("\\s+").length` (con cuidado con las líneas vacías).

**Reto extra:** resuélvelo también con NIO (`Files.readAllLines`) y compara la diferencia.