---
title: 'Repaso de 2019 y propósitos para 2020'
subtitle: '🎶 Ay quién maneja mi barca, quién 🎶'
footer: Publicado el 2020-02-01, modificado el 2020-02-01.
  [¿Comentarios, sugerencias?](mailto:alexfernandeznpm@gmail.com)
---

![Empezamos un nuevo año.](pics/repaso-anyo-nuevo.jpg "San Isidro Concert at Retiro Park, fuente: https://commons.wikimedia.org/wiki/File:MADRID_060515_MXALX_096.jpg")

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

![Bienvenidos al maravilloso mundo de los influencers.](pics/repaso-influencers.jpg "Mona et la laitière immortalisent leur voyage chez le cri, fuente: https://commons.wikimedia.org/wiki/File:Selfie_art.jpg")

En unos pocos meses teníamos
[un sistema de integración continua potente](http://pinchito.es/2019/devops-on-the-cheap.html),
y dos nuevas personas que han redondeado un equipo de alto rendimiento, motivado y trabajando a tope.
Hemos relanzado varios componentes críticos de la plataforma,
renovado la web y añadido una sección de pagos completamente nueva.

Todo esto mientras creábamos varias suites de pruebas y
mejorábamos la arquitectura interna:
en el backend hemos eliminado una arquitectura de microservicios algo extraña
que ralentizaba desarrollo, ejecución y despliegues sin ningún beneficio real,
volviendo a un monolito mucho más eficiente.
En el frontend hemos creado una librería de componentes React
que ha simplificado mucho el trabajo.

No está mal para ocho meses, ¿no?
Pero ni siquiera ha sido lo más importante:
la experiencia de liderar un equipo de _millennials_ ha sido muy enriquecedora.

De forma global creo que hemos cumplido (casi) todos los objetivos técnicos y de negocio.
El camino no ha estado exento de problemas:
al parecer no he sabido transmitir al CEO todo el trabajo realizado.
Mi torpeza para la comunicación y la política interna
(seguramente combinada con una situación financiera delicada)
ha terminado motivando mi salida de la empresa.

Termino el año embarcado en algún que otro proceso de selección para puestos en remoto.
¡Estoy más liado que cuando trabajaba!
(Es broma, pero hay días estresantes, la verdad.)

### Comunidad

Este año he dejado la organización de MadridJS y Node.js Madrid.
Había empezado a notar que me daba pereza gestionar los eventos,
y luego a la hora de ir me saltaba la mayoría.
Así que tras cinco años a una media de 20 eventos al año
he decidido dejar la organización en las capaces manos de
[Javi Vélez](https://twitter.com/javiervelezreye) y
[Manu Fosela](https://twitter.com/manufosela).

He seguido en el PMC de Codemotion Madrid,
donde también he dado una
[charlita](https://events.codemotion.com/conferences/madrid/2019/speaker/4421/)
metiéndome con inteligencias artificiales y "roboces".
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

También en Codemotion he dado un
[webinar](https://extra.codemotion.com/webinar-alexfernandez-refactoringarchitecture/)
sobre cómo refactorizar la arquitectura de un sistema en uso,
basado en el trabajo hecho en Influencity.

He presentado cinco propuestas para
[t3chfest](https://t3chfest.es/2020/en):
una en solitario sobre bacterias vistas desde el punto de vista de la tecnología,
y [cuatro dando apoyo](https://twitter.com/pinchito/status/1207344167854247937) a otros tantos grandes ponentes.
Ya hemos avisado que como salga mi propuesta con [Fran Barea](https://twitter.com/MandisBack) ¡va a ser la risa! 😂

Por último he publicado el
[curso de Unix](http://pinchito.es/2019/curso-unix.html)
que sin duda hará las delicias de grandes y pequeños.

### Personal

Este año me he mudado a Viena con mi familia,
aunque yo he seguido viniendo a Madrid una semana al mes.
Mi hija y mi mujer están aprendiendo alemán como unas campeonas,
y hemos podido atravesar los complejos trámites del cambio de residencia para ellas.
La vida en esta maravillosa ciudad es muy tranquila y ordenada.
En general, una experiencia muy interesante.

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

![Este retrato no quedó mal.](pics/repaso-retrato.jpg "Afortunado poseedor de un Fernández")

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

![Más cornás da el hambre.](pics/repaso-desempleo.jpg "Unemployed men queued outside a depression soup kitchen opened in Chicago by Al Capone, fuente: https://commons.wikimedia.org/wiki/File:Unemployed_men_queued_outside_a_depression_soup_kitchen_opened_in_Chicago_by_Al_Capone,_02-1931_-_NARA_-_541927.jpg")

También me gustaría **dar algún curso técnico**.
Se aprende muchísimo dando clase,
y hace tiempo que lo tengo algo abandonado.

### Comunidad

Este año me gustaría **acercarme a
[ViennaJS](https://viennajs.org/)**
para ver qué se cuece por allí.
A finales de curso tenemos previsto volvernos a España.

Quiero **seguir dando charlas ocasionales**.
Como soy muy divo no suelo buscar CfPs activamente sino que espero a que me inviten.
No pido mucho realmente, basta con un tweet o un mail convocándome.
Y por supuesto me interesa **seguir colaborando con cualquier organización que me necesite**,
empezando por Codemotion (si me quieren).

Estoy muy interesado en **subir el nivel de las charlas que dé**,
tras el relativo jarro de agua fría de Codemotion.
Para empezar intentaré potenciar el aspecto técnico,
y al mismo tiempo que sean más amenas.
¡Todo un reto!

También pretendo **colaborar con charlas de otra gente**
y aprovechar para aprender de ellos.
Básicamente estoy dispuesto a buscar ayuda donde la encuentre.

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

Por último tengo pendiente **publicar el curso de dibujo en remoto** de mi profesor Arturo,
basado en los ejercicios que me envía.
Creo que puede ayudar a mucha gente igual que me ha servido a mí.

## Conclusiones

Como véis tengo doce propósitos para este año.
He intentado que sean objetivos concretos y contrastables,
aunque soy consciente de que no siempre lo he conseguido.
¿Cuántos cumpliré?
¿Cuántos quedarán en agua de borrajas?
¡El año que viene tendremos la respuesta!

### Agradecimientos

Quiero dar las gracias a
[David Bonilla](https://bonillaware.com/objetivos-para-2020)
por animarme a escribir este artículo con su última Bonilista.

