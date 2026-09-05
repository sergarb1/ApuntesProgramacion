---
title: Boletín U09 — Avanzado Resuelto
description: Los mismos ejercicios que el boletín avanzado, con soluciones
---

# 📝 Boletín U09 — Avanzado (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## ⭐ Ejercicio 1: Interfaz FiguraGeometrica

<details>
<summary>🔄 Solución</summary>

```java
import java.util.ArrayList;

public interface FiguraGeometrica {
    double calcularArea();
    double calcularPerimetro();
}

class Circulo implements FiguraGeometrica {
    private double radio;

    public Circulo(double radio) {
        this.radio = radio;
    }

    @Override
    public double calcularArea() {
        return Math.PI * radio * radio;
    }

    @Override
    public double calcularPerimetro() {
        return 2 * Math.PI * radio;
    }
}

class Rectangulo implements FiguraGeometrica {
    private double ancho, alto;

    public Rectangulo(double ancho, double alto) {
        this.ancho = ancho;
        this.alto = alto;
    }

    @Override
    public double calcularArea() {
        return ancho * alto;
    }

    @Override
    public double calcularPerimetro() {
        return 2 * (ancho + alto);
    }
}

class TrianguloRectangulo implements FiguraGeometrica {
    private double base, altura;

    public TrianguloRectangulo(double base, double altura) {
        this.base = base;
        this.altura = altura;
    }

    @Override
    public double calcularArea() {
        return base * altura / 2;
    }

    @Override
    public double calcularPerimetro() {
        double hipotenusa = Math.sqrt(base * base + altura * altura);
        return base + altura + hipotenusa;
    }
}

public class TestFiguras {
    public static void main(String[] args) {
        ArrayList<FiguraGeometrica> figuras = new ArrayList<>();
        figuras.add(new Circulo(5));
        figuras.add(new Rectangulo(4, 3));
        figuras.add(new TrianguloRectangulo(3, 4));

        for (FiguraGeometrica f : figuras) {
            System.out.println("Área: " + f.calcularArea()
                    + ", perímetro: " + f.calcularPerimetro());
        }
    }
}
```

La interfaz es el contrato: `ArrayList<FiguraGeometrica>` acepta cualquier clase que firme el contrato, y cada una calcula su área y su perímetro a su manera. Polimorfismo con interfaces en estado puro.

</details>

---

## ⭐ Ejercicio 2: Jerarquía de Empleados

<details>
<summary>🔄 Solución</summary>

```java
public class Empleado {
    protected String nombre;
    protected double salarioBase;

    public Empleado(String nombre, double salarioBase) {
        this.nombre = nombre;
        this.salarioBase = salarioBase;
    }

    public String getNombre() {
        return nombre;
    }

    public double calcularSalario() {
        return salarioBase;
    }
}

class Gerente extends Empleado {
    private double bono;

    public Gerente(String nombre, double salarioBase, double bono) {
        super(nombre, salarioBase);
        this.bono = bono;
    }

    @Override
    public double calcularSalario() {
        return salarioBase + bono;
    }
}

class Vendedor extends Empleado {
    private double comision;
    private int ventasRealizadas;

    public Vendedor(String nombre, double salarioBase,
                    double comision, int ventasRealizadas) {
        super(nombre, salarioBase);
        this.comision = comision;
        this.ventasRealizadas = ventasRealizadas;
    }

    @Override
    public double calcularSalario() {
        return salarioBase + comision * ventasRealizadas;
    }
}

public class Nomina {
    public static void main(String[] args) {
        Empleado[] plantilla = {
            new Gerente("Ana", 2000, 500),
            new Vendedor("Luis", 1200, 20, 15)
        };

        for (Empleado e : plantilla) {
            System.out.println(e.getNombre() + " cobra "
                    + e.calcularSalario() + " €");
        }
    }
}
```

El array es de `Empleado`, pero cada objeto ejecuta su propio `calcularSalario()`: el gerente con bono, el vendedor con comisiones. `protected` permite que las subclases lean `salarioBase` sin necesidad de un getter.

</details>

---

## ⭐⭐ Ejercicio 3: Sistema de pagos con interfaz

<details>
<summary>🔄 Solución</summary>

