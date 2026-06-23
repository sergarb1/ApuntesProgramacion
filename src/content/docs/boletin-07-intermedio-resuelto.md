---
title: "Boletín 5 - Resuelto: Visibilidad, Encapsulación y Static"
nav_order: 15
---
De ⭐ a ⭐⭐⭐. De "hago getters y setters" a "construyo una API con clases utilitarias". La encapsulación te espera.

---

## ⭐ Ejercicio 1: Clase Empleado con validación

`Empleado` con `nombre`, `salarioBase` (double) y `departamento` privados. El salario no puede ser negativo. El setter lanza `IllegalArgumentException`. Método `calcularSalarioAnual()`.

> **💡 Explicación:** El setter `setSalarioBase` valida que el salario no sea negativo. Si lo es, lanza una `IllegalArgumentException`. Esto es mejor que simplemente ignorar el valor inválido: el programa se detiene y te dice qué pasa. El constructor usa `setSalarioBase` para aprovechar la validación. `calcularSalarioAnual()` multiplica por 12 (suponiendo 12 pagas). Este es el patrón estándar de encapsulación en Java: atributos privados, getters/setters públicos con validación. Así como en la vida real no puedes tener un salario negativo (aunque a veces lo parezca), en tu código tampoco.

---

## ⭐ Ejercicio 2: Círculo encapsulado

`Circulo` con `radio` privado. Setter valida que el radio sea positivo. `getArea()` y `getPerimetro()`. ¿Qué pasa si desde otra clase accedes a `radio`?

Desde otra clase: `circulo.radio` daría ERROR de compilación. Solo se puede acceder con `circulo.getRadio()`.

> **💡 Explicación:** Si intentas `circulo.radio` desde otra clase, el compilador dice: "El campo Circulo.radio es invisible". `private` es eso: invisible para todos excepto para la propia clase. Ni siquiera puedes verlo, y mucho menos modificarlo. Para obtener el radio, usas `getRadio()`. Para cambiarlo, `setRadio(...)`. Y el setter valida que sea positivo. Es como el botón de "no pasar" de una puerta: solo el dueño (la clase) puede decidir quién entra.

---

## ⭐⭐ Ejercicio 3: JavaBean Alumno

Clase `Alumno` JavaBean: `nombre`, `edad`, `curso`, `notaMedia` (double), `matriculado` (boolean). Constructor sin args. Nota media entre 0 y 10.

> **💡 Explicación:** JavaBean es una convención: clase pública, constructor sin argumentos, atributos privados, getters y setters públicos. Para `boolean`, el getter se llama `isMatriculado()` en lugar de `getMatriculado()`. El constructor sin args inicializa todo a valores por defecto. El setter de `notaMedia` valida que esté entre 0 y 10. Los JavaBeans se usan en frameworks como Spring, Hibernate, JSF... Son el estándar de la industria. Aprende el patrón y lo usarás en el 90% de tus clases.

---

## ⭐⭐ Ejercicio 4: Contador de objetos con static

Clase `Usuario` con contador estático de objetos creados, `id` autoincremental, constante `DOMINIO_EMAIL`, y método `generarEmail()`.

> **💡 Explicación:** `contador` (static) se incrementa en cada constructor. Es compartido por todos los objetos. `id` es de instancia: cada usuario recibe el valor actual del contador en el momento de su creación. `DOMINIO_EMAIL` es una constante estática. `generarEmail()` combina el nombre (en minúsculas) con el dominio. Es como cuando te creas un email en el instituto: `ana@dam.com`. El contador estático te dice cuántos usuarios se han creado en total, independientemente de qué objetos sigan vivos.

---

## ⭐⭐ Ejercicio 5: Conversor de unidades (estáticos)

Clase `Conversor` con constantes y métodos estáticos para convertir entre km y millas, Celsius y Fahrenheit, kg y libras.

