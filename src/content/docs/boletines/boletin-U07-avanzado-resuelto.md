---
title: Boletín U07 — Avanzado Resuelto
description: Los mismos ejercicios que el boletín avanzado, con soluciones
---

# 📝 Boletín U07 — Avanzado (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## ⭐ Ejercicio 1: Empleado con validación

<details>
<summary>🔄 Solución</summary>

```java
public class Empleado {
    private String nombre;
    private double salario;

    public Empleado(String nombre, double salario) {
        this.nombre = nombre;
        setSalario(salario);
    }

    public String getNombre() {
        return nombre;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        if (salario >= 0) {
            this.salario = salario;
        } else {
            System.out.println("Salario inválido.");
        }
    }

    public static void main(String[] args) {
        Empleado e = new Empleado("Laura", 1500);
        e.setSalario(-300);
        System.out.println(e.getNombre() + ": " + e.getSalario());
    }
}
```

Salida: `Salario inválido.` y `Laura: 1500.0`. El truco: el constructor llama a `setSalario(salario)`, así la validación vive en un solo sitio y no hay dos copias de la misma regla.

</details>

---

## ⭐ Ejercicio 2: Círculo encapsulado

<details>
<summary>🔄 Solución</summary>

```java
public class Circulo {
    private double radio;

    public Circulo(double radio) {
        setRadio(radio);
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        if (radio > 0) {
            this.radio = radio;
        } else {
            System.out.println("Radio inválido.");
        }
    }

    public double getArea() {
        return Math.PI * radio * radio;
    }

    public double getPerimetro() {
        return 2 * Math.PI * radio;
    }

    public static void main(String[] args) {
        Circulo c = new Circulo(5);
        System.out.println("Área: " + c.getArea());
        System.out.println("Perímetro: " + c.getPerimetro());
    }
}
```

`getArea()` y `getPerimetro()` son getters "calculados": no devuelven un atributo, sino un valor derivado de él. `Math.PI` es una constante estática, y los métodos los creas tú con `static` cuando conviene. Área del radio 5: ≈ 78.54, perímetro ≈ 31.42.

</details>

---

## ⭐⭐ Ejercicio 3: JavaBean Alumno

<details>
<summary>🔄 Solución</summary>

```java
public class Alumno {
    private String nombre;
    private int edad;
    private double notaMedia;

    public Alumno() {}

    public Alumno(String nombre, int edad, double notaMedia) {
        this.nombre = nombre;
        setEdad(edad);
        setNotaMedia(notaMedia);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        if (edad >= 0 && edad <= 120) {
            this.edad = edad;
        } else {
            System.out.println("Edad inválida.");
        }
    }

    public double getNotaMedia() {
        return notaMedia;
    }

    public void setNotaMedia(double notaMedia) {
        if (notaMedia >= 0 && notaMedia <= 10) {
            this.notaMedia = notaMedia;
        } else {
            System.out.println("Nota inválida.");
        }
    }

    public static void main(String[] args) {
        Alumno a = new Alumno("Sara", 18, 7.5);
        a.setNotaMedia(8.75);
        System.out.println(a.getNombre() + ": " + a.getNotaMedia());
    }
}
```

JavaBean: atributos privados, constructores (vacío y con datos) y getters/setters de todo. Los setters con validación evitan estados imposibles (edad 250, nota 15). El constructor con parámetros reutiliza los setters para no duplicar reglas.

</details>

---

## ⭐⭐ Ejercicio 4: Hora inmutable

<details>
<summary>🔄 Solución</summary>

```java
public class Hora {
    private final int hora;
    private final int minuto;

    public Hora(int hora, int minuto) {
        if (hora < 0 || hora > 23 || minuto < 0 || minuto > 59) {
            throw new IllegalArgumentException("Hora o minuto inválidos.");
        }
        this.hora = hora;
        this.minuto = minuto;
    }

    public int getHora() {
        return hora;
    }

    public int getMinuto() {
        return minuto;
    }

    public String mostrar() {
        return String.format("%02d:%02d", hora, minuto);
    }

    public static void main(String[] args) {
        Hora h = new Hora(9, 5);
        System.out.println(h.mostrar());
    }
}
```

Salida: `09:05`. No necesita setters porque es **inmutable**: una vez creada, su valor no cambia jamás (los `final` lo garantizan). Cambiar la hora es crear una `Hora` nueva. El constructor usa `throw` (viste la U03) para los valores imposibles.

</details>

---

## ⭐⭐ Ejercicio 5: ¿Qué imprime? — el puzle de los gatos

<details>
<summary>🔄 Solución</summary>

Imprime:

```
Bigotes (7 vidas)
Garfield (8 vidas)
Total: 2
```

`Bigotes` pierde 2 vidas (de 9 a 7), `Garfield` pierde 1 (de 9 a 8). `totalGatos` es `static` y sube con cada `new`, así que vale 2. Los `vidas` son de cada gato; el `totalGatos`, de la clase. `toString()` es el método que Java llama al imprimir un objeto con `System.out.println`.

</details>

---

## ⭐⭐ Ejercicio 6: Contador de usuarios

<details>
<summary>🔄 Solución</summary>

