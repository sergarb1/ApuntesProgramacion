---
title: "Boletín 10 - Intermedio: Consola, Ficheros y Regex"
nav_order: 10
---
*Ejercicios de dificultad progresiva. De ⭐ a ⭐⭐⭐.*

---

## ⭐ Ejercicio 1: Formateador de ticket de compra

Crea un programa que simule un ticket de compra. Usa un array de productos (nombre, precio, cantidad) y muestra un ticket formateado con `printf()`:

```
================================
    TICKET DE COMPRA
================================
Pan            2 x 1.20€ =  2.40€
Leche          3 x 0.95€ =  2.85€
Huevos         1 x 3.50€ =  3.50€
--------------------------------
TOTAL                     =  8.75€
================================
```

Requisitos: alinear nombres a la izquierda, precios a la derecha, 2 decimales, ancho fijo de columnas.

---

## ⭐ Ejercicio 2: Buscador de archivos por extensión

Crea un programa que pida una ruta de directorio y una extensión (ej: `.txt`, `.java`) y liste **recursivamente** todos los archivos con esa extensión. Usa la clase `File` y su método `listFiles()`.

Pista: Si el archivo es un directorio, llama al método de nuevo (recursión).

---

## ⭐ Ejercicio 3: Lector de CSV con Scanner

Dado un archivo `datos.csv` con el siguiente formato (sin cabecera):

```
Ana;25;DAM
Bob;22;DAW
Carlos;30;DAM
```

Usa `Scanner` con `useDelimiter()` para leer el archivo y mostrar los datos en formato tabla alineada. Usa `printf()` para formatear.

Asegúrate de que el `Scanner` maneje correctamente tanto el delimitador `;` como el salto de línea.

---

## ⭐⭐ Ejercicio 4: Filtro de líneas por palabra clave

Crea un programa que lea un archivo de texto (`origen.txt`) y escriba en `destino.txt` solo las líneas que contienen una palabra clave (pedida al usuario). Usa `BufferedReader` y `PrintWriter`.

Muestra al final cuántas líneas coincidieron y cuántas se descartaron.

---

## ⭐⭐ Ejercicio 5: Separador de líneas pares e impares

Crea un programa que lea un archivo `entrada.txt` y genere dos archivos:

- `pares.txt` → contiene las líneas en posición par (0, 2, 4...).
- `impares.txt` → contiene las líneas en posición impar (1, 3, 5...).

Usa `try-with-resources` con **tres** recursos (un `BufferedReader` y dos `PrintWriter`).

---

## ⭐⭐ Ejercicio 6: Split con regex — analizador de frases

Escribe un programa que lea una frase del usuario y use `split()` con una expresión regular para:

1. Separar las palabras (ignorando espacios, comas, puntos, signos).
2. Mostrar cuántas palabras hay.
3. Mostrar la palabra más larga.
4. Mostrar las palabras que empiezan por vocal.

Ejemplo: `"Hola, mundo. Esto es Java: ¿mola?"` →
```
Palabras: 6
Más larga: "mundo"
Empiezan por vocal: ["Esto"]
```

---

## ⭐⭐⭐ Ejercicio 7 (ProgramaMe): Validador de datos con regex

Crea un programa que lea un archivo `datos.txt` donde cada línea contiene un dato y su tipo (separados por `;`):

```
ana@email.com;email
12345678Z;dni
+34 612345678;telefono
91 123 45 67;telefono
esto-no-es-email;email
```

Valida cada línea según el tipo usando expresiones regulares:

- **Email:** formato básico `xxx@xxx.xxx`
- **DNI:** 8 dígitos + letra mayúscula (la letra debe ser válida según el algoritmo)
- **Teléfono:** opcional `+34` seguido de 9 dígitos, con o sin espacios

Muestra un resumen: cuántos válidos, cuántos inválidos, y lista los inválidos.

---

## ⭐⭐⭐ Ejercicio 8 (CodeWars + AceptaElReto)

Resuelve estos problemas que combinan ficheros, regex y consola:

**CodeWars:** [Regex validate PIN code](https://www.codewars.com/kata/55f8a9c06c018a0d6e000132) (7 kyu) — Valida que un String sea un PIN de 4 o 6 dígitos exactos.

**CodeWars:** [Exes and Ohs](https://www.codewars.com/kata/55908aad6620c066bc00002a) (7 kyu) — Cuenta si el número de X y O es el mismo en un String (puedes resolverlo con o sin regex).

**AceptaElReto:** [149 - San Fermines](https://www.aceptaelreto.com/problem/statement.php?id=149) — Lectura de múltiples casos de prueba desde consola.

---

## 📚 Referencias

- **CodeWars:** [Regex validate PIN code](https://www.codewars.com/kata/55f8a9c06c018a0d6e000132) (7 kyu)
- **CodeWars:** [Exes and Ohs](https://www.codewars.com/kata/55908aad6620c066bc00002a) (7 kyu)
- **CodeWars:** [String repeat](https://www.codewars.com/kata/57a0e5c372292dd76d000d7e) (8 kyu)
- **AceptaElReto.com:** [149 - San Fermines](https://www.aceptaelreto.com/problem/statement.php?id=149)
- **AceptaElReto.com:** [140 - Suma de dígitos](https://www.aceptaelreto.com/problem/statement.php?id=140)
- **AceptaElReto.com:** [152 - Suma pares e impares](https://www.aceptaelreto.com/problem/statement.php?id=152)
