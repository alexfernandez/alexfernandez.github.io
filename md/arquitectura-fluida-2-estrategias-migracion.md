---
title: Estrategias de migración
subtitle: 'La arquitectura fluida, parte 2'
footer: Publicado originalmente en TodoJS el 2015-.
---

![Imagen: [John Soane](http://gabriel-scipio.blogspot.com.es/2012/01/el-puente-del-cesar.html)](pics/arquitectura-fluida-2.jpg "El puente del César sobre el Rhin")

En la [parte anterior](arquitectura-fluida-1-arquitectura-perfecta.html)
vimos cómo la arquitectura perfecta no existe;
nuestra única esperanza es poder migrar rápidamente de una a otra
para responder a los cambios a los que nos enfrentamos.

Llegamos ahora a al catálogo de estrategias.
Vamos a describir varias técnicas que se pueden usar para realizar una migración,
de las más bruscas a las que son completamente reversibles.

## ¿Quieres decir “patrones”?

Tras el gran éxito del libro de Gamma _et al_, _Design Patterns_,
la palabra “patrón” se usa (y se abusa) a menudo en el diseño de sistemas.
Los patrones vienen a ser piezas que tienen su rango de aplicación muy concreto según la situación.

No es así en nuestro caso.
Ante una migración podemos usar varias de las técnicas que vamos a describir,
a nuestra elección.
Nos podemos decidir por una o por otra según lo fluida que queramos que sea la migración,
no la funcionalidad que queremos conseguir (que es siempre la misma).
De ahí que prefiramos el término “estrategia”,
que además no está tan viciado por el uso previo.

## Probadas en combate

Todas las estrategias que vamos a describir están probadas en combate.
Intentaremos ilustrar cada estrategia con un caso práctico,
aunque curiosamente no es fácil encontrar publicaciones sobre migraciones.
Por ello para la mayoría de ellas tendremos que recurrir a ejemplos internos
de MediaSmart Mobile.

Aunque la mayoría de los ejemplos son de migraciones de bases de datos,
las estrategias pueden usarse igualmente para cualquier migración,
sea de código, de datos o de infraestructura.
Las bases de datos son un ejemplo prototípico de arquitectura cliente/servidor,
así que nos dan un marco de referencia bastante sólido sobre el que analizar
cada estrategia.

La lista no es exhaustiva:
seguramente el lector pueda imaginar algunas estrategias adicionales
y perfectamente útiles.
Puedes compartirlas al final del artículo.

Ilustraremos las estrategias relevantes con ejemplos de código de Node.js,
la plataforma que usamos en MediaSmart Mobile.
Es fácil de transcibir a Java, PHP o a cualquier otro lenguaje
porque el código es todo muy sencillo.

# Catálogo de estrategias de servidor

En esta primera categoría tenemos estrategias que se implementan puramente
en el servidor, sin tener que modificar el cliente salvo para reconfigurarlo.

## Parar y arrancar

![Stop and migrate](pics/stop-migrate.png)

Ésta es la migración de toda la vida:

* se para el sistema,
* se copia la base de datos antigua a la nueva (copia en frío),
* se reconfiguran los clientes para que apunten a la nueva,
* y se vuelve a arrancar el sistema.

Simple, ¿no?

### Reversible: no

Esta estrategia requiere dejar de dar servicio,
con lo que no es apropiada para situaciones de alta disponibilidad.

La vuelta atrás consiste en volver a parar el sistema,
copiar la copia a la inversa, reconfigurar y arrancar.

Claramente no es realmente reversible, y además es un poco chapucera.
¿Os imagináis la fiabilidad que le da a un usuario encontrarse una web caída?

### Código de ejemplo

El código de servidor es muy sencillo.
Primero tenemos un fichero `settings.js` que almacena la configuración:

    module.exports = {
        redisAddress: 'redis.mydomain.com',
    };

El fichero intermedio `db.js` define las bases de datos que usaremos,
en este caso `current`:

    var settings = require('./settings.js');
    module.exports = {
        current: new RedisAdapter(settings.redisAddress),
    };

Finalmente, en cada sitio donde usemos la base de datos accederemos a`db.current`:

    var db = require('./db.js');
    db.current.get(key, function(error, result) {
        ...
    });

> #### Caso práctico: MediaSmart Mobile
> 
> El primer caso práctico que vamos a ver no es precisamente una migración de base de datos.
> En MediaSmart Mobile necesitábamos migrar nuestra infraestructura en la nube de Amazon (AWS),
> de una conexión no segura a la VPC (_Virtual Private Cloud_).
> 
> El 3 de marzo de 2015 realizamos la migración:
> primero creamos una réplica de todos los servidores en la VPC.
> A continuación paramos los servidores originales,
> y copiamos los datos a la VPC.
> Luego arrancamos los nuevos sevidores,
> y apuntamos el servidor DNS hacia ellos.
> Tras algunas horas de _downtime_ estábamos arriba otra vez.
> 
> El día 5 de marzo nos reportaron problemas en producción,
> por lo que tuvimos que deshacer la migración.
> Por fortuna habíamos mantenido las instancias antiguas,
> así que fue cuestión de parar, volver a copiar los datos y arrancar otra vez.
> Por ironías de la vida, el problema no se resolvió con esta migración inversa,
> por lo que dedujimos que tenía otra causa.
> Curiosamente, una vez que nos quitamos de enmedio la causa más obvia (la migración),
> el problema real se hizo evidente de inmediato y no tenía nada que ver,
> sino que venía causado por un despliegue anterior.
> 
> El día 11 de marzo probamos de nuevo con la misma técnica,
> y de nuevo tras varias horas de _downtime_ la migración estaba hecha.
> Como operamos en dos regiones de AWS, todavía teníamos que migrar la segunda región,
> cosa que hicimos el día 13 de marzo (viernes).
> Porque total, viernes 13: ¿qué podía salir mal? Y no somos supersticiosos.
> 
> La moraleja es algo poco intuitivo:
> el mayor problema de hacer una migración es muchas veces que nos impide pensar claramente
> sobre los fallos del sistema,
> ya que nos fijaremos más en los posibles efectos colaterales
> que en el problema que tenemos delante.
> Por eso es importante tener una estrategia de migración inversa
> que devuelva el sistema a su estado inicial.
> 
> Y, una vez que tenemos la estrategia inversa,
> también es importante (y de nuevo contraintuitivo)
> que lo mejor es no realizar la migración inversa,
> sino buscar las causas profundas de los problemas.

## Versión de sólo lectura

![Read-only version](pics/read-only-version.png)

Ahora veremos una estrategia ligeramente más sofisticada.
Los pasos son:

* pasar a un modo de sólo lectura,
* hacer una copia en caliente (mientras el sistema está andando),
* cambiar a la nueva base de datos,
* y volver al modo de lectura/escritura.

Mientras el sistema está en sólo lectura
se puede acceder a los datos pero no modificarlos.
De esta forma nos aseguramos de que se pueda hacer la copia en caliente:
como los datos no cambian,
o tenemos que preocuparnos de que se la copia esté desfasada al terminar.

Esto suele ser bastante mejor que una parada completa.
Pero no siempre es admisible:
ciertos sistemas tienen que estar recogiendo datos nuevos constantemente,
así que dejarlos en sólo lectura no es posible.

Otro problema es que una copia en caliente puede tardar bastante más que en frío,
debido a los accesos constantes.

### Reversible: no

La migración inversa es fácil, en teoría:
pasar de nuevo a sólo lectura,
copiar los datos en sentido contrario
y volver a usar la base de datos original.
Sin embargo, la copia inversa requiere trabajo extra,
incluso si la nueva base de datos es idéntica a la antigua:
habrá que invertir el script de copia adaptando las direcciones de las máquinas.
Y no hablemos ya si hay que hacer cualquier tipo de conversión de formato.

Siempre podemos preparar la copia inversa como parte de la preparación para la migración;
de esta forma estamos preparados para la migración inversa.
Pero seguimos teniendo _downtime_, aunque sea sólo para las escrituras.
De ahí que una migración de este tipo no sea realmente reversible.

> #### Caso práctico: WordPress
> 
> Esta técnica es muy básica:
> se aplica por ejemplo a las
> [migraciones de WordPress](http://www.wpbeginner.com/plugins/how-to-put-your-wordpress-site-in-read-only-state-for-site-migrations-and-maintenance/),
> para no tener que preocuparse de cambios mientras se migra.

## Sincronización

![Synchronization](pics/sync.png)

Supongamos de nuevo que tenemos dos bases de datos, la antigua y la nueva.
Los pasos para hacer la sincronización son:

* hacer una copia en caliente de la antigua a la nueva,
* sincronizar todas las escrituras de la antigua a la nueva,
* pasar a leer de la nueva (pero seguir escribiendo en la antigua),
* y finalmente pasar a escribir a la nueva.

La sincronización se hace en este caso mediante un mecanismo de servidor,
que recoge todas las escrituras y pasarlas a otro sistema.
No siempre es posible hacerlo:
a veces la carga en el sistema antiguo es demasiado grande,
o puede que no haya forma de fechar los cambios para extraer sólo los últimos,
lo que haría la sincronización total demasiado costosa.

### Reversible: sí

En el lado positivo, los usuarios no notarán ningún _downtime_ al acceder al sistema.

Además, la estrategia inversa es trivial: sólo hay que volver a cambiar los accesos
a la base de datos antigua,
mientras sigamos escribiendo en ella y no desconectemos el mecanismo de sincronización.

Pero si ya no estamos sincronizando los cambios o hemos pasado a escribir en la nueva,
la cosa cambia:
la migración inversa requiere entonces sincronizar los datos en el sentido contrario.
La sincronización bidireccional a menudo es demasiado costosa como para ser práctica.
Así que hay que tener cuidado de seguir sincronizando hasta que estemos seguros
de que la migración ha sido exitosa y no vamos a querer revertirla nunca.

> #### Caso práctico: MediaSmart Mobile
> 
> En MediaSmart Mobile almacenamos datos de estadísticas del día,
> conocidos internamente como _daystats_,
> para su consulta posterior por usuarios y clientes.
> Guardarlos todos en Redis nos estaba causando costes ingentes,
> así que decidimos migrarlos a Redshift para su consulta offline.
> 
> Esta base de datos para _data warehousing_ tiene muchas cosas buenas,
> pero no permite carga en tiempo real.
> El proceso de carga en Redshift suele ejecutarse cada día o cada hora;
> en nuestro caso decidimos exportar días completos,
> por lo que los últimos datos tienen que consultarse siempre en Redis.
> El desarrollo no fue trivial:
> según las fechas pedidas hay que acceder a Redis para los datos de los últimos días,
> acceder a Redshift (que tiene un modelo de datos completamente distinto basado en SQL) para el resto,
> acumular ambos juegos de valores y presentarlos al usuario.
> 
> La parte positiva es que la migración fue completamente suave.
> En este caso, la sincronización se mantiene siempre
> (disfrazada de carga de datos),
> por lo que para dejar de usar la nueva base de datos en Redshift
> sólo tenemos que cambiar un parámetro de configuración.
> Así que cuando se reportaron bugs fue trivial comparar volver a la versión anterior
> mientras se investigaba por qué no funcionaban bien los acumulados.

## Copia doble

![Double copy](pics/double-copy.png)

En este caso queremos 

Los pasos a seguir son los siguientes:

* realizar una copia en caliente mientras se accede al sistema antiguo,
* empezar a leer y escribir en el sistema nuevo,
* y realizar una segunda copia en caliente de estos datos.

Es importante señalar que con esta estrategia estamos durante un tiempo accediendo
a una versión antigua de los datos:
cuando empezamos a usar el sistema nuevo todavía no se han copiado todos los datos
que han llegado mientras se hacía la primera copia.

Además, la segunda copia requiere de algoritmos algo más sofisticados que la primera:
si un mismo registro ha sido modificado durante la primera copia en el sistema antiguo,
y luego durante la segunda copia en el sistema nuevo,
hay que saber mezclar los datos.
Para hacerlo con garantías tenemos que trabajar siempre con modificaciones atómicas,
lo que puede resultar bastante incómodo y llevar a conflictos.
En esencia es como una mezcla (_merge_) de código de dos ramas:
¿cómo resolvemos los conflictos sin intervención humana?

Otra opción es ignorar una de las dos actualizaciones y quedarse,
digamos, con la última edición de los datos.
O directamente sobrescribir con la versión que estamos copiando.

Esta estrategia no es siempre factible:
no siempre tenemos el lujo de poder prescindir de los últimos datos,
aunque sea durante un tiempo;
ni de poder ignorar las actualizaciones que lleguen en un momento poco oportuno.
Lógicamente no es buena estrategia para datos financieros, por ejemplo.

### Reversible: realmente no

En principio este tipo de migración no tiene _downtime_ asociado,
lo que podría hacernos pensar que es reversible.
Pero la migración inversa requiere de esfuerzo extra:
es necesario hacer una copia en sentido inverso para recuperar los últimos cambios.
O eso, o perder todos los datos que han llegado al sistema nuevo.

En general, la ausencia de _downtime_ es condición necesaria,
pero no suficiente, para la reversibilidad.
El único criterio realmente fiable es estudiar la migración inversa.

> #### Caso práctico: MediaSmart Mobile
> 
> En nuestra empresa guardamos perfiles anonimizados de usuarios,
> con información sobre qué categorías de contenido han visitado.
> Los perfiles nos ayudan a centrar el targeting y conseguir mejores respuestas.
> 
> Cuando teníamos unos 500 millones de perfiles toda la información estaba guardada en Redis,
> que necesita tener todos los datos en memoria.
> Así que en cierto momento decidimos moverlo todo a DynamoDB,
> que también responde muy rápido y tiene capacidad ilimitada.
> Cuando llegó el momento de la migración nos dimos cuenta
> de que copiar los perfiles llevaba más de un día.
> Pero contábamos con la ventaja de que en realidad no pasa nada si se pierden unos cuantos perfiles…
> o unos cuantos millones.
> Tampoco pasa nada si un perfil no se actualiza.
> 
> Así que nos decidimos por una copia doble.
> Primero copiamos los perfiles a DynamoDB,
> y empezamos a usar esta nueva base de datos desde un solo servidor de prueba.
> Cuando estábamos contentos con el resultado cambiamos el resto de servidores.
> En este punto volvimos a hacer una copia de los perfiles
> para recoger los cambios que habían entrado durante las pruebas.
> Cuando había dos versiones del mismo perfil,
> podíamos elegir si quedarnos con la de Redis o la de DynamoDB;
> realmente sólo perderíamos una pequeña cantidad de información.
> 
> La migración fue realmente suave.
> La vuelta atrás trivial habría conllevado usar la base de datos antigua,
> lo que podría haber supuesto perder información de días o semanas;
> por suerte no tuvimos que usarla.
> A día de hoy tenemos más de mil millones de perfiles, y creciendo.

# Catálogo de estrategias en cliente

Ahora vamos a ver algunas estrategias que no requieren cambiar el servidor para nada;
basta con modificar el cliente que accede a los datos.

## Adaptador

Esta estrategia de cliente es la que nos permite cambiar rápidamente de una base de datos a otra,
cuando son diferentes.
Podemos “disfrazar” una base de datos para que aparente ser otra
usando el patrón clásico de adaptador,
y luego configurar a qué base de datos accedemos.

### Reversible: sí

Los cambios en el cliente son instantáneos:
sólo tenemos que cambiar un fichero de configuración.
Por supuesto, la migración sólo será realmente reversible
si la parte de servidor también lo es.

### Código de ejemplo

El driver de Memcached es muy sencillo,
tiene dos funciones básicas:

Para hacer un adaptador para Redis,
simulamos la interfaz de Memcached:

```
var redis = require('redis');

exports.RedisAdapter = function(port, host) {
    // self-reference
    var self = this;
        
    // attributes
    var client = redis.createClient(port, host);

    self.get = function(key, callback) {
		client.get(key, function(error, result) {
            if (error) return callback('Could not get ' + key + ':' + error);
            return callback(null, JSON.parse(result));
    });

    self.set = function(key, value, callback) {
        return client.set(key, JSON.stringify(value), callback);
    });
};
```

Para crear el driver sólo tenemos que fijarnos en si se trata de una dirección que empiece por `redis:`
o de una dirección tradicional:

```
var MemcachedAdapter = require('./memcached.js').MemcachedAdapter;
var RedisAdapter = require('./redis.js').RedisAdapter;
var settings = require('./settings.js');

var db = {
    main: getAdapter(settings.MAIN_DB_ADDRESS),
};

function getAdapter(address) {
    if (address.indexOf('redis:') === 0) {
		var redisAddress = address.substringFrom(':');
		var host = redisAddress.substringUpTo(':');
		var port = redisAddress.substringFrom(':');
        return new RedisAdapter(host, port);
    } else {
        return new MemcachedAdapter(address);
    }
}
```

Y luego al usar el driver no tenemos que preocuparnos de si estamos hablando con Redis o con Memcached:

```
db.main.get('hi', function(error, result) {
	if (error) return console.error('Got error: %s', error);
	console.log('Got result %j', result);
};
```

> #### Caso práctico: MediaSmart Mobile
> 
> En MediaSmart empezamos usando Couchbase,
> una base de datos clave-valor enriquecida con una historia curiosa.

> La base de datos Memcached original se
> [creó en 2003](https://en.wikipedia.org/wiki/Memcached#History)
> por Brad Fitzpatrick para LiveJournal.
> Era básicamente una capa de cacheo:
> una base de datos clave-valor que guarda todo en memoria.
> Membase se creó como una base de datos con una interfaz 100% compatible,
> pero capaz de guardar los datos en disco.
> Más tarde CouchDB y Membase se unieron para crear Couchbase,
> pero mantuvieron la interfaz de Membase, compatible a su vez con Memcached.
> 
> Durante un tiempo Couchbase aguantó bien,
> aunque requería demasiado mantenimiento y el rendimiento se fue degradando.
> Cuando los tiempos de respuesta empezaron a ser alarmantes,
> nos planteamos pasar a Redis:
> otra base de datos clave-valor con persistencia a disco.
> El problema es que el driver era algo diferente:
> para empezar necesitaba recibir siempre texto
> en lugar de admitir objetos y convertirlos a JSON él mismo.
> 
> Tras crear el adaptador,
> era cosa sencilla elegir si usábamos Memcached o Redis
> para cada instancia de base de datos.

## Consulta dual

![Dual lookup](pics/dual-lookup.png)

Esta técnica es muy sencilla:
empezamos a escribir en la nueva base de datos,
y a la hora de leer leemos de ambas:
primero miramos en la nueva, y si no está,
tiramos de la antigua.

La migración de datos en el servidor se puede hacer con una sencilla copia en caliente.

El mayor problema es que el tiempo de lectura se duplica.

También puede ser un problema si las claves se pueden borrar.
En este caso es recomendable usar otra estrategia,
aunque también se puede usar un valor `null` que indique que la clave está vacía.

### Reversible: sí

Esta estrategia es reversible por su propio diseño.
De nuevo, la migración completa será sólo reversible
si la parte de servidor también lo es.

### Código de ejemplo

```
exports.db = {
    v1: new RedisAdapter(settings.oldRedis),
    v2: new RedisAdapter(settings.newRedis),
};
```

y el cliente:

```
function get(key, callback) {
    db.v2.get(key, function(error, result) {
        if (error || result) callback(error, result);
        db.v1.get(key, callback);
    });
}
```

> #### Caso práctico

## Escritura dual

![Dual write](pics/dual-write.png)

Esta técnica es similar a la anterior,
pero en lugar de hacer leer de dos sitios, escribimos a dos sitios.

La escritura dual sirve para mantener dos servidores sincronizados
después de haber pasado de usar uno al otro.

En este caso la latencia añadida puede no ser un problema,
siempre que las escrituras se realicen de forma asíncrona tras terminar de procesar las peticiones.
En el caso de que requiramos confirmación de escritura en ambas bases de datos la latencia aumentará.

### Reversible: sí

> #### Caso práctico: ING
> 
> Por requerimientos del Banco de España,
> un banco debe almacenar sus datos al menos en dos centros de datos
> separadas por una distancia suficiente.
> En el banco ING se mantienen dos centros de datos en dos ciudades distintas:
> uno primario y otro secundario,
> ambos con la capacidad suficiente como para dar servicio a todos los clientes.
> En caso de catástrofe se pasa a usar el secundario.
> 
> Hace unos años se pasó de tener una réplica en caliente
> a una réplica online:
> todas las escrituras debían confirmarse en ambos centros
> antes de darse por finalizadas.
> De esta forma se tiene la garantía de que los datos son iguales en ambos centros,
> y se puede pasar de uno a otro a voluntad.

## Paso temporizado

![Timed rollover](pics/timed-rollover.png)

A costa de añadir unos pocos microsegundos (µs) a cada query.

### Código de ejemplo

Un objeto se usa para recubrir dos alternativas,
y se selecciona la adecuada según la fecha actual.

```
var Memcached = require('memcached');

exports.CleverAdapter = function(name, address) {
    // self-reference
    var self = this;
    
    // attributes
    var oldAdapter = new Memcached(address + ':11211');
    var newAdapter = new RedisAdapter(address);
        
    self.get = function(key, callback) {
        if (new Date().toISOString() < '2015-11-14') {
            return oldAdapter.get(key, callback);
        }
        return newAdapter.get(key, callback);
    }
};
```

> #### Caso práctico
> 
> En MediaSmart daystats aggregates

## Conversión _in situ_

![In-place conversion](pics/in-place.png)

En esta conversión, no hay sistema antiguo y nuevo:
sólo hay un sistema.
Es un caso “degenerado” de las migraciones que hemos visto hasta ahora.

La lectura de cualquier valor consta de los siguientes pasos:

* Leer el valor.
* Si tiene el formato antiguo, convertirlo al nuevo formato y guardarlo.
* Devolver el valor leído (y posiblemente convertido).

La migración de formato se va haciendo poco a poco,
según se van leyendo valores.
En un momento dado podemos hacer un repaso a todos los registros,
leyéndolos y convirtiéndolos en su sitio.

Esta migración es adecuada para cambios internos en la estructura de cada registro,
no para modificaciones de estructura en bases de datos SQL.

### Reversible: no

Este caso es curioso.
En principio una migración más lenta suele ser más fácil de revertir
que una que se haga de golpe.
Pero en este caso no podemos volver al estado original sin esfuerzo:
tenemos que hacer la migración inversa, sea en el cliente o el servidor.
Ahora bien, una vez hecha esta inversión el cliente seguirá funcionando sin problemas,
porque es necesario que entienda los registros en ambos formatos:
el antiguo y el nuevo.

Una migración inversa usando la misma estrategia suele buena opción.

### Código de ejemplo

El cliente lee el registro, en el que la fecha puede estar en formato numérico o como cadena en formato ISO.
Lo queremos siempre como cadena, así que si es un número lo convertimos a cadena y lo volvemos a guardar.
En cualquier caso se lo pasamos a la callback.

```
function getValue(key, callback)
{
    db.get(key, function(error, value)
	{
		if (error) return callback(error);
		if (typeof value.timestamp == 'number')
		{
			value.timestamp = new Date(value.timestamp).toISOString();
			db.set(key, value, function(error)
			{
				if (error) return callback(error);
			});
		}
		return callback(null, value);
	});
}
```

> #### Caso práctico: MediaSmart Mobile

Volvemos a encontrarnos con los perfiles de MediaSmart Mobile.
En cierto momento encontramos que teníamos ya más de 100 millones de perfiles,
y que ocupaban demasiado espacio.
(Era antes de la migración a DynamoDB, y en Redis se almacena todo en memoria.)
Así que decidimos comprimir los perfiles más habituales para reducir el espacio usado.
Conversión de formato comprimiendo keywords.

# Catálogo de estrategias en broker

A continuación vamos a ver algunas estrategias
que dependen de una máquina intermedia
entre el cliente y el servidor.
Vamos a llamarlo “broker”.

## Acceso mediante proxy

![Proxied access](pics/proxied-access.png)

El broker es en este caso un proxy:
envía las consultas a un servidor o a otro
según un valor de configuración.

### Reversible: sí

Para revertir la migración sólo tenemos que apuntar 

> #### Caso práctico
> 
> Instagram

## Escritura en cola

![Queued write](pics/queued-write.png)

> #### Caso práctico

# Migración de cualquier tipo

![All strategies](pics/all.png)

Todas las estrategias que hemos visto son útiles no sólo para migraciones de base de datos.

## El equilibrio inestable

Un sistema que fluye se mantiene en equilibrio,
pero no es necesariamente un equilibrio estable.

Veamos un ejemplo sacado de una ingeniería completamente diferente:
la aerodinámica.
Los [aviones supersónicos](http://aviation.stackexchange.com/a/8061/12166)
tienen que funcionar en dos regímenes completamente diferentes:
primero tienen que volar en modo subsónico,
y una vez que alcanzan la velocidad del sonido pasan al modo supersónico.
Esto causa un problema: el centro de gravedad está por detrás del punto neutro,
lo que hace que el vuelo sea inestable.
La única forma de mantenerlos en el aire sin que se desintegren
es corregir la trayectoria con un ordenador de a bordo, sin el cual
el vuelo sería completamente imposible.

(Los aviones acrobáticos también son inherentemente inestables,
lo que los hace más manejables,
pero al volar a menos velocidad es posible que un piloto lo controle.)

En nuestro caso, un sistema que fluye demasiado despacio se vuelve también difícil de manejar,
lo que podemos contrarrestar aumentando la velocidad del cambio.
Pero en este caso el sistema se vuelve inestable,
y hay que controlarlo para que los fallos que van surgiendo
no se acumulen.

La velocidad de crucero óptima es la que nos permite realizar cambios al sistema
de la forma más rápida, sin comprometer la integridad del sistema.

## Sigue fluyendo

Entre tanta migración, no hay que perder de vista el objetivo final:
tener una arquitectura flexible,
que puede adaptarse a las nuevas circunstancias rápidamente.

