---
title: "05 — Debugging y casos límite"
description: "El texto rojo es tu amigo y el detective nunca prueba solo lo bonito 🚨🕵️"
---

<p><small>El texto rojo es tu amigo y el detective nunca prueba solo lo bonito 🚨🕵️</small></p>

> 🗺️ **Estás en:** 🧠 **U00 · Introducción al Pensamiento Computacional** → 05 · Debugging y casos límite

---

Llega el momento inevitable de la vida de cualquier persona que programa: haces clic en el botón verde de ejecutar el programa y, en vez de funcionar como la seda, la pantalla se ilumina con un texto rojo oscuro que parece gritarte: *«¡Has fracasado en la vida! ¡Cierra el portátil y huye al campo a cuidar ovejas!»* 🐑🏃💨

¡Tranquilidad! Hay que desmontar el drama desde el minuto 1: **un error en tu código no es una vergüenza, ni un ataque personal, ni una señal de que no vales para la informática.**

En programación, los errores tienen un nombre táctico —**bugs** 🐛— y el arte de encontrarlos y corregirlos se llama **debugging** (o desinsectación mental). Aprenderemos a mirar a los errores a los ojos sin entrar en pánico. 👁️🛑

---

## 🔴 1. El cambio de chip: El texto rojo es tu amigo

Para un humano normal, una luz roja gigante significa: *«¡PELIGRO! ¡LO HAS HECHO MAL!»*. Pero para un programador o programadora, **el texto rojo es un asistente ultra-eficiente que habla con tu gratis.** 🤖💬

**Piénsalo así:** la máquina podría simplemente quedarse en silencio, petar o decirte un "No funciona" y dejarte a oscuras. ¡Pero no! Te da una **stack trace** (la famosa montaña de letras rojas) que te dice dos cosas de oro puro:

1. **¿Qué ha pasado? 🧐** *(Ej. Te has olvidado de cerrar un paréntesis, o has intentado dividir por cero).*
2. **¿En qué línea exacta ha pasado?** 📍 (Ej. En el archivo Main.java, en la línea 24).

> ❌ **Lo que ve tu cerebro en pánico:** *"FATAL ERROR SYSTEM CRASH DIE DIE DIE BLA BLA BLA"* 😱

> **🟢 Lo que dice el mensaje en realidad:** "¡Hola! En la línea 24 has escrito num2 en vez de num1. ¡De nada, campeón!" 👍

---

## 🧪 2. Pensar como un programador: Probar los casos límite

Otro error de principiante es probar el programa SOLO con los datos "bonitos" y decir: *«¡Ya funciona!»*.

Imagina este programa súper sencillo:

> *"Un programa que indica si una persona es mayor de edad (edad mínima: 18 años)."*

Si lo pruebas poniendo un **20**, el programa dice "Mayor de edad" y tú te vas a hacer un café tan contento/a ☕. Pero un buen programador tiene una **mente de detective malicioso** y se pregunta: *«¿Y cómo podría petar yo esto?»* 😈

Hay que probar SIEMPRE los **casos límite (edge cases)**:

* 🎯 **El límite exacto (18 años):** ¿Tu programa dice que tiene 18 es mayor de edad o se ha quedado fuera por un error de > en vez de >=?
* 🎯 **El límite inferior (17 años):** ¿Dice correctamente que es menor?
* 🎯 **El límite cero (0 años):** ¿Qué hace el programa?
* 💣 **El cas "Gamberro" (-5 años o 200 años):** ¿Tiene sentido que alguien tenga -5 años? ¿O deberías comprobar que la edad sea un número válido antes de hacer nada?

Probar los casos que nadie se espera es la diferencia entre un programa de aficionado y un programa profesional. 🛡️✨

---

## 💡 Idea clave para recordar

> **Los errores no son el final del camino, son el mapa.**

> Un programa que falla no es un fracaso; es simplemente un rompecabezas que te está dando las pistas exactas para ser resuelto. ¡Abraza el texto rojo! 🔴🧩🔎

---

📚 [Volver al índice de la unidad](/ApuntesProgramacion/00-pensamiento-computacional) · **Anterior:** [04 · La descomposición](/ApuntesProgramacion/00-pensamiento-computacional/04-descomposicion) · **Siguiente:** [06 · El protocolo de paz](/ApuntesProgramacion/00-pensamiento-computacional/06-protocolo-paz)
