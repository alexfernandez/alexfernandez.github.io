---
title: 'Bacterias: máquinas que dominan el universo'
subtitle: 'Artículo sobre la charla para T3chfest 2020'
footer: Publicado el 2020-01-16, modificado el 2020-01-16.
  [¿Comentarios, sugerencias?](mailto:alexfernandeznpm@gmail.com)
---

![Latitude Leaking Longitude.](pics/bacterias-agar-art-contest.jpg "Latitude Leaking Longitude, source: https://www.nationalgeographic.com/science/2019/11/agar-art-contest-winners-create-gorgeous-art-from-live-bacteria/")

Desde las profundidades del océano hasta el límite del espacio, desde el hielo de la Antártida hasta nuestros cerebros: donde quiera que miramos encontramos bacterias. La vida en nuestro planeta sería imposible sin ellas, y sin embargo a veces nos ponen difícil sobrevivir. ¿Os suena un discurso apropiado para una conferencia de tecnología? ¿Y si os digo que en realidad son microfactorías de microrrobots controlados por programas que se autogeneran?

A día de hoy las bacterias nos siguen dando sorpresas, quizás más que nunca. En esta charla veremos el campo desde el punto de vista tecnológico: de cuánta información disponen y cómo la transmiten entre sí. Por el camino repasaremos la relación de las bacterias con el resto de la vida, en particular con la humanidad. También veremos multitud de hallazgos curiosos que se desconocían hace sólo un par de décadas, incluyendo algunos que están esperando confirmación para dar premios Nobel a sus descubridores. Para terminar veremos los controvertidos hallazgos fuera de la Tierra, y su posible origen estelar.

## Introducción

### Historia

