---
title: "Boletí 6 - Intermedi: Herència, Polimorfisme i Interfícies"
nav_order: 6
---
Exercicis de dificultat progressiva. Els ⭐ són per a escalfar, ⭐⭐ per a pensar, ⭐⭐⭐ per a concursar. L'herència és com la família: de vegades heretes coses bones, de vegades et toca la col·lecció de segells del teu tio avi. Però amb interfícies, almenys tries què implementar.

---

## ⭐ Exercici 1: Interfície FiguraGeometrica

Crea una interfície `FiguraGeometrica` amb dos mètodes:
- `double calcularArea()`
- `double calcularPerimetre()`

Implementa-la en `Cercle`, `Rectangle` i `TriangleRectangle`.

---

## ⭐ Exercici 2: Jerarquia d'Empleats

Crea una classe base `Empleat` i dos subclasses `Gerent` i `Venedor` que sobreescriguen `calcularSalari()`.

---

## ⭐⭐ Exercici 3: Sistema de pagaments amb interfície

Crea una interfície `Pagable` amb `boolean procesarPagament(double quantitat)`. Implementa-la en `TarjetaCredito`, `PayPal` i `TransferenciaBancaria`.

---

## ⭐⭐ Exercici 4: Interfícies múltiples: Volador i Nedador

Crea les interfícies `Volador` i `Nedador`. Implementa-les en `Ànec` (ambdues), `Avió` (sols Volador) i `Peix` (sols Nedador).

---

## ⭐⭐⭐ Exercici 5: Sistema de notificacions polimòrfic

Crea una interfície `Notificable` amb `void enviar(String missatge)` i `String getEstat()`. Implementa-la en `EmailNotificacio`, `SMSNotificacio` i `PushNotificacio`.

---

## ⭐⭐⭐ Exercici 6: CodeWars — Is this a triangle?

Resol la kata **"Is this a triangle?"** (7 kyu) en CodeWars.

Implementa una classe `TriangleValidator` amb un mètode estàtic `isTriangle(int a, int b, int c)`.

---

## ⭐⭐⭐ Exercici 7: AceptaElReto — 154 L'ascensor

Resol el problema **154 — L'ascensor** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=154).

Modela un ascensor que recorre diverses plantes i calcula quantes vegades canvia de direcció.

---

## 📚 Referències

| Plataforma | Problema | Dificultat |
|---|---|---|
| CodeWars | Is this a triangle? | 7 kyu |
| CodeWars | Thinkful - Logic Drills: Traffic light | 7 kyu |
| AceptaElReto | 154 — L'ascensor | Mitjà |
| AceptaElReto | 369 — Navegació en Google Maps | Difícil |
