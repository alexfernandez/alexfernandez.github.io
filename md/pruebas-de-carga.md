% Pruebas de carga

![Imagen: [Queenslander](http://commons.wikimedia.org/wiki/File:StateLibQld_2_119360_Weighing_cotton_bales_at_the_Brisbane_ginnery.jpg)](pics/pruebas-de-carga.jpg "Weighing cotton bales at the Brisbane ginnery")

En esta ocasión nos vamos a alejar por un rato de node.js, y vamos a ver cómo hacer pruebas de carga a nuestro servidor web.

## Herramientas

Para empezar vamos a mirar un par de herramientas muy sencillas y libres (o si lo prefieres open source) que podemos usar completamente gratis.

### Apache ab

La más conocida es [ab](http://httpd.apache.org/docs/2.2/programs/ab.html), por _Apache Benchmark_. Un ejemplo sencillo de uso:

```
$ ab -c 10 -n 1000 http://127.0.0.1:8080/
```

Los parámetros más importantes son:

* -c _concurrencia_: número de peticiones concurrentes. Se lanzan tantos hilos como indique este parámetro, así que nunca tendremos más peticiones en vuelo que este número.
* -n _peticiones_: número total de peticiones a lanzar.
* -t _segundos_: tiempo de pruebas, tras el que ab dejará de recibir peticiones.

Después de los parámetros se añade la URL a probar. Hay otras opciones para enviar peticiones POST, añadir contenido en un formulario, y demás; pero para empezar vamos a suponer que nuestra aplicación tiene una [interfaz Rest](http://es.wikipedia.org/wiki/Representational_State_Transfer) y que por tanto se pueden hacer peticiones GET enviando toda la información necesaria en la URL.

_Los consejos del abuelo cebolleta_: si tu aplicación no es Rest, haz que lo sea. Será mil veces más sencilla de probar, porque sólo necesitarás un navegador para depurarla. ¡Haz tu vida más sencilla!

Vamos a probar nuestro nuevo juguete contra un servidor que nos hemos montado con [express](http://expressjs.com/). La salida de ab será algo así (dejando sólo las líneas más importantes):

```
$ ab -n 10000 http://127.0.0.1:8080/

Concurrency Level:      1
Time taken for tests:   4.895 seconds
Complete requests:      10000
Requests per second:    2042.84 [#/sec] (mean)
Time per request:       0.490 [ms] (mean)

Percentage of the requests served within a certain time (ms)
  50%      0
  66%      0
  75%      0
  80%      0
  90%      1
  95%      1
  98%      1
  99%      1
 100%     11 (longest request)
```

Los números más interesantes son las peticiones por segundo (abreviado req/s, por _requests per second_) y el tiempo por petición: estamos pasando de las 2000 req/s, y cada petición dura medio milisegundo, de media. Ahora vamos a añadir concurrencia con el parámetro `-c`: en lugar de ir todas las peticiones en secuencia, una tras otra, lanzaremos varias a la vez. ¿Para qué sirve tener múltiples peticiones a la vez? Para ver si nuestro servidor responde bien, claro: en la vida real un usuario no se espera a que termine el anterior para lanzar su petición. Además los resultados suelen ser incluso mejores:

```
$ ab -c 10 -n 10000 http://127.0.0.1:8080/

Concurrency Level:      10
Time taken for tests:   3.334 seconds
Complete requests:      10000
Requests per second:    2999.08 [#/sec] (mean)
Time per request:       3.334 [ms] (mean)
Time per request:       0.333 [ms] (mean, across all concurrent requests)

Percentage of the requests served within a certain time (ms)
  50%      3
  66%      3
  75%      3
  80%      4
  90%      4
  95%      5
  98%      7
  99%     10
 100%     27 (longest request)
```

¡Ahora llegamos casi a 3000 req/s! Nuestro servidor está aprovechando mejor el tiempo porque, cuando una petición está ocupada con algo, responde a la siguiente. ¿Significa esto que estamos listos para servir 2999 req/s? En absoluto; significa que, para esta petición en concreto, en local y con un número limitado de peticiones, nuestro servidor responde a estas peticiones por segundo. Esta medición es sólo un punto de partida que tenemos que refinar usando peticiones más complejas y condiciones más realistas.

Podéis ver más detalles sobre cómo usar ab en el [excelente tutorial de Jonathan Wiesel](http://codehero.co/como-hacer-pruebas-de-carga-servidores-web/). También se muestra cómo usar Siege, otra herramienta similar.

### loadtest.js

Al principio del artículo os he contado que íbamos a dejar node.js tranquilo. Pues lo siento pero os he soltado una mentirijilla. ¿En serio pensábais que íbamos a pasarnos una entrada entera sin hablar de nuestro servidor favorito?

El buen ingeniero, como el artesano de antaño, siempre elige sus herramientas cuidadosamente; y si no existen se las inventa. La siguiente librería es obra del autor de este artículo; [loadtest](https://npmjs.org/package/loadtest) ([repo GitHub](https://github.com/alexfernandez/loadtest)). Aparte de usar los parámetros más importantes compatibles con ab, como `-n` o `-c`, tiene una opción muy interesante que nos permite enviar un número fijo de peticiones por segundo a nuestro servidor.

Para instalarla sólo tenemos que usar [npm](https://npmjs.org/), el gestor de paquetes de node, como root:

```
# npm install -g loadtest
```

En Ubuntu o Mac OS X se usa `sudo`:

```
$ sudo npm install -g loadtest
```

¡Y listo! Ya tenemos instalado un comando `loadtest` que nos va a ayudar a probar nuestra aplicación web. Un ejemplo sencillo, similar a los que ya hemos visto. Vamos a lanzar 10000 peticiones, con 10 peticiones concurrentes, a un servidor local en el puerto 8080. Las opciones básicas son iguales que las de `ab`; la salida es similar pero más escueta, y los resultados se parecen bastante:

```
$ loadtest -c 10 -n 10000 http://127.0.0.1:8080/

Completed requests:  10000
Total time:          4.472977 s
Requests per second: 2236
Mean latency:        4.44 ms

Percentage of the requests served within a certain time
  50%      4 ms
  90%      6 ms
  95%      7 ms
  99%      12 ms
 100%      19 ms (longest request)
```

Ahora en lugar de 3000 estamos alrededor de las 2200 req/s. ¿Por qué nos quedamos bastante por debajo que antes? Hay que decir que loadtest tiene un cierto overhead al estar escrito para node.js y no en C súper-optimizado, por lo que es normal ver cifras ligeramente peores. Dicho esto, la herramienta está optimizada y el overhead no debería nunca superar un milisegundo. Aunque en nuestro servidor trivial se note mucho, en un servidor más realista (o lanzando las pruebas desde otra máquina) debería dejar de afectar a los resultados.

Ahora empieza la diversión. ¿Por qué usar loadtest si tiene los mismos parámetros y peor rendimiento? Por las opciones avanzadas, claro.

* --rps _tasa_: número de peticiones por segundo a lanzar. ¿No es igual que la concurrencia? En absoluto; `--rps` lanza (siempre que pueda) la tasa pedida de peticiones, aunque las anteriores no hayan terminado. Esto nos permite controlar la carga de peticiones que enviamos cada segundo al servidor.
* --noagent: no usar el agente integrado de node.js. Por defecto, node.js limita la salida a 10 conexiones en vuelo, lo que puede afectar a las pruebas; este parámetro elimina ese límite. Viene activado de fábrica.
* --keepalive: usa el agente [agentkeepalive](https://github.com/TBEDP/agentkeepalive), que añade `Connection: Keep-alive` y está muy mejorado sobre el que viene en node.js. Por defecto, node.js limita la salida a 10 conexiones en vuelo, con lo que las pruebas pueden verse afectadas.

_Nota de precaución_: el agente por defecto de node.js apesta de mala manera: tiene un pool de sólo 10 conexiones, lo que nos puede limitar si necesitamos enviar más peticiones a la vez. Pero desactivarlo con `--default` implica no usar agente y perder el keep-alive: se abre una conexión cada vez al servidor que estamos probando, lo que puede perjudicar el rendimiento. Es recomendable usar siempre `--keepalive`.

Vamos a probar ahora nuestro servidor con agentkeepalive:

```
$ loadtest --keepalive -c 10 -n 10000 http://127.0.0.1:8080/

Completed requests:  10000
Total time:          3.04171 s
Requests per second: 3288
Mean latency:        3.01 ms

Percentage of the requests served within a certain time
  50%      2 ms
  90%      4 ms
  95%      5 ms
  99%      9 ms
 100%      22 ms (longest request)
```

¡Mejor resultado incluso que con `ab`! Al no tener que abrir una conexión nueva para cada petición, ahorramos recursos tanto en el cliente de pruebas como en el servidor.

De nuevo, ¿significa eso que nuestro servidor está preparado para responder a 3000 req/s? Vamos a verificarlo enchufándole un número fijo de peticiones por segundo con la opción `--rps`, a ver qué pasa. Empezaremos con 2000:

```
$ loadtest --keepalive --rps 2000 -n 10000 http://127.0.0.1:8080/

Completed requests:  10000
Total time:          5.545158 s
Requests per second: 1803
Mean latency:        137.73 ms

Percentage of the requests served within a certain time
  50%      146 ms
  90%      214 ms
  95%      221 ms
  99%      232 ms
 100%      238 ms (longest request)
```

¡Sorpresa! Nuestro servidor se viene abajo, ahora no llega ni a las 2000 req/s pedidas. ¿Cómo puede ser que dé peor respuesta (y una latencia de más de 100 milisegundos) con menos peticiones? Para explicar este misterio tenemos que ver cómo funcionan estas pruebas. Con `ab` (y con loadtest hasta ahora) enviamos unas cuantas peticiones al servidor; el servidor las procesa como puede, con los retrasos que tenga en cada momento, y cuando las responde enviamos más. El parámetro -c se asegura de que nunca haya más de 10 peticiones en vuelo. Siempre podemos subir la concurrencia, pero tampoco será muy realista acumular decenas de peticiones en vuelo.

Con loadtest podemos usar una tasa fija de req/s, que le llegarán al servidor tanto si ha respondido las anteriores como si no. Puede ser que otro proceso esté usando la CPU en ese momento, o que tenga que acceder a disco para recuperar un recurso. Resultado: en cuanto se le empiezan a acumular peticiones, la respuesta decae. Esta prueba es mucho más realista que las anteriores, y evidencia más cómo el servidor puede sufrir incluso ante pausas de unos pocos milisegundos. En la vida real las peticiones tienden a agolparse todavía más, en lugar de llegar siempre de forma uniforme, así que la respuesta será incluso peor.

Ahora vamos a probar a enviarle más peticiones al servidor con las mismas req/s, para comprobar si la respuesta es constante. Si vemos que empieza a venirse abajo, o que la respuesta es muy errática, sabremos que nuestro servidor no aguanta la carga. loadtest muestra una traza cada cinco segundos que nos va indicando cómo va el proceso, así que vamos a lanzarle 100K peticiones en total.

```
$ loadtest --keepalive --rps 2000 -n 100000 http://127.0.0.1:8080/

Requests: 8949 (9%), requests per second: 1790, mean latency: 64.12 ms
Requests: 18728 (19%), requests per second: 1956, mean latency: 47.21 ms
Requests: 27418 (27%), requests per second: 1738, mean latency: 579.05 ms
Requests: 36508 (37%), requests per second: 1818, mean latency: 1112.56 ms
Requests: 45402 (45%), requests per second: 1778, mean latency: 1670.62 ms
Requests: 55122 (55%), requests per second: 1944, mean latency: 1986.79 ms
Requests: 65180 (65%), requests per second: 2011, mean latency: 1954.7 ms
Requests: 75231 (75%), requests per second: 2011, mean latency: 1954.87 ms
Requests: 84895 (85%), requests per second: 1933, mean latency: 2016.92 ms
Requests: 93252 (93%), requests per second: 1671, mean latency: 2464.68 ms

Completed requests:  100000
Total time:          53.96305 s
Requests per second: 1853
Mean latency:        1512.71 ms
```

Aunque la CPU no llegue al 100%, vemos cómo se van acumulando peticiones y la respuesta se degrada. Bajando el flujo a 1500 req/s los resultados son estables.

```
$ loadtest --keepalive --rps 1500 -n 100000 http://127.0.0.1:8080/

Requests: 6060 (6%), requests per second: 1212, mean latency: 6.6 ms
Requests: 13545 (14%), requests per second: 1497, mean latency: 8.41 ms
Requests: 21059 (21%), requests per second: 1503, mean latency: 5.83 ms
Requests: 28564 (29%), requests per second: 1501, mean latency: 2.69 ms
Requests: 36060 (36%), requests per second: 1499, mean latency: 3.32 ms
Requests: 43564 (44%), requests per second: 1501, mean latency: 2.66 ms
Requests: 51062 (51%), requests per second: 1500, mean latency: 2.27 ms
Requests: 58565 (59%), requests per second: 1501, mean latency: 1.7 ms
Requests: 66059 (66%), requests per second: 1499, mean latency: 2.97 ms
Requests: 73563 (74%), requests per second: 1501, mean latency: 1.71 ms
Requests: 80991 (81%), requests per second: 1486, mean latency: 13.12 ms
Requests: 88565 (89%), requests per second: 1515, mean latency: 13.02 ms
Requests: 96059 (96%), requests per second: 1499, mean latency: 9.44 ms

Completed requests:  100000
Total time:          67.630739 s
Requests per second: 1479
Mean latency:        5.63 ms
```

Ahora sí: hay una cierta oscilación alrededor del 66% de las peticiones, pero el sistema tiende a recuperarse y no es inestable como antes.

## Diseño de pruebas de carga

Ya sabemos cómo lanzar nuestra herramienta favorita. Ahora, ¡paremos el carro un poco! Vamos a ver para qué sirven estas pruebas de carga, y cómo diseñar unas pruebas que cumplan nuestras expectativas.

### Preguntas, preguntas

El objetivo de las pruebas de carga es responder a preguntas vitales para cualquier negocio:

* ¿Soportarán los servidores la carga esperada?
* ¿Cuántos servidores necesitaremos?
* ¿Cuál será el coste por usuario?

Pero, por importantes que puedan parecer para quien las hace, estas preguntas son sólo el principio del camino; necesitamos algo más concreto para empezar a movernos.

Las pruebas bien diseñadas se basan siempre en preguntas *precisas y objetivas*: que se responden con datos y no con opiniones, y que no admiten ambigüedad (por ejemplo, se pueden responder con “sí” o “no”). También tienen que ser *realistas*: basadas en nuestra situación y no en algún objetivo inalcanzable. La primera parte de nuestro trabajo es reformular las preguntas de negocio a su equivalente ingenieril. Por ejemplo:

* _¿Dará buen rendimiento nuestro servidor?_ Esta pregunta es algo difusa: es difícil saber qué es “bueno” sin precisar más. Tenemos que pulirla algo más.
* _¿Responderá el servidor a las peticiones en menos de 100 ms?_ Hemos avanzado bastante: esta pregunta es bastante más precisa y no tiene ambigüedades. Pero representa un objetivo inalcanzable, porque siempre puede haber alguna petición que se escape del margen pedido (por buena que sea la media), y por tanto la respuesta será casi siempre “no”. Tenemos que afinar todavía más.
* ¿Responderá el servidor al 99% de las peticiones en menos de 100 ms? Ahora sí: podemos responder claramente con datos, y es alcanzable.

### Objetivos

Aunque hemos avanzado algo, ni siquiera hemos terminado con la primera pregunta de negocio, que (recordemos) era:

> ¿Soportarán los servidores la carga esperada?

Todavía nos queda traducir “carga esperada” a cifras concretas. Por ejemplo, supongamos que esperamos llegar a 100.000 usuarios únicos en el primer año: ¿cuántas peticiones veremos en nuestros servidores? ¿Cuántas páginas servidas, y cuántas peticiones a nuestra API son eso?

El camino tradicional es el siguiente: partiendo de una cifra imaginaria de usuarios, podemos estimar cuántos usuarios activos esperar por día, cuántas peticiones por minuto hace un usuario activo, y ya sólo necesitamos saber las peticiones por minuto que aguanta nuestro servidor para calcular cuántos usuarios únicos podemos tener contentos con un único servidor. Pero tiene un pequeño problema: cada estimación que hagamos añade *incertidumbre* a nuestros resultados. Una ecuación con tantos parámetros inciertos como la que estamos montando terminará dando pura fantasía…

Así que lo ideal es recoger primero datos reales sobre el terreno que soporten nuestros cálculos. Por ejemplo, si sabemos que la carga con 10.000 usuarios únicos al mes es de 150 peticiones/minuto, es fácil estimar que con 100.000 tendremos 1500 peticiones/minuto.

Sólo nos falta saber cuántas peticiones por minuto aguanta nuestro servidor, que es donde entran nuestras herramientas favoritas.

### Limitaciones

Por definición, las pruebas de carga son una simulación. Hay que ser consciente siempre del valor que tienen: nos permiten encontrar puntos flacos en nuestro sistema, y estimar el rendimiento real. Pero la realidad es muy tozuda, y por más que queramos reproducirla en nuestro laboratorio, el mundo exterior nos va a dar sorpresas.

Es importante recalcar este punto cuando presentemos nuestros resultados al cliente o a la gente de negocio: a no ser que dediquemos tiempo infinito a replicar el tráfico real con todas sus peculiaridades, nuestras respuestas siempre serán parciales y sujetas a error. Aunque pongamos todo nuestro esfuerzo puede que ni conozcamos todas estas peculiaridades en el momento de realizar las pruebas de carga, por lo que siempre nos podemos equivocar en nuestros objetivos.

_Más consejos del abuelo cebolleta_: no afines demasiado calculando la carga que soporta cada máquina, date siempre margen para incluir las posibles incertidumbres. Pero: no uses ese margen para cubrir ineficiencias del sistema, lo necesitarás.

### Bancos de pruebas (_benchmarks_)

Para estimar el rendimiento de un servidor podemos usar los bancos de pruebas de los fabricantes: para cualquier producto que queramos usar es fácil encontrar informes de cuántas peticiones por segundo puede responder, tiempos de respuesta y demás. Estos _benchmarks_ son muy populares sobre todo para bases de datos, aunque en los últimos tiempos muchos fabricantes han prohibido su publicación. Pero sigue habiendo mucha información para software libre. Así pues, ¿por qué complicarse la vida haciendo pruebas propias?

Lo malo es que los _benchmarks_ son como el [oráculo de Delfos](http://es.wikipedia.org/wiki/Or%C3%A1culo_de_Delfos): le podemos preguntar lo que queramos, que nos responderá lo que le dé la gana. El fabricante siempre intentará que su producto salga bien parado en las pruebas, y además probablemente sepa optimizarlo mejor que nosotros. Por poner un ejemplo: no responde igual un servidor Apache cuando sirve una imagen estática de 5 KB que cuando sirve una página PHP de 200 KB. Además, la respuesta puede cambiar muchísimo según la configuración que usemos.

Por eso se realizan pruebas de carga simulando tráfico real: lanzando peticiones típicas al servidor y midiendo la respuesta en condiciones similares a las reales. Todo centrado en nuestro caso concreto y lo más realista posible. No es muy útil simular peticiones de 100 bytes si el grueso de nuestro tráfico son páginas de 100 KB — aunque, como veremos, estas pruebas tienen su sitio para detectar problemas.

## Escalabilidad

Hemos diseñado las pruebas y las hemos lanzado. ¿Qué hacemos ahora con los resultados? Afinar y mejorar, claro.

En esta siguiente etapa vamos a intentar dar respuesta a la segunda pregunta de negocio que vimos arriba:

> ¿Cuántos servidores necesitaremos?

Y de forma indirecta a la tercera, porque podremos calcular el coste por usuario.

Si un servidor nos da 100 req/s, para conseguir llegar a 2000 req/s vamos a necesitar 20 servidores, ¿verdad? ¡En tus sueños!

### Un camino espinoso

El camino hacia la escalabilidad pasa siempre por mantener la (*atención, palabro*) linealidad.

Suena rimbombante, pero lo que queremos decir se expresa de forma muy sencilla: doblando el número de servidores soportaremos el doble de carga, expresada en peticiones por segundo. Y lo mismo duplicando el número de núcleos, la frecuencia de la CPU, etcétera. También necesitaremos el doble de memoria y de recursos en general.

Lo que nos permiten las pruebas de carga es, precisamente, detectar pérdidas de linealidad. Supongamos que con un solo proceso aguantamos 15 req/s. ¿Qué podemos esperar si activamos el [modo cluster](modo-cluster.html) con dos procesadores? Pues 30 req/s, claro… Si vemos menos, es que hemos encontrado un cuello de botella. Puede ser que se nos haya agotado algún otro recurso (memoria, conexiones, o lo que sea) o que otro elemento esté saturado (base de datos, interfaz de red…).

También nos permitirán encontrar problemas de rendimiento cuando la respuesta no sea constante en el tiempo y tenga altibajos, o cuando el sistema empiece a dar errores al saturarse. Lo ideal es que el sistema deje de responder a las peticiones que no pueda atender, pero siga sirviendo correctamente un número razonable.

Los fallos deben también ser (atención, semi-palabro) recuperables: el sistema debe recuperarse por sí solo, sin necesidad de tener que reiniciar servicios ni servidores. Cualquier error que deje tumbados nuestros servidores es un problema catastrófico que tenemos que resolver — o nos quitará el sueño por las noches. Muchas veces literalmente, en forma de llamada airada de responsables de servicio o (incluso peor) de usuarios.

### Reduccionismo

Supongamos que tenemos un problema de rendimiento que afecta a nuestros servidores, pero no sabemos dónde. Lo que tenemos que hacer para encontrarlo es ir quitando elementos que puedan afectar al rendimiento. ¿Sospechamos que la base de datos puede estar muy saturada? Usaremos una base de datos limpia para pruebas. ¿Todavía sospechamos que se satura? La sustituiremos por una respuesta simulada, o haremos pruebas de carga de la base de datos sola. ¿La memoria es un problema? Usaremos objetos vacíos que no ocupen memoria.

Así iremos quitando trozos de nuestro sistema, corriendo las pruebas de nuevo, hasta que el problema desaparezca. En ese momento habremos encontrado la causa.

## Cuándo probar

¿Cuándo debemos lanzar pruebas de carga, y con qué frecuencia?

### Pruebas reactivas o proactivas

Lo habitual es usar las pruebas de carga para diagnosticar un problema en el sistema. Usando nuestro método reduccionista, podemos encontrar fácilmente la causa de un problema.

Para nota, podemos ejecutar pruebas de carga antes de ver los problemas. Un buen momento es, por ejemplo, cuando esperemos un pico de carga, un lanzamiento, etcétera. También es recomendable usar las pruebas de carga para dimensionamiento del sistema: saber, por ejemplo, cuántos servidores necesitaremos. Siempre con las precauciones que hemos visto arriba sobre la precisión de los resultados, dejando margen para posibles incertidumbres.

### Pruebas integradas

Un truco que vale la pena aplicar: podemos lanzar una versión reducida de nuestras pruebas de carga de forma rutinaria, junto con el resto de pruebas de sistema. Así podremos detectar regresiones antes de ponerlas en producción.

Por ejemplo, podemos lanzar 1000 peticiones seguidas, verificar que no dan errores y que la latencia media está por debajo de 100 ms. Si alguna de estas condiciones falla abortamos el despliegue.

loadtest tiene una API que nos permite lanzarlo desde nuestro programa node.js y recoger los resultados en una callback. Es trivial integrarlo en nuestro sistema de despliegue automático — cosa sobre la que hablaremos otro día.

## Conclusión

Eso es todo por hoy. Si no conocías las pruebas de carga, espero haberte ayudado a añadir una flecha a tu carcaj. En cualquier caso, usa esta técnica cuando sea necesario, aprende a conocer tus herramientas, y sobre todo ¡disfruta!

`---8<---8<---8<---8<---8<---`

Original publicado en [GodTIC](http://www.godtic.com/blog/2013/08/27/pruebas-de-carga/) el 2013-08-27.

De vuelta al [índice](../index.html).

