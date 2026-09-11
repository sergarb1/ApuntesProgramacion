---
title: "04 — El depurador"
description: "Breakpoints, step over/into, watch 🐛"
---

<p><small>Breakpoints, step over/into, watch 🐛</small></p>

> 🗺️ **Estás en:** 🚀 **U01 · Introducción a Java** → 04 · El depurador

---

El depurador (debugger) es como tener visión de rayos X para tu código: para el programa donde tú quieres y te enseña el valor de cada variable en cada instante.

Tu primer programa funciona. Pero pronto tendrás un programa raro: una variable `edad` que sale 25 cuando debería salir 18. ¿Qué haces? ¿Le pegas al ordenador? No. Usas el depurador.

---

## 🔍 ¿Qué es depurar?

Depurar (debug) es sacarle los bichos (bugs) al programa. Y el secreto de los programadores experimentados no es adivinar: es ver. El depurador te permite:

- Parar el programa en una línea concreta.
- Avanzar instrucción a instrucción.
- Inspeccionar el valor de las variables en cada momento.
- Modificar valores sobre la marcha.

Es como ver una serie de crímenes en cámara lenta: puedes pausar, observar quién hace qué, y analizar cada detalle.

💡 **Detalle práctico:** Los errores se dividen en dos familias. Los de compilación los atrapa `javac` (o el propio VS Code resaltándolo en rojo) y te dice la línea. Los de lógica compilan perfecto pero hacen lo que no deben: para esos no hay mejor arma que el depurador.

---

## 🛠️ Las cuatro herramientas del detective en VS Code

| Herramienta | Atajo (VS Code) | Qué hace |
| --- | --- | --- |
| **Breakpoint (punto de ruptura)** | Clic a la izquierda del número de línea | Le dices a Java "para AQUÍ, quiero ver qué pasa". |
| **Step Over** | F10 | "Ejecuta esta línea pero no me cuentes los detalles internos". |
| **Step Into** | F11 | "Ejecuta esta línea Y llévame dentro de esa llamada, quiero espiar". |
| **Variables / Watch** | Panel lateral de depuración | "Enséñame el valor de la variable AHORA MISMO". |

- **Breakpoint**: Marca una línea con un punto rojo. El programa se detiene justo antes de ejecutarla y espera tus órdenes.
- **Step Over (F10):** Ejecuta la línea completa de golpe, sin entrar en los métodos que llama.
- **Step Into (F11):** Entra dentro del método llamado para ver sus líneas una a una.
- **Variables / Watch:** El panel izquierdo en la vista de depuración de VS Code (Run and Debug) que muestra las variables vivas y sus valores actuales. En Watch puedes añadir expresiones concretas para evaluarlas en tiempo real.

⚠️ **Advertencia:** Si te pierdes dentro de un método ajeno con Step Into, pulsa Step Out (`Shift + F11`): sales del método y vuelves al punto donde lo llamaste. Es el botón "he entrado sin querer, sáquenme de aquí".

---

## 🏫 Ejemplo guiado: el caso del sospechoso en VS Code

Aquí tienes un programa perfecto para estrenar el depurador:

```java
public class DetectivesDeCodigo {
    public static void main(String[] args) {
        int sospechoso = 0;
        for (int i = 0; i < 10; i++) {
            sospechoso += i; // Pon un breakpoint aquí
        }
        System.out.println("El culpable es: " + sospechoso);
    }
}
```

El bucle `for` lo verás a fondo en la U03, pero lo puedes intuir: repite la línea de dentro mientras `i` sea menor que 10, con `i` valiendo 0, 1, 2... La línea clave es `sospechoso += i` (que es lo mismo que `sospechoso = sospechoso + i`).

**El ejercicio de detective:**

1. Pon un breakpoint en la línea de `sospechoso += i` (haz clic a la izquierda del número de línea; aparecerá un punto rojo fijo).
2. Ejecuta en modo depuración: pulsa `F5` o haz clic en el icono del bicho con el triángulo ▶ (Run and Debug / Start Debugging) en la barra flotante superior o en la pestaña izquierda.
3. El programa se detiene y esa línea se ilumina en amarillo. Mira el panel Variables a la izquierda: verás que `sospechoso` vale 0 e `i` vale 0.
4. Pulsa Step Over (`F10`) varias veces y observa cómo cambian `sospechoso` e `i` en el panel lateral en cada vuelta.

### 🔄 Qué deberías ver

Valores de `sospechoso` en cada parada: 0, 1, 3, 6, 10, 15, 21, 28, 36, 45 y, al terminar el bucle, 55. El valor final impreso en la terminal de VS Code es "El culpable es: 55". Si en tu depurador el valor no coincide, tienes delante un bug real para diagnosticar. Esto es depurar.

---

## 🧠 La regla de oro del depurador

Cuando algo falla, no adivines: observa. El proceso es siempre el mismo:

1. Reproduce el fallo (que ocurra siempre que puedas).
2. Pon un breakpoint antes de la zona sospechosa.
3. Avanza con `F10` y observa las variables en el panel lateral hasta localizar la línea donde el valor se tuerce.
4. Al ver dónde se desvía el valor, habrás encontrado el bug.

💡 **Consejo:** Si el programa se ejecuta hasta el final sin detenerse, es que el breakpoint está en una línea que nunca se alcanza (por ejemplo, dentro de un método que nadie llama o en una condición `if` que no se cumple). El breakpoint no se dispara: otra pista de detective.

---

## 🎯 Mini-comprobación

1. ¿Cuál es la diferencia entre Step Over (F10) y Step Into (F11)?
2. Si pones un breakpoint y el programa no se detiene, ¿qué sospechas?
3. ¿En qué modo hay que ejecutar el programa para que los breakpoints funcionen?

**🔄 Respuestas**

1. Step Over (F10) ejecuta la línea entera sin entrar en los métodos que llama; Step Into (F11) entra dentro del método para ver sus líneas una a una.
2. Que el breakpoint está en una línea que nunca se ejecuta (código muerto, método no llamado, condición que no se cumple).
3. En modo depuración (pulsando `F5` / icono del bicho 🐞 Start Debugging), no en modo ejecución normal (Run Without Debugging).

---

## ✅ Resumen en 3 frases

1. El depurador para el programa donde tú marcas (breakpoint) y te muestra las variables en vivo en el panel lateral de VS Code.
2. Step Over (F10) no entra en los métodos; Step Into (F11) sí; el panel Variables / Watch te muestra los valores en tiempo real.
3. Ante un bug, no adivines: reproduce, para, avanza y observa hasta encontrar dónde se tuerce el valor.

---

## 🐛 Vocabulario rápido

| Término | Idea general |
| --- | --- |
| **Bug** | Un error en el programa |
| **Debug** | Proceso de encontrar y arreglar bugs |
| **Breakpoint** | Marca (punto rojo) donde el programa se detiene |
| **Step Over / Into** | Avanzar sin entrar (F10) / entrando (F11) en métodos |
| **Watch / Variables** | Panel lateral de VS Code que muestra variables y expresiones |