> **💡 Explicación:** Constructor privado, solo métodos estáticos. Cada método usa una constante o una fórmula. Las constantes son `static final` y se escriben en mayúsculas. Es como tener una calculadora de conversiones siempre disponible, sin necesidad de crear objetos. La fórmula Celsius a Fahrenheit es `°C × 9/5 + 32`. Fahrenheit a Celsius es `(°F - 32) × 5/9`. Las conversiones son todas lineales: multiplicas por un factor. Simple, útil, y demuestra el patrón de clase utilitaria.

---

## ⭐⭐⭐ Ejercicio 6: AceptaElReto 364 — Spiderman

Resuelve el problema **364 — Spiderman** en AceptaElReto.

Spiderman lanza telarañas para salvar ciudadanos. En cada lanzamiento, la telaraña recorre una distancia. El problema pide algo con espías y distancias. (Nota: léelo en la web, es un problema de espías enemigos y distancias).

> **💡 Explicación:** El problema 364 (SpiderMan / Espías) te da una serie de alturas de edificios. Debes contar cuántos edificios "ven" el lado derecho sin ser bloqueados por uno más alto. La solución recorre de derecha a izquierda, manteniendo la altura máxima vista. Si el edificio actual es más alto que el máximo visto, se cuenta. Es un problema clásico de "visibilidad" que encaja perfectamente con el tema de visibilidad de esta unidad. Los edificios más altos bloquean la vista de los más bajos, como los modificadores `private` bloquean el acceso desde fuera.

---

## ⭐⭐⭐ Ejercicio 7: AceptaElReto 462 — Tres dedos

Resuelve el problema **462 — Tres dedos** en AceptaElReto.

Dado un número en base 10, conviértelo a base -2 (base negativa). Los dígitos resultantes serán 0 o 1.

> **💡 Explicación:** Las bases negativas son un concepto matemático curioso. En base -2, los números se representan con dígitos 0 y 1, pero con pesos que alternan signo: 1, -2, 4, -8, 16... El algoritmo es similar a la conversión a binario, pero con un ajuste: si el resto es negativo, le sumamos 2 y aumentamos el cociente en 1. Ejemplo: 6 en base -2 es 11010 (1\*16 + 1\*-8 + 0\*4 + 1\*-2 + 0\*1 = 16-8-2 = 6). Es un problema de concurso (ProgramaMe) que requiere pensar fuera de la caja. Literalmente, fuera de la base positiva.

---

## ⭐⭐⭐ Ejercicio 8: Simulación estática

Clase `Simulacion` con método `main` que lanza dos dados 1000 veces usando `Math.random()`. Usa una clase `Dado` con método estático `lanzar()` (1-6). Cuenta cuántas veces sale cada suma (2-12).

**Salida esperada (aproximada):**
```
Resultados de 1000 lanzamientos:
Suma | Frecuencia
-----|-----------
  2  | 28
  3  | 56
  4  | 83
  5  | 111
  6  | 139
  7  | 167
  8  | 139
  9  | 111
  10 | 83
  11 | 56
  12 | 28
```

> **💡 Explicación:** La clase `Dado` es utilitaria: constructor privado y método `lanzar()` estático. No necesitas crear dados individuales porque todos son iguales. La simulación usa un array de 13 posiciones (0-12) donde `sumas[7]` cuenta cuántas veces ha salido suma 7. El 7 es el más probable porque hay más combinaciones de dados que suman 7 (1+6, 2+5, 3+4, 4+3, 5+2, 6+1) que cualquier otra suma. La ley de los grandes números hace que la distribución se acerque a una campana (distribución normal). Es la misma razón por la que en el casino el 7 es la apuesta más popular en los dados. Pero no apuestes, que la casa siempre gana. Bueno, tú ganas con este código.

---

## 📚 Referencias

| Plataforma | Problema | Dificultad |
|---|---|---|
| AceptaElReto | 106 — Código de barras | Medio |
| AceptaElReto | 364 — Spiderman | Medio |
| AceptaElReto | 462 — Tres dedos | Difícil |
| CodeWars | Convert boolean to string (8 kyu) | Principiante |
| CodeWars | Return the day (8 kyu) | Principiante |