```java
public interface Pagable {
    boolean procesarPago(double cantidad);
}

class TarjetaCredito implements Pagable {
    private double limite;
    private double saldoUsado;

    public TarjetaCredito(double limite, double saldoUsado) {
        this.limite = limite;
        this.saldoUsado = saldoUsado;
    }

    @Override
    public boolean procesarPago(double cantidad) {
        if (cantidad + saldoUsado <= limite) {
            saldoUsado += cantidad;
            return true;
        }
        return false;
    }
}

class PayPal implements Pagable {
    private double saldo;

    public PayPal(double saldo) {
        this.saldo = saldo;
    }

    @Override
    public boolean procesarPago(double cantidad) {
        if (cantidad <= saldo) {
            saldo -= cantidad;
            return true;
        }
        return false;
    }
}

class TransferenciaBancaria implements Pagable {
    private double saldo;

    public TransferenciaBancaria(double saldo) {
        this.saldo = saldo;
    }

    @Override
    public boolean procesarPago(double cantidad) {
        if (cantidad + 1 <= saldo) {
            saldo -= (cantidad + 1);
            return true;
        }
        return false;
    }
}

public class TestPagos {
    public static void main(String[] args) {
        Pagable tarjeta = new TarjetaCredito(1000, 0);
        System.out.println(tarjeta.procesarPago(500));  // true
        System.out.println(tarjeta.procesarPago(600));  // false

        Pagable paypal = new PayPal(200);
        System.out.println(paypal.procesarPago(150));   // true
        System.out.println(paypal.procesarPago(100));   // false
    }
}
```

Tres formas de pagar, un solo contrato. Cada clase guarda su lógica de aprobación y su saldo interno: la interfaz solo exige el método. La transferencia descuenta además su comisión fija de 1 €, que es la "tasa" del banco.

</details>

---

## ⭐⭐ Ejercicio 4: Interfaces múltiples: Volador y Nadador

<details>
<summary>🔄 Solución</summary>

```java
import java.util.ArrayList;

public interface Volador {
    void volar();
}

public interface Nadador {
    void nadar();
}

class Pato implements Volador, Nadador {
    @Override
    public void volar() {
        System.out.println("El pato vuela en formación en V");
    }

    @Override
    public void nadar() {
        System.out.println("El pato nada tranquilamente en el estanque");
    }
}

class Avion implements Volador {
    @Override
    public void volar() {
        System.out.println("El avión vuela a 900 km/h");
    }
}

class Pez implements Nadador {
    @Override
    public void nadar() {
        System.out.println("El pez nada contracorriente");
    }
}

public class TestAnimales {
    public static void main(String[] args) {
        ArrayList<Volador> voladores = new ArrayList<>();
        voladores.add(new Pato());
        voladores.add(new Avion());

        for (Volador v : voladores) {
            v.volar();
        }

        ArrayList<Nadador> nadadores = new ArrayList<>();
        nadadores.add(new Pato());
        nadadores.add(new Pez());

        for (Nadador n : nadadores) {
            n.nadar();
        }
    }
}
```

El `Pato` es el campeón: firma dos contratos a la vez. En la lista de `Volador` se comporta como volador; en la de `Nadador`, como nadador. Una clase, dos personalidades, cero conflictos: ese es el poder de las interfaces frente a la herencia única.

</details>

---

## ⭐⭐ Ejercicio 5: Downcasting seguro

<details>
<summary>🔄 Solución</summary>

```java
import java.util.ArrayList;

public class Empleado {
    protected String nombre;

    public Empleado(String nombre) {
        this.nombre = nombre;
    }

    public void mostrarInfo() {
        System.out.println("Empleado: " + nombre);
    }
}

class Programador extends Empleado {
    public Programador(String nombre) {
        super(nombre);
    }

    public void escribirCodigo() {
        System.out.println(nombre + " escribe código Java");
    }
}

class Disenador extends Empleado {
    public Disenador(String nombre) {
        super(nombre);
    }

    public void disenar() {
        System.out.println(nombre + " diseña la interfaz");
    }
}

public class Empresa {
    public static void main(String[] args) {
        ArrayList<Empleado> plantilla = new ArrayList<>();
        plantilla.add(new Programador("Ana"));
        plantilla.add(new Disenador("Luis"));
        plantilla.add(new Programador("Eva"));

        for (Empleado e : plantilla) {
            e.mostrarInfo();
            if (e instanceof Programador) {
                ((Programador) e).escribirCodigo();
            } else if (e instanceof Disenador) {
                ((Disenador) e).disenar();
            }
        }
    }
}
```

