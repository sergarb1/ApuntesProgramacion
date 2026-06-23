---
title: "Boletín 5 - Inicial Resuelto: Visibilidad, Encapsulación y Static"
nav_order: 14
---
Las soluciones explicadas con humor. Porque la encapsulación no tiene por qué ser aburrida.

---

## Ejercicio 1: Encuentra el error de visibilidad

```java
public class Casa {
    public String direccion;
    protected String telefono;
    int numeroHabitaciones;
    private String contrasenaWifi;

    public void mostrarTodo() {
        System.out.println(direccion);           // OK: misma clase
        System.out.println(telefono);            // OK: misma clase
        System.out.println(numeroHabitaciones);  // OK: misma clase
        System.out.println(contrasenaWifi);      // OK: misma clase
    }
}

public class Vecino {
    public void espiar() {
        Casa c = new Casa();
        System.out.println(c.direccion);          // OK: public
        System.out.println(c.telefono);           // OK: protected (mismo paquete)
        System.out.println(c.numeroHabitaciones); // OK: package-private (mismo paquete)
        System.out.println(c.contrasenaWifi);     // ERROR: private
    }
}
```

> **💡 Explicación:** `contrasenaWifi` es `private`. Solo la clase `Casa` puede acceder a él. Ni su vecino (`Vecino`), ni su madre, ni el perro. `private` es el equivalente a tu diario secreto con candado. Los otros niveles (public, protected, package-private) permiten acceso según el contexto. La propia clase (`mostrarTodo`) sí puede acceder a todo porque está dentro de la misma clase. Es como si tú mismo pudieras leer tu propio diario, pero los vecinos no.

---

## Ejercicio 2: Completa los getters y setters

```java
public class CuentaBancaria {
    private double saldo;

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        if (saldo >= 0) {
            this.saldo = saldo;
        } else {
            System.out.println("El saldo no puede ser negativo");
        }
    }

    public void ingresar(double cantidad) {
        if (cantidad > 0) {
            saldo += cantidad;
        } else {
            System.out.println("Cantidad inválida");
        }
    }

    public boolean retirar(double cantidad) {
        if (cantidad > 0 && cantidad <= saldo) {
            saldo -= cantidad;
            return true;
        }
        System.out.println("No se puede retirar esa cantidad");
        return false;
    }
}
```

> **💡 Explicación:** La encapsulación consiste en: atributos `private`, acceso controlado por métodos públicos. El getter solo devuelve el valor. El setter valida que el saldo no sea negativo. `ingresar` solo acepta cantidades positivas. `retirar` comprueba que haya saldo suficiente. Todo el control está en manos de la clase, no del usuario externo. Es como un cajero automático: tú no puedes abrir la máquina y coger billetes; solo puedes usar los botones que la máquina te permite. La encapsulación es el "cajero automático" de tus objetos.

---

## Ejercicio 3: ¿Qué imprime? Static vs instancia

```java
public class Gato {
    public static int totalGatos = 0;
    public String nombre;

    public Gato(String nombre) {
        this.nombre = nombre;
        totalGatos++;
    }

    public static void main(String[] args) {
        Gato g1 = new Gato("Misi");
        Gato g2 = new Gato("Garfield");
        Gato g3 = new Gato("Tom");

        System.out.println("Total: " + Gato.totalGatos);
        System.out.println("Nombre: " + g2.nombre);
    }
}
```

**Salida:**
```
Total: 3
Nombre: Garfield
```

> **💡 Explicación:** `totalGatos` es `static`, lo que significa que es compartido por todos los objetos de la clase. Cada vez que se crea un `Gato`, el constructor incrementa `totalGatos`. Al crear 3 gatos, `totalGatos` es 3. En cambio, `nombre` es de instancia: cada gato tiene su propio nombre. `g2.nombre` es "Garfield" porque es el nombre del segundo gato. La diferencia es como el grupo de WhatsApp de la clase (static) vs los mensajes privados (instancia). Todos ven el mensaje del grupo, pero cada uno tiene sus propios DMs.

---

## Ejercicio 4: Escribe la clase utilitaria

```java
public class StringUtils {
    private StringUtils() {} // Constructor privado: no se puede instanciar

    public static boolean esVacio(String s) {
        return s == null || s.trim().isEmpty();
    }

    public static String invertir(String s) {
        if (s == null) return null;
        return new StringBuilder(s).reverse().toString();
    }

    public static void main(String[] args) {
        System.out.println("¿Vacío? " + StringUtils.esVacio("  "));  // true
        System.out.println("¿Vacío? " + StringUtils.esVacio("Hola")); // false
        System.out.println("Invertir: " + StringUtils.invertir("Hola")); // aloH
    }
}
```