```java
public class Usuario {
    private static int contador = 0;
    private int id;

    public Usuario() {
        contador++;
        id = contador;
    }

    public int getId() {
        return id;
    }

    public static int getTotalUsuarios() {
        return contador;
    }

    public static void main(String[] args) {
        Usuario u1 = new Usuario();
        Usuario u2 = new Usuario();
        Usuario u3 = new Usuario();
        Usuario u4 = new Usuario();
        Usuario u5 = new Usuario();
        System.out.println("Último id: " + u5.getId());
        System.out.println("Total: " + Usuario.getTotalUsuarios());
    }
}
```

Salida: `Último id: 5` y `Total: 5`. El patrón "contador + id": `contador` (estático) sube en cada constructor y el objeto se guarda su número como `id`. `getTotalUsuarios()` es `static` porque la pregunta se la haces a la clase, no a un usuario concreto.

</details>

---

## ⭐⭐⭐ Ejercicio 7: La clase utilitaria OperacionesArray

<details>
<summary>🔄 Solución</summary>

```java
public class OperacionesArray {
    private OperacionesArray() {}

    public static int suma(int[] numeros) {
        int suma = 0;
        for (int numero : numeros) {
            suma += numero;
        }
        return suma;
    }

    public static double media(double[] numeros) {
        double suma = 0;
        for (double numero : numeros) {
            suma += numero;
        }
        return numeros.length > 0 ? suma / numeros.length : 0;
    }

    public static int maximo(int[] numeros) {
        int max = numeros[0];
        for (int i = 1; i < numeros.length; i++) {
            if (numeros[i] > max) {
                max = numeros[i];
            }
        }
        return max;
    }

    public static boolean estaOrdenado(int[] numeros) {
        for (int i = 1; i < numeros.length; i++) {
            if (numeros[i] < numeros[i - 1]) {
                return false;
            }
        }
        return true;
    }

    public static void main(String[] args) {
        System.out.println("Suma: " + OperacionesArray.suma(new int[]{3, 1, 4, 1, 5}));
        System.out.println("Máximo: " + OperacionesArray.maximo(new int[]{3, 1, 4, 1, 5}));
        System.out.println("Ordenado: " + OperacionesArray.estaOrdenado(new int[]{1, 2, 3}));
    }
}
```

Constructor privado + todo `static` = clase utilitaria, como `Math`. `estaOrdenado` devuelve `false` en cuanto encuentra una pareja fuera de orden (`return` temprano). El `for...each` de la U09 se puede usar ya: recorre sin índice.

</details>

---

## ⭐⭐⭐ Ejercicio 8: Validador de datos

<details>
<summary>🔄 Solución</summary>

```java
public class Validador {
    private Validador() {}

    public static boolean esEmailValido(String email) {
        if (email == null) {
            return false;
        }
        int arroba = email.indexOf('@');
        if (arroba < 1) {
            return false;
        }
        if (email.indexOf('@', arroba + 1) != -1) {
            return false;
        }
        return email.indexOf('.', arroba + 1) != -1;
    }

    public static boolean esEdadValida(int edad) {
        return edad >= 0 && edad <= 120;
    }

    public static boolean esTextoNoVacio(String texto) {
        return texto != null && !texto.trim().isEmpty();
    }

    public static void main(String[] args) {
        System.out.println(Validador.esEmailValido("ana@mail.com"));
        System.out.println(Validador.esEmailValido("ana@"));
        System.out.println(Validador.esEdadValida(-5));
        System.out.println(Validador.esEdadValida(200));
        System.out.println(Validador.esTextoNoVacio("  "));
    }
}
```

Salida: `true`, `false`, `false`, `false`, `false`. `esEmailValido` exige: algo antes de la `@`, una sola `@`, y un `.` después. `indexOf('@', pos)` busca desde `pos` en adelante. Cada condición fallida sale con `false` al instante: sin `else` encadenados.

</details>

---

## ⭐⭐⭐ Ejercicio 9: El gran reto — refactoriza el banco

<details>
<summary>🔄 Solución</summary>

```java
public class CuentaBancaria {
    public static final String NOMBRE_BANCO = "Banco DAM";

    private String titular;
    private double saldo;

    public CuentaBancaria(String titular, double saldo) {
        this.titular = titular;
        if (saldo >= 0) {
            this.saldo = saldo;
        } else {
            System.out.println("Saldo inicial inválido.");
        }
    }

    public String getTitular() {
        return titular;
    }

    public double getSaldo() {
        return saldo;
    }

    public void retirar(double cantidad) {
        if (cantidad <= 0) {
            System.out.println("Cantidad inválida.");
            return;
        }
        if (cantidad > saldo) {
            System.out.println("Saldo insuficiente.");
            return;
        }
        saldo = saldo - cantidad;
    }

    public void ingresar(double cantidad) {
        if (cantidad <= 0) {
            System.out.println("Cantidad inválida.");
            return;
        }
        saldo = saldo + cantidad;
    }

    public static void main(String[] args) {
        CuentaBancaria cuenta = new CuentaBancaria("Ana", 100);
        cuenta.ingresar(50);
        cuenta.retirar(400);
        System.out.println("Saldo: " + cuenta.getSaldo());
    }
}
```

Salida: `Saldo insuficiente.` y `Saldo: 150.0`. El constructor corregido usa `this` (el bug original asignaba el parámetro a sí mismo). Sin setter de saldo, solo `ingresar` y `retirar` pueden tocarlo, y ambas validan. La constante da identidad al banco. La cuenta ya no puede quedar en negativo ni en valores arbitrarios.

</details>