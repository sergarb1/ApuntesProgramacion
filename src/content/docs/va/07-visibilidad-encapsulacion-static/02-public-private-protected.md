---
title: "02 — public, private i protected"
description: "Els 4 nivells de visibilitat: de la tanca publicitària a Times Square al diari amb cadenat 🔐"
---

<p><small>Els 4 nivells de visibilitat: de la tanca publicitària a Times Square al diari amb cadenat 🔐</small></p>

> 🗺️ **Estàs en:** 🔒 **U07 · Visibilitat, Encapsulació i Static** → 02 · public, private i protected

---

## 📬 La idea en una frase

> **Hi ha 4 nivells de visibilitat en Java — `public`, `protected`, package-private i `private` — i cada un és com un tipus de pany: decidix qui té la clau de cada membre de la teua classe.**

En el punt 1 vas vore el problema de la casa de vidre. Ara toca el kit de panys. Java et dona exactament **quatre nivells** de visibilitat, de la tanca publicitària al diari amb cadenat.

---

## 🗂️ Els 4 nivells: de la tanca al diari

| Modificador | Es veu des de | És com... |
|---|---|---|
| `public` | Tot el món, absolutament tot | Una tanca publicitària a Times Square |
| `protected` | Mateix paquet + subclasses (fills) | Els secrets de família: ho saben els teus cosins i els teus fills |
| (res) package-private | Mateix paquet (el veïnat) | El xafardeig del barri |
| `private` | Només la pròpia classe | El teu diari secret amb cadenat |

El detall important: **si no poses res, Java assumix package-private**. No existix una paraula `default` per a això (eixa paraula és per a una altra cosa), així que "sense modificador" = "veïnat".

> 💡 **Detall pràctic:** com més `private` sigues, més segur estàs. La regla d'or del programador paranoic: *comença amb l'accés més restrictiu i obri'l només si hi ha motiu*.

---

## 📣 public: la tanca publicitària

Tot el món ho veu. Des de qualsevol classe, qualsevol paquet, qualsevol racó de l'univers Java. És com posar el teu número de telèfon en una pancarta:

```java
public class VallaPublicitaria {
    public String mensaje;

    public void mostrar() {
        System.out.println(mensaje);
    }
}
```

Usa-ho per al que **vols** que altres usen: mètodes de servei, la porta d'entrada de la classe, el `main`... No per als teus atributs, a menys que t'agrade el caos.

---

## 🔒 private: el diari amb cadenat

Només la classe ve els seus propis `private`. Ni sa mare, ni el seu millor amic, ni el gos:

```java
public class DiarioSecreto {
    private String contenido;

    public void escribir(String mensaje) {
        this.contenido = "Querido diario: " + mensaje;
    }

    public String leer() {
        return contenido;
    }
}
```

Des de fora no pots fer `diario.contenido` directament: el compilador t'ho prohibix. Només pots usar el que la classe exposa (`escribir()` i `leer()`).

> ⚠️ **Advertència:** mai, MAI, faces un atribut `public` "perquè és més ràpid". És més ràpid d'escriure i el doble de lent de depurar: quan algú meta un valor impossible, passaràs hores buscant qui ho va canviar.

---

## 👨‍👩‍👧 protected: els secrets de família

És com les històries vergonyoses de la família. Els teus cosins (mateix paquet) i els teus fills (subclasses) poden accedir. Però un desconegut d'un altre paquet... no. En la U08 (herència) l'esprémeres de debò; per ara, queda't amb la idea: *protegit per a la família*.

```java
package zoologico;

public class Animal {
    protected String nombre; // Ho veuen el paquet i les subclasses
}
```

---

## 🏘️ package-private: el xafardeig del barri

Si no poses cap modificador, ho veuen les classes del **mateix paquet**. És com el grup de WhatsApp del veïnat: els del bloc ho saben tot; els de l'altra ciutat, ni idea.

```java
package barrio;

public class Casa {
    public String direccion;          // Ho sap tot el món
    protected String telefono;        // Ho sap la família
    int numeroHabitaciones;           // Ho saben els veïns (package-private)
    private String contrasenaWifi;    // NOMÉS JO
}
```

