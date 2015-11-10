---
title: La arquitectura fluida
subtitle: O de cómo migrar sin penas
footer: Publicado originalmente en TodoJS el 2015-.
---

![Imagen: [©](https://creativecommons.org/licenses/by/2.0/) [Patrik Jones](https://www.flickr.com/photos/laprimadonna/4881676285)](pics/arquitectura-fluida.jpg "Deep Blue Dolphin Love")

# Tras la arquitectura perfecta

En muchas empresas hay departamentos de arquitectura cuya misión es decidir
cómo se va a organizar cada proyecto de software.
Deciden el diseño a alto nivel, en cuántas capas se dividirá,
qué base de datos usar y otros detalles importantes.

¿Por qué cambiar la base de datos en cada proyecto?
¿Por qué no se usa siempre la misma?
Para construir edificios no existe un material perfecto:
a veces es mejor la piedra, otras el ladrillo y otras incluso el acero.
Tampoco hay una forma perfecta para todos los edificios:
cuadrados, rectángulos, cilindros y semiesferas se comportan
de forma distinta bajo la carga.
Lo mismo ocurre con los programas de software:
cada uno tiene unas restricciones operacionales diferentes,
y se comporta mejor en ciertas circunstancias.

### Qué es la arquitectura

Puede que nos ayude a centrar la discusión si definimos qué es este negocio de
“arquitectura” en software.

En esencia se trata de dividir el sistema en bloques de alto nivel,
y ordenar las relaciones entre ellos.
La organización en componentes suele derivar en la organización física de las máquinas
y la elección de lenguaje y programas auxiliares,
como por ejemplo qué base de datos usar.
De ahí vienen cosas como la arquitectura en tres capas que se popularizó hace años,
o la moda más reciente de usar gestores de colas en sistemas escalables.

Curiosamente, es más raro que en la arquitectura se incluya el diseño a alto nivel del propio software,
por ejemplo: la división en módulos de npm o en librerías,
cómo se dividen los servicios de una API en el código
o qué hacer con el código compartido entre diferentes programas.
Tampoco se suelen discutir asuntos más de DevOps como la forma de desplegar el código
o la creación de entornos de integración,
ya que suelen caer del lado del departamento de producción.
Así que por ahora nos limitaremos a considerar la organización en máquinas y qué software usar.

### Modas en arquitectura

En los años 80 la moda empresarial era tener una
[minicomputadora](http://www.computerhistory.org/revolution/minicomputers/11/366/1946)
(del tamaño de un armario pequeño) y múltiples terminales conectados.
La llegada de los ordenadores “personales” fue una revolución,
ya que hasta entonces era impensable darle un ordenador en exclusiva a un trabajador.

En los 90 se popularizaron las arquitecturas cliente-servidor.
Se separaban así los programas que residían en un servidor y que generaban respuestas,
de los clientes que utilizaban estas respuestas.
Poco después llegarían protocolos de comunicación entre servidores como CORBA
y un poco más tarde [XML](https://en.wikipedia.org/wiki/XML#History).

A principios del siglo XXI llegaron las
[arquitecturas de tres capas](https://en.wikipedia.org/wiki/Multitier_architecture#Three-tier_architecture):
capa de presentación, capa de lógica y base de datos.
Era un refinamiento del paradigma cliente-servidor donde se separaba el repositorio de datos,
la lógica de negocio y la presentación de la información.
También se inventó el ridículo
[_Enterprise Service Bus_](https://en.wikipedia.org/wiki/Enterprise_service_bus#History),
que empezó a infectar los diagramas corporativos allá por 2002,
y el [modelado de procesos de negocio](https://en.wikipedia.org/wiki/Business_process_modeling)
que por suerte parece que ha caído en desuso.

En los años 10 las bases de datos NoSQL han adquirido protagonismo.
Los servidores sin estado son de uso común,
al igual que los gestores de colas.
Son mejoras de este tipo las que han permitido la creación de servicios escalables
más allá de lo que se creía posible en décadas pasadas.

En general, un sistema de software suele poder fecharse con bastante precisión
sólo con ver la arquitectura que implementa.
No deja de ser curioso que se deje al arbitrio de modas
un asunto tan serio como la arquitectura de sistemas,
sobre todo en empresas grandes.
Lo cierto es que cuantos más elementos seamos capaces de utilizar,
más flechas tendremos en nuestro carcaj para cuando las necesitemos.

## Requisitos cambiantes

Un sistema de software tiene que poder evolucionar durante su vida útil.
Esto significa responder a requisitos cambiantes sin excesivas remodelaciones.

### Requisitos funcionales

Empecemos con una anécdota, en este caso con trasfondo militar.
El avión bombardero
[B-52 _stratofortress_](http://www.af.mil/AboutUs/FactSheets/Display/tabid/224/Article/104465/b-52-stratofortress.aspx)
empezó a operar en 1952 y las últimas unidades se construyeron en 1963;
actualmente sigue en servicio tras más de seis décadas de actualizaciones.
Durante este tiempo se han actualizado para usar motores turbofan y combustible alternativo,
lanzar armas nucleares y misiles inteligentes guiados,
se han reparado
[múltiples problemas estructurales](https://en.wikipedia.org/wiki/Boeing_B-52_Stratofortress#Design),
mejorado la aviónica, y habilitada la visión noctura para los pilotos.
Se estima que podrá seguir en servicio activo al menos hasta 2040.
En resumen: es un bombardero diseñado durante la guerra de Corea
y fabricado mientras JFK era presidente, que
seguirá en uso durante al menos otros 25 años.

Como ingenieros, nuestra mayor aspiración es seguramente que lo que construyamos dure en el tiempo.
Para eso es necesario que pueda actualizarse y mejorarse,
añadiendo nuevas funcionalidades según se necesiten.
Gracias a la magia del software no tenemos que sacar nuestros sistemas del servicio para actualizarlos;
basta con hacer una copia del código y reemplazar el de producción cuando están listas las mejoras.
Así que nos resulta relativamente fácil que nuestro software haga cosas nuevas.
¿O no?
Sólo tenemos que extenderlo para que haga cosas más allá de su propósito original.
Excepto cuando no se puede.

Todos conocemos algún proyecto que ha pasado su fecha de expiración.
Nadie quiere tocar el código porque se ha convertido en una masa
siniestra de _spaghetti_.
Las modificaciones son inmanejables y cada vez que se hace un cambio en un sitio,
se rompe algo en otro aparentemente no relacionado.

Nuestra misión es mantener el software flexible para que podamos seguir añadiendo funcionalidades.
Eso lleva algún esfuerzo extra, sin duda,
pero la recompensa es grande cuando el proyecto es realmente exitoso.

### Requisitos operacionales

Las circunstancias en las que nuestro sistema tiene que trabajar cambian,
para bien o para mal.
A menudo necesitamos ampliar el rango operativo del sistema sin añadir funcionalidades nuevas.

#### Planificación de capacidad

Un caso importante es la planificación de la capacidad necesaria para dar servicio,
lo que se conoce en inglés como _capacity planning_.
Un producto exitoso a menudo dobla el número de usuarios en un año, o incluso en meses:
en 2013 [Uber](http://techcrunch.com/2013/12/18/uber-lyft/)
crecía al 400% por año, mientras que su competidora Lyft lo hacía a un ritmo todavía más
vertiginoso que suponía multiplicar su facturación por 20 al año.

¿Es posible que el mismo sistema sea capaz de crecer para soportar todo el tráfico que le echemos?
Si usamos la planificación de capacidad tradicional
seguramente intentemos predecir el tráfico que vamos a tener durante todo el año
en base a los datos del año anterior,
para ir presupuestando el número de servidores que vamos a necesitar.
También necesitaremos redimensionar todos nuestros componentes para aguantar el tráfico extra.
Esto, que era práctica estándar hace unos años, ahora sería un suicidio:
la tasa de crecimiento puede ser exponencial y doblarse cada poco tiempo,
aunque también puede mantenerse estacionaria de repente durante meses.

¿Cómo predecir el tráfico que tendremos, no ya al final de un año,
sino sólo dentro de un mes?
Respuesta: no podemos.
Sólo podemos intentar ir un paso por delante del tráfico,
responder rápido a los cambios
y no adelantar demasiado los acontecimientos.

> #### Caso práctico: MediaSmart Mobile
> 
> ![Peticiones por segundo en MediaSmart Mobile](pics/mediasmart-krps.jpg)
> 
> Esta gráfica muestra los picos de peticiones por segundo que hemos recibido en MediaSmart Mobile desde 2013.
> Durante el primer año el volumen fue creciendo linealmente, pasando de 2 a 12 krps
> (miles de peticiones por segundo).
> A principios de 2014 pasó algo curioso: el ritmo se aceleró,
> y pasamos de 15 a 100 krps a finales de año.
> Pero en 2015 el ritmo está decelerando de nuevo:
> apenas pasaremos de 210 krps antes de final de año.
> 
> Si a principios 2014 hubiéramos pintado una línea recta para predecir el tráfico del año,
> habríamos calculado alrededor de 25 krps
> (definitivamente por debajo de 30 krps);
> a final de año teníamos 100 krps.
> Por otra parte, si hubiéramos seguido la curva exponencial para 2015,
> a final de año habríamos andado por 600 krps;
> la cifra real anda cerca de las 200 krps.

#### Costes bajos

Por último, pero no menos importante, tenemos los costes de operación del sistema.
Alquilar servidores en la nube no sale barato;
si no optimizamos su uso al máximo probablemente tiremos un montón de dinero.

> #### Caso práctico: MediaSmart Mobile
> 
> ![Tráfico diario en MediaSmart Mobile](pics/mediasmart-daily-traffic.png)
> 
> En MediaSmart el tráfico nocturno solía ser menos de una cuarta parte del pico diario:
> en la gráfica se aprecia un mínimo de 2.5 millones de peticiones por minuto,
> frente a casi 7 millones en el pico diario (alrededor de las 8 de la tarde).
> *Nota*: Amazon AWS mide las peticiones *por minuto*,
> en lugar de las peticiones *por segundo* que hemos visto arriba.
> 6M por minuto equivale a 100 krps.
> 
> Mantener arrancados los servidores todo el día suponía desperdiciar gran parte de la capacidad,
> y como en Amazon se paga por hora de servidor los costes eran astronómicos.
> Es esencial poder usar un número variable de servidores,
> y eso nos obliga a tener un balanceador de carga que pueda admitir nuevas instancias dinámicamente.

#### Velocidad de migración

La velocidad a la que somos capaces de migrar de una arquitectura a otra
es crítica.
Demasiado lento, y no seremos capaces de absorber un tráfico creciente de peticiones
o de mantener los costes controlados;
demasiado rápido, y nuestro sistema estará caído todo el tiempo.

Si tu proveedor de servidores en la nube sube los precios un 300% de un día para otro,
cosa que [ha ocurrido en el pasado](http://highscalability.com/blog/2011/9/7/what-google-app-engine-price-changes-say-about-the-future-of.html),
¿cuánto tiempo tarda tu equipo en migrar a un nuevo proveedor?

Y si mañana decides montar un CPD propio y albergar tus propios servicios,
¿cuánto tardarás en ejecutarlo?

### Migraciones de base de datos

Las migraciones de una base de datos a otra son muy importantes al escalar un sistema.

Cada base de datos tiene varias características que la hacen adecuada en ciertas situaciones,
y que la descartan en otras. Entre ellas:

* Rango operativo: ¿cuántas peticiones por segundo admite?
* Elementos funcionales: ¿qué tipos de datos permite guardar?
¿Qué tipo de consultas se pueden hacer?
* Tiempo de respuesta: ¿cuántos milisegundos se tarda en servir cada petición?
* Condiciones de operación: ¿cuántos servidores (y de qué tipo) se necesitan como mínimo?
¿Hasta cuántos escala?

Durante mucho tiempo se trabajó bajo el paradigma de “la base de datos perfecta”:
un mismo programa que escalara de casi cero (dispositivos muy limitados en recursos, como móviles)
a infinito (un cluster con tantos nodos como queramos).
Con la llegada de las bases de datos NoSQL asistimos a una explosión evolutiva
de bases de datos muy diferentes:
en memoria o en cluster; clave-valor o con estructuras complejas;
que admiten SQL y que no; etcétera.
Cada tipo es adecuado para unas condiciones operativas diferentes,
y tienen costes asociados muy distintos.

Además, los cambios de base de datos son ejemplos perfectos del tipo de migraciones que estamos estudiando.
En la sección de estrategias vamos a abusar de ellos para ilustrar cada técnica de migración.

## La arquitectura fluida

¿Cuál es la solución para acomodar tanto cambio?
Nuestra humilde sugerencia es mantener la arquitectura del sistema fluida,
sin tomar decisiones que comprometan su integridad.
Tenemos que ser capaces de pasar de un estado a otro,
intentando dar servicio todo el tiempo.

Al oir esto un arquitecto de los de verdad, de los que juntan piedras,
seguramente tendría problemas para contener la risa.
¿Cómo se pueden cambiar las vigas maestras de un edificio
mientras los habitantes están viviendo dentro?

Los ingenieros de software tenemos una gran ventaja
frente a otras ingenierías más tradicionales:
no trabajamos con el mundo real, rígido y frágil,
sino con software, que es infinitamente moldeable.

Si encontramos restricciones en esta maleabilidad
suele ser porque alguien no ha hecho bien su trabajo.
Subiendo de nivel paulatinamente, encontramos cosas como:

* código duplicado, donde hay que modificar varios trozos de código para cambiar cualquier cosa,
dificultando los cambios;
* dependencias cruzadas, que hacen que un cambio en una parte tenga efectos colaterales en partes no relacionadas;
* drivers imbricados en múltiples secciones del código,
que dificultan migrar bases de datos u otros componentes similares.

Vamos a centrarnos en las restricciones que nos dificultan una migración.

### Reversibilidad y termodinámica

En este punto vamos a tomar un desvío que nos llevará de viaje
a la intemporal tierra de la termodinámica.

Seguro que has oído hablar de “entropía”:
es un término muy popular entre los divulgadores científicos,
que a menudo lo corrompen asignándole significados corrientes
como “desorden”, “irregularidad” y similares.
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
Las ideas clave son: no malgastar energía,
ir lo más despacio que sea posible,
y evitar turbulencias.

En resumen, podemos considerar reversible un sistema que puede invertirse
sin consumir energía extra.
Al mismo tiempo, si revertir el funcionamiento del sistema requiere energía extra,
entonces el sistema no es reversible.

### Migraciones

Para realizar un cambio de una arquitectura a otra
normalmente tenemos que realizar un cambio,
sea de máquinas, de programas, de código o de datos.
Si las migraciones son fluidas, es decir que pasan de un estado a otro suavemente y sin turbulencias,
entonces podremos considerar que tenemos una arquitectura que fluye entre un estado y otro.
Las migraciones son claramente cruciales para nuestro objetivo de tener una arquitectura fluida.
Vamos a ver cada tipo de migración por encima.

*Máquinas*: Normalmente cambiar de máquinas no se considera un asunto de arquitectura.
Pero si miramos más allá del hierro,
a menudo nos encontramos con un sistema operativo más moderno (o incluso distinto),
que puede requerir nuevos programas.
También puede ser que las máquinas tengan nuevas capacidades que requieren de cambios en el código,
como los servidores multicore que nos invadieron hace un par de décadas.
Además, cuando las máquinas migradas albergan grandes cantidades de información
suele haber una migración de datos asociada.

*Programas*: Los cambios en un programa que no desarrollamos directamente
pueden ir desde un cambio de versión a un cambio completo del programa que usaremos.
En el primer caso puede ser que tengamos pequeños cambios de código:
por ejemplo, cada actualización de la base de datos Oracle puede requerir pequeños ajustes en las sentencias SQL usadas.
Cuando se cambia de programa puede que tengamos que cambiar el driver,
o incluso (si es una base de datos) migrar los datos.
Por tanto los cambios de programa a menudo llevan aparejados cambios de código y/o datos.

*Código*: Cuando el código está bajo nuestro control,
cada despliegue se convierte de hecho en una migración:
de la versión en producción a una nueva.
A veces también tienen aparejadas migraciones de datos,
por ejemplo cuando hay un cambio de esquema en la base de datos.

*Datos*: Las migraciones de datos son el ejemplo más claro de cambio que debe manejarse con delicadeza.
En este caso hay que mover o redistribuir información,
que suele ser lo más delicado en una migración.
Como vemos, las migraciones de datos son además el final de la cadena:
cada tipo de migración arriba puede llevar aparejada una migración de datos,
pero no viceversa.

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

