---
title: "02 — super i @Override"
description: "Cridar la superclasse, sobreescriure mètodes i encadenar constructors sense plorar 🧬"
---

<p><small>Cridar la superclasse, sobreescriure mètodes i encadenar constructors sense plorar 🧬</small></p>

> 🗺️ **Estàs en:** 🧬 **U08 · Herència, Polimorfisme i Interfícies** → 02 · super i @Override

---

## 📬 La idea en una frase

> **`super` crida la superclasse (constructors i mètodes) i `@Override` li diu al compilador que estàs sobreescrivint, no inventant.**

En el punt 1 vas vore que la filla "hereta". Però heretar no és suficient: de vegades vols que el teu pare faça primer la seua part i després tu la teua. Per a això existixen `super` i `@Override`.

---

## 📞 super: cridant mamà/papà perquè t'ajuden

`super` té dos usos, i convé tindre'ls clars:

### 1. `super(...)` per a invocar el constructor del pare

```java
public class Vehiculo {
    private String marca;

    public Vehiculo(String marca) {
        this.marca = marca;
    }
}

public class Coche extends Vehiculo {
    private int puertas;

    public Coche(String marca, int puertas) {
        super(marca);          // ← configura la part de Vehiculo
        this.puertas = puertas; // ← i després el teu
    }
}
```

Si el pare té un constructor amb paràmetres, **has de** cridar-lo amb `super(...)` i ha de ser **la primera línia** del constructor fill. Si no ho fas, el compilador intenta cridar `super()` (sense arguments)... que no existix. Error de compilació immediat.

> ⚠️ **Advertència:** `super(...)` només servix per a invocar constructors i mètodes de la superclasse. No pots passar-lo com a paràmetre ni assignar-lo a una variable. És un punter "només lectura" cap amunt.

### 2. `super.metodo()` per a cridar el mètode del pare

De vegades volem **estendre** el mètode del pare, no reemplaçar-lo:

```java
public class Gato extends Animal {
    @Override
    public void hacerSonido() {
        super.hacerSonido();   // primer el que fa Animal
        System.out.println("¡MIAU!");  // i després el meu
    }
}
```

`super` és com cridar "¡MAAAAMÁ!" al supermercat: "executa la versió del meu pare, i després jo faig la meua".

---

## ✍️ @Override: "Papa, jo ho faig millor"

`@Override` és una anotació que li diu al compilador: "assegura't que realment estic sobreescrivint un mètode del pare":

```java
public class Pez extends Animal {
    @Override
    public void hacerSonido() { }  // ✓ existeix en Animal

    @Override
    public void nadar() { }        // ✗ ERROR: no existeix en Animal
}
```

La segona línia no compila: el compilador verifica que `nadar()` existisca en `Animal` i, com que no existix, t'avisa. Eixe avís a temps val or: si escrius mal el nom o la signatura d'un mètode, `@Override` t'ho descobrix sense esperar un bug rar en runtime.

> 📝 **Nota:** `@Override` no és obligatori, però posa'l sempre. És com el cinturó de seguretat: no passa res si no el poses... fins que passa. A més, és la forma de dir-li a qui llig el teu codi "això és un override, no un mètode nou".

### Regles d'or de l'override

1. La signatura ha de ser **idèntica** (nom i paràmetres).
2. El tipus de retorn ha de ser el mateix o un subtipus (covariant).
3. No pots reduir la visibilitat: `public` en el pare no pot tornar-se `protected` en la filla.
4. Els mètodes `final` no es poden sobreescriure; les classes `final` no poden tindre filles.

---

## 🔒 final: quan vols bloquejar l'herència

`final` és el fre de mà:

```java
public final class String { }        // no pot tindre filles

public class Vehiculo {
    public final void frenar() { }   // les filles NO poden sobreescriure'l
}
```

Usa'l quan una classe o un mètode no ha de modificar-se. Per exemple, un mètode que forma part de l'esquelet d'un algoritme (ho veuràs en el template method del punt 7).

---

## 🏗️ Constructors en l'herència: la cadena de muntatge

Quan crees un objecte de la classe més profunda, s'executen **tots** els constructors de la cadena, del més general al més específic:

