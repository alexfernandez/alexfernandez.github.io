% Optimizando sockets con node.js

![Crédito: Alex Fernández](pics/optimizando-sockets-portada.jpg "Gráfica de rendimiento")

Este post es una especie de segunda parte de [Node.js: ¿rápido como el rayo?](nodejs-rapido-como-el-rayo.html). En esta ocasión vamos a intentar superarnos para mejorar el rendimiento de nuestro servidor nodecached, un proyecto para hacer un clon de memcached en node.js.

## Punto de partida

Nuestro punto de partida es muy sencillo: el [memcached original](http://www.memcached.org/) nos da más de 70 mil peticiones por segundo (70 krps, por _kilo requests per second_), mientras que nodecached difícilmente pasa de 30k. ¿Es posible mejorar esta situación? Vamos a intentarlo.

La función a optimizar es [`readData()`](https://github.com/alexfernandez/nodecached/blob/master/lib/server.js#L141) en la clase `Connection`, que citamos aquí para referencia:


```
    function readData(data)
    {
        [...]
        var message = data.toString();
        var line = message.substringUpTo('\r\n');
        var rest = message.substringFrom('\r\n');
        var result = parser.readLine(line);
        if (rest)
        {   
            [...]
            result = parser.readLine(rest);
        }
        [...]
        if (result)
        {
            self.socket.write(result + '\r\n');
        }   
    }
```

Es aquí donde vamos a pasar todo el tiempo de este post. Quitando el manejo de algunas opciones, lo que hace esta función es recibir datos del socket, convertirlos en cadena, partirlos en líneas y parsearlos. El resultado del parseo se escribe en el socket y se termina. Es un código síncrono muy fácil de seguir.

### Granularidad

Vamos a ver primero de qué tiempos estamos hablando. Nuesta última prueba exitosa con nodecached, usando [mc-benchmark](https://github.com/antirez/mc-benchmark), nos dio estos resultados:

```
$ ./mc-benchmark -p 11311 -c 100 -n 100000
====== SET ======
  100000 requests completed in 3.82 seconds
  100 parallel clients
  3 bytes payload
  keep alive: 1

[...]
26205.45 requests per second

====== GET ======
  100000 requests completed in 2.99 seconds
  100 parallel clients
  3 bytes payload
  keep alive: 1

[...]
33467.20 requests per second
```

Si somos capaces de responder a 26.2 krps, quiere decir que cada petición viene a tardar 1s/26.2k ~ 38 µs. 38 microsegundos suena bien, ¿no?. Para los get es aún menos: 1s/33.5k ~ 0.000029851 s ~ 30µs, o sea ¡unos 30 microsegundos!

Pero esto no es nada comparado con memcached:

```
$ ./mc-benchmark -p 11215 -c 50 -n 100000
====== SET ======
  100016 requests completed in 1.19 seconds
  50 parallel clients
  3 bytes payload
  keep alive: 1

[...]
83906.04 requests per second

====== GET ======
  100012 requests completed in 0.95 seconds
  50 parallel clients
  3 bytes payload
  keep alive: 1

[...]
105054.62 requests per second
```

Por algún motivo los resultados son ahora escandalosamente mejores que los que obtuvimos en [la última ocasión](http://www.godtic.com/blog/2013/11/12/node-js-rapido-como-el-rayo/), lo cual nos debe llevar a una desconfianza sana hacia los resultados que podamos obtener ahora, por buenos o malos que sean. En cualquier caso, los tiempos son ahora mucho mejores: 1/105k ~ 9.5 µs, o sea menos de 10 microsegundos. Y un pelín más para get, unos 12 µs.

La situación es la de la siguiente gráfica: tenemos un montón de “espacio de mejora” por delante.

![Rendimiento inicial](pics/optimizando-sockets-antes.png "Gráfica de rendimiento inicial")

Una curiosidad: node.js no colapsa las dos CPUs de mi máquina, siempre deja parte de la CPU disponible para otras tareas.

!(pics/optimizando-sockets-cpu-nodejs.png "CPUs con node.js")

Mientras que memcached es mucho más glotón y satura completamente las dos CPUs.

!(pics/optimizando-sockets-cpu-memcached.png "CPUs con memcached")

### Buffers y Strings

Uno de los consejos que aparecen bastante al optimizar node.js es evitar las conversiones de [Buffer](http://nodejs.org/api/buffer.html) a [String](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String), ya que pueden llevar mucho tiempo. ¿Cuánto exactamente? Vamos a verlo.

En nuestro código tenemos la siguiente línea en [`lib/server.js`](https://github.com/alexfernandez/nodecached/blob/master/lib/server.js) (en negrita):

```
    function readData(data)
    {
        [...]
        var message = String(data);
        var line = message.substringUpTo('\r\n');
        [...]
    }
```

Vamos a usar el temporizador de alta resolución [`process.hrtime()`](http://nodejs.org/api/process.html#process_process_hrtime) para ver el tiempo exacto que tarda esta operación:

```
        var us = process.hrtime()[1];
        var message = String(data);
        var diff = process.hrtime()[1] - us;
        console.log(diff);
```

Medimos el tiempo antes y después, calculamos la diferencia y la mostramos en una traza. Al correr este código en el servidor vemos una serie interminable de números, la mayoría de los cuales ronda el 4000:

```
4106
4114
4036
3988
3984
4029
3980
4394
4408
4404
4239
6351
```

Al final vemos un _outlier_ de 6351, y si dejamos el código corriendo un rato mientras lanzamos peticiones con mc-benchmark podemos llegar a ver algún 896247. Dado que `process.hrtimer()` devuelve un valor en nanosegundos (ns), cada mil de éstos son un microsegundo. Así que ahora mismo estamos gastando 4 µs (de nuestro presupuesto de 30) en hacer la conversión, lo que es significativo (un 13%).

Una optimización obvia es usar la función Buffer.toString().

```
        var us = process.hrtime()[1];
        var message = data.toString();
        var diff = process.hrtime()[1] - us;
        console.log(diff);
```

Con esta nueva versión la traza baja un poco:

```
2302
6249
601792
6994
2452
2338
2333
2316
2208
2258
2395
```

De nuevo vemos un _outlier_ brutal, de 0.6 ms, pero la mayoría ronda los 2.3 µs. ¿Se nota diferencia realmente con esta nueva versión? Veamos las estadísticas de mc-benchmark:

```
chenno@s110: ~/install/mc-benchmark $ ./mc-benchmark -p 11311 -c 100 -n 100000
====== SET ======
  100000 requests completed in 3.60 seconds
[...]
27785.50 requests per second

====== GET ======
  100000 requests completed in 2.83 seconds
[...]
35335.69 requests per second
```

Ahora hemos subido a 35 krps, lo que nos da un tiempo de 28.6 µs. Como podríamos esperar, nos hemos ahorrado casi 2 µs de procesamiento.
De paso, hemos podido comprobar que las medidas de tiempo tomadas dentro de node.js son congruentes con las que tomamos desde un cliente. ¡Vamos por el buen camino!

## Optimizando el código

Seguramente habréis oído la famosa frase de [Donald Knuth](http://c2.com/cgi/wiki?PrematureOptimization):

> We should forget about small efficiencies, say about 97% of the time: premature optimization is the root of all evil. Yet we should not pass up our opportunities in that critical 3%.

En este punto no parece prematuro optimizar nuestro código, aunque la funcionalidad de nodecached no esté completa: ya tenemos un [caso de uso definido y concreto](http://www.godtic.com/blog/2013/08/27/pruebas-de-carga/) que podemos medir. Sólo necesitamos una cosa para optimizar con garantías: tener medidas precisas de tiempos, para poder compararlas antes y después de cada modificación y ver si realmente ganamos algo.

### Marcado y perfilado

Una vez verificado que el benchmark externo da resultados parecidos a la medición interna, podemos refinar el código de medición para que haga algo más que pintar una ristra de números. Lo que necesitamos es un perfilador, o _profiler_: algo que mida el tiempo que requieren una o más operaciones.

Vamos a usar el siguiente código:

```
/**
 * Profile some piece of code.
 */
function Profiler()
{
    // self-reference
    var self = this;

    // attributes
    var requests = 0;
    var time = 0;

    /**
     * Take a measurement between before and after, show results every few requests.
     */ 
    self.measure = function(before, after)
    {
        requests += 1;
        var diff = after[1] - before[1];
        if (after[0] > before[0])
        {
            diff += 1000000000;
        }
        time += diff;
        if (requests % 100000 === 0)
        {
            console.log('Requests: %s, mean time: %s µs', requests, time / requests / 1000);
            requests = 0;
            time = 0;
        }
    };
}
var profiler = new Profiler();
```

Lo primero que hace es crear el número de peticiones `requests` y el tiempo total `time`, y luego con cada llamada a `measure(before, after)` obtiene la diferencia de tiempos entre ambas mediciones y lo va acumulando. Cada 100k peticiones se pinta la media de tiempos en µs y se resetean los valores.
El código es un pelín enrevesado porque `process.hrtimer()` devuelve una estructura con [segundos, nanosegundos] que hay que interpretar, pero todo el resto es trivial.

Observa cómo creamos un solo `profiler` para todo el código, de forma que diferentes peticiones se acumulen en un único lugar.

Para usarlo sólo tenemos que obtener el tiempo antes y después y llamar a `profiler.measure(before, after)`.

```
        var us = process.hrtime();
        [...]
        profiler.measure(us, process.hrtime());
```

Podemos arrancar el servidor y lanzarle 100k peticiones con mc-benchmark para acumular suficientes medidas:

```
$ ./mc-benchmark -p 11311 -n 100000
```

Es posible que tengamos que probar varias veces para conseguir un valor estable, pero con 100k peticiones no hay problema en quedarnos con el valor más pequeño que veamos salvo que sea un _outlier_ (esté muy lejos del resto). Primero vamos a obtener una base de medida (lo que llaman los americanos una _baseline_, aunque la pronunciación en español sea desafortunada):

```
        var us = process.hrtime();
        profiler.measure(us, process.hrtime());
```

Es decir, lo que tarda la propia medida. Mis resultados son bastante consistentes:

```
Requests: 100000, mean time: 1.03806404 µs
Requests: 100000, mean time: 1.06449447 µs
```

Alrededor de un microsegundo tarda el propio código de medición. Por lo tanto tendremos que acordarnos siempre de quitar este microsegundo de los valores que midamos.

### Perfilando la conversión de Buffer

Ahora ya podemos meter el código que queramos entre el primero `process.hrtime()` y el segundo, y vamos a empezar con las conversiones de Buffer a String que hemos estado mirando:

```
        var us = process.hrtime();
        var message = data.toString('utf8');
        profiler.measure(us, process.hrtime());
```

El resultado anda alrededor de los 2.25 µs, consistente con nuestras mediciones anteriores más anecdóticas.

```
Requests: 100000, mean time: 2.2132430199999997 µs
Requests: 100000, mean time: 2.08822848 µs
Requests: 100000, mean time: 2.3663381500000003 µs
Requests: 100000, mean time: 2.168189 µs
```

Quitando el microsegundo de la medida obtenemos cerca de 1.20 µs para el set y ~1 µs para el get.

Podemos ponernos creativos y probar diferentes cosas, a ver si ahorramos algunos microsegundos más. Recuerda que nuestro presupuesto total eran 30 µs y el de memcached 10, así que cada microsegundo que ahorremos nos pone más cerca de nuestro objetivo. ¿Qué pasa si hacemos la conversión de Buffer a String usando el venerable ASCII? Es posible que nuestro código no entienda bien claves ni valores Unicode, pero puede ser que eso no sea un problema en algunas situaciones.

```
        var us = process.hrtime();
        var message = data.toString('ascii');
        profiler.measure(us, process.hrtime());
```

El resultado está ahora cerca de 2.08 µs (1 µs quitando el tiempo de medida). No parece que rasquemos mucho, y sí perdemos bastante funcionalidad.

¿Qué ocurre si volvemos al código original?

```
        var us = process.hrtime();
        var message = String(data);
        profiler.measure(us, process.hrtime());
```

¡Sorpresa! Aunque el código es virtualmente idéntico que en la prueba anterior, obtenemos tiempos mucho mejores que antes (aunque siguen siendo algo peores que con `toString()`):

```
Requests: 100000, mean time: 2.77426338 µs
Requests: 100000, mean time: 2.50233279 µs
Requests: 100000, mean time: 2.55807264 µs
Requests: 100000, mean time: 2.38827297 µs
```

Incluso con el microsegundo de medida, la medición está entre entre 2.8 y 2.4 µs, muy lejos de los 4 µs que teníamos antes. ¿Por qué esta fluctuación con el mismo código? De nuevo un resultado que nos hace desconfiar de todas las medidas que tomemos, sobre todo para tiempos pequeños.

### Perfilando el resto

Aprovechando esta infraestructura podemos ver lo que tarda el procesamiento de los datos en nodecached:

```
        var us = process.hrtime();
        var line = message.substringUpTo('\r\n');
        var rest = message.substringFrom('\r\n');
        var result = parser.readLine(line);
        if (rest)
        {   
            if (result)
            {
                log.error('Unexpected result %s, ignoring', result);
            }
            result = parser.readLine(rest);
        }
        profiler.measure(us, process.hrtime());
```

Dado que mc-benchmark lanza 100k sets y 100k gets, podemos incluso ver la diferencia de tiempos entre ambas operaciones en dos benchmarks consecutivos:

```
Requests: 100000, mean time: 13.74600158 µs
Requests: 100000, mean time: 8.08778811 µs
Requests: 100000, mean time: 14.07496895 µs
Requests: 100000, mean time: 8.13666839 µs
```

Quitando el microsegundo de medida, los sets tienen que procesar más datos y tardan alrededor de 13 µs, mientras que los gets están alrededor de 7 µs.

### Subcadenas

Podemos afinar un poco más: ¿cuánto tardan las operaciones de cadena del principio?

```
        var us = process.hrtime();
        var line = message.substringUpTo('\r\n');
        var rest = message.substringFrom('\r\n');
        profiler.measure(us, process.hrtime());
```

Sorprendentemente, bastante:

```
Requests: 100000, mean time: 2.5679964799999997 µs
Requests: 100000, mean time: 2.19254304 µs
Requests: 100000, mean time: 2.44509724 µs
Requests: 100000, mean time: 2.2384055800000002 µs
```

Un poco más en los sets que en los gets, posiblemente porque tienen más datos. Quitando el µs de medida, tenemos 1~1,5µs de procesamiento; ¿no parece mucho para un par de `substring()`s?

Vamos a intentar reducir este tiempo usando manipulaciones del buffer directamente:

```
        var us = process.hrtime();
        var rn = 0;
        for (var i = 0; i < data.length; i++)
        {
            if (data[i] == 13)
            {
                rn = i;
                break;
            }
        }
        var line, rest;
        if (rn)
        {
            line = data.toString('utf8', 0, rn);
            rest = data.toString('utf8', rn + 2);
        }
        else
        {
            line = data.toString('utf8');
        }
        profiler.measure(us, process.hrtime());
```

Este código reemplaza no sólo a las subcadenas, sino también a la conversión de Buffer a String del principio. Básicamente buscamos un lugar del buffer que contenga un salto de línea, y una vez encontrado hacemos dos `toString()` para extraer dos subcadenas directamente. Los resultados son prometedores, pero no muy diferentes de los que teníamos antes:

```
Requests: 100000, mean time: 3.1032178 µs
Requests: 100000, mean time: 2.84020157 µs
```

Quitando el µs de medida, serían 1.8~2.1 µs ahora, contra 1+(1~1.5)=2~2.5 µs antes. Un ahorro bastante modesto que no está claro que compense la complejidad adicional del código, pero algo es algo. Además dejamos el procesamiento interno en 6 µs, quitando las transformaciones de cadena iniciales.

### Escritura de datos

Ya sólo nos falta un elemento: ¿cuánto tarda la escritura de los datos?

```
        var us = process.hrtime();
        if (result)
        {
            self.socket.write(result + '\r\n');
        }
        profiler.measure(us, process.hrtime());
```

Los resultados son más homogéneos que antes, pero también muestran cierta diferencia de tiempo entre escribir al socket la respuesta a un set y la de un get.

```
Requests: 100000, mean time: 14.778381139999999 µs
Requests: 100000, mean time: 14.03921801 µs
Requests: 100000, mean time: 14.95215595 µs
Requests: 100000, mean time: 14.10403694 µs
```

Resulta bastante curioso que tarde más la respuesta al get que al set, ya que el get tiene que devolver datos; hasta que nos damos cuenta de que el set devuelve `STORED` y el get no tiene datos y simplemente tiene que escribir `END`.

Hemos visto cómo optimizar la conversión de entrada de Buffer a String, pero ¿qué ocurre con la conversión contraria? Seguramente haya una conversión a Buffer implícita en la escritura. Para ver si podemos ahorrarnos algo de tiempo, probamos a enviar un buffer constante:

```
        var us = process.hrtime();
        if (result)
        {
            self.socket.write(ERROR_BUFFER);
        }
        profiler.measure(us, process.hrtime());
```

Si con esto no reducimos tiempos es que realmente da igual pasar un String o un Buffer. Y la práctica respalda esta teoría: los resultados son prácticamente iguales a los anteriores, 14.9 µs para get y 13.9 para set, lo que indica que no ahorramos nada. Aquí sí que no hay de donde rascar: la escritura es realmente en un buffer interno, lo que debería ser casi instantáneo. Sin embargo, por algún motivo tarda más que el memcached original en procesar toda la petición y enviar la respuesta.

### Todos juntos

Tras nuestras mejoras obtenemos estos resultados con nodecached:

```
====== SET ======
  100000 requests completed in 3.55 seconds
  [...]
28208.74 requests per second

====== GET ======
  100000 requests completed in 2.68 seconds
  [...]
37243.95 requests per second
```

Hemos reducido el tiempo del get a 1s/37k ~ 27 µs, y el set a 35.4 µs. La siguiente figura muestra el desglose de tiempos en la nueva distribución.

![Rendimiento final](pics/optimizando-sockets-despues.png "Gráfica de rendimiento final")

Las áreas claras del gráfico son las que están directamente bajo nuestro control; se ve claramente que son minoría. Vamos a centrarnos en la petición get, por ejemplo. Del total de 27 µs, 2 µs son para conversión a string y división en líneas; otros 6 µs para el procesamiento interno, y 12 µs para escribir la respuesta. Pero estos tiempos desglosados suman 20 µs; ¿dónde están los 7 µs restantes? Podemos suponer que es el tiempo interno que gasta node.js en recibir una petición y montar las estructuras de datos necesarias para responder a ella.

Si hacemos las cuentas para el set, vemos que este tiempo "fantasma" son 8 µs: 35-2-12-13. Tiene sentido que sea un poco mayor porque recibimos más datos en el set.

### Otros perfiladores

Es probable que hayas pensado: ¿por qué usar un perfilador cutre-salchichero hecho a mano, teniendo tantos profilers maravillosos para node.js? Pues piénsatelo dos veces. Nuestro perfilador está altamente optimizado para nuestra situación particular, tiene una penalización fácilmente medible (1 µs por petición) y nos ha dado datos que hemos podido contrastar directamente con nuestro benchmark externo. Ahora pregunto yo: ¿por qué complicarse la vida con un paquete escrito en C, que lee directamente los datos de V8 o lo que sea, que tiene una penalización de tiempo desconocida, cuando nuestro propio perfilador es trivial y sabemos cómo funciona? Francamente, no creo que las oscilaciones de resultados que estamos viendo fueran sustancialmente menores con otros perfiladores.

En cualquier caso, es buena idea usar un perfilador externo para contrastar nuestros datos. Pero no vamos a hacerlo aquí porque bastante larga es ya esta entrada como para meter más datos redundantes...

## Conclusiones

Es hora de sacar conclusiones de nuestro trabajo de optimización.

* Aparte de algunas mejoras rápidas y poco significativas, *no hay balas de plata* que nos permitan optimizar el código actual con poco trabajo.
* Dicho esto, con bastante trabajo y arañando de aquí y allá hemos rebajado nuestro presupuesto inicial para una petición get, de los 30 µs del principio del post a 27 µs, a base de optimizar nuestro código. Un 10% de mejora que no está mal.
* Otro resultado del trabajo de optimización es que nos permite saber en qué estamos gastando el tiempo, cuál es nuestro "presupuesto" de tiempo a gastar, y qué partes están bajo nuestro control y cuáles no.
* *La mayor parte del tiempo de proceso está fuera de nuestro alcance*: de los 30 µs por operación, unos 20 (13 + 7) están dedicados a montar la petición y escribir la respuesta. Nuestro trabajo de optimización está limitado a las restantes partes; y una aplicación trivial de la [ley de Amdahl](http://es.wikipedia.org/wiki/Ley_de_Amdahl) nos dice que nunca podremos llegar a rivalizar con memcached, al menos en rendimiento.
* Finalmente, *los resultados de estos benchmarks son bastante ruidosos*: es posible que la máquina usada tenga bastante carga de navegadores y procesos de background que no es fácil de ver con `top` o herramientas similares. Pero eliminar todos los procesos de una máquina de escritorio es casi imposible, y además la máquina se volvería bastante inusable...

`---8<---8<---8<---8<---8<---`

Original publicado en [GodTIC](http://www.godtic.com/blog/2013/11/24/optimizando-sockets-con-node-js/) el 2013-11-24.

De vuelta al [índice](index.html).

