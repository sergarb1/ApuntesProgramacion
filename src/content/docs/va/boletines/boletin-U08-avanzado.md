---
title: Butlletí U08 — Avançat
description: Exercicis de dificultat progressiva per a exprimir la unitat
---

# 📝 Butlletí U08 — Avançat

> Dificultat progressiva. ⭐ per a escalfar, ⭐⭐ per a pensar, ⭐⭐⭐ per a concursar. L'herència és com la família: de vegades heretes coses bones, de vegades et toca la col·lecció de segells del teu tio avi. Però amb interfícies, almenys tries què implementar.

---

## ⭐ Exercici 1: Interfície FiguraGeometrica

Crea una interfície `FiguraGeometrica` amb dos mètodes:

- `double calcularArea()`
- `double calcularPerimetre()`

Implementa la interfície en:

- `Cercle` (constructor amb radi)
- `Rectangle` (constructor amb ample i alt)
- `TriangleRectangle` (constructor amb base i altura)

En el `main`, crea un `ArrayList<FiguraGeometrica>`, afig un cercle de radi 5, un rectangle 4x3 i un triangle rectangle 3x4. Recorre'ls imprimint àrea i perímetre de cadascun.

```java
public interface FiguraGeometrica {
    double calcularArea();
    double calcularPerimetre();
}
```

**Pista:** per al triangle rectangle, `area = base * altura / 2` i el perímetre és `base + altura + hipotenusa`, amb `hipotenusa = Math.sqrt(base*base + altura*altura)`.

---

## ⭐ Exercici 2: Jerarquia d'Empleats

Crea una classe base `Empleat` amb:

- `String nom`
- `double salariBase`
- Constructor, getters
- Mètode `double calcularSalari()` que torne el `salariBase`

Crea dos subclasses:

- `Gerent`: té un `double bo` extra. `calcularSalari()` torna `salariBase + bo`.
- `Venedor`: té un `double comissio` per venda i un `int vendesRealitzades`. `calcularSalari()` torna `salariBase + comissio * vendesRealitzades`.

En el `main`, crea un array d'`Empleat` amb un gerent i un venedor, recorre'l polimòrficament i mostra el salari de cadascun.

```java
public class Empleat {
    protected String nom;
    protected double salariBase;

    public Empleat(String nom, double salariBase) {
        this.nom = nom;
        this.salariBase = salariBase;
    }

    public double calcularSalari() {
        return salariBase;
    }
}
```

**Pista:** declara `nom` i `salariBase` com a `protected` perquè les subclasses els usen sense getters. L'`@Override` de `calcularSalari()` en cada subclasse és el cor del polimorfisme.

---

## ⭐⭐ Exercici 3: Sistema de pagaments amb interfície

Crea una interfície `Pagable` amb el mètode:

- `boolean procesarPagament(double quantitat)`

Implementa la interfície en:

- `TarjetaCredito`: té `double limit` i `double saldoUsat`. Pot pagar si `quantitat + saldoUsat <= limit`.
- `PayPal`: té `double saldo`. Pot pagar si `quantitat <= saldo`.
- `TransferenciaBancaria`: té `double saldo`. Pot pagar sempre que `quantitat <= saldo`, però té un cost fix de 1 € per transferència.

```java
public interface Pagable {
    boolean procesarPagament(double quantitat);
}
```

Exemple:

```java
Pagable tarjeta = new TarjetaCredito(1000, 0);
tarjeta.procesarPagament(500);   // true
tarjeta.procesarPagament(600);   // false (supera el límit)
```

**Pista:** cada classe decidix la seua pròpia lògica d'aprovació; només el contracte `procesarPagament` és comú. Per a la transferència, comprova que `quantitat + 1 <= saldo`.

---

## ⭐⭐ Exercici 4: Interfícies múltiples: Volador i Nedador

Crea dos interfícies:

- `Volador`: mètode `void volar()`
- `Nedador`: mètode `void nadar()`

Crea una classe `Ànec` que implemente les dos interfícies, una classe `Avió` que només implemente `Volador` i una classe `Peix` que només implemente `Nedador`.

En el `main`, crea un `ArrayList<Volador>` amb un `Ànec` i un `Avió`, i recorre'l cridant a `volar()`. Després fes el mateix amb un `ArrayList<Nedador>`.

```java
public interface Volador { void volar(); }
public interface Nedador { void nadar(); }
```

**Pista:** l'`Ànec` és l'estrella: una sola classe que firma dos contractes. Els `ArrayList` de tipus interfície accepten qualsevol classe que implemente eixe contracte.

---

## ⭐⭐ Exercici 5: Downcasting segur

Crea una jerarquia `Empleat` → `Programador`, `Dissenyador`:

