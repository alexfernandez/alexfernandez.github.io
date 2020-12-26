---
title: 'Los cinco "Co"s'
subtitle: 'Cinco soft skills esenciales'
footer: Publicado el 2020-12-24, modificado el 2020-12-24.
  [¿Comentarios, sugerencias?](mailto:alexfernandeznpm@gmail.com)
---

![Los cinco "Co"s.](pics/cinco-cos-intro.png "Comunicación, Compatibilidad, Constructividad, Conflicto, todos llevan a Confianza. Fuente: elaboración propia.")

Durante los últimos seis meses he participado con LeanMind en un proyecto para Alterna Energética.
Ha sido un auténtico placer trabajar con tantos buenos profesionales
(incluyendo por supuesto estupendas profesionales),
y los resultados han sido bastante satisfactorios para todos,
incluyendo el cliente que es lo más importante.

En la última retrospectiva hemos identificado cinco puntos que han sido cruciales
para el éxito del proyecto.
Como todos empiezan por "co" vamos a usarlo como regla nemotécnica para acordarnos mejor.
Es muy habitual ver artículos sobre detalles técnicos de un proyecto.
En este caso vamos a centrarnos en _soft skills_ o "habilidades blandas":
aspectos menos técnicos y más humanos que nos ayudan a trabajar juntos.

A estas alturas un artículo que simplemente dijera "tal y tal cosa son importantes"
tendría una utilidad muy limitada,
así que para cada uno veremos unas cuantas técnicas concretas que nos ayuden a aplicar estas habilidades.
Sin más dilación os dejo con los cinco (más uno) "Co"s.

## Comunicación

![Equipo comunicándose.](pics/cinco-cos-comunicacion.png "Dos personas observan a una tercera persona tecleando. Fuente: elaboración propia.")

Con la primera "Co" empezamos sobre seguro.
La elección no os descubrirá nada nuevo:
obviamente la comunicación es importante para cualquier proyecto,
sea de software o no.
Lo que sí es decisivo es la forma de comunicarse.

### _Mob Programming_

Una técnica nueva para mí y que me ha sorprendido es el _mob programming_.
Si pensabas que la programación en pareja o _pair programming_ era poco productiva,
espera a que te cuente cómo funciona la programación en grupo:
todo o parte del equipo se reúne para escribir código.
Una persona toma el teclado, el _driver_ o conductor.
El resto hacen de _navigators_ o copilotos,
y van mapeando el terreno:

> A ras, a ras,
> ojo nieve, ojo curva.
> ¡Arranca, Carlos, por Dios!

Programar de esta manera es sorprendentemente efectivo,
sobre todo para conseguir que el conocimiento se difunda en el equipo.
También hemos probado a hacer _mob programming_ con gente del cliente,
lo que les ha servido para comprobar en directo cómo trabajamos
e incluso para adoptar ciertas prácticas de desarrollo en sus proyectos propios.