Des del mateix paquet (`barrio`):

```java
public class Vecino {
    public void espiar() {
        Casa c = new Casa();
        System.out.println(c.direccion);          // OK: public
        System.out.println(c.telefono);           // OK: protected (mateix paquet)
        System.out.println(c.numeroHabitaciones); // OK: package-private
        // System.out.println(c.contrasenaWifi);  // ERROR: private
    }
}
```

Des d'un altre paquet, sent subclasse:

```java
package otraCiudad;
import barrio.Casa;

public class CasaHeredada extends Casa {
    public void espiar() {
        System.out.println(direccion);            // OK: public
        System.out.println(telefono);             // OK: protected (soc subclasse)
        // System.out.println(numeroHabitaciones); // ERROR: package-private
        // System.out.println(contrasenaWifi);     // ERROR: private
    }
}
```

> 📝 **Nota:** els **mètodes** també tenen visibilitat. Un mètode `private void calcularImpuesto()` només s'usa dins de la classe; ningú fora necessita saber com calcules els impostos (ni tu mateix vols saber-ho).

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** quan tingues dubtes de "qui veu això?", fes-te dues preguntes: *està l'altra classe en el mateix paquet?* i *és una subclasse?* Amb eixes dues respostes, tens el pany resolt.

**Exercici: el banc espia**

Eres la classe `Banco`. Tens estos membres:

```java
public class Banco {
    public String nombreBanco;
    protected String direccionSucursal;
    String listaClientes;
    private double saldoCaja;

    public void mostrarInfo() {
        System.out.println(nombreBanco);
        System.out.println(direccionSucursal);
        System.out.println(listaClientes);
        System.out.println(saldoCaja);
    }
}
```

**Preguntes (sense executar):**

1. Pot una classe `Sucursal` d'un altre paquet vore `listaClientes`?
2. I `direccionSucursal`?
3. Pot el `main()` d'una classe del mateix paquet vore `saldoCaja`?

<details>
<summary>🔄 Solució</summary>

1. **No.** `listaClientes` és package-private: només ho veuen les classes del mateix paquet.
2. **Sí**, però només si `Sucursal` és subclasse de `Banco` (perquè és `protected`). Si és una classe solta d'un altre paquet, tampoc.
3. **No.** `saldoCaja` és `private`: només la pròpia classe `Banco` pot vore-ho. Per això `mostrarInfo()` funciona: és un mètode de la classe i la classe sempre es veu a si mateixa sencera.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quants nivells de visibilitat té Java i com es diuen?
2. Quin nivell assumix Java si no escrius cap modificador?
3. Qui pot vore un membre `protected`?
4. Pot un mètode ser `private`? Per a què servix?

<details>
<summary>🔄 Respostes</summary>

1. Quatre: `public`, `protected`, package-private (sense modificador) i `private`.
2. **Package-private**: ho veuen les classes del mateix paquet.
3. Les classes del **mateix paquet** i les **subclasses** (encara que estiguen en un altre paquet).
4. Sí. Un mètode `private` és una peça interna de la classe que ningú de fora necessita: per exemple, `private void recalcularSaldo()`. Aïlla la complexitat i evita que altres usen el que no deuen.

</details>

---

## ✅ Resum en 3 frases

1. Els **4 nivells** de visibilitat són `public` > `protected` > package-private > `private`.
2. `private` és el més restrictiu (només la classe) i `public` el més obert (tot el món).
3. **Sense modificador, Java assumix package-private**, i la bona pràctica és començar privat i obrir només el necessari.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Modificador d'accés | Paraula que decidix qui veu un membre: `public`, `protected`, `private` |
> | Package-private | Visibilitat "per defecte": només el mateix paquet |
> | Paquet | Carpeta de classes (`package barrio;`) |
> | Subclasse | Classe que hereta d'una altra (`extends`) |
> | Membre | Un atribut o un mètode de la classe |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static) · **Anterior:** [01 · Visibilitat: l'art de no ensenyar-ho tot](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static/01-visibilidad) · **Següent:** [03 · Encapsulació: el pilar de la POO](/ApuntesProgramacion/va/07-visibilidad-encapsulacion-static/03-encapsulacion)