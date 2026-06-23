---
title: "Boletí 6 - Intermedi: POO: Classes i Objectes"
nav_order: 6
---
Exercicis de dificultat progressiva. Els ⭐ són per a escalfar, ⭐⭐ per a pensar, ⭐⭐⭐ per a concursar. De crear la teua primera classe a construir objectes que farien plorar d'enveja al teu professor de FP Bàsica.

---

## ⭐ Exercici 1: Classe Llibre

Crea una classe `Llibre` amb:
- Atributs privats: `String titol`, `String autor`, `int pagines`
- Constructor que reba els tres paràmetres
- Getters per a tots els atributs
- Mètode `toString()` que torne `"El llibre '[títol]' de [autor] té [pàgines] pàgines."`

```java
public class Llibre {
    // atributs
    // constructor
    // getters
    // toString()
}
```

---

## ⭐ Exercici 2: Classe Termòmetre

Crea una classe `Termometre` que emmagatzeme la temperatura en graus Celsius (privat). Ha de tindre:
- Constructor que reba els Celsius inicials
- Getter `getCelsius()`
- Mètode `getFahrenheit()` que torne la temperatura en Fahrenheit: `°F = °C * 9/5 + 32`
- Mètode `getKelvin()` que torne la temperatura en Kelvin: `K = °C + 273.15`

```java
public class Termometre {
    private double celsius;
    // constructors, getters, setters
}
```

---

## ⭐⭐ Exercici 3: Classe Data amb validació

Crea una classe `Data` amb `dia`, `mes`, `any` (int, privats). El constructor ha de validar que la data siga vàlida: dies correctes per mes, tenint en compte anys de traspàs.

```java
public class Data {
    private int dia, mes, any;

    public Data(int dia, int mes, int any) {
        // validar
    }

    public boolean esTraspas() {
        // (any % 4 == 0 && any % 100 != 0) || any % 400 == 0
    }
}
```

---

## ⭐⭐ Exercici 4: Classe Rellotge amb avanç

Crea una classe `Rellotge` amb `hora` (0-23), `minut` (0-59), `segon` (0-59), tots privats. Constructor amb validació.

```java
public class Rellotge {
    private int hora, minut, segon;

    public Rellotge(int hora, int minut, int segon) {
        // validar
    }

    public void avançar(int segons) {
        // suma segons, gestiona desbordaments
    }

    public String toString() {
        // format HH:MM:SS
    }
}
```

---

## ⭐⭐⭐ Exercici 5: Classe Matriu 2D

Crea una classe `Matriu` que represente una matriu bidimensional d'enters.

```java
public class Matriu {
    private int[][] dades;
    private int files, columnes;
    // constructors, sumar, restar, multiplicar, toString()
}
```

---

## ⭐⭐⭐ Exercici 6: CodeWars — Build Tower

Resol la kata **"Build Tower"** (6 kyu) en CodeWars.

Crea una classe `TowerBuilder` amb un mètode estàtic `build(int nFloors)` que torne un array de Strings representant una torre amb `nFloors` pisos feta d'asteriscs `*`.

---

## ⭐⭐⭐ Exercici 7: AceptaElReto — 246 Buscant el pin

Resol el problema **246 — Buscant el pin** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=246).

---

## 📚 Referències

| Plataforma | Problema | Dificultat |
|---|---|---|
| CodeWars | Build Tower | 6 kyu |
| CodeWars | Persistent Bugger | 6 kyu |
| AceptaElReto | 246 — Buscant el pin | Mitjà |
| AceptaElReto | 367 — Ascensors | Mitjà |
