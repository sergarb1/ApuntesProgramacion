---
title: Butlletí U08 — Inicial
description: Exercicis bàsics de Visibilitat, Encapsulació i Static
---

# 📝 Butlletí U08 — Inicial

> Sense solucions. Sense presses. Obri l'IDE, posa-li cadenat a la primera classe i fes que el `static` deixe de semblar màgia. Cap atribut no naix sabent ser `private`.

---

## Exercici 1: La casa de cristall

Esta classe és una casa de cristall: tothom pot entrar i tocar el que vulga.

```java
public class Persona {
    public String nom;
    public int edat;
}
```

Convertix els atributs en `private` i afig getters i setters per a `nom` i `edat`. Escriu també un `main` que cree una `Persona`, li pose "Anna" i 25 anys usant els setters, i després mostre els valors amb els getters.

---

## Exercici 2: El cotxe del veïnat

Parteix d'esta classe:

```java
public class Cotxe {
    private String marca;
    private double velocitat;

    public Cotxe(String marca) {
        this.marca = marca;
        this.velocitat = 0;
    }

    public String getMarca() {
        return marca;
    }
}
```

Afig `getVelocitat()` i un `setVelocitat(double velocitat)` que **rebutge** les velocitats negatives i les superiors a 200 (mostrant "Velocitat invàlida."). Escriu un `main` que cree un cotxe "Seat" i intente posar-li -50 i després 120.

---

## Exercici 3: El termòmetre amb cervell

Escriu una classe `Termometre` amb:

- Atribut `private double temperatura`.
- Constructor que inicialitze la temperatura a 20.0.
- Getter `getTemperatura()`.
- Setter `setTemperatura(double temperatura)` que **només** accepte valors entre -273.15 i 100.0. Si el valor no és vàlid, mostra "Temperatura fora de rang.".

En un `main`, cree un termòmetre, posa-li -500 (s'ha de rebutjar) i després 36.5, i mostra la temperatura final.

---

## Exercici 4: Getter sense setter

Esta classe representa la configuració d'una app: l'idioma es tria en crear-la i **no ha de poder canviar-se després**.

```java
public class Configuracio {
    private String idioma;

    public Configuracio(String idioma) {
        this.idioma = idioma;
    }

    public String getIdioma() {
        return idioma;
    }
}
```

Fixa't: té getter però **no** setter. Escriu un `main` que cree una configuració amb "es" i mostre l'idioma. Respon: per què no té setter? Què li passaria a un usuari que intentàs fer `config.idioma = "va"` des de fora?

---

## Exercici 5: El comptador de la classe

Escriu una classe `Comptador` amb:

- Atribut `public static int total = 0;`.
- Un constructor que incremente `total` en 1 cada vegada que es crea un objecte.

En un `main`, crea 3 objectes `Comptador` i mostra `Comptador.total`. Respon: quant val `total` i per què no és 1?

---

## Exercici 6: La calculadora sense piles

Escriu una classe `Utilitats` amb dos mètodes **estàtics**: `sumar(int a, int b)` i `restar(int a, int b)`. En un `main`, usa els dos mètodes **sense crear cap objecte** (usa el nom de la classe) i mostra els resultats de `sumar(5, 3)` i `restar(10, 4)`.

Pista: `int resultat = Utilitats.sumar(5, 3);`

---

## Exercici 7: Les constants del barri

Escriu una classe `Constants` que continga:

- `public static final double IVA = 0.21;`
- `public static final int MAX_INTENTS_LOGIN = 3;`
- `public static final String NOM_APP = "GestioCurs";`

En un `main`, mostra les tres constants. Després, intenta fer `Constants.IVA = 0.5;` i respon: què ocorre en compilar?

---

## Exercici 8: Què imprimeix? — el trencaclosques estàtic

Sense executar, escriu l'eixida exacta d'este programa:

```java
public class Trencaclosques {
    static int s = 0;
    int i = 0;

    public Trencaclosques() {
        s++;
        i = s;
    }

    public static void main(String[] args) {
        Trencaclosques t1 = new Trencaclosques();
        Trencaclosques t2 = new Trencaclosques();
        System.out.println(t1.i + " " + t2.i + " " + Trencaclosques.s);
    }
}
```

Pista: `s` és de la classe (una sola còpia compartida); `i` és de cada objecte i es copia del valor de `s` en el moment de nàixer.

---

## Exercici 9: CodeWars — Square(n) Sum

Resol la kata **"Square(n) Sum"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/515e271a311df0350d00000f).

Completa el mètode `public static int squareSum(int[] n)` que reba un array d'enters i retorne la suma dels quadrats de cada número.

**Exemple:** `[1, 2, 2]` → `1 + 4 + 4 = 9`.

Pista: usa un `for` que acumule `n[i] * n[i]`. Els arrays es recorren amb la U04, però ja pots usar l'índex.