`instanceof` es la mirilla: antes de bajar la referencia, preguntas si el objeto real es de ese tipo. Sin el cast, no podrías llamar a `escribirCodigo()` ni a `disenar()`; sin el `instanceof`, arriesgarías un `ClassCastException`. Nunca bajes sin preguntar.

</details>

---

## ⭐⭐ Ejercicio 6: Calculadora de figuras con clase abstracta

<details>
<summary>🔄 Solución</summary>

```java
import java.util.ArrayList;

public abstract class Figura {
    protected String color;

    public Figura(String color) {
        this.color = color;
    }

    public abstract double calcularArea();
    public abstract double calcularPerimetro();

    public void mostrarColor() {
        System.out.println("Color: " + color);
    }
}

class Circulo extends Figura {
    private double radio;

    public Circulo(String color, double radio) {
        super(color);
        this.radio = radio;
    }

    @Override
    public double calcularArea() {
        return Math.PI * radio * radio;
    }

    @Override
    public double calcularPerimetro() {
        return 2 * Math.PI * radio;
    }
}

class Rectangulo extends Figura {
    private double ancho, alto;

    public Rectangulo(String color, double ancho, double alto) {
        super(color);
        this.ancho = ancho;
        this.alto = alto;
    }

    @Override
    public double calcularArea() {
        return ancho * alto;
    }

    @Override
    public double calcularPerimetro() {
        return 2 * (ancho + alto);
    }
}

public class TestFiguras {
    public static void main(String[] args) {
        ArrayList<Figura> figuras = new ArrayList<>();
        figuras.add(new Circulo("rojo", 3));
        figuras.add(new Rectangulo("azul", 4, 2));

        for (Figura f : figuras) {
            f.mostrarColor();
            System.out.println("Área: " + f.calcularArea());
        }
    }
}
```

`Figura` aporta el color (concreto) y obliga al área y al perímetro (abstractos). Las subclases solo implementan lo obligatorio. `mostrarColor()` se hereda tal cual: código compartido donde toca, contrato donde toca.

</details>

---

## ⭐⭐⭐ Ejercicio 7: Sistema de notificaciones polimórfico

<details>
<summary>🔄 Solución</summary>

```java
import java.util.ArrayList;
import java.util.List;

public interface Notificable {
    void enviar(String mensaje);
    String getEstado();
}

class EmailNotificacion implements Notificable {
    private String direccion;
    private boolean enviado;

    public EmailNotificacion(String direccion) {
        this.direccion = direccion;
    }

    @Override
    public void enviar(String mensaje) {
        System.out.println("Enviando email a " + direccion + ": " + mensaje);
        enviado = true;
    }

    @Override
    public String getEstado() {
        return enviado ? "Enviado" : "Pendiente";
    }
}

class SMSNotificacion implements Notificable {
    private String telefono;
    private boolean enviado;

    public SMSNotificacion(String telefono) {
        this.telefono = telefono;
    }

    @Override
    public void enviar(String mensaje) {
        System.out.println("Enviando SMS a " + telefono + ": " + mensaje);
        enviado = true;
    }

    @Override
    public String getEstado() {
        return enviado ? "Enviado" : "Pendiente";
    }
}

class PushNotificacion implements Notificable {
    private String dispositivoId;
    private boolean enviado;

    public PushNotificacion(String dispositivoId) {
        this.dispositivoId = dispositivoId;
    }

    @Override
    public void enviar(String mensaje) {
        System.out.println("Enviando push a " + dispositivoId + ": " + mensaje);
        enviado = true;
    }

    @Override
    public String getEstado() {
        return enviado ? "Enviado" : "Pendiente";
    }
}

public class GestorNotificaciones {
    public static void enviarTodas(List<Notificable> notificaciones, String mensaje) {
        for (Notificable n : notificaciones) {
            n.enviar(mensaje);
        }
    }

    public static void main(String[] args) {
        ArrayList<Notificable> notificaciones = new ArrayList<>();
        notificaciones.add(new EmailNotificacion("ana@mail.com"));
        notificaciones.add(new SMSNotificacion("600123456"));
        notificaciones.add(new PushNotificacion("dev-001"));

        enviarTodas(notificaciones, "Examen de Java el lunes");
    }
}
```

`enviarTodas` no sabe (ni le importa) qué tipo concreto hay en la lista: solo conoce el contrato `Notificable`. Añadir un cuarto canal de notificación no obliga a tocar ni una línea del gestor. Diseño abierto al cambio, que es el premio del polimorfismo.