Es cierto que se consume mucho tiempo programando así,
pero también se ahorra después en formación, explicaciones
y revisión de código.
Es más, la dinámica del [proceso de revisión](https://pinchito.es/2018/has-anyone-else-seen-your-code)
cambia completamente:
ya no es necesario lanzar _pull request_,
revisar, aprobar y mezclar.
Ahora podemos directamente mezclar el código que se ha programado y revisado en directo.

Eso sí,
yo sigo pensando que parte del trabajo debe hacerse en privado,
que es mucho más productiva en aspectos más mecánicos.

### Comunicación escrita

En estos tiempos de pandemia lo que antes era crucial ahora es indispensable:
todo lo que se hable debe quedar reflejado por escrito
y estar publicado para que todo el equipo sepa a qué atenerse

En un proyecto en remoto tendemos a comunicarnos muy a menudo por escrito,
pero en medios conversacionales (Slack, Whatsapp)
donde cada elemento queda enterrado entre conversaciones cruzadas.
No vale con eso; tenemos que elaborar documentos que destilen el conocimiento adquirido
en forma que sea fácil de digerir por cualquier persona ajena al equipo.

### Líneas base

Tengo pendiente escribir un artículo sobre conocimientos desconocidos.
Por ahora baste con reflejar que la información asimétrica
(lo que sólo conoce parte del equipo)
puede llevar a serios problemas en el desarrollo.
El documento escrito y público permite que todo el mundo adquiera,
compare y contraste su conocimiento con el del resto del equipo.

Hace más de veinte años recibí un estupendo curso de [Kyle Rone](https://www.linkedin.com/in/kyle-rone-3545451/),
un manager de IBM que trabajó en el proyecto del transbordador espacial.
Insistía mucho en lo de tener una o varias _baseline_,
que el equipo en el que estaba interpretaba de forma jocosa como "vaseline".
A decir verdad yo tampoco entendía bien a qué se refería,
pero creo que ahora tengo alguna idea de por qué tener líneas base es tan importante.

El documento escrito forma la base sobre la que se desarrollará el conocimiento del equipo.
Debe estar todo detallado y especificado hasta el nivel de detalle que sea necesario,
como vamos a ver en el siguiente apartado.

Cuando se avanza en el conocimiento se vuelve a elaborar una nueva línea base,
que se verá reflejada en un nuevo documento.
De esta forma mantenemos siempre actualizado el conocimiento del equipo.
Es muy fácil (y más hoy día) mantener una base de conocimiento
o _knowledge base_ que nos sirva de referencia.
Es cierto que la mayoría de gestores documentales son laberínticos
y no ayudan demasiado a organizar la información;
en nuestro caso tenemos una cuenta en Confluence con una mínima estructura para ayudarnos a organizar los documentos.

### El arte de la especificación técnica

Para cada elemento del sistema que tenga sentido por sí solo
(subsistema, script, pestaña de la web…)
elaboraremos un documento maestro que recoja todos los detalles de la implementación.
No podemos esperar que otra persona nos saque las castañas del fuego:
en lugar de esperar a que el cliente elabore los requisitos,
los obtendremos en forma de entrevistas y los escribiremos dentro del propio equipo.

Siempre tendemos a dar por supuestas ciertas ideas que parecen obvias.
Mal; en un documento técnico tenemos que explicarlo todo desde cero.
El objetivo debe ser que una persona inteligente totalmente ajena a nuestro proyecto
pueda entenderlo todo sólo leyendo la especificación.

En un texto literario
(una novela, una égloga, o incluso una entrada de blog como ésta)
la repetición es veneno:
usar la misma palabra varias veces en una frase o un párrafo
demuestra falta de estilo y aturde al lector.
No digamos ya usar la misma frase varias veces.

En un documento técnico tendremos que cambiar el hábito:
no temas repetirte las veces que haga falta para evitar ambigüedades.
Es importante que cada párrafo sea autocontenido:
no siempre tendrás el lujo de que tus lectoras empiecen por el principio y terminen por el final.
Así el documento será valioso como referencia técnica,
que se pueda consultar para averiguar cómo debe funcionar un aspecto dado de la implementación.

El mayor valor de una especificación suele ser encontrar los casos raros
o _corner cases_:
esos pequeños detalles que afectan sólo a algunos clientes,
en condiciones inusuales,
cuando hay tormenta.
Pregúntate siempre si estás listo para lo peor:
¿hemos contemplado el día de cambio de hora?
¿Qué pasa si un cliente no tiene datos un día, o un mes?
¿Sabemos cómo tratar esos contratos _legacy_ que siempre se nos olvidan?

Finalmente, la especificación debe ser lo suficientemente completa
como para que el equipo pueda usarla de _checklist_:
una vez que se cumplan todos los requisitos marcados el trabajo estará listo.
Si encontramos nuevos casos raros (_corner cases_) no contemplados,
los añadiremos a la especificación.

## Compatibilidad hacia atrás

![Manteniendo la compatibilidad.](pics/cinco-cos-compatibilidad.png "Dos versiones diferentes de una misma idea, una única interfaz. Fuente: elaboración propia.")

Para la segunda "Co" vamos a arriesgar algo más.
Un proyecto desde cero siempre es agradable porque no hay
ninguna herencia (el temible _legacy_) que mantener.
En nuestro caso teníamos que construir un sistema nuevo,
pero lidiando con una MySQL ya creada,
con las peculiaridades habituales de cualquier base de datos creada por agregación:
datos repetidos,
inconsistencias,
estructuras duplicadas.

### Resistiendo la tentación

Es muy tentador querer mezclar nuestro proyecto con mejoras en los sistemas heredados,
en nuestro caso la base de datos.
¿Y si añadimos este campo a esta tabla,
o unificamos estas dos tablas?
Así simplificamos el desarrollo porque podemos hacerlo todo más eficiente.

Pero nos encontraríamos con un pequeño problema:
habrá que cambiar también el código _legacy_ para que acceda al nuevo campo o la nueva tabla.
Y peor todavía, tendríamos que sincronizar nuestras mejoras con las de la base de datos,
complicando el proyecto exponencialmente.

Así que optamos por simplemente considerar la base de datos como inmutable,
y trabajar con lo que teníamos.
De esta forma evitamos la tentación de meternos en guerras con varios frentes.
La compatibilidad hacia atrás se vuelve extremadamente importante:
¿cómo hacía cada proceso el sistema existente?

A cambio las mejoras en el proceso han valido la pena.

### Chequeo de datos

Como parte de nuestras pruebas,
y para comprobar que estamos obteniendo los resultados correctos,
podemos recorrer el histórico en la base de datos e intentar replicar los resultados existentes.
Así hemos podido ir mejorando nuestro proceso,
calculando el tanto por ciento de resultados iguales:
primero un 5%, luego un 80%,
después un 95.5%, un 98%…
hasta llegar al ansiado 100%.

En realidad siempre nos han quedado unos pocos registros que se nos resistían,
en algunos casos por haber identificado resultados mal calculados por el sistema _legacy_.
Pero no hay problema mientras seamos capaces de explicar hasta la última discrepancia.

### Reemplazo parcial

En lugar de tener que reemplazar todas las piezas del sistema,
podemos ir reemplazando una a una.
Cada una 

## Conflicto

![Equipo en conflicto.](pics/cinco-cos-conflicto.png "Dos personas tienen diferentes ideas, ¿cómo reconciliarlas? Fuente: elaboración propia.")

Este punto puede ser algo más sorprendente que los anteriores.
El conflicto (y cómo manejarlo) es crucial para el éxito de un proyecto.

Es posible que pienses:

> Pero, Pinchito, ¿insinúas que los conflictos son esenciales para el éxito de un proyecto?
> Resolverlos cuando aparecen, claro que sí, pero
> ¿la propia existencia del conflicto es necesaria?
> ¿No será mejor que no haya conflictos?

Pero el conflicto tiene mucho que enseñarnos.
En un equipo ideal hay diversidad de experiencias,
de capacidades,
y también de trasfondo sociocultural:
edad, sexo, educación, procedencia.
Esto llevará inevitablemente a que los problemas se encaren de forma diferente.
Muy a menudo hay soluciones (por ejemplo partes del código)
que no convencen a parte del equipo,
que puede proponer otras soluciones alternativas.

El conflicto nos ayuda a aflorar estas discrepancias,
estos puntos débiles del código que no terminan de convencernos.

### Solución C

Ya tenemos el conflicto planteado:
¿elegimos la solución A que convence a una parte del equipo,
o la solución B que convence a otra parte?
Sigamos buceando en el problema.
Si rascamos un poco veremos que seguramente la solución A
**tampoco convence del todo** a los proponentes,
y lo mismo ocurre con la solución B.
Y es lógico: en general los miembros del equipo saben de lo que hablan.
Los inconvenientes de cada solución son también visibles para quienes la ven como la mejor,
aunque consideren que la otra solución es peor.

Así que sigamos buscando.
Es posible que encontremos una solución C sin los inconvenientes de A ni los de B.

### Mediación

También es posible que no exista solución buena,
o al menos que no sepamos encontrarla.
¿Qué hacemos en este caso?

En situaciones de conflicto,
contar con una figura de mediación externa al problema puede ser muy interesante.
Al no estar implicada directamente,
esta persona puede actuar de juez imparcial
y acompañarnos por el camino hacia la solución que satisface a todo el mundo;
en otros casos nos puede ayudar a entender por qué se adopta una solución concreta.

También puede ayudar a investigar el coste de pasar de una solución a otra
cuando las circunstancias cambien.
Esto nos lleva directamente al siguiente punto.

### La solución reversible

En [Linux kernel management style](https://lwn.net/Articles/105375/),
[traducido al castellano](http://www.escomposlinux.org/egkl/),
Linus Torvalds nos cuenta cómo alcanzar la solución ideal:

> Hay que darse cuenta de que la diferencia crucial entre una decisión
> gorda y una pequeña es que puedas cambiar de decisión más adelante.
> Cualquier decisión puede hacerse pequeña si te aseguras de que si te
> equivocas (y te vas a equivocar _seguro_), siempre puedes deshacer el
> daño más tarde volviendo sobre tus pasos. De repente, eres el doble de
> gestor por tomar _dos_ decisiones sin importancia: la errónea _y_ la
> correcta.

Una buena forma de minimizar el daño de una decisión subóptima es
asegurarte de que puedes corregirla sin demasiado problema.
En este sentido el desarrollo de software es una gran disciplina:
normalmente basta con realizar un cambio de código _et voilà!_,
ya tenemos la solución buena en marcha.

## Constructividad

![Equipo siendo constructivo.](pics/cinco-cos-constructividad.png "Una persona ayuda a construir, la otra está muy atenta. Fuente: elaboración propia.")

Cuando hay un incidente,
y siempre habrá incidentes,
es muy importante tomárselo en serio.
Las críticas deben ser siempre constructivas.

### Postmortem sin culpa

Si os interesa el tema,
este año he dado un par de charlas sobre análisis de incidencias,
en [madScalability](https://www.youtube.com/watch?v=g274h7w0TTk)
y en [Benidorm Tech](https://www.youtube.com/watch?v=CTcKuZ2gcHQ),
y una específicamente sobre
[la catástrofe de Chernóbil](https://www.youtube.com/watch?v=nQksMZRqvRw).
Para nuestros propósitos actuales nos centraremos en el
**postmortem sin culpa** o _blameless postmortem_.

También como parte del análisis de incidencias
tenemos que alejarnos de actitudes poco productivas
como buscar el error humano,
y acercarnos más a entender a la otra persona.
¿Por qué en su momento pensamos que era buena idea hacer lo que hicimos,
aunque terminara siendo un problema en producción?

### El postmortem en integración

Una técnica que hemos explorado en este proyecto,
y que en cierta manera es original (o al menos yo no la he visto descrita)
es hacer análisis de incidencias que ni siquiera llegan a producción.
Analizar los fallos de nuestro proceso de desarrollo en integración nos permite refinarlos y aprender
sin necesidad de darnos un batacazo en producción.

Es mucho más fácil actuar de forma constructiva cuando las apuestas no son tan altas:
un fallo en un entorno de integración es a lo sumo una molestia,
y es casi imposible que afecte a clientes o a las cuentas de la empresa
más allá de lo que cueste arreglarla.
También es más fácil tomarse un fallo en integración como un éxito más que como un fracaso:
al fin y al cabo hemos conseguido evitar que el problema llegue a producción.

## Confianza

![Equipo aportando conflianza.](pics/cinco-cos-confianza.png "Una persona se cae, otras dos acuden a sostenerla. Fuente: elaboración propia.")

Dejamos para el final esta "Co" que se destila de los anteriores.
La confianza no se puede conseguir por sí sola;
es consecuencia del trabajo continuado.
Pero también se puede mejorar deliberadamente.

A continuación vamos a revisar algunas técnicas que ayudan a conseguir
que un equipo trabaje con confianza.

### Confianza del cliente

La primera parte es lógicamente la confianza del cliente,
que se gana a lo largo de años de trabajo.
En nuestro caso teníamos la suerte de que Carlos Blé ya había trabajado anteriormente con Alterna,
y con su buen hacer se habían ganado su confianza.

En este proyecto he aprendido que hay que mirar en el interés del cliente,
pero no en un sentido estricto sino con cierta amplitud de miras.
En mi caso la cosa se podría haber complicado por trabajar con LeanMind a un lado y a Alterna a otro,
lo que podría causar conflictos.
La clave para desenredar este problema a tres bandas fue tener como objetivo
mejorar la relación mutua entre LeanMind y Alterna.

En general puede ser importante localizar los puntos de beneficio mutuo y trabajar sobre ellos,
y no ahondar en los que suponen sólo beneficio para una de las partes.

### Despliegue continuo

La prueba última de la confianza en la tecnología
es dejar que ésta se encargue de los despliegues en producción,
sin supervisión humana.

Llevo unos ocho años siendo un gran fan del
[despliegue continuo](https://pinchito.es/2012/continuous-deployment).
En este tiempo he usado una decena de sistemas diferentes,
la mayoría orientados a la integración continua.
En contadas ocasiones hemos tenido la suficiente confianza en la tecnología
como para hacer [despliegue continuo de verdad](https://pinchito.es/2016/stridercd):
cada cambio hecho en la rama principal del repo se prueba y llega a producción en unos pocos minutos.

En [nuestra última aventura](https://pinchito.es/2019/devops-on-the-cheap)
vimos cómo hacer despliegue continuo en 600 líneas de código.
Ahora, gracias a las
[Bitbucket _pipelines_](https://support.atlassian.com/bitbucket-cloud/docs/get-started-with-bitbucket-pipelines/)
es perfectamente posible hacer integración continua con un script en Bash de 30 líneas,
más 10 líneas de YAML.
(Lo mismo se puede hacer con
[GitHub Actions](https://github.com/features/actions)
o con [GitLab Pipelines](https://docs.gitlab.com/ee/ci/pipelines/)).

En nuestro proyecto no hemos llegado al despliegue continuo;
al ser en su mayoría una serie de procesos _batch_
tampoco tiene el mismo sentido que en una aplicación web.
Pero está todo preparado y es cuestión de seguir en la misma línea.

### Confianza en el equipo

En un equipo la cosa debe ir más allá de simplemente confiar en el trabajo ajeno.
Algo más importante todavía es que cualquiera pueda contar los problemas que ve,
y que puedan comentarlos en grupo.

Tengo que reconocer que en alguna ocasión no he sabido entender las preocupaciones del equipo,
sobre todo a la hora de rematar el trabajo.
Pero gracias a la mediación de Carlos Blé hemos podido hablarlo en grupo
y llegar a un acuerdo satisfactorio para todos.

Otro aspecto en el que he trabajado pero donde tengo que mejorar todavía
(y esto lo anoto aquí como reto personal)
es dejar que el equipo cometa errores.
Como Blé me ha contado,
a veces es necesario dejar que el equipo siga un rumbo distinto al que nos gusta,
pese a que tengamos claro que sea un error.
Para empezar todo el mundo tiene que poder aprender de sus errores.
Y para seguir,
es posible que en ocasiones
(como me ha pasado a mí repetidamente)
los miembros con menos experiencia tengan razón.
En cualquier caso el equipo aprenderá algo,
y por el camino se reforzará la confianza del equipo.

## Conclusión

En esta sexta "Co" de regalo resumimos los puntos que han ayudado a llevar un proyecto fluido.

El proyecto sigue,
con un equipazo que estoy seguro que va a hacer un trabajo estupendo.
Además la forma de trabajo ha calado en el equipo del cliente,
que están empezando a usarla en sus proyectos propios.
Eso es, en parte, el mejor resultado posible del proyecto:
aportar a la cultura de una empresa joven como Alterna.

### Agradecimientos

Muchas gracias a Carlos Blé de LeanMind
por haber hecho posible este gran proyecto con este gran cliente.
Si tenéis un proyecto de software y necesitáis una ayuda hay poca gente mejor a la que acudir.

Muchas gracias a Antonio Peral de Alterna por habernos proporcionado todo lo que hemos necesitado,
y haber estado abierto a sugerencias y cambios.

Gráficos elaborados con [Excalidraw](https://excalidraw.com/).