- `Programador` té `void escriureCodi()`.
- `Dissenyador` té `void dissenyar()`.
- `Empleat` té `String nom` i `void mostrarInfo()`.

En el `main`, crea un `ArrayList<Empleat>` amb diversos empleats de tots dos tipus i recorre'l usant `instanceof` per a cridar els mètodes específics.

**Pista:** dins del bucle, `if (e instanceof Programador)` → `((Programador) e).escriureCodi();`. Sempre amb `instanceof` abans del cast: mai no baixes sense preguntar.

---

## ⭐⭐ Exercici 6: Calculadora de figures amb classe abstracta

Crea una classe abstracta `Figura` amb:

- Atribut `protected String color`.
- Constructor que reba el color.
- Mètodes abstractes `double calcularArea()` i `double calcularPerimetre()`.
- Mètode concret `void mostrarColor()` que imprimisca el color.

Implementa `Cercle` (radi) i `Rectangle` (ample, alt). En el `main`, crea un `ArrayList<Figura>` amb un cercle roig de radi 3 i un rectangle blau de 4x2, i mostra l'àrea de cadascun i el seu color.

**Pista:** l'àrea total de la llista es calcula recorrent-la amb `for (Figura f : figures)`. `mostrarColor()` ja està fet: les subclasses només implementen els dos mètodes abstractes.

---

## ⭐⭐⭐ Exercici 7: Sistema de notificacions polimòrfic

Crea una interfície `Notificable` amb:

- `void enviar(String missatge)`
- `String getEstat()`

Implementa:

- `EmailNotificacio`: atributs `String direccio`, `boolean enviat`. En enviar, imprimeix "Enviant email a [direcció]: [missatge]". Estat: "Enviat" o "Pendent".
- `SMSNotificacio`: atributs `String telefon`, `boolean enviat`. En enviar, imprimeix "Enviant SMS a [telèfon]: [missatge]". Estat similar.
- `PushNotificacio`: atributs `String dispositiuId`, `boolean enviat`. En enviar, imprimeix "Enviant push a [dispositiuId]: [missatge]".

```java
public interface Notificable {
    void enviar(String missatge);
    String getEstat();
}
```

En el `main`, crea un `ArrayList<Notificable>` amb els tres tipus. Afig un mètode estàtic que recorre la llista i envie totes les notificacions:

```java
public static void enviarTotes(List<Notificable> notificacions, String missatge) {
    for (Notificable n : notificacions) {
        n.enviar(missatge);
    }
}
```

**Pista:** els tres tipus compartixen el patró: en enviar, posen `enviat = true` i tornen "Enviat"; si no, "Pendent". El polimorfisme fa que `enviarTotes` no sàpiga amb quin tipus tracta.

---

## ⭐⭐⭐ Exercici 8: Template method — les begudes

Crea una classe abstracta `Beguda` amb el patró template method:

```java
public abstract class Beguda {
    public final void preparar() {
        bullirAigua();
        prepararIngredient();
        servirEnTassa();
        afegirExtres();
    }

    private void bullirAigua() { System.out.println("Bullint aigua..."); }
    private void servirEnTassa() { System.out.println("Servint en tassa..."); }

    protected abstract void prepararIngredient();
    protected abstract void afegirExtres();
}
```

Implementa `Te` (bosseta de te + llima) i `Cafe` (cafè mòlt + sucre). En el `main`, prepara un `Te` i un `Cafe` amb una variable de tipus `Beguda`.

**Pista:** les subclasses només omplen els dos mètodes `protected abstract`. El `final` en `preparar()` garantix que ningú no reordene els passos. Per a provar ambdues, usa una referència polimòrfica: `Beguda b = new Te(); b.preparar();`.

---

## ⭐⭐⭐ Exercici 9: El gran repte — vehicles amb combustible

Crea una jerarquia de vehicles:

- `Vehicle` (abstracta): `String matricula`, `int combustible`, `abstract void moure()`
- `Cotxe`: gasta 5 de combustible per moviment
- `Moto`: gasta 3 de combustible per moviment
- `Camio`: gasta 10 de combustible per moviment, però pot portar `int càrrega`

Cada vehicle té un `moure()` que reduïx el combustible. Si no n'hi ha prou, imprimeix "Sense combustible".

En `main()`, crea un `ArrayList<Vehicle>` amb diversos vehicles. Cada vehicle es mou repetidament fins a quedar-se sense combustible i compta quants moviments va fer.

**Pista:** dona a cada subclasse una constant `private static final int DESPESA` amb el que consumix per moviment. En `moure()`: `if (combustible >= DESPESA) { combustible -= DESPESA; ... } else { System.out.println("Sense combustible"); }`. El bucle del `main` usa polimorfisme: `v.moure()` funciona per a tots.