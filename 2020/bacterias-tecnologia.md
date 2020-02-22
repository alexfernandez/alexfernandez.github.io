---
title: 'Bacterias (parte 2): Tecnología bacteriana'
subtitle: 'Complemento a la charla para T3chFest 2020'
footer: Publicado el 2020-01-16, modificado el 2020-01-16.
  [¿Comentarios, sugerencias?](mailto:alexfernandeznpm@gmail.com)
---

![Esta proteína tan bonita es en realidad una máquina infernal para inyectar toxinas en una célula. Usada por bacterias que producen, entre otras patologías: cánceres gástricos, la tosferina y la enfermedad del legionario. [Fuente](https://phys.org/news/2019-05-dangerous-pathogens-sophisticated-machinery-infect.html).](pics/bacterias-inyector-toxinas.jpg "Una proteína simulada por ordenador en color falso. Similar a una corona o a un rotor, con múltiples segmentos circulares.")

Como buenos tecnólogos,
la fascinación por estas pequeñas amiguitas sólo puede crecer
al estudiar la sofisticada tecnología que son capaces de desplegar.

# La estructura del ADN

Corría el año 1953.
Varios laboratorios a ambos lados del Atlántico intentaban craquear el código genético.
El ácido desoxirribonucleico (ADN, o DNA en inglés)
era el mayor sospechoso de albergar la información genética de la célula.
Rosalind Franklin, cristalógrafa del King's College,
intentaba dilucidar [la estructura del ADN](https://profiles.nlm.nih.gov/spotlight/kr/feature/dna)
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

El genoma es el conjunto de material genético (ADN o ARN) de un organismo vivo.
Contiene las instrucciones para fabricar todas sus proteínas,
que a su vez serán las encargadas de realizar todas las funciones de cada célula.
El [proceso de transcripción](https://www.nature.com/scitable/topicpage/dna-transcription-426/)
funciona como un ordenador de 6 bits:
cada "palabra" consiste en tres pares de bases que contienen dos bits cada uno,
y se traduce en un aminoácido distinto siguiendo una
[tabla que varía según el tipo de organismo](https://www.ncbi.nlm.nih.gov/Taxonomy/Utils/wprintgc.cgi).
Este "código ensamblador" traduce los 64 posibles valores a 20 aminoácidos + inicio + fin,
con una sofisticada
[corrección de errores](https://life.ibs.re.kr/papers/PhysLifeRev2010.pdf).

![Tabla de transcripción del código genético. Cada par de bases se muestra en un círculo concéntrico, de dentro a fuera, y el aminoácido resultante en el exterior. [Fuente](https://commons.wikimedia.org/wiki/File:Codons_aminoacids_table.png).](pics/bacterias-transcription-table.png "Cada par de bases puede ser A, G, U o C. El primero se muestra en el centro, el siguiente círculo tiene el segundo par, y el tercer par se muestra en el exterior. Así, la secuencia GGG corresponde al aminoácido Gly o glicina. De hecho, cualquier secuencia GG* se transcribe a glicina.")

Cada proteína es una secuencia fija de aminoácidos que se pliega consiguiendo estructuras complejísimas,
que veremos más abajo.
El problema del
[plegamiento de proteínas en 3D](http://cmb.path.uab.edu/pages/documents/papers/Compiani_Biochemistry2013.pdf)
es computacionalmente muy intensivo:
resulta casi imposible predecir la estructura final sin una simulación detalladísima de las fuerzas de cada aminoácido.

Esta introducción es muy somera y no tiene en cuenta factores como
[pseudo-genes](http://downloads.hindawi.com/journals/cfg/2012/424526.pdf)
o
[material no codificante](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2434389/),
sobre cuyas funciones todavía no hay consenso;
ni siquiera sabemos si tienen utilidad o no
(_spoiler alert_: casi seguro que sí).
Más abajo veremos algunos detalles más.

# Memoria

En los ordenadores modernos distinguimos entre memoria de sólo lectura (ROM)
donde suele venir la información escrita de fábrica;
y memoria de acceso aleatorio (RAM), que se usa para escribir datos y puede modificarse.

## Tamaño de ROM

El genoma es en principio memoria de sólo lectura,
y podemos por tanto compararlo con la ROM de un ordenador.
La unidad usada se corresponde con un nucleótido,
pareado siempre con otro en la doble hélice;
de ahí que se midan pares de bases (o "bp" en inglés).

![Estructura de la doble hélice. Adaptado del [original en tamil](https://commons.wikimedia.org/wiki/File:Diagram_showing_a_double_helix_of_a_chromosome_CRUK_065-ta.svg).](pics/bacterias-doble-helice.svg "El ADN es una escalera de caracol, con el exterior formado por grupos fosfato y desoxirribosa. Los peldaños están formados por un par de aminoácidos adenina, guanina, timina y citosina; la citosina se aparea siempre con guanina, y la adenina con timina.")

Los virus tienen un genoma que oscila entre
[1700 pares de bases y 2.8 millones de pares de bases](http://book.bionumbers.org/how-big-are-genomes/).
El rango más habitual es
[entre 4 kbp y 20 kbp](https://www.frontiersin.org/articles/10.3389/fevo.2015.00143/full).
Las bacterias están  en un rango más estrecho;
quitando anomalías como micoplasmas,
sus genomas tienen
[entre 1 y 10 Mbp](https://metode.org/issues/monographs/the-size-of-the-genome-and-the-complexity-of-living-beings.html).

Las eucariotas unicelulares ocupan el siguiente escalón:
[alrededor de 10 Mbp](https://www.researchgate.net/publication/49759737_Chromosome_Size_in_Diploid_Eukaryotic_Species_Centers_on_the_Average_Length_with_a_Conserved_Boundary).
Invertebrados, plantas y mamíferos están
entre 100 Mbp y 10 Gbp,
con
[múltiples anomalías de criaturas con genomas enormes](https://metode.org/issues/monographs/the-size-of-the-genome-and-the-complexity-of-living-beings.html).
Por ejemplo la cebolla común _Allium cepa_ tiene,
por algún motivo,
cinco veces más pares de bases (18 Gbp) que un ser humano (3.2 Gbp).
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

# Memoria interna

En un organismo vivo es necesario primero transcribir el ADN en ARN.
El ARN es por tanto similar a la RAM o memoria de lectura y escritura:
suele hacer de
[mensajero](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3078976/)
y de [regulador de la generación de proteínas](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3132550/).
En las bacterias hay
[unas seis veces más ARN que ADN](http://book.bionumbers.org/what-is-the-macromolecular-composition-of-the-cell/)

La cosa no acaba ahí.
Las bacterias tienen,
igual que las eucariotas,
[memoria epigenética](https://mmbr.asm.org/content/70/3/830):
ciertas condiciones del entorno (encontradas localmente o incluso heredadas)
pueden hacer que se expresen ciertos genes y se supriman otros.
Esto se consigue marcando químicamente partes del genoma (con grupos metilo).

## Memorias externas

Las bacterias pueden también recibir genes externos a través de virus:
los bacteriófagos pueden funcionar
[como reserva de genes](https://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.0040234)
para sus anfitriones bacterianos.
Los fagos "templados" pueden reproducirse
[sin destruir a las bacterias anfitrionas](https://www.nature.com/articles/ismej201716).
Incluso los fagos virulentos
pueden permitir a las bacterias anfitrionas
[reproducirse durante muchas generaciones](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.522.4481&rep=rep1&type=pdf).

En las cianobacterias del mar, por ejemplo,
los cianófagos almacenan genes de fotosíntesis
que pueden aportar a sus víctimas en el momento de infectarlas.
Lo mismo ocurre [en tierra firme](https://www.pnas.org/content/pnas/102/52/19009.full.pdf),
y en las profundidades marinas con
[genes para alimentarse de sulfuros](https://www.researchgate.net/profile/Melissa_Duhaime/publication/262019905_Sulfur_Oxidation_Genes_in_Diverse_Deep-Sea_Viruses/links/0deec53a08f3b471d8000000/Sulfur-Oxidation-Genes-in-Diverse-Deep-Sea-Viruses.pdf).

Estos virus servirían pues como discos duros externos:
se guardan un gen que luego pueden aportar si se deteriora el gen original.
O incluso servir de librería genética en un momento dado.
Podemos imaginar este mecanismo como un tipo de _backup_ en la nube.
Lo que está claro es que hay mucho que investigar en este campo.

## Red de redes

Hablando de la nube,
¿se comunican unas bacterias con otras?
¿Pueden intercambiar genes directamente?

Existen mecanismos como los priones
que permiten compartir estos cambios rápidamente entre una población entera de bacterias.
Se trata de unas proteinas que cambian de forma al entrar en contacto con la forma modificada.
La enfermedad de las vacas locas (encefalopatía espongiforme bovina)
está causada por un prión.
Se puede transmitir poca información de esta forma:
para ser exactos, un bit (prión inactivo -> prión activo).

También hay intercambio directo de genes.
Algo que se conoce desde hace tiempo es la
[conjugación bacteriana](https://onlinelibrary.wiley.com/doi/full/10.1046/j.1365-2958.2002.03014.x):
una bacteria inyecta un trocito de ADN llamado plásmido en otra.

![Diagrama esquemático de la conjugación bacteriana. _Biiij, qué ascazo_. <a href="pics/bacterias-conjugacion.svg" target="_blank">🔍 Ampliar</a>. [Fuente](https://commons.wikimedia.org/wiki/File:Conjugation-es.svg).](pics/bacterias-conjugacion.svg "Conjugación en cuatro fases. 1: la célula donante produce un pilus. 2: el pilus alcanza otra célula, uniéndolas. 3: el plásmido se duplica, y una hebra de ADN se transfiere a la célula receptora. 4: ambas células vuelven a circularizar sus plásmidos, sintetizan una segunda hebra, y reproducen los pelos; ambas células son ahora donantes viables.")

La cosa no queda ahí.
Las bacterias pueden de hecho tomar plásmidos que están sueltos por ahí en el medio,
e integrarlos en su ADN:
es lo que se llama
[transformación genética](http://web.biosci.utexas.edu/psaxena/BIO366/articles/050801DNA%20transformation.pdf).
Si todavía no tienes miedo,
piensa que hay plásmidos en entornos contaminados
que codifican
[resistencia a múltiples antibióticos y a metales pesados](https://mbio.asm.org/content/mbio/5/5/e01918-14.full.pdf).
Las bacterias integran  los plásmidos cuando los necesitan,
y [los pierden](https://pdfs.semanticscholar.org/9947/d4ff6aac909bff725edb06ee231351661980.pdf)
cuando dejan de ser útiles.

La transferencia de genes no sólo ocurre en procariotas.
Si le damos de comer al nematodo _C. elegans_
[un plásmido fluorescente](https://dev.biologists.org/content/develop/124/3/637.full.pdf),
se lo traga y empieza a expresar la proteína.
El resultado es muy bonito y útil a la vez para discriminar cuándo expresa ciertos genes.

![Un ejemplar de _C. elegans_ tuneado posa para nosotros, expresando una variante verde de la molécula fluorescente GFP en su intestino. [Fuente](https://dev.biologists.org/content/develop/124/3/637.full.pdf).](pics/bacterias-c-elegans-plasmid.jpg "Los dos nematodos de arriba expresan el gen de la molécula GFP de formas diferentes: el de la izquierda muestra verde en el intestino, el de la derecha en dos leucocitos en forma de rosco.")

Los genetistas están empezando a darse cuenta de la
[importancia de la transferencia horizontal](https://www.pnas.org/content/96/7/3801https://www.pnas.org/content/96/7/3801)
en la evolución.

![Transferencia horizontal de genes en el árbol de la vida. <a href="pics/bacterias-horizontal-gene-transfer.jpg" target="_blank">🔍 Ampliar</a>. [Fuente](https://commons.wikimedia.org/wiki/File:Horizontal-gene-transfer.jpg).](pics/bacterias-horizontal-gene-transfer.jpg "Se muestra el árbol de bacterias, arqueas y eucariotas, con ciertos eventos de transferencias horizontales. A destacar: integración de mitocondrias en eucariotas, integración de plástidos en plantas, y transferencias entre bacterias y arqueas. Detalle con eventos de transferencias entre bacterias.")

# Limpieza de código

Al igual que en cualquier desarrollo de software,
en el genoma se va acumulando código muerto en forma de
[pseudo-genes](http://downloads.hindawi.com/journals/cfg/2012/424526.pdf):
vestigios de genes que ya no funcionan.
Llega el momento en el que es buena idea reducir el tamaño del código generado.
¿Cómo se hace sin un equipo de desarrolladores a mano?

Puede ser instructivo estudiar
[el genoma de las aves](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4390078/),
que es mucho más reducido que el de mamíferos y reptiles.
Además tiene menos repeticiones y muchas más deleciones
(pérdidas de secuencias de ADN).
Cualquier desarrollador que se precie sabe que el código repetido es la pesadilla del buen profesional del software,
y que se elimina con una buena refactorización.
Así que podemos decir con tranquilidad que el genoma de los pájaros
[está mejor refactorizado](https://bmcevolbiol.biomedcentral.com/articles/10.1186/1471-2148-5-12)
y tiene
[menos código muerto](https://bmcevolbiol.biomedcentral.com/articles/10.1186/1471-2148-4-17)
que el de los mamíferos.
¿Qué guía esta reducción de código?

¿Podría ser una reducción de peso que ayude a volar?
No es descabellado;
al fin y al cabo el genoma representa
[el 1% del peso de una célula en mamíferos](http://manalis-lab.mit.edu/publications/delgado_cermak_PLOS_2013.pdf),
5% si contamos ARN que podemos suponer proporcional.
Un humano adulto de 70 kg lleva encima una mochilita de 3.5 kg de ADN y ARN.
Además esta reducción de genoma se da más a menudo en
[pájaros y murciélagos](https://www.pnas.org/content/114/8/E1460);
y el ave con el genoma más grande es el avestruz,
que casualmente no vuela.

La realidad parece que es
[más complicada](https://royalsocietypublishing.org/doi/pdf/10.1098/rspb.2009.1004):
el tamaño del genoma determina el tamaño de la célula,
y éste a su vez la eficiencia del metabolismo.
Personalmente no descarto que el peso del genoma haya sido también un factor.

En las bacterias es el azar quien guía el proceso,
con ciertas ayudas.
Nuestras amigas tienen una
[fuerte tendencia a eliminar código genético](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1189353/).
Si el resultado es viable,
es probable que en unas cuantas generaciones el genoma se reduzca.
Sería interesante entender por qué es ventajoso para una bacteria reducir su genoma,
aunque nos puede dar una pista pensar que ADN+ARN representan
[el 23% del peso de _E. coli_](http://manalis-lab.mit.edu/publications/delgado_cermak_PLOS_2013.pdf):
una variante con menos genes necesitará menos recursos para reproducirse.

Este proceso puede hacerse manualmente.
Por ejemplo un equipo de científicos consiguió una reducción manual de genoma en _E. coli_:
[de 4.4 Mbp a 4.263 Mbp](https://genome.cshlp.org/content/12/4/640.full).
Pero parece que la evolución es mucho más fina.

Por ejemplo,
[_Mycobacterium leprae_](https://www.sciencedirect.com/science/article/pii/S0092867402006657)
tiene 3.3 Mbp,
mientras que su antecesor _M. tuberculosis_ tiene 4.4 Mbp.
Por el camino _M. leprae_ ha perdido unos 2000 genes;
ahora depende de las células del anfitrión para multitud de funciones vitales.

# Herramientas

Las bacterias usan herramientas muy pequeñitas para conseguir sus fines.
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

En el futuro es posible que podamos usar bacterias como nanobots,
por ejemplo con
[regulación magnética](https://lonelyspore.wordpress.com/2014/07/07/could-magnetic-bacteria-be-the-next-generation-of-microbots/).

## Simplicidad

Los virus son mucho más sencillos que las bacterias:
como hemos visto, por el tamaño de ROM son equivalentes a un ordenador de 8 bits.
Para empezar no se pueden reproducir por sí solos.

También son más fáciles de modelar, claro.
Janet Iwasa ha realizado una
[animación bastante completa](http://scienceofhiv.org/wp/?page_id=20)
de cómo funciona el virus del SIDA:

<iframe class="video" src="https://player.vimeo.com/video/260291607?title=0&byline=0&portrait=0" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>

# Jugando a los dados

¿Qué posibilidades tenemos de defendernos ante estas maquinarias diabólicas?
Nuestra mejor opción parece ser jugar a los dados.

La generación de números aleatorios
[juega un papel muy importante en criptografía](https://hal.inria.fr/hal-00738638/PDF/rr8060.pdf)
y en [otras áreas](https://www.redhat.com/en/blog/understanding-random-number-generators-and-their-limitations-linux).
Hay [múltiples ataques](https://felixdoerre.de/prosem.pdf)
basados en la predictabilidad de los números generados.

Pues bien: nuestro sistema inmune también depende de la generación de números aleatorios.
Las células B son
[un tipo de linfocitos](https://www.aber.ac.uk/~dcswww/ISYS/immune_system.html)
esenciales para el sistema inmune.
Cada célula B se genera aleatoriamente de un
[repertorio de trozos de ADN](https://medicalxpress.com/news/2019-02-mosaic-like-gene-deletion-duplication-pattern.html)
presente en nuestro genoma.

Cuando la célula B se encuentra con un antígeno,
su configuración única de inmunoglobulina
le da una cierta probabilidad de que lo reconozca como patógeno.
Si es así los antígenos llegan a un ganglio linfático,
donde empieza un proceso conocido como
[hipermutación somática](https://pdfs.semanticscholar.org/3299/80555aec1d180c523c5fecd6be92376d42dd.pdf):
las células B se reproducen a toda pastilla,
los genes que generan la inmunoglobulina mutan rápidamente,
y sólo aquellas células que mejor reconozcan el antígeno sobreviven.

<iframe class="video" src="https://www.youtube-nocookie.com/embed/qGsyBwDVnTU?start=90" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Las células B más aptas empiezan a
[generar anticuerpos en el ganglio](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1692737/pdf/10794054.pdf)
como si no hubiera un mañana,
y si el proceso funciona actúan frenando la invasión.
Es un proceso con varias componentes aleatorias que lo hace difícil de predecir,
pero a la vez altamente efectivo.

Lo mejor de todo es que algunas células B ya afinadas quedarán rondando en los ganglios;
ante una nueva invasión del mismo antígeno la respuesta inmune será mucho más rápida,
ya que estas células estarán listas para producir antígenos enseguida.

# Continuará…

Este artículo es la segunda parte de la
[serie sobre bacterias](bacterias-maquinas).
Sigue a la
[parte 3: El largo camino a la simbiosis](bacterias-simbiosis),
donde investigaremos más a fondo sobre el sistema inmune y sus modos de fallo.

* ← Parte 1: [Y las bacterias, bonita](bacterias-bonita).
* ↑ Parte 2: Tecnología bacteriana.
* → Parte 3: [El largo camino a la simbiosis](bacterias-simbiosis).
* → Parte 4: [Enfermedades autoinmunes](bacterias-autoinmunes).
* → Parte 5: [¿Venimos de las estrellas?](bacterias-estrellas)
* → Parte 6: [Conclusiones](bacterias-conclusiones).

