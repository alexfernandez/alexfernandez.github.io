---
title: Estrategias de migración
subtitle: La arquitectura fluida: parte 2
footer: Publicado originalmente en TodoJS el 2015-.
---

![Imagen: [©](https://creativecommons.org/licenses/by/2.0/) [Patrik Jones](https://www.flickr.com/photos/laprimadonna/4881676285)](pics/arquitectura-fluida.jpg "Deep Blue Dolphin Love")

En la [parte anterior](arquitectura-fluida-1-arquitectura-perfecta.html)
vimos cómo la arquitectura perfecta no existe;
nuestra única esperanza es poder migrar rápidamente de una a otra
para responder a los cambios a los que nos enfrentamos.

Llegamos ahora a al catálogo de estrategias.
Vamos a describir varias técnicas que se pueden usar para realizar una migración,
de las más bruscas a las que son completamente reversibles.

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
muy apropiado para migraciones reversibles.

## ¿Quieres decir “patrones”?

Tras el gran éxito del libro de Gamma _et al_, _Design Patterns_,
la palabra “patrón” se usa (y se abusa) a menudo en el diseño de sistemas.
Los patrones vienen a ser piezas que se deben usar cada una en su situación correspondiente.
En nuestro caso, ante una migración podemos usar varias de las técnicas que vamos a describir,
a nuestra elección.

Los elementos de juicio que usaremos para decidirnos por una o por otra
son precisamente lo fluida que queramos que sea la migración,
no la funcionalidad que queremos conseguir (que es siempre la misma).
De ahí que prefiramos en nuestro caso el término “estrategia”,
además de no estar viciado por el uso previo.

## Catálogo de estrategias de servidor

En esta primera categoría tenemos estrategias que se implementan puramente
en el servidor, sin tener que modificar el cliente salvo para reconfigurarlo.

### Parar y arrancar

![Stop and migrate](pics/stop-migrate.png)

Ésta es la migración de toda la vida:

* se para el sistema,
* se copia la base de datos antigua a la nueva (copia en frío),
* se reconfiguran los clientes para que apunten a la nueva,
* y se vuelve a arrancar el sistema.

Esta estrategia requiere dejar de dar servicio,
con lo que no es apropiada para situaciones de alta disponibilidad.
Claramente no es realmente reversible, y además es un poco chapucera.

#### Código de ejemplo

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

#### Caso práctico

El primer caso práctico que vamos a ver no es precisamente una migración de base de datos.
En MediaSmart Mobile necesitábamos migrar nuestra infraestructura en la nube de Amazon (AWS),
de una conexión no segura a la VPC (_Virtual Private Cloud_).

El 3 de marzo de 2015 realizamos la migración:
primero creamos una réplica de todos los servidores en la VPC.
A continuación paramos los servidores originales,
y copiamos los datos a la VPC.
Luego arrancamos los nuevos sevidores,
y apuntamos el servidor DNS hacia ellos.
Tras algunas horas de _downtime_ estábamos arriba otra vez.

El día 5 de marzo nos reportaron problemas en producción,
por lo que tuvimos que deshacer la migración.
Por fortuna habíamos mantenido las instancias antiguas,
así que fue cuestión de parar, volver a copiar los datos y arrancar otra vez.
Por ironías de la vida, el problema no se resolvió con esta migración inversa,
por lo que dedujimos que tenía otra causa.
Curiosamente, una vez que nos quitamos de enmedio la causa más obvia (la migración),
el problema real se hizo evidente de inmediato y no tenía nada que ver,
sino que venía causado por un despliegue anterior.

El día 11 de marzo probamos de nuevo con la misma técnica,
y de nuevo tras varias horas de _downtime_ la migración estaba hecha.
Como operamos en dos regiones de AWS, todavía teníamos que migrar la segunda región,
cosa que hicimos el día 13 de marzo (viernes).
Porque total, viernes 13: ¿qué podía salir mal? Y no somos supersticiosos.

La moraleja es algo poco intuitivo:
el mayor problema de hacer una migración es muchas veces que nos impide pensar claramente
sobre los fallos del sistema,
ya que nos fijaremos más en los posibles efectos colaterales
que en el problema que tenemos delante.
Por eso es importante tener una estrategia de migración inversa
que devuelva el sistema a su estado inicial.

Y, una vez que tenemos la estrategia inversa,
también es importante (y de nuevo contraintuitivo)
que lo mejor es no realizar la migración inversa,
sino buscar las causas profundas de los problemas.

### Versión de sólo lectura

![Read-only version](pics/read-only-version.png)

Ahora veremos una estrategia ligeramente más sofisticada.
Los pasos son:

* pasar a un modo de sólo lectura,
* hacer una copia en caliente (mientras el sistema está andando),
* cambiar a la nueva base de datos,
* y volver al modo de lectura/escritura.

Mientras el sistema está en sólo lectura,
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

La migración inversa es fácil:
volver a sólo lectura, copiar y migrar en sentido contrario.
Al mismo tiempo, podemos ver que una migración de este tipo no es realmente reversible,
ya que requiere trabajo extra revertirlas.

#### Caso práctico

### Sincronización

![Synchronization](pics/sync.png)

Supongamos de nuevo que tenemos dos bases de datos, la antigua y la nueva.
Los pasos para hacer la sincronización son:

* hacer una copia en caliente de la antigua a la nueva,
* sincronizar todas las escrituras de la antigua a la nueva,
* y finalmente cambiar los accesos a la nueva.

La sincronización se hace en este caso mediante un mecanismo de servidor,
que recoge todas las escrituras y pasarlas a otro sistema.
No siempre es posible hacerlo:
a veces la carga en el sistema antiguo es demasiado grande,
o puede que no haya forma de fechar los cambios para extraer sólo los últimos,
lo que haría la sincronización total demasiado costosa.

En el lado positivo, los usuarios no notarán ningún _downtime_ al acceder al sistema.

Además, la estrategia inversa es trivial: sólo hay que volver a cambiar los accesos
a la base de datos antigua,
mientras no desconectemos el mecanismo de sincronización.
Si ya no estamos sincronizando los cambios,
la migración inversa requiere sincronizar los datos en el sentido contrario.
La sincronización bidireccional a menudo es demasiado costosa como para ser práctica.
Por tanto, hay que tener cuidado de seguir sincronizando hasta que estemos seguros
de que la migración ha sido exitosa y no vamos a querer revertirla nunca.

#### Caso práctico

MediaSmart daystats

### Copia doble

![Double copy](pics/double-copy.png)

#### Caso práctico

MediaSmart perfiles

## Catálogo de estrategias en cliente

### Decorador

#### Caso práctico

### Consulta dual

![Dual lookup](pics/dual-lookup.png)

#### Caso práctico

### Escritura dual

![Dual write](pics/dual-write.png)

#### Caso práctico

### Paso temporizado

![Timed rollover](pics/timed-rollover.png)

#### Caso práctico

MediaSmart stats aggregates

### Conversión _in situ_

![In-place conversion](pics/in-place.png)

En esta conversión, no hay 

#### Caso práctico

## Catálogo de estrategias en broker

### Acceso mediante proxy

![Proxied access](pics/proxied-access.png)

#### Caso práctico

Instagram

### Escritura en cola

![Queued write](pics/queued-write.png)

#### Caso práctico

# Vamos terminando

## Migración de cualquier tipo

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

