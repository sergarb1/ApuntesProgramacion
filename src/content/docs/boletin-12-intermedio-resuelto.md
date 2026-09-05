---
title: "Boletín 12 - Resuelto: Ficheros y Regex"
nav_order: 12
---
*Dificultad progresiva. De ⭐ a ⭐⭐⭐.*

---

## ⭐ Ejercicio 1: El diario personal (append)

Crea un programa que escriba en un archivo `diario.txt` una línea con la fecha y el texto que el usuario introduzca. Cada ejecución debe añadir una nueva entrada al final sin borrar las anteriores. Usa `FileWriter` en modo append.

---

## ⭐⭐ Ejercicio 2: El contador de líneas, palabras y caracteres

Crea un programa que lea un archivo de texto y muestre cuántas líneas, palabras y caracteres tiene. Usa `BufferedReader` para leer.

---

## ⭐⭐ Ejercicio 3: El gestor de contactos (archivo)

Crea un programa con menú que permita: añadir un contacto (nombre, teléfono) a `contactos.txt`, listar todos los contactos, buscar un contacto por nombre. Usa `BufferedReader` y `PrintWriter`. Formatea con `printf()`.

---

## ⭐⭐ Ejercicio 4: Lectura con NIO (Files y Paths)

Reescribe el ejercicio del contador de líneas usando la API NIO (`Files.readAllLines()` y `Path`). Compara la diferencia.

---

## ⭐⭐⭐ Ejercicio 5 (ProgramaMe): Cifrado César con archivos

Crea un programa que lea un archivo `mensaje.txt`, desplace cada carácter 3 posiciones en el alfabeto (cifrado César) y escriba el resultado en `mensaje_cifrado.txt`. Luego, otro programa (o el mismo con una opción) que lo descifre. Usa try-with-resources y BufferedReader/PrintWriter.

---

## ⭐⭐⭐ Ejercicio 6 (ProgramaMe): Serialización de objetos

Crea una clase `Estudiante` que implemente `Serializable` con `String nombre`, `int edad`, `double notaMedia`. Crea un programa que guarde un `ArrayList<Estudiante>` en un archivo `estudiantes.dat` usando `ObjectOutputStream`. Luego, otro programa (o el mismo con opción) que lo lea con `ObjectInputStream` y muestre los datos formateados.

---

## 🔗 Referencias para seguir practicando

- **CodeWars:** [Get the Middle Character](https://www.codewars.com/kata/56747fd5cb988479af000028) (7 kyu)
- **CodeWars:** [String repeat](https://www.codewars.com/kata/57a0e5c372292dd76d000d7e) (8 kyu)
- **CodeWars:** [Exes and Ohs](https://www.codewars.com/kata/55908aad6620c066bc00002a) (7 kyu)
- **AceptaElReto.com:** [140 - Suma de dígitos](https://www.aceptaelreto.com/problem/statement.php?id=140)
- **AceptaElReto.com:** [149 - San Fermines](https://www.aceptaelreto.com/problem/statement.php?id=149)
- **AceptaElReto.com:** [152 - Suma pares e impares](https://www.aceptaelreto.com/problem/statement.php?id=152)