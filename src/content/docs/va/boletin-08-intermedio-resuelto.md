---
title: "Boletín 6 - Resuelto: Herencia y Polimorfismo"
nav_order: 6
---
*Dificultad progresiva. De ⭐ a ⭐⭐⭐.*

---

## ⭐ Ejercicio 1: La orquesta polimórfica

Crea una clase `Instrumento` con método `tocar()`. Crea 3 subclases: `Guitarra`, `Piano`, `Bateria` que sobreescriban `tocar()`. En `main()`, crea un array de `Instrumento` con una instancia de cada uno y recórrelo llamando a `tocar()`.

---

## ⭐ Ejercicio 2: Herencia de constructores — la cadena alimenticia

Crea: `Animal` (constructor con `String nombre`), `Mamifero` (constructor con `String nombre, boolean tienePelo`), `Perro` (constructor con `String nombre, boolean tienePelo, String raza`). Cada constructor debe llamar al de su padre. Demuestra que funciona.

---

## ⭐ Ejercicio 3: El problema del jarrón (Fragile Base Class)

Crea `Base` con métodos `a()` y `b()` donde `b()` llama internamente a `a()`. Crea `Derivada` que sobreescribe `a()`. Crea una instancia de `Derivada` y llama a `b()`. ¿Qué ocurre?

---

## ⭐⭐ Ejercicio 4: Batalla de personajes

Crea `Personaje` (abstracta) con `nombre`, `vida`, `atacar(Personaje p)` y `recibirDano(int dmg)`. Crea `Guerrero` (daño fijo 20), `Mago` (daño 30 pero solo cada 2 turnos) y `Arquero` (daño 15 pero siempre acierta). Simula una batalla.

---

## ⭐⭐ Ejercicio 5: La calculadora de figuras

Crea `Figura` con método abstracto `calcularArea()`. Implementa `Circulo`, `Rectangulo` y `Triangulo`. En `main()`, crea un `ArrayList<Figura>`, añade varias figuras y calcula el área total.

---

## ⭐⭐ Ejercicio 6: Downcasting seguro

Jerarquía `Empleado` → `Programador`, `Diseñador`. `Programador` tiene `escribirCodigo()`, `Diseñador` tiene `disenar()`. Crea un `ArrayList<Empleado>` con varios empleados y recórrelo usando `instanceof` para llamar a los métodos específicos.

---

## ⭐⭐⭐ Ejercicio 7 (ProgramaMe): El simulador de ecosistema

Diseña un simulador de ecosistema con la siguiente jerarquía:

```
SerVivo (abstracta)
├── Animal (abstracta)
│   ├── Herbivoro
│   └── Carnivoro
├── Planta
```

Cada `SerVivo` tiene `int energia`. Los `Animal` pueden `mover()`, `comer(SerVivo objetivo)`. Los `Herbivoro` solo comen `Planta`. Los `Carnivoro` solo comen `Animal`. Cada `Planta` hace `fotosintesis()` que le da +10 de energía.

Simula un ecosistema con 3 plantas, 2 herbívoros y 1 carnívoro durante 10 turnos. Cada turno: las plantas hacen fotosíntesis, los herbívoros comen plantas si pueden, el carnívoro come herbívoros si puede. Si un ser vivo llega a 0 de energía, muere.

Al final, muestra quién sobrevivió.

---

## ⭐⭐⭐ Ejercicio 8 (ProgramaMe): Vehículos con combustible

Crea una jerarquía de vehículos:

- `Vehiculo` (abstracta): `String matricula`, `int combustible`, `abstract void mover()`
- `Coche`: gasta 5 de combustible por movimiento
- `Moto`: gasta 3 de combustible por movimiento
- `Camion`: gasta 10 de combustible por movimiento, pero puede llevar `int carga`

Cada vehículo tiene un método `mover()` que reduce el combustible. Si no hay suficiente, imprime "Sin combustible".

En `main()`, crea un `ArrayList<Vehiculo>` con varios vehículos. Cada vehículo se mueve repetidamente hasta que se queda sin combustible. Lleva la cuenta de cuántos movimientos hizo cada uno.

---

## 🔗 Referencias para seguir practicando

- **CodeWars:** [Thinkful - Logic Drills: Traffic light](https://www.codewars.com/kata/58649884a1659ed6cb000072) (7 kyu)
- **CodeWars:** [Fun with ES6 Classes #1 - People](https://www.codewars.com/kata/56f7f8215d7c12c0e7000b19) (7 kyu)
- **CodeWars:** [Fight Club](https://www.codewars.com/kata/5770b2f614937762e50005c2) (7 kyu)
- **AceptaElReto.com:** [364 - Spiderman](https://www.aceptaelreto.com/problem/statement.php?id=364)
- **AceptaElReto.com:** [462 - Tres dedos](https://www.aceptaelreto.com/problem/statement.php?id=462)
- **AceptaElReto.com:** [458 - El espejo](https://www.aceptaelreto.com/problem/statement.php?id=458)