> **💡 Explicación:** Las clases utilitarias tienen constructor privado para que nadie pueda instanciarlas. Todos sus métodos son estáticos y se llaman con `NombreClase.metodo()`. Es como `Math`: no haces `new Math()`, usas `Math.random()` directamente. `esVacio` comprueba si un String es null o solo espacios. `invertir` usa `StringBuilder` que tiene un método `reverse()` incorporado. Podrías hacerlo a mano con un bucle, pero `StringBuilder` es más eficiente. La clase `StringUtils` es tu navaja suiza para Strings.

---

## Ejercicio 5: Escribe la clase Config

```java
public class Config {
    private Config() {} // No se puede instanciar

    public static final String NOMBRE_APP = "Gestión DAM";
    public static final String VERSION = "1.0.0";
    public static final int MAX_USUARIOS = 100;

    private static int contadorAccesos = 0;

    public static void incrementarAcceso() {
        contadorAccesos++;
    }

    public static int getContadorAccesos() {
        return contadorAccesos;
    }

    public static void main(String[] args) {
        System.out.println("App: " + Config.NOMBRE_APP);
        System.out.println("Versión: " + Config.VERSION);
        System.out.println("Max usuarios: " + Config.MAX_USUARIOS);

        Config.incrementarAcceso();
        Config.incrementarAcceso();
        Config.incrementarAcceso();
        System.out.println("Accesos: " + Config.getContadorAccesos());
    }
}
```

> **💡 Explicación:** Las constantes `static final` son públicas e inmutables. Se escriben en MAYÚSCULAS por convención. El constructor privado evita instanciación. `contadorAccesos` es privado y estático: solo la clase puede modificarlo, pero existe a nivel de clase (no de objeto). Se usa como un contador global de accesos a la aplicación. Es como el marcador de visitas de una web: todos ven el número, pero solo el servidor puede incrementarlo.

---

## Ejercicio 6: AceptaElReto 106 — Código de barras

```java
import java.util.Scanner;

public class Problema106 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String codigo = sc.nextLine();
        while (!codigo.equals("0")) {
            int longitud = codigo.length();
            boolean esEan13 = longitud == 13;
            int sumaPar = 0, sumaImpar = 0;

            int limite = esEan13 ? 12 : 7;
            for (int i = 0; i < limite; i++) {
                int digito = codigo.charAt(i) - '0';
                if (i % 2 == 0) sumaImpar += digito;
                else sumaPar += digito;
            }

            int total = esEan13 ? sumaImpar * 3 + sumaPar : sumaImpar + sumaPar * 3;
            int digitoControl = (10 - total % 10) % 10;
            int ultimoDigito = codigo.charAt(longitud - 1) - '0';

            String pais = "";
            int prefijo = Integer.parseInt(codigo.substring(0, 3));
            if (longitud == 8) {
                pais = "EEUU";
            } else if (prefijo == 0 || prefijo == 1) {
                pais = "EEUU";
            } else if (prefijo >= 380 && prefijo <= 379) { /* improbable */
            } else if (prefijo >= 380 && prefijo <= 389) { /* no */
            } else if (prefijo >= 380 && prefijo <= 379) { /* error */
            } else if (prefijo >= 380 && prefijo < 400) {
                pais = "Bulgaria";
            } else { /* simplificación */
                pais = "Desconocido";
            }

            // Simplificación: solo mostramos validez
            if (digitoControl == ultimoDigito) {
                System.out.println("SI");
            } else {
                System.out.println("NO");
            }
            codigo = sc.nextLine();
        }
    }
}
```

> **💡 Explicación:** Esta es una versión simplificada del problema 106. El algoritmo del código de barras: para EAN-13, sumas los dígitos impares (x3) + pares; para EAN-8, al revés. Calculas el dígito de control con `(10 - total % 10) % 10` y lo comparas con el último dígito. El código completo en AceptaElReto también debe identificar el país según el prefijo. La encapsulación aquí está en la lógica: cada cálculo está separado y es fácil de entender. Es un ejemplo de cómo validar datos de entrada con un algoritmo estándar.

---

## Ejercicio 7: CodeWars — Convert boolean to string

```java
public class YesOrNo {
    public static String boolToWord(boolean b) {
        return b ? "Yes" : "No";
    }
}
```

> **💡 Explicación:** El ternario `? :` es perfecto aquí. Si `b` es `true`, devuelve "Yes". Si no, "No". Una línea. Elegante. También podrías hacerlo con `if-else`, pero el ternario queda más limpio. CodeWars premia la simplicidad. Es como cuando te preguntan "¿quieres café?" y respondes "Sí" o "No". No necesitas un párrafo explicando tu relación con la cafeína. La clase es utilitaria (método estático), así que la llamas con `YesOrNo.boolToWord(true)`.
