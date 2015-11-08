---
title: La arquitectura fluida
subtitle: O de cómo migrar sin penas
footer: Publicado originalmente en TodoJS el 2015-.
---

![Imagen: [Salvador Dalí](http://www.wikiart.org/en/salvador-dali/the-persistence-of-memory-1931)](pics/la-persistencia-de-la-memoria.jpg "La persistencia de la memoria")

# Tras la arquitectura perfecta

En muchas empresas hay departamentos de arquitectura dedicados a decidir
cómo se va a organizar cada proyecto de software.
Deciden el diseño a alto nivel,
en cuántas capas se dividirá,
qué base de datos usar y otros detalles importantes.

¿Por qué cambiar la base de datos en cada proyecto?
¿Por qué no usamos siempre la misma?
Para construir edificios no existe un material perfecto:
a veces es mejor la piedra, otras el ladrillo y otras incluso el acero.
Tampoco hay una forma perfecta para todos los edificios:
cuadrados, rectángulos, cilindros y semiesferas se comportan
de forma distinta bajo la carga.
Lo mismo ocurre con los componentes de software:
cada uno tiene unas restricciones operacionales diferentes,
y se comporta mejor en ciertas circunstancias.

### Qué es la arquitectura

Puede que nos ayude a centrar la discusión si definimos qué es este negocio de
"arquitectura" en software.

En esencia se trata de dividir el sistema en bloques (o componentes) de alto nivel,
y organizar las relaciones entre ellos.
La organización en componentes suele derivar en la organización física de las máquinas
y la elección de lenguaje y programas auxiliares,
como por ejemplo qué base de datos usar.
De ahí vienen cosas como la arquitectura en tres capas que se popularizó hace años,
o la moda más reciente de usar gestores de colas en sistemas escalables.

Curiosamente, nadie se fija en el diseño a alto nivel del propio software, por ejemplo:
la división en módulos de npm o en librerías,
cómo se dividen los servicios de una API en el código
o qué hacer con el código compartido entre diferentes programas.
Tampoco en asuntos más de DevOps como la forma de desplegar el código
o la creación de entornos de integración.
Así que nos limitaremos a considerar la organización en máquinas y qué software usar.

### Modas en arquitectura

En los años 80, la moda empresarial era tener una
[minicomputadora](http://www.computerhistory.org/revolution/minicomputers/11/366/1946)
(del tamaño de un armario pequeño) y múltiples terminales conectados.

En los 90 se popularizaron las arquitecturas cliente-servidor.
Se separaban así los programas servidor que generaban respuestas
y las bases de datos que recogían la información.
Poco después llegarían protocolos de comunicación entre servidores como CORBA
y un poco más tarde [XML](https://en.wikipedia.org/wiki/XML#History).

A principios del siglo XXI llegaron las arquitecturas de tres capas:
capa web, backend y base de datos.
Era un refinamiento del paradigma cliente-servidor donde el servidor
se dividía en un backend y un 
En elementos más blanditos, también se inventó el ridículo [_Enterprise Service Bus_](https://en.wikipedia.org/wiki/Enterprise_service_bus#History),
que empezó a infectar los diagramas corporativos allá por 2002.

En los años 10 las bases de datos NoSQL han adquirido protagonismo.
Los servidores sin estado son de uso común,
al igual que los gestores de colas.

En general, un sistema de software suele poder fecharse con bastante precisión
sólo con ver la arquitectura que implementa.
No deja de ser curioso que sea un asunto de modas,
cuando hay tantos especialistas en las empresas grandes.

## Requisitos cambiantes

Un sistema de software tiene que poder evolucionar durante su vida útil.
Esto significa responder a requisitos cambiantes sin excesivas remodelaciones.

### Requisitos funcionales

Empecemos con una anécdota, en este caso con trasfondo militar.
El avión bombardero
[B-52 _stratofortress_](http://www.af.mil/AboutUs/FactSheets/Display/tabid/224/Article/104465/b-52-stratofortress.aspx)
empezó a operar en 1952,
las últimas unidades se construyeron en 1963,
y actualmente sigue en servicio tras más de seis décadas de actualizaciones.
Durante este tiempo se han actualizado para que usen motores turbofan,
combustible alternativo, puedan lanzar armas nucleares
y misiles inteligentes guiados,
se han reparado
[múltiples problemas estructurales](https://en.wikipedia.org/wiki/Boeing_B-52_Stratofortress#Design),
mejorado la aviónica, y mejorado para proporcionar visión noctura a los pilotos.
Se estima que podrá seguir en servicio activo al menos hasta 2040.
En resumen: un bombardero diseñado durante la guerra de Corea
y fabricado mientras JFK era presidente,
seguirá en uso hasta dentro de 25 años.

Como ingenieros, nuestra mayor aspiración es seguramente que lo que construyamos dure en el tiempo.
Para eso es necesario que pueda actualizarse y mejorarse con el tiempo,
añadiendo nuevas funcionalidades según se necesiten.
Tenemos la gran ventaja de que nuestros sistemas se pueden actualizar mientras están funcionando,
gracias a la magia del software: basta con sacar una copia y trabajar sobre ella.

### Requisitos operacionales

Las circunstancias en las que nuestro sistema tiene que trabajar cambian,
para bien o para mal.
Un producto exitoso a menudo dobla el número de usuarios en un año,
o incluso en una mes: en 2013 [Uber](http://techcrunch.com/2013/12/18/uber-lyft/)
crecía al 400% por año, mientras que su competidora Lyft lo hacía a un ritmo todavía más
vertiginoso que suponía multiplicar su facturación por 20 al año.

#### Caso práctico: MediaSmart Mobile

### Planificación de capacidad

En inglés: _capacity planning_.

### Costes bajos

### Velocidad de migración

### Migraciones de base de datos

## La arquitectura fluida

¿Cuál es la solución?
Nuestra humilde sugerencia es mantener la arquitectura del sistema fluida,
sin tomar decisiones que comprometan su integridad.
Al oir esto un arquitecto de los de verdad, de los que juntan piedras,
seguramente tendría problemas para contener la risa.
¿Cómo se pueden cambiar las vigas maestras de un edificio?

Los ingenieros de software tenemos una gran ventaja:
no trabajamos con el mundo real, sino con software,
que es infinitamente moldeable.

Si encontramos restricciones en esta maleabilidad
suele ser porque alguien no ha hecho bien su trabajo.

### Reversibilidad y termodinámica

En este punto vamos a tomar un desvío que nos llevará de viaje
a la intemporal tierra de la termodinámica.

Seguro que has oído hablar de "entropía":
es un término muy popular entre los divulgadores científicos,
que a menudo lo corrompen asignándole significados corrientes
como "desorden", "irregularidad" y similares.
Es probable que no te sorprenda que la entropía tiene una definición muy precisa,
o más bien varias definiciones equivalentes.

No es sencillo calcular la entropía de un sistema,
y menos todavía medir los flujos de entropía que ocurren
mientras evoluciona.

Por suerte, podemos tomar un atajo:
un sistema reversible es, por definición,
el que consigue que la entropía se mantenga en el mínimo posible.
No por casualidad también es el más eficiente.
Y además es muy fácil saber cuándo un sistema es reversible:
cuando está en todo momento en equilibrio.

En 2012 exploré en
[estos](../2012/reversible-engineering-part-1.html)
[tres](../2012/reversible-engineering-part-2.html)
[artículos](../2012/reversible-engineering-part-3.html)
(en inglés) una idea similar a la que he desarrollado aquí:
la ingeniería reversible,
o cómo trabajar siempre cerca del equilibrio.

En resumen, podemos considerar reversible un sistema que puede invertirse
sin efectos colaterales.
Al mismo tiempo, si revertir el funcionamiento del sistema requiere esfuerzo extra,
entonces el sistema no es reversible.

# Estrategias de migración

Llegamos ahora a la parte principal del artículo:
el catálogo de estrategias.
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

## ¿Quieres decir "patrones"?

Tras el gran éxito del libro de Gamma _et al_, _Design Patterns_,
la palabra "patrón" se usa (y se abusa) a menudo en el diseño de sistemas.
Los patrones vienen a ser piezas que se deben usar cada una en su situación correspondiente.
En nuestro caso, ante una migración podemos usar varias de las técnicas que vamos a describir,
a nuestra elección.

Los elementos de juicio que usaremos para decidirnos por una o por otra
son precisamente lo fluida que queramos que sea la migración,
no la funcionalidad que queremos conseguir (que es siempre la misma).
De ahí que prefiramos en nuestro caso el término "estrategia",
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