```java
public class Abuelo {
    public Abuelo() { System.out.println("Abuelo"); }
}
public class Padre extends Abuelo {
    public Padre() { super(); System.out.println("Padre"); }
}
public class Hijo extends Padre {
    public Hijo() { super(); System.out.println("Hijo"); }
}
// new Hijo() imprimeix: Abuelo / Padre / Hijo
```

Si no escrius `super()`, Java l'afig automàticament al principi del constructor. Per això la regla és: **el pare es construïx sempre primer**. És com muntar una casa: primer els fonaments, després les parets, després el teulada.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** si el pare té constructor amb paràmetres, el fill està obligat a cridar-lo amb `super(...)`. Si no, el compilador intenta el buit... que no existix.

**L'exercici clàssic: què impedix que compile això?**

```java
public class Vehiculo {
    private String marca;

    public Vehiculo(String marca) {
        this.marca = marca;
    }

    public void arrancar() {
        System.out.println("Vehículo arrancado");
    }
}

public class Coche extends Vehiculo {
    private int puertas;

    public Coche(String marca, int puertas) {
        this.puertas = puertas;
    }

    @Override
    public void arrancar() {
        System.out.println("Coche arrancado con " + puertas + " puertas");
    }
}
```

**Pregunta:** quin error impedix que `Coche` compile?

<details>
<summary>🔄 Solució</summary>

El constructor de `Coche` no crida a `super(...)`. Com que `Vehiculo` només té `Vehiculo(String)`, el compilador no troba un `super()` sense arguments i falla. La solució:

```java
public Coche(String marca, int puertas) {
    super(marca);
    this.puertas = puertas;
}
```

</details>

**Exercici: què imprimeix amb herència encadenada i super?**

```java
class Vehiculo {
    void describir() { System.out.println("Soy un vehículo"); }
}
class Coche extends Vehiculo {
    void describir() { System.out.println("Soy un coche"); }
    void describirCompleto() { super.describir(); this.describir(); }
}
class Deportivo extends Coche {
    void describir() { System.out.println("Soy un coche deportivo"); }
}

public class Test {
    public static void main(String[] args) {
        Deportivo d = new Deportivo();
        d.describirCompleto();
        d.describir();
    }
}
```

<details>
<summary>🔄 Solució</summary>

Imprimeix:

```
Soy un vehículo
Soy un coche deportivo
Soy un coche deportivo
```

`super.describir()` dins de `Coche` va directe a `Vehiculo`. En canvi, `this.describir()` es resol en runtime amb l'objecte real, que és un `Deportivo`. Eixe detall és el polimorfisme, i li dedicaràs el punt 4.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quins són els dos usos de `super`?
2. Què li demanes a `@Override`?
3. Què ocorre si el fill no crida a `super(...)` i el pare no té constructor buit?
4. Pot una filla sobreescriure un mètode `final` del pare?

<details>
<summary>🔄 Respostes</summary>

1. `super(...)` per a cridar el constructor del pare i `super.metodo()` per a cridar un mètode del pare.
2. Que verifique en el compilador que realment està sobreescrivint un mètode existent.
3. Error de compilació: Java intenta `super()` sense arguments i no existix.
4. No: `final` prohibix la sobrescriptura. I una classe `final` ni tan sols pot tindre filles.

</details>

---

## ✅ Resum en 3 frases

1. **`super`** encadena amb la superclasse: constructors i mètodes, sempre com a primera jugada.
2. **`@Override`** és la teua xarxa de seguretat: el compilador comprova que el mètode sobreescrit existix.
3. Els **constructors** s'executen de dalt a baix (el pare primer) i els mètodes `final` són intocables.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `super(...)` | Crida al constructor de la superclasse |
> | `super.metodo()` | Crida a un mètode de la superclasse |
> | `@Override` | Anotació que verifica la sobrescriptura |
> | Sobreescriure | Redefinir un mètode heretat amb una altra implementació |
> | `final` | Bloqueja l'herència d'una classe o la sobrescriptura d'un mètode |
> | Cadena de constructors | El pare es construïx sempre abans que el fill |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/08-herencia-polimorfismo-interfaces) · **Anterior:** [01 · Herència: quan els teus fills seguixen els teus passos](/ApuntesProgramacion/va/08-herencia-polimorfismo-interfaces/01-herencia) · **Següent:** [03 · protected i jerarquies de classes](/ApuntesProgramacion/va/08-herencia-polimorfismo-interfaces/03-protected-jerarquias)