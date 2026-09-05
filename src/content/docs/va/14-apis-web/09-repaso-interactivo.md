---
title: "09 · Repàs interactiu: domina la web"
description: "El tancament pràctic de la unitat i del curs, amb un parser que ho liarà tot i un servidor que no arranca 😈🌐"
---

<p><small>El tancament pràctic de la unitat i del curs, amb un parser que ho liarà tot i un servidor que no arranca 😈🌐</small></p>

> 🗺️ **Estàs en:** 🌐 **U14 · Servir i Consumir APIs amb Web** → 09 · Repàs interactiu

---

## 📬 La idea en una frase

> **En este punt no aprenem res de nou: ho convertim tot en pràctica. I, com sempre, alguna cosa no funcionarà.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaben de donar-te este programa per a executar:*

```java
public class Misterio {

    static String extraer(String query, String clave) {
        if (query == null) return "nada";
        for (String par : query.split("&")) {
            String[] trozos = par.split("=");
            if (trozos.length == 2 && trozos[0].equals(clave)) {
                return trozos[1];
            }
        }
        return "nada";
    }

    public static void main(String[] args) {
        System.out.println(extraer("nombre=Ana&edad=25", "edad"));
        System.out.println(extraer("nombre=Ana&edad=25", "ciudad"));
        System.out.println(extraer("clave=valor", "clave"));
    }
}
```

**Què imprimixes per pantalla? Tria saviament:**

1. **`25 nada valor`** → ✅ Correcte! Per a la clau `edad` troba el parell `edad=25` i torna `"25"`. Per a `ciudad` no hi ha parell amb eixa clau → `"nada"`. Per a `clave` → `"valor"`.
2. **`nada 25 valor`** → Vas llegir l'ordre al revés: pensa quina clau es busca primer. ❌
3. **`25 25 valor`** → El segon `System.out` no busca "edad" dos vegades: busca `ciudad`, que no existix. ❌

> <details>
> <summary>🔄 Solució</summary>
>
> L'opció **1**. El parser recorre els parells `clau=valor` separats per `&` i torna el valor de la clau demanada. `edad` → `25`; `ciudad` → no està → `nada`; `clave` → `valor`. És exactament l'`extraerParametro` del punt 4: la mateixa lògica que uses per a llegir la query string d'un GET.
>
> </details>

---

## 🔥 Fireside Chat: GET vs POST

> *Dos cosins del protocol s'embasten davant la màquina de cafè.*

**GET:** — Jo soc el de tota la vida. Demane, em donen, no canvie res. Vols repetir la meua petició? Només pegues la URL en el navegador i ja està. Reproduïble, cacheable, simple.

**POST:** — I per a enviar el formulari de registre d'un usuari? Vas a ficar la seua contrasenya en la URL perquè quede en l'historial i en els logs del servidor? Això és el que faries tu. Jo ho porte en el cos: privat, ordenat i sense límit de grandària pràctic.

**GET:** — Val, per a dades sensibles eres tu. Però jo soc el que carrega el 99 % de la web: cada pàgina, cada imatge, cada cerca passa per mi. Quantes vegades t'he vist en un formulari de cerca? Ah, que el cercador usa GET, perquè així el resultat es pot compartir i enllaçar. Interessant.

**POST:** — Tu per a llegir i compartir. Jo per a enviar i crear. Tregua?

**GET:** — Tregua. Però no m'enviïs un `DELETE` amb cos, que és de mal gust.

> La lliçó: **llegir, cachear, compartir? → GET. enviar dades, crear, alguna cosa sensible? → POST.** I recorda: un GET no ha de canviar l'estat del servidor; això és treball de POST, PUT i DELETE.

---

## 🕵️ Qui Soc?

Endevina quin concepte de la unitat soc:

1. **Soc l'idioma que parlen el client i el servidor, i el 200 és el meu saludet favorit.**
2. **Soc el servidor web que Java porta de sèrie; crée'm un port i un context i t'atendré.**
3. **Soc el format de dades que qualsevol llenguatge entén, amb claus i corxets.**
4. **Soc la capçalera que delata si la resposta és HTML, JSON o text pla.**
5. **Soc el client de Java 11+ que consulta APIs alienes amb el trio client-petició-resposta.**
6. **Soc la llibreria que convertix JSON en objectes Java, amb `fromJson` com a conjur.**

<details>
<summary>🔄 Respostes</summary>

