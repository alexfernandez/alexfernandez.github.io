% Modo cluster para node.js

![Imagen: [OmegaCen/Astro-WISE/Kapteyn Institute](https://commons.wikimedia.org/wiki/File:VST_image_of_the_Hercules_galaxy_cluster.jpg)](pics/modo-cluster.jpg "VST image of the Hercules galaxy cluster")

¿Quieres habilitar el modo cluster en node.js? En este artículo veremos cómo, completo con código y detalles.

## ¿Por qué necesito el modo cluster?

El funcionamiento normal de node.js es en modo mono-procesador: un hilo de ejecución, un solo proceso. Lo de tener un hilo es la esencia de node.js: en lugar de correr varios hilos o _threads_, usamos el procesamiento asíncrono para procesar múltiples peticiones a la vez. Por otra parte, tener un solo proceso puede ser una limitación muy grande.

Hoy en día los procesadores multi-núcleo han dejado de ser la joya de los datacenters para convertirse en algo rutinario: es normal llevar en la mochila un dispositivo con dos núcleos o cores, y a menudo otro en los bolsillos. En Amazon AWS se pueden alquilar servidores con 8 CPUs virtuales por unos €350/mes ([precios](http://aws.amazon.com/es/ec2/pricing/) de [hoy](http://www.xe.com/currencyconverter/convert/?Amount=475&From=USD&To=EUR)). Prácticamente cualquier cosa más grande que una Raspberry Pi tiene más de un núcleo. Sin embargo, nuestro node.js por defecto corre como un único proceso en el servidor, usando un único _core_ o procesador. ¿Cómo podemos dejar de desaprovechar el 50% (o el 87.5%) de estas máquinas?

## Activando el modo cluster

Node tiene un [API de cluster](http://nodejs.org/api/cluster.html) bastante completo. A día de hoy (v0.10.5), el API está marcado como `Stability: 1 - Experimental`. Esto puede echar para atrás a cualquiera que necesite usarlo en producción.

Para los valientes, hay que decir que este API está presente desde la [versión v0.6.x](http://nodejs.org/docs/v0.6.19/api/cluster.html), y funciona de forma robusta desde la [versión v0.8.x](http://nodejs.org/docs/v0.8.19/api/cluster.html) al menos. Marcarlo como experimental permite a los desarrolladores hacer cambios entre versiones sin tener que dar explicaciones. Así que cuidado con cambios futuros; como siempre, hay que hacer [pruebas exhaustivas](pruebas-asincronas.html) antes de desplegar una nueva versión de node.js.

### Maestro y trabajadores

Uno de los secretos a voces de node.js es que adopta muchos principios de Unix, llevándolos a su propio terreno. En este caso la creación de procesos es muy similar al modelo de Unix: un sencillo [`fork()`](http://en.wikipedia.org/wiki/Fork_(operating_system)) crea una copia del proceso actual. A partir de ese momento el primer proceso se convierte en maestro o master, y la copia en un trabajador o _worker_. Es similar a cómo funcionan nginx o Apache, y a otros programas multi-proceso Linux.

### Al turrón

Vamos a ver el código necesario para usar el modo cluster. El ejemplo que vamos a comentar está sacado directamente de la [documentación de node.js](http://nodejs.org/api/cluster.html#cluster_cluster), con mínimas adaptaciones: un servidor HTTP que devuelve siempre la cadena `hola, mundo`.

Primero un par de requires, uno para cluster y otro para el servidor HTTP:

```
var cluster = require('cluster');
var http = require('http');
```

Crearemos tantos workers como CPUs tengamos en el sistema:

```
var numCPUs = require('os').cpus().length;
```

Es habitual hacer que el proceso master se dedique únicamente a gestionar a los workers, y que sean los workers los que hagan el trabajo sucio. El patrón es siempre el mismo:

```
if (cluster.isMaster)
{
  // crea workers
}
else
{
  // abre el servidor
}
```

Primero creamos los workers en el proceso maestro:

```
if (cluster.isMaster)
{
  // crea workers, uno por CPU
  for (var i = 0; i < numCPUs; i++)
  {
    cluster.fork();
  }
```

Ahora controlamos la salida de los workers:

```
  cluster.on('exit', function(worker, code, signal)
  {
    console.log('worker ' + worker.process.pid + ' died');
  });
}
```

Eso es todo lo que tiene que hacer el master. En los workers (es decir, `cluster.isMaster` es falso) creamos un servidor HTTP:

```
else
{
  // crea un servidor HTTP
  http.createServer(function(req, res)
  {
    res.writeHead(200);
    res.end("hola, mundo\n");
  }).listen(8000);
}
```

¡Y listo! El código real que usamos en MediaSmart Mobile es muy similar a éste: poco más hace falta para poner un servidor en producción. En el resto de este artículo vamos a ver otros detalles que pueden ser útiles.

## Conexiones compartidas

El modo de uso más popular de node.js es como servidor: ponerlo a escuchar por un puerto y responder peticiones. ¿Cómo podemos conseguir que varios workers escuchen por el mismo puerto? ¿Tendremos que hacer que el proceso master reciba las peticiones y las despache a los workers usando algún algoritmo ingenioso?

Un momento: el código que acabamos de ver crea un servidor por cada worker directamente, sin pararse a pensar. Vamos a verlo otra vez en contexto:

```
if (cluster.isWorker)
{
  // crea un servidor HTTP
  http.createServer(function(req, res)
  {
    res.writeHead(200);
    res.end("hola mundo\n");
  }).listen(8000);
}
```

¿Acaso el cluster se encarga de hacer el reparto? La realidad es mucho mejor: el propio core de node.js va a hacer para nosotros el trabajo duro. Si varios workers comparten una conexión TCP, repartirá las peticiones entrantes entre los procesos que escuchan por el mismo puerto. Nosotros no tenemos nada que hacer: es una de las cosas que más nos gustan del modo cluster.

El algoritmo que usa no es _round robin_, o sea un reparto equitativo entre procesos. Más bien se tiende a cargar más unos cuantos procesos, dejando el resto más libres. Un servidor de producción con varios procesos de node y carga media tiene esta pinta:

```
  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+ COMMAND
 6633 dilbert   20   0  824m 123m 6284 S   77  1.8   2:11.64 node
 6764 dilbert   20   0  810m 129m 6276 S   76  1.9   0:32.71 node
 6429 dilbert   20   0  885m 111m 6284 S   70  1.6   2:49.19 node
 6696 dilbert   20   0  813m 127m 6284 R   69  1.8   1:24.06 node
 6148 dilbert   20   0  894m 114m 6284 R   59  1.6   4:36.41 node
 6362 dilbert   20   0  892m 109m 6284 R   57  1.6   3:23.42 node
 6233 dilbert   20   0  900m 151m 6296 R   51  2.2   4:22.03 node
 6297 dilbert   20   0  898m 150m 6296 S   40  2.2   3:53.95 node
```

## Supervisión de trabajadores

Una técnica útil es hacer que el master siga la pista de cuándo se mueren los workers, por ejemplo por errores imprevistos, para crear más. El código de la [documentación](http://nodejs.org/api/cluster.html#cluster_event_exit) es muy elocuente:

```
cluster.on('exit', function(worker, code, signal)
{
  console.log('Se ha muerto el worker %s, reiniciando', worker.process.pid);
  cluster.fork();
});
```

Una técnica interesante es matar directamente los workers después de un tiempo determinado, y recrearlos con un nuevo `fork()`. De esta forma evitamos que pequeñas filtraciones de memoria o memory leaks afecten a la ejecución de nuestro servidor. No es broma; IBM llamó a esta técnica [rejuvenation](http://domino.research.ibm.com/tchjr/journalindex.nsf/9fe6a820aae67ad785256547004d8af0/e27eaf128f579c2b85256bfa0067fade!OpenDocument) hace unos años, y la usa en sus servidores de gama alta. En otros ámbitos podría considerarse una mera chapuza para evitar arreglar fallos escandalosos; en cualquier caso no vamos a ver el código concreto aquí, pero con la documentación debería bastar para saber cómo hacerlo.

El lector avispado se habrá dado cuenta de que, pese a nuestro cuidado por replicar los procesos, hemos introducido un punto único de fallo: si el proceso master se muere, todo nuestro tinglado se derrumba porque nadie va a poder recrearlo. Por eso, trabajar en modo cluster no quita que sigamos usando algún tipo de gestión de procesos que levante nuestro proceso maestro si se cae: [supervisor](https://github.com/isaacs/node-supervisor) y [forever](https://github.com/nodejitsu/forever) son dos módulos de node muy útiles, y en Linux podemos usar la gestión nativa de procesos, systemd o Upstart. Porque estábamos usando ya algún tipo de gestión de procesos, ¿verdad? ¿Verdad?

Bueno, pues si no es así, ahora es buen momento para mirar las posibilidades.

## Mensajes internos

¿Qué podemos hacer si queremos agregar información entre todos los workers? Un caso de uso típico es cuando queremos sacar estadísticas globales de cuántas peticiones hemos servido por minuto. En modo cluster no nos vale con guardar los resultados en memoria y pintarlos de vez en cuando: hay que agregar la información entre todos los procesos worker que ahora tenemos andando.
En primer lugar, esta función envía al master la información de la variable `stats` usando `process.send()`:

```
function sendStats(stats)
{
  var message = { stats: stats };
  process.send(message);
}
```

En el master queremos recoger los mensajes enviados por los workers y añadir las estadísticas a la variable `globalStats`. Tenemos que llamar al worker resultado del `fork()` [de esta forma](http://nodejs.org/api/cluster.html#cluster_event_message):

```
var worker = cluster.fork();
worker.on('message', function(message)
{
  globalStats += message.stats;
});
```

Si queremos recibir mensajes de varios tipos, sólo tenemos que añadir un atributo `message.type` con el tipo de mensaje, y luego discriminar al recibirlo.

Los workers también pueden recibir mensajes del master, usando exactamente la misma API. Nunca vamos a poder compartir memoria, pero sí objetos aleatorios que serán serializados y recibidos.

## Servidor stateless

Para usar el modo cluster apropiadamente tenemos que asegurarnos de que nuestro servidor sea (*atención, palabro*) _stateless_: que no mantenga el estado de las peticiones en memoria.

Un servidor stateless es siempre una buena práctica, por ejemplo si tenemos varios frontends sirviendo peticiones. Supongamos que creamos una cookie o un token de acceso para cada usuario que entra, y lo usamos para identificar sus peticiones. Si guardamos la lista de tokens en memoria, y la siguiente petición del mismo usuario llega a otro frontend, estamos perdidos: no tenemos forma de reconocer al usuario.

Lo mismo vale para el modo cluster, que a todos los efectos es como si tuviéramos varios servidores independientes. Todo dato necesario para el servidor debe estar almacenado en base de datos o algún otro tipo de almacenamiento compartido — un memcached es una buena elección para datos volátiles.

### ¿Un servidor cluster y _stateful_?

En modo cluster existe una alternativa al servidor stateless: compartir la información a través del master. Cuando cada worker crea un token, tiene que informar al master, que a su vez informará a todos los demás workers para que actualicen sus listas de tokens válidos. Y lo mismo cuando se invalida un token. Es una aplicación interesante de la mensajería que dejamos como ejercicio al lector.

Para uso práctico, podemos ver que la complejidad empieza a aumentar más allá de lo razonable. Además esta solución no es válida para múltiples frontends. La recomendación de este desarrollador es (siempre que sea posible) el servidor stateless.

## Conclusión

El modo cluster es una herramienta esencial para poner node.js en producción. No te dejes atemorizar por el API experimental o por la aparente complejidad del problema; node.js hace que tener múltiples procesos sea casi tan fácil como tener uno solo.

`---8<---8<---8<---8<---8<---`

Original publicado en [GodTIC](http://www.godtic.com/blog/2013/07/27/modo-cluster-para-node-js/) el 2013-07-27.

De vuelta al [índice](index.html).

