---
title: node.js: ¿rápido como el rayo?
footer: Original publicado en [GodTIC](http://www.godtic.com/blog/2013/11/12/node-js-rapido-como-el-rayo/) el 2013-11-12.
---

![Imagen: [MGR!](http://commons.wikimedia.org/wiki/File:Tormenta_sobre_Madrid_%28Salamanca%29_01.jpg)](pics/nodejs-rapido-como-el-rayo.jpg "Tormenta sobre Madrid (Salamanca) 01")

Muchos de vosotros habréis llegado a node.js atraídos por su supuesta “velocidad”. ¿Es realmente tan rápido sirviendo páginas web como lo pintan? En esta entrada vamos a investigar un poco sobre este mito, tomando como banco de pruebas un clon experimental de memcached hecho en node: [nodecached](https://npmjs.org/package/nodecached). Por el camino haremos unas cuantas [pruebas de carga](pruebas-de-carga.html) y veremos algunos trucos de optimización.

## Comparaciones odiosas

Se oye a menudo por ahí que node.js es muy rápido. ¿Qué quiere decir eso exactamente? Sabemos que node es un servidor que corre código JavaScript; aunque su motor V8 (adaptado de Chrome) sea muy rápido, sigue siendo un lenguaje interpretado, lo que claramente es una desventaja frente a código nativo — e incluso frente a código gestionado como Java o .NET. ¿Hasta dónde llega esa desventaja?

### Eligiendo el campo de batalla

La mejor forma de encontrar los límites del rendimiento es hacer una comparativa con un servidor rápido.

En esta ocasión vamos a dejarnos de servidores web: en su lugar, jugaremos con un servidor que tiene un protocolo sencillo y fácil de replicar. Y no se trata del típico chat.

Podíamos hacer como todo el mundo y comparar node.js [contra .NET](http://stackoverflow.com/questions/9290160/node-js-vs-net-performance). Al fin y al cabo ya lo ha hecho [mucha](http://www.salmanq.com/blog/net-and-node-js-performance-comparison/2013/03/) [gente](http://guillaume86.calepin.co/dotnet-vs-nodejs-performance.html), ¿qué daño puede haber en un artículo más? Y ya puestos, ¿por qué no contra [Java](http://stackoverflow.com/questions/16253557/in-http-mode-does-node-js-have-substantial-performance-advantage-over-java)?, o para ser más precisos contra Tomcat o algún otro servidor J2EE. Este campo está también [muy trillado](http://java.dzone.com/articles/performance-comparison-between). Y no hablemos del [pobre](http://zgadzaj.com/benchmarking-nodejs-basic-performance-tests-against-apache-php) [PHP](http://www.appdynamics.com/blog/2013/10/17/an-example-of-how-node-js-is-faster-than-php/)…

No, estos servidores de uso mayoritariamente corporativo están altamente optimizados para lo que hacen, pero siguen teniendo limitaciones básicas: máquinas virtuales que corren código gestionado. Además, los servidores web añaden peso al procesamiento; en el mejor de los casos estaríamos probando su eficiencia interna. Vamos a intentar llegar un poco más abajo en el stack, quedándonos al nivel de socket. Elegimos como contendiente a [memcached](http://memcached.org/): un servidor escrito en C y optimizado hasta la muerte por usuarios interesados (embarcados, entre otras cosas, en pugnas de velocidad con Redis). El manejo de datos interno es además muy sencillo: una simple caché LRU en memoria. ¿Qué mejor rival para verificar la supuesta velocidad de node.js?

Para tener más base de comparación usamos también [Couchbase Server](http://www.couchbase.com/couchbase-server/overview): una base de datos NoSQL que tiene el mismo protocolo que memcached pero una implementación diferente en Erlang y C.

### Clonando memcached

Hacer un clon de memcached es relativamente fácil: el [protocolo básico](https://github.com/memcached/memcached/blob/master/doc/protocol.txt) es muy sencillo. La operación `set key ... value` recibe una clave y un valor y los guarda. Opcionalmente podemos especificar un tiempo de vida del objeto y unos flags. Con `get key` pasamos la clave y obtenemos el valor. Por último, `delete key` borra la clave y el valor asociado.

Vaya por delante que no estamos innovando mucho: buscando por “memcached server node.js” encontramos un tipo que ha hecho un [clon de memcached](https://groups.google.com/forum/#!topic/nodejs/gqZZmMf3W5M) en 100 líneas ([200 incluyendo la caché LRU](https://gist.github.com/fxsjy/3291755)).
Pero es un ejercicio interesante: el caso de uso está bastante cerca de un servidor corporativo que no sea web. Curiosamente, hay muchas librerías en npm [relacionadas con memcached](https://npmjs.org/search?q=memcached), muchos clientes y utilidades, pero no he encontrado ningún servidor.

El resultado es [nodecached](https://npmjs.org/package/nodecached), una implementación muy básica que hasta el momento ni siquiera libera memoria cuando debería. Implementamos sólo versiones simplificadas de los comandos básicos: `get`, `set` y `delete`. El plan es completar los comandos, cosa que no debería ser difícil ya que el [parser](https://github.com/alexfernandez/nodecached/blob/master/lib/parser.js) es configurable.

Por ahora lo que tenemos nos servirá para nuestros aviesos propósitos: podemos jugar con el código y probar diferentes parámetros de optimización.

### Librería cliente

Una vez implementado el servidor tenemos que escribir también un [cliente](https://github.com/alexfernandez/nodecached/blob/master/lib/client.js), y una [librería de pruebas de carga](https://github.com/alexfernandez/nodecached/blob/master/lib/loadtest.js) similar a [la que ya vimos en su momento](pruebas-de-carga.html).

La librería funciona de la siguiente manera: lanza un número de peticiones GET con una clave aleatoria, que por lo tanto no van a devolver nada. Y ya está: ni escritura previa, ni precalentamiento, ni nada. Se considera que la petición ha tenido éxito si no da error (aunque no devuelva nada).

Podemos elegir el nivel de concurrencia con la opción `-c` y el número de peticiones con `-n`, como con [Apache ab](http://httpd.apache.org/docs/2.2/programs/ab.html). Luego sólo tenemos que pasar el puerto, por ejemplo:

```
$ node bin/loadtest.js -c 10 -n 100000 11211
```

lanzará cien mil peticiones con concurrencia 10 contra un servidor en el puerto por defecto de memcached, 11211. Si queremos probar contra el Couchbase instalado localmente sólo tenemos que cambiar el puerto al 11212:

```
$ node bin/loadtest.js -c 10 -n 10000 11212
```

La salida, también inspirada en Apache ab, nos muestra los resultados de esta forma:

```
Concurrency Level:      10
Time taken for tests:   0.399 seconds
Complete requests:      10000
Failed requests:        0
Requests per second:    25063 [#/sec] (mean)
Time per request:       0.0399 [ms] (mean)
Time per request:       0.00399 [ms] (mean, across all concurrent requests)
```

En este caso todas las pruebas (10000) han finalizado correctamente. En lo sucesivo mostraremos sólo las partes relevantes de la salida, normalmente las peticiones por segundo y poco más.

## Las pruebas

Llega el momento de arrancar nuestro invento.

### La máquina

El ordenador elegido para las pruebas tiene un procesador i3-2120T @2.60GHz con sólo dos cores, elegido por su bajo consumo y no por su rendimiento estelar — no en vano es un procesador de portátil. Corre Debian testing con la versión de node 0.8.23, un tanto anticuada; más adelante probaremos también la 0.10.20 para comprobar si hay diferencias.

### El servidor

Como aconsejaron al [clonador de las 100 líneas](https://groups.google.com/forum/#!topic/nodejs/gqZZmMf3W5M), arrancamos el servidor con la opción `--nouse_idle_notification` para domesticar un poco la máquina virtual y que no recoja la basura cuando le parezca. Elegimos el puerto 11311 para nuestro servidor:

```
$ node --nouse_idle_notification bin/nodecached.js -p 11311
```

Y ¡ya estamos andando!

### El cliente

Vamos a correr nuestro cliente básico contra los tres servidores en puertos diferentes:

* 11211: memcached 1.4.13.
* 11212: CouchBase community 1.8.1.
* 11311: node.js 0.8.23.

La primera prueba irá con concurrencia uno: un solo cliente lanzando peticiones en serie. Los resultados son los siguientes, primero para nuestro servidor nodecached:

```
$ node bin/loadtest.js -n 10000 11311
Concurrency Level:      1
Time taken for tests:   0.877 seconds
Complete requests:      10000
Requests per second:    11403 [#/sec] (mean)
Time per request:       0.0877 [ms] (mean)
```

A continuación para memcached:

```
$ node bin/loadtest.js -n 10000 11211
Concurrency Level:      1
Time taken for tests:   0.898 seconds
Complete requests:      10000
Failed requests:        0
Requests per second:    11136 [#/sec] (mean)
Time per request:       0.0898 [ms] (mean)
```

Y por último para Couchbase:

```
$ node bin/loadtest.js -n 10000 11212
Concurrency Level:      1
Time taken for tests:   0.871 seconds
Complete requests:      10000
Failed requests:        0
Requests per second:    11481 [#/sec] (mean)
Time per request:       0.0871 [ms] (mean)a
```

Más de 11000 peticiones por segundo, que vamos a abreviar a 11 kreq/s. ¡Qué bien!, ¿no?

Es curioso: los tres servidores tienen una respuesta muy parecida, cuando son tres programas completamente diferentes en lenguajes distintos. ¿No será una limitación fundamental de nuestro cliente? Primero vamos a intentar aumentar el nivel de concurrencia a 10:

```
$ node bin/loadtest.js -n 10000 -c 10 --delay 11311
Concurrency Level:      10
Time taken for tests:   0.608 seconds
Complete requests:      10000
Failed requests:        0
Requests per second:    16447 [#/sec] (mean)
```

A partir de este punto nos quedaremos sólo con las peticiones por segundo, tomaremos tres medidas y mostraremos la media. Los resultados son:

```
nodecached: 16.1 kreq/s,
memcached: 16 kreq/s,
Couchbase: 16.3 kreq/s.
```

¡Otra vez resultados muy parecidos! Probando con distintas concurrencias no conseguimos mejores tiempos. Lo que necesitamos es contrastar el rendimiento con otro cliente diferente.

### MC Benchmark

Esta librería con nombre de rapero geek está escrita en C, y hay que compilarla a partir del [código fuente](https://github.com/antirez/mc-benchmark). El autor, Salvatore Sanfilippo, es un desarrollador de Redis que portó la librería de redis-benchmark para obtener comparaciones fiables.

La lanzamos con concurrencia 50 (el valor por defecto) y cien mil peticiones:

```
$ ./mc-benchmark -n 100000 -p 11311
```

Los resultados son completamente diferentes:

```
====== SET ======
  100000 requests completed in 4.07 seconds
  50 parallel clients
  3 bytes payload
  keep alive: 1

[...]
24557.96 requests per second

====== GET ======
  100000 requests completed in 3.48 seconds
  50 parallel clients
  3 bytes payload
  keep alive: 1

[...]
28727.38 requests per second
```

(He eliminado la información de percentiles por brevedad.) Los resultados son mucho mejores que antes. ¿Cómo se compara ahora con los otros servidores?

* nodecached: 25 kreq/s para set y casi 29 kreq/s para get.
* memcached: 62 kreq/s para set y ¡*76 kreq/s*! para get. Difícil de batir.
* Couchbase: “sólo” 29 kreq/s para set y otros 29 kreq/s para get, parecido a nuestro nodecached.

A partir de este punto nuestra labor es doble: mejorar el cliente para que dé resultados más fiables, y optimizar el servidor para que se acerque al memcached nativo, que es la parte interesante.

### Mejorando el cliente

¿Por qué molestarse en optimizar nuestro cliente, teniendo otro en C que parece mucho más fiable… o al menos más rápido? Fácil: nuestra preocupación es mejorar el rendimiento de node.js, y eso incluye tanto el cliente como el servidor. El cliente es, de hecho, la fruta madura que más fácil vamos a poder recoger.

La respuesta a nuestros problemas de rendimiento la encontramos en el admirable [blog de caustik](http://blog.caustik.com/2012/04/08/scaling-node-js-to-100k-concurrent-connections/) que ya hemos usado alguna que otra vez: sólo tenemos que deshabilitar el [algoritmo de Nagle](http://en.wikipedia.org/wiki/Nagle%27s_algorithm) que cachea los datos en local antes de enviarlos. Con esta sencilla mejora en el cliente, nuestro nodecached llega a rozar las 30 kreq/s, y memcached otro tanto. Sólo Couchbase se queda rezagada con 14~17 kreq/s.

Por este frente hemos alcanzado un muro: el cliente no pasa de las 30 kreq/s, lo que nos impide medir la respuesta de los servidores que responden más rápido.

### Mejorando el servidor

Ahora vamos a aplicar la misma mejora al servidor: llamar a [`socket.setNoDelay()`](http://nodejs.org/api/net.html#net_socket_setnodelay_nodelay) para desactivar el algoritmo de Nagle. Medimos primero la respuesta con nuestro cliente nodecached: como nos esperábamos, no pasamos de 30 kreq/s. Pero con mc-benchmark la cosa se pone más interesante: ¡ahora pasamos de los 31 kreq/s! Es una mejora interesante.

Llegados a este punto, tenemos que pararnos a pensar, mal que nos pese hacer funcionar los engranajes oxidados de nuestras cabecitas. ¿En qué se nos va el tiempo en el servidor? ¿Podemos mejorar la respuesta de nodecached como sea? Es posible que el procesamiento interno de los comandos memcached sea realmente costoso; en comentarios al [clon de 100 líneas](https://gist.github.com/fxsjy/3244607) hay varias sugerencias de no traducir Buffer a String. Así que montamos una nueva opción de nodecached `--error` que elimina completamente el procesamiento interno: siempre devuelve ERROR a cualquier consulta. ¿Qué tal responderá a las pruebas?

El cliente nodecached responde, como era de esperar, alrededor de 30 kreq/s. Es en mc-benchmark donde se nota realmente la mejora:

```
$ ./mc-benchmark -n 100000 -p 11311
====== SET ======
  100000 requests completed in 1.94 seconds
  50 parallel clients
  3 bytes payload
  keep alive: 1

51546.39 requests per second

====== GET ======
  100000 requests completed in 2.00 seconds
  50 parallel clients
  3 bytes payload
  keep alive: 1

50050.05 requests per second
```

¡Más de 50 kreq/s! En varias pruebas reales los resultados oscilan entre 46 y 53 kreq/s. Es un resultado fabuloso, a un 70% de la eficiencia de C, aunque realmente no estamos haciendo nada.

Por poner los resultados en perspectiva, 50 kreq/s quiere decir que estamos usando alrededor de 20 µs (20 microsegundos, o sea 20 millonésimas de segundo) por consulta. Por su parte, el memcached original usa unos 14 µs.

En lo que respecta al servidor hemos alcanzado el límite de nuevo: ahora ya prácticamente sólo nos queda el código de entrada/salida de node.js, que está fuera del alcance de nuestras manazas. Pero sin llegar al extremo de perder toda la funcionalidad, volvamos al servidor completo que nos daba unos 30 kreq/s. ¿Podemos mejorar el tiempo de proceso interno usando `Buffer`s en lugar de convertir a `String`? Es una opción interesante, pero es cuestionable si la posible mejora merece la pena: sabemos que no vamos a pasar de 50 kreq/s en ningún caso. La mayor parte del tiempo en una consulta memcached se va en la red, así que optimizar 10 µs no es una prioridad ahora mismo.

### Otras pruebas

La diversión no termina aquí: podemos hacer más pruebas a ver si mejoramos el cliente. Por ejemplo, podemos usar el [cliente memcached](https://github.com/3rd-Eden/node-memcached) más popular a ver si mejora la cosa. Añadimos una opción `--memcached` a loadtest para probarlo. Los resultados son decepcionantes.

```
$ node bin/loadtest.js -c 10 -n 100000 --memcached 11311
Concurrency Level:      10
Time taken for tests:   7.897 seconds
Complete requests:      100000
Failed requests:        0
Requests per second:    12663 [#/sec] (mean)
```

Menos de 13 kreq/s, o sea menos de la mitad que nuestro cliente optimizado. Una prueba con node v0.10.x tampoco da los resultados esperados:

```
$ ~/install/node-v0.10.20/out/Release/node bin/loadtest.js -c 10 -n 100000 11311
Concurrency Level:      10
Time taken for tests:   4.569 seconds
Complete requests:      100000
Failed requests:        0
Requests per second:    21887 [#/sec] (mean)
```

No llega ni a los resultados de node v0.8.x.

Ahora llega la parte más bizarra de toda esta historia. Otra posible optimización del cliente que nos hemos dejado por el camino es aplicar la técnica de ignorar los mensajes que nos llegan, como hemos hecho en el servidor. En el cliente es mucho más fácil: lanzamos un `get` y no tenemos que esperar a la respuesta porque ya sabemos que el elemento buscado no existe. Así que añadimos una opción `--noreply` a loadtest.js que hace justamente eso. ¿Cómo queda el rendimiento con la nueva opción?

```
$ node bin/loadtest.js -c 10 -n 100000 --noreply 11311
Concurrency Level:      10
Time taken for tests:   6.009 seconds
Complete requests:      100000
Failed requests:        0
Requests per second:    16642 [#/sec] (mean)
```

Sorpresa, sorpresa: ¡mucho peor que antes! No llegamos ni a los 20 kreq/s. ¿Por qué? Aquí tengo que confesar humildemente que no tengo ni idea. He probado un montón de cosas, sin éxito: ignorar las respuestas del servidor empeora sensiblemente el rendimiento.

Por favor, si tienes una idea de qué está pasando, ponla en los comentarios.

## Revisando el mito

El rendimiento bruto de node.js para cálculos intensivos es [notoriamente malo](http://engineering.linkedin.com/nodejs/blazing-fast-nodejs-10-performance-tips-linkedin-mobile). Para cálculos puros y duros los lenguajes compilados lo tienen mucho más fácil, ya que el código generado está optimizado directamente para su ejecución. Incluso dentro de lenguajes interpretados, los que tienen tipado fuerte, o incluso sólo con tipado débil, tienen una ventaja intrínseca: el intérprete (o modernamente la máquina virtual) sabe qué espacio reservar para cada variable y no tiene que jugar con la memoria.

Entonces, ¿es más rápida la entrada/salida que en otros lenguajes? En el caso de C o C++ está claro que un programa bien escrito, aprovechando la meticulosa gestión de cada byte, será probablemente más rápido. A no ser que uses los sucios trucos de [Felix Geisendörfer](https://www.youtube.com/watch?v=Kdwwvps4J9A), cosa que siempre hay que considerar. Pero nadie recomienda servir recursos estáticos con node.js. ¿Entonces?

### Carga y velocidad

Lo que probablemente quieren decir los bien-intencionados evangelistas que cantan las virtudes de node.js es que aguanta mucha carga. Esto es bastante diferente: en lugar de fijarnos en la velocidad, lo que nos importa es el volumen de peticiones que vamos a soportar.

Lo maravilloso de node.js es realmente su respuesta tan lineal: el doble de peticiones por segundo resulta en el doble de carga. Esta predecibilidad es más valiosa muchas veces que un rendimiento increíble de media pero desbocado en ocasiones.

## Conclusión

En este viaje conjunto hemos pasado de un servidor sin optimizar a otro que se acerca a la eficiencia de C, perdiendo toda la funcionalidad por el camino. Las lecciones que podemos destacar son:

* La experiencia de primera mano no tiene sustituto: desconfía de las verdades populares que se encuentran por ahí.
* Optimiza para tu caso concreto. Por más benchmarks que leas en internet, no hay nada mejor que probar contra tus circunstancias.
* Déjalo a tiempo. Es fácil alcanzar el punto de retornos decrecientes sin darse cuenta y seguir en una carrera sin sentido.

Espero haberte animado a probar alguna cosa nueva. Si tienes dudas, sugerencias o críticas acerbas, deja tu comentario debajo.