1. **HTTP** — petició-resposta, i `200` és "tot bé".
2. **`HttpServer`** — `createContext` + `start()` i a servir.
3. **JSON** — objectes `{...}` i arrays `[...]`.
4. **`Content-Type`** — `text/html`, `application/json`...
5. **`HttpClient`** — `HttpClient`, `HttpRequest` i `HttpResponse`.
6. **Gson** — `gson.fromJson(cos, Classe.class)`.

</details>

---

## 🤬 CONRAD VS EL MÓN: "El port que no arranca"

> *CONRAD, el nostre compilador cascarrabutxes, opina sobre els clàssics del novell en la web.*

**CONRAD:** — UNA ALTRA VEGADA! Ve un alumne i em diu: *CONRAD, el meu servidor no arranca*. I jo: val, quin error? *Pues una cosa de "Address already in use".* AI, MARE MEUA! Tens una altra instància del servidor corrent des de la pràctica anterior. Tanca la pestanya de la terminal o canvia de port: `new InetSocketAddress(8081, 0)`. El port no és de la teua propietat vitalícia.

*I després està el de l'HTML.* Torna una pàgina i el navegador li mostra el codi en comptes de la web. Endevines què falta? El `Content-Type: text/html`. Sense la capçalera, el navegador fa el que pot, i el que pot és mostrar-te el codi com a text pla. La capçalera és l'uniforme: sense ella, ningú sap què eres.

*I el colmo dels colmos:* el que parseja el JSON a mà amb `split`. Li arriba un títol amb una cometa i Gson no té cap culpa: és que el `split("\"titulo\":\"")` s'ha descosit. Per què? Perquè existix Gson per a això. Al servidor i al client: **per a parsejar JSON, deixa de fer servir tisores.** Un `split` és per a aprendre, no per a produir.

**La lliçó:** abans d'acusar Java de "odiar-te", repassa el trio sagrat de la unitat: **tinc la capçalera correcta? estic usant el mètode HTTP adequat? estic parsejant JSON amb una ferramenta de veritat?** El compilador no t'odia: t'està passant les respostes de l'examen.

---

## 🎮 El Joc de les Decisions

Tria la resposta correcta per a cada decisió (respostes al final):

1. Un formulari d'inici de sessió envia la contrasenya. GET o POST?
   - a) GET   b) POST
2. El teu endpoint torna una llista d'usuaris. Quin `Content-Type` poses?
   - a) `text/html`   b) `application/json`
3. El client demana `/api/tareas/99` i eixa tasca no existix. Quin codi tornes?
   - a) `200`   b) `404`
4. En `HttpClient`, quin mètode envia dades en el cos de la petició?
   - a) `.GET()`   b) `.POST(...)`
5. `gson.fromJson(cos, Usuario.class)` amb un camp que no està en el JSON... què rep eixe camp?
   - a) `null`   b) `""` (cadena buida)

<details>
<summary>🔄 Solucions</summary>

1. **b)** — La contrasenya viatja en el cos del POST, no en la URL.
2. **b)** — `application/json`. Tornes dades, no una pàgina.
3. **b)** — `404`: el recurs demanat no existix.
4. **b)** — `.POST(...)` porta el `BodyPublisher`; `.GET()` no envia cos.
5. **a)** — Gson deixa els camps absents en `null`. Per això es comproven amb `has(...)` / `isJsonNull()`.

</details>

---

## ⚡ Laboratori de Tortura: el servidor que no era

> **Duració estimada:** 30 minuts
> **Ferramenta:** el teu IDE i un fitxer nou

**L'escenari:** copia este programa i fes que funcione. Et diuen que té **3 errors** que impedixen que compile i 1 error de lògica que fa que el JSON isca malament... però, i si t'ho diuen malament? La teua tasca: fer que compile, que execute i que **tota** l'eixida siga correcta, comptant tu els errors reals.

```java
import com.sun.net.httpserver.HttpServer;
import java.net.InetSocketAddress;

public class ApiHora {

    public static void main(String[] args) throws Exception {
        HttpServer server = HttpServer.create(
            new InetSocketAddress(8080), 0
        );
        server.createContext("/api/hora", e -> {
            String json = "{\"hora\": \"" + java.time.LocalTime.now() + "\"}";
            e.getResponseHeaders().set("Content-Type", "application/json");
            e.sendResponseHeaders(200, json.getBytes().length);
            e.getResponseBody().write(json.getBytes())
            e.getResponseBody().close();
        });
        server.setExecutor(null);
        server.start();
        System.out.println("Servidor en http://localhost:8080")
    }
}
```