Agar descubierto por [Angelina Hesse](http://jornades.uab.cat/workshopmrama/sites/jornades.uab.cat.workshopmrama/files/Hesse.pdf).

Las bacterias son una fuente inagotable de sorpresas.
Incluso su clasificación en el árbol de la vida ha cambiado radicalmente en los últimos tiempos.

En 1974
[Woese y Fox](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC432104/)
propusieron separar a las "arqueobacterias" en su propio árbol
independiente del resto de bacterias.
Actualmente se conocen como ["arqueas"](https://biodifferences.com/difference-between-archaea-and-bacteria.html)
ya que son muy diferentes en metabolismo y genética a las bacterias.

Seguramente en el siglo XXI no quede mucho por descubrir sobre arqueas y bacterias,
¿verdad?

[cerebro](https://www.abstractsonline.com/pp8/#!/4649/presentation/32057)
[leche materna](https://sfamjournals.onlinelibrary.wiley.com/doi/full/10.1111/j.1472-765X.2009.02567.x)

En enero de 2020 se ha publicado un artículo en Nature con el
[descubrimiento de la arquea que pudo dar lugar a las eucariotas](https://www.nature.com/articles/s41586-019-1916-6).

### Parámetros físicos

a mayoría de las bacterías están
[alrededor de la micra (1 µm)](https://www.microscopemaster.com/bacteria-size-shape-arrangement.html),
aunque algunas nanobacterias como _Mycoplasma genitalium_ pasan por un filtro de 100 nm.
Por otra parte hay [gigantes como _Thiomargarita namibiensis_](https://www.sciencespacerobots.com/thiomargarita-namibiensis-61420191)
que son visibles a simple vista (0.75 mm).

A pesar de ser tan pequeñas,
al haber 10^30 representan una parte sustancial de la
[biomasa terrestre](https://www.pnas.org/content/115/25/6506).

![Biomasa por grupo.](pics/bacterias-by-weight.jpg "Plantas: 450 gigatones de carbono, bacterias: 70 GT C, arqueas: 7 Gt C, animales: 4 GT C. Fuente: https://www.pnas.org/content/115/25/6506.")

No sabemos exactamente el número de especies de bacterias.
Algunas estimaciones llegan hasta
[el trillón de especies](https://www.pnas.org/content/113/21/5970),
aunque estimaciones más realistas dan
[entre 2 y 4 millones](https://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.3000106)
entre bacterias y arqueas.

## ¿Máquinas?

### Tamaño de ROM

Los virus tienen un genoma que oscila entre
[1700 y 2.8 millones de pares de bases](http://book.bionumbers.org/how-big-are-genomes/).
La unidad usada se corresponde con un nucleótido,
pareado siempre con otro en el genoma;
de ahí que se midan pares de bases.
El rango más habitual es
[entre 4 kbp y 20 kbp](https://www.frontiersin.org/articles/10.3389/fevo.2015.00143/full).

Las bacterias están  en un rango más estrecho;
quitando anomalías como micoplasmas,
sus genomas tienen
[entre 1 y 10 Mbp](https://metode.org/issues/monographs/the-size-of-the-genome-and-the-complexity-of-living-beings.html).

Las eucariotas unicelulares ocupan el siguiente escalón:
[alrededor de 10 Mbp](https://www.researchgate.net/publication/49759737_Chromosome_Size_in_Diploid_Eukaryotic_Species_Centers_on_the_Average_Length_with_a_Conserved_Boundary).
Invertebrados, plantas y mamíferos están
entre 100 Mbp y 10 Gbp.

### Memoria

Las bacterias tienen,
igual que las eucariotas,
[memoria epigenética](https://mmbr.asm.org/content/70/3/830):
ciertas condiciones del entorno (encontradas localmente o incluso heredadas)
pueden hacer que se expresen ciertos genes y se supriman otros.

Existen mecanismos como los priones
que permiten compartir estos cambios entre una población entera de bacterias.

### Refactorización

[reducción de genoma](https://en.wikipedia.org/wiki/Bacterial_genome#Genomic_reduction).

### Ejecutables

https://en.wikipedia.org/wiki/Bacterial_genome#Horizontal_gene_transfer

### Herramientas

Este vídeo muestra cómo funciona un pelo de bacteria:
extensión y retractación rápidas que le permiten moverse.

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/HGvnrWrudpA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

La generación de energía se realiza en la ATP sintasa,
que funciona con una eficiencia
[cercana al 100%](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1692765/pdf/10836501.pdf):

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/XI8m6o0gXDY?start=52" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Las kinesinas son unas maquinitas moleculares que sacan los desperdicios de la célula usando ATP como combustible.
Caminan por los microtúbulos,
una especie de autopistas celulares exclusivas de las eucariotas,
aunque en 2011 se descubrió [el equivalente bacteriano](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3232192/).

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/wJyUtbn0O5Y?start=60" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

En modelos más sencillos,
como el virus del SIDA,
Janet Iwasa ha realizado una
[animación más completa](http://scienceofhiv.org/wp/?page_id=20)
de cómo funcionan:

<div style="padding:56.25% 0 0 0;position:relative;"><iframe src="https://player.vimeo.com/video/260291607?title=0&byline=0&portrait=0" style="position:absolute;top:0;left:0;width:100%;height:100%;" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe></div><script src="https://player.vimeo.com/api/player.js"></script>
<p><a href="https://vimeo.com/260291607">HIV Life Cycle - narrated</a> from <a href="https://vimeo.com/jiwasa">Janet</a> on <a href="https://vimeo.com">Vimeo</a>.</p>

## El largo camino a la simbiosis

Está comúnmente aceptado que las bacterias producen multitud de enfermedades en plantas,
animales y humanos.

### Mutación rápida

Este vídeo muestra cómo evolucionan las bacterias en pocas horas
para conseguir inmunidad ante un antibiótico.

<iframe width="560" height="315" src="https://www.youtube.com/embed/plVk4NVIUh8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Control bacteriano

Seguro que has visto jabones anunciados que
[matan el 99.9% de las bacterias](https://www.vix.com/es/imj/salud/147382/los-jabones-antibacteriales-combaten-realmente-el-999-de-las-bacterias).
Suena bien, ¿no?
El único problema es la replicación exponencial.

El [tiempo de replicación de las bacterias típicas en el laboratorio](http://textbookofbacteriology.net/growth_3.html)
puede oscilar entre unos 20 minutos para _Escherichia coli_ y 15 horas para _Mycobacterium tuberculosis_.
Eso quiere decir que tras una hora el número de _E. coli_ se multiplica por 8.
Tras eliminar el 99.9% de las bacterias,
¿cuánto tiempo tardamos en volver a tener las mismas bacterias que al principio?
Fácil: 200 minutos, o sea unas tres horas.

En la naturaleza se observan
[tiempo de replicación mayores](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6015860/),
alrededor de una hora para _E. coli_.
Con este tiempo más conservador las manos nos durarán más tiempo limpias:
para ser exactos, 10 horas.

Seguir añadiendo nueves no nos protege demasiado más.
Incluso un jabón que elimine
[el 99.999% de las bacterias](http://www2.debgroup.com/sites/default/files/pdfs/Por-que-es-importante-el-99.999%25.pdf)
nos dejará las manos exactamente igual tras 16 horitas.
Así que es mejor confiar en que los jabones tendrán algún tipo de efecto que retarde el crecimiento.

### Enfermedades múltiples

Al parecer sufrir infecciones en el últero aumenta al doble el riesgo de
[autismo y esquizofrenia y depresión](https://jamanetwork.com/journals/jamapsychiatry/article-abstract/2727135).

### Nuestras defensas

### Nuevas técnicas

Este vídeo muestra cómo funciona la técnica CRISPR de edición de genes.

<div style="padding:56.25% 0 0 0;position:relative;"><iframe src="https://player.vimeo.com/video/106957770" style="position:absolute;top:0;left:0;width:100%;height:100%;" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe></div><script src="https://player.vimeo.com/api/player.js"></script>
<p><a href="https://vimeo.com/106957770">Introduction to Genome Editing Using CRISPR/Cas9</a> from <a href="https://vimeo.com/igisci">Innovative Genomics Institute</a> on <a href="https://vimeo.com">Vimeo</a>.</p>

## Enfermedades autoinmunes

Este grupo de enfermedades incluyen dolencias tan dispares
como diabetes tipo I, enfermedad de Crohn, esclerosis múltiple o vitíligo.

### Enfermedad de Crohn

El número de casos crece de forma alarmante en todo el mundo.
Algunos ejemplos:
[Canadá](https://www.sciencedirect.com/science/article/pii/S0016508519300216),
[España](https://www.elsevier.es/en-revista-gastroenterologia-hepatologia-14-articulo-incidence-phenotype-at-diagnosis-inflammatory-S0210570515000679)
o
[Taiwan](https://www.researchgate.net/publication/259244930_A_nationwide_population-based_study_of_the_inflammatory_bowel_diseases_between_1998_and_2008_in_Taiwan).
Los [datos históricos desde 1930](https://www.researchgate.net/publication/8044431_Helminths_and_the_modulation_of_mucosal_inflammation)
siguen la misma tendencia.
La incidencia se acerca peligrosamente al 1% de la población en ciertas regiones como
[Canadá o Australia](https://www.researchgate.net/publication/320437880_Worldwide_incidence_and_prevalence_of_inflammatory_bowel_disease_in_the_21st_century_A_systematic_review_of_population-based_studies).
Además, parece que los aumentos están asociados a la
[industrialización y urbanización](https://www.gastrojournal.org/article/S0016-5085(11)01378-3/pdf)
de las sociedades.

![Casos en España, 1976 a 2010.](pics/bacterias-crohns-incidence-spain.jpg "De un caso de Crohn en los 1980 a 10 en 2010. Fuente: https://www.elsevier.es/en-revista-gastroenterologia-hepatologia-14-articulo-incidence-phenotype-at-diagnosis-inflammatory-S0210570515000679.")

¿Cuál es la causa de esta plaga moderna?


### Úlceras y bacterias

### Otras enfermedades autoinmunes

## Panspermia: ¿venimos de las estrellas?

https://en.wikipedia.org/wiki/Plasmid



http://nautil.us/issue/77/underworldsnbsp/never-underestimate-the-intelligence-of-trees

image.png


http://book.bionumbers.org/how-big-are-genomes/

https://www.youtube.com/watch?v=plVk4NVIUh8

Bacteria attacks: fast mutation - plasmids

Human attacks: random generation -> rapid mutation in the immune system

Science attacks: double blind studies

https://ideas.ted.com/watch-a-cellular-biologist-animates-the-life-cycle-of-hiv-in-this-hypnotic-video/

https://www.youtube.com/watch?v=wJyUtbn0O5Y

https://en.wikipedia.org/wiki/Human_milk_microbiome


## Conclusiones

Las bacterias siguen siendo,
siglos después de su descubrimiento,
fuentes inagotables de asombro.

### Agradecimientos

Gracias a la organización de 

