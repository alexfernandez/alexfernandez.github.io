---
title: 'Bacterias: máquinas que dominan el universo'
subtitle: 'Artículo de soporte para la charla para T3chfest 2020'
footer: Publicado el 2020-01-16, modificado el 2020-01-16.
  [¿Comentarios, sugerencias?](mailto:alexfernandeznpm@gmail.com)
---

!["Latitudes Leaking Longitudes", obra de Tarah Rhoda para el concurso "Agar Art" de la Sociedad Estadounidense de Microbiología.](pics/bacterias-agar-art-contest.jpg "Placas de agar multicolor dispuestas en forma de globo terráqueo. Fuente: https://www.nationalgeographic.com/science/2019/11/agar-art-contest-winners-create-gorgeous-art-from-live-bacteria/.")

Desde las profundidades del océano hasta el límite del espacio, desde el hielo de la Antártida hasta nuestros cerebros: donde quiera que miramos encontramos bacterias. La vida en nuestro planeta sería imposible sin ellas, y sin embargo a veces nos ponen difícil sobrevivir. ¿Os suena un discurso apropiado para una conferencia de tecnología? ¿Y si os digo que en realidad son microfactorías de microrrobots controlados por programas que se autogeneran?

A día de hoy las bacterias nos siguen dando sorpresas, quizás más que nunca. En esta charla veremos el campo desde el punto de vista tecnológico: de cuánta información disponen y cómo la transmiten entre sí. Por el camino repasaremos la relación de las bacterias con el resto de la vida, en particular con la humanidad. También veremos multitud de hallazgos curiosos que se desconocían hace sólo un par de décadas, incluyendo algunos que están esperando confirmación para dar premios Nobel a sus descubridores. Para terminar veremos los controvertidos hallazgos fuera de la Tierra, y su posible origen estelar.

## Introducción

<iframe width="560" height="315" src="https://www.youtube.com/embed/PbFhIQYsVkw?start=337" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Historia

Corría el año 1770.
[Antonie van Leeuwenhoek](https://www.researchgate.net/publication/316286376_Small_bugs_big_data_clinical_microbiology_in_a_digitising_world_Inaugural_lecture_2017),
un comerciante de telas holandés adinerado y sin hijos,
decidió enfocar su primitivo microscopio sobre el mundo a su alrededor.
Descubrió un mundo fantástico desconocido hasta entonces,
y nos dejó cientos de maravillosos dibujos.
Alrededor de 1776 encontró gran cantidad de pequeños animales
("animálculos") flotando en agua estancada.
Fue el primero en ver lo que ahora llamamos "bacterias".

![Bacterias dibujadas por Leeuwenhoek en un experimento bastante guarro. "No me limpié los dientes durante tres días y después tomé una muestra del material que se había alojado en pequeñas cantidades en las encías sobre mis incisivos… Encontré algunos animálculos vivos."](pics/bacterias-leeuwenhoek-oral-bacteria.jpg "Dibujo original de Leeuwenhoek, y sus equivalentes modernos: _Campylobacter rectus_, _Selenomonas sputigena_, _Treponema denticola_, _Leptotrichia buccalis_. Fuente: https://europepmc.org/article/PMC/2168648.")

Agar descubierto por [Angelina Hesse](http://jornades.uab.cat/workshopmrama/sites/jornades.uab.cat.workshopmrama/files/Hesse.pdf).

Las bacterias son una fuente inagotable de sorpresas.
Incluso su clasificación en el árbol de la vida ha cambiado radicalmente en los últimos tiempos.

En 1974
[Woese y Fox](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC432104/)
propusieron separar a las "arqueobacterias" en su propio árbol
independiente del resto de bacterias.
Actualmente se conocen como ["arqueas"](https://biodifferences.com/difference-between-archaea-and-bacteria.html)
ya que son muy diferentes en metabolismo y genética a las bacterias.

Técnicamente en este artículo vamos a hablar de "procariotas",
que incluye a bacterias y arqueas.

En enero de 2020 se ha publicado un artículo en Nature con el
[descubrimiento de la arquea que pudo dar lugar a las eucariotas](https://www.nature.com/articles/s41586-019-1916-6).

### Parámetros físicos

La mayoría de las bacterías están
[alrededor de la micra (1 µm)](https://www.microscopemaster.com/bacteria-size-shape-arrangement.html),
aunque algunas nanobacterias como _Mycoplasma genitalium_ pasan por un filtro de 100 nm.
Por otra parte hay [gigantes como _Thiomargarita namibiensis_](https://www.sciencespacerobots.com/thiomargarita-namibiensis-61420191)
que son visibles a simple vista (0.75 mm).
Las arqueas tienen
[un tamaño similar](https://www.landcareresearch.co.nz/science/soils-and-landscapes/antarctic-soils/microbial-life/bacteria-and-archaea).

A pesar de ser tan pequeñas,
las 10<sup>30</sup> procariotas representan una parte sustancial de la
[biomasa terrestre](https://www.pnas.org/content/115/25/6506):
un 14% aproximadamente.

![Biomasa por grupo. Los humanos somos un 0.01% del total; las bacterias nos superan más de mil veces.](pics/bacterias-by-weight.jpg "Plantas: 450 gigatones de carbono, bacterias: 70 GT C, hongos: 12 GT C, arqueas: 7 Gt C, protistas: 4 GT C, animales: 2 GT C. Humanos: 0.06 GT C. Fuente: https://www.pnas.org/content/115/25/6506.")

No sabemos exactamente el número de especies de bacterias.
Algunas estimaciones llegan hasta
[el trillón de especies](https://www.pnas.org/content/113/21/5970),
aunque estimaciones más realistas dan
[entre 2 y 4 millones](https://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.3000106)
entre bacterias y arqueas.

### Relevancia

Seguramente en el siglo XXI no quede mucho por descubrir sobre arqueas y bacterias,
¿verdad?

[cerebro](https://www.abstractsonline.com/pp8/#!/4649/presentation/32057)

El curso de preparación al parto de mi hija Lucía nos lo dio la pediatra Matilde Alonso.
Me llamó la atención su enfoque científico y numérico a todos los problemas.
Nos contó a los futuros padres que recientemente se habían descubierto
[bacterias en la leche materna](https://sfamjournals.onlinelibrary.wiley.com/doi/full/10.1111/j.1472-765X.2009.02567.x).
¿Significa eso que el pecho femenino,
un área tradicionalmente considerada estéril,
contiene bacterias; o están en la piel de la madre?
Todo indica que las glándulas mamarias están colonizadas por todo tipo de probióticos.
El efecto beneficioso está [más que demostrado]().

https://en.wikipedia.org/wiki/Human_milk_microbiome

¿Por qué aparecen la lluvia y la nieve?
Lo que parecería ser un proceso puramente inorgánico
está [fuertemente regulado por al menos una bacteria](https://www.nature.com/articles/ismej2007113):
_Pseudomonas syringae_.
La [hipótesis de David Sands en 1982](https://www.researchgate.net/publication/284553193_The_association_between_bacteria_and_rain_and_possible_resultant_meteorological_implications)
cogió fuerza cuando se encontró la
[proteína responsable de la nucleación, InaZ](https://www.pnas.org/content/pnas/83/19/7256.full.pdf).
Y de hecho un derivado es lo que se usa hoy día en
[los cañones de nieve artificial](https://www.asm.org/Articles/2019/January/Snow-Is-Coming-Whats-That-Have-to-Do-with-Microbe).
Prácticamente toda la lluvia
[contiene cepas de _P. syringae_](https://www.nature.com/articles/ismej2007113).

Las únicas criaturas capaces de hacer ciertos procesos en nuestro planeta son arqueas.
Ellas son responsables de [todo el metano que se genera](),
así que efectivamente están también en [nuestro intestino]() y el de muchos otros animales.

### Los extremófilos no se tocan

Se han encontrado [extremófilos]()
en los sitios más inverosímiles:
bacterias capaces de alimentarse de
[sal](),
[uranio](https://medium.com/blink-1-82-e-06/uranium-and-the-creatures-who-breathe-it-af8a7413301),
[azufre y calor](https://www.sciencedirect.com/science/article/abs/pii/S0723202083800113?via%3Dihub) generado por fumarolas volcánicas,
o simplemente [pirita](https://www.nbcnews.com/mach/science/strange-life-forms-found-deep-mine-point-vast-underground-galapagos-ncna1050906).
Aguantan temperaturas de
[300 °C](https://www.airspacemag.com/daily-planet/turn-heat-bacterial-spores-can-take-temperatures-hundreds-degrees-180970425/),
salinidades de
[XXX](),
el [vacío del espacio]().

![Max Cady de "El cabo del miedo" (Martin Scorsese, 1991) siempre me ha parecido un extremófilo de cuidado.](pics/bacterias-cape-fear.gif "Mi abuelo hacía sermones con serpientes. Mi abuela bebía estricnina. Se puede decir que juego con ventaja, genéticamente hablando. Fuente: https://www.youtube.com/watch?v=tBSbjKyamRo.")

¿Os parece poco?
¿Qué tal un [lago de asfalto líquido](https://www.researchgate.net/profile/Steven_Hallam/publication/51039674_Microbial_Life_in_a_Liquid_Asphalt_Desert/links/004635383c7b52ac8b000000.pdf)?
Sin aire ni apenas agua,
las colonias de bacterias y arqueas se alimentan de asfalto y generan petróleo y gas natural.

El género _Pyrodictium_
[crece de forma óptima a 105 °C](https://www.sciencedirect.com/science/article/abs/pii/S0723202083800113?via%3Dihub).
Se alimenta de sulfuros y forma pirita.

Se ha sugerido que los extremófilos podrían vivir
[miles de millones de años](https://www.youtube.com/watch?v=rltpH6ck2Kc)
aunque el sol se apagara de repente.

## ¿Máquinas?

Como buenos tecnólogos,
la fascinación por estos pequeños amiguitos sólo puede crecer
si los comparamos con nuestros queridos ordenadores.

### La estructura del ADN

Corría el año 1953.
Varios laboratorios a ambos lados del Atlántico intentaban craquear el código genético.
Rosalind Franklin, cristalógrafa del King's College,
trabajaba en [la estructura del ADN](https://profiles.nlm.nih.gov/spotlight/kr/feature/dna)
por difracción de rayos X.
Watson y Crick por su parte estaban sentando las
[bases matemáticas para analizar la molécula](https://www.theguardian.com/science/2015/jun/23/sexism-in-science-did-watson-and-crick-really-steal-rosalind-franklins-data).
Por caminos oscuros obtuvieron el trabajo de Franklin,
el más avanzado de la época,
y lo usaron para descifrar la doble hélice.

Franklin murió en 1958 de cáncer de ovarios,
posiblemente provocado por
[su trabajo con rayos X](https://blogs.scientificamerican.com/observations/rosalind-franklin-and-dna-how-wronged-was-she/).
Watson, Crick y Wilkins recibieron
[el premio Nobel de medicina en 1962](https://www.nobelprize.org/prizes/medicine/1962/summary/).
Dado que estos premios sólo se conceden a personas vivas
no había posibilidad de reconocer el trabajo de Franklin.

![Descubridores de la estructura del ADN: Watson, Crick, Wilkins y Franklin. No por orden de importancia.](pics/bacterias-watson-crick-wilkins-franklin.jpg "Fotos adjuntas de los cuatro descubridores. Fuente: https://www.researchgate.net/publication/242012620_Ciencia_e_Tecnologia_um_Dialogo_Permanente.")

Esta historia es muy susceptible de interpretarse como la de una mártir feminista heroica,
traicionada por sus colegas sexistas que le robaron el premio Nobel;
de hecho es la idea que yo tenía antes de investigar en más detalle.
Su biógrafa Brenda Maddox
[no está de acuerdo con esta interpretación](https://profiles.nlm.nih.gov/spotlight/kr/feature/biographical),
y cree que debe ponerse más el foco en su brillante carrera científica.
Que cada cual saque sus propias conclusiones.
Yo por mi parte tengo claro que Watson y Crick no habrían descubierto nada sin Franklin,
pero Franklin habría llegado a la doble hélice por sí sola.

### Material genético

El genoma es el conjunto de material genético de un organismo vivo.
Contiene las instrucciones para fabricar todas sus proteínas,
que a su vez serán las encargadas de realizar todas las funciones de cada célula.
El [proceso de transcripción]()
funciona como un ordenador de 6 bits:
cada "palabra" consiste en tres pares de bases que contienen dos bits cada uno,
y se traduce en un aminoácido distinto siguiendo una
[tabla que varía según el tipo de organismo](https://en.wikipedia.org/wiki/Genetic_code#RNA_codon_table).
Este "código ensamblador" traduce los 64 posibles valores a 20 aminoácidos + inicio + fin,
con una sofisticada
[corrección de errores](https://life.ibs.re.kr/papers/PhysLifeRev2010.pdf).

Cada proteína es una secuencia fija de aminoácidos que se pliega consiguiendo estructuras complejísimas,
que veremos más abajo.
El problema del
[plegamiento de proteínas en 3D]()
es computacionalmente muy intensivo:
resulta casi imposible predecir la estructura final sin una simulación detalladísima de las fuerzas de cada aminoácido.

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

https://en.wikipedia.org/wiki/Bacterial_conjugation

https://en.wikipedia.org/wiki/Plasmid

Otra forma interesante de recibir genes externos es a través de virus:
los bacteriófagos funcionan
[como reserva de genes](https://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.0040234)
para sus anfitriones bacterianos.
En las cianobacterias del mar, por ejemplo,
los cianófagos almacenan genes de fotosíntesis
que pueden aportar a sus víctimas en lugar de infectarlas.
Lo mismo ocurre [en tierra firme](https://www.pnas.org/content/pnas/102/52/19009.full.pdf).
Estos virus servirían pues como discos duros externos,
o incluso como almacenamiento en la nube.

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

### Usos industriales

Como hacemos con otras máquinas,
los humanos usamos de forma habitual bacterias en nuestros procesos industriales,
a veces en áreas que pueden sorprender.

Los cañones de nieve artificial usan la proteína 
_Pseudomonas syringae_.


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

Human attacks: random generation -> rapid mutation in the immune system

Science attacks: double blind studies

### Nuevas técnicas

Este vídeo muestra cómo funciona la técnica CRISPR de edición de genes.

<div style="padding:56.25% 0 0 0;position:relative;"><iframe src="https://player.vimeo.com/video/106957770" style="position:absolute;top:0;left:0;width:100%;height:100%;" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe></div><script src="https://player.vimeo.com/api/player.js"></script>
<p><a href="https://vimeo.com/106957770">Introduction to Genome Editing Using CRISPR/Cas9</a> from <a href="https://vimeo.com/igisci">Innovative Genomics Institute</a> on <a href="https://vimeo.com">Vimeo</a>.</p>

## Enfermedades autoinmunes

Este grupo de enfermedades incluyen dolencias tan dispares
como diabetes tipo I, enfermedad de Crohn, esclerosis múltiple o vitíligo.

## Enfermedad de Crohn

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

![Casos en España, 1976 a 2010. Siguendo la tendencia global, se duplican cada década.](pics/bacterias-crohns-incidence-spain.jpg "De un caso de Crohn en los 1980 a 10 en 2010. Fuente: https://www.elsevier.es/en-revista-gastroenterologia-hepatologia-14-articulo-incidence-phenotype-at-diagnosis-inflammatory-S0210570515000679.")

¿Cuál es la causa de esta plaga moderna?
Parece que el aumento de casos está asociado a la
[industrialización y urbanización](https://www.gastrojournal.org/article/S0016-5085(11)01378-3/pdf)
de las sociedades.


### Úlceras y bacterias

### Otras enfermedades autoinmunes

## ¿Venimos de las estrellas?

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/5XyNe8UESTs?start=192" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### ¿Vida en Marte?

La misión Viking llevaba a bordo cinco experimentos para detectar vida en Marte.
Carl Sagan (junto con Joshua Lederberg)
[dijo antes de la misión](https://ntrs.nasa.gov/archive/nasa/casi.ntrs.nasa.gov/19760009917.pdf):

> Tenga éxito o no la misión Viking 1976,
> las siguientes naves que aterricen en Marte deberían llevar un rango más variado de experimentos biológicos,
> capaces de buscar en un espectro más amplio de organismos marcianos concebibles.

![Carl Sagan con una réplica de la sonda Viking Lander.](pics/bacterias-sagan-viking.jpg "Carl Sagan posa con una réplica de la Viking lander, con un fondo que simula Marte. Fuente: https://en.wikipedia.org/wiki/File:Sagan_Viking.jpg.")

El 30 de julio de 1976 llegaron los resultados de los experimentos a bordo.
[Cuatro de los cinco eran positivos](https://blogs.scientificamerican.com/observations/im-convinced-we-found-evidence-of-life-on-mars-in-the-1970s/).
El quinto, diseñado para captar moléculas vivas, falló.
La NASA (y la comunidad científica)
se resignaron a aceptar que se habían detectado mecanismos inorgánicos que simulaban la actividad de seres vivos.

De vuelta en la Tierra se ha demostrado que
[la presencia de perclorato en el suelo marciano](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3691774/)
puede haber provocado el falso negativo.

¿Por qué negar el hallazgo de vida en Marte pues?
¿Acaso los hombrecillos verdes controlan las instituciones terráqueas?
No es necesario buscar conspiraciones:
el principio de prudencia se debe aplicar mientras no haya resultados concluyentes.

Desde entonces se han detectado en Marte agua líquida, metano y compuestos orgánicos complejos.
Además se encuentra CO<sub>2</sub> que no puede explicarse sólo por fuentes inorgánicas.
¿Qué nos falta pues?

¿Es posible que hayamos llevado nosotros esas bacterias?
En la NASA tienen una "oficial de protección planetaria",
Catharine "Cassie" Conley.

![Representación artística de la Planetary Protection Officer, según xkcd.](pics/bacterias-planetary-protection-officer.png "Cómic de una señora molona con espada rodeada de planetas. Fuente: https://what-if.xkcd.com/imgs/a/117/officer.png.")

De vez en cuando
[ocurren accidentes](https://www.space.com/13783-nasa-msl-curiosity-mars-rover-planetary-protection.html).

### ¿Vida en el sistema solar?

Se ha encontrado material genético bacteriano
[en el exterior de la Estación Espacial Internacional](https://downloads.hindawi.com/journals/tswj/2018/7360147.pdf),
correspondientes a bacterias terrestres.

Y ¿qué pasa con esa
[misteriosa fuente de metano en Encélado](https://agupubs.onlinelibrary.wiley.com/doi/full/10.1002/2014GL063013)?
Desde luego parece que merece más estudio,
al menos para descartar que provenga de arqueas
(o sus equivalentes jovianas).

### Panspermia

La primera vez que me encontré con esta idea de que la vida se había originado en otro planeta,
o incluso en otro sistema solar,
me pareció un poco ridícula.
¿Qué se resolvía de esta manera?
Todo lo que se conseguiría es,
en todo caso,
retrasar el problema del origen de la vida a un ámbito todavía más desconocido que la Tierra primigenia.

Pero es que el origen de la vida no es lo único importante.
Si todo nuestro sistema solar está lleno de bacterias
esto nos permitiría contemplar un ecosistema gigante,
con bacterias evolucionando en otros cuerpos celestes
y volviendo a la Tierra como nuevas especies que enriquecen (o alteran) nuestros ecosistemas.
En particular, Fred Hoyle propuso que
[las enfermedades pueden tener su origen extraterrestre](https://www.hoyle.org.uk/resources/virusesfromspacecompressed.pdf),
aunque la especifidad de los ataques contra nuestras células siembra serias dudas.

Abriendo un poco más los ojos,
y ampliando los periodos de tiempo considerados,
podríamos considerar que la vida venga de otras estrellas cercanas.
En este caso podríamos ver nuestro entorno galáctico
como un caldo de cultivo de vida,
con [estrellas que se contaminan unas a otras](https://iopscience.iop.org/article/10.3847/2041-8213/aaef2d)
intercambiando cometas y asteroides.

Hay que tener mucho cuidado con estas ideas.
A veces vienen de científicos reputados como
[Stephen Hawking](https://web.archive.org/web/20110724233755/http://www.statepress.com/archive/node/5745):

> La vida podría extenderse de planeta en planeta o incluso de sistema estelar en sistema estelar,
> llevada por meteoritos.

Pero también hay propuestas de gente más _fringe_ como las del
[Journal of Cosmology](http://journalofcosmology.com/Life100.html)
que es, digamos,
[poco](https://scienceblogs.com/pharyngula/2011/03/06/did-scientists-discover-bacter)
[escrupuloso](https://www.discovermagazine.com/the-sciences/followup-thoughts-on-the-meteorite-fossils-claim).

La intrigante idea de Sharov de que
[la vida se originó hace diez mil millones de años](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1526419/)
y que, por lo tanto, no ha habido tiempo de que evolucionara en la Tierra,
requiere de bastantes más pruebas antes de que pueda aceptarse;
una gráfica con cinco puntos y una regresión no es suficiente.

### ¿El origen del sol?

Dado que los elementos que componen la Tierra se fraguaron
[en estrellas de neutrones]()
y
[en supernovas](),
está claro que venimos de un medio estelar muy rico en historia.
Siempre me ha llamado la atención que no se dedique más atención a estudiar
cuáles son nuestros ancestros estelares.

A 3000 años luz del sol se encuentra el
[clúster abierto M67](https://freestarcharts.com/messier-67).
Contiene unas 200 estrellas con edad y composición
parecidas a nuestro Sol.
Esto lo hace candidato número uno a haber sido la cuna de nuestro sistema solar.
La pregunta es ¿por qué estamos tan lejos?

Contando 4500 millones de años
nos da una velocidad media de
[230 km/h](https://www.wolframalpha.com/input/?i=300+parsec+%2F+4500+million+years+to+km%2Fh),
al alcance de un coche de carreras.
¡Eso no es nada en términos estelares!
Basta con suponer que algo sacó al Sol de su entorno y lo dejó a la deriva,
lo que nos convertiría en huérfanos estelares recorriendo la galaxia sin rumbo definido,
lejos de nuestros hermanos.

No todo el mundo está de acuerdo.
En una simulación la astrofísica Bárbara Pichardo _et al_
[descartaron este clúster como origen del sol](https://iopscience.iop.org/article/10.1088/0004-6256/143/3/73/pdf):
no consiguieron simular la salida del Sol del cluster sin destruir el incipiente sistema solar.
También reconocieron que una mejora en sus modelos podría cambiar la situación.
Pero lo cierto es que no tenemos candidatos mejores.
En un estudio más reciente se descubrió que las estrellas de este cluster
[rotan en unos 26 días](https://iopscience.iop.org/article/10.3847/0004-637X/823/1/16),
casi igual que nuestro Sol,
lo que para muchos volvió a confirmar la paternidad de M67.

Combinando la teoría de la panspermia estelar con este descubrimiento,
podríamos pensar que el origen de la vida debería de buscarse en este cluster.
Incluso que serían buenos candidatos para buscar seres vivos.

![¿Tendremos primos en este pueblo?](pics/bacterias-m67.jpg "Fotografía en infrarrojo cercano del clúster estelar M67. Fuente: https://en.wikipedia.org/wiki/File:Messier_object_067.jpg.")

## Conclusiones

Este viaje nos ha llevado desde el telar de Leeuwenhoek
a un clúster estelar a miles de años luz de distancia.
Por el camino hemos recorrido las profundidades abisales,
las nubes y el espacio cercano,
para pasar por los planetas del sistema solar.
Hemos visto evolucionar seres vivos en directo,
hemos investigado el origen de enfermedades misteriosas
y 

Las bacterias siguen siendo,
siglos después de su descubrimiento,
fuentes inagotables de asombro.

### Agradecimientos

Gracias a la organización de T3chFest.

Gracias a
[Carlos J. Santisteban](https://twitter.com/zuiko21)
por encontrar el vídeo de "¡Y las bacterias, bonita!".

