---
title: 'Repaso de 2019 y propósitos para 2020'
subtitle: '🎶 Ay quién maneja mi barca, quién 🎶'
footer: Publicado el 2020-01-01, modificado el 2020-01-01.
  [¿Comentarios, sugerencias?](mailto:alexfernandeznpm@gmail.com)
---

![This is the tale of how my team and I built what would become my nth system for continuous deployment.](pics/devops-gears.jpg "Wheel on Steam Locomotive, source: https://commons.wikimedia.org/wiki/File:Wheel_on_%E2%80%9CPeggy,%E2%80%9D_a_Lima_Shay_Geared_Steam_Locomotive_(SN_2172).jpg")

En este inicio de año voy a hacer públicas algunas reflexiones,
a ver si consigo que se publiquen en la página de objetivos de
[David Bonilla](https://bonillaware.com/objetivos-para-2020).
Los propósitos en sí los he indicado **en negrita**.

## Repaso de 2019

Voy a empezar por revisar el año que acaba de terminar.

### Laboral

Empecé este año pasado negociando un cambio de trabajo.

He estado casi dos años muy a gusto en [Devo](https://www.devo.com/)
y con buenas condiciones:
en el equipo de desarrollo he reencontrado a viejos amigos y hecho otros nuevos,
he trabajado en Node.js a muy bajo nivel,
e incluso he conseguido que aceptaran
[mi primer código en el core de Node.js](https://github.com/nodejs/node/pull/20344),
que ha llevado a una
[mejora de rendimiento brutal en conexiones TLS](https://github.com/nodejs/node/pull/27861)
para todos los usuarios.

Pero echaba de menos algo más de responsabilidad, la verdad,
sobre todo para implantar ciertas prácticas de desarrollo de software
que me parecen esenciales y donde Devo dejaba que desear:

* limpieza en entornos de desarrollo,
* despliegue continuo,
* [DevOps en general](http://pinchito.es/2017/build-your-own-devops-infrastructure.html),
* y [revisión de código](http://pinchito.es/2018/has-anyone-else-seen-your-code.html).

A finales de marzo me cambié a
[Influencity](https://influencity.com/).
El reto era bastante grande:
liderar un equipo muy desmotivado y actualizar una plataforma con una deuda técnica monumental,
tras varios años de desarrollos a matacaballo.

En unos pocos meses teníamos
[un sistema de integración continua potente](http://pinchito.es/2019/devops-on-the-cheap.html),
y dos nuevas personas que han redondeado un equipo de alto rendimiento, motivado y trabajando a tope.
Hemos relanzado varios componentes críticos de la plataforma,
renovado la web y añadido una sección de pagos completamente nueva.

Todo esto mientras creábamos varias suites de pruebas y
mejorábamos la arquitectura interna:
en el backend hemos eliminado una arquitectura de microservicios algo extraña
que ralentizaba ejecución, desarrollo y despliegues sin beneficio real,
volviendo a un monolito mucho más eficiente.
En el frontend hemos creado una librería de componentes React
que ha simplificado mucho el trabajo.

No está mal para ocho meses, ¿no?
Pero ni siquiera ha sido lo más importante:
la experiencia de liderar un equipo de gente majísima ha sido muy enriquecedora.

De forma global creo que hemos cumplido (casi) todos los objetivos técnicos y de negocio.
El camino no ha estado exento de problemas:
al parecer no he sabido transmitir al CEO todo el trabajo realizado.
Mi torpeza para la comunicación y la política interna
(seguramente combinada con una situación financiera mejorable)
ha terminado motivando mi salida de la empresa.

Termino el año embarcado en algún que otro proceso de selección
para puestos en remoto.

### Comunidad

Este año he dejado la organización de MadridJS y Node.js Madrid.
Había empezado a notar que me daba pereza gestionar los eventos,
y luego a la hora de ir me saltaba la mayoría.
Así que tras cinco años a una media de 20 eventos al año
he decidido dejar la organización en las capaces manos de
[Javi Vélez](https://twitter.com/javiervelezreye) y
[Manu Fosela](https://twitter.com/manufosela).

He seguido actuando como parte del PMC de Codemotion Madrid,
donde también he dado una
[charlita](https://events.codemotion.com/conferences/madrid/2019/agenda/).
En el lado negativo la valoración del público ha sido regular:

> 67 % "Good", 22 % "Neutral" and 11 % "Bad"

bastante peor que mi charla del año pasado:

> 95% "Good", 5 % "Neutral" and 0% "Bad",

e incluso que la [première en Roma](https://events.codemotion.com/conferences/rome/2019/speaker/4421/) este mismo año:

> 78% "Good",  15% "Neutral" and  7% "Bad".

Para empezar tuve problemas técnicos con algunos vídeos,
pero no puedo achacar a eso la valoración.
Aunque el público estuvo interesado la mayor parte del tiempo
creo que no he sabido hacer que el material fuera todo lo interesante que se merecía.
En sucesivas charlas intentaré potenciar el aspecto técnico,
sin descuidar la parte más lúdica.

También en Codemotion he dado un
[webinar](https://extra.codemotion.com/webinar-alexfernandez-refactoringarchitecture/)
sobre cómo refactorizar la arquitectura de un sistema en uso,
basado en el trabajo hecho en Influencity.

Por último, he presentado cinco propuestas para
[t3chfest](https://t3chfest.es/2020/en):
una en solitario sobre bacterias vistas desde el punto de vista de la tecnología,
y [cuatro dando apoyo](https://twitter.com/pinchito/status/1207344167854247937) a otros tantos grandes ponentes.
Aviso, ¡como salga mi propuesta con [Fran Barea](https://twitter.com/MandisBack) va a ser la risa! 😂

### Personal

Este año me he mudado a Viena con mi familia;
durante este tiempo yo he seguido viniendo a Madrid una semana al mes.
Mi hija y mi mujer están aprendiendo alemán como unas campeonas,
y hemos podido atravesar los complejos trámites del cambio de residencia para ellas.
La vida allí es muy tranquila y ordenada.

También me he dedicado con afán a aprender a dibujar,
y ya empiezo a ver los frutos.
Mi profesor es el gran
[Arturo Martín Burgos](http://www.arturomartinburgos.com/),
reputado pintor y escenógrafo, y ganador de un premio MAX de teatro.
Me está dando clase a través de Whatsapp,
y a cambio yo le actualizo de vez en cuando su página web.

Esta Navidad me propuse el _portrait challenge_:
dibujar gratis a gente que pasara por el paseo marítimo.
Finalmente me atreví y conseguí un par de "clientes".

[Este retrato no quedó mal].

## Propósitos para 2020

A continuación os contaré mis propósitos de año nuevo.

### Laboral

En este nuevo año quiero buscar un **trabajo que sea sostenible**
y donde pueda desarrollar mi carrera durante cinco o diez años tranquilamente.
Idealmente me gustaría trabajar en un sitio con reto técnico
y que no sea exactamente lo mismo que llevo haciendo varios años.

También me interesa que sea algo relacionado con mi carrera profesional:
tengo ya 47 años, y según parece a partir de los 50 la búsqueda de trabajo se complica bastante.
Me gustaría seguir avanzando en retos de escalabilidad y rendimiento.

Llevo varias semanas dudando entre buscar puestos más de liderazo de equipos o seguir una carrera técnica,
o bien combinar ambas cosas.
Creo que en este momento mi mejor opción es ver qué ofertas tengo
y luego decidir entre ellas
(si es que consigo más de una).

### Comunidad

Este año me gustaría **acercarme a
[ViennaJS](https://viennajs.org/)**
para ver qué se cuece por allí.

Quiero **seguir dando charlas ocasionales**.
Como soy muy divo no suelo buscar CfPs activamente sino que espero a que me inviten.
No pido mucho realmente, basta con un tweet o un mail convocándome.
Y por supuesto me interesa **seguir colaborando con cualquier organización que me necesite**,
empezando por Codemotion (si me quieren).

También estoy muy interesado en **subir el nivel de las charlas que dé**,
tras el relativo jarro de agua fría de Codemotion.
Aquí no tengo muy claro cómo hacerlo más allá de colaborar con otra gente.
Estoy dispuesto a buscar ayuda donde la encuentre.

### Personal

Para terminar el año se me rompió mi añejo Samsung S7,
sin posibilidad de recuperar nada;
por suerte había hecho una copia de seguridad hace un par de semanas.
En el nuevo Samsung A40 no he instalado el ajedrez ni otras aplicaciones que me coman la vida.
Mi propósito general es **usar mucho menos el móvil**.
Esto sustituye al clásico "pasar más tiempo con mi familia" pero no deja de tener el mismo objetivo,
porque el tiempo robado al móvil lo usaré obviamente en eso.

En el área más artística me gustaría **perfeccionar varias áreas del dibujo**
como el trazo o la composición.
Espero poder **repetir el _portrait challenge_**,
tanto este inicio de año como en verano.

Tengo interés desde hace tiempo en empezar a **publicar mis dibujos**,
por ejemplo en Instagram,
aunque me da bastante reparo su política de uso.

También quiero **publicar el curso de dibujo en remoto** de mi profesor Arturo,
basado en los ejercicios que me envía.
Creo que puede ayudar a mucha gente igual que me ha servido a mí.

## Conclusiones

Como veis tengo nueve propósitos para este año.
¿Cuántos cumpliré?
¿Cuántos quedarán en agua de borrajas?

He intentado que sean objetivos concretos y contrastables,
aunque soy consciente de que no siempre lo he conseguido.

### Agradecimientos

Quiero dar las gracias a
[David Bonilla](https://bonillaware.com/objetivos-para-2020)
por animarme a escribir este artículo con su última Bonilista.

