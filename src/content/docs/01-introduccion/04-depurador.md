---
title: "04 — El depurador: detective de código"
description: Visión de rayos X para tu código 🕵️
---

<p><small>Visión de rayos X para tu código 🕵️</small></p>

> 🗺️ **Estás en:** 🚀 **U01 · Introducción a Java** → 04 · El depurador

---

## 📬 La idea en una frase

> **El depurador (debugger) es como tener visión de rayos X para tu código: para el programa donde tú quieres y te enseña el valor de cada variable en cada instante.**

Tu primer programa funciona. Pero pronto tendrás un programa raro: una variable `edad` que sale 25 cuando debería salir 18. ¿Qué haces? ¿Le pegas al ordenador? No. Usas el **depurador**.

---

## 🔍 ¿Qué es depurar?

Depurar (debug) es **quitarle los bichos** (bugs) al programa. Y el secreto de los programadores experimentados no es adivinar: es **ver**. El depurador te permite:

- **Parar** el programa en una línea concreta.
- **Avanzar** instrucción a instrucción.
- **Inspeccionar** el valor de las variables en cada momento.
- **Modificar** valores sobre la marcha en algunos entornos.

Es como ver una serie de crímenes en cámara lenta: puedes pausar, rebobinar (no del todo), y observar quién hace qué.

> 💡 **Detalle práctico:** los errores se dividen en dos familias. Los de *compilación* los atrapa `javac` y te dice la línea (punto 7). Los de *lógica* compilan perfecto pero hacen lo que no deben: para esos no hay mejor arma que el depurador.

---

## 🛠️ Las cuatro herramientas del detective

| Herramienta | Atajo (IntelliJ/VS Code) | Qué hace |
|---|---|---|
| **Breakpoint** (punto de ruptura) | clic en el margen | Le dices a Java "para AQUÍ, quiero ver qué pasa" |
| **Step Over** | F8 | "Ejecuta esta línea pero no me cuentes los detalles internos" |
| **Step Into** | F7 | "Ejecuta esta línea Y llévame dentro de esa llamada, quiero espiar" |
| **Watch / Variables** | panel lateral | "Enséñame el valor de la variable AHORA MISMO" |

- **Breakpoint**: marca una línea. El programa se detiene justo antes de ejecutarla y espera tus órdenes.
- **Step Over (F8)**: ejecuta la línea completa de golpe, sin entrar en los métodos que llame.
- **Step Into (F7)**: entra *dentro* del método llamado para ver sus líneas una a una.
- **Watch**: el panel que muestra las variables vivas y sus valores actuales. También puedes escribir una expresión y ver qué devuelve.

> ⚠️ **Advertencia:** si te pierdes dentro de un método ajeno con Step Into, usa **Step Out** (Shift+F8 en IntelliJ): sale del método y vuelve al punto donde lo llamaste. Es el botón "he entrado sin querer, sacadme de aquí".

---

## 🏫 Ejemplo guiado: el caso del sospechoso

Aquí tienes un programa perfecto para estrenar el depurador:

```java
public class DetectivesDeCodigo {
    public static void main(String[] args) {
        int sospechoso = 0;
        for (int i = 0; i < 10; i++) {
            sospechoso += i;  // Pon un breakpoint aquí
        }
        System.out.println("El culpable es: " + sospechoso);
    }
}
```

El bucle `for` lo verás a fondo en la U03, pero puedes intuirlo: repite la línea de dentro mientras `i` sea menor que 10, con `i` valiendo 0, 1, 2... La línea clave es `sospechoso += i` (que es lo mismo que `sospechoso = sospechoso + i`).

**El ejercicio de detective:**

1. Pon un **breakpoint** en la línea de `sospechoso += i` (clic en el margen, aparece un punto rojo).
2. Ejecuta en **modo depuración** (el botón del bichito 🐞, no el de ▶).
3. El programa se detiene. Mira el panel **Variables**: `sospechoso` vale 0 y `i` vale 0.
4. Pulsa **Step Over (F8)** varias veces y observa cómo cambian `sospechoso` e `i` en cada vuelta.

<details>
<summary>🔄 Qué deberías ver</summary>

Valores de `sospechoso` en cada parada: 0, 1, 3, 6, 10, 15, 21, 28, 36, 45 y, al terminar el bucle, **55**. El valor final impreso es "El culpable es: 55". Si en tu depurador el valor no coincide, tienes delante un bug real que diagnosticar. Eso es depurar.

</details>

---

## 🧠 La regla de oro del depurador

Cuando algo falla, **no adivines: observa**. El proceso es siempre el mismo:

1. **Reproduce** el fallo (que ocurra siempre que puedas).
2. Pon un breakpoint **antes** de la zona sospechosa.
3. **Avanza** con F8 y **observa** variables hasta localizar la línea donde el valor se tuerce.
4. En cuanto veas dónde se desvía el valor, habrás encontrado el bug.

> 💡 **Consejo:** si el programa se ejecuta hasta el final sin detenerse, es que el breakpoint está en una línea que **nunca se alcanza** (por ejemplo, dentro de un método que nadie llama, como el `saludo()` del punto 3). El breakpoint no se dispara: otra pista de detective.

---

## 🎯 Mini-chequeo

1. ¿Qué diferencia hay entre **Step Over** y **Step Into**?
2. Si pones un breakpoint y el programa no se detiene, ¿qué sospechas?
3. ¿En qué modo hay que ejecutar el programa para que los breakpoints funcionen?

<details>
<summary>🔄 Respuestas</summary>

1. **Step Over** ejecuta la línea entera sin entrar en los métodos que llama; **Step Into** entra dentro del método para ver sus líneas una a una.
2. Que el breakpoint está en una línea que **nunca se ejecuta** (código muerto, método no llamado, condición que no se cumple).
3. En **modo depuración** (el botón del bicho 🐞), no en el modo ejecución normal (▶).

</details>

---

## ✅ Resumen en 3 frases

1. El depurador para el programa donde tú marcas (**breakpoint**) y te muestra las variables en vivo.
2. **Step Over** no entra en los métodos; **Step Into** sí; **Watch** te muestra los valores.
3. Ante un bug, no adivines: **reproduce, para, avanza y observa** hasta encontrar dónde se tuerce el valor.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Bug | Un error en el programa |
> | Debug | Proceso de encontrar y arreglar bugs |
> | Breakpoint | Marca donde el programa se detiene |
> | Step Over / Into | Avanzar sin entrar / entrando en métodos |
> | Watch | Panel que muestra variables y expresiones |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/01-introduccion) · **Anterior:** [03 · Tu primer programa](/ApuntesProgramacion/01-introduccion/03-hola-mundo) · **Siguiente:** [05 · Comentarios y documentación](/ApuntesProgramacion/01-introduccion/05-comentarios)