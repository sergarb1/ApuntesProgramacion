param([string]$Dir = "src/content/docs")

$units = @{
    1 = "Introducción"; 2 = "Variables, Tipos y Operadores"; 3 = "Estructuras de Control y Excepciones"
    4 = "Algorítmica I: Fundamentos"; 5 = "Algorítmica II: Técnicas Avanzadas"
    6 = "POO: Clases y Objetos"; 7 = "Visibilidad, Encapsulación y Static"
    8 = "Herencia, Polimorfismo e Interfaces"; 9 = "Arrays y Colecciones"
    10 = "Genéricos y Mapas"; 11 = "Consola, Ficheros y Expresiones Regulares"
    12 = "Conexión a Bases de Datos con JDBC"; 13 = "Servir y Consumir APIs con Web"
    14 = "Proyecto Final — Mapa del Talento Personal"
}

$cwKatas = @{
    1 = @("Multiply (8kyu)", "Return Negative (8kyu)", "Even or Odd (8kyu)")
    2 = @("Opposite number (8kyu)", "Sum of positive (8kyu)", "String repeat (8kyu)")
    3 = @("Century From Year (8kyu)", "Count by X (8kyu)", "Bouncing Balls (6kyu)")
    4 = @("Find the unique number (6kyu)", "Array.diff (6kyu)", "Moving Zeros (5kyu)")
    5 = @("Recursive factorial (7kyu)", "Fibonacci (6kyu)", "Towers of Hanoi (5kyu)")
    6 = @("Classy Classes (8kyu)", "Building blocks (7kyu)", "Functional Addition (7kyu)")
    7 = @("Get Planet Name (8kyu)", "Simple validation (8kyu)", "Thinkful - Object drills (7kyu)")
    8 = @("Basic inheritance (7kyu)", "Fun with ES6 (6kyu)", "Interface segregation (6kyu)")
    9 = @("Find the odd int (6kyu)", "Array diff (6kyu)", "Snail (5kyu)")
    10 = @("Maps (8kyu)", "Merge arrays (7kyu)", "Maps with streams (5kyu)")
    11 = @("CamelCase (6kyu)", "File path ops (5kyu)", "Regex validate PIN (7kyu)")
    12 = @("SQL with street fighter (6kyu)", "Relational division (5kyu)", "SQL Basics (6kyu)")
    13 = @("HTTP Request (7kyu)", "REST API tester (6kyu)", "URL shortener (5kyu)")
    14 = @("Complete the project (5kyu)", "Full stack (5kyu)", "CodeWars kata creator (5kyu)")
}

$aceptaReto = @{
    1 = @("116 - ¡Hola mundo!", "117 - La fiesta", "119 - Futbolistas")
    2 = @("101 - Cuadrado", "106 - Código ASCII", "124 - ¿Cuántas horas?")
    3 = @("148 - Nochevieja", "155 - Perímetro de un rectángulo", "165 - Números pares")
    4 = @("226 - Ordenando números", "290 - La desviación", "340 - Ordenando pares")
    5 = @("233 - ¿Es un número de Harshad?", "151 - Matriz identidad", "292 - Recursivo")
    6 = @("105 - Sándwich de pavo", "107 - Aproximación pi", "301 - Punto en círculo")
    7 = @("147 - Los hijos de Don Profundo", "379 - Calculando contagiados", "417 - La clave")
    8 = @("191 - Problema 191", "208 - Tirando bolos", "335 - Cuadrado mágico")
    9 = @("102 - Encriptación", "178 - Plaga", "249 - El burro y las alforjas")
    10 = @("121 - Función Σ", "159 - Número de divisores", "231 - Suma de primos")
    11 = @("103 - Problema 103", "222 - Pasando lista", "375 - Matriz dispersa")
    12 = @("361 - SQL Injection", "403 - Base de datos", "408 - Registros repetidos")
    13 = @("443 - API REST", "450 - JSON parsing", "460 - Web scraping")
    14 = @("470 - Gestión de proyectos", "475 - Colaboración", "480 - Trabajo en equipo")
}

for ($n = 1; $n -le 14; $n++) {
    $num = '{0:d2}' -f $n
    $name = $units[$n]

    # Avanzado
    $av = @"
---
title: "Boletín $n - Avanzado: $name"
nav_order: 4
---

# Boletín $n — Avanzado: $name

Ejercicios para valientes. Sin soluciones, solo pistas.

---

## ⭐⭐⭐ Ejercicio 1: [Ejercicio avanzado sobre $name]
Descripción del ejercicio.
> 💡 Pista: [Indicio para resolverlo]

## ⭐⭐⭐ Ejercicio 2: [Ejercicio avanzado]
Descripción.
> 💡 Pista: [Indicio]

## ⭐⭐⭐ Ejercicio 3: [Ejercicio avanzado]
Descripción.
> 💡 Pista: [Indicio]

## ⭐⭐⭐ Ejercicio 4: [Ejercicio avanzado]
Descripción.
> 💡 Pista: [Indicio]

## ⭐⭐⭐ Ejercicio 5: CodeWars combinado
Resuelve la kata correspondiente a esta unidad en CodeWars.
> 💡 Pista: Lee bien el enunciado de la kata.
"@
    Set-Content -NoNewline "$Dir/boletin-$num-avanzado.md" $av

    # Extras
    $cw = $cwKatas[$n] -join "`, "
    $ar = $aceptaReto[$n] -join "`, "
    $ex = @"
---
title: "Boletín $n - Extras: $name"
nav_order: 5
---

# Boletín $n — Extras: $name

Problemas de CodeWars y AceptaElReto.

---

## 🏆 CodeWars

$($cwKatas[$n] | ForEach-Object { "- $_" }) | Out-String

## 🏆 AceptaElReto

$($aceptaReto[$n] | ForEach-Object { "- [$_](https://www.aceptaelreto.com/)" }) | Out-String

> 💡 **Consejo:** Intenta resolverlos sin mirar soluciones. Lee bien el enunciado.
"@
    Set-Content -NoNewline "$Dir/boletin-$num-extras.md" $ex
    Write-Host "Created $num avanzado + extras"
}

Write-Host "`nDone generando boletines avanzado y extras en $Dir" -ForegroundColor Green
