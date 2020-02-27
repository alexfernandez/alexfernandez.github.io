---
title: 'Bacterias (parte 6): Conclusiones'
subtitle: 'Complemento a la charla para T3chFest 2020'
footer: Publicado el 2020-01-16, modificado el 2020-01-16.
  [¿Comentarios, sugerencias?](mailto:alexfernandeznpm@gmail.com)
---

![Un ejemplar de _Vibrio cholerae_, la bacteria que causa el cólera, al microscopio electrónico. Dibujo del autor, basado en [esta imagen](https://pixnio.com/science/microscopy-images/vibrio-related-diseases/vibrio-cholerae-bacteria-under-electron-micrograph).](/2020/pics/bacterias-vibrio-cholerae-dibujo.jpg "La bacteria, alargada y de una micra de ancho, aparece en un fondo gris con agujeritos, reminiscente de un vaso sanguíneo.")

Este viaje nos ha llevado desde el telar de Leeuwenhoek
a un clúster estelar a miles de años luz de distancia.
Por el camino hemos recorrido
las salinas de Santa Pola,
las profundidades abisales,
las nubes y el espacio cercano,
para pasar por los planetas del sistema solar.
Hemos visto evolucionar seres vivos en directo,
hemos investigado el origen de enfermedades misteriosas
y nos hemos adentrado en las profunidades de nuestra galaxia
buscando nuestro origen.

Vamos ahora a extraer unas cuantas lecciones de todo este conocimiento.

# Bacterias y código

Las bacterias funcionan con un código genético.
Hay [bastante software para analizar este código](),
pero ¿cuántos de estos programas están hechos por gente que programe profesionalmente?
Estoy seguro de que podríamos aportar nuestro punto de vista a refactorizaciones,
duplicaciones, borrados y modificaciones espontáneas.

# Simbiosis

Una idea clave que espero haber sabido transmitir es que las bacterias
no son nuestras enemigas, más bien al contrario:
medran mejor cuando nos ayudan.
Bacterias y arqueas son ubicuas en el planeta:
miremos donde miremos siempre están ahí.
Eso sí, son expertas en sobrevivir en cualquier medio.
Si las atiborramos a antibióticos es probable que se adapten,
como de hecho está pasando.

Bacterias y arqueas sobrevivirán con más probabilidad si ayudan al anfitrión.
Hay diferentes formas de hacerlo:
ayudar a digerir la comida,
eliminar toxinas del medio,
o proporcionando otras funciones de las que carezca.

Un ejemplo que ya hemos visto de pasada es el de
[las bacterias en el intestino de los mamíferos](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3152488/).
Se sabe desde hace tiempo
la influencia beneficiosa del microbioma intestinal
(como se conoce al conjunto de microorganismos del intestino)
en [la salud humana](https://www.frontiersin.org/articles/10.3389/fimmu.2018.02667/full).
Pero a veces estas bacterias
[se vuelven patógenas](https://www.uv.es/biodiver/pdfs/PerezBrocal2013-2.pdf),
sin que sepamos muy bien por qué.
Tampoco sabemos por qué funciona el
[trasplante de heces]()
en el tratamiento de múltiples patologías;
incluso parece que ayuda al
[rendimiento deportivo]().

El sistema inmune tiene una [complejidad pasmosa](https://www.mc.vanderbilt.edu/vanderbiltmedicine/cracking-the-code-of-the-immune-system/):
hay miles de millones de combinaciones posibles en cada glóbulo blanco.
Y los desarrolladores sabemos bien que los sistemas complejos
tienden a [fallar de formas misteriosas](https://web.mit.edu/2.75/resources/random/How%20Complex%20Systems%20Fail.pdf).

Mi impresión es que estas infecciones de bacterias normalmente beneficiosas
se deben a una combinación de fallos:
errores de replicación en el ADN bacteriano
y errores en el sistema inmune del anfitrión,
que permiten que las huéspedes crezcan sin control.
Desde este punto de vista,
creo también que el campo de la
[ingeniería de la resiliencia](https://dl.acm.org/doi/pdf/10.1145/2367376.2371297)
podría ser muy útil para estudiar las infecciones.

La clave, creo yo,
está en entender correctamente la idea de "evolución rápida".
No se trata de un avance imparable hacia un estado ideal,
o una mejora constante en una carrera de armas muy desigual.
"Evolución rápida" significa "adaptación rápida al medio".
¡Ni más ni menos!
Las bacterias se adaptan a lo que se encuentran a gran velocidad.
Su finalidad no es realmente acabar con nosotros,
sino medrar en el medio donde se encuentren.
Si usamos antibióticos se adaptarán a ellos,
y entonces puede que tengamos un problema.
Pero ellas sólo hacen lo único que saben hacer:
intentar sobrevivir.

# Evolución

Otra idea clave es que la evolución no ocurre como pensamos muchas veces:
no es un proceso dirigido hacia una meta.
En el caso de las bacterias por ejemplo,
no tienden al exterminio la raza humana.
Tener muchas bacterias en un sitio evolucionando
no las convierte en súper-bacterias resistentes a todo;
sólo significa que se van a adaptar a ese medio cada vez mejor.
Al sacarlas de ese medio es probable que haya otras que compitan mejor por el alimento.

# Enfermedades autoinmunes

Mi impresión es que en el siglo XX se acabaron las enfermedades "fáciles":
las que tienen una relación sencilla entre infección y dolencia.
Las que quedan ahora son las difíciles:
relaciones oblicuas entre patógenos y síntomas,
bacterias difíciles de localizar,
efectos secundarios de la inflamación,
y un largo etcétera.

Hace tiempo que se han identificado
[infecciones como causa de múltiples cánceres]().
Estoy seguro de que si volvemos a hacer investigación básica
encontraremos la raíz infecciosa de las enfermedades autoinmunes,
y de otras muchas que ni siquiera sospechamos ahora que puedan estar causadas por bacterias.

# Para aprender más

En ["Qué te importa a ti lo que piensen los demás"](https://en.wikipedia.org/wiki/What_Do_You_Care_What_Other_People_Think%3F),
el famoso físico Richard Feynman cuenta cómo los médicos tardaron muchos meses en diagnosticar
la tuberculosis de su mujer, Arlene,
pese a que era la primera opción de manual para el ganglio inflamado que presentaba.

Hoy día tenemos a nuestra disposición muchísima más información que nunca,
y a veces los médicos nos piden que no busquemos lo que nos pasa.
No puedo estar más en desacuerdo.
Gracias a mi avanzada edad me permito darte un consejo:
aprende tanto como puedas sobre las enfermedades que te afecten a ti o a tu familia.
Estarás al tanto de los últimos tratamientos,
podrás entender por qué se aplican,
y es posible que consigas nuevas perspectivas sobre por qué funcionan o no.
Esto no quiere decir que te automediques o que te autotrates;
siempre debes buscar buena atención médica.
Pero entender lo que están haciendo te servirá para distinguir a los buenos médicos de los malos.

# Reconclusión

Las bacterias siguen siendo,
siglos después de su descubrimiento,
fuentes inagotables de asombro.
Son una parte importantísima de la vida terrestre,
y está en nuestro interés conocerlas bien.

Hay muchas más cosas que aprender.
No he tocado en la formación de biofilms que está ahora tan de moda;
ni las mil complejidades de la relación entre flora intestinal y salud.
Espero que esta serie de artículos te haya servido como introducción
y que te animes a seguir los enlaces para profundizar,
y luego que investigues por tu cuenta:
te aseguro que el estudio te recompensará el esfuerzo diez veces.
¡Gracias por tu interés! 😘

# Agradecimientos

Gracias a la organización de T3chFest por darme la oportunidad de hablar en público
sobre este tema tan apasionante.

Gracias a
[Carlos J. Santisteban](https://twitter.com/zuiko21)
por su inestimable ayuda buscando tamaños de ROM de ordenadores ignotos.
También por encontrar el vídeo de "¡Y las bacterias, bonita!".

Gracias a Cristina Pacios, genetista profesional e investigadora excepcional,
por revisar mi torpe artículo y darme algunas valiosas referencias.
Gracias a Azahara Fernández, doctora en inmunología,
por revisar también y por compartir sus amplios conocimientos.

Los errores que permanezcan en el texto son todo míos.

# Fin

Este artículo es la sexta y última parte de la
[serie sobre bacterias](bacterias-maquinas).
¡Gracias por llegar hasta aquí! 😅🦠😘

* ← Parte 1: [Y las bacterias, bonita](bacterias-bonita).
* ← Parte 2: [Tecnología bacteriana](bacterias-tecnologia).
* ← Parte 3: [El largo camino a la simbiosis](bacterias-simbiosis).
* ← Parte 4: [Enfermedades autoinmunes](bacterias-autoinmunes).
* ← Parte 5: [¿Venimos de las estrellas?](bacterias-estrellas)
* ↑ Parte 6: Conclusiones.