**Fallada intencionada:** el nombre d'errors de l'enunciat està malament a propòsit: si busques el "tercer error de compilació" i "l'error de lògica", te'n tornes boig. La trampa és la teua confiança en l'enunciat.

**La teua tasca:** aconseguir que compile, que execute i que **tota** l'eixida siga correcta. Si el resultat no quadra, diagnostica.

**Pistes per quan et frustres (no abans):**

1. Falta algun `;`? *no → seguix buscant.*
   <details><summary>I si continuec atascat?</summary>Repassa la línia `e.getResponseBody().write(json.getBytes())` i l'última del `main`: totes dues necessiten `;`.</details>
2. Compila ja? *no → mira els tipus i els imports.*
   <details><summary>I si continuec atascat?</summary>L'endpoint torna JSON i el `Content-Type` ja està. Mira una altra volta els `;`.</details>
3. Creus que hi ha un error de lògica que trenca el JSON? *Torna a llegir el codi amb calma i no et fies de l'enunciat.*
   <details><summary>Solució final</summary>

Els **errors de compilació**:

1. Falta el `;` al final de `e.getResponseBody().write(json.getBytes())`.
2. Falta el `;` al final de `System.out.println(...)`.

L'**error de lògica**: no existix. El JSON `{"hora": "09:30:05"}` es construïx bé i el `Content-Type` és correcte. Eixa era la fallada intencionada: l'enunciat diu "3 errors de compilació i 1 de lògica", però només hi ha 2 faltes de `;` i cap lògica trencada. L'error "amagat" era la teua confiança en l'enunciat. El servidor funciona en `http://localhost:8080/api/hora`.

```java
import com.sun.net.httpserver.HttpServer;
import java.net.InetSocketAddress;

public class ApiHora {

    public static void main(String[] args) throws Exception {
        HttpServer server = HttpServer.create(
            new InetSocketAddress(8080), 0
        );
        server.createContext("/api/hora", e -> {
            String json = "{\"hora\": \"" + java.time.LocalTime.now() + "\"}";
            e.getResponseHeaders().set("Content-Type", "application/json");
            e.sendResponseHeaders(200, json.getBytes().length);
            e.getResponseBody().write(json.getBytes());
            e.getResponseBody().close();
        });
        server.setExecutor(null);
        server.start();
        System.out.println("Servidor en http://localhost:8080");
    }
}
```

La lliçó real: **llig el codi, no l'enunciat**. Un bug pot ser que et diguen "hi ha 3 errors" i només n'hi haja 2: si busques el tercer, et tornes boig. Compta, verifica i confia en el compilador, no en la llegenda.

</details>

---

## 🏆 Assoliments d'esta unitat

| Assoliment | Com aconseguir-ho |
|---|---|
| 🏅 **El Carter** | Explicar la diferència entre GET i POST amb un exemple de cadascun |
| 🏅 **El Gran Cap del Port** | Muntar un `HttpServer` que no diga "Address already in use" i servisca dues rutes |
| 🏅 **El Sommelier de Content-Type** | Tornar HTML, JSON o text pla amb la capçalera correcta en cada cas |
| 🏅 **El Client Elegant** | Consumir una API externa amb `HttpClient` i parsejar el JSON amb Gson |
| 🏅 **El Mestre de l'API** | Construir un CRUD REST complet (GET, POST, PUT, DELETE) en memòria |

---

## 🧠 Atreveix-te a Pensar

1. **Sense executar:** què imprimeix este programa?

```java
public class Acertijo {
    static String url = "/api/tareas/3";

    public static void main(String[] args) {
        String id = url.substring("/api/tareas/".length());
        System.out.println(id);
        System.out.println(url.split("/").length);
    }
}
```

2. **El servidor que espia:** quina capçalera poses perquè el navegador no faça memòria cau de les teues respostes JSON i sempre reba dades fresques?
3. **El detectiu del 403:** consumes una API sense autenticar-te i et torna `403`. Quina capçalera probablement et falta? I què has de fer per a aconseguir-la?
4. **Vertader o fals:** "un `GET` pot enviar dades en el cos de la petició".

<details>
<summary>💡 Solucions</summary>

1. Imprimeix `3` i després `4`. `substring` extrau l'ID de la ruta; `url.split("/")` dona `["", "api", "tareas", "3"]`, que són 4 trossos (el primer és buit perquè la URL comença per `/`).
2. `Cache-Control: no-cache` (o `no-store`). Així el navegador no servix la resposta de la memòria cau i torna a preguntar al servidor.
3. La capçalera **`Authorization`** amb un token. Per a aconseguir-lo, normalment registres una aplicació en la plataforma i obtens un token d'accés.
4. **Fals en la pràctica.** L'estàndard HTTP no ho prohibix del tot, però cap servidor decent ho respecta i `HttpClient` no t'ho posa fàcil: per a enviar dades usa POST, PUT o PATCH, que és el que el món espera.

