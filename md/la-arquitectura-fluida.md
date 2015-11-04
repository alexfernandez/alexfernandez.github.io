---
title: La arquitectura fluida
subtitle: O de cómo migrar sin penas
footer: Publicado originalmente en TodoJS el 2015-.
---

![Picture credit: [Salvador Dalí](http://www.wikiart.org/en/salvador-dali/the-persistence-of-memory-1931)](pics/la-persistencia-de-la-memoria.jpg "La persistencia de la memoria")

## Tras la arquitectura perfecta

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

## Requisitos cambiantes

Un sistema de software tiene que poder evolucionar durante su vida útil.

### Modas en arquitectura

En los años 80, la moda en las empresas era tener una
[minicomputadora](http://www.computerhistory.org/revolution/minicomputers/11/366/1946)
(del tamaño de un armario pequeño) y múltiples terminales conectados.

En los 90 se popularizaron las arquitecturas cliente-servidor.

A principios del siglo XXI llegaron las arquitecturas de tres capas:
capa web, backend y base de datos.

En los años 10 las bases de datos NoSQL han adquirido protagonismo.

## Requisitos operacionales

Las circunstancias en las que nuestro sistema tiene que trabajar cambian,
para bien o para mal.
Un producto exitoso a menudo dobla el número de usuarios en un año,
o incluso en una mes: en 2013 [Uber](http://techcrunch.com/2013/12/18/uber-lyft/)
crecía al 400% por año, mientras que su competidora Lyft lo hacía a un ritmo todavía más
vertiginoso que suponía multiplicar su facturación por 20 en un año.

### Caso práctico: MediaSmart Mobile

### Planificación de capacidad

En inglés: _capacity planning_.

### Costes bajos

### Velocidad de migración

### Migraciones de base de datos

## La arquitectura fluida

¿Cuál es la solución?
Nuestra humilde sugerencia es
mantener la arquitectura del sistema fluida, sin tomar decisiones que comprometan su integridad.
Al oir esto, un arquitecto de los de verdad, de los que juntan piedras,
seguramente tendría problemas para contener la risa.
¿Cómo se pueden cambiar las vigas maestras de un edificio?

Los ingenieros de software tenemos una gran ventaja:
no trabajamos con el mundo real, sino con software,
que es infinitamente moldeable.

Si encontramos restricciones en esta moldeabilidad,
es porque alguien no ha hecho bien su trabajo.

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

## Estrategias de migración

Intentaremos ilustrar cada estrategia con un caso práctico,
aunque curiosamente no es fácil encontrar publicados.

### ¿Quieres decir "patrones"?

### Catálogo de estrategias de servidor

#### Parar y arrancar

MediaSmart VPC

#### Versión de sólo lectura

#### Sincronización

MediaSmart daystats

#### Copia doble

MediaSmart perfiles

### Catálogo de estrategias en cliente

#### Decorador

#### Consulta doble

#### Escritura doble

#### Paso temporizado (timed rollover)

MediaSmart stats aggregates

#### Conversión _in situ_

### Catálogo de estrategias en broker

#### Acceso mediante proxy

Instagram

#### Escritura encolada

### Seguir el flujo

### Migración de cualquier tipo

### El equilibrio inestable

