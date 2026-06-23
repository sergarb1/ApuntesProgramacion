---
title: "Boletín 13 - Inicial: Servir y Consumir APIs con Web"
nav_order: 13
---
Calienta motores con HttpServer. Prometo que ningún bit saldrá herido.

---

## Ejercicio 1: Servidor de la hora

Crea un servidor HTTP en el puerto 8080 con una ruta `/hora` que devuelva la hora actual en texto plano con formato `HH:mm:ss`.

Cada vez que recargues el navegador, la hora cambia. Magia negra con `LocalTime.now()`.

```java
// Pista:
String hora = java.time.LocalTime.now().format(
    java.time.format.DateTimeFormatter.ofPattern("HH:mm:ss")
);
```

---

## Ejercicio 2: Página que dice tu nombre

Añade una ruta `/saludo?nombre=Pepe` que devuelva una página HTML con `<h1>¡Hola, Pepe!</h1>`.

Si no se pasa nombre, que diga `¡Hola, desconocido!`.

> Pista: `e.getRequestURI().getQuery()` te da `nombre=Pepe`. Divide por `=` y listo.

---

## Ejercicio 3: Contador de visitas global

Usa una variable `static int visitas = 0`. Cada vez que alguien visita `/`, incrementa el contador y devuelve:

```
Eres el visitante número 47
```

¿Qué pasa si dos personas recargan a la vez? (spoiler: problemas — pero de momento no te preocupes).

---

## Ejercicio 4: Generador de excusas para entregas tarde

Crea rutas `/excusa` que devuelva una excusa generada aleatoriamente combinando elementos de tres arrays:

```java
String[] sujetos = {"Mi perro", "GitHub", "El plugin de IntelliJ", "La conexión"};
String[] verbos  = {"se comió", "borró", "corrompió", "perdió"};
String[] objetos = {"el examen", "la práctica", "los apuntes", "mi paciencia"};
```

Ejemplo: *"GitHub borró la práctica"*. Devuélvelo en HTML con buena letra.

---

## Ejercicio 5: Tabla de multiplicar personalizada

Ruta `/tabla?num=7` que genere una tabla HTML completa con la tabla de multiplicar del 7 (del 7×1 al 7×10).

Si no se pasa número, usa el 5 por defecto. Formatea la tabla con `border=1` y colores alternos en las filas.

---

## Ejercicio 6: Página de estado del servidor

Ruta `/estado` que devuelva un JSON con esta pinta:

```json
{
    "servidor": "ok",
    "hora": "14:30:01",
    "visitas": 47,
    "version": "1.0",
    "autor": "Tu nombre aquí"
}
```

No olvides el `Content-Type: application/json` o el navegador se pondrá tonto.

---

## Ejercicio 7: Conversor de euros a pesetas (sí, pesetas)

Ruta `/conversor?euros=50` que devuelva HTML con el resultado: "50 euros son 8319.3 pesetas".

1 € = 166.386 pts. Muestra dos decimales.

> Pista: `String.format("%.2f", valor)` para los decimales. Sí, pesetas. Si eres joven, pregúntale a un viejo qué era eso.

---

## 📚 Referencias

- **CodeWars:** [Decode the Morse code](https://www.codewars.com/kata/54b724efac3d5402db00065e) (6 kyu)
- **AceptaElReto:** [396 - ¿Cuántos días faltan?](https://www.aceptaelreto.com/problem/statement.php?id=396) (⭐⭐)
- **Documentación Oracle:** [HttpServer](https://docs.oracle.com/en/java/javase/21/docs/api/jdk.httpserver/com/sun/net/httpserver/HttpServer.html)