</details>

---

## 🧩 Crucigrama de Bits

```
Horizontal:
1. Format de dades universal de la web, amb claus i corxets (4 lletres)
4. Servidor HTTP que Java porta de sèrie (11 lletres)
6. Codi d'estat per a "no trobat" (3 lletres)
7. Capçalera que diu el tipus de contingut (12 lletres)

Vertical:
2. Mètode HTTP per a enviar dades i crear recursos (4 lletres)
3. Client HTTP modern de Java 11+ (11 lletres)
5. Format de contingut d'una pàgina web (4 lletres)
```

<details>
<summary>📝 Solucions</summary>

**Horizontal:** 1. JSON · 4. HTTPSERVER · 6. CERO CUATRO CUATRO (404) · 7. CONTENTTYPE
**Vertical:** 2. POST · 3. HTTPCLIENT · 5. HTML

</details>

---

## 💬 Preguntes d'Entrevista de Treball

> Preguntes reals que et farien per a programador Java junior.

1. **"Explica'm, com si jo fóra la teua àvia, què és una API REST."**
2. **"Quina és la diferència entre GET i POST? Quan usaríes cadascun?"**
3. **"Què significa el codi 404? I el 500?"**
4. **"Com consumes una API externa en Java sense llibreries de tercers?"**
5. **"Què és Gson i per a què servix? Què passa si el JSON porta un camp que no està en el teu `record`?"**
6. **"Què és un `Content-Type` i per què és important?"**

---

## 🤷 No hi ha preguntes tontes

> ❓ **HTTP i HTTPS són el mateix?**

Quasi. HTTPS és HTTP amb una capa de xifrat (SSL/TLS): les dades viatgen encriptades. Per a producció, sempre HTTPS; per a desenvolupament local, HTTP val.

---

> ❓ **Què és CORS i per què em dona error?**

*Cross-Origin Resource Sharing*. El navegador bloqueja peticions d'un domini a un altre per seguretat. Per a desenvolupament, afig en el teu servidor: `intercambio.getResponseHeaders().add("Access-Control-Allow-Origin", "*")`.

---

> ❓ **El `HttpServer` és com Tomcat?**

No. `HttpServer` és mínim i didàctic: servix per a entendre el protocol. Tomcat és un servidor d'aplicacions complet (Servlets, JSP...). Ací usem just el necessari perquè la web deixe de ser màgia.

---

## 🎬 Post-Crèdits

La programadora acaba la seua primera API: un gestor de tasques servit amb `HttpServer`, amb els seus quatre verbs REST i un frontend que fa `fetch`. Funciona. Fins que obri el mòbil i vol consumir-la des de fora de l'ordinador, i descobrix que el localhost només viu en la seua màquina.

S'acosta CONRAD, el compilador cascarrabutxes, amb la seua tassa fumant.

**CONRAD:** — Això és el bonic del que acabes de construir: l'API ja no depén d'on s'executa. Hui viu en el teu portàtil; demà, en un núvol. Els que la consumixen només veuen rutes i JSON.

**Programadora:** — Val... però ara mateix tot està en un `ArrayList` que s'esborra en reiniciar. Quan aprenc a guardar-lo de veritat?

**CONRAD:** — *assentix* Això ja ho vas vore a la U13 amb JDBC: canvia el magatzem, no les rutes. La teua API no se n'assabenta. Però si em preguntes a mi, ja has recorregut un camí enorme: vas començar amb un `Hola, mundo` en una consola i acabes servint i consumint web. Això és tot el curs.

**Programadora:** — I ara què?

**CONRAD:** — *s'ajusta les ulleres* Ara tria. Spring Boot, el teu projecte final, la teua primera entrevista... El curs s'ha acabat, però la programació no: només canvia de terminal.

**🎓 FI DEL CURS.** De `System.out.println("Hola, mundo")` a servir i consumir APIs en 14 unitats. Ha sigut un plaer programar amb tu. Seguix escrivint codi! 🌐

---

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/14-apis-web) · **Anterior:** [08 · HttpClient avançat](/ApuntesProgramacion/va/14-apis-web/08-httpclient-avanzado) · **🎓 Fi del curs**