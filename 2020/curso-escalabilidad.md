---
title: 'Curso de escalabilidad'
subtitle: 'Para SREs y desarrolladores, usando Node.js'
footer: Publicado el 2020-05-19, modificado el 2020-05-19.
  [¿Comentarios, sugerencias?](mailto:alexfernandeznpm@gmail.com)
---

![[Fuente: Wikipedia](https://commons.wikimedia.org/wiki/File:Sea-Dragon.jpg).](pics/escalabilidad-sea-dragon.jpg "Concepto de cohete Sea Dragon, con despegue acuático.")

# Curso online de escalabilidad

En este curso 100% remoto veremos principios y prácticas de escalabilidad de sitios web.
Estudiaremos cómo trabajan los gigantes de Internet (Google, Facebook),
y cómo adaptar sus prácticas a entornos de startup.
El curso está orientado a desarrolladores que quieran producir código escalable,
y a SREs (_site reliability engineers_) que gestionen entornos de producción.

Seguiremos una orientación práctica:
cada exposición irá acompañada de ejercicios para los alumnos,
que se corregirán en grupos de trabajo supervisados.

Imparte el curso Alejandro Fernández,
ingeniero de software con [20+ años de experiencia](/cv).
Alejandro ha sido líder de desarrollo backend en mediasmart,
donde acompañó a la empresa desde sus inicios
hasta facturar 10 millones de euros anuales.
También ha trabajado como ingeniero de software en Devo,
una de las startups tecnológicas fundadas en España con más proyección internacional.
Es el autor principal del paquete [`loadtest`](https://www.npmjs.com/package/loadtest) para Node.js,
uno de los más usados para pruebas de carga a nivel mundial.
Su código procesa de forma rutinaria millones de peticiones por segundo.

## Duración y horario

El curso se impartirá en cuatro bloques de cuatro horas,
para un total de 16 horas.
El horario será en viernes de 15h a 19h,
y en sábado de 9h a 13h.
Las fechas previstas son:
12 y 13 de junio,
19 y 20 de junio.

## Temario

Día 1: Introduccion y pruebas de carga

* Introducción: qué es escalabilidad.
* Uso de herramientas. `loadtest`, `ab`, `wrk`.
* Presupuesto de milisegundos. Leyes de Pareto y Amdahl aplicadas al rendimiento.
* Variabilidad y percentiles.

Día 2: Uso de métricas

* Métricas principales: peticiones, eventos, SLxs.
* Objetivo de _uptime_. Presupuesto de incidencias.
* Sistemas distribuidos. Características operacionales.
* Incógnitas incógnitas (_unknown unknowns_).

Día 3: Monitorización y observabilidad.

* Monitorización.
* Alertas en producción.
* Observabilidad.
* Guardias. Automatización.

Día 4: Investigación de incidencias.

* Investigación de causa raíz. Los cinco porqués.
* Postmortems sin culpa.
* Tareas post-incidente. Características operacionales.
* Actitudes y expectativas. Liderazgo.

## Requisitos y herramientas

Se presupone un conocimiento somero de JavaScript,
aunque no es imprescindible.

Se usarán como herramientas principales:
Node.js, AWS (Amazon Web Services), Trello, Google Docs.
Se espera que los alumnos tengan Node.js (v12 o mejor) instalado en sus máquinas,
y que tengan cuentas creadas en AWS, Trello y Google Docs.

## Precio

El precio será de €100.
Se cubre la asistencia en remoto (por Zoom o similar),
la corrección de ejercicios y un consultorio de dudas durante dos meses.
El número máximo de asistentes será de 30.

Un curso similar presencial puede costar miles de euros.
Se puede ofrecer este precio gracias a que se organiza directamente por el formador
y a la asistencia remota.

Se entrega diploma de asistencia.

# Agradecimientos

Muchas gracias a Carlos Ble por la idea de hacer el curso.
Gracias a [Koliseo](https://www.koliseo.com/) por poner su plataforma a disposición del curso.