</details>

---

## ⭐⭐⭐ Ejercicio 8: Template method — las bebidas

<details>
<summary>🔄 Solución</summary>

```java
public abstract class Bebida {
    public final void preparar() {
        hervirAgua();
        prepararIngrediente();
        servirEnTaza();
        anadirExtras();
    }

    private void hervirAgua() { System.out.println("Hirviendo agua..."); }
    private void servirEnTaza() { System.out.println("Sirviendo en taza..."); }

    protected abstract void prepararIngrediente();
    protected abstract void anadirExtras();
}

class Te extends Bebida {
    @Override
    protected void prepararIngrediente() {
        System.out.println("Poniendo la bolsita de té...");
    }

    @Override
    protected void anadirExtras() {
        System.out.println("Añadiendo limón...");
    }
}

class Cafe extends Bebida {
    @Override
    protected void prepararIngrediente() {
        System.out.println("Echando el café molido...");
    }

    @Override
    protected void anadirExtras() {
        System.out.println("Añadiendo azúcar...");
    }
}

public class Cafeteria {
    public static void main(String[] args) {
        Bebida b1 = new Te();
        Bebida b2 = new Cafe();
        b1.preparar();
        b2.preparar();
    }
}
```

El esqueleto (`preparar()`) es `final`: nadie puede reordenar los pasos. Las subclases solo personalizan los dos detalles variables. El template method garantiza que el algoritmo siempre se ejecute en el orden correcto, pase lo que pase.

</details>

---

## ⭐⭐⭐ Ejercicio 9: El gran reto — vehículos con combustible

<details>
<summary>🔄 Solución</summary>

```java
import java.util.ArrayList;

abstract class Vehiculo {
    protected String matricula;
    protected int combustible;

    public Vehiculo(String matricula, int combustible) {
        this.matricula = matricula;
        this.combustible = combustible;
    }

    public abstract boolean mover();
}

class Coche extends Vehiculo {
    private static final int GASTO = 5;

    public Coche(String matricula, int combustible) {
        super(matricula, combustible);
    }

    @Override
    public boolean mover() {
        if (combustible >= GASTO) {
            combustible -= GASTO;
            System.out.println("Coche " + matricula + " avanza (combustible: " + combustible + ")");
            return true;
        } else {
            System.out.println("Sin combustible");
            return false;
        }
    }
}

class Moto extends Vehiculo {
    private static final int GASTO = 3;

    public Moto(String matricula, int combustible) {
        super(matricula, combustible);
    }

    @Override
    public boolean mover() {
        if (combustible >= GASTO) {
            combustible -= GASTO;
            System.out.println("Moto " + matricula + " avanza (combustible: " + combustible + ")");
            return true;
        } else {
            System.out.println("Sin combustible");
            return false;
        }
    }
}

class Camion extends Vehiculo {
    private static final int GASTO = 10;
    private int carga;

    public Camion(String matricula, int combustible, int carga) {
        super(matricula, combustible);
        this.carga = carga;
    }

    @Override
    public boolean mover() {
        if (combustible >= GASTO) {
            combustible -= GASTO;
            System.out.println("Camión " + matricula + " con carga " + carga
                    + " avanza (combustible: " + combustible + ")");
            return true;
        } else {
            System.out.println("Sin combustible");
            return false;
        }
    }
}

public class Circuito {
    public static void main(String[] args) {
        ArrayList<Vehiculo> vehiculos = new ArrayList<>();
        vehiculos.add(new Coche("1234ABC", 12));
        vehiculos.add(new Moto("5678DEF", 8));
        vehiculos.add(new Camion("9999ZZZ", 25, 3000));

        for (Vehiculo v : vehiculos) {
            int movimientos = 0;
            while (v.mover()) {
                movimientos++;
            }
            System.out.println("Movimientos: " + movimientos);
        }
    }
}
```

Cada subclase define su gasto con una constante y su `mover()`, que devuelve `true` solo si pudo moverse. El `main` usa solo `Vehiculo`: el `while (v.mover())` pregunta al propio vehículo y el polimorfismo hace el resto. Esa forma de escribir el bucle evita el problema de comprobar el combustible desde fuera (que dejaría un bucle infinito cuando el vehículo no puede moverse pero aún le queda combustible). Si mañana llega una `Bicicleta` (gasto 0), entra sin tocar el circuito. La abstracción paga la casa.

</details>