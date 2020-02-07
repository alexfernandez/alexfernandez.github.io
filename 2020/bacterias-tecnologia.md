---
title: 'Bacterias (parte 2): Tecnología bacteriana'
subtitle: 'Complemento a la charla para T3chFest 2020'
footer: Publicado el 2020-01-16, modificado el 2020-01-16.
  [¿Comentarios, sugerencias?](mailto:alexfernandeznpm@gmail.com)
---

![Esta proteína es una máquina infernal para inyectar toxinas en una célula. Usada por bacterias que producen: cánceres gástricos, la tosferina y la enfermedad del legionario. [Fuente](https://phys.org/news/2019-05-dangerous-pathogens-sophisticated-machinery-infect.html).](pics/bacterias-inyector-toxinas.jpg "Una proteína simulada por ordenador en falso color falso. Similar a una corona o a un rotor, con múltiples segmentos circulares.")

Como buenos tecnólogos,
la fascinación por estas pequeñas amiguitas sólo puede crecer
al estudiar la sofisticada tecnología que son capaces de desplegar.

# La estructura del ADN

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
Watson, Crick y Wilkins,
éste último compañero de Franklin, recibieron
[el premio Nobel de medicina en 1962](https://www.nobelprize.org/prizes/medicine/1962/summary/).

![Descubridores de la estructura del ADN: Watson, Crick, Wilkins y Franklin. No por orden de importancia. [Fuente](https://www.researchgate.net/publication/242012620_Ciencia_e_Tecnologia_um_Dialogo_Permanente).](pics/bacterias-watson-crick-wilkins-franklin.jpg "Fotos adjuntas de los cuatro descubridores.")

Esta historia es muy susceptible de interpretarse como la de una mártir feminista heroica,
traicionada por sus colegas sexistas que le robaron el premio Nobel;
de hecho es la idea que yo tenía antes de investigar en más detalle.
Su biógrafa Brenda Maddox
[no está de acuerdo con esta interpretación](https://profiles.nlm.nih.gov/spotlight/kr/feature/biographical),
y cree que debe ponerse más el foco en su brillante carrera científica.
La realidad es que dado que el premio Nobel sólo se concede a personas vivas
(salvo rarísimas excepciones),
no había posibilidad de reconocer el trabajo de Franklin.
Que cada cual saque sus propias conclusiones.
Yo por mi parte tengo claro que Watson y Crick no habrían descubierto nada sin Franklin,
pero Franklin habría llegado a la doble hélice por sí sola.

# Material genético

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

Esta introducción es muy somera y no tiene en cuenta factores como
[pseudo-genes](http://downloads.hindawi.com/journals/cfg/2012/424526.pdf)
o
[material no codificante](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2434389/),
sobre cuyas funciones todavía no hay consenso;
ni siquiera sabemos si tienen utilidad o no.

# Tamaño de ROM

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
entre 100 Mbp y 1 Gbp,
con múltiples anomalías de criaturas con genomas enormes.
Por ejemplo la cebolla común _Allium cepa_ tiene,
por algún motivo,
cinco veces más pares de bases que un ser humano.
Es un ejemplo lo que se conoce como
[enigma de los _C-values_](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4571570/):
no hay una relación estricta entre complejidad de un organismo y el tamaño de su genoma.
Y mejor no hablemos de _Paris japonica_,
una planta con
[150 Gbp](https://academic.oup.com/botlinnean/article/164/1/10/2418538).

Resulta que cada par de bases (bp) son dos bits,
así que un byte serán 4 bp.
Con esta sencilla equivalencia podemos dar un salto conceptual a otra de nuestras áreas favoritas:
los ordenadores personales y de bolsillo,
éstos últimos más conocidos como _smartphones_.
Podemos mirar la memoria que trae escrita de fábrica (ROM),
o si el sistema operativo se carga bajo demanda
buscar el tamaño de la imagen original.
Así podemos comparar la información que llevan de fábrica nuestros dispositivos y los organismos vivos.

![Tamaños de ROM de diversos ordenadores, dispositivos móviles y seres vivos. <a href="pics/bacterias-roms.png" target="_blank">🔍 Ampliar</a>. Fuente: elaboración propia. Datos: [ordenadores](rom-sizes/rom-sizes-computers.csv), [móviles](rom-sizes/rom-sizes-mobile.csv), [seres vivos](rom-sizes/rom-sizes-living.csv).](pics/bacterias-roms.png "En la gráfica se muestran los tamaños de ROM de diversos organismos, y una escala temporal de ROMs en ordenadores y dispositivos móviles.")

Un virus tiene la misma ROM que un ZX Spectrum.
Una bacteria contiene la información equivalente a una PDA Psion Siena.
La levadura de panadero equivale a una Palm Tugsten T.
Por su parte, las eucariotas van de un Windows 95 a un Windows Vista, o bien de un Nokia 7650 a una Android 10.
El ser humano tiene algo más de información que un CD-Rom,
y por lo tanto que la distribución de Knoppix en CD;
y algo menos que un móvil con Android 8.
No tenemos en cuenta todavía programas y aplicaciones.

# Memoria

Las bacterias tienen,
igual que las eucariotas,
[memoria epigenética](https://mmbr.asm.org/content/70/3/830):
ciertas condiciones del entorno (encontradas localmente o incluso heredadas)
pueden hacer que se expresen ciertos genes y se supriman otros.

Existen mecanismos como los priones
que permiten compartir estos cambios entre una población entera de bacterias.

https://en.wikipedia.org/wiki/Bacterial_genome#Horizontal_gene_transfer

https://en.wikipedia.org/wiki/Bacterial_conjugation

https://en.wikipedia.org/wiki/Plasmid

Otra forma interesante de recibir genes externos es a través de virus:
los bacteriófagos pueden funcionar
[como reserva de genes](https://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.0040234)
para sus anfitriones bacterianos.
En las cianobacterias del mar, por ejemplo,
los cianófagos almacenan genes de fotosíntesis
que pueden aportar a sus víctimas en lugar de infectarlas.
Lo mismo ocurre [en tierra firme](https://www.pnas.org/content/pnas/102/52/19009.full.pdf).
Estos virus servirían pues como discos duros externos,
o incluso como almacenamiento en la nube.

# Refactorización

[reducción de genoma](https://en.wikipedia.org/wiki/Bacterial_genome#Genomic_reduction).
[en pájaros](https://en.wikipedia.org/wiki/Genomic_evolution_of_birds).

Por ejemplo,
[_Mycobacterium leprae_](https://en.wikipedia.org/wiki/Mycobacterium_leprae)
tiene 3.27 Mbp,
mientras que su antecesor _M. tuberculosis_ tiene 4.42 Mbp.
Por el camino _M. leprae_ ha perdido unos 1200 genes;
ahora depende de las células del anfitrión para multitud de funciones vitales.

Reducción manual de genoma:
[de 4.4 Mbp a 4.263 Mbp](https://genome.cshlp.org/content/12/4/640.full).

# Herramientas

Este vídeo muestra cómo funciona un pelo de bacteria:
extensión y retractación rápidas que le permiten moverse.

<iframe class="video" src="https://www.youtube-nocookie.com/embed/HGvnrWrudpA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

La generación de energía se realiza en la ATP sintasa,
una especie de motor que funciona con una eficiencia
[cercana al 100%](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1692765/pdf/10836501.pdf),
impensable para
[motores industriales](https://www.electricmotorengineering.com/high-efficiency-motors-and-sustainability/):

<iframe class="video" src="https://www.youtube-nocookie.com/embed/XI8m6o0gXDY?start=52" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Las kinesinas son unas maquinitas moleculares que sacan los desperdicios de la célula usando ATP como combustible.
Caminan por los microtúbulos,
una especie de autopistas celulares exclusivas de las eucariotas,
aunque en 2011 se descubrió [el equivalente bacteriano](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3232192/).

<iframe class="video" src="https://www.youtube-nocookie.com/embed/wJyUtbn0O5Y?start=60" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

# Complejidad

¿Cómo se comparan en complejidad las procariotas con otros organismos?

## Simplicidad

En línea con el tamaño de ROM
(equivalente, como vimos, a un ordenador de 8 bits),
los virus son mucho más sencillos que las bacterias:
no se pueden reproducir por sí solos.

En modelos más sencillos,
como el virus del SIDA,
Janet Iwasa ha realizado una
[animación más completa](http://scienceofhiv.org/wp/?page_id=20)
de cómo funcionan:

<iframe class="video" src="https://player.vimeo.com/video/260291607?title=0&byline=0&portrait=0" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>

## Generación de energía

¿Cómo es la cadena de generación de energía
(en forma de moléculas de ATP) en distintos organismos?
Vamos a ver el proceso más sencillo que es partir de una molécula de glucosa.

Los mamíferos tenemos una cadena de generación mucho más compleja:
por cada molécula de glucosa
[podemos generar unas 30 moléculas de ATP](https://www.researchgate.net/profile/Peter_Rich3/publication/8988933_The_molecular_machinery_of_Keilin's_respiratory_chain/links/00b7d51af382ad9dfd000000.pdf).
La cadena es sumamente compleja.

![Respiración celular. Se muestra la respiración anaeróbica (fermentación) que es menos eficiente, y también la respiración aeróbica que genera 30 ATPs, según estimaciones recientes. <a href="pics/bacterias-cellular-respiration.gif" target="_blank">🔍 Ampliar</a>. [Fuente](https://en.wikipedia.org/wiki/File:Cellular_respiration.gif).](pics/bacterias-cellular-respiration.gif "La fermentación genera sólo dos ATPs, mientras que en el proceso aeróbico la cadena es mucho más compleja.")

En las bacterias hay
[múltiples caminos de generación](https://www.ncbi.nlm.nih.gov/books/NBK7919/).
Por ejemplo _E. coli_ puede llegar a un máximo de
[unas 18 moléculas de ATP](https://deepblue.lib.umich.edu/bitstream/handle/2027.42/30386/0000004.pdf?sequence=1).
En general los mecanismos son más sencillos,
pero mucho más variados.

## Jugando a los dados

¿Qué posibilidades tenemos de defendernos ante estas maquinarias diabólicas?
Nuestra mejor opción parece ser jugar a los dados.

La generación de números aleatorios
[juega un papel muy importante en criptografía](https://hal.inria.fr/hal-00738638/PDF/rr8060.pdf)
y en [otras áreas](https://www.redhat.com/en/blog/understanding-random-number-generators-and-their-limitations-linux).
Hay [múltiples ataques](https://felixdoerre.de/prosem.pdf)
basados en la predictabilidad de los números generados.

Pues bien: nuestro sistema inmune también depende de la generación de números aleatorios.

[Introducción al sistema inmune](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5091071/).

Human attacks: random generation -> rapid mutation in the immune system

[células T y B](https://www.aber.ac.uk/~dcswww/ISYS/immune_system.html).
Cada célula B se genera aleatoriamente de un
[repertorio de trozos de ADN](https://medicalxpress.com/news/2019-02-mosaic-like-gene-deletion-duplication-pattern.html)
presente en nuestro genoma.

<iframe class="video" src="https://www.youtube-nocookie.com/embed/wTN7AP1WTUI?start=120" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

# Continuará…

Este artículo es la segunda parte de la
[serie sobre bacterias](bacterias-maquinas.html).
Sigue a la
[parte 3: El largo camino a la simbiosis](bacterias-simbiosis.html),
donde investigaremos más a fondo sobre el sistema inmune y sus modos de fallo.

* ← Parte 1: [Y las bacterias, bonita](bacterias-bonita.html).
* ↑ Parte 2: Tecnología bacteriana.
* → Parte 3: [El largo camino a la simbiosis](bacterias-simbiosis.html).
* → Parte 4: [Enfermedades autoinmunes](bacterias-enfermedades-autoinmunes.html).
* → Parte 5: [¿Venimos de las estrellas?](bacterias-venimos-de-estrellas.html)

