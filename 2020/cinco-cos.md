---
title: 'Los cinco "Co"s'
subtitle: 'Construye tu camino al éxito en cinco puntos'
footer: Publicado el 2020-12-24, modificado el 2020-12-24.
  [¿Comentarios, sugerencias?](mailto:alexfernandeznpm@gmail.com)
---

![Crea rama, añade cambios, revisa, mezcla, crea _tag_, despliega.](pics/tpp-ramas.png "Ejemplo de organización de ramas en TPP. Fuente: elaboración propia.")

Durante los últimos seis meses he participado con LeanMind en un proyecto para Alterna Energética.
Ha sido un auténtico placer trabajar con tantos buenos profesionales
(incluyendo por supuesto estupendas profesionales),
y los resultados han sido bastante satisfactorios para todos,
incluyendo el cliente que es lo más importante.

Es muy habitual ver artículos sobre detalles técnicos de un proyecto.
En este caso vamos a centrarnos en _soft skills_ o "habilidades blandas":
aspectos menos técnicos y más humanos que nos ayudan a trabajar juntos,
y en algunos casos a plantear las tareas de la forma más apropiada.

En la última retrospectiva hemos identificado cinco puntos que han sido cruciales
para el éxito del proyecto.
Como todos empiezan por "co" vamos a usarlo como regla nemotécnica para acordarnos mejor.
Sin más dilación os dejo con los cinco (más uno) "Co"s.

## Comunicación

Empezamos sobre seguro.
El primer punto no os descubrirá nada nuevo:
obviamente la comunicación es importante para cualquier proyecto,
sea de software o no.
Lo que sí es decisivo es la forma de comunicarse.

### Comunicación escrita

En estos tiempos de pandemia lo que antes era crucial ahora es indispensable:
todo lo que se hable debe quedar reflejado por escrito
y estar publicado para que todo el equipo sepa a qué atenerse

En un proyecto en remoto tendemos a comunicarnos muy a menudo por escrito,
pero en medios conversacionales (Slack, Whatsapp)
donde cada elemento queda enterrado entre conversaciones cruzadas.
No vale con eso; tenemos que elaborar documentos que destilen el conocimiento adquirido
en forma que sea fácil de digerir por cualquier persona ajena al equipo.

### Línea base

El documento escrito forma la base sobre la que se desarrollará el conocimiento del equipo.
Debe estar todo detallado.

Tengo pendiente escribir un artículo sobre conocimientos desconocidos.
Por ahora baste con reflejar que la información asimétrica
(lo que sólo conoce parte del equipo)
puede llevar a serios problemas en el desarrollo.
El documento escrito y público permite que todo el mundo adquiera y contraste su conocimiento
con 

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

## Confianza

## Conflicto

Este punto puede ser algo más sorprendente que los anteriores.
El conflicto (y cómo manejarlo) es crucial para el éxito de un proyecto.

Es posible que pienses:

> Pero, Pinchito, ¿insinúas que los conflictos son esenciales para el éxito de un proyecto?
> Resolverlos cuando aparecen, claro que sí, pero
> ¿la propia existencia del conflicto es necesaria?
> ¿No será mejor que no haya conflictos?

Realmente el conflicto es importante.
En un equipo ideal hay diversidad de experiencias,
de capacidades,
y también de trasfondo sociocultural:
edad, sexo, educación, procedencia.
Esto llevará inevitablemente a que los problemas se encaren de forma diferente.
Muy a menudo hay soluciones (por ejemplo partes del código)
que no convencen a parte del equipo,
que puede proponer otras soluciones alternativas.
Ya tenemos el conflicto planteado:
¿elegimos la solución A que convence a una parte del equipo,
o la solución B que convence a otra parte?

### Solución C

Sigamos buceando en el problema.

### Mediación

En situaciones de conflicto,
contar con una figura de mediación externa al problema puede ser muy interesante.
Al no estar implicada directamente,
esta persona puede actuar de juez imparcial y ayudar a transitar el camino hacia la solución que satisface a todo el mundo;
o al menos hacer entender por qué se adopta una solución concreta.

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

## Compatibilidad hacia atrás

Un proyecto desde cero siempre es agradable porque no hay
ninguna herencia (el temible _legacy_) que mantener.
En nuestro caso teníamos que construir un sistema nuevo,
pero lidiando con una MySQL ya creada,
con las peculiaridades habituales de cualquier base de datos creada por agregación:
datos repetidos,
inconsistencias,
estructuras duplicadas.

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

## Constructividad

Cuando hay un problema,
y siempre habrá problemas,
es muy importante tomárselo en serio.
Las críticas deben ser siempre constructivas.

Si os interesa el tema,
este año he dado un par de charlas sobre análisis de incidencias,
en [madScalability](https://www.youtube.com/watch?v=g274h7w0TTk)
y en [Benidorm Tech](https://www.youtube.com/watch?v=CTcKuZ2gcHQ),
y una específicamente sobre
[la catástrofe de Chernóbil](https://www.youtube.com/watch?v=nQksMZRqvRw).

## Conclusión

En esta sexta "Co" de regalo,
resumimos los puntos que han ayudado a llevar un proyecto fluido.

El proyecto sigue,
con un equipazo que estoy seguro que va a hacer un trabajo estupendo.
Además la forma de trabajo.

### Agradecimientos

Muchas gracias a Carlos Blé de LeanMind,
por haber hecho posible este gran proyecto con este gran cliente.
Si tenéis un proyecto de software y necesitáis una ayuda hay poca gente mejor a la que acudir.

Muchas gracias a Antonio Peral de Alterna por habernos proporcionado todo lo que hemos necesitado,
y haber estado abierto a sugerencias y cambios.